Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 191996060B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 13:38:28 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id u131so1655027pgc.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 05:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7bR8aDGO14w7ARfOlq82DjD9j82470l/Ca3WFRKwtk0=;
	b=uSLSk3gH8ZASWfPV35P6Iq3UKe9FtWyNJr3lXa/FX7VsKVS8yAe+wKHkbVAvzlrQAz
	+SgDYbEuCMziweZyoQHd4roxENc7iAK9Yivvz3M4NMSVGXGRTT8Y7umbEh/UZ/rLTp/L
	48VfC0u2nH2BZlFrksZbrSGPtt0ziUIC7DV8WAOQVsz/SbdSDLazLkpAMVt1uuly1vry
	s5UEukOVgK8dsuz/t8OTAqjJiXtREfeD7n5RpJZdDHUYN7r+gNQKalUepF0Hs11ZoK2d
	3WXWdGWrYdf2WTNsiCi0fXkmkOqbEeugWNPfxyw5EGKmEbS/m0apaZZmApzwEJh7loK1
	UwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7bR8aDGO14w7ARfOlq82DjD9j82470l/Ca3WFRKwtk0=;
	b=e4f9xfByOt8RvBq3UBp2Z8Rfw1FJAWtOS17dm5213iAARnZed0VNxPfzw3nF20xwfJ
	3uSI4OfkvMwJG6ZQ1R/lpdkgqrxvpStZ+WCGman5/UG+rApMoW9x7rguiisfaEji3+Yu
	pjmsvGeQTRUzqOs0mLgvnMlC0KSI9nn53YC0NVAbo3Rl7vqj48SmTA3bgmG/aJS0p4cT
	WgTgM0zZ7t4AC8VU0X4KJ0Gj7u6qp7bjR8nARiPfmyglv3XUUzz4l5ZpFZCLm8coH341
	FdzTpUGzk6J6Tf8VaUcMaJqbQ2dz1/WLbe0uNZ5/uHSLNL5qxexg+GM9GmzzP6QCTjWU
	n9sA==
X-Gm-Message-State: APjAAAXW5d3rh90XDOv2MaaR8CQIfUhYwuEkuuh/om/40Xtq110fPlkx
	CLUPVwMBZvG40V4F8Z/+JmJxO8ov9sw=
X-Google-Smtp-Source: APXvYqwzkbNi5QJCdDNvfZib/Juu47pfi05+2OcJfgB9MXnf7xGmLdr00zo+ND+X8d93tXNyj3J0UA==
X-Received: by 2002:a17:902:b210:: with SMTP id
	t16mr2067269plr.65.1580345297109; 
	Wed, 29 Jan 2020 16:48:17 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id
	144sm1468475pfc.45.2020.01.29.16.48.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 16:48:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Jan 2020 16:48:17 -0800
Message-Id: <20200130004817.3056107-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] wireguard: Upgrade to 20191219 snapshot
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:04 -0000
Content-Transfer-Encoding: 8bit

Fixes build with kernel >= 5.4

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...odule_0.0.20190913.bb => wireguard-module_0.0.20191219.bb} | 0
 ...-tools_0.0.20190913.bb => wireguard-tools_0.0.20191219.bb} | 0
 meta-networking/recipes-kernel/wireguard/wireguard.inc        | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-module_0.0.20190913.bb => wireguard-module_0.0.20191219.bb} (100%)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_0.0.20190913.bb => wireguard-tools_0.0.20191219.bb} (100%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190913.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20191219.bb
similarity index 100%
rename from meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190913.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20191219.bb
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190913.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20191219.bb
similarity index 100%
rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190913.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20191219.bb
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/meta-networking/recipes-kernel/wireguard/wireguard.inc
index b0b48d0dd0..1ebe7cdfba 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard.inc
+++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz"
-SRC_URI[md5sum] = "ec2345dfc8ffc61ccd7529d5d19b2602"
-SRC_URI[sha256sum] = "997327185d2d1b597dc118f737c0c165e2a2c21453387ea02659f1159d148518"
+SRC_URI[md5sum] = "5175ca88850993dc88a4c9d924ee79d4"
+SRC_URI[sha256sum] = "5aba6f0c38e97faa0b155623ba594bb0e4bd5e29deacd8d5ed8bda8d8283b0e7"
 
 S = "${WORKDIR}/WireGuard-${PV}/src/"
-- 
2.25.0


