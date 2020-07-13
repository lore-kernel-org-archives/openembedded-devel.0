Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.16236.1594634731519739517
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jul 2020 03:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: wenlin.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 06DA5T64012784
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2020 03:05:30 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Mon, 13 Jul 2020
 03:05:29 -0700
From: "wenlin.kang@windriver.com" <wenlin.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-networking][PATCH] net-snmp: Fix CVE-2019-20892
Date: Mon, 13 Jul 2020 03:05:29 -0700
Message-ID: <20200713100529.87717-1-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Fix CVE-2019-20892

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 ...oduce-a-reference-count-in-struct-us.patch | 166 ++++++++++++++++++
 .../net-snmp/net-snmp_5.8.bb                  |   1 +
 2 files changed, 167 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-libsnmp-USM-Introduce-a-reference-count-in-struct-us.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-libsnmp-USM-Introduce-a-reference-count-in-struct-us.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-libsnmp-USM-Introduce-a-reference-count-in-struct-us.patch
new file mode 100644
index 000000000..99f02adb7
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-libsnmp-USM-Introduce-a-reference-count-in-struct-us.patch
@@ -0,0 +1,166 @@
+From 76819d992fdd88e3beb08b79851c6c129da7bc7e Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Fri, 10 Jul 2020 10:48:41 +0800
+Subject: [PATCH] libsnmp, USM: Introduce a reference count in struct
+ usmStateReference
+
+This patch fixes https://sourceforge.net/p/net-snmp/bugs/2956/.
+
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/5f881d3bf24599b90d67a45cae7a3eb099cd71c9]
+CVE: CVE-2019-20892
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ include/net-snmp/library/snmpusm.h |  1 +
+ snmplib/snmp_client.c              | 21 +++-------
+ snmplib/snmpusm.c                  | 65 +++++++++++++++++++++---------
+ 3 files changed, 51 insertions(+), 36 deletions(-)
+
+diff --git a/include/net-snmp/library/snmpusm.h b/include/net-snmp/library/snmpusm.h
+index 3f60787..87b31f3 100644
+--- a/include/net-snmp/library/snmpusm.h
++++ b/include/net-snmp/library/snmpusm.h
+@@ -43,6 +43,7 @@ extern          "C" {
+      * Structures.
+      */
+     struct usmStateReference {
++        int             refcnt;
+         char           *usr_name;
+         size_t          usr_name_length;
+         u_char         *usr_engine_id;
+diff --git a/snmplib/snmp_client.c b/snmplib/snmp_client.c
+index 2a46351..b2ea891 100644
+--- a/snmplib/snmp_client.c
++++ b/snmplib/snmp_client.c
+@@ -402,27 +402,16 @@ _clone_pdu_header(netsnmp_pdu *pdu)
+         return NULL;
+     }
+ 
+-    if (pdu->securityStateRef &&
+-        pdu->command == SNMP_MSG_TRAP2) {
+-
+-        ret = usm_clone_usmStateReference((struct usmStateReference *) pdu->securityStateRef,
+-                (struct usmStateReference **) &newpdu->securityStateRef );
+-
+-        if (ret)
+-        {
++    sptr = find_sec_mod(newpdu->securityModel);
++    if (sptr && sptr->pdu_clone) {
++        /* call security model if it needs to know about this */
++        ret = sptr->pdu_clone(pdu, newpdu);
++        if (ret) {
+             snmp_free_pdu(newpdu);
+             return NULL;
+         }
+     }
+ 
+-    if ((sptr = find_sec_mod(newpdu->securityModel)) != NULL &&
+-        sptr->pdu_clone != NULL) {
+-        /*
+-         * call security model if it needs to know about this 
+-         */
+-        (*sptr->pdu_clone) (pdu, newpdu);
+-    }
+-
+     return newpdu;
+ }
+ 
+diff --git a/snmplib/snmpusm.c b/snmplib/snmpusm.c
+index 3cfa126..4d8edad 100644
+--- a/snmplib/snmpusm.c
++++ b/snmplib/snmpusm.c
+@@ -285,39 +285,63 @@ free_enginetime_on_shutdown(int majorid, int minorid, void *serverarg,
+ struct usmStateReference *
+ usm_malloc_usmStateReference(void)
+ {
+-    struct usmStateReference *retval = (struct usmStateReference *)
+-        calloc(1, sizeof(struct usmStateReference));
++    struct usmStateReference *retval;
++
++    retval = calloc(1, sizeof(struct usmStateReference));
++    if (retval)
++        retval->refcnt = 1;
+ 
+     return retval;
+ }                               /* end usm_malloc_usmStateReference() */
+ 
++static int
++usm_clone(netsnmp_pdu *pdu, netsnmp_pdu *new_pdu)
++{
++    struct usmStateReference *ref = pdu->securityStateRef;
++    struct usmStateReference **new_ref =
++        (struct usmStateReference **)&new_pdu->securityStateRef;
++    int ret = 0;
++
++    if (!ref)
++        return ret;
++
++    if (pdu->command == SNMP_MSG_TRAP2) {
++        netsnmp_assert(pdu->securityModel == SNMP_DEFAULT_SECMODEL);
++        ret = usm_clone_usmStateReference(ref, new_ref);
++    } else {
++        netsnmp_assert(ref == *new_ref);
++        ref->refcnt++;
++    }
++
++    return ret;
++}
+ 
+ void
+ usm_free_usmStateReference(void *old)
+ {
+-    struct usmStateReference *old_ref = (struct usmStateReference *) old;
+-
+-    if (old_ref) {
++    struct usmStateReference *ref = old;
+ 
+-        SNMP_FREE(old_ref->usr_name);
+-        SNMP_FREE(old_ref->usr_engine_id);
+-        SNMP_FREE(old_ref->usr_auth_protocol);
+-        SNMP_FREE(old_ref->usr_priv_protocol);
+-
+-        if (old_ref->usr_auth_key) {
+-            SNMP_ZERO(old_ref->usr_auth_key, old_ref->usr_auth_key_length);
+-            SNMP_FREE(old_ref->usr_auth_key);
+-        }
+-        if (old_ref->usr_priv_key) {
+-            SNMP_ZERO(old_ref->usr_priv_key, old_ref->usr_priv_key_length);
+-            SNMP_FREE(old_ref->usr_priv_key);
+-        }
++    if (!ref)
++        return;
+ 
+-        SNMP_ZERO(old_ref, sizeof(*old_ref));
+-        SNMP_FREE(old_ref);
++    if (--ref->refcnt > 0)
++        return;
+ 
++    SNMP_FREE(ref->usr_name);
++    SNMP_FREE(ref->usr_engine_id);
++    SNMP_FREE(ref->usr_auth_protocol);
++    SNMP_FREE(ref->usr_priv_protocol);
++ 
++    if (ref->usr_auth_key_length && ref->usr_auth_key) {
++        SNMP_ZERO(ref->usr_auth_key, ref->usr_auth_key_length);
++        SNMP_FREE(ref->usr_auth_key);
++    }
++    if (ref->usr_priv_key_length && ref->usr_priv_key) {
++        SNMP_ZERO(ref->usr_priv_key, ref->usr_priv_key_length);
++        SNMP_FREE(ref->usr_priv_key);
+     }
+ 
++    SNMP_FREE(ref);
+ }                               /* end usm_free_usmStateReference() */
+ 
+ struct usmUser *
+@@ -3345,6 +3369,7 @@ init_usm(void)
+     def->encode_reverse = usm_secmod_rgenerate_out_msg;
+     def->encode_forward = usm_secmod_generate_out_msg;
+     def->decode = usm_secmod_process_in_msg;
++    def->pdu_clone = usm_clone;
+     def->pdu_free_state_ref = usm_free_usmStateReference;
+     def->session_setup = usm_session_init;
+     def->handle_report = usm_handle_report;
+-- 
+2.18.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index 192b6b506..c23dcd3cf 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -27,6 +27,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://reproducibility-have-printcap.patch \
            file://reproducibility-accept-configure-options-from-env.patch \
            file://0001-net-snmp-fix-compile-error-disable-des.patch \
+           file://0001-libsnmp-USM-Introduce-a-reference-count-in-struct-us.patch \
            "
 SRC_URI[md5sum] = "63bfc65fbb86cdb616598df1aff6458a"
 SRC_URI[sha256sum] = "b2fc3500840ebe532734c4786b0da4ef0a5f67e51ef4c86b3345d697e4976adf"
-- 
2.17.1

