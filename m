Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id B217161C42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2020 14:21:48 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id a25so7741002wrd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2020 07:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u9iIuHhyrCPMxEvKdZuDxSRNDFCmkfnWJTs5txNqalM=;
	b=kUG7Y3cIk1WICmhXXh77WShGRD/ZY385m/f/ENkMfzYD+BE4ifcjEZJzyS92sFI1zK
	eL/WxazmjFbS1qganxl3yxVckmu3HXoCO6nJb8sKZexyno+RGYG0TiMiRnyFrcvLMcDa
	UKhWO8a00vgRIUwpg5BcEUvv13dl7f63BeKavKzXijf8IahGLzXAkw1GDb61/IZZv63O
	AjLYVFLmDThRzVtxFGPAWyZ8tIgN1USDTfB5obbehqL7PgHlI1R0R0Z0G3P3/h7SFeJN
	YcYH72bgmI0LA3rC/qD5LZdKddixE0mDVt5PPjeK37lTGMUMocIcfLAuqi6kwfNXvkTJ
	4syw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u9iIuHhyrCPMxEvKdZuDxSRNDFCmkfnWJTs5txNqalM=;
	b=d7lCdrLC0R2dA1jJ8EBrvmcc9UtadHCV+Qf2IKrjTNWhWdCUEupBgxv5V+ZXAOWTeZ
	+FlqT6fA2am4s6uiKJeD+/1r/QlwwZgpemaQkpdnAdDlhQV9runzF9TyP083I6FFy0J8
	saJI7ImxqoGvAylof29HnKL95K4MrwPYarhK5++Zj3/qHfhs266gvO/TSkHcFgNrZSm4
	dD/9PZT8hh+X4Is9FIMoZuJ71zs52Sgs2dnJp0HuhoAU8RxqAu3/ygpz0vBZ61/our7m
	WB3L/g4AHqzmatKD6A5VI/U6kjP9ZzVHc7DdoWMBNV2li8GUbshEJFggs/WzKNToiCg7
	gWUA==
X-Gm-Message-State: ANhLgQ0S6R92ZylFq1+hB7a5RX047fn9T9Ri5wlscw87rWxNeDAAt8Ko
	7b5BKrUNgtV/4lYanPbhEGRQuqg7
X-Google-Smtp-Source: ADFU+vvXGU8AxjUYhW+dzlNqjH+WWLGcydOzLP7GCkbVJ4pYEx9nDZpY7wSAUdl0eH4xA7GqNcdk8g==
X-Received: by 2002:adf:b641:: with SMTP id i1mr11315456wre.18.1584022908932; 
	Thu, 12 Mar 2020 07:21:48 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F067F32CE0B3214CDB29793.dip0.t-ipconnect.de.
	[2003:f0:7f06:7f32:ce0b:3214:cdb2:9793])
	by smtp.gmail.com with ESMTPSA id
	r12sm20974339wrx.26.2020.03.12.07.21.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Mar 2020 07:21:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Mar 2020 15:21:38 +0100
Message-Id: <20200312142140.5926-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 1/3] xfce4-clipman-plugin: upgrade 1.4.3 -> 1.4.4
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
X-List-Received-Date: Thu, 12 Mar 2020 14:21:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.4.4
=======================
This is a bugfix release.

- settings: Improve layout
- settings: Drop some GtkStock items
- Update support URLs from goodies to docs.xfce.org (Bug #16141)
- Drop deprecated Gtk style properties
- Also show desktop file in Cinnamon (Bug #14058)
- Fix getting modifier in gsd-clipboard-manager (Bug #14642)
- Fix typo
- Translation Updates:
  Albanian, Armenian (Armenia), Belarusian, Catalan,
  Chinese (China), Czech, Danish, Finnish, French, Galician,
  Hebrew, Icelandic, Italian, Kazakh, Norwegian Bokmål, Polish,
  Portuguese, Slovak, Slovenian, Spanish, Turkish, Ukrainian

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-clipman-plugin_1.4.3.bb => xfce4-clipman-plugin_1.4.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/clipman/{xfce4-clipman-plugin_1.4.3.bb => xfce4-clipman-plugin_1.4.4.bb} (76%)

diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.3.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.4.bb
similarity index 76%
rename from meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.3.bb
rename to meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.4.bb
index a1ac05729..164895013 100644
--- a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.3.bb
+++ b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.4.bb
@@ -8,8 +8,8 @@ inherit xfce-panel-plugin
 
 DEPENDS += "xfconf xorgproto libxtst"
 
-SRC_URI[md5sum] = "fa0acd5f5e3298e56ebd47d2944cd02b"
-SRC_URI[sha256sum] = "29cdb85efb54bd5c9c04cc695b7c4914d6dff972b9fd969cbfb5504e9c632ad2"
+SRC_URI[md5sum] = "104c917ef53a66f7aa2dca01b43c3b77"
+SRC_URI[sha256sum] = "08e14c5d0fcee9adb4bc77efc0ab4af2b12b3fe1ee5e2121fc60e877ac9c29a0"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[qrencode] = "--enable-libqrencode,--disable-libqrencode,qrencode"
-- 
2.21.1


