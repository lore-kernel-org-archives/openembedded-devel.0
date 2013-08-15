Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 09D006B800
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:16 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b47so182009eek.17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=tnCUZctDBbxkBiOb25n1IrnNWLgvVCz9crOm77RaPk8=;
	b=1HBgfpkzpKLeCyj4fxgiuf3la3nx+ZGwZiAUp9rY75YYwkjfDRHCqQNNMAVHakutss
	XObKfRmV1uC01OU2RtQnERrrTGv5zGsZZZwJg/rtFQxPkSvPo2PZ2ypo86v8exKTvL40
	rZu+2EXX4BvmPYyz+uOQk2QOyzHfbi5qCI04R/uSfHwaXIvgs8IM8YcKDKPTQCMp8M7q
	Uay9/YgOwt6wpS3kRJ/6WEVqCG9MqraJViglVzyyybQD9apOFy9YLF7G70SSny2+STSR
	MOkkKw5kBuV/L4wD1qRs5KKySpMl9EWcAhgywjEP7iC8fP6fwV8e9AqDEBXcf10kS9zZ
	5moQ==
X-Received: by 10.15.41.77 with SMTP id r53mr1746244eev.64.1376551157444;
	Thu, 15 Aug 2013 00:19:17 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k3sm81999632een.16.2013.08.15.00.19.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:18:58 +0200
Message-Id: <5b6987efeee70f3b8f94f9b991f533e6793bc053.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 18/60] mysql5: prevent using bundled zlib at all costs
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:17 -0000

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
index 3d79e19..21bf8b0 100644
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
1.8.3.2


