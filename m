Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 81DD960C18
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2020 16:37:27 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id g1so11305203wmh.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Feb 2020 08:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=3bXPKKIMahrm83jMGuWSvV6DxYAkJZRqdYvwhD+POAY=;
	b=vR8/CfzpQaths/9P7ZY5hVqEuqE0eustgIwAkYfsVl9HSZ1jz1pMVN2N1PfUpPybNo
	uboxB/yox1bJM+sepYHjCUx59xNJsLCDohVPnHokvJKz/IWH4xKpe7StY77JRc93fKrj
	bVnyl+bapKDTmuSN37Pt6kXIf1Dxq5xW+YkSOO93mcN4P8vhlKAZJPi6Pao7V6m2szVt
	Ps+Kwbvx1SiuzM/XsuZkOlYyY1leiya1TuvjYdwps49My+TNGo+8XS8+/EYDVL24w4UL
	D1mN7KFpyyBanvnwsdq1Fg7HDlJpVwO0yAvBK+b5EuNMSdESyntQG7rH4Lvj1yXhq4pK
	pmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3bXPKKIMahrm83jMGuWSvV6DxYAkJZRqdYvwhD+POAY=;
	b=YZTGt/4Rc3BMkr2QrR2xg78cayo66Xj34Bj4azA/F6u32DXQjpGXiWFsJaPh6TMFhi
	Y7I/mc5mhWNE4mQo+WbKwcD5Hh9trNe8SAKHi5cWGNWwEbkH0b9l0ZYh42NTGxXkHuux
	IriOmNcYV/Mfqvh11Zgjk0y9WJGfKx5MD08DcDaNnDjwyvMt99H61AS4dA/pRdOP0O+n
	/49EJYe/lsmMnBSQN1qUtFbxzI12zMK8mP4LTl9GcGX00WBs7CHD1bfSZSKYdnJgpyrG
	O525wnSNG2Qe+f7SB7ynWpmo11oemoI2BgiAv6qthMZ+SzsP92095fomtAmejbpqt5hQ
	UbNg==
X-Gm-Message-State: APjAAAVl+/hEnVqdQ4UdWUxYeKF0bJVhV4y1cXlOG4Gyn18pw3vP9d3Y
	kuHSeVaiMCOIizqX33EMloZ4zTzm
X-Google-Smtp-Source: APXvYqxYrRBEEuINSwNdMycIADCjxrOQzDvak9GLosV5+va1+Wb/J50IAu1E8MxEqlvHVnadNdlqsg==
X-Received: by 2002:a05:600c:299:: with SMTP id
	25mr9854506wmk.68.1580575048236; 
	Sat, 01 Feb 2020 08:37:28 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F01CE208F5D55732A5FC539.dip0.t-ipconnect.de.
	[2003:f0:7f01:ce20:8f5d:5573:2a5f:c539])
	by smtp.gmail.com with ESMTPSA id s1sm8594117wro.66.2020.02.01.08.37.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 01 Feb 2020 08:37:27 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2020 17:37:02 +0100
Message-Id: <20200201163703.4264-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200201163703.4264-1-schnitzeltony@gmail.com>
References: <20200201163703.4264-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] xfce4-whiskermenu-plugin: upgrade 2.3.4 -> 2.3.5
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
X-List-Received-Date: Sat, 01 Feb 2020 16:37:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 2.3.5
=======================
- Fix saving unchanged plugin title. (bug #15403)
- Fix sidebar scrollbar covering buttons. (bug #14730)
- Fix categories remaining scrolled when hidden.
- Fix incorrect alignment of commands next to search.
- Fix incorrect fallback value for menu opacity.
- Fix incorrect check when setting command.
- Update documentation URL. (bug #16183)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...menu-plugin_2.3.4.bb => xfce4-whiskermenu-plugin_2.3.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.3.4.bb => xfce4-whiskermenu-plugin_2.3.5.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.4.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.5.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.4.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.5.bb
index 595e3c815..75b5a319a 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.4.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.3.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "ee9e378fae78b230a23b241cf727c84b"
-SRC_URI[sha256sum] = "84d3de35695a023aab181f7a9b75f59029eb3b07c3e47a5e11e8bd79db62570e"
+SRC_URI[md5sum] = "b5242d7922fa4253cc99c253efcff7cf"
+SRC_URI[sha256sum] = "8f7134f4c1b5ff5290048c5b96b130e1238a286002cbe35255c2cd7d5a1ab6b4"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.21.0


