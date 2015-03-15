Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9AD2F60034
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:16 +0000 (UTC)
Received: by wgbcc7 with SMTP id cc7so27058677wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=hEYA95KEofJvk/jJpd6HKo5hWRFJpiGGnvbJT7G+HnE=;
	b=nZa5dELM3oTrXjusmPncQPm67aO53183GY2o+02xb107yW1djgVoBlLOvMbYVIYIae
	1xKPs4d55M6Gg4TqEZnoiySRGmVvxkap6D+51lIv+BAyZXkcET/jJmLRsgUY+TZHcfTK
	RQhCuUfcsYnyPkKRP27ft01qyv5XhUSjlolnZTzJtjznvIUPbMtjXqvPuSTtlnuyImT7
	SfzXhI53fR4EPsFjD+AVL1hmQZdaGFhFs3S8iich/RXIL9Qrx5C5tzHZeG8WxoZHn75h
	spMV/DJk5IeRY+90BTDD7Hn+gVNVP8jKoIBnc9U1TExlbOS2NzClzvoSq2pshp3akraL
	EOJw==
X-Received: by 10.194.172.9 with SMTP id ay9mr116027898wjc.2.1426462457434;
	Sun, 15 Mar 2015 16:34:17 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:26 +0100
Message-Id: <1426462419-10173-18-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 17/30] mousepad: update to 0.4.0
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
X-List-Received-Date: Sun, 15 Mar 2015 23:34:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../mousepad/{mousepad_0.3.0.bb => mousepad_0.4.0.bb}            | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/mousepad/{mousepad_0.3.0.bb => mousepad_0.4.0.bb} (66%)

diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb
similarity index 66%
rename from meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb
rename to meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb
index 4947531..4c8c1f5 100644
--- a/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.4.0.bb
@@ -10,5 +10,10 @@ DEPENDS = "gtk+ dbus dbus-glib gtksourceview2 intltool-native xfce4-dev-tools-na
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "dcfcdfaa8a19c89f35d5f6f64753e6e1"
-SRC_URI[sha256sum] = "10f27506994d0d0b8f9e02555404a144babedab97517abe3b6be8b2d21ff046d"
+SRC_URI[md5sum] = "f55314c5dda6323883241e6cf01550a7"
+SRC_URI[sha256sum] = "60114431eac8db6bb6ce18bd38f1630cccb684375b97a445a1b6fd619848d132"
+
+# we have no gtksourceview 3.x around
+EXTRA_OECONF = "--disable-gtk3"
+
+FILES_${PN} += "${datadir}/glib-2.0/schemas"
-- 
1.9.3


