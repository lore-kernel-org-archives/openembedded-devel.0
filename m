Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 44C696B81C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:34 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so179738eak.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=HmbqPCqvTDPRppfMmkztjUhAdI1uTp3I1hedZW0XejU=;
	b=HbX1bIWe/IrxgM9Q+E0ApFCfPtGChd5IcPhBhoFFT+j9n4TAmVvhNOoa7tPsZIuaGV
	n7XVWA3EkiIt533YDJnwd6w3jx4cBC95QIkwSAvjP7aXRnAKJ4M9V2Kt0ctjXwkgtF+0
	h8OBx1gqDSjqxVf1wObhfX0Xag6RZyBxRN54uf4jOyfz4UX+OwpdB9l9IdJRY8BsBMd5
	/p+KGCtqLSrNpUN+/y8YdGvTnLptjojLAowPDQivXp776j/5jOMXbyyRT+TbXr4fnI+R
	BnIKyC8ryxSGUQz2L74ZkZmASVCFvMIyH1y7II//jd8qTdfB0OI8eplOtoOIxhmZTOGY
	uBow==
X-Received: by 10.14.0.200 with SMTP id 48mr2795016eeb.53.1376551174528;
	Thu, 15 Aug 2013 00:19:34 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p5sm81932261eeg.5.2013.08.15.00.19.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:11 +0200
Message-Id: <fba4e844aee150dcb171c59339c127a2554fd852.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 31/60] mkvtoolnix: inherit gettext and export RUBYLIB
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:34 -0000

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


