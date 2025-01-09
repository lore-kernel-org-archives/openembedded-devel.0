Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F26E7719D
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 23:29:55 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.7133.1736465394027345869
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jan 2025 15:29:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HnQkUeoH;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2165cb60719so26236335ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 15:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736465393; x=1737070193; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btGC2Cfg8FSW/BFAcPYXYz6xq0XloY3vNvZOUUk0XGM=;
        b=HnQkUeoHVYc1KEPul9It60+Sj8fbKN+oZFbOnqKArabfWplsS/YmbHYgLtkDgQ2USm
         h5Ffgdx5Qq5o7XOvU9jmVF5grCNYe0Cc9vyAnWX/rfiPA1Fq0gCMcxhg8tOzxbVuzwTC
         a62tlLu6ZLSeoUhIhbqNDV+2vNb8izUXqoBzH3BkSwTzlH1VgU7hXF0lHUHxjMspz89A
         Ns4wPmypXHOlxoNSZzkqUrV7Yf+Ph4DfUDT4bMNBr953YZRpJCXNyXbbYMfPFEuugJ0B
         i77cSj46g6PbTYrUaXZNAYYLW6AlQWQZQ2pQWfoW/Xavc7diw2la3Wsl/zEhsX5NliG1
         xIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736465393; x=1737070193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btGC2Cfg8FSW/BFAcPYXYz6xq0XloY3vNvZOUUk0XGM=;
        b=SKTAPAQSGKjuSlMD5O8AFUxP46RfMP8q6LVNxqnpcWeOeeVBq/exU8Jny+92CIhjW3
         3DKqIQ3Nxoj6HZcCg/mvTn8LVnGzqAIXzYLFKRMcXLHyK+fn6Iy+rHy56nj0iukd6pIq
         hIfTX6HHelLGzVTBzpud1Epor2rix3T3p2VauCoQq9gtun/7IUPDPxXWeYDRT8TTmF36
         PNWPSZKhbRRMyVBfx/q/txoGnlt9aW9FFAT5BRo94mgx2pAtOvEJu+5nQW5JW/uwbwN1
         t1PfXv9/PoBoA9FKEw7JWLPaPex+DJFR/UfODWH2kINJAX6ez6Y9d2VzggsUZtuztZxZ
         NCNw==
X-Gm-Message-State: AOJu0YyFBPZGvVGJWi9klqhuwYEamiqYr8hL15AI1CVx0WdQXHfdWqRy
	diitJ5SQYUwI0wbtPkgM7/w8jrn1Dm6Qej9BgnoVcrNL873BOgWh4G9XyZeI
X-Gm-Gg: ASbGnctBQTmBw9rmA7/5YBVQ13YNhBZy4kD0pG8KT6ubSEkTk9SNFIyctnHVJODF6Uo
	vziBsBqQBILV+2slHPFyyvdIzGByKKOYzKn3G5Ix9R1xqGkqTIKEHozz5Dz/BGQ99Beqx353yqy
	gRgfoQepenKDXEhcX2CpYKbYAO/LRgBufYnkUmgEZaoWeIBFciLC90mKbUMjrq1npR0PW4Y8/EF
	Cc8Uc9XgdR1ctBxozW3+inl3tyK+q5ddRSuJu4xgudNhVnk
X-Google-Smtp-Source: AGHT+IGOIUHNSEv/nWy/8ehPoib/q489TCAoGvbchIBuiyk+zjxjPQas1W7r4dgtYBCXo1QOd4cOcw==
X-Received: by 2002:a05:6a20:a10e:b0:1e4:745c:4967 with SMTP id adf61e73a8af0-1e88d0dfa1dmr13816286637.3.1736465393078;
        Thu, 09 Jan 2025 15:29:53 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::1344])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31d6a0b140sm1804500a12.60.2025.01.09.15.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 15:29:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/6] spdlog: Switch to latest on 1.x branch
Date: Thu,  9 Jan 2025 15:29:45 -0800
Message-ID: <20250109232946.1556083-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109232946.1556083-1-raj.khem@gmail.com>
References: <20250109232946.1556083-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 23:29:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114761

This gets up fmt 11.1 support

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb b/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb
index c6adf5a4b7..060995df80 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.15.0.bb
@@ -3,14 +3,17 @@ HOMEPAGE = "https://github.com/gabime/spdlog/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9573510928429ad0cbe5ba4de77546e9"
 
-SRCREV = "8e5613379f5140fefb0b60412fbf1f5406e7c7f8"
+PV .= "+git"
+SRCREV = "7f8060d5b280eac9786f92ac74d263cc8359c5ed"
 SRC_URI = "git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x"
 
+DEPENDS += "fmt"
+
 S = "${WORKDIR}/git"
 
 inherit cmake
 
 # no need to build example & tests & benchmarks on pure yocto
-EXTRA_OECMAKE += "-DSPDLOG_INSTALL=on -DSPDLOG_BUILD_SHARED=on -DSPDLOG_BUILD_EXAMPLE=off -DSPDLOG_FMT_EXTERNAL=off"
+EXTRA_OECMAKE += "-DSPDLOG_INSTALL=on -DSPDLOG_BUILD_SHARED=on -DSPDLOG_BUILD_EXAMPLE=off -DSPDLOG_FMT_EXTERNAL=on"
 
 BBCLASSEXTEND = "native"

