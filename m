Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.11816.1594608982715411052
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 19:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IT2HmjA/;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id q17so5372320pfu.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2020 19:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=KMgflXZwwjTIq9dqoOjX5sCCrh2nkfV/ooIa+w1DfTc=;
        b=IT2HmjA/OyBTwiHEY63c91TFwgeDq6gCREWi2dEQOalEktUdsF/aWsxoM6wjWx23LZ
         U/pNzJ8wUptbjm3ZrLVvPYC65OEtun+MPrWrVNB399dZq1f9lP1v8/3OU7ehNk765eAD
         0TbebYom1R+kk0alE2aJ3+SdRGrggpFBdal+CwYX5VYtVYGsqhfOwK7o6zWQGML3oXUa
         x/+1ttn8TpLiYlKoGK8C9zrc0RyNX2POdigs4USYnBncPeTJjBM2ahURZakv63IqmivW
         +VWSUDh8F0qOtKzAJIoLO9L81UQLH0DzZl5/jUOkCpCHyynNrDQNWjLOlWoeykXQTbvH
         25AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=KMgflXZwwjTIq9dqoOjX5sCCrh2nkfV/ooIa+w1DfTc=;
        b=j7ngXLCV7oBn0zuA3junuTyq/lP59bB7xEC0E5etaX866rCVA/L3TGFQwCBqVYSQLB
         8ac5oxDhwk2VvOPEZXT8F2uq7aoN7K7tijt313V3gI5SD0xEcABnoWSsjAJXLGPJY0jL
         dGDxdYKiIA5xfNMtmqBcfB6bW+5t7T8x9D7P0kw0r1NRJlxbD6PIdbvU6SUssRVoMlOi
         IyWqZdPfmxAf6G1uUdqlO0LIYKZDiJ0RA0h0L5KQ+nITQZZqQ0bBOoRa03tqn2zqhrO3
         4hs2Gou7rZ3L8VUNyHCeDrVa5mtCJskyjsHo4IZIbA67weX7xFMseNlLZ7GDnDqpjXuf
         S3BA==
X-Gm-Message-State: AOAM531rBXdiQ5Mx8kyQRXfIui+yH+/XBQKIN8ZeLTnoLsb9GnlpM/hd
	SJvHa7Tzg9DAMZSV8nrawNrBHohKsIA=
X-Google-Smtp-Source: ABdhPJyUBa2YALhQj0YWZwKtX5kj1EUHpJrnhPDBwtjIac3V1AFHhfxVQaq8MrweeRyPY686sSdE8w==
X-Received: by 2002:a63:441c:: with SMTP id r28mr65992439pga.372.1594608981876;
        Sun, 12 Jul 2020 19:56:21 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e013:ddd8:d9b9:dad6])
        by smtp.gmail.com with ESMTPSA id u19sm13687976pfk.98.2020.07.12.19.56.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 19:56:21 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 04/18] net-snmp: Security fix CVE-2019-20892
Date: Sun, 12 Jul 2020 19:56:00 -0700
Message-Id: <b2acef67030e2586297690379ec91550ac76f19d.1594608813.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594608813.git.akuster808@gmail.com>
References: <cover.1594608813.git.akuster808@gmail.com>

From: Armin Kuster <akuster@mvista.com>

Source: net-snmp.org
MR: 104509
Type: Security Fix
Disposition: Backport from https://github.com/net-snmp/net-snmp/commit/5f881d3bf24599b90d67a45cae7a3eb099cd71c9
ChangeID: 206d822029d48d904864f23fd1b1af69dffc26c8
Description:

Fixes CVE-2019-20892 which affect net-snmp <= 5.8pre1

Had to fix up some file do to later code restructioning.
"int             refcnt;" addition was done in include/net-snmp/library/snmpusm.h

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 96a63b1ecf321c9a63880a963ed257086998133b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../net-snmp/net-snmp/CVE-2019-20892.patch    | 118 ++++++++++++++++++
 .../net-snmp/net-snmp_5.8.bb                  |   1 +
 2 files changed, 119 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch
new file mode 100644
index 0000000000..3e2637eaa5
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch
@@ -0,0 +1,118 @@
+From 5f881d3bf24599b90d67a45cae7a3eb099cd71c9 Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Sat, 27 Jul 2019 19:34:09 -0700
+Subject: [PATCH] libsnmp, USM: Introduce a reference count in struct
+ usmStateReference
+
+This patch fixes https://sourceforge.net/p/net-snmp/bugs/2956/.
+
+Upstream-Status: Backport
+[ak: fixup for 5.8 context, changes to library/snmpusm.h]
+CVE:CVE-2019-20892
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ snmplib/snmp_client.c | 22 +++----------
+ snmplib/snmpusm.c     | 73 ++++++++++++++++++++++++++++---------------
+ 2 files changed, 53 insertions(+), 42 deletions(-)
+
+Index: net-snmp-5.8/snmplib/snmpusm.c
+===================================================================
+--- net-snmp-5.8.orig/snmplib/snmpusm.c
++++ net-snmp-5.8/snmplib/snmpusm.c
+@@ -285,12 +285,35 @@ free_enginetime_on_shutdown(int majorid,
+ struct usmStateReference *
+ usm_malloc_usmStateReference(void)
+ {
+-    struct usmStateReference *retval = (struct usmStateReference *)
+-        calloc(1, sizeof(struct usmStateReference));
++   struct usmStateReference *retval;
+ 
++    retval = calloc(1, sizeof(struct usmStateReference));
++    if (retval)
++        retval->refcnt = 1;
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
+@@ -3345,6 +3368,7 @@ init_usm(void)
+     def->encode_reverse = usm_secmod_rgenerate_out_msg;
+     def->encode_forward = usm_secmod_generate_out_msg;
+     def->decode = usm_secmod_process_in_msg;
++    def->pdu_clone = usm_clone;
+     def->pdu_free_state_ref = usm_free_usmStateReference;
+     def->session_setup = usm_session_init;
+     def->handle_report = usm_handle_report;
+Index: net-snmp-5.8/snmplib/snmp_client.c
+===================================================================
+--- net-snmp-5.8.orig/snmplib/snmp_client.c
++++ net-snmp-5.8/snmplib/snmp_client.c
+@@ -402,27 +402,15 @@ _clone_pdu_header(netsnmp_pdu *pdu)
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
+-
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
+Index: net-snmp-5.8/include/net-snmp/library/snmpusm.h
+===================================================================
+--- net-snmp-5.8.orig/include/net-snmp/library/snmpusm.h
++++ net-snmp-5.8/include/net-snmp/library/snmpusm.h
+@@ -43,6 +43,7 @@ extern          "C" {
+      * Structures.
+      */
+     struct usmStateReference {
++        int             refcnt;
+         char           *usr_name;
+         size_t          usr_name_length;
+         u_char         *usr_engine_id;
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index 5466649a82..67316db0d2 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -28,6 +28,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://reproducibility-accept-configure-options-from-env.patch \
            file://0001-net-snmp-fix-compile-error-disable-des.patch \
            file://0001-Add-pkg-config-support-for-building-applications-and.patch \
+           file://CVE-2019-20892.patch \
            "
 SRC_URI[md5sum] = "63bfc65fbb86cdb616598df1aff6458a"
 SRC_URI[sha256sum] = "b2fc3500840ebe532734c4786b0da4ef0a5f67e51ef4c86b3345d697e4976adf"
-- 
2.17.1

