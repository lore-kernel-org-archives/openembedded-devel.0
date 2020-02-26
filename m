Return-Path: <matt.ranostay@konsulko.com>
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
	[209.85.167.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6368C60CC6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 21:23:43 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id l18so437173lfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 13:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VbsU1bnUG+fAZJgPgk8xQ4mwZ8HqjrWpli5V6JyunsY=;
	b=CZX/95IooJhtb2Xz7uYSe73faLgr87cT2f1pKPNeQCx93stKnLXfI4Je5xZNmenYf9
	pTXmHqtI7nhA93HX9gZzKGDTxdW2NnuMgD/rwFFw2ZLHyuAY9dtPnZCE3mbpBm6DWL7d
	W8DS9dPgF31kKJTQX95uYTxLSjOWqXhenJKgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VbsU1bnUG+fAZJgPgk8xQ4mwZ8HqjrWpli5V6JyunsY=;
	b=CYnsd08qtx37ISUcZJlJYmznmOnGL/Fh8oEeDPDfKK7jAvajgy6pe5sU/BtPlBEItd
	RfvFqHUGdBkyO9DoKQnTiYT2ISDACAy6aXz4+NUOyAAv8okM/zQWCkaY2BV4+emGyxU7
	C/ory0bDpiLlfHD1BPpXRe4BH79F0uCdPupPQqBdlf62DmQuj1cP2MxHew5rcYGZBX0T
	99P6YYPVDXeOTOWz7Psw7ICrMbr0Mixm1RAcP3CNhXA+mR9jvhiwVfISxG5xjKQLzSGH
	IULfwIkgHyoiKmRYdbep+MHC2YWj9JIGcX7W/yZaO87qlJIxBvRlxDpSCvqLhoxngFbU
	wKlQ==
X-Gm-Message-State: ANhLgQ0uPNlpGEXI1UvK972+3fc4Z6+rK4lkWxgckq4eKiItiQ9FSCvE
	iFSxAyLQaAIA1yJGFy2KppAcmr0Wv0s=
X-Google-Smtp-Source: ADFU+vsoJAhOhbyKiCnve08TSJ1qS9ZLGTpgbidj8qc+NBT6mLd+CCJ7FZPHCLzk6tuu9YjI3H0Fig==
X-Received: by 2002:ac2:5388:: with SMTP id g8mr305957lfh.168.1582752223420;
	Wed, 26 Feb 2020 13:23:43 -0800 (PST)
Received: from taos.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
	by smtp.gmail.com with ESMTPSA id 3sm1816875lja.65.2020.02.26.13.23.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 26 Feb 2020 13:23:42 -0800 (PST)
From: Matt Ranostay <matt.ranostay@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Feb 2020 23:21:37 +0200
Message-Id: <20200226212137.10018-1-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH v3] ttf-noto-emoji: add recipe
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
X-List-Received-Date: Wed, 26 Feb 2020 21:23:43 -0000
Content-Transfer-Encoding: 8bit

Add both B/W and color emojis fonts from the noto-emoji project.

Important note for the color emojis to render the pixmap PACKAGECONFIG
option needs to be set in freetype package.

Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 meta-oe/conf/layer.conf                       |  1 +
 .../ttf-fonts/ttf-noto-emoji_20190815.bb      | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20190815.bb

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index bad87850e..dec864d33 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -70,6 +70,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   ttf-liberation-sans-narrow->fontconfig \
   ttf-lklug->fontconfig \
   ttf-lohit->fontconfig \
+  ttf-noto-emoji->fontconfig \
   ttf-pt-sans->fontconfig \
   ttf-roboto->fontconfig \
   ttf-mplus->fontconfig \
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20190815.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20190815.bb
new file mode 100644
index 000000000..e74f7a7f6
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20190815.bb
@@ -0,0 +1,19 @@
+require ttf.inc
+
+SUMMARY = "Google noto emoji font pack"
+HOMEPAGE = "https://github.com/googlefonts/noto-emoji"
+LICENSE = "OFL-1.1"
+LIC_FILES_CHKSUM = "file://fonts/LICENSE;md5=55719faa0112708e946b820b24b14097"
+
+SRC_URI = "git://github.com/googlefonts/noto-emoji;protocol=https"
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


