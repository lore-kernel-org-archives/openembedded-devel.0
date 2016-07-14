Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A40E86AC4B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2016 16:22:19 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i5so9597937wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2016 09:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vRumtWKkUd6vCkRIeMnqtQfOgtwnndY1WZC+naCJCSQ=;
	b=Eb82UFZgtiXdQrP4lq/Lxl0d0C5OFQvyUacUA4/L6SqJHdo73bnU5DMR1HsYfQr/Ym
	ThmT6wnsJKveQdbSKKjx8/d5estAlzwhB9lKNu0GNA5VoOLHfnDvHC9U5R8jYo59BTaG
	U8CqSrfIh09kJ6ab5MQPvqE9oBajcXGAV2Qz+BSEDaWmcg7KXwx+WOttYXHXC80uqrJd
	BLRMNb4NaAgkY9R5VFd9g6a/Qqs7gkwtgJ+Q4nno0r48nm24ayM4wnQx1r+v97uwg7EI
	SY27TClI9u4MXUPz4LIc/rFHZeW1asFobvotdCuA04ejOZ2uKRpv049MWHo1LYshmFYW
	EXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vRumtWKkUd6vCkRIeMnqtQfOgtwnndY1WZC+naCJCSQ=;
	b=U1z5k5utpPH5aU7Uu8ZLjwFaljQGVRuQC/klKZEDX4kq8WHXdGOnvhSYvL8lgdAhs1
	J1Y/U0o1Ths8hGajhlKSd4PeKuV31H30eSe5UrPmZbUBrTerKRNqkSRIPwuXvQaUIto2
	MNIodnjYgJwjVqKQ1aavdfRgb3iurcBFwfUvEDfT3esg4xjWCj1uSUOCJbK1xRTa0aDi
	gUJyjadjkGcl9oziIgGCk0wb0JbvUDSIsJeLQsXkUVNkVuo6pH3GRpmx4rkQj7IlvcQ6
	z2atkzZVhqJC00vNpcEwokUtNYFIG95NtXFnTvNT7Ku1hmSG5O/ccVrucYWnh7FpAP3y
	QhVA==
X-Gm-Message-State: ALyK8tL4YH8xC+mW6GzFNqAnmWgnJudlFv6rR4X05utFbN4AOp+X3/P0zw5zu713Klqb6g==
X-Received: by 10.28.134.203 with SMTP id i194mr17033166wmd.22.1468513340274; 
	Thu, 14 Jul 2016 09:22:20 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	d64sm4712888wmc.22.2016.07.14.09.22.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Jul 2016 09:22:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Jul 2016 18:22:19 +0200
Message-Id: <20160714162219.13172-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [meta-oe][PATCH] lirc: inherit python3native instead of pythonnative
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jul 2016 16:22:23 -0000

* when native python 2.7 is used, do_configure fails with:
  checking whether sysroots/x86_64-linux/usr/bin/python-native/python version is >= 3.1... no
  configure: error: Python interpreter is too old
  WARNING: exit code 1 from a shell command.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb b/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
index 900b68d..7162fcd 100644
--- a/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
+++ b/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
@@ -17,7 +17,7 @@ SYSTEMD_PACKAGES = "lirc"
 SYSTEMD_SERVICE_${PN} = "lircd.service lircmd.service"
 SYSTEMD_AUTO_ENABLE_lirc = "enable"
 
-inherit autotools pkgconfig systemd pythonnative
+inherit autotools pkgconfig systemd python3native
 
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd"
 PACKAGECONFIG[x11] = "--with-x,--with-x=no,libx11,"
-- 
2.9.0


