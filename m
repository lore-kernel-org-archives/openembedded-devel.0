Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0D17465C7B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Mar 2015 22:23:54 +0000 (UTC)
Received: by wghl2 with SMTP id l2so30094623wgh.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Mar 2015 14:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=Wu9PQEu/+hNgCx2aGVQ1kwBEjlumPquggUquR1LCDHY=;
	b=qNUiG2dZihNlAZdUCFqW1UdmzkNt2x4KZS2Sx2L4jlYYLX1te1Kb8jujB3ZORQKTf4
	fgTGvcS4hbioUFjcHtSC6e0D15yRZuBj5tc0F5ta9uvCiQujUTaQKqSENHYcecUACAwz
	D714a00a5cgaT+3N7TlfA89i0AkYcijJRuRIQOIE6PVCOsR50oHp0U4XegJCZx/KjO4B
	gf1DtC83xu66AWsxFwYqUowH9ebyTgBJ6tV4RVVdYd22Ha4myFg0RIsM7Tu7eCt4LYy/
	N7mXD2+6ThhdDzt9NgOicUHVhjINB9G3fdDVp33DlKMgSw1x9OiboOU5vwhhAGPiykf/
	8mag==
X-Received: by 10.194.19.166 with SMTP id g6mr13965048wje.150.1425248635260;
	Sun, 01 Mar 2015 14:23:55 -0800 (PST)
Received: from localhost.localdomain (p5B0A2149.dip0.t-ipconnect.de.
	[91.10.33.73]) by mx.google.com with ESMTPSA id
	hv5sm16549333wjb.16.2015.03.01.14.23.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 Mar 2015 14:23:54 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Mar 2015 23:23:44 +0100
Message-Id: <1425248624-2993-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [meta-oe][PATCH] qt-creator: avoid conflicts with meta-qt5's qt5-creator
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
X-List-Received-Date: Sun, 01 Mar 2015 22:23:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We avoid conflicts by installing no files to sysroot. This causes no fallout
because nothing depends on qt5-creator (if something included later depending
on qt-creator it should depend on qt5-creator).
Note that

| WARNING: QA Issue: qt5-creator rdepends on qt-creator, but it isn't a build dependency? [build-deps]

is a false positve because the names of the libraries are same as for
qt5-creator (see test below).

This patch was tested by:

1. building qt-creator from scratch
2. building an image containing qt5-creator.
   * qt5-creator did not fail for sysroot conflicts
   * image was build without pulling qt-creator

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb b/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
index 11d7be7..670ffad 100644
--- a/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
+++ b/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
@@ -33,6 +33,11 @@ RRECOMMENDS_${PN} += "packagegroup-core-buildessential \
                       qt4-plugin-sqldriver-sqlite \
 "
 
+# avoid conflicts with meta-qt5's qt-creator and do install nothing to sysroot
+# this does no harm cause nothing depends on qt-creator
+sysroot_stage_all() {
+}
+
 # the regexp in insane.bbclass doesn't allow this valid path:
 # qt-creator-2.8.1: qt-creator: found library in wrong location: /usr/share/qtcreator/qbs/lib/qbs/plugins/libqbs_cpp_scanner.so
 # qt-creator: found library in wrong location: /usr/share/qtcreator/qbs/lib/qbs/plugins/libqbs_qt_scanner.so
-- 
1.9.3


