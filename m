Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8112.1795739782796918940
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=LYYSnh3+;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f0414c1062so45286185ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739782; x=1796344582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wjs6DDv8fpBijAUetEp6s1SU7lox6GvmoM0dnxWEIlk=;
        b=LYYSnh3+x4zezWpCsgfgI7YvMwFMJBtqm2ljnjz+ucRZcEriYdH4e/YW/6NkG/WrQj
         1TWxNgSX44qoZOKZrUyCRfDflp6Q2nYcP+brMyX/rOP44z77yiTNgM59bTdQ3NPQ0MEo
         cNjrgni0fQgUBF5dnX/YiwWJaMfaBkM+TxFIv0DmLKU7uoVA361BZwUEjK9WunHCyNKr
         kuSZ43/UPFfgV+ciibnEx+UO9NFQrD29KjR9CR/V/4Fngf66gpdWNaZ3fDgOXd96GNgr
         Dr951+HaFTmSutlcI55LtXql3K6vkNQd0ivYAUQr+fDIwIOPFABg2EV4QJ6JLeJKVgck
         +3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739782; x=1796344582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wjs6DDv8fpBijAUetEp6s1SU7lox6GvmoM0dnxWEIlk=;
        b=ubv9DSljAdhg4/vanhIwBtqkGpD3+DvhrIkpmxnDBZt/0Y/29SRO8TAJ11aIDq4g7C
         znv4jX5I7HXleSVYfx38Lu+gviuRAwYhjPISTh5DZrywYaaoH5/zPikygWF2KtlGe0pJ
         +mP+jz2zETTlH/gTmJHqv+WWrvbKlAtg5uuCozFMxZZo30sKkyXZFVBlWvN00rUgEveD
         /idCujGjL7whxRXLQ49/aPKrvDFAmaCrxOTcY1FHaVZXO4GMIlh9QsRsW93xhiDsICzx
         VVib96hhfzWzgUyRp8MWw3XCBXpI20jCVLt2VCFcWgXiKdQu799cx3x74RQatHWsVNl0
         DM7A==
X-Gm-Message-State: APuU4Z8a2kJU+2gWyCAUXkXQMyZvV1IW8pzKXCdLg5+AoYuysyDVl2rI
	6eGRxilZwbH2mR9FjZSR6tet18xVZLYgdImF+miaImqb1LtjR2aGe8ZrTPcuaQUi
X-Gm-Gg: AZFdTZdWsVaO59O4nk4GeAbQd01hL/UTc0cNIc6GeW58UyQa1BdjvYI8AKKJ7rWrCa8
	hs6mJ+6F1DLB5a4uMMsRp5kSM/4oP6omIelSK1xUlCakrJZZK6F3ltjdCGCYbvP+lHlKPxxtGlV
	s3wb4BADRZsAPmFE2OGaoOjW+VnBhLXbWFf92UrFWbMTaIZBZMQpNqOEFyWwcz2tED8kW6+DINT
	gjYp6U7X5DcmZ7z1vEzaw1JIpYSvlr8ua2eWI0m6/mx55/mDA5plJW9QTQDRoG/ziOZ5VTKaVRY
	Zv+ZHc79VtuIcHyVIqZmxsWWbjcfTyT3jHYslrUnxb2N23/v3WKnOTnH3EoEaTmJQl9ewNOX9f9
	6pBRn6ru9dEVn/pWPXjTfeGRCwaiaBzB6aOGOfewjfSWp8hf0pF9eT/eMBDYAcrZ8EbLndxUraW
	pwMCZsEBXlxEIUK2pKRRmf0mEnH04l6cazZoB2wgggp1lSqN/wcF4uzPyN8vDhCbPJE0lXXjfxw
	cxzKSaeSfpR45ecnS82PdSOMhkLd4lQplOvT10PnN4boZDT8oAc8xU/WXMqnSQpR+aNeDCNsqXM
	HIWea4PKxZvCfkJlDT6kjjhPItefag37SYy4PpDJyvuyzCaMdoJP665ITXXh2ro4cca5psQQ1sS
	oEvRJxSiptEMfC7is9ConthY7VKpPmM9MvaAuEFNQwEzCbeDtQwxNL21TIrT8x4EC0XwN0P0DP+
	WPjWYU3LLry84rHWkTjw4z0CcgdE3cEo739eVi6slsHEPMhD+KOBUw+f9GCNC21SfwetLb106W8
	62D9CqSpSGfo1qacpbSv35Xwr5tQYVnJ51+g4xT+g79bf6XqDAGpl3jwt3vRB/9GTCYW5mtXhT2
	hDki
X-Received: by 2002:a17:902:ec8b:b0:2e9:7ff5:5462 with SMTP id d9443c01a7336-2f03f1187f6mr189844095ad.22.1795739782120;
        Thu, 26 Nov 2026 16:36:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 15/39] grpc: upgrade 1.85.2 -> 1.85.4
Date: Thu, 26 Nov 2026 16:35:19 -0800
Message-ID: <20261127003543.2167775-16-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133185
Content-Type: text/plain; charset="utf-8"

Patch releases on the v1.85.x branch:
- 1.85.3 (Python only): fix a deadlock that could freeze the process
  when closing a synchronous channel while background threads ran
  Python callbacks such as call credentials plugins.
- 1.85.4: refinements, improvements and bug fixes.

The Core and C++ sonames are unchanged and the build dependencies
(protobuf, abseil) are the same. This keeps grpc aligned with the
1.85.4 python3-grpcio recipes. 1.86.0 is only available as a
pre-release, so stay on the 1.85 series. The libatomic patch applies
with an offset only. Add UPSTREAM_CHECK_GITTAGREGEX so that
pre-release tags such as v1.86.0-pre1 are ignored.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/grpc/{grpc_1.85.2.bb => grpc_1.85.4.bb}  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.85.2.bb => grpc_1.85.4.bb} (96%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.85.2.bb b/meta-oe/recipes-devtools/grpc/grpc_1.85.4.bb
similarity index 96%
rename from meta-oe/recipes-devtools/grpc/grpc_1.85.2.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.85.4.bb
index ad4198c35e..4ebb890406 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.85.2.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.85.4.bb
@@ -23,12 +23,14 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
 # Both dependencies are mutually exclusive
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
-SRCREV = "5a9ca1fb6bf364dfb1f9396cc020219ca7d117b2"
+SRCREV = "ee6c934222c4ad96bbec18845c4d8e8762983189"
 BRANCH = "v1.85.x"
 SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;branch=${BRANCH};tag=v${PV} \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
            "
 
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
+
 inherit cmake pkgconfig
 
 EXTRA_OECMAKE = " \
