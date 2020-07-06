Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.7.1594056881020899917
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 10:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oXLrEpnN;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: paulohefagundes@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id t6so18723635pgq.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2020 10:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LI2I2zTZv04gSFXiZTbwkHLdYrXZyRBIn2bINQUGy3U=;
        b=oXLrEpnNz/NSYK4wyhm3HiEmF7drb4FXLgzfnVtaHm8bgy9rcn5l1he+SRklpij0EO
         00eVCgB5+OeyZw/2YJTjUzQAMSO+XcrMpworDAag/3BqNideK7jmUr1f3Pcf2yFGrSCI
         cNtTp8ZXUpvkA0HexxzLKFE/ux2y4u72VYKgga2AlbKhTn7E1zyrb77j3aErKMTMFRKk
         XLBJW5y67xe8RnRJ6S0a98FFrdBx5CuOBMgRClTHOwhs6cOhBzwNFb7mASOWqacWO1t0
         +hkmmggnXVj55emGU1KeyfHUlexgWkM6ILGBNYCk+kjoncBU7pHcB+gCITiCusuMaaKD
         bRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LI2I2zTZv04gSFXiZTbwkHLdYrXZyRBIn2bINQUGy3U=;
        b=Z1w+VYzX2+gx8+nP4wiOb7ZpxhHtTcnW3jmk/MfVH8LUbPfxfrCJXeC5sI7xTFC6kJ
         RZ4mRMBo8HjkHW6B5drHO1cixSIIiAExDZjgOSpvlUmYhXq58l1lf+ShEYDsmTLjHm+y
         UuajlKPC9nHifpi3pA2WU9XS1jWcEz8Wzuehh5Tgo8KGZ/b3LDbIWgbIcZK4dlLL82dB
         uFrEpaUAGSnG7vFZAA0n5SwgYyVxpq6p+/dbnj0bu1wArcP/lb0uQSqiahwIKldjc+tb
         iWinwYFANJCYeMgCTCTMw7+t//ZjwqtnJZzrw0ss9k8X0xOVORQsXYThC2ura1HoTx0P
         pg4Q==
X-Gm-Message-State: AOAM530/cz8vqUJSP9ZYAaCf+gV11ubwf6oInlqRUrHbITM3cAjnxlR9
	ffq06uJhqirhe5HtJnG29tBrU8Bn
X-Google-Smtp-Source: ABdhPJyKOR+GniADUZOGBWLsz7PGOHXmuQPPztkIyvwWCbQJecqAewQhJsoP3JkQ2LNP/IQJiV+seA==
X-Received: by 2002:a63:5806:: with SMTP id m6mr2123471pgb.362.1594056880465;
        Mon, 06 Jul 2020 10:34:40 -0700 (PDT)
Return-Path: <paulohefagundes@gmail.com>
Received: from daemon.og.opengear.com (c-24-11-33-45.hsd1.ut.comcast.net. [24.11.33.45])
        by smtp.gmail.com with ESMTPSA id d16sm19717591pfo.156.2020.07.06.10.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 10:34:39 -0700 (PDT)
From: "Fagundes, Paulo" <paulohefagundes@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paulo Fagundes <paulohefagundes@gmail.com>
Subject: [meta-oe][PATCH v2] redis-plus-plus: add recipe
Date: Mon,  6 Jul 2020 11:34:27 -0600
Message-Id: <20200706173427.36058-1-paulohefagundes@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

redis-plus-plus is a redis client written in C++ and based on hiredis

Signed-off-by: Paulo Fagundes <paulohefagundes@gmail.com>
---
 .../redis-plus-plus/redis-plus-plus_1.1.2.bb   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.1.2.bb

diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.1.2.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.1.2.bb
new file mode 100644
index 0000000000..e23733b0f8
--- /dev/null
+++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.1.2.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "C++ client for Redis based on hiredis"
+HOMEPAGE = "https://github.com/sewenew/redis-plus-plus"
+SECTION = "libs"
+
+DEPENDS += "hiredis"
+RDEPENDS_${PN} += "hiredis"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+SRCREV = "b08b36a9a91de00636e583307610f49af7876f50"
+SRC_URI = "git://github.com/sewenew/redis-plus-plus"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+FILES_SOLIBSDEV = ""
+FILES_${PN} += " ${libdir}/libredis++.so"
-- 
2.27.0

