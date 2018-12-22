Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id D8C9F79EC1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2018 20:44:30 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id c14so8467051wrr.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2018 12:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=k6vrGx31Qp7FOOtjQn32LkcKKtfR+59+hMNpPL1BsBw=;
	b=QcZ/LZ1VpmexgZR56fey78zjL8tIxWyHoKiEZjwNyZ9hmjnpHCMacI5BJgOi/SLEBf
	Vy/iKKrR4HIrj4YQsegA7lt3zZu5AIkCCDNMDDUfTcRQdYM+dbCB5jAe6hwGJLoby2Ba
	7suzu8ryKGrK0BuP7sRnZoDl1WoZPe5ASUPCbJBfA+uRPWcoP83Ddfh1azGet9KVCko7
	P9sXmQ9jWQPAhnwN0+Bihf90QsfPpe7ff8N5MGqk6jvMGOk2o9YzNJEC9oUaRUaJ2UkP
	2cAUGoP3dhraH0efAL4+FVmc03e2DjsPw8f8kQqclIkCMf0dOUb855YDbJnZpgI7u5E0
	1Dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=k6vrGx31Qp7FOOtjQn32LkcKKtfR+59+hMNpPL1BsBw=;
	b=GcR7v5nr5jCirUqrBP6eGkDczvyJOKWPgxDT1pjIjnzDCH3MSB56PFo9wOp2t5rNWJ
	cxgyAli/cBsKSiKxJy4XwhmqN7zHCcyKj5x0kRqrt1uwPndbrn4hg8TIzn93Ot9n223K
	xKohJeCaaCobIWet9zJvt2tU9OG0dS5pUb9bpSkBmnQHiALiMH6ufLUow2jA16H/W8p/
	Cepp866rcKsWUM7gberzjHiJCfx15I2M4cRA/2D7L3vJiQdrR2smp+L7IQgQuNWV4Dyt
	tZUWgGAjyNd7/MlZGN/7Kb9K/e/QpvzuFwgfU2dcpVtXAXZkJOZIO62IM61akhvfKevr
	QlLQ==
X-Gm-Message-State: AJcUuke3DON9LgmK3HPJaA2qN3SnnrqU2/eZM4met8u2ri1RGBypAiAL
	WQ6PzHbFvzlTEcs65GsbLtVn7IDC9eY=
X-Google-Smtp-Source: ALg8bN7m/7s/Ncq0Pgo1isBDKw9oGEuocZ1Gw8Ya2Y+4Is/xJZA2bZVGr9B2x8xwLTrlFNNYZn5Btw==
X-Received: by 2002:adf:e707:: with SMTP id c7mr6633918wrm.196.1545511470880; 
	Sat, 22 Dec 2018 12:44:30 -0800 (PST)
Received: from localhost.localdomain
	(p200300F07BC05B391E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:5b39:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v133sm13333692wmf.19.2018.12.22.12.44.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 22 Dec 2018 12:44:29 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Dec 2018 21:44:20 +0100
Message-Id: <20181222204420.32045-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.5
MIME-Version: 1.0
Subject: [PATCH] openjpeg: fix build for multilib
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
X-List-Received-Date: Sat, 22 Dec 2018 20:44:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| ERROR: openjpeg-2.3.0-r0 do_package: QA Issue: openjpeg: Files/directories were installed but not shipped in any package:
|   /usr/lib/libopenjp2.a
|   /usr/lib/libopenjp2.so
|   /usr/lib/libopenjp2.so.2.3.0
|   /usr/lib/libopenjp2.so.7
|   /usr/lib/cmake
|   /usr/lib/pkgconfig
|   /usr/lib/cmake/openjpeg-2.3
|   /usr/lib/cmake/openjpeg-2.3/OpenJPEGConfig.cmake
|   /usr/lib/cmake/openjpeg-2.3/OpenJPEGTargets.cmake
|   /usr/lib/cmake/openjpeg-2.3/OpenJPEGTargets-noconfig.cmake
|   /usr/lib/pkgconfig/libopenjp2.pc

* Addresses [1]
* Build tested with poppler in multilib and non-multilib environment

[1] https://github.com/openembedded/meta-openembedded/issues/103

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb
index c50d55e4b..d30ff4825 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb
@@ -14,3 +14,6 @@ SRCREV = "081de4b15f54cb4482035b7bf5e3fb443e4bc84b"
 S = "${WORKDIR}/git"
 
 inherit cmake
+
+# for multilib
+EXTRA_OECMAKE += "-DOPENJPEG_INSTALL_LIB_DIR=${@d.getVar('baselib').replace('/', '')}"
-- 
2.14.5


