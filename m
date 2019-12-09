Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 546DB7FB43
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:38:58 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id w15so14169501wru.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=lG+HzPiGtPAJi8A9RIWaD1988EHdlwRnRmOLQ1ugYqQ=;
	b=u4oiQL2AAuR6Ed594huCZRTepymDZTLoGtmIm6+hQLC2J4UuxIggHsw9Q0FS05E0vN
	DV4TuVL9WHgm0DLZyLy5uotEXMiDieQdwDea/d5LanqSiRVwlCby3Fi5vCw/hd2c3/kd
	DskkoiI9P+aWHQfuvjo2u+2G1gOcoRC/ebQIAl6zW04qqHhdQQjr9ZvmNV/IDmcdp92D
	fNrYKkDaJxT7zNTzQkJOq0jl26Za7ptnxUHVnRzMWSJAgAgQfAWdHTS4MkSe8ooXVGFX
	cQGSbKPF1/gfQtcl2zypDrtJoRDwrC5fyS6CZprYARzBJ8ZkwFcPkWrgK5uJoS63O9UM
	Gf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lG+HzPiGtPAJi8A9RIWaD1988EHdlwRnRmOLQ1ugYqQ=;
	b=gHuxTh8lgA9eG0V4npie7ESUbbHjEhtpoIB7Y/5tlclDOhf/9uRImHOLE+Tf+OdR+E
	QSd9kmfhSZRks6Gz7aLM7JiVOj+btnQSnm23eJQNj/gETntGOewZdX7559wO7nyiKwID
	mQpKVYTiyHQCDCRuYoAHtVnuayRveqkn/iAU0C2LnXOBlCjkNCm4qgnn7Rn4CiggOVS1
	SgAw/fRpdv0dFbsfAtwO1O2qD8W6tJGuJdijkFRSHGvAPHfOolo2ZelGOcZFqy+hH1MW
	QQQ/9NW9xpzfQfscU+oGNMF6qixsUum+FAKxMq+uS3uYreblNy9d3w35XKZCiZS+ENid
	edMg==
X-Gm-Message-State: APjAAAU8q1AuCQOV/lPoJCV0sXCL931dA5aPxCDxveg7P/xULltqIPEJ
	mRkYN1cOeqyyBu7EA4o+//vm6lI+
X-Google-Smtp-Source: APXvYqzYfF+8spJ21Dx0W7WocOdD9SxbsylaAH7Kr4bJtqxcxTLBABhM8HpFZZLfeUClcAzlEq5yrQ==
X-Received: by 2002:a5d:480b:: with SMTP id l11mr28185795wrq.129.1575851939021;
	Sun, 08 Dec 2019 16:38:59 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.38.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:38:58 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:19 +0100
Message-Id: <20191209003840.3383-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/29] gnome-shell-extensions: initial add 3.34.1
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
X-List-Received-Date: Mon, 09 Dec 2019 00:38:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-shell-extensions_3.34.1.bb          | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_3.34.1.bb

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_3.34.1.bb
new file mode 100644
index 000000000..8625a7b32
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_3.34.1.bb
@@ -0,0 +1,29 @@
+SUMMARY = "GNOME Shell Extensions"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4cb3a392cbf81a9e685ec13b88c4c101"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gettext gsettings features_check upstream-version-is-even
+
+REQUIRED_DISTRO_FEATURES = "x11 polkit systemd pam gobject-introspection-data"
+
+SRC_URI[archive.md5sum] = "09e64640bbf0e978171d581e2086a0c6"
+SRC_URI[archive.sha256sum] = "b0ad51143b1bf40def4a10f8fd0ab0ffb47218304800794e62cadd29d0acc75b"
+
+DEPENDS += " \
+    sassc-native \
+"
+
+EXTRA_OEMESON += " \
+    -Dextension_set=all \
+    -Dclassic_mode=true \
+"
+
+RDEPENDS_${PN} += "gnome-shell"
+
+FILES_${PN} += " \
+    ${datadir}/gnome-shell \
+    ${datadir}/gnome-session \
+    ${datadir}/xsessions \
+"
-- 
2.21.0


