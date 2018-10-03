Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 553B678FA0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Oct 2018 21:14:41 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id a8-v6so2966284wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2018 14:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Hhgmw5fbibP77Im1zevXByYurFWa5qZt8cC8KYgrdSY=;
	b=IIQ0koB79kChBFNOgKyQIeBZZODoQdKZfMieTOVLPx4Q5BuUJfa7VHZmNCpYwwByb5
	rTzpPd+Kp5V7vB50kIQmuzHyJokiSv+uCu6THL5qb/ENOF5ETD9VbOsVVbsQkr3VoWC2
	1XmeB0wJVmUJxqmfOy84p09RpvNWJTtrrn2u0GgQRu979suGdC7M8ebqYoTmLqT+fZ7w
	dpdX6hObq7VmoIqRNndOuU0VDGieA48XDad9GXedIEhniC2tVle3H1KmPoT2rjugeRfr
	GlZmkamAUc3bRUQ3oq0AQG4nPZe2gfX09A8GQhXe47l/t/Kbvnxtszg2/1Lu495cQkKN
	+rPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Hhgmw5fbibP77Im1zevXByYurFWa5qZt8cC8KYgrdSY=;
	b=kyLN8ljFcLzF5PIk7T6pEBFXzH1gGK/lQ7q+1VIIKDuqUINb4b1oBYDukjes+Uzwpn
	VaygO+Mj24CtQLGUcvHPmoY+EIfMqwz/Clo23McpzGMZIn15NjKjHnhyIwFboeSeC5pr
	zChKTbK0M6MtWJ6d2zEfqVwOo2FyoOsXs9ubTr0kwXFlFc2paVvVW++Z0cl2K85SLf1t
	ZpjMHi1No7Su2iNBO/s2su17K4rFfzq0pfuhVups0RFbBaab4HttAms/x0h8CXps2usW
	54Uh/0xzyZFJNjxctvVErXn54ZFQEKMRyJmFHtkPlKy4FGy5VuYExOJ+tQuGKwnzAWHR
	3XTw==
X-Gm-Message-State: ABuFfogFe2KwSKAzCHaoD00c4d2rQLuEL502pp+6FugynstBY7mnUDJC
	I9eAugyfcuC2tapVMomPmLh+HhVR
X-Google-Smtp-Source: ACcGV61NaR74hizie7NR5rlzjbOJbnWeeERT7qhhhGlpT/3ivChaUDIvmmMwLMbOt8+8nlsKG3mTGg==
X-Received: by 2002:a1c:2746:: with SMTP id
	n67-v6mr2571955wmn.116.1538601281522; 
	Wed, 03 Oct 2018 14:14:41 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC1EA401E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:ea40:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	18-v6sm2450578wmw.26.2018.10.03.14.14.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 03 Oct 2018 14:14:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Oct 2018 23:14:32 +0200
Message-Id: <20181003211432.4233-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [PATCH v2] libsdl-gfx: initial add 2.0.25
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
X-List-Received-Date: Wed, 03 Oct 2018 21:14:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Recipes like this live in in meta-games and meta-game-emulators. Once applied
here, pull requests will go out.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb b/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb
new file mode 100644
index 000000000..b077a0bdf
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb
@@ -0,0 +1,19 @@
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
+    --disable-mmx \
+"
+
-- 
2.14.4


