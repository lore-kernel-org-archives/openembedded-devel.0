Return-Path: <matt.ranostay@konsulko.com>
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
	[209.85.167.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7267960B68
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 03:59:55 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id u2so5846733lfk.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 19:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=P/DncTgqhkzDGjVLXfS9baBvfqVOrSg2r5djrlh5VYw=;
	b=XAHFKnfhVbZjxwvkdQ2CQqFWFYjfKXzEVQONYsHEe1YIJriKBukbi2JTMcIPY59poc
	RDMn8gmjSifKUIWxpveptRWfsBaj5yMmmeJMQFVclMOni4DnNlzeCPAK5MCpXJLFBona
	VLLofWExPRO3muixh55TqpHsHmuOaYv4RcWLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=P/DncTgqhkzDGjVLXfS9baBvfqVOrSg2r5djrlh5VYw=;
	b=bVQCVaF4Vp0wKNDDmxcH50+2eUSjI7vZxXPU54jNH2nUG8gM/VpUiJZbfgNzT2+U1n
	lSv8Ec/tLsGIfp1iE04la0amyUiSvpL9bCdwNcllYbpexXSx4sQg3viZVRw5WBHPviT4
	wLdMwqgI+ixkG1P9FDS+BaFNJAL4oq4n2NZZ/hHuu5zn1OaOaHVAByFO95Secp9TRPbv
	yLEndJFaxWBLt05PIK2iK6nuwrr4SfSfV9CgXJDl7arQNGpyBOxW/MCBJL2IizjFdEiZ
	CfPNjnVmgg9FRfVuX7012USt/8PDldSvL2iC6HUnZg8a3iLHlnkQMLIf5mQBqx/nmweh
	Ayug==
X-Gm-Message-State: APjAAAXDYZ/HVN8f0zPzf6AaihVAyZWfD4972d9o7ggfO/Bqm61DrMl3
	YTakqxQ15QWPQQnSniRrGq5iXdg6acWm4w==
X-Google-Smtp-Source: APXvYqzXvmwh8GDyLLX5WkMvKDoGY501v6iwxy/ZiNk9FqPCXuEHc+vIIrYRXfCozM+kBkAB8l/lTA==
X-Received: by 2002:a19:6b09:: with SMTP id d9mr4926477lfa.203.1582603195328; 
	Mon, 24 Feb 2020 19:59:55 -0800 (PST)
Received: from taos.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
	by smtp.gmail.com with ESMTPSA id
	d24sm6553615lfl.58.2020.02.24.19.59.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 19:59:54 -0800 (PST)
From: Matt Ranostay <matt.ranostay@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Feb 2020 05:59:49 +0200
Message-Id: <20200225035949.30515-1-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [[meta-oe][PATCH v2] ttf-noto-emoji: add recipe
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
X-List-Received-Date: Tue, 25 Feb 2020 03:59:55 -0000
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


