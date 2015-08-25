Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3887E759CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 05:41:02 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so3843411wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=66GqpDsTqSIoKfY9OTNtM7+qxY99caKkVucXYO9A0gc=;
	b=EjujhTF3KLP2IJQw2g5ZE96XuCbfG1+Jxk+uIl2BgN2x7mwatpxozHM0ftAUZBuxKh
	0q3QEBb/Y3FHlCHeHsft/+qx15OWfIgY4hnZwF0Sp627z77cpc4kH0avSpY0bPS/4qgW
	AgjRsWfjSsBa/vFfPp0YgQsALzPqqxjdLtQkQv1E9xCbJtC5qc+MZfTiNdbAfEHtv7JN
	97GnB0+8N4IQXvTx7KwDLi/ssdz4Scapd3Mdmzm0QT+N24D6ImKjLA+g4KQQHjZQKXn7
	xyaKvjBYkiJogd9r9vALl4hf45EW9tXOpQzE8/m/YHbQ+CHaEFu54nZu6hcmJPX+WCVf
	q5Vg==
X-Received: by 10.180.189.17 with SMTP id ge17mr1573347wic.90.1440481262598;
	Mon, 24 Aug 2015 22:41:02 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0EB5.dip0.t-ipconnect.de.
	[79.223.14.181]) by smtp.googlemail.com with ESMTPSA id
	y13sm26267680wjq.26.2015.08.24.22.41.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Aug 2015 22:41:02 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Aug 2015 07:40:46 +0200
Message-Id: <1440481251-22440-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1440481251-22440-1-git-send-email-schnitzeltony@googlemail.com>
References: <1440481251-22440-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] gtk-xfce-engine: create and pack gtk3 themes by default
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
X-List-Received-Date: Tue, 25 Aug 2015 05:41:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

we already have some gtk3 apps in a typical image: xfce4-pulseaudio-plugin,
network-manager-applet and xfce4-power-manager 1.5.x will come soon to
meta-xfce. These are using gtk3 themes (which need love - but this is a
different story).

Without this patch loading Xfce gtk3 themes causes complaints for missing
xfce theme engine.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
index 6feb4bc..b9835ab 100644
--- a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
+++ b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
@@ -9,8 +9,8 @@ inherit xfce
 SRC_URI[md5sum] = "363d6c16a48a00e26d45c45c2e1fd739"
 SRC_URI[sha256sum] = "875c9c3bda96faf050a2224649cc42129ffb662c4de33add8c0fd1fb860b47ed"
 
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3, gtk+3"
+PACKAGECONFIG ??= "gtk3"
+PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3, gtk+3, gtk3-xfce-engine"
 
 PACKAGES += "${PN}-themes gtk3-xfce-engine"
 FILES_${PN} += "${libdir}/gtk-2.0/*/engines/*.so"
-- 
2.1.0


