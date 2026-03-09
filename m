Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFA3EFCD88
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:06:43 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10763.1773050801687455847
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=KEKMaPp2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1334352-202603091006392e9184e8a300020739-29fbe5@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202603091006392e9184e8a300020739
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 09 Mar 2026 11:06:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=eFCF0QGFMOS79px4Ozeg0Ub1CncLSSN4uzJeDeistFE=;
 b=KEKMaPp2a7p0Qlzik0aTvoUmeGTJrO2hx9EV2LFHW44kRti3cXW3HXVQ1O6svsfPzZKB0M
 /dicB8RiVxyTOQGthntJ2AkTTgfh9nGRCDS8r3NS6YF9BDBhKwY2Oe7b1qVaDCSqnGGIMDtZ
 0ZSQp2OYA/TRq7FbhKvVwujxkHCgncHmTWk3zfdsiQG9uviqNojtPW0ig/qi12fkrKqXWOj+
 Q75RVdOon3faYU/xUeQW0C1m63/Pdne1w5kdIn/6xd/wd4xMos561s7zn/fGlLjmOtrSq2z9
 N/Uhip8fub1DiG0L0ccQXLueS6iGH9xTVXcnLKVHUu9ZfTLJ6yiLwVHA==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][PATCH 12/14] squid: upgrade 7.3 -> 7.4
Date: Mon,  9 Mar 2026 11:06:28 +0100
Message-ID: <20260309100630.404637-12-andrej.kozemcak@siemens.com>
In-Reply-To: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
References: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 10:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124986

License-Update: update GPLv2 COPYING document
  Some terminology and FSF address changes since the GPLv2
  https://github.com/squid-cache/squid/commit/4c5fbc7e8db25352722de4ebe7fe1cab904b62b6

Remove lines from patch, which modify not exist code.

Changelog:
  https://github.com/squid-cache/squid/releases/tag/SQUID_7_4

Changes:
- Do not create world-readable directories
- digest_edirectory_auth: Fix LDAPS memory leaks
- snmplib: Improve handling of zero-length ASN OCTET STRINGs
- Debug tls_read_method()/tls_write_method() errors
- ICMP: Harden echo paths, fix overflows, UB, and leaks
- Set SSL_OP_LEGACY_SERVER_CONNECT when peeking at servers
- security_file_certgen: Fix OPENSSL_malloc()/free(3) mismatch
- Detect FreeBSD ports Heimdal package
- Remove SQUID_CHECK_KRB5_HEIMDAL_BROKEN_KRB5_H macro
- Remove SQUID_CHECK_KRB5_SOLARIS_BROKEN_KRB5_H macro
- ext_kerberos_ldap_group_acl: Do not prohibit all LDFLAGS
- negotiate_sspi_auth: Respond with ERR when FormatMessage() fails
- ... and some code cleanups
- ... and some CI improvements

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 .../files/Skip-AC_RUN_IFELSE-tests.patch      | 22 -------------------
 .../squid/{squid_7.3.bb => squid_7.4.bb}      |  4 ++--
 2 files changed, 2 insertions(+), 24 deletions(-)
 rename meta-networking/recipes-daemons/squid/{squid_7.3.bb => squid_7.4.bb} (97%)

diff --git a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
index 3aa08f84da..39392e1cc7 100644
--- a/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
+++ b/meta-networking/recipes-daemons/squid/files/Skip-AC_RUN_IFELSE-tests.patch
@@ -12,31 +12,9 @@ Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 
 ---
- acinclude/krb5.m4       | 10 +++++++++-
  acinclude/lib-checks.m4 |  8 ++++++--
  2 files changed, 15 insertions(+), 3 deletions(-)
 
-diff --git a/acinclude/krb5.m4 b/acinclude/krb5.m4
-index e0286fa..b3e4bc7 100644
---- a/acinclude/krb5.m4
-+++ b/acinclude/krb5.m4
-@@ -98,7 +98,15 @@ main(void)
-         krb5_init_context(&context);
-         return 0;
- }
--]])], [ squid_cv_broken_heimdal_krb5_h=yes ], [ squid_cv_broken_heimdal_krb5_h=no ])
-+]])], [ squid_cv_broken_heimdal_krb5_h=yes ], [ squid_cv_broken_heimdal_krb5_h=no ],
-+[
-+  dnl Can't test in cross compiled env - so assume good
-+  squid_cv_broken_heimdal_krb5_h=no
-+])
-+    ],
-+    [
-+     dnl Can't test in cross compiled env - so assume good
-+     squid_cv_broken_heimdal_krb5_h=no
-     ])
-     SQUID_STATE_ROLLBACK(squid_krb5_heimdal_test)
-   ])
 diff --git a/acinclude/lib-checks.m4 b/acinclude/lib-checks.m4
 index 9793b9a..4f2dc83 100644
 --- a/acinclude/lib-checks.m4
diff --git a/meta-networking/recipes-daemons/squid/squid_7.3.bb b/meta-networking/recipes-daemons/squid/squid_7.4.bb
similarity index 97%
rename from meta-networking/recipes-daemons/squid/squid_7.3.bb
rename to meta-networking/recipes-daemons/squid/squid_7.4.bb
index 8d1d84c04e..6333d1e0f2 100644
--- a/meta-networking/recipes-daemons/squid/squid_7.3.bb
+++ b/meta-networking/recipes-daemons/squid/squid_7.4.bb
@@ -22,10 +22,10 @@ SRC_URI = "https://github.com/squid-cache/${BPN}/releases/download/SQUID_${PV_U}
            file://squid.nm \
            "
 
-SRC_URI[sha256sum] = "dadc2a9a3926ce1b3babeaa7a7d7b21cbb089025876daa3f5c19e7eb6391ddcd"
+SRC_URI[sha256sum] = "e31976edd755c295bd5842a349c9c7dad16a683d066337cc09033c1302b4fed4"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://errors/COPYRIGHT;md5=c2a0e15750d3a9743af9109fecc05622 \
+                    file://errors/COPYRIGHT;md5=41d117978dbffedc893e8eeca12537d0 \
                     "
 
 UPSTREAM_CHECK_URI = "https://github.com/squid-cache/${BPN}/releases/"
-- 
2.47.3


