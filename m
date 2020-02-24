Return-Path: <matt.ranostay@konsulko.com>
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5719261617
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 19:23:43 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id q23so11432872ljm.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 11:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BMjJlNPj+I/ni958w6tNCI9O4fyAMEgFrO0Q5d33C7E=;
	b=aw6KDzukOT7pOFk60L0XPbOV/6Tw07mDVIwcMIb3PURXjh6kR5WsqCmTX6tjLYylkU
	jwl4cr/dkrkqo+TaJ0ieLF9NPRmNmDijGX5fblJP2jy2SoaiQM6uVI6cRTvELOLRG3Mx
	FSaxf8DODLjDM9e2yPUcorwE/dOc7aCfbe6V8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BMjJlNPj+I/ni958w6tNCI9O4fyAMEgFrO0Q5d33C7E=;
	b=AGriM6lcQWnxGxXmgutIr4bqeoGQfBhLOla3pLhC3K/T3TVTvOXitP+DhT7ZQl0U/P
	Esj5MiQE5fMkt58fq/lHKmGKQUlsmaPGtkfV+jJ6q0BXx3SgSiS61pfkwsWyKMxVqs6e
	B3yfkxNJZ5Rn4VbiSioLbEeUz43CnxjmloSCi8Tlf9kTfoezicRDK3vU9oH83NoT5Err
	7OUgjlQkYy4J8LHMvrhmBsZzX7k+u8PELyZdFERrkd9fs39BmU8s13n3IaIh5cOgpy8t
	S/JT/OFMKyBQwCApmXbVcniATzIGxl/Ej95eCU0lGmFa4EFStyGNZIv27Dn9ZZm2F8rw
	1+NQ==
X-Gm-Message-State: APjAAAUTXlxb45if77XQ+HpfX65ImOKuvI7n1i+UCZEodMuibms2tRpv
	xcfCe9SR5wkjrGW7/WVXvp4cKdaql9T1DQ==
X-Google-Smtp-Source: APXvYqz5BenY8LOmF02xuFpMoHRIpo162xVI4JozcaxKGuwHL3J8xyOFchLWbJB0NFIE7D9ql/IJ/w==
X-Received: by 2002:a2e:98c6:: with SMTP id s6mr31613727ljj.14.1582572223516; 
	Mon, 24 Feb 2020 11:23:43 -0800 (PST)
Received: from taos.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
	by smtp.gmail.com with ESMTPSA id w6sm6081710lfq.95.2020.02.24.11.23.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 11:23:43 -0800 (PST)
From: Matt Ranostay <matt.ranostay@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Feb 2020 21:23:39 +0200
Message-Id: <20200224192340.13855-1-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] ttf-noto-emoji: add recipe
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
X-List-Received-Date: Mon, 24 Feb 2020 19:23:43 -0000
Content-Transfer-Encoding: 8bit

Add both B/W and color emojis fonts from the noto-emoji project.

Important note for the color emojis to render the pixmap PACKAGECONFIG
option needs to be set in freetype package.

Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 .../ttf-fonts/ttf-noto-emoji_20190815.bb      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20190815.bb

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20190815.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20190815.bb
new file mode 100644
index 000000000..e35e08ae1
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20190815.bb
@@ -0,0 +1,19 @@
+require ttf.inc
+
+SUMMARY = "Google noto emoji font pack"
+HOMEPAGE = "https://github.com/googlefonts/noto-emoji"
+LICENSE = "OFL-1.1"
+LIC_FILES_CHKSUM = "file://${S}/fonts/LICENSE;md5=55719faa0112708e946b820b24b14097"
+
+SRC_URI = "git://github.com/googlefonts/noto-emoji;protocol=https;branch=master"
+SRCREV = "833a43d03246a9325e748a2d783006454d76ff66"
+
+PACKAGES = "${PN}-color ${PN}-regular"
+FONT_PACKAGES = "${PN}-color ${PN}-regular"
+
+S = "${WORKDIR}/git"
+
+FILES_${PN}-color = "${datadir}/fonts/truetype/NotoColorEmoji.ttf"
+FILES_${PN}-regular = "${datadir}/fonts/truetype/NotoEmoji-Regular.ttf"
+
+do_compile[noexec] = "1"
-- 
2.20.1


