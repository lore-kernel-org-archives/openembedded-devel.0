Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id E46857F2E3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 21:56:27 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id g17so3528110wrr.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 14:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=OEoMTx3k01ElSQTqWqIdocvYyKyETkmbRCERe64iUsQ=;
	b=ZkLACDvsT4m3rw6EnycYhskETm+TCAYcreoV9/6FKReDiX3MvxL46rYbTkNtfuJByW
	0U99PMrn2LHGnpf+rGfiZMcDTbat5u0QdGwQ5uIY2pHUIT+Ic1F9XX97VFXg0Z8uHySj
	1zJm7Soke73A6QNinTfMXv1USW0UrNZhjBMuXx/ByiVm/LvNWSLyqCkR/8DLOoj0/Cx0
	So21oj79VD65/Im0GHU3la9aasQ2dhYl/iZ6oinHzH8h4JPXK3qDwb15uG9sDypF6nUq
	FTQHKC/WNEFmsZjE62GMQ53XP1L5pPqI7rMbFSIm6T17fD+IXUds7hky/BF23TySdOG6
	6TMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OEoMTx3k01ElSQTqWqIdocvYyKyETkmbRCERe64iUsQ=;
	b=SXGC5SIId94u1HYjLgDV+sRXOozv3CYV3ic0X1maOhLa3F2vufcYWBrUbsoM+elHFK
	KVmknjKrZqpYa9ASux8Hbifww7+b6YDEu+j4aQibinfFacLXLOAuSvmPeECD/Ym5+8wG
	bsmqGPXzxp8+IbbwepqDVn15tO0xagOhXIZBsT2vSfly611iSmxpWT0G1d54wTkut4bU
	HFyi74TKP7pA9UQZULov76Zry9l6HvzOWfmQ2Ras+LKzn9ZdsSZjepuet7rl9gRIFBjm
	mrf/GfNUvRGMvtjARNs+MCda8nwlRjTQ8galo0rIF2t1OzewNEzu35cBbrAHKBVEc4+W
	vsaQ==
X-Gm-Message-State: APjAAAU/7Pcrqf7KXTGAragtqVmp8Co2vM5PgpAFg2wl/LQ83JwR3kXp
	4SDWt73acHG0jUI4yJu7w2rdnxkA
X-Google-Smtp-Source: APXvYqzlA4hNBLEqBgrPwj/alriWwe3xa/doclN8+wsIxlZPNRGypDNr1tzJhy54NDSRWjIEJNlctw==
X-Received: by 2002:a5d:4250:: with SMTP id s16mr7324065wrr.318.1565906188311; 
	Thu, 15 Aug 2019 14:56:28 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F042332D9169E9166842542.dip0.t-ipconnect.de.
	[2003:f0:7f04:2332:d916:9e91:6684:2542])
	by smtp.gmail.com with ESMTPSA id
	h97sm10555192wrh.74.2019.08.15.14.56.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 15 Aug 2019 14:56:27 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Thu, 15 Aug 2019 23:56:05 +0200
Message-Id: <20190815215605.19600-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815215605.19600-1-schnitzeltony@gmail.com>
References: <20190815215605.19600-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 13/13] xfce4-pulseaudio-plugin: upgrade 0.4.1 -> 0.4.2
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
X-List-Received-Date: Thu, 15 Aug 2019 21:56:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

More or less a translation-only release

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...audio-plugin_0.4.1.bb => xfce4-pulseaudio-plugin_0.4.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.4.1.bb => xfce4-pulseaudio-plugin_0.4.2.bb} (74%)

diff --git a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.1.bb b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.2.bb
similarity index 74%
rename from meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.1.bb
rename to meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.2.bb
index 63da1e09e..8b8f5f21c 100644
--- a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.1.bb
+++ b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.2.bb
@@ -8,8 +8,8 @@ REQUIRED_DISTRO_FEATURES = "pulseaudio x11"
 
 DEPENDS += "dbus-glib pulseaudio"
 
-SRC_URI[md5sum] = "7df7280c19c2c8b8c5bc4f4f2136d1dd"
-SRC_URI[sha256sum] = "6ca88314dbac3e24c0e1bfc593fad6edb66319766be62e8256c81b0314f049f0"
+SRC_URI[md5sum] = "9a34eadf06ed217ec0732a096f178987"
+SRC_URI[sha256sum] = "4ae8aebc2458675d4f885bf16f73829be359e16370a684301bbef6a23758a120"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[libnotify] = "--enable-libnotify,--disable-libnotify,libnotify"
-- 
2.21.0


