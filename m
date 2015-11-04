Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4C81460125
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 17:30:41 +0000 (UTC)
Received: by widen16 with SMTP id en16so526705wid.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 09:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=RyljvuLnDDkbfBYlSHUkF+4Ov1cS78qYAIEqgb8j3gc=;
	b=MtOLVIOAAnAMwBdsyjzsmKKTE/h0FYYOEqT2CjHHNEKhoqqvjyfkmbhDmgdXKE7hqm
	d/D2kbQhRYuMSoZ/ZHEpzBDU/cZ1tmdL32TxikKyfT6veGUpAtXqMpGp1QdtdIZEXvIP
	sFwwlE+GAOF5odKcOupR+EtpMhRJd0TCveRJfa8UYV4yOms/b9OL7QFuBNDNc46T2G4I
	PtcpHnbZ3+3wnhfL+25YwrkoSkfAV08Phaz4Mbwjcjn67sfwqDxj0gmHTKDjvHHvipwb
	6BAEPxaggH3PPBWp9MCSsoqK1N7jj4jt4x5aTh0+m0Eo2sKLX2bnq9rh5kylljUz4LHI
	V4YQ==
X-Received: by 10.194.71.50 with SMTP id r18mr3243544wju.16.1446658241766;
	Wed, 04 Nov 2015 09:30:41 -0800 (PST)
Received: from localhost.localdomain
	(ip-95-222-156-185.hsi15.unitymediagroup.de. [95.222.156.185])
	by smtp.googlemail.com with ESMTPSA id
	l78sm29767529wmb.5.2015.11.04.09.30.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Nov 2015 09:30:41 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Nov 2015 18:30:08 +0100
Message-Id: <1446658209-27822-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 1/2] qtbase: add glib to PACKAGECONFIG_X11
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
X-List-Received-Date: Wed, 04 Nov 2015 17:30:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

configure script disables gtkstyle if glib is not set. See configure section:

| # auto-detect GTK style support
| if [ "$CFG_GLIB" = "yes" -a "$CFG_QGTKSTYLE" != "no" ]; then
| ...
| elif [ "$CFG_GLIB" = "no" ]; then
|     CFG_QGTKSTYLE=no
| fi

for more details.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index ecaccd3..0ba8ac8 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -42,7 +42,7 @@ RDEPENDS_${PN}-tools += "perl"
 
 PACKAGECONFIG_GL ?= "${@base_contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)}"
 PACKAGECONFIG_FB ?= "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
-PACKAGECONFIG_X11 ?= "${@base_contains('DISTRO_FEATURES', 'x11', 'xcb xvideo xsync xshape xrender xrandr xfixes xinput2 xinput xinerama xcursor gtkstyle xkb', '', d)}"
+PACKAGECONFIG_X11 ?= "${@base_contains('DISTRO_FEATURES', 'x11', 'xcb xvideo xsync xshape xrender xrandr xfixes xinput2 xinput xinerama xcursor glib gtkstyle xkb', '', d)}"
 PACKAGECONFIG_FONTS ?= ""
 PACKAGECONFIG_SYSTEM ?= "jpeg libpng zlib"
 PACKAGECONFIG_MULTIMEDIA ?= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
-- 
2.1.0


