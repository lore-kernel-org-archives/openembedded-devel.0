Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 11AE871DEE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:37 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u63so15683513wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=KFCqhuRpxntNRt287q7FF599ldRKxNwYdoJjIModc88=;
	b=T2pqEeyYa4U/3z8K4pUG+IDNrKKZ3POhw/fZWSAeeXQWhoKGbV7mLWuW1OnJnG6MPl
	TUxNrSH3BGZV8Ar7G5h4N+9sG5laJDnSBtpoasK5giv6bI6dGWoruH+t/as5JJm6aKMH
	oNLzh6GqG+jSpxmTqzWTW6nGz9qGmqxdEgw3BTtleoOjr8kOl09fL1AzE0EM12vRJ6XU
	wtFrs0QrvNSxWOxlTA3XX3vv9LyTqZYzysJqPx92jlWsYYJs/RTwGNY6sqYD97Mob16a
	VAsrr4lYnmuTBQwbS/BMyx7BGSr3BG+mF1yTDNlJILoL28hVW1ryHgoybyzbrok/i7H7
	h1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KFCqhuRpxntNRt287q7FF599ldRKxNwYdoJjIModc88=;
	b=jlQsQWMakmUGflPCbREHkNhNYi/kAvWJTL6FmmKpCw0/hVSBQWCdwLitytlLq0a8iG
	ev5MjlBIasSusmOPVgdKeXR2DaKJ0N5cKYyt/WGHhP9lfreHs4gCeezRJ9hrZiLZeub9
	TdgqdlehFckxKrxaDjQBZWck4mOyTXDoYzcqDrL9yX4zJcQ799eg9usOVWHttdrpCAoH
	E51V2s7oJvVu8M4v36lFbhBfla3GjW+vKRTEhKzkTVsTED0OYGAwBes4ogqBapHb6bRT
	AneRkL7Rqm4ifWiVthBY95h27EOIfMqB02zf2BtySP+tGFoHb5o3gTjtKIo753zzGch9
	KiQw==
X-Gm-Message-State: AMke39kArSTrg0wzQQqn1gJPjjozRNDopiVjNAEXNyMv+VaQO/pmCO/AG0Je5CRyZjmC0g==
X-Received: by 10.28.222.11 with SMTP id v11mr19829259wmg.1.1487614057187;
	Mon, 20 Feb 2017 10:07:37 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:36 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:37 +0100
Message-Id: <20170220180700.29836-22-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 21/44] xfce4-whiskermenu-plugin: update 2.0.3 -> 2.1.0
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-whiskermenu-plugin_2.0.3.bb => xfce4-whiskermenu-plugin_2.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.0.3.bb => xfce4-whiskermenu-plugin_2.1.0.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.3.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.0.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.3.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.0.bb
index 9feb864..81be871 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.0.3.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "3cbbe6f233089b6923113f47d311f875"
-SRC_URI[sha256sum] = "1b7afb233c74c33f0ee26de6514c4168497f4aa584dc2f6778dff15d8d47b165"
+SRC_URI[md5sum] = "29240011d455d0fc591b4a1e2262b7a7"
+SRC_URI[sha256sum] = "7e25706376e00fd216a9295aca3d0ff9f34bc13d4962bb6217e5f4270b973a80"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.9.3


