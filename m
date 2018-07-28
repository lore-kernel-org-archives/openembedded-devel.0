Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 42CC47469C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jul 2018 02:39:37 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id w8-v6so3053759ply.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 19:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=gcwjE3DhGY8jvGXYbcnz966Umz5gRfcNrksfOnsLxo4=;
	b=HK2FDa+Wz/atGT8o70MNKLTjEjIhO5kFO7lh49rReuFu0h/3gJew75vZ5vGaJh9NG+
	1yX/Hm4lRtxdciCLs72dYU8vBA0L2Nn0/zIkwGhZZ57iJM2c4udcziFpZrJHnf5PJg+q
	3OgL1cZZDslMtCJQ3XLt+cscBEyTcg0K3EsBAs5E2CJvUHSTRDmcaSHkOxVQbxRZV7gh
	eRu6OTiKVk6ROKneKLn39oM1OyJU1YvIUE+4Vk9KpLFxj4N9yCPiJdm04S2SO/uUF966
	kS+MpzzSERV/UpcMtxyHD9IGeddcTWc/FQUN/1c/JGX6vp979CN/d2Oq/L6TK2nOtigO
	FwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gcwjE3DhGY8jvGXYbcnz966Umz5gRfcNrksfOnsLxo4=;
	b=TNmDywQBe+AMTre7PwQyyrSE2HPOKD6Xq6sBkwapwhmlbyPYoCCiyHlfO0qREvIliZ
	9F6Hs7ub77/ZQdkKbZu/AWNcViD63RbUtOJluMN8RMaz8/GhQiGFTKqjzeVkL7Bh95yx
	GSXJXEuoNDSgrxE72WuLfptsLPaLrFc7k8Vu78m6iwOHQ5eZ5DwYvXbATurNbqCFk+/m
	NDd8dDlA+KHTgrqSU9h6sVYAXuAPcpyUVZJ1RrmwSV8qy2xLOrG4cLf/N+ku7l0/omLt
	Ud4QIDdqWZpW61jRR9Om9XGE1XaAxp//ARFZWivkKqlJYPaJT2gDM6v8DM9vniYRZ4pD
	sSnw==
X-Gm-Message-State: AOUpUlEUfujgyz55HnGDZ9YMJvCl5m89aM5ckOv9zQzkrRI09bgyZ9J+
	CXhJOutIf5n94Kocv3xIDS/QIonj
X-Google-Smtp-Source: AAOMgpdwcMxY3SsRnqFoatVZfJJaLmHwJbeNw0dhi6YSYUdp4/DxPGHpI7iO7AtCaD7zRPtUgddSmA==
X-Received: by 2002:a17:902:ac1:: with SMTP id
	59-v6mr8191497plp.18.1532745578564; 
	Fri, 27 Jul 2018 19:39:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::ee7a])
	by smtp.gmail.com with ESMTPSA id
	m20-v6sm8749341pfg.61.2018.07.27.19.39.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 19:39:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 19:39:28 -0700
Message-Id: <20180728023930.25045-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-python][PATCH] python3-bandit: Add missing dependency on pbr native
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
X-List-Received-Date: Sat, 28 Jul 2018 02:39:38 -0000

Fixes:

| ERROR: Do not try to fetch `pbr>=1.8' for building. Please add its native recipe to DEPENDS.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-bandit_1.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.4.0.bb b/meta-python/recipes-devtools/python/python3-bandit_1.4.0.bb
index 2d24c8b0f7..84f47614e0 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.4.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 SRC_URI[md5sum] = "f74155cb9921be857693b32d2531e857"
 SRC_URI[sha256sum] = "cb977045497f83ec3a02616973ab845c829cdab8144ce2e757fe031104a9abd4"
 
-DEPENDS = "python3-pyyaml python3-six python3-stevedore"
+DEPENDS = "python3-pyyaml python3-six python3-stevedore python3-pbr-native"
 
 inherit setuptools3 pypi
 
-- 
2.18.0


