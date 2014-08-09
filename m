Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id E3C5A70A78
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:55 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id t60so6896058wes.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=G5kgZ0Y6PmqD+vHUlPfZG/phPJEIjdIDIVOvjpcs+k0=;
	b=TcLYmxMU4UQIbYJjSpnE20FLUjT/luBzMW9cmJ+nz/QNm6yRx/k+bJH6GozRKQ3dO1
	3Bha8U6r+Gthf0VWCImO4YOKnPfkGpBXOMCnWHCUQZ/KwCMJ9CGT5XjdSogJqg8K2cA7
	pp7IT40ViQ+WcL4vDvHqVNfsh/LCRCv7ODHJdY4aVYnb+R1sNU7xmfDb5dr9HL0Tft9A
	KkmJayE/ZUtzU7VA5QFwoqhrJaPtVa0iHw6c4L5gwRqf8v0ZPrE/eC0LvC+7pQPMrzhb
	RLU9WIwC+lEccGhcLwel3GilQrDow7qt2PM9hl30DHXdVhk26Nyp9wyW07PdCIkoYrw0
	4DFQ==
X-Received: by 10.180.19.200 with SMTP id h8mr11863796wie.32.1407600536924;
	Sat, 09 Aug 2014 09:08:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gi15sm25534218wjc.20.2014.08.09.09.08.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:45 +0200
Message-Id: <1407600537-10857-24-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 24/36] openbox: remove unrecognized configure option
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
X-List-Received-Date: Sat, 09 Aug 2014 16:08:58 -0000

* fixes following QA warnings:
  openbox-3.5.0: openbox: configure was passed unrecognised options:
    --with-plugins [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb b/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
index 24407b0..7c1d4a0 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
@@ -24,8 +24,6 @@ PACKAGECONFIG[xrandr] = "--enable-xrandr,--disable-xrandr,libxrandr"
 PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama"
 PACKAGECONFIG[xcursor] = "--enable-xcursor,--disable-xcursor,libxcursor"
 
-EXTRA_OECONF += "--with-plugins=none"
-
 PACKAGES =+ "${PN}-core ${PN}-lxde ${PN}-gnome ${PN}-config"
 
 PACKAGES_DYNAMIC += "^${PN}-theme-.*"
-- 
2.0.4


