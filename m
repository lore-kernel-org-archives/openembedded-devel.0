Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 684F460CED
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2014 11:28:12 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id t10so2864159eei.26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2014 03:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=r6oCEMsqjt3xSof1VfFVlMf87/JIDbIEEX7hOiFuIfs=;
	b=EWQ8Pme07tF+sCEPS9H8GWQDmDmYKMyMGMX+jnHFSoqs5P6FDchXctw6c4qDNwj4lJ
	Lf/+tdrewxegc0hLG11Y9zb0lD2QYL+EVCgrnuuZ1SFVZUjlWIwdEMy0YqTExvd++uLi
	n/NqexZgK6kJ2BZOokf+4NZ0bMANifDphnae+881GtRb/HC2fJYaNw0f7xKiZ73cFp5G
	YFV1/o/ucjkr5pZLXYW/MnygrJlRyedXLUyTR0CeqnGGDEzc/QHOv7QdsDF3i5gFq1q/
	5Dm9W4PrqIvCQtGvBcMUvP0hOwIV3KDkw2srDKe+fTtb9lZJYeKMekxs1k/vkMZdNPrX
	s6RA==
X-Received: by 10.15.43.10 with SMTP id w10mr12330819eev.13.1390130892707;
	Sun, 19 Jan 2014 03:28:12 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id x45sm42864937eee.3.2014.01.19.03.28.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Jan 2014 03:28:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Jan 2014 12:28:10 +0100
Message-Id: <1390130890-10775-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
Subject: [meta-qt5][PATCH] qtmultimedia: Use PACKAGECONFIG for gstremer-0.10 and change it to disabled by default
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
X-List-Received-Date: Sun, 19 Jan 2014 11:28:13 -0000

* it doesn't support gst-1.x like qtwebkit yet, disable it by default to
  build images without gst-0.10 where possible.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtmultimedia.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtmultimedia.inc b/recipes-qt/qt5/qtmultimedia.inc
index 8726985..66133f4 100644
--- a/recipes-qt/qt5/qtmultimedia.inc
+++ b/recipes-qt/qt5/qtmultimedia.inc
@@ -1,13 +1,17 @@
 require qt5.inc
 
-DEPENDS += "qtdeclarative gstreamer gst-plugins-base alsa-lib "
+DEPENDS += "qtdeclarative alsa-lib"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[openal] = ",,openal-soft"
+PACKAGECONFIG[gstreamer010] = ",,gstreamer gst-plugins-base"
 
 do_configure_prepend() {
     # disable openal test if it isn't enabled by PACKAGECONFIG
     sed -i 's/^qtCompileTest(openal)/OE_OPENAL_ENABLED:qtCompileTest(openal)/g' ${S}/qtmultimedia.pro
+    # disable gstreamer-0.10 test if it isn't enabled by PACKAGECONFIG
+    sed -i 's/^\( *\)qtCompileTest(gstreamer)/\1OE_GSTREAMER010_ENABLED:qtCompileTest(gstreamer) {/g' ${S}/qtmultimedia.pro
 }
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'openal', 'CONFIG+=OE_OPENAL_ENABLED', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gstreamer010', 'CONFIG+=OE_GSTREAMER010_ENABLED', '', d)}"
-- 
1.8.5.2


