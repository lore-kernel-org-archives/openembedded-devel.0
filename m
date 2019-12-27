Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 319CF7C426
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 21:31:32 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id b19so9110960wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 13:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=+2Glif/2IS2XEzPGv+Zo1MqT/Iwz5enwpdCaflXmZPU=;
	b=fK2xEbPysciUJZ5iWCSIuP+yE06pFbGGbA7lFPOZBLyTLPbWLFl2xhTDcYyO7KTCby
	nXYYH66N8Zyt5iGkOdP3uUAfJPRLqJ8fwE6Fb+AzWRbE2rcuBI3QsNN36zvsWkFdGXxu
	ec9RBrbmti2jeERxA3pUW151UsgT5HjIEo8EQ/Gs2rsHwD3gpkDzio52BCOD8DUi/kwI
	wVsaHao3+OZ2yc6jyCtDxee6hrS1ezS9CwE37XZHCvaa+UYwLy2w2M8Ia2f4XJGbLtvl
	vwAOeMEGRbiYP0BGG0syP0hJUQ57LX5LR18hyLUt3I+/2nYjl7bpz81HYgaOtASPI1fw
	2Ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+2Glif/2IS2XEzPGv+Zo1MqT/Iwz5enwpdCaflXmZPU=;
	b=ldwZDIktrCDL+xPtp/zsvufkuuzbQmj3CzEg52Xkj/Wel3G63hO+TOflFTU9te8LlN
	VId+sI5e63QYDNvY71prVN+WrRbP2Z7wsT1GQYEABQ0yzdD1QGQ9Ogbx6FJhqugnquNj
	IhO0d/LTQm92EH4i/AN/K1yAMQytnghfHLKf0vBfJagZGg427ycTeU9ENowt0A4d3sFQ
	nyUfQ9T1l3epASaxLC1ER2scFs8IOaopfPy48bKX9taLcklO2cjnHMpHc/AYRXU0gx5x
	tCD6UrK0LKK9N4k4UIXSkMb7DCWjaJlm7DbofKGEqSbChRRDGBAnRvQkxtF7SNZcezag
	h1JQ==
X-Gm-Message-State: APjAAAULkBGEnQxK2LKbbCfeMcliUw36eLb+iuuSKwr/dtBDwZ4qvBbg
	Br85pboKBPbkeBh1Hfnr/wZnxJjJf1w=
X-Google-Smtp-Source: APXvYqypYQu7fxR1g6qGNy+uplXQ3OeSCBd1ipAWK+ZpyAxm+m36D/iX9FxOd3hdiDq/QUV4vavZYA==
X-Received: by 2002:a7b:c389:: with SMTP id s9mr20836777wmj.7.1577482292890;
	Fri, 27 Dec 2019 13:31:32 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F052B8722A751F738295925.dip0.t-ipconnect.de.
	[2003:f0:7f05:2b87:22a7:51f7:3829:5925])
	by smtp.gmail.com with ESMTPSA id
	m7sm11915929wma.39.2019.12.27.13.31.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 13:31:32 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Dec 2019 22:31:04 +0100
Message-Id: <20191227213120.3930-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191227213120.3930-1-schnitzeltony@gmail.com>
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/23] evince: upgrade 3.34.1 -> 3.34.1
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
X-List-Received-Date: Fri, 27 Dec 2019 21:31:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:

Evince    3.34.2
================

libview:
  * Fix crash on DnD (#1246, Marek Kasik)
  * Don't enable popup actions on page change (#1168, Jason Crain)

Developers:
  * Jason Crain, Marek Kasik

Translations:
  * Jordi Mas (Catalan)
  * Yi-Jyun Pan (Chinese (Taiwan))
  * Stas Solovey (Russian)

[1] http://ftp.gnome.org/pub/gnome/sources/evince/3.34/evince-3.34.2.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../evince/{evince_3.34.1.bb => evince_3.34.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/evince/{evince_3.34.1.bb => evince_3.34.2.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_3.34.1.bb b/meta-gnome/recipes-gnome/evince/evince_3.34.2.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/evince/evince_3.34.1.bb
rename to meta-gnome/recipes-gnome/evince/evince_3.34.2.bb
index e30162c06..8f669c9db 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.34.2.bb
@@ -18,8 +18,8 @@ DEPENDS = " \
 
 inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection upstream-version-is-even gettext features_check
 
-SRC_URI[archive.md5sum] = "77b38b625008f5940e9bd4b3d38e8cf8"
-SRC_URI[archive.sha256sum] = "85e407cde396147b249120d816c7715fb6df191ca561cf65ff3554a5d67626df"
+SRC_URI[archive.md5sum] = "9e9e82fa8f6045ad7817157d9335d185"
+SRC_URI[archive.sha256sum] = "3cc0955f11204e3a2db1c7ab99b866692749592257485b87304134ad69da0617"
 SRC_URI += " \
     file://0001-Add-format-attribute-to-_synctex_malloc.patch \
     file://0002-add-a-formatting-attribute-check.patch \
-- 
2.21.0


