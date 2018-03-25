Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4007B78682
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:35:37 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id u46so16217174wrc.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 05:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=01/Cmvx6dxXnxOhT15fMtL/Nu3f+Eym8Fdp5ofpDxXE=;
	b=WBk1Eqb7sU7dClzgKtCVLkNrMOUojXBia8+al2LzkQ/FMXujpomzRtO/4I9E5QpRTy
	WApPXHTZzM0JTHlFSsUVE1XyGmii15Z9GgO6jiegDHKNb0dO3mMvRGl260Nr16sRDJVo
	wbmmWZBtMvxrVSVrwxVFU/MBxquGfEtMwmpDkXuWs787mIJ4ejQk1TE7COBmNfXlV5Yq
	x4ikLdiDgOLPQPJbk0kdyS4qOpdqLkoVh+J45aTV5sRQu8z5CD7XWpcYM3V0/gVAzuu/
	dmol20E1ft6FIBvpWJCe5vRhH4tpt0zXRRXInU7DmRhTYKVfneZNN9v77XfOq4UCTGRx
	uSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=01/Cmvx6dxXnxOhT15fMtL/Nu3f+Eym8Fdp5ofpDxXE=;
	b=BvCo/5PqN4NsRivhWdOao3FZlDpciRLHUeSV6Y1YH+71yrh02hCSM3HUiEdoE1xUH6
	nbcHV9mhWow3UoJ8C4Icx9RIFYWjTpfw0xasJg9kNQnu81vlopjaW2PWOtJC4pJao/J1
	bj/woCWFgL9AtUmyVPgWGgcitBNiKCpeKv788J962G2hENKlODoOauHl8MbSmW46xKpd
	clLA+cmvVleaY9ChBlUri5uCnSK2JIFAHzENCgiUKilhPNfo6svq75gil/04du6lz7yK
	FHbG5fa5Gq5Bg0MYu6JDeqeni7JeVGn2bB/kl2d+a+l/G9+zaNKC7n5h46FFchfM2VoI
	9Z5Q==
X-Gm-Message-State: AElRT7FAJklrH3luHQz4NTaQI+HoTVCKTp3ZPULYO6u72e5RbKzPyj1G
	/Ak5f4KZpxyYniK45uH3rbT05Q==
X-Google-Smtp-Source: AG47ELvNEFW4VhDV8xV+LGGVwiaKADaGZoapk7FO5f0Mp5liYUr1/LViyvlWfPVUCvxsKyvNjCVoUA==
X-Received: by 10.223.136.13 with SMTP id d13mr27159943wrd.271.1521981337981; 
	Sun, 25 Mar 2018 05:35:37 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BCB3D681E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bcb:3d68:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v23sm11174719wmh.30.2018.03.25.05.35.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Mar 2018 05:35:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 14:35:06 +0200
Message-Id: <20180325123520.16452-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180325123520.16452-1-schnitzeltony@gmail.com>
References: <20180325123520.16452-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/20] xfce4-pulseaudio-plugin: update 0.3.5 -> 0.4.0
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
X-List-Received-Date: Sun, 25 Mar 2018 12:35:37 -0000
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


