Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 01ACB786BD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:34:52 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f3so13906619wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 00:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=nOLj8+odDcjba368BSP6bIXFN/32KHrN7JzhkK7NLjE=;
	b=Uap7Yny109ImApGxttd4SWZuQt5vD/wfB0kAGsa+t8Ob7W9gYN1k0O/up+mt9VeQfB
	lYo5FIsZdcEEYqe8EuHHx+6iJ541fy75CITWdpMf0APPct8eCjydfuqNAqlK3xU3FOmG
	2xd8tw0UW7gScxbp08SKY1fvn8AwWGocroZMQpCDpfzamlDoCpQerfpreQFDu6kzVfYo
	q3b1WxyanYWLlxrpYQi8BT1nTU064s1cgrJ2KpXHn8esIzmbC1Etix0JywQXTlPW47r5
	ix+Kdibg945rAPFyHwEwKEYxa45wOAhE42zYRZr+bRIMIlUgCt4N6N9kYgiXnh3iKBRv
	R7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nOLj8+odDcjba368BSP6bIXFN/32KHrN7JzhkK7NLjE=;
	b=F9/YIblqhYI4is7zq5v9M35c4AWTOYbsQl/uXPBhwpJXCOSc6OY+U/xeCVIODy1vgU
	wL1x3eJqpnMsHaWlhHTNhgvqSCFlx+gJt+lrRTp5CFC3DwZF73BFTy7lz8XbUUnxmq3V
	UrQawDuvIye2kvmjADc/OPm85eeVqgUMU9MlldLe/xcwhJ1/T8Y+GomUx/u0ZjqeOK9z
	+m+j3mVXoHlqKkARoI2sY63VSSxBpdbYJ4bZBGD0UMVYWy+INJBnk0rpJ/YzbuRXqpXp
	g9MKIpcehyggcr1yASv8l6j30SG3VlF93OcN2aZ8rAERUtUHgLhPFV7M8hHCdZ245iL7
	vXKA==
X-Gm-Message-State: AKwxytc1SWhNl3A+V/Z8LrXSFSpHkCjke7ffCQBSeMsnZyG86mitilHf
	7rx5n0okNtWVwhdwi5/TgOqVvg==
X-Google-Smtp-Source: ACJfBovqgImW4VrcPV4Nq0CTEmGiL8APuEfThaXkWl9PwjPgq9MOeSB/Z/lWdds88df75ybUKG/kqg==
X-Received: by 10.28.143.204 with SMTP id r195mr1294383wmd.22.1516178093911;
	Wed, 17 Jan 2018 00:34:53 -0800 (PST)
Received: from localhost.localdomain
	(ip-88-152-110-191.hsi03.unitymediagroup.de. [88.152.110.191])
	by smtp.gmail.com with ESMTPSA id
	c54sm4230832wrg.68.2018.01.17.00.34.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 00:34:53 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jan 2018 09:34:10 +0100
Message-Id: <20180117083421.30233-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180117083421.30233-1-schnitzeltony@gmail.com>
References: <20180117083421.30233-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/14] xfce4-pulseaudio-plugin: update 0.3.3 -> 0.3.4
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
X-List-Received-Date: Wed, 17 Jan 2018 08:34:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...e4-pulseaudio-plugin_0.3.3.bb => xfce4-pulseaudio-plugin_0.3.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.3.3.bb => xfce4-pulseaudio-plugin_0.3.4.bb} (73%)

diff --git a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.3.bb b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.4.bb
similarity index 73%
rename from meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.3.bb
rename to meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.4.bb
index c8eaa1c3b..32032a26a 100644
--- a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.3.bb
+++ b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.4.bb
@@ -8,8 +8,8 @@ REQUIRED_DISTRO_FEATURES = "pulseaudio x11"
 
 DEPENDS += "pulseaudio"
 
-SRC_URI[md5sum] = "d3d3e012369af6d2302d4b70a7720a17"
-SRC_URI[sha256sum] = "d6aae9409714c5ddea975c350b4d517e078a5550190165b17ca062d0eb69f9a6"
+SRC_URI[md5sum] = "05633b8776dd3dcd4cda8580613644c3"
+SRC_URI[sha256sum] = "43fa39400eccab1f3980064f42dde76f5cf4546a6ea0a5dc5c4c5b9ed2a01220"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[libnotify] = "--enable-libnotify,--disable-libnotify,libnotify"
-- 
2.14.3


