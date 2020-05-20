Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.2770.1589997928556309344
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2020 11:05:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=kPNlCh5c;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=s9d8=7c=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49S0z86bDpz4c
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2020 20:05:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589997925;
	bh=ItoxJoAO5WCD5p+5/VbsvO2aIqOVFMZeqSKR5HZesgQ=;
	h=From:To:Subject:Date:From;
	b=kPNlCh5cLc+nF+0lJNGcWltBGTI7ns+3TLW1FUGyXB8f/GYZzVadw+Kn0rEuw7qKq
	 u4VsSy1EZ4LGqqFZlZuZ0xBSTIKI4qIDkSjE/jGg/0jThxA8meq9OcobFppZys5fyM
	 fxZ+h6dAhtDxvg2O8PqbrQwPRJNA4X12z5YP0mqGAchXMONl8Z0+LSpevXOAC0Pdmq
	 1HKUmGxMB7c5pvm0GHcN5EH4VwZ6M7+/w7kpbDDQQkFsSrB/z4JLEJG2ZKd9MBGzfs
	 Ykg7QxTfCTUYIqQ+F9+QGLqBdCzHzqCx5nImRfajnHS0g3zcspqTTErcx5xlAfti2M
	 eLuFUaNk+5sxVwdR1WDZzMIMEDkmjJuUlvld5jJrOY50V/7f+5AhWp6OE5zEwhq2tY
	 qQw/j6UwHK37+RXAlYF8sQExbHXWyZ907TPlsFwd5cbpX1SqeyccO+5bmXOnByFqJv
	 muBp5/bKCuKm49bnfxg7Q3dmFxs/vPk4Qfq+ubMEvZB9Xanz8nUjogG1jO3ytFGeDu
	 So9quuMsXZrGrZ8zyIXWM3Wzp385otucVmGfCQoDVcM+hIj2BANAofaPPwXvl/+Ze9
	 4geQtiPRcEn+oFQkgb8Fdm0e+LxkjB9mRyLKeLdIv9F7Jf8MDghFJcN+K6Ez9LHMfh
	 zWgooGM471z15Lw66Oi5BQUs=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] postfix: Upgrade 3.4.10 -> 3.4.12
Date: Wed, 20 May 2020 21:05:19 +0300
Message-Id: <20200520180519.21295-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

Remove patch applied upstream.
Manual -fcommon is no longer necessary.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...ure-with-glibc-2.30-due-to-dropped-R.patch | 37 -------------------
 .../recipes-daemons/postfix/postfix.inc       |  2 +-
 .../{postfix_3.4.10.bb => postfix_3.4.12.bb}  |  3 +-
 3 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/postfix/files/0001-Fixed-build-failure-with-glibc-2.30-due-to-dropped-R.patch
 rename meta-networking/recipes-daemons/postfix/{postfix_3.4.10.bb => postfix_3.4.12.bb} (80%)

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Fixed-build-failure-with-glibc-2.30-due-to-dropped-R.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fixed-build-failure-with-glibc-2.30-due-to-dropped-R.patch
deleted file mode 100644
index 22adaff72..000000000
--- a/meta-networking/recipes-daemons/postfix/files/0001-Fixed-build-failure-with-glibc-2.30-due-to-dropped-R.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 8b3792830f4930fee7fbb00c854d9766f2b74dca Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Jul 2019 11:35:38 -0700
-Subject: [PATCH] Fixed build failure with glibc 2.30 due to dropped
- RES_INSECURE1/2 macros
-
-see [1]
-
-[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=333221862ecbebde60dd16e7ca17d26444e62f50
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/dns/dns_str_resflags.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/dns/dns_str_resflags.c b/src/dns/dns_str_resflags.c
-index 5f2cce5..df32345 100644
---- a/src/dns/dns_str_resflags.c
-+++ b/src/dns/dns_str_resflags.c
-@@ -60,10 +60,16 @@ static const LONG_NAME_MASK resflag_table[] = {
-     "RES_DEFNAMES", RES_DEFNAMES,
-     "RES_STAYOPEN", RES_STAYOPEN,
-     "RES_DNSRCH", RES_DNSRCH,
-+#ifdef RES_INSECURE1
-     "RES_INSECURE1", RES_INSECURE1,
-+#endif
-+#ifdef RES_INSECURE2
-     "RES_INSECURE2", RES_INSECURE2,
-+#endif
-     "RES_NOALIASES", RES_NOALIASES,
-+#ifdef RES_USE_INET6
-     "RES_USE_INET6", RES_USE_INET6,
-+#endif
- #ifdef RES_ROTATE
-     "RES_ROTATE", RES_ROTATE,
- #endif
diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index a8d55a6c9..4b9940cc7 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -61,7 +61,7 @@ export CCARGS-sasl_class-native = ""
 export AUXLIBS-sasl_class-native = ""
 
 # PCRE, TLS support default
-export CCARGS  = "${CFLAGS} -fcommon -DHAS_PCRE -DUSE_TLS -I${STAGING_INCDIR}/openssl ${CCARGS-ldap} ${CCARGS-sasl} ${CCARGS-nonis}"
+export CCARGS  = "${CFLAGS} -DHAS_PCRE -DUSE_TLS -I${STAGING_INCDIR}/openssl ${CCARGS-ldap} ${CCARGS-sasl} ${CCARGS-nonis}"
 export AUXLIBS = "-lpcre -lssl -lcrypto ${AUXLIBS-sasl} ${AUXLIBS-ldap}"
 export POSTCONF = "${STAGING_DIR_NATIVE}${sbindir_native}/postconf"
 
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.4.10.bb b/meta-networking/recipes-daemons/postfix/postfix_3.4.12.bb
similarity index 80%
rename from meta-networking/recipes-daemons/postfix/postfix_3.4.10.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.4.12.bb
index d0ef708c5..db5b41bfb 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.4.10.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.4.12.bb
@@ -13,7 +13,6 @@ SRC_URI += "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://postfix-install.patch \
            file://icu-config.patch \
            file://0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
-           file://0001-Fixed-build-failure-with-glibc-2.30-due-to-dropped-R.patch \
            "
-SRC_URI[sha256sum] = "908a66fc38537a0047e8561e1bc0ef096c53357ffad16d2d728cd4fc8ae56654"
+SRC_URI[sha256sum] = "18555183ae8b52a9e76067799279c86f9f2770cdef3836deb8462ee0a0855dec"
 UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.3(\.\d+)+).tar.gz"
-- 
2.17.1

