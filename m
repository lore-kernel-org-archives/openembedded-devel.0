Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 920B86CF27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 10:40:29 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so1039019eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 03:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sddadf0vYMcdobFEGt5Tz7xZ+4BWZn98OxFobHXpL3w=;
	b=tMOyuyGZ0naM4HafRD6AWavaSvoq8BAIk+E6oOweJuNN2oFNFgvTCnq/a3Kp2YReXL
	O4cmCf1qgIUqz2n50iIlNlJbz4RoN5QWlip/VokoPteuKxhJn0SNVDRv59zlwaptrFuW
	ekJT77Zkyqy/drj/P1iZYNSpINyLge4zjdvtuHxlAmXAbFOU2s0HiGL9MXZubTcEJV3e
	yfIx6HgSZBwn/XkPGiFWGoF+35grJ14QbScc2JXhkEAKjBYSR61twjMoKvGfsGi6cO/9
	KU0LAYpR5QkB8LssreEJWMYwDJV+5nnqMtD5iksG1V2dZ83CbrU+Ct4v3nEnuJrLCrcd
	NWvw==
X-Received: by 10.14.101.6 with SMTP id a6mr1728503eeg.81.1381401631082;
	Thu, 10 Oct 2013 03:40:31 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m54sm99941531eex.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Oct 2013 03:40:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Oct 2013 12:40:39 +0200
Message-Id: <1381401639-20130-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1381401639-20130-1-git-send-email-Martin.Jansa@gmail.com>
References: <1381401639-20130-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 2/2] qtbase: Disable fontconfig by default
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
X-List-Received-Date: Thu, 10 Oct 2013 10:40:30 -0000

* it was explicitly disabled in
  commit 1b14686657cddcc5bb37a5c7db8a35f1c4903ee3
  Author: Philip Craig <phil@blackmoth.com.au>
  Date:   Wed Jun 26 02:13:02 2013 +0000
  Subject: qtbase: disable fontconfig support by default
* and then accidentaly enabled with PACKAGECONFIG changes
  commit ebdd83f6b7e5c3296e5ebd3b7b0c1e0defe5aba5
  Author: Martin Jansa <Martin.Jansa@gmail.com>
  Date:   Sat Jul 20 00:02:57 2013 +0200
  Subject: qtbase: explicitly enable or disable all deps
* Thanks to Nicolas Dechesne for reporting it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 559f54d..d1831a1 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -40,7 +40,7 @@ RDEPENDS_${PN}-tools += "perl"
 PACKAGECONFIG_GL ?= "${@base_contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)}"
 PACKAGECONFIG_FB ?= "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
 PACKAGECONFIG_X11 ?= "${@base_contains('DISTRO_FEATURES', 'x11', 'xcb xvideo xsync xshape xrender xrandr xfixes xinput2 xinput xinerama xcursor gtkstyle', '', d)}"
-PACKAGECONFIG_FONTS ?= "fontconfig freetype"
+PACKAGECONFIG_FONTS ?= "freetype"
 PACKAGECONFIG_SYSTEM ?= "jpeg libpng zlib"
 PACKAGECONFIG_MULTIMEDIA ?= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
 PACKAGECONFIG_DISTRO ?= ""
-- 
1.8.3.2


