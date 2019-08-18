Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 897037F289
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 22:33:37 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id b16so6703651wrq.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 15:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=yPynwGO72wYKzcswos131rVdYqsZj0IfIApXpXxEqmU=;
	b=iaU/Gy5bflPitRzrhTcIS9I6vh69uyRsuk3CZaRCPEwloJABiAbrKq6+8DtefXcP+q
	//l5hzQZPnOJSDEG6KSYgorbNK8W/nIrAQh1OsgmKeNgQ3f2qpxxLZ0+WzWTSDioDC3I
	PyGhas76nr3k7tIY2SsdBKkiMPOeMqyVU8kKq9B/xeyIcqG+F/lZx40oZFS1kBVqGdb8
	cstjUxcdxUT9b/sPSYPl+x46bE19wprSEdaxJlEL3mVo+wr9YyRgPogYOC0xmk2bI5mq
	hd03v4lHbucSrYZ90ANy3ymsZoNgQsrEh9dLkAmzPLyLC9URDBrfJoLySW8e17rTaBQY
	8D3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yPynwGO72wYKzcswos131rVdYqsZj0IfIApXpXxEqmU=;
	b=pj4kqQtR3Cm/2Bo1VuW2XkQ/zxQi2SBLYfne6XTE7nIQpt0amx3+nZsyOv52Yps1QK
	RJV3E/Z8rIG9V0zJnAzFb+r5viHRk6hyIK8VX2d1IrMA9ORpSrdTNTapezHdgmNDITr+
	/j5kBYiN34BtUJZQpOSt2DeY2KxCEUz5SAZqaBGBEdziTyEMTiUJLOMxRN3CRjEUdWwq
	I+90JcUbNFKllF25sGFmz2c96N/610xP6C1GOBRk5W5CXnLyG+O0w3yoU+HeBhUEmcle
	fZ5d07W7gmhhxXVeIMMQDuSxKpfDL6GBhuVD+UHB/EYCWC4xm5MXLhtWQ7cQo9IBRVk0
	4Cbg==
X-Gm-Message-State: APjAAAUq/uycezJ3UAKIFFqnehH/VEfns29hgMGQO0aAe/kZ77FUHbVP
	dJFKw6gyLnqwa7l3/NlAUTEdZVQu
X-Google-Smtp-Source: APXvYqwqc5gdlA6di1sPSuhvyWkjsKAeia2ljuVuZ+dYN1M7Z8Y6Kq84tHSKBAq9PkA96qCZzYoTqw==
X-Received: by 2002:adf:f286:: with SMTP id k6mr9331859wro.320.1566167618004; 
	Sun, 18 Aug 2019 15:33:38 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F2D8718C84C5511B02F056F.dip0.t-ipconnect.de.
	[2003:f0:7f2d:8718:c84c:5511:b02f:56f])
	by smtp.gmail.com with ESMTPSA id
	k124sm30390814wmk.47.2019.08.18.15.33.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 18 Aug 2019 15:33:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Mon, 19 Aug 2019 00:33:08 +0200
Message-Id: <20190818223316.19772-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190818223316.19772-1-schnitzeltony@gmail.com>
References: <20190818223316.19772-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 02/10] xfce4-battery-plugin: 1.1.2 -> 1.1.3
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
X-List-Received-Date: Sun, 18 Aug 2019 22:33:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Minor bugfixe & translation update release

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...attery-plugin_1.1.2.bb => xfce4-battery-plugin_1.1.3.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-panel-plugins/battery/{xfce4-battery-plugin_1.1.2.bb => xfce4-battery-plugin_1.1.3.bb} (47%)

diff --git a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.2.bb b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.3.bb
similarity index 47%
rename from meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.2.bb
rename to meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.3.bb
index 5de1ce5e0..ecbdc265e 100644
--- a/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.2.bb
+++ b/meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.1.3.bb
@@ -1,9 +1,9 @@
 SUMMARY = "A battery monitor panel plugin for Xfce4, compatible with APM and ACP"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-battery-plugin"
+HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-battery-plugin"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "ba1cfe619046373f9af5b903c77d1858"
-SRC_URI[sha256sum] = "d601349fa9a979dae99ace39b24d99b97f62b80f42ac5dea5a99e5af3e88d7db"
+SRC_URI[md5sum] = "9f82c7e77de0a417716d68d33367973b"
+SRC_URI[sha256sum] = "12be0a44d16bd1e1618513ee64f946814925872db7d1c1188ab1454b00d040a3"
-- 
2.21.0


