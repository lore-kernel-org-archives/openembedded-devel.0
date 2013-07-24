Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 380A86B31B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:41:23 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id b57so209798eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=HmbqPCqvTDPRppfMmkztjUhAdI1uTp3I1hedZW0XejU=;
	b=Y3JooSI7ih8ve14qX22QE3CoprnUfGNuAQImUyjy7CoEx9QdbGTHzSD47lyaj7GdLW
	ymltyB/eW2hGqRark3Zc0m66+U876XWIqyUypeU05+G9LJP9q9v7YunyScFDzm+VRMwn
	WF9cAJTK+3mnKMByDCPka7xEU7E34rj3W7pyudqaqZbox4pe8AfCwZtAhE7AkizOIFX0
	21hlILwzAjEV3aMI3SavBehH8/GFDuRqhJFFD0STm+GyMMJWwiD2DqcF7UmLcweYzicw
	Rs6Acf8t19mE1la49lYBMuajIKeiZ+XZFOBNsA/pQ9dqXCSGF6dkCuhDQJc13ySG0PG2
	IF5g==
X-Received: by 10.14.7.2 with SMTP id 2mr37543750eeo.145.1374669683667;
	Wed, 24 Jul 2013 05:41:23 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	ci50sm65841045eeb.12.2013.07.24.05.41.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:41:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:41:05 +0200
Message-Id: <707b82865c2119cdf4d2faed0cc169354d396aa6.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 21/29] mkvtoolnix: inherit gettext and export RUBYLIB
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
X-List-Received-Date: Wed, 24 Jul 2013 12:41:23 -0000

* fails to call msgfmt in do_compile:
  MSGFMT po/cs.po
  ERROR: Function failed: do_compile (see mkvtoolnix/5.9.0-r0/temp/log.do_compile.3794 for further information)
* fails to find rubygems.rb:
  <internal:gem_prelude>:1:in `require': cannot load such file rubygems.rb (LoadError)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
index 13edaa9..0106594 100644
--- a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
+++ b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5.9.0.bb
@@ -10,7 +10,13 @@ SRC_URI = "http://www.bunkus.org/videotools/mkvtoolnix/sources/mkvtoolnix-${PV}.
 SRC_URI[md5sum] = "033621461ef8eb922fc1366e0a9a6f16"
 SRC_URI[sha256sum] = "d913f531331c3332d2fb334c872ea19bfea7293dfedc4bf33ae7162e4efcbde1"
 
-inherit autotools
+inherit autotools gettext
+
+# make sure rb files are used from sysroot, not from host
+# ruby-1.9.3-always-use-i386.patch is doing target_cpu=`echo $target_cpu | sed s/i.86/i386/`
+# we need to replace it too (a bit longer version without importing re)
+RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
+export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
 
 EXTRA_OECONF = " --with-boost-libdir=${STAGING_LIBDIR} \
 "
-- 
1.8.3.2


