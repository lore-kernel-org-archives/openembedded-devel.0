Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4C18974723
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:26 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id m13so8076032wrj.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=01/Cmvx6dxXnxOhT15fMtL/Nu3f+Eym8Fdp5ofpDxXE=;
	b=qj/k1BcqasFib1pPbWI3eUEeJjdnoyjx/67AW5e21rGR9kYrF7NN6gpBwCW12p62Zb
	AMUFUYA4+Yr71kSSn65h8PxQlqucajsiSt/QtDUX+Q7HzfA1wl1/TwxHWe87jNUUuq8T
	AX6sST4Guf715oN0Cx2pOh5AJfcsqJreXT6a36NOIEBY57IJeM1hXS88XWOtO25DZAcC
	uf9J2r7FKauEPeUUbtmiZw/0RH5W4alZj09N6OXv96ufvOUgMLVM7U4J2dUw8JnyZonB
	Kzfp0J1GWvMAVkcClpjDRy1oppokGV7QkAFtBBlD7K8ZfRB19WDj/0om1oVppFUDX8u1
	ZQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=01/Cmvx6dxXnxOhT15fMtL/Nu3f+Eym8Fdp5ofpDxXE=;
	b=dBeIahdP0MLfOBkUwpaU6al/y1gAYIGuFBuy+MpBYab80o5kbhR8KaiqL6ZnYkGKxW
	MYHtX6rpGs4h/0jUvUwEtDP/u07ElKx+0t3oD062BUtKCOle5dxgoDgjiRPiPFa5NPNy
	5O3ojHOmzyyHSgkriP6IpstKyiDdh17vrqmw14GUNd5GD2GtUI+a7IcyocejP50nEPdH
	LhswmlBj0pD3OMoXOHih9ONEkNdgmt0TuejZQch+Z6q8SNFIAA5LRi0xEvoulvKm/LyD
	jXeyKL2o7JEMD9QtxqPfx+GwndeSr65g5NzYnfJLWqDI5uvzdeXLw0MjijFuUKkLaRXU
	HWrg==
X-Gm-Message-State: AElRT7Ejn2ZbvkP+T32e94NPOc2eBOP1EJCXkFA9LKqyuNh7aPLSb+X7
	4CWXcmS+WWaW4Aeb/YqOKRdg/Q==
X-Google-Smtp-Source: AIpwx48NDnOA6bWtYcqr7rDUHwDUFfaPQOfrSXWvXh4mTUnhTT5phaCxCTivvY4HTW/9PNbRwW37TQ==
X-Received: by 10.223.164.142 with SMTP id g14mr9432212wrb.18.1522416746982;
	Fri, 30 Mar 2018 06:32:26 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:26 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:34 +0200
Message-Id: <20180330133151.25882-23-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 22/39] xfce4-pulseaudio-plugin: update 0.3.5 -> 0.4.0
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...e4-pulseaudio-plugin_0.3.5.bb => xfce4-pulseaudio-plugin_0.4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.3.5.bb => xfce4-pulseaudio-plugin_0.4.0.bb} (73%)

diff --git a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.5.bb b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.0.bb
similarity index 73%
rename from meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.5.bb
rename to meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.0.bb
index a1d60c527..f5417a1a1 100644
--- a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.3.5.bb
+++ b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.0.bb
@@ -8,8 +8,8 @@ REQUIRED_DISTRO_FEATURES = "pulseaudio x11"
 
 DEPENDS += "pulseaudio"
 
-SRC_URI[md5sum] = "30cd40be36895c4ced48c2433ff440c4"
-SRC_URI[sha256sum] = "25e7bc414edf6e16140c31ca4e7dcedd4e17d40ea23a2921beb799fed11a99bb"
+SRC_URI[md5sum] = "12f3dd97e02c604e2023b5baf30d4a6c"
+SRC_URI[sha256sum] = "aef9ad68a0b604a6aeca4c08146f3eb42bedb4fe1c8b65b82679cec0e2fc1cb3"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[libnotify] = "--enable-libnotify,--disable-libnotify,libnotify"
-- 
2.14.3


