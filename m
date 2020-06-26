Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.320.1593213253247571455
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 16:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t1q74ayV;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id 35so4845176ple.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2020 16:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=AofKM2atRkKIy9lr4rCWE0XLPxtSBJ1QYmsyJySgbtY=;
        b=t1q74ayVX2XLcIAOwl9qX0iygrD2/ErWc1+Vbdv1Bb/BLgeq5rm8sQhQOcMbzz6IXd
         JflCpcEa9TVzQfK2ZDnm2jXbD5ck2D25MKp0Z+syCi4UVDV/gdw5bHiRwPi5i9twQQOs
         nPXTos9vZ8Nwmkbhna/lGOXNFyw4kBYOhKbccy1Dc2tRR7U/0PsSRfGAvUfBE6OsHz3C
         D0vBpj6B/qhL+1/nfu1SqUY89KNxvHQwFBQ2FnzwvgD7iptHz4KLsjCR96yuJZCIJe6i
         gaAgAMM4foQkS5c4J1QGaTBlOiTn/ig5hqFQmYpiawo8fV58qrqgQG4AZt8oH63pSSFh
         XCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=AofKM2atRkKIy9lr4rCWE0XLPxtSBJ1QYmsyJySgbtY=;
        b=ezNFjYYhGo/ocsA6PP5N+XCYCAaegithMc84JmD9zo5CzHGQ2rvCx4GAGvkf0XUQHi
         ohJjvCDPhiZn8f44XEY+E0N5sm7vKsr218RpQMoNO9upcLSE/IlYvcr0GQY8uO4T+70F
         0spWrjgatV8IUbmNiBDmnRtz+0uZdcKSmtrYYdpNkHCtq5bf4JnAwEPKs28GRdnHEg+Z
         bamiHMlXQUObonnlvH7IUkzJl8hXsHhLGUaNhAoE8T3DCK9oTWe0MtxUzL6iY3WUYEmo
         HS+ixiY3i2BUtDnZEd6WUlTWYa7sP/rI7zJ9jk6WlYnQrNNK9AjmzauZVO6yyb1iS5gA
         w23g==
X-Gm-Message-State: AOAM531/TA6JDWM1hNoV7R/L+rNFBNgsiVhGPP9KMeaCK7zyCBt0em8N
	/82EjH34x/J0jGKBEVCjO0yDoC+f
X-Google-Smtp-Source: ABdhPJw9y0nKOzWjaIPZ7YsSQPm+H8zPTiPPUvTz3R7WYnpvt2wn7Ibj02S1nY8+WmPh9WdhiLrD4w==
X-Received: by 2002:a17:902:6b8c:: with SMTP id p12mr4588791plk.256.1593213252420;
        Fri, 26 Jun 2020 16:14:12 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:5dd6:9daa:53f4:d130])
        by smtp.gmail.com with ESMTPSA id s30sm23670449pgn.34.2020.06.26.16.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 16:14:11 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-networking][PATCH] net-snmp: Security fix CVE-2019-20892
Date: Fri, 26 Jun 2020 16:14:10 -0700
Message-Id: <20200626231410.9012-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

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

