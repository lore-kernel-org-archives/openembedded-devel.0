Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4EF1F74A51
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Apr 2018 22:03:21 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id s12so11017624wrc.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 15:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=eOzXCu12dAr+WyrSnwUp+UcnJguyVxVQMay70xTEidM=;
	b=QNmNvLiaIO2XpRzXKexoVgblvivHKi/hZ4CY/qQmRu8EOebPQoFdeiB1+2n+xMzu5h
	piRSFFbH8Vx9rTVXiyBICMuWHhMM3spADSewNMQ63CmNnf87KOMHPjGGWsFDhuDF0w5j
	SIeggkqDX4UeoHfGGOt5/zi1uOxCOm5kBXTpC52qEt7oQrol8AB30IZD/M+pkulqgwM3
	220XhhQAeaB+a+yjx14yYZdyNqoowdALfQW9mMuiRpSsWi28Aw32yveg3cexmiWEs89g
	4gehZ2gQ/1ARrpWy7F10y3daPrr3suWtIAeuigi2gwSxJwX2KI61fKSMizeOjtZTUlT9
	BjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eOzXCu12dAr+WyrSnwUp+UcnJguyVxVQMay70xTEidM=;
	b=mkiSb1S+zaS1phged7sRtCvdqOxJfkvFmwAGQiadHfd9Ym1gvZjdoCcOtKxTw+zRCU
	JELWQQ5zvcDNwF1hQYu8iT3kxK3GTIFVJCjfbBu9cikB/LXA0LgJ5WWlUwcy8vBKnzIx
	pnyELOWzT6TEuys2zP3t7pq+fHD9s3TX/Iz5i8eJxO3td3IBTg+WHHM8ejQkP44+DoAZ
	KTiY+7f3BHUKMk7SEv2hY1Bf5I8c9iBSIQ6DXf3ooGGYtsu4jc2WcP5hz/EcOPnLYfts
	W9aQ9FCNehh+AAyqiq9tk5T/gW85NEnseSQ50lcVElXhl74amXX1oZ1MznoPWbZLPyA6
	keCg==
X-Gm-Message-State: ALQs6tArNJ0ULZ3dStSfZ5g2vW1L6u/cSYCb4j0JYSs7K3Z4N9hBqRcX
	Ab6ix7XMFjvqDLEBqJ1Yse5q9A==
X-Google-Smtp-Source: AIpwx4+AiKmEsXkHlkQNZrdi5ZPl6Txecb89oYJvp6pQoRndGgMoHif9Kcc47ULJN6bDvlc7XwZYrA==
X-Received: by 10.223.198.68 with SMTP id u4mr1013516wrg.186.1523311401893;
	Mon, 09 Apr 2018 15:03:21 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC14F231E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:4f23:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g185sm650954wmf.40.2018.04.09.15.03.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 09 Apr 2018 15:03:21 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Apr 2018 00:02:48 +0200
Message-Id: <20180409220249.11796-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180409220249.11796-1-schnitzeltony@gmail.com>
References: <20180409220249.11796-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 8/9] xfce4-whiskermenu-plugin: update 2.1.5 -> 2.1.6
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
X-List-Received-Date: Mon, 09 Apr 2018 22:03:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-whiskermenu-plugin_2.1.5.bb => xfce4-whiskermenu-plugin_2.1.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.1.5.bb => xfce4-whiskermenu-plugin_2.1.6.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.5.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.6.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.5.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.6.bb
index 4aed9902b..762cff0f6 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.5.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "9bb98425d45b027e7a35905d07b0cbbc"
-SRC_URI[sha256sum] = "20684ffe014b84d3d0630bbfcc5f8707582acb67b602ab7ef6317df6782df2b4"
+SRC_URI[md5sum] = "b2b2bacc8d5f3c3119a0f317b6074276"
+SRC_URI[sha256sum] = "8b2a8ee1445df39a2cda139e353f2e9ec3720a780296dc41b7d4aebde57371fc"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.14.3


