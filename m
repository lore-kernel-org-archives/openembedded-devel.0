Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 487D8C27C48
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:53:06 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.63877.1699041166970464217
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dyFXyLg1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KBPqbg3+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b96bef801-bd696e06-19de-40df-9390-9d45ab896a9d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041179;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=c54+PFJKGtqU1Qz8surpcANAF6A1CgzRfE8ACXFreYI=;
	b=dyFXyLg1EPfDZ87PI9+U4WFZ9ZBUxVYrMImju94kxXRsSym01EvVobCdQik5nf+w
	gRC2k4FqwXtYo4syZvu3S+NLi7lLec8fZHxMazBqDONn5hwJkVJpcJPDjbsrhZAjjCn
	Pg1tl0A4JJgCkrdvGAMwS02moeP89YA6up3eyNlc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041179;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=c54+PFJKGtqU1Qz8surpcANAF6A1CgzRfE8ACXFreYI=;
	b=KBPqbg3+0pFGn27Lp4raFSs+pAEy7qn4JEaDrKZkUF5yCAVe1bca+siIPACGZ1ZL
	3Q9mxM/R8xpzHtQcZaXse6Q8SlYrJ9+buf+g8LTkhiEkTruOoHYDbtepLe2Zpq+kGXD
	1Cc0QN8qAbhtPhJ84V0XjYYYB+VAucbDgJLU6r2Y=
Content-Type: multipart/mixed; boundary="===============2292543081271170417=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xmlsec1: upgrading to 1.3.2 SUCCEEDED
Message-ID: <0101018b96bef801-bd696e06-19de-40df-9390-9d45ab896a9d-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.45
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:53:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106039

--===============2292543081271170417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xmlsec1* to *1.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xmlsec1-upgrade-1.2.37-1.3.2.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From e32b53c430f07ac67a09061cfd69dff1f07d1911 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 19:34:28 +0000
Subject: [PATCH] xmlsec1: upgrade 1.2.37 -> 1.3.2

---
 ...mldsigverify-Include-xmlsec-parser.h.patch | 43 -------------------
 .../{xmlsec1_1.2.37.bb => xmlsec1_1.3.2.bb}   | 19 ++++----
 2 files changed, 9 insertions(+), 53 deletions(-)
 delete mode 100644 meta-oe/recipes-support/xmlsec1/xmlsec1/0001-xmldsigverify-Include-xmlsec-parser.h.patch
 rename meta-oe/recipes-support/xmlsec1/{xmlsec1_1.2.37.bb => xmlsec1_1.3.2.bb} (80%)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-xmldsigverify-Include-xmlsec-parser.h.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-xmldsigverify-Include-xmlsec-parser.h.patch
