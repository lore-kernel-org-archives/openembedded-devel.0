Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6E6B5752A7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 16:14:29 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id x12-v6so28036408wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 09:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=zkdhyjAJWjaXBXatYXjdZAFW2vjAG5UPc68B2s2nM58=;
	b=Sh7uVUImpKxlnkXb6EXcDyN7T08oG29/f98mHMSN2N/1ZoBjOZuLaQzmZLnnP93Eqs
	/Q2W8cft2VnLlCfVHKtfSQyiC9+C9AYHrDAgYyQJEwEYbzOdCTBytSlft0ZlwanpdAwY
	x8lzJJHq9SuiNwWeKeowdVLaLTbyZUdr86HQcJFInnRK3PF7svNcoGbaR5HtiZX+OTve
	BdmERgoqut6YtPnVEjISQKlMyIRKy+GguOlwptE0wadtry5bCprWvEdJQCtb4ew9suzi
	nb2Y6UKtTBQNr2tM8hWzGkkxl8bFTzeI1mi0TzapYTwDEFgRxARM6Ku2QPjI7Zk13UGX
	gvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zkdhyjAJWjaXBXatYXjdZAFW2vjAG5UPc68B2s2nM58=;
	b=M7e++KyuRUQUWWAcOukxvnwW/DfeFiYulVX9/CEU2AaYz4sic98pujb0i5xxYhLbbG
	h915f0sfAPW5OaUUJEXqKDo8bAAd9HhPGtnPnXPrG0lddGUuv1U26gKxSO8Aiy8+c4aR
	GtoqEtdDy7T2Rt12p/OrVghJkstqKax1g84Dhfgh5wURgfuEwXS0zjeRmu659BlwdOGy
	KLQu/4A9QVG4qemeC4SCSCxvAqBU8Ehf04ZMDVLR2U4vOjTMgizpFjRqjAFCZlQErZTZ
	9nIZUrkRClxge3lv8f6KSFEFrB47N9M+ggEi+tcpP+DCggxt+kzRIBygnDv/in5NaqQ/
	UEVQ==
X-Gm-Message-State: ALKqPwdWNO0rWiXotc7aTNKAyCaZn0EFPIYlTcjL1B9yIYzpeSsvRJkO
	i6dWFS8Hs+QlOdq833UOmu8gCA==
X-Google-Smtp-Source: AB8JxZrtnI2asi43ig7wqQaSAhgUl2lcjLsaT7W3IGFaLB/+kCPR5bRDmoPfb2ycOFfyoDhzmVcjNw==
X-Received: by 2002:a1c:1c55:: with SMTP id
	c82-v6mr1725636wmc.69.1525968869798; 
	Thu, 10 May 2018 09:14:29 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC0732689B6120586BBC15E.dip0.t-ipconnect.de.
	[2003:f0:7bc0:7326:89b6:1205:86bb:c15e])
	by smtp.gmail.com with ESMTPSA id
	f143-v6sm1679595wme.43.2018.05.10.09.14.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 10 May 2018 09:14:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 May 2018 18:14:14 +0200
Message-Id: <20180510161415.12827-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180510161415.12827-1-schnitzeltony@gmail.com>
References: <20180510161415.12827-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] xfce4-pulseaudio-plugin: update 0.4.0 -> 0.4.1
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
X-List-Received-Date: Thu, 10 May 2018 16:14:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...e4-pulseaudio-plugin_0.4.0.bb => xfce4-pulseaudio-plugin_0.4.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.4.0.bb => xfce4-pulseaudio-plugin_0.4.1.bb} (73%)

diff --git a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.0.bb b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.1.bb
similarity index 73%
rename from meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.0.bb
rename to meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.1.bb
index f5417a1a1..b42370764 100644
--- a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.0.bb
+++ b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.1.bb
@@ -8,8 +8,8 @@ REQUIRED_DISTRO_FEATURES = "pulseaudio x11"
 
 DEPENDS += "pulseaudio"
 
-SRC_URI[md5sum] = "12f3dd97e02c604e2023b5baf30d4a6c"
-SRC_URI[sha256sum] = "aef9ad68a0b604a6aeca4c08146f3eb42bedb4fe1c8b65b82679cec0e2fc1cb3"
+SRC_URI[md5sum] = "7df7280c19c2c8b8c5bc4f4f2136d1dd"
+SRC_URI[sha256sum] = "6ca88314dbac3e24c0e1bfc593fad6edb66319766be62e8256c81b0314f049f0"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[libnotify] = "--enable-libnotify,--disable-libnotify,libnotify"
-- 
2.14.3


