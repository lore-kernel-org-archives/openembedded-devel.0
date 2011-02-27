Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.reilly@gmail.com>) id 1Ptr08-0005E5-Ua
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 01:30:14 +0100
Received: by pzk12 with SMTP id 12so522199pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Feb 2011 16:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=ybVl5SxCf4n8hhgUymIruD7wf0PVyXjrV0s4NWNOVUI=;
	b=AEPRz/cNwaLAAhe96fjsKNvQR8KTDVtYsBh73kDnzWYut2wBuRlWiVZi3bMh449bLg
	+OWkJLF8Rbq1uIvkBLvewKq+F2Qd7CKNIHdCMMc7AK9+LrbEGAtZEvNaGHacE25ewzxO
	os903bFQGaFFk3BZuKvGX0JT4icXaTCXIrYyY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=NCNyxrEcMNKAHpITWUZ7cd67BDK7PWmxHCxzblMO+cYSbWCLhCZdEtTJTyiCDLQljO
	+gz83miSWlyLR15a0Z0pCw+VXEmOWl7zE02dmr2jLKq/oOrojC42b6AoWTdLPW5aEU4l
	vA9/3HXQ1rh0eTbxw9EuBKpJaM8qBn5GoYCV8=
Received: by 10.142.156.14 with SMTP id d14mr3762853wfe.235.1298852922766;
	Sun, 27 Feb 2011 16:28:42 -0800 (PST)
Received: from localhost.localdomain (220-244-174-13.static.tpgi.com.au
	[220.244.174.13])
	by mx.google.com with ESMTPS id w32sm5135372wfh.7.2011.02.27.16.28.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 16:28:42 -0800 (PST)
Sender: Marc Reilly <marc.reilly@gmail.com>
From: Marc Reilly <marc@cpdesign.com.au>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Feb 2011 10:27:57 +1100
Message-Id: <1298849277-29164-2-git-send-email-marc@cpdesign.com.au>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1298849277-29164-1-git-send-email-marc@cpdesign.com.au>
References: <1298849277-29164-1-git-send-email-marc@cpdesign.com.au>
Subject: [PATCH] qt-4.7.1: patch gstreamer phonon plugin to use host rgb endianess
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
X-List-Received-Date: Mon, 28 Feb 2011 00:30:14 -0000

This patch was obtained from Nokia bug tracker.
Without it, the R and B channels are wrong when playing on ARM system.

Signed-off-by: Marc Reilly <marc@cpdesign.com.au>
---
 recipes/qt4/qt-4.7.1.inc                           |    1 +
 .../0010-phonon-gstreamer-rgb-endianess.patch      |   23 ++++++++++++++++++++
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 recipes/qt4/qt-4.7.1/0010-phonon-gstreamer-rgb-endianess.patch

diff --git a/recipes/qt4/qt-4.7.1.inc b/recipes/qt4/qt-4.7.1.inc
index ef54753..be7275d 100644
--- a/recipes/qt4/qt-4.7.1.inc
+++ b/recipes/qt4/qt-4.7.1.inc
@@ -9,6 +9,7 @@ SRC_URI = "\
     file://hack-out-pg2-4.7.0.patch \
 	file://0006-freetype-host-includes.patch \
 	file://0001-Added-Openembedded-crossarch-option.patch \
+	file://0010-phonon-gstreamer-rgb-endianess.patch \
 	file://g++.conf \
 	file://linux.conf \
            "
diff --git a/recipes/qt4/qt-4.7.1/0010-phonon-gstreamer-rgb-endianess.patch b/recipes/qt4/qt-4.7.1/0010-phonon-gstreamer-rgb-endianess.patch
new file mode 100644
index 0000000..d43366c
--- /dev/null
+++ b/recipes/qt4/qt-4.7.1/0010-phonon-gstreamer-rgb-endianess.patch
@@ -0,0 +1,23 @@
+--- a/src/3rdparty/phonon/gstreamer/qwidgetvideosink.cpp
++++ b/src/3rdparty/phonon/gstreamer/qwidgetvideosink.cpp
+@@ -18,6 +18,7 @@
+ #include <QApplication>
+ #include "videowidget.h"
+ #include "qwidgetvideosink.h"
++#include <gst/video/video.h>
+ 
+ QT_BEGIN_NAMESPACE
+ 
+@@ -106,11 +107,7 @@ static GstStaticPadTemplate template_factory_rgb =
+     GST_STATIC_PAD_TEMPLATE("sink",
+                             GST_PAD_SINK,
+                             GST_PAD_ALWAYS,
+-                            GST_STATIC_CAPS("video/x-raw-rgb, "
+-                                            "framerate = (fraction) [ 0, MAX ], "
+-                                            "width = (int) [ 1, MAX ], "
+-                                            "height = (int) [ 1, MAX ],"
+-                                            "bpp = (int) 32"));
++                            GST_STATIC_CAPS(GST_VIDEO_CAPS_xRGB_HOST_ENDIAN));
+ 
+ template <VideoFormat FMT>
+ struct template_factory; 
-- 
1.7.1



