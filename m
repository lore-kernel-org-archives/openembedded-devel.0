Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5DECD6204F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Aug 2013 13:08:39 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so774713eek.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Aug 2013 06:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=urVgN9B49ugnCNuCH1R6hPF0HXSkvfCzr+jODrKfN+M=;
	b=ARxKGMHQ7VaO9R565GkWw2QF/011NnEV+tDWvusve3BHEbdNpiciStQY7cyPftCCwJ
	j7wSDqkSxfphO6JXI+jfPIALh3VTcxq97ECrlk80wDWw9iD+1NIaYtTj0kUIAZEkpHD8
	YGsrRcmoJjBMerWHZZVpUu515/zNMs45BfFGsLqV2XmkXmC7kn4cTZnZN8oD0hiGk5wQ
	ZnsLHg6N1DcfYIBep3UcovjFm/eupzSulS1Z7nF/X9Q5DiWVgZ7u9wLO44VERdq8ccbR
	a/bAILjV2e5r3PV3OhL3SSmb0kIFg63N19ZVRkcvsX5jVTkUjMsLadF1cg13POkNse4N
	VRqw==
X-Received: by 10.15.31.9 with SMTP id x9mr9447479eeu.103.1375535319021;
	Sat, 03 Aug 2013 06:08:39 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e44sm19280927eeh.11.2013.08.03.06.08.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 03 Aug 2013 06:08:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Aug 2013 15:09:09 +0200
Message-Id: <1375535352-23015-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-efl][PATCH 1/4] imlib2, lightmediascanner: Add PRIVATE_LIBS
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
X-List-Received-Date: Sat, 03 Aug 2013 13:08:39 -0000

* to resolve following warning:
  WARNING: lightmediascanner-0.4.4 is already registered as shlib provider for png.so, ignoring imlib2-loaders-1.4.5+svnr82070 trying to register the same
  WARNING: lightmediascanner-0.4.4 is already registered as shlib provider for jpeg.so, ignoring imlib2-loaders-1.4.5+svnr82070 trying to register the same
  WARNING: lightmediascanner-0.4.4 is already registered as shlib provider for id3.so, ignoring imlib2-loaders-1.4.5+svnr82070 trying to register the same
  when fixes from https://bugzilla.yoctoproject.org/show_bug.cgi?id=4628
  are included in build

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/imlib2_svn.bb                               | 5 +++++
 .../recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb  | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/meta-efl/recipes-efl/efl/imlib2_svn.bb b/meta-efl/recipes-efl/efl/imlib2_svn.bb
index eeaaf52..a83216d 100644
--- a/meta-efl/recipes-efl/efl/imlib2_svn.bb
+++ b/meta-efl/recipes-efl/efl/imlib2_svn.bb
@@ -29,3 +29,8 @@ FILES_imlib2-loaders = "${libdir}/imlib2/loaders/*.so"
 FILES_imlib2-filters = "${libdir}/imlib2/filters/*.so"
 FILES_imlib2-loaders-dbg += "${libdir}/imlib2/loaders/.debug"
 FILES_imlib2-filters-dbg += "${libdir}/imlib2/filters/.debug"
+
+# png.so jpeg.so id3.so are also provided by lightmediascanner
+PRIVATE_LIBS_imlib2-loaders = "pnm.so lbm.so argb.so tiff.so zlib.so bmp.so tga.so gif.so xpm.so bz2.so"
+
+PRIVATE_LIBS_imlib2-filters = "bumpmap.so colormod.so testfilter.so"
diff --git a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
index 8fdce18..a3ff5d2 100644
--- a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
+++ b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
@@ -31,3 +31,6 @@ FILES_${PN}-staticdev += "${libdir}/${PN}/plugins/*.a"
 
 # otherwise fails with ERROR: could not add conversion charset 'UTF-16BE': Invalid argument
 RDEPENDS_${PN}-test_append_libc-glibc = " glibc-gconv-utf-16"
+
+# png.so jpeg.so id3.so are provided also by imlib2-loaders
+PRIVATE_LIBS_${PN} = "video-dummy.so png.so jpeg.so id3.so pls.so audio-dummy.so rm.so ogg.so dummy.so m3u.so flac.so asf.so"
-- 
1.8.3.2


