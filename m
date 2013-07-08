Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id E52986B100
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2013 08:41:28 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id l15so2717371eak.37
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jul 2013 01:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=BdWDo/bfBWnAAbynBNRsC11r+7MZNjc38jF7SMDHDfA=;
	b=IYYlO589TcUJhrdkfXW+gIsC3UYKu8Egjs6AAdvo2PhETQLoDgt0GDb7PaarR7/YCx
	FONcIh6ggpaPHx7I6W+nsxQI4d9IH/diiYCwSg58pk42Dy9v8+Oqms2xoBM4G6imeGK3
	tlhNw9Uhqlg4Gw6JKyoCN3IoVYdtPJEn31ivCXL9+jQeiRgZ4CY/OG5UrbqiXAJKOcYn
	tn1S3GHS96BqO51hjwTGmuRtmgrQJQIDKjuOCOxoiUeW9dLRVbVeZhcRb0OszUMPGXNh
	FmqIXBvmA3LEYEd4DD/J2unmiTE8vIuzF/ro0AUx0py3xSvgk+8O7LFgm9k2JmnJv1Sg
	H+Yw==
X-Received: by 10.15.98.3 with SMTP id bi3mr22707266eeb.124.1373272889410;
	Mon, 08 Jul 2013 01:41:29 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b7sm40292399eef.16.2013.07.08.01.41.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 08 Jul 2013 01:41:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jul 2013 10:41:28 +0200
Message-Id: <1373272893-26013-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [meta-oe][PATCH 1/6] mysql5: prevent using bundled zlib at all costs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Jul 2013 08:41:29 -0000

* in some seldom cases mysql's m4 macro decides that system
  zlib (from DEPENDS) is not worthy and decides to use own
  bundled version which prefers stuff like static libz.a and
  stages libz.la again:
  mysql-5.1.40/config/ac-macros/zlib.m4
  NOTE: recipe mysql5-5.1.40-r11: task do_package_setscene: Started
  NOTE: recipe zlib-1.2.7-r0: task do_packagedata_setscene: Succeeded
  WARNING: The recipe zlib is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
  sysroots/om-gta04/usr/lib/libz.a
  Matched in manifest-om-gta04-mysql5
  Please verify which package should provide the above files.
  NOTE: recipe zlib-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded

* this libz.la + libz.a is breaking many packages which are now trying to
  link shared libs against libz.a from mysql which was built without fPIC
  breaking libxml2, glib-2.0, gnutls, libpng, ...
  | ld: sysroots/om-gta04/usr/lib/libz.a(crc32.o): relocation R_ARM_MOVW_ABS_NC against `a local symbol' can not be used when making a shared object; recompile with -fPIC
  | sysroots/om-gta04/usr/lib/libz.a: could not read symbols: Bad value
  | collect2: ld returned 1 exit status

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/mysql/mysql5_5.1.40.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc b/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
index 3b3a42d..1a38e9f 100644
--- a/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
+++ b/meta-oe/recipes-support/mysql/mysql5_5.1.40.inc
@@ -32,7 +32,7 @@ export ac_cv_path_PS="/bin/ps"
 export ac_cv_FIND_PROC="/bin/ps p \$\$PID | grep -v grep | grep mysqld > /dev/null"
 PARALLEL_MAKE = " "
 EXTRA_OEMAKE = "'GEN_LEX_HASH=${STAGING_BINDIR_NATIVE}/gen_lex_hash'"
-EXTRA_OECONF = " --with-atomic-ops=up --with-embedded-server --prefix=/usr --sysconfdir=/etc/mysql --localstatedir=/var/mysql --disable-dependency-tracking --without-raid --without-debug --with-low-memory --without-query-cache --without-man --without-docs --without-innodb "
+EXTRA_OECONF = " --with-atomic-ops=up --with-embedded-server --prefix=/usr --sysconfdir=/etc/mysql --localstatedir=/var/mysql --disable-dependency-tracking --without-raid --without-debug --with-low-memory --without-query-cache --without-man --without-docs --without-innodb --with-zlib-dir=${STAGING_EXECPREFIXDIR}"
 
 do_configure_append() {
     sed -i /comp_err/d ${S}/sql/share/Makefile
-- 
1.8.2.1


