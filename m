Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PJut9-00071t-Aj
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Nov 2010 22:22:41 +0100
Received: by eya28 with SMTP id 28so3284325eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Nov 2010 13:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=jENoOJxIqEnBum1Q7cMiHRygJRWUYvW8Fs2yol8mpTg=;
	b=NsI+fuJ+4XpFjZR933hs0C8WSXyBmWfahuInJugrigLJrbvKbqZsDOMITPY0Olr0v9
	0Ec2OA+K5hUpoAIS2F5OfH9TwadeY3SwQuO9hB2iX0PbOM7keXn7fvxAaFh39oQ97W/C
	2Uu89budAyVunb8kvSCQqTXMb+YyDRxkM5tYo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=kDQRKy5pTx5aHzlFbapHr6mCnnnmFrIB3Bq2WtHHG9MdwxTiV5v634S3LpNhhtGYS8
	cw57lHu4GFxa7o3dbuS4e3VyQy5sCwytFpcGfa95ViZvfAgzzG4EEOFLiGRvzBIsH24j
	CQILar71XJmszJ9vcr5MjzRYoa4gneUEper+c=
Received: by 10.14.47.200 with SMTP id t48mr1921932eeb.23.1290288079571;
	Sat, 20 Nov 2010 13:21:19 -0800 (PST)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id x54sm2926820eeh.11.2010.11.20.13.21.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 20 Nov 2010 13:21:18 -0800 (PST)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Nov 2010 22:21:13 +0100
Message-Id: <1290288073-7632-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] php: fixed path
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Nov 2010 21:22:41 -0000

with the arrival of a new release the old php tarball moved to the
museum site, Fixed SRC_URI and moved it from the inc file to the bb file
so when adding the latest version there is no SRC_URI clash in the .inc
file.

Also introduced INC_PR

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/php/php-native_5.3.2.bb |    7 +++++--
 recipes/php/php.inc             |    4 +---
 recipes/php/php_5.2.13.bb       |   12 ++++++++----
 3 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/recipes/php/php-native_5.3.2.bb b/recipes/php/php-native_5.3.2.bb
index d5ed932..3a2299c 100644
--- a/recipes/php/php-native_5.3.2.bb
+++ b/recipes/php/php-native_5.3.2.bb
@@ -1,8 +1,11 @@
 require php-native.inc
 
-PR = "r1"
+PR = "${INC_PR}.1"
 
-SRC_URI += "file://CVE-2010-0397.patch"
+SRC_URI =     "http://museum.php.net/php5/php-${PV}.tar.bz2;name=src \
+               file://acinclude-xml2-config.patch \
+               file://php-m4-divert.patch \
+	       file://CVE-2010-0397.patch"
 
 SRC_URI[src.md5sum] = "46f500816125202c48a458d0133254a4"
 SRC_URI[src.sha256sum] = "9a380a574adcb3a9abe3226e7c3a9bae619e8a1b90842ec2a7edf0ad92afdeda"
diff --git a/recipes/php/php.inc b/recipes/php/php.inc
index bfee93c..a48827a 100644
--- a/recipes/php/php.inc
+++ b/recipes/php/php.inc
@@ -3,9 +3,7 @@ HOMEPAGE = "http://www.php.net"
 SECTION = "console/network"
 LICENSE = "PHP"
 
-SRC_URI =     "http://us2.php.net/distributions/php-${PV}.tar.bz2;name=src \
-               file://acinclude-xml2-config.patch \
-               file://php-m4-divert.patch"
+INC_PR = "r7"
 
 S = "${WORKDIR}/php-${PV}"
 
diff --git a/recipes/php/php_5.2.13.bb b/recipes/php/php_5.2.13.bb
index 0f9317d..5871dca 100644
--- a/recipes/php/php_5.2.13.bb
+++ b/recipes/php/php_5.2.13.bb
@@ -3,12 +3,16 @@ require php.inc
 DEPENDS = "zlib libxml2 virtual/libiconv php-native lemon-native mysql5 \
            libc-client openssl"
 
-PR = "r7"
-
-SRC_URI += "file://pear-makefile.patch \
-            file://imap-fix-autofoo.patch \
-            file://CVE-2010-0397.patch \
+PR = "${INC_PR}.1"
+
+SRC_URI =     "http://museum.php.net/php5/php-${PV}.tar.bz2;name=src \
+               file://acinclude-xml2-config.patch \
+               file://php-m4-divert.patch \
+	       file://pear-makefile.patch \
+	       file://imap-fix-autofoo.patch \
+	       file://CVE-2010-0397.patch \
             "
+
 SRC_URI[src.md5sum] = "eb4d0766dc4fb9667f05a68b6041e7d1"
 SRC_URI[src.sha256sum] = "2b50a2535e3bb9a98cd4d1633f9452d877276c40b385915261f040d535c7eadb"
 
-- 
1.6.4.2



