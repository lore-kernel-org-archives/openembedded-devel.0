Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id D64007F9C4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 18:24:23 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id r18so1994012pgu.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 10:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=C7o/1XDLcr6VRwuLXKJW/eF4/Nv42DPS/pUS2soPXRo=;
	b=O7qe1u6FLDwzNET2v26vXCUGd2RyT/TlewS+lEsi+p2YRdYHROIZ3rbtbTvDXdJF3w
	AGNETOBIpTI3+3Z6YmAQSrw4itF7/Fx6HEt4AT3usw/+JVQAcKQHI+7eM+g0M8WMWlpg
	E7zh8z5gNsx9f3zaaXRR+QO/jKKF1mjtAsCF0SqTLT8JvsQ3saWg78huxXDKtYGmrsWV
	xeHQJNUrWq38cEltuh7VUbxMuBeEKumcI5QyqFkpcvTXLt3kXKOtE4UK/IZCjYaVdaQF
	IPX+ptF4LlSChBMy1HeBKi2bVSzOWahIAfvPQkgNjr/7BUlgElSFlXv6eyu0s2fiNTyN
	Ngjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=C7o/1XDLcr6VRwuLXKJW/eF4/Nv42DPS/pUS2soPXRo=;
	b=E1J0xVH0aMPck73lWTK4DEWGZqkGYixo2Uxoy9/vOhrcqPcA1/3e8SJrNvie4nuz8Q
	Bf/szdArfZh010i2+DYf4DOHaXs3LvUSVVcgFbYHgZ5CxoFEPkSe2mmJ3iDbLRjCm+cY
	LNy26+jWFYfgd7LeoQTi7tl/fuDtdQzfFcYMcuDKIkos345YGmCcYYmwYSEBWVnSVu5k
	sRj8LOcnJahk7EEUpj8CSX6pH9r2QyK6+7ocVyfwQbI/MQ1znXJMVYB4+AzO3/MGHpSq
	dHZquq29IVLlmiLZj/F8JtwLW6PVgUolOKbYy/j3WWOerdoLnbYUNWAqHv3QmyX/Ldr6
	ShnA==
X-Gm-Message-State: APjAAAUwXnrxEKBPbe0R1WE1z3LGBeSW7DSnGQLkXMoUMB6y0HhYs0Ia
	/wWTBa/peSqaKznx0o5hoAgDi1m3vZY=
X-Google-Smtp-Source: APXvYqz4EXMGpKZRBO0Q30DlJp26YKc1jHCx1Pik9Upt4/xRa2Rb8c6UexEv56m6TbZ7sI9JM9UyEw==
X-Received: by 2002:a62:ce4b:: with SMTP id y72mr12832626pfg.9.1574360664106; 
	Thu, 21 Nov 2019 10:24:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::d61])
	by smtp.gmail.com with ESMTPSA id
	q199sm4373973pfq.147.2019.11.21.10.24.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 10:24:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Nov 2019 10:24:10 -0800
Message-Id: <20191121182410.2803533-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] nodejs: libatomic patch should be target specific
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
X-List-Received-Date: Thu, 21 Nov 2019 18:24:24 -0000
Content-Transfer-Encoding: 8bit

host usually are using gcc/x86_64/aarch64 and all of them have gcc which
can support atomic intrinsics, but not all of them install libatomic by
default e.g. centos-7, so asking for libatomic unconditionally may not
work always

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
index 8c690ae7dc..e36995c258 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
@@ -18,10 +18,10 @@ COMPATIBLE_HOST_riscv32 = "null"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
            file://0004-Make-compatibility-with-gcc-4.8.patch \
-           file://0005-Link-atomic-library.patch \
            file://0007-v8-don-t-override-ARM-CFLAGS.patch \
            "
 SRC_URI_append_class-target = " \
+           file://0005-Link-atomic-library.patch \
            file://0002-Using-native-torque.patch \
            "
 
-- 
2.24.0


