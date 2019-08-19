Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 382327F261
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2019 07:25:11 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id s18so7567065wrn.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2019 00:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IR1GTJIq1EYFZJYoyITOBuvtDt6c4X1IzsaOl/bFmLk=;
	b=TdjtTeK4+iDkuxdiFNVZm3BGSBy+y5FDqSoIXDoERMz/3p6b+bY0uvi5BnY7ZwfFH0
	4DHizpcUs4aDg9m7RC8SmrO8syt45RStJA9hiB+2CajzM99rZD8QSQIb5s6ni+W/0XPC
	VKbFsVJzsHNs9Gp87VBnZ6lmafj5Va2zQwHlpOlAGY0Rh0hrgRev0MXl/IKVmYejiwg+
	aBr6q3WLPtZVNOr1rtRpviI/Wtl5M1PN89DdCC3G8TJoIYAHhz/icQ5eCbvQ1MMH0XUZ
	cxuSj5BsJmJfuPLdB/vMdhTjPSQ5p7fayOiQLr8AoLa6qcJmdE71hclBMhNOUBfcmqKV
	lIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IR1GTJIq1EYFZJYoyITOBuvtDt6c4X1IzsaOl/bFmLk=;
	b=L6zZjZD3iOPxTVunggHLevZDm7hDnLJU7xply7Y7W4UDe7JnnpJ6unZjeU5abPI0ab
	XzEHp4y13sPjxSQX9TqxUwcZGPSa1WOunjw7mGXQB6vGehEQJuUtlLbBqHG3FSUPNMVB
	mKh1rd4SOzz9wdQMlL42B+DHSP34ledAkErHjcPAPvrGxoBmGaFe4ETU9Zp0ggsaezwx
	w+ssXX8v+IWq+4Z0Glu0+/TuENO8WfEJRVb65ejpjuGrtjSsXj7SYDLifTSr9cukNB48
	IJxzuyhNQfp1eKD3Z2LtfUgPe1VoR7pHXMGST8X1+CQ0sPLFTeIVVnZsU2RqFwWtSuHb
	+z5w==
X-Gm-Message-State: APjAAAWmXAn7HtJNGYp/nXck3qURkV8+24Wxqyc2ZfIO7Uo8Rwrop607
	PUg7TS6ddSrdJF7aMe7+rilLUt5x
X-Google-Smtp-Source: APXvYqz8GOT5NUfUDHUAdxI7RpbanwfUHQFpINJxOFxxlDhh997v+4iFw9nE4dpat9Ig2ts3yY+OuA==
X-Received: by 2002:a5d:534f:: with SMTP id t15mr13717340wrv.239.1566199511529;
	Mon, 19 Aug 2019 00:25:11 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F2D8767E02EEDE8604E907E.dip0.t-ipconnect.de.
	[2003:f0:7f2d:8767:e02e:ede8:604e:907e])
	by smtp.gmail.com with ESMTPSA id
	c12sm11940127wrx.46.2019.08.19.00.25.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 19 Aug 2019 00:25:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Mon, 19 Aug 2019 09:25:03 +0200
Message-Id: <20190819072503.2896-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-xfce][PATCH][v2 02/10] xfce4-battery-plugin: 1.1.2 -> 1.1.3
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
X-List-Received-Date: Mon, 19 Aug 2019 07:25:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Minor bugfix & translation update release

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
V2: Fix typo in commit message - have to learn to write 'bugfix' correctly
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