deleted file mode 100644
index 4347e925a..000000000
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-xmldsigverify-Include-xmlsec-parser.h.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 30e1afe60820c18c89cd10e9dcb7208ad5676d1d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 19 Jan 2023 15:06:35 -0800
-Subject: [PATCH] xmldsigverify: Include xmlsec/parser.h
-
-this ensures that xmlSecParserSetDefaultOptions definition is made
-available
-
-Fixes
-| xmldsigverify.c:275:5: error: call to undeclared function 'xmlSecParserSetDefaultOptions'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-|     xmlSecParserSetDefaultOptions(XML_PARSE_NOENT | XML_PARSE_NOCDATA |
-|     ^
-
-Upstream-Status: Submitted [https://github.com/lsh123/xmlsec/pull/463]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- examples/xmldsigverify.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/examples/xmldsigverify.c b/examples/xmldsigverify.c
-index ed538c70..ff68120e 100644
---- a/examples/xmldsigverify.c
-+++ b/examples/xmldsigverify.c
-@@ -25,6 +25,7 @@
- #include <xmlsec/xmldsig.h>
- #include <xmlsec/crypto.h>
- 
-+#include <xmlsec/parser.h>
- /* #define XMLDSIGVERIFY_DEFAULT_TRUSTED_CERTS_FOLDER   "/etc/httpd/conf/ssl.crt" */
- #define XMLDSIGVERIFY_DEFAULT_TRUSTED_CERTS_FOLDER      "/var/www/cgi-bin/keys-certs.def"
- #define XMLDSIGVERIFY_KEY_AND_CERTS_FOLDER              "/var/www/cgi-bin/keys-certs"
-@@ -36,7 +37,7 @@ int verify_request(xmlSecKeysMngrPtr mngr);
- int url_decode(char *buf, size_t size);
- 
- int
--main(int , char **) {
-+main() {
-     xmlSecKeysMngrPtr mngr;
- #ifndef XMLSEC_NO_XSLT
-     xsltSecurityPrefsPtr xsltSecPrefs = NULL;
--- 
-2.39.1
-
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.37.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.2.bb
similarity index 80%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.37.bb
rename to meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.2.bb
index a3da77094..ff5b6faeb 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.37.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.2.bb
@@ -13,17 +13,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=352791d62092ea8104f085042de7f4d0"
 SECTION = "libs"
 
 SRC_URI = "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
-    file://fix-ltmain.sh.patch \
-    file://change-finding-path-of-nss.patch \
-    file://makefile-ptest.patch \
-    file://xmlsec1-examples-allow-build-in-separate-dir.patch \
-    file://0001-nss-nspr-fix-for-multilib.patch \
-    file://run-ptest \
-    file://ensure-search-path-non-host.patch \
-    file://0001-xmldsigverify-Include-xmlsec-parser.h.patch \
-    "
+           file://fix-ltmain.sh.patch \
+           file://change-finding-path-of-nss.patch \
+           file://makefile-ptest.patch \
+           file://xmlsec1-examples-allow-build-in-separate-dir.patch \
+           file://0001-nss-nspr-fix-for-multilib.patch \
+           file://run-ptest \
+           file://ensure-search-path-non-host.patch \
+           "
 
-SRC_URI[sha256sum] = "5f8dfbcb6d1e56bddd0b5ec2e00a3d0ca5342a9f57c24dffde5c796b2be2871c"
+SRC_URI[sha256sum] = "4003c56b3d356d21b1db7775318540fad6bfedaf5f117e8f7c010811219be3cf"
 
 inherit autotools-brokensep ptest pkgconfig
 
-- 
2.39.2


--===============2292543081271170417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xmlsec1: PKGV changed from 1.2.37 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xmlsec1: PV changed from "1.2.37" to "1.3.2"
packages/core2-64-poky-linux/xmlsec1: SRC_URI changed from "http://www.aleksey.com/xmlsec/download/xmlsec1-1.2.37.tar.gz file://fix-ltmain.sh.patch file://change-finding-path-of-nss.patch file://makefile-ptest.patch file://xmlsec1-examples-allow-build-in-separate-dir.patch file://0001-nss-nspr-fix-for-multilib.patch file://run-ptest file://ensure-search-path-non-host.patch file://0001-xmldsigverify-Include-xmlsec-parser.h.patch" to "http://www.aleksey.com/xmlsec/download/xmlsec1-1.3.2.tar.gz file://fix-ltmain.sh.patch file://change-finding-path-of-nss.patch file://makefile-ptest.patch file://xmlsec1-examples-allow-build-in-separate-dir.patch file://0001-nss-nspr-fix-for-multilib.patch file://run-ptest file://ensure-search-path-non-host.patch"
Changes to packages/core2-64-poky-linux/xmlsec1 (sysroot):
  /usr/lib/libxmlsec1-gcrypt.so.1 changed symlink target from libxmlsec1-gcrypt.so.1.2.37 to libxmlsec1-gcrypt.so.1.3.2
  /usr/lib/libxmlsec1-gcrypt.so changed symlink target from libxmlsec1-gcrypt.so.1.2.37 to libxmlsec1-gcrypt.so.1.3.2
  /usr/lib/libxmlsec1-gnutls.so.1 changed symlink target from libxmlsec1-gnutls.so.1.2.37 to libxmlsec1-gnutls.so.1.3.2
  /usr/lib/libxmlsec1-gnutls.so changed symlink target from libxmlsec1-gnutls.so.1.2.37 to libxmlsec1-gnutls.so.1.3.2
  /usr/lib/libxmlsec1-openssl.so.1 changed symlink target from libxmlsec1-openssl.so.1.2.37 to libxmlsec1-openssl.so.1.3.2
  /usr/lib/libxmlsec1-openssl.so changed symlink target from libxmlsec1-openssl.so.1.2.37 to libxmlsec1-openssl.so.1.3.2
  /usr/lib/libxmlsec1.so.1 changed symlink target from libxmlsec1.so.1.2.37 to libxmlsec1.so.1.3.2
  /usr/lib/libxmlsec1.so changed symlink target from libxmlsec1.so.1.2.37 to libxmlsec1.so.1.3.2
  /usr/include/xmlsec1/xmlsec/gnutls/keysstore.h was added
  /usr/include/xmlsec1/xmlsec/openssl/keysstore.h was added
  /usr/lib/libxmlsec1-gcrypt.so.1.3.2 was added
  /usr/lib/libxmlsec1-gnutls.so.1.3.2 was added
  /usr/lib/libxmlsec1-openssl.so.1.3.2 was added
  /usr/lib/libxmlsec1.so.1.3.2 was added
  /usr/include/xmlsec1/xmlsec/openssl/bn.h was removed
  /usr/lib/libxmlsec1-gcrypt.so.1.2.37 was removed
  /usr/lib/libxmlsec1-gnutls.so.1.2.37 was removed
  /usr/lib/libxmlsec1-openssl.so.1.2.37 was removed
  /usr/lib/libxmlsec1.so.1.2.37 was removed
packages/core2-64-poky-linux/xmlsec1/xmlsec1-dbg: PKGV changed from 1.2.37 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xmlsec1/xmlsec1-dbg: PV changed from "1.2.37" to "1.3.2"
packages/core2-64-poky-linux/xmlsec1/xmlsec1-dbg: PKGSIZE changed from 3259056 to 3974896 (+22%)
packages/core2-64-poky-linux/xmlsec1/xmlsec1-dbg: FILELIST: removed "/usr/lib/.debug/libxmlsec1-gnutls.so.1.2.37 /usr/lib/.debug/libxmlsec1-openssl.so.1.2.37 /usr/lib/.debug/libxmlsec1-gcrypt.so.1.2.37 /usr/lib/.debug/libxmlsec1.so.1.2.37", added "/usr/lib/.debug/libxmlsec1-openssl.so.1.3.2 /usr/lib/.debug/libxmlsec1-gcrypt.so.1.3.2 /usr/lib/.debug/libxmlsec1-gnutls.so.1.3.2 /usr/lib/.debug/libxmlsec1.so.1.3.2"
packages/core2-64-poky-linux/xmlsec1/xmlsec1-dev: PKGV changed from 1.2.37 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xmlsec1/xmlsec1-dev: PV changed from "1.2.37" to "1.3.2"
packages/core2-64-poky-linux/xmlsec1/xmlsec1-dev: PKGSIZE changed from 408392 to 486353 (+19%)
packages/core2-64-poky-linux/xmlsec1/xmlsec1-dev: FILELIST: removed "/usr/include/xmlsec1/xmlsec/openssl/bn.h", added "/usr/include/xmlsec1/xmlsec/openssl/keysstore.h /usr/include/xmlsec1/xmlsec/gnutls/keysstore.h"
packages/core2-64-poky-linux/xmlsec1/xmlsec1-doc: PKGV changed from 1.2.37 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xmlsec1/xmlsec1-doc: PV changed from "1.2.37" to "1.3.2"
packages/core2-64-poky-linux/xmlsec1/xmlsec1-doc: PKGSIZE changed from 3314387 to 3763908 (+14%)
packages/core2-64-poky-linux/xmlsec1/xmlsec1-doc: FILELIST: removed "/usr/share/doc/xmlsec1/api/xmlsec-x509.html /usr/share/doc/xmlsec1/api/xmlsec-notes-new-crypto-skeleton.html"
packages/core2-64-poky-linux/xmlsec1/xmlsec1-locale: PKGV changed from 1.2.37 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xmlsec1/xmlsec1-locale: PV changed from "1.2.37" to "1.3.2"
packages/core2-64-poky-linux/xmlsec1/xmlsec1-ptest: PKGV changed from 1.2.37 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xmlsec1/xmlsec1-ptest: PV changed from "1.2.37" to "1.3.2"
packages/core2-64-poky-linux/xmlsec1/xmlsec1-ptest: PKGSIZE changed from 425554 to 425862 (+0%)
packages/core2-64-poky-linux/xmlsec1/xmlsec1-src: PKGV changed from 1.2.37 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xmlsec1/xmlsec1-src: PV changed from "1.2.37" to "1.3.2"
packages/core2-64-poky-linux/xmlsec1/xmlsec1-src: PKGSIZE changed from 2701701 to 3649968 (+35%)
packages/core2-64-poky-linux/xmlsec1/xmlsec1-src: FILELIST: directory renamed /usr/src/debug/xmlsec1/1.2.37-r0/include/xmlsec/gcrypt -> /usr/src/debug/xmlsec1/1.3.2-r0/include/xmlsec/gcrypt, directory renamed /usr/src/debug/xmlsec1/1.2.37-r0/apps -> /usr/src/debug/xmlsec1/1.3.2-r0/apps, directory renamed /usr/src/debug/xmlsec1/1.2.37-r0/include/xmlsec -> /usr/src/debug/xmlsec1/1.3.2-r0/include/xmlsec, directory renamed /usr/src/debug/xmlsec1/1.2.37-r0/examples -> /usr/src/debug/xmlsec1/1.3.2-r0/examples, removed "/usr/src/debug/xmlsec1/1.2.37-r0/src/strings.c /usr/src/debug/xmlsec1/1.2.37-r0/src/gnutls/x509vfy.c /usr/src/debug/xmlsec1/1.2.37-r0/src/gnutls/ciphers.c /usr/src/debug/xmlsec1/1.2.37-r0/src/gcrypt/kw_des.c /usr/src/debug/xmlsec1/1.2.37-r0/src/gcrypt/kw_aes.c /usr/src/debug/xmlsec1/1.2.37-r0/src/openssl/x509.c /usr/src/debug/xmlsec1/1.2.37-r0/src/openssl/signatures.c /usr/src/debug/xmlsec1/1.2.37-r0/src/parser.c /usr/src/debug/xmlsec1/1.2.37-r0/src/keysdata_helpers.h /usr/s
 rc/debug/xmlsec1/1.2.37-r0/src/gcrypt/asn1.h /usr/src/debug/xmlsec1/1.2.37-r0/include/xmlsec/gnutls/x509.h /usr/src/debug/xmlsec1/1.2.37-r0/src/gcrypt/hmac.c /usr/src/debug/xmlsec1/1.2.37-r0/src/gcrypt/asn1.c /usr/src/debug/xmlsec1/1.2.37-r0/src/openssl/digests.c /usr/src/debug/xmlsec1/1.2.37-r0/src/openssl/ciphers.c /usr/src/debug/xmlsec1/1.2.37-r0/src/gnutls/symkeys.c /usr/src/debug/xmlsec1/1.2.37-r0/src/xmltree.c /usr/src/debug/xmlsec1/1.2.37-r0/src/keys.c /usr/src/debug/xmlsec1/1.2.37-r0/src/openssl/crypto.c /usr/src/debug/xmlsec1/1.2.37-r0/src/gcrypt/crypto.c /usr/src/debug/xmlsec1/1.2.37-r0/src/gcrypt/signatures.c /usr/src/debug/xmlsec1/1.2.37-r0/src/gnutls/x509utils.c /usr/src/debug/xmlsec1/1.2.37-r0/src/gnutls/x509utils.h /usr/src/debug/xmlsec1/1.2.37-r0/src/xmlenc.c /usr/src/debug/xmlsec1/1.2.37-r0/src/openssl/symkeys.c /usr/src/debug/xmlsec1/1.2.37-r0/src/openssl/kw_des.c /usr/src/debug/xmlsec1/1.2.37-r0/src/gnutls/signatures.c /usr/src/debug/xmlsec1/1.2.37-r0/src/app.c /u
 sr/src/debug/xmlsec1/1.2.37-r0/src/buffer.c /usr/src/debug/xmlsec1/1.2.37-r0/src/gcrypt/digests.c /usr/src/debug/xmlsec1/1.2.37-r0/src/gnutls/asymkeys.c /usr/src/debug/xmlsec1/1.2.37-r0/src/gnutls/digests.c /usr/src/debug/xmlsec1/1.2.37-r0/src/gnutls/kw_aes.c /usr/src/debug/xmlsec1/1.2.37-r0/src/gnutls/kw_des.c /usr/src/debug/xmlsec1/1.2.37-r0/src/nodeset.c /usr/src/debug/xmlsec1/1.2.37-r0/src/x509.c /usr/src/debug/xmlsec1/1.2.37-r0/src/openssl/evp_signatures.c /usr/src/debug/xmlsec1/1.2.37-r0/src/templates.c /usr/src/debug/xmlsec1/1.2.37-r0/src/openssl/app.c /usr/src/debug/xmlsec1/1.2.37-r0/src/openssl/evp.c /usr/src/debug/xmlsec1/1.2.37-r0/src/membuf.c /usr/src/debug/xmlsec1/1.2.37-r0/src/xmldsig.c /usr/src/debug/xmlsec1/1.2.37-r0/src/gcrypt/app.c /usr/src/debug/xmlsec1/1.2.37-r0/include/xmlsec/openssl/x509.h /usr/src/debug/xmlsec1/1.2.37-r0/src/bn.c /usr/src/debug/xmlsec1/1.2.37-r0/src/dl.c /usr/src/debug/xmlsec1/1.2.37-r0/src/io.c /usr/src/debug/xmlsec1/1.2.37-r0/src/xmlsec.c /u
 sr/src/debug/xmlsec1/1.2.37-r0/include/xmlsec/openssl/app.h /usr/src/debug/xmlsec1/1.2.37-r0/src/kw_aes_des.h /usr/src/debug/xmlsec1/1.2.37-r0/src/keysdata.c /usr/src/debug/xmlsec1/1.2.37-r0/src/gcrypt/asymkeys.c /usr/src/debug/xmlsec1/1.2.37-r0/src/kw_aes_des.c /usr/src/debug/xmlsec1/1.2.37-r0/src/keyinfo.c /usr/src/debug/xmlsec1/1.2.37-r0/include/xmlsec/openssl/crypto.h /usr/src/debug/xmlsec1/1.2.37-r0/src/openssl/bn.c /usr/src/debug/xmlsec1/1.2.37-r0/src/transforms.c /usr/src/debug/xmlsec1/1.2.37-r0/include/xmlsec/gnutls/app.h /usr/src/debug/xmlsec1/1.2.37-r0/src/openssl/x509vfy.c /usr/src/debug/xmlsec1/1.2.37-r0/src/gcrypt/ciphers.c /usr/src/debug/xmlsec1/1.2.37-r0/src/gnutls/hmac.c /usr/src/debug/xmlsec1/1.2.37-r0/src/gnutls/x509.c /usr/src/debug/xmlsec1/1.2.37-r0/include/xmlsec/openssl/evp.h /usr/src/debug/xmlsec1/1.2.37-r0/src/openssl/kw_aes.c /usr/src/debug/xmlsec1/1.2.37-r0/src/xslt.h /usr/src/debug/xmlsec1/1.2.37-r0/src/openssl/hmac.c /usr/src/debug/xmlsec1/1.2.37-r0/src/l
 ist.c /usr/src/debug/xmlsec1/1.2.37-r0/src/xslt.c /usr/src/debug/xmlsec1/1.2.37-r0/src/c14n.c /usr/src/debug/xmlsec1/1.2.37-r0/src/errors.c /usr/src/debug/xmlsec1/1.2.37-r0/src/gnutls/app.c /usr/src/debug/xmlsec1/1.2.37-r0/include/xmlsec/gnutls/crypto.h /usr/src/debug/xmlsec1/1.2.37-r0/src/relationship.c /usr/src/debug/xmlsec1/1.2.37-r0/src/gcrypt/symkeys.c /usr/src/debug/xmlsec1/1.2.37-r0/src/xpath.c /usr/src/debug/xmlsec1/1.2.37-r0/src/openssl/kt_rsa.c /usr/src/debug/xmlsec1/1.2.37-r0/src/base64.c /usr/src/debug/xmlsec1/1.2.37-r0/src/keysmngr.c /usr/src/debug/xmlsec1/1.2.37-r0/src/transform_helpers.h /usr/src/debug/xmlsec1/1.2.37-r0/src/enveloped.c /usr/src/debug/xmlsec1/1.2.37-r0/src/gnutls/crypto.c", added "/usr/src/debug/xmlsec1/1.3.2-r0/src/gnutls/x509utils.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gnutls/pbkdf2.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gcrypt/symkeys.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gnutls/kt_rsa.c /usr/src/debug/xmlsec1/1.3.2-r0/src/openssl/ciphers.c /usr/src/d
 ebug/xmlsec1/1.3.2-r0/src/transforms.c /usr/src/debug/xmlsec1/1.3.2-r0/src/transform_helpers.h /usr/src/debug/xmlsec1/1.3.2-r0/include/xmlsec/gnutls/keysstore.h /usr/src/debug/xmlsec1/1.3.2-r0/src/gcrypt/digests.c /usr/src/debug/xmlsec1/1.3.2-r0/include/xmlsec/openssl/x509.h /usr/src/debug/xmlsec1/1.3.2-r0/src/openssl/kt_rsa.c /usr/src/debug/xmlsec1/1.3.2-r0/src/keysmngr.c /usr/src/debug/xmlsec1/1.3.2-r0/src/openssl/x509.c /usr/src/debug/xmlsec1/1.3.2-r0/src/openssl/hmac.c /usr/src/debug/xmlsec1/1.3.2-r0/include/xmlsec/openssl/evp.h /usr/src/debug/xmlsec1/1.3.2-r0/src/openssl/kw_aes.c /usr/src/debug/xmlsec1/1.3.2-r0/include/xmlsec/gnutls/crypto.h /usr/src/debug/xmlsec1/1.3.2-r0/src/openssl/kw_des.c /usr/src/debug/xmlsec1/1.3.2-r0/src/xslt.h /usr/src/debug/xmlsec1/1.3.2-r0/src/gnutls/app.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gcrypt/asymkeys.c /usr/src/debug/xmlsec1/1.3.2-r0/src/c14n.c /usr/src/debug/xmlsec1/1.3.2-r0/src/keys.c /usr/src/debug/xmlsec1/1.3.2-r0/src/list.c /usr/src/debug
 /xmlsec1/1.3.2-r0/src/xslt.c /usr/src/debug/xmlsec1/1.3.2-r0/src/xmlsec.c /usr/src/debug/xmlsec1/1.3.2-r0/src/openssl/app.c /usr/src/debug/xmlsec1/1.3.2-r0/src/openssl/evp.c /usr/src/debug/xmlsec1/1.3.2-r0/src/openssl/kdf.c /usr/src/debug/xmlsec1/1.3.2-r0/src/openssl/x509vfy.c /usr/src/debug/xmlsec1/1.3.2-r0/include/xmlsec/openssl/crypto.h /usr/src/debug/xmlsec1/1.3.2-r0/src/gnutls/symkeys.c /usr/src/debug/xmlsec1/1.3.2-r0/src/relationship.c /usr/src/debug/xmlsec1/1.3.2-r0/src/keysdata.c /usr/src/debug/xmlsec1/1.3.2-r0/src/membuf.c /usr/src/debug/xmlsec1/1.3.2-r0/src/openssl/keysstore.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gnutls/signatures.c /usr/src/debug/xmlsec1/1.3.2-r0/src/errors.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gnutls/x509vfy.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gnutls/keysstore.c /usr/src/debug/xmlsec1/1.3.2-r0/src/strings.c /usr/src/debug/xmlsec1/1.3.2-r0/src/io.c /usr/src/debug/xmlsec1/1.3.2-r0/src/app.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gnutls/crypto.c /usr/src/debu
 g/xmlsec1/1.3.2-r0/src/xmltree.c /usr/src/debug/xmlsec1/1.3.2-r0/src/bn.c /usr/src/debug/xmlsec1/1.3.2-r0/src/openssl/digests.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gnutls/asymkeys.c /usr/src/debug/xmlsec1/1.3.2-r0/src/openssl/crypto.c /usr/src/debug/xmlsec1/1.3.2-r0/src/openssl/signatures.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gcrypt/app.c /usr/src/debug/xmlsec1/1.3.2-r0/src/templates.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gcrypt/ciphers.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gnutls/ciphers_gcm.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gnutls/private.h /usr/src/debug/xmlsec1/1.3.2-r0/src/openssl/symkeys.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gnutls/digests.c /usr/src/debug/xmlsec1/1.3.2-r0/src/xmldsig.c /usr/src/debug/xmlsec1/1.3.2-r0/src/dl.c /usr/src/debug/xmlsec1/1.3.2-r0/src/enveloped.c /usr/src/debug/xmlsec1/1.3.2-r0/src/kw_aes_des.h /usr/src/debug/xmlsec1/1.3.2-r0/include/xmlsec/openssl/app.h /usr/src/debug/xmlsec1/1.3.2-r0/src/kw_aes_des.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gcrypt/s
 ignatures.c /usr/src/debug/xmlsec1/1.3.2-r0/src/keysdata_helpers.h /usr/src/debug/xmlsec1/1.3.2-r0/src/gcrypt/crypto.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gnutls/ciphers_cbc.c /usr/src/debug/xmlsec1/1.3.2-r0/include/xmlsec/gnutls/app.h /usr/src/debug/xmlsec1/1.3.2-r0/src/xmlenc.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gnutls/hmac.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gnutls/x509.c /usr/src/debug/xmlsec1/1.3.2-r0/src/nodeset.c /usr/src/debug/xmlsec1/1.3.2-r0/src/xpath.c /usr/src/debug/xmlsec1/1.3.2-r0/src/keyinfo.c /usr/src/debug/xmlsec1/1.3.2-r0/src/openssl/private.h /usr/src/debug/xmlsec1/1.3.2-r0/include/xmlsec/openssl/keysstore.h /usr/src/debug/xmlsec1/1.3.2-r0/src/base64.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gnutls/kw_aes.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gnutls/kw_des.c /usr/src/debug/xmlsec1/1.3.2-r0/include/xmlsec/gnutls/x509.h /usr/src/debug/xmlsec1/1.3.2-r0/src/openssl/key_agrmnt.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gcrypt/kw_aes.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gcry
 pt/kw_des.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gcrypt/asn1.h /usr/src/debug/xmlsec1/1.3.2-r0/src/gcrypt/asn1.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gcrypt/hmac.c /usr/src/debug/xmlsec1/1.3.2-r0/src/buffer.c /usr/src/debug/xmlsec1/1.3.2-r0/src/parser.c /usr/src/debug/xmlsec1/1.3.2-r0/src/gcrypt/kt_rsa.c"
packages/core2-64-poky-linux/xmlsec1/xmlsec1-staticdev: PKGV changed from 1.2.37 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xmlsec1/xmlsec1-staticdev: PV changed from "1.2.37" to "1.3.2"
packages/core2-64-poky-linux/xmlsec1/xmlsec1: PKGV changed from 1.2.37 [default] to 1.3.2 [default]
packages/core2-64-poky-linux/xmlsec1/xmlsec1: PV changed from "1.2.37" to "1.3.2"
packages/core2-64-poky-linux/xmlsec1/xmlsec1: PKGSIZE changed from 1142236 to 1668147 (+46%)
packages/core2-64-poky-linux/xmlsec1/xmlsec1: FILELIST: removed "/usr/lib/libxmlsec1-openssl.so.1.2.37 /usr/lib/libxmlsec1-gnutls.so.1.2.37 /usr/lib/libxmlsec1.so.1.2.37 /usr/lib/libxmlsec1-gcrypt.so.1.2.37", added "/usr/lib/libxmlsec1-gcrypt.so.1.3.2 /usr/lib/libxmlsec1-openssl.so.1.3.2 /usr/lib/libxmlsec1.so.1.3.2 /usr/lib/libxmlsec1-gnutls.so.1.3.2"

--===============2292543081271170417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/xmlsec1 (sysroot):
  /usr/lib/libxmlsec1-gcrypt.so.1 changed symlink target from libxmlsec1-gcrypt.so.1.2.37 to libxmlsec1-gcrypt.so.1.3.2
  /usr/lib/libxmlsec1-gcrypt.so changed symlink target from libxmlsec1-gcrypt.so.1.2.37 to libxmlsec1-gcrypt.so.1.3.2
  /usr/lib/libxmlsec1-gnutls.so.1 changed symlink target from libxmlsec1-gnutls.so.1.2.37 to libxmlsec1-gnutls.so.1.3.2
  /usr/lib/libxmlsec1-gnutls.so changed symlink target from libxmlsec1-gnutls.so.1.2.37 to libxmlsec1-gnutls.so.1.3.2
  /usr/lib/libxmlsec1-openssl.so.1 changed symlink target from libxmlsec1-openssl.so.1.2.37 to libxmlsec1-openssl.so.1.3.2
  /usr/lib/libxmlsec1-openssl.so changed symlink target from libxmlsec1-openssl.so.1.2.37 to libxmlsec1-openssl.so.1.3.2
  /usr/lib/libxmlsec1.so.1 changed symlink target from libxmlsec1.so.1.2.37 to libxmlsec1.so.1.3.2
  /usr/lib/libxmlsec1.so changed symlink target from libxmlsec1.so.1.2.37 to libxmlsec1.so.1.3.2
  /usr/include/xmlsec1/xmlsec/gnutls/keysstore.h was added
  /usr/include/xmlsec1/xmlsec/openssl/keysstore.h was added
  /usr/lib/libxmlsec1-gcrypt.so.1.3.2 was added
  /usr/lib/libxmlsec1-gnutls.so.1.3.2 was added
  /usr/lib/libxmlsec1-openssl.so.1.3.2 was added
  /usr/lib/libxmlsec1.so.1.3.2 was added
  /usr/include/xmlsec1/xmlsec/openssl/bn.h was removed
  /usr/lib/libxmlsec1-gcrypt.so.1.2.37 was removed
  /usr/lib/libxmlsec1-gnutls.so.1.2.37 was removed
  /usr/lib/libxmlsec1-openssl.so.1.2.37 was removed
  /usr/lib/libxmlsec1.so.1.2.37 was removed
packages/core2-64-poky-linux/xmlsec1/xmlsec1-dbg: PKGSIZE changed from 3259056 to 3974896 (+22%)
packages/core2-64-poky-linux/xmlsec1/xmlsec1-dev: PKGSIZE changed from 408392 to 486353 (+19%)
packages/core2-64-poky-linux/xmlsec1/xmlsec1-dev: FILELIST: removed "/usr/include/xmlsec1/xmlsec/openssl/bn.h", added "/usr/include/xmlsec1/xmlsec/openssl/keysstore.h /usr/include/xmlsec1/xmlsec/gnutls/keysstore.h"
packages/core2-64-poky-linux/xmlsec1/xmlsec1-doc: PKGSIZE changed from 3314387 to 3763908 (+14%)
packages/core2-64-poky-linux/xmlsec1/xmlsec1-doc: FILELIST: removed "/usr/share/doc/xmlsec1/api/xmlsec-x509.html /usr/share/doc/xmlsec1/api/xmlsec-notes-new-crypto-skeleton.html"
packages/core2-64-poky-linux/xmlsec1/xmlsec1-src: PKGSIZE changed from 2701701 to 3649968 (+35%)
packages/core2-64-poky-linux/xmlsec1/xmlsec1: PKGSIZE changed from 1142236 to 1668147 (+46%)
packages/core2-64-poky-linux/xmlsec1/xmlsec1: FILELIST: removed "/usr/lib/libxmlsec1-gnutls.so.1.2.37 /usr/lib/libxmlsec1-gcrypt.so.1.2.37 /usr/lib/libxmlsec1-openssl.so.1.2.37 /usr/lib/libxmlsec1.so.1.2.37", added "/usr/lib/libxmlsec1.so.1.3.2 /usr/lib/libxmlsec1-gcrypt.so.1.3.2 /usr/lib/libxmlsec1-gnutls.so.1.3.2 /usr/lib/libxmlsec1-openssl.so.1.3.2"

--===============2292543081271170417==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xmlsec1-upgrade-1.2.37-1.3.2.patch"

RnJvbSBlMzJiNTNjNDMwZjA3YWM2N2EwOTA2MWNmZDY5ZGZmMWYwN2QxOTExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxOTozNDoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHht
bHNlYzE6IHVwZ3JhZGUgMS4yLjM3IC0+IDEuMy4yCgotLS0KIC4uLm1sZHNpZ3ZlcmlmeS1JbmNs
dWRlLXhtbHNlYy1wYXJzZXIuaC5wYXRjaCB8IDQzIC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi97
eG1sc2VjMV8xLjIuMzcuYmIgPT4geG1sc2VjMV8xLjMuMi5iYn0gICB8IDE5ICsrKystLS0tCiAy
IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNTMgZGVsZXRpb25zKC0pCiBkZWxldGUg
bW9kZSAxMDA2NDQgbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQveG1sc2VjMS94bWxzZWMxLzAwMDEt
eG1sZHNpZ3ZlcmlmeS1JbmNsdWRlLXhtbHNlYy1wYXJzZXIuaC5wYXRjaAogcmVuYW1lIG1ldGEt
b2UvcmVjaXBlcy1zdXBwb3J0L3htbHNlYzEve3htbHNlYzFfMS4yLjM3LmJiID0+IHhtbHNlYzFf
MS4zLjIuYmJ9ICg4MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQveG1s
c2VjMS94bWxzZWMxLzAwMDEteG1sZHNpZ3ZlcmlmeS1JbmNsdWRlLXhtbHNlYy1wYXJzZXIuaC5w
YXRjaCBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L3htbHNlYzEveG1sc2VjMS8wMDAxLXhtbGRz
aWd2ZXJpZnktSW5jbHVkZS14bWxzZWMtcGFyc2VyLmgucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDQzNDdlOTI1YS4uMDAwMDAwMDAwCi0tLSBhL21ldGEtb2UvcmVjaXBlcy1z
dXBwb3J0L3htbHNlYzEveG1sc2VjMS8wMDAxLXhtbGRzaWd2ZXJpZnktSW5jbHVkZS14bWxzZWMt
cGFyc2VyLmgucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw0MyArMCwwIEBACi1Gcm9tIDMwZTFh
ZmU2MDgyMGMxOGM4OWNkMTBlOWRjYjcyMDhhZDU2NzZkMWQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCi1Gcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotRGF0ZTogVGh1LCAxOSBK
YW4gMjAyMyAxNTowNjozNSAtMDgwMAotU3ViamVjdDogW1BBVENIXSB4bWxkc2lndmVyaWZ5OiBJ
bmNsdWRlIHhtbHNlYy9wYXJzZXIuaAotCi10aGlzIGVuc3VyZXMgdGhhdCB4bWxTZWNQYXJzZXJT
ZXREZWZhdWx0T3B0aW9ucyBkZWZpbml0aW9uIGlzIG1hZGUKLWF2YWlsYWJsZQotCi1GaXhlcwot
fCB4bWxkc2lndmVyaWZ5LmM6Mjc1OjU6IGVycm9yOiBjYWxsIHRvIHVuZGVjbGFyZWQgZnVuY3Rp
b24gJ3htbFNlY1BhcnNlclNldERlZmF1bHRPcHRpb25zJzsgSVNPIEM5OSBhbmQgbGF0ZXIgZG8g
bm90IHN1cHBvcnQgaW1wbGljaXQgZnVuY3Rpb24gZGVjbGFyYXRpb25zIFstV2ltcGxpY2l0LWZ1
bmN0aW9uLWRlY2xhcmF0aW9uXQotfCAgICAgeG1sU2VjUGFyc2VyU2V0RGVmYXVsdE9wdGlvbnMo
WE1MX1BBUlNFX05PRU5UIHwgWE1MX1BBUlNFX05PQ0RBVEEgfAotfCAgICAgXgotCi1VcHN0cmVh
bS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIuY29tL2xzaDEyMy94bWxzZWMvcHVs
bC80NjNdCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0t
Ci0gZXhhbXBsZXMveG1sZHNpZ3ZlcmlmeS5jIHwgMyArKy0KLSAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCi0KLWRpZmYgLS1naXQgYS9leGFtcGxlcy94bWxk
c2lndmVyaWZ5LmMgYi9leGFtcGxlcy94bWxkc2lndmVyaWZ5LmMKLWluZGV4IGVkNTM4YzcwLi5m
ZjY4MTIwZSAxMDA2NDQKLS0tLSBhL2V4YW1wbGVzL3htbGRzaWd2ZXJpZnkuYwotKysrIGIvZXhh
bXBsZXMveG1sZHNpZ3ZlcmlmeS5jCi1AQCAtMjUsNiArMjUsNyBAQAotICNpbmNsdWRlIDx4bWxz
ZWMveG1sZHNpZy5oPgotICNpbmNsdWRlIDx4bWxzZWMvY3J5cHRvLmg+Ci0gCi0rI2luY2x1ZGUg
PHhtbHNlYy9wYXJzZXIuaD4KLSAvKiAjZGVmaW5lIFhNTERTSUdWRVJJRllfREVGQVVMVF9UUlVT
VEVEX0NFUlRTX0ZPTERFUiAgICIvZXRjL2h0dHBkL2NvbmYvc3NsLmNydCIgKi8KLSAjZGVmaW5l
IFhNTERTSUdWRVJJRllfREVGQVVMVF9UUlVTVEVEX0NFUlRTX0ZPTERFUiAgICAgICIvdmFyL3d3
dy9jZ2ktYmluL2tleXMtY2VydHMuZGVmIgotICNkZWZpbmUgWE1MRFNJR1ZFUklGWV9LRVlfQU5E
X0NFUlRTX0ZPTERFUiAgICAgICAgICAgICAgIi92YXIvd3d3L2NnaS1iaW4va2V5cy1jZXJ0cyIK
LUBAIC0zNiw3ICszNyw3IEBAIGludCB2ZXJpZnlfcmVxdWVzdCh4bWxTZWNLZXlzTW5nclB0ciBt
bmdyKTsKLSBpbnQgdXJsX2RlY29kZShjaGFyICpidWYsIHNpemVfdCBzaXplKTsKLSAKLSBpbnQK
LS1tYWluKGludCAsIGNoYXIgKiopIHsKLSttYWluKCkgewotICAgICB4bWxTZWNLZXlzTW5nclB0
ciBtbmdyOwotICNpZm5kZWYgWE1MU0VDX05PX1hTTFQKLSAgICAgeHNsdFNlY3VyaXR5UHJlZnNQ
dHIgeHNsdFNlY1ByZWZzID0gTlVMTDsKLS0tIAotMi4zOS4xCi0KZGlmZiAtLWdpdCBhL21ldGEt
b2UvcmVjaXBlcy1zdXBwb3J0L3htbHNlYzEveG1sc2VjMV8xLjIuMzcuYmIgYi9tZXRhLW9lL3Jl
Y2lwZXMtc3VwcG9ydC94bWxzZWMxL3htbHNlYzFfMS4zLjIuYmIKc2ltaWxhcml0eSBpbmRleCA4
MCUKcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQveG1sc2VjMS94bWxzZWMxXzEu
Mi4zNy5iYgpyZW5hbWUgdG8gbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQveG1sc2VjMS94bWxzZWMx
XzEuMy4yLmJiCmluZGV4IGEzZGE3NzA5NC4uZmY1YjZmYWViIDEwMDY0NAotLS0gYS9tZXRhLW9l
L3JlY2lwZXMtc3VwcG9ydC94bWxzZWMxL3htbHNlYzFfMS4yLjM3LmJiCisrKyBiL21ldGEtb2Uv
cmVjaXBlcy1zdXBwb3J0L3htbHNlYzEveG1sc2VjMV8xLjMuMi5iYgpAQCAtMTMsMTcgKzEzLDE2
IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTM1Mjc5MWQ2MjA5MmVh
ODEwNGYwODUwNDJkZTdmNGQwIgogU0VDVElPTiA9ICJsaWJzIgogCiBTUkNfVVJJID0gImh0dHA6
Ly93d3cuYWxla3NleS5jb20veG1sc2VjL2Rvd25sb2FkLyR7QlB9LnRhci5neiBcCi0gICAgZmls
ZTovL2ZpeC1sdG1haW4uc2gucGF0Y2ggXAotICAgIGZpbGU6Ly9jaGFuZ2UtZmluZGluZy1wYXRo
LW9mLW5zcy5wYXRjaCBcCi0gICAgZmlsZTovL21ha2VmaWxlLXB0ZXN0LnBhdGNoIFwKLSAgICBm
aWxlOi8veG1sc2VjMS1leGFtcGxlcy1hbGxvdy1idWlsZC1pbi1zZXBhcmF0ZS1kaXIucGF0Y2gg
XAotICAgIGZpbGU6Ly8wMDAxLW5zcy1uc3ByLWZpeC1mb3ItbXVsdGlsaWIucGF0Y2ggXAotICAg
IGZpbGU6Ly9ydW4tcHRlc3QgXAotICAgIGZpbGU6Ly9lbnN1cmUtc2VhcmNoLXBhdGgtbm9uLWhv
c3QucGF0Y2ggXAotICAgIGZpbGU6Ly8wMDAxLXhtbGRzaWd2ZXJpZnktSW5jbHVkZS14bWxzZWMt
cGFyc2VyLmgucGF0Y2ggXAotICAgICIKKyAgICAgICAgICAgZmlsZTovL2ZpeC1sdG1haW4uc2gu
cGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vY2hhbmdlLWZpbmRpbmctcGF0aC1vZi1uc3MucGF0
Y2ggXAorICAgICAgICAgICBmaWxlOi8vbWFrZWZpbGUtcHRlc3QucGF0Y2ggXAorICAgICAgICAg
ICBmaWxlOi8veG1sc2VjMS1leGFtcGxlcy1hbGxvdy1idWlsZC1pbi1zZXBhcmF0ZS1kaXIucGF0
Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAwMS1uc3MtbnNwci1maXgtZm9yLW11bHRpbGliLnBh
dGNoIFwKKyAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCisgICAgICAgICAgIGZpbGU6Ly9l
bnN1cmUtc2VhcmNoLXBhdGgtbm9uLWhvc3QucGF0Y2ggXAorICAgICAgICAgICAiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI1ZjhkZmJjYjZkMWU1NmJkZGQwYjVlYzJlMDBhM2QwY2E1MzQyYTlm
NTdjMjRkZmZkZTVjNzk2YjJiZTI4NzFjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQwMDNjNTZi
M2QzNTZkMjFiMWRiNzc3NTMxODU0MGZhZDZiZmVkYWY1ZjExN2U4ZjdjMDEwODExMjE5YmUzY2Yi
CiAKIGluaGVyaXQgYXV0b3Rvb2xzLWJyb2tlbnNlcCBwdGVzdCBwa2djb25maWcKIAotLSAKMi4z
OS4yCgo=

--===============2292543081271170417==--

