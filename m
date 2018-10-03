Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6068572EB7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Oct 2018 19:25:14 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id a2-v6so302732wrc.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2018 12:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FiAmUcgfiD5F85tyj8UIuOyuaJWBeLba4lIAuxu2nFU=;
	b=sdj4H+pnYWVO4kGtouheGwRt0+bya35mSXL1zaf9jomqFZPtBfFwH2m2UeDyuzEhol
	8oQqZftqaDRhY2AL4+A3fyhrwqcYX5QaEizjoWTNCa+EEhh8dDq/vb3vE3KegQfCPvpd
	GfXG8je6rhYd9aXUyHYKVesUpn0gX4xgKCYvPbhMZpff/wOL7PJYVW5a5vPQQRNbu9Ak
	S084qQvCB9uSuUgXd4NXxEA5m+taA/cweqMoXo/ZLjJNLe2urIfvzr/h46kOAM/s9WT5
	OridN6kXsSRjARiJyTBXJFy/HL7Le7VMyeFrGZXzlkqdgJOxlKzwTghV9uTxajpQ8pO3
	qIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FiAmUcgfiD5F85tyj8UIuOyuaJWBeLba4lIAuxu2nFU=;
	b=nm3mxQskT4wSoYM13rM1rbPNbT0VpLQ7ixS7JfrxEG4wcXXUNFZhgYWEVl74iItXF5
	3ZSXiS0JJmWUIhaW2XCvN8wCvURgC3XqEugCZ+lSRlb9LRERPpCTJy4yfAQ7xvRdknp2
	bj7oOiAxfBaY4prBlbw9gEyXBSjTE5z394DJX1atXlfVBiB3pDyfJTZDfFNdwKcxfWmM
	ZyifrpMXiDo4gZoOsuGVo93/dmw6St7UruTwV+fHnuwl900CV3sNrvvSle57xqQsebYQ
	sjehJoxpTjArfFbQQ79/6yL8QCdH1rFM/C7Lsso3yvZFdkZRXw8KfeFyhpJjP7ExP+3l
	KBzQ==
X-Gm-Message-State: ABuFfohhap0ZZRp9LnE58c76LtgNRQNsht+WUAia3Q3u2G3iCk0VGu9q
	VzjnT3fRYCsV6i6uRwXJw7GFZLok
X-Google-Smtp-Source: ACcGV60yVhK5JaYNpjSearzxASQ+grko08GyJxNoaDM7wQFxZZ2POtAM+LGCZDHp1yWpu8Z+i0ajBw==
X-Received: by 2002:a5d:4a12:: with SMTP id
	m18-v6mr2408145wrq.278.1538594714553; 
	Wed, 03 Oct 2018 12:25:14 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC1EA401E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:ea40:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	143-v6sm3533019wmv.6.2018.10.03.12.25.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 03 Oct 2018 12:25:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Oct 2018 21:24:48 +0200
Message-Id: <20181003192455.24921-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [PATCH 1/8] libsdl-gfx: initial add 2.0.25
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
X-List-Received-Date: Wed, 03 Oct 2018 19:25:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Recipes like this live in in meta-games and meta-game-emulators. Once applied
here, pull requests will go out.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb b/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb
new file mode 100644
index 000000000..c9910cb1b
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb
@@ -0,0 +1,20 @@
+SUMMARY = "SDL graphics drawing primitives and other support functions"
+SECTION = "libs"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5d1de21f0b70830e299905eac3419084"
+
+DEPENDS = "virtual/libsdl"
+
+SRC_URI = "http://www.ferzkopp.net/Software/SDL_gfx-2.0/SDL_gfx-${PV}.tar.gz"
+SRC_URI[md5sum] = "ea24ed4b82ff1304809c363494fa8e16"
+SRC_URI[sha256sum] = "556eedc06b6cf29eb495b6d27f2dcc51bf909ad82389ba2fa7bdc4dec89059c0"
+
+S = "${WORKDIR}/SDL_gfx-${PV}"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF += " \
+    SDL_CONFIG=${STAGING_BINDIR_CROSS}/pkg-config sdl \
+    --disable-mmx \
+"
+
-- 
2.14.4


