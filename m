Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B491CCD98C6
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 14:21:17 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.80828.1781014875001316861
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 07:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ls/gb4QS;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-304e83724bfso6826568eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 07:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781014874; x=1781619674; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JVvxKviCxd+Mtq7yljxoyQAccsQLiX+RROMSHSUxqc=;
        b=ls/gb4QSzm1D8Hg1E7Mc79v8uHoIgOkEDLdZSGc1igDW3kJOfP1bhrHrDZnRlaNdQ6
         bZ2w1vR+68Eo3jSsb9JZXByjQiHMh94WG4n2bTyDFdO0rkaLeAeZW6dTOqvgKuptUAoJ
         rhpyckstbWuaYlVJsli8jQ/viwDg4WQJW2sakH8/RdkxBYz0iJ9xLNTFKBhq4m5jT2Ts
         VBkJLCLPu9v7yzZCsvGsWa3xzPOOU6fQ8C2gGBWm6saTdYtcyupThrLaG36k8vURUKXR
         SRuConkhIp+SURwcl6LUPAuvx7+/CaCfiD4d1eruzIQzciVGHITFEbHX0rVRZVfAf+im
         CAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014874; x=1781619674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9JVvxKviCxd+Mtq7yljxoyQAccsQLiX+RROMSHSUxqc=;
        b=q11A2u2gAyB69eZlDL75bbS1r6NPyzR4Vc9aw/1lV5OTM6NPP0CLHBWSTQn8F20Upo
         KXj3sqhQgPWj1q+EXYd7rAQmC1T2vLd1p9IZZksLrXNoyCq0KK6YDF8/sahIL482uGlP
         IdEQ2kqtQsiVT7KreqIx9XuyzkdeN0lg4y1rgeiJAt07piKoK3DnbwWne5hitTNTZ71l
         kHcXkfpV+Si5dW6wvkaqA/DNNqBCv+dcDpUciZ7A/BiJJh2l5kyYGn+KmxfY6oZT0yAD
         yGSn2TCcm6EjYtbdmDIg8QMA1K2VwqaYMqgf96UkuqcgwhC3+AkVWT9o62bqWsIXtuI0
         h0xg==
X-Gm-Message-State: AOJu0YxNveoR2pqJUXquUn+k0gnRnHtzJSQ3m2vs3SN7Tbs+9G3RPhC2
	Sf0lTCt1NUtNvx3VVCyjHMAiVXVpfYRI0TiG9OvQsCkIeGET5M7dc+UlX7OhQEfRDGAy1Q==
X-Gm-Gg: Acq92OGgrObEr0GepeZZTQkc5g3QrrMsfnSKQR3TNfSjZVWwdu3ukIYtDbXujqLZJzA
	0q1FPxsEzq9apg6gwpDyflcj/on3MmtCcKUvUjk52FZ9M1kRhoAdOdlH74+V8SXI+RRoXNysPuP
	o2bscKF0jWqHYzkl+UiA8EerGEpIB4naNxxIR0LkDyeH7yb17aaW669nmnI48Fu/LeGbfN+dw3n
	BOs6kOwUzw+9ZRzFDnR7jDsl86cMzxJwTR5mVyu1h2JuTKyQgaY9k/5ZtdBhHXlt0At3/PiSuEj
	oUInJFKrYsadKCtigDNejDxtJLjpo3inVRAukOJLIv5MuVfq8qly06SsX0TOqDIM4+IY1uF/QKa
	Ocicd1BIkgX6fHtFNLLXc0CrBWgvwrmoNSC056PpldgzhYnEfPdeEjM9dRUVJBpK4vNT62Vjx4e
	/sKbOBKlZTbKPNOG8DGwlrNXfDxmruW4lPi6xC30M/7k1o4ScSbO7i+jwYauks4ZtpgzEOIi8Hp
	Xmxd1PLpUQ8Bd4Hy07sRXeFZyfuM8x7AAjCEj09fRGtnV9FOqDa83MUr6yuKEF1+Z32OTBsDg+u
	B8forEFZWtQ5DSnQVPg9sClfA2pk/49Stc9NpNR5DxlDPuguo1Bnz66Ast0E7Q==
X-Received: by 2002:a05:7301:4198:b0:303:f26f:df30 with SMTP id 5a478bee46e88-3077b741e28mr12438491eec.23.1781014874326;
        Tue, 09 Jun 2026 07:21:14 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df3b234sm27099386eec.23.2026.06.09.07.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:21:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 06/11] font-bitstream-100dpi: upgrade 1.0.3 -> 1.0.4
Date: Tue,  9 Jun 2026 07:21:00 -0700
Message-ID: <20260609142105.1439225-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609142105.1439225-1-khem.raj@oss.qualcomm.com>
References: <20260609142105.1439225-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 14:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127493

Upstream now ships the release as .tar.xz (no .tar.bz2), so set
SRC_URI_EXT accordingly. The COPYING license checksum is unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...stream-100dpi_1.0.3.bb => font-bitstream-100dpi_1.0.4.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-font/{font-bitstream-100dpi_1.0.3.bb => font-bitstream-100dpi_1.0.4.bb} (82%)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.4.bb
similarity index 82%
rename from meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb
rename to meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.4.bb
index def7357e3f..5a05ae9728 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.4.bb
@@ -10,10 +10,11 @@ DEPENDS = "util-macros-native font-util-native bdftopcf-native"
 RDEPENDS:${PN} = "encodings font-util"
 RDEPENDS:${PN}:class-native = "font-util-native"

-UPSTREAM_CHECK_REGEX = "font\-bitstream\-100dpi\-(?P<pver>\d+(\.\d+)+).tar.gz"
+UPSTREAM_CHECK_REGEX = "font\-bitstream\-100dpi\-(?P<pver>\d+(\.\d+)+).tar.xz"

 inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"

-SRC_URI[sha256sum] = "ebe0d7444e3d7c8da7642055ac2206f0190ee060700d99cd876f8fc9964cb6ce"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "2d1cc682efe4f7ebdf5fbd88961d8ca32b2729968728633dea20a1627690c1a7"

