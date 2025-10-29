Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1615FCCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 23:05:52 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web01.16209.1761779144459617048
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 16:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Tl43nlF3;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202510292305385d8ce91635000207d1-eujxi_@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202510292305385d8ce91635000207d1
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 30 Oct 2025 00:05:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=6UkyyNFoXKat+g5GY4cdgX9mrZZskkP+Ib0qxwJlXTk=;
 b=Tl43nlF30dmIAWDOkk4fYpUj26GTL0AFlOYM0zhlO/o1z+s8/EyrKLOR+EMoPTk9ryOEm6
 iA1oQlul8RciEt5UgHHHkW7NdNzJNRjoCJgZAX7/sIP9SFUTk04Y03iHLK6OQ6niv6QGg5+E
 o8Gpd1bANZ1TlUnmY6D1KEfip4m2u0y0zVKDuObNDxhkWoFL1qXI+Ys3jsw+9vcI1fzfgRNC
 uRsSURBqax+VSw7ypW4xgffGoatv5yygZGE4oCy1BsPP2RxLB/mhflyBgkGuaiB5iqJNbrYH
 JWUOYF/TwsvWK4CMx+izUkSe1HcET5sgf+/JqBXwadrcMBE3GYMUwcOg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH] squid: upgrade 7.1 -> 7.2
Date: Thu, 30 Oct 2025 00:05:24 +0100
Message-Id: <20251029230524.2941651-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 23:05:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121173

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2025-62168.

Remove CVE patch included in this release.
Refresh remaining patches.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../squid/files/CVE-2025-59362.patch          | 52 -------------------
 .../files/Skip-AC_RUN_IFELSE-tests.patch      |  4 +-
 .../squid/{squid_7.1.bb => squid_7.2.bb}      |  3 +-
 3 files changed, 3 insertions(+), 56 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2025-59362.patch
 rename meta-networking/recipes-daemons/squid/{squid_7.1.bb => squid_7.2.bb} (97%)

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2025-59362.patch b/meta-networking/recipes-daemons/squid/files/CVE-2025-59362.patch
deleted file mode 100644
index 26a3896625..0000000000
--- a/meta-networking/recipes-daemons/squid/files/CVE-2025-59362.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 0d89165ee6da10e6fa50c44998b3cd16d59400e9 Mon Sep 17 00:00:00 2001
-From: Alex Rousskov <rousskov@measurement-factory.com>
-Date: Sat, 30 Aug 2025 06:49:36 +0000
-Subject: [PATCH] Fix ASN.1 encoding of long SNMP OIDs (#2149)
-
-CVE: CVE-2025-59362
-Upstream-Status: Backport [https://github.com/squid-cache/squid/commit/0d89165ee6da10e6fa50c44998b3cd16d59400e9]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- lib/snmplib/asn1.c | 13 +++++++++++++
- 1 file changed, 13 insertions(+)
-
-diff --git a/lib/snmplib/asn1.c b/lib/snmplib/asn1.c
-index 81f2051fb..2852c26b2 100644
---- a/lib/snmplib/asn1.c
-+++ b/lib/snmplib/asn1.c
-@@ -735,6 +735,7 @@ asn_build_objid(u_char * data, int *datalength,
-      * lastbyte ::= 0 7bitvalue
-      */
-     u_char buf[MAX_OID_LEN];
-+    u_char *bufEnd = buf + sizeof(buf);
-     u_char *bp = buf;
-     oid *op = objid;
-     int asnlength;
-@@ -753,6 +754,10 @@ asn_build_objid(u_char * data, int *datalength,
-     while (objidlength-- > 0) {
-         subid = *op++;
-         if (subid < 127) {  /* off by one? */
-+            if (bp >= bufEnd) {
-+                snmp_set_api_error(SNMPERR_ASN_ENCODE);
-+                return (NULL);
-+            }
-             *bp++ = subid;
-         } else {
-             mask = 0x7F;    /* handle subid == 0 case */
-@@ -770,8 +775,16 @@ asn_build_objid(u_char * data, int *datalength,
-                 /* fix a mask that got truncated above */
-                 if (mask == 0x1E00000)
-                     mask = 0xFE00000;
-+                if (bp >= bufEnd) {
-+                    snmp_set_api_error(SNMPERR_ASN_ENCODE);
-+                    return (NULL);
-+                }
-                 *bp++ = (u_char) (((subid & mask) >> bits) | ASN_BIT8);
-             }
-+            if (bp >= bufEnd) {
-+                snmp_set_api_error(SNMPERR_ASN_ENCODE);
-+                return (NULL);
-+            }
-             *bp++ = (u_char) (subid & mask);
-         }
-     }
diff --git a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
index 8522a299c1..3aa08f84da 100644
--- a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
+++ b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
@@ -41,7 +41,7 @@ diff --git a/acinclude/lib-checks.m4 b/acinclude/lib-checks.m4
 index 9793b9a..4f2dc83 100644
 --- a/acinclude/lib-checks.m4
 +++ b/acinclude/lib-checks.m4
-@@ -205,7 +205,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_CONST_SSL_METHOD],[
+@@ -207,7 +207,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_CONST_SSL_METHOD],[
    [
     AC_MSG_RESULT([no])
    ],
@@ -52,7 +52,7 @@ index 9793b9a..4f2dc83 100644
  
  SQUID_STATE_ROLLBACK(check_const_SSL_METHOD)
  ])
-@@ -347,7 +349,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_TXTDB],[
+@@ -349,7 +351,9 @@ AC_DEFUN([SQUID_CHECK_OPENSSL_TXTDB],[
    ],[
      AC_MSG_RESULT([yes])
      AC_DEFINE(SQUID_USE_SSLLHASH_HACK, 1)
diff --git a/meta-networking/recipes-daemons/squid/squid_7.1.bb b/meta-networking/recipes-daemons/squid/squid_7.2.bb
similarity index 97%
rename from meta-networking/recipes-daemons/squid/squid_7.1.bb
rename to meta-networking/recipes-daemons/squid/squid_7.2.bb
index bba26cc5fa..0891d2208d 100644
--- a/meta-networking/recipes-daemons/squid/squid_7.1.bb
+++ b/meta-networking/recipes-daemons/squid/squid_7.2.bb
@@ -20,10 +20,9 @@ SRC_URI = "https://github.com/squid-cache/${BPN}/releases/download/SQUID_${PV_U}
            file://0002-squid-make-squid-conf-tests-run-on-target-device.patch \
            file://0001-libltdl-remove-reference-to-nonexisting-directory.patch \
            file://squid.nm \
-           file://CVE-2025-59362.patch \
            "
 
-SRC_URI[sha256sum] = "763b5a78561cedc4e47634fa42b8e6b8d46c87c949a151b4e7ac2396d2f97dea"
+SRC_URI[sha256sum] = "5e077be1d83a9e696ce8d0d9e723b1273152207a091404be68a4b9a9e18c7003"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://errors/COPYRIGHT;md5=c2a0e15750d3a9743af9109fecc05622 \

