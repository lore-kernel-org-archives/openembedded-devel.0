Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11777.1795762917781361400
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=bPjGRV5R;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdebab6fdb3so930559a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762917; x=1796367717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YbVG/u2iTYLWka/1D8nZd6i2tiz2ByUEUU4Ku4tE2VE=;
        b=bPjGRV5RhORDEDQh97ZV/d3VoONjZsfwm3UgGFt15emeCcuChJ+bcqQDAxaZCkB/yH
         2iObViYuksNw4yqxJ2PfleympRj/HFpeYf7GanYiQu5SemSrvTKziGntuLL45eQ4sz09
         Pc9cgiAVnhMp1e++gBmJN2DVdZetxGiSiPXjeOFZ9jV08Fgn9+D3axQDpR607Rktts6J
         2bFQM9UGTFdR7Iee+9i6WVle/LQhyZPCzy9OgUmylWIgW9ni5hrripNBQdG7KhtB3V+v
         urLb4Nl7qS5/+fufR9lFxGeRvo6FyVkGksN1Wt//+JeO8nXM3BZneLtC/0q8amljLPdb
         9ldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762917; x=1796367717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YbVG/u2iTYLWka/1D8nZd6i2tiz2ByUEUU4Ku4tE2VE=;
        b=LblkF/pAwZnO8lBfkhzyT7z0WAVbBfAgYichahVzYsM+ISeFFjwyHd5IH8l1CyfO7c
         HDfrIAu7BWfxyQEWl4V9s8Budv8y2TSlhG+fhrcMe4zF0F1XHxc/OTxuzqdbOwxjEANO
         /i8ewIPy4dCi6WeA007ly/rrKiq+Z2ggdD8xNXEWQiBA5Vmf1Orx49vy7j7cGRSYjvmZ
         GG4YuvSFEcMcmeKRxM5bfbqC1aQjqi96YqB+1n9PAyKRGHyc0wX/4AsfR9GSkNLwWfJJ
         z2ECGzCgpDesN7lDyJHdNFHCfvUy/iuiePnLcSdWNJPOTSUO0Ei40Sr8MWNDzXR5FBj7
         SGYw==
X-Gm-Message-State: APuU4Z9YgXuFzFMN72IOmSvNAZNzmNc8qVU9o5FywA7t4Xcmw1wNTPJw
	Wj3iGyc0aayoSGvKm8fZrRoqUujyeNkXYOMTG/NMuteUAjVlUB7afLhtr1M8DgtM
X-Gm-Gg: AZFdTZffxmr1gqB4GdSy3QMLB7vw4Hk2sl6o2Carlmrk3ZeiuWQ/3CbaWO5WeNd1hdP
	Qsh/S9eY7mBkFv4dI4srvkBu4GXBjYZZ6w5RfTLS8fpdqUGV4Qx5kPCybc9urNxcb2Ea9lWTFT5
	eKk+7D17ph3iPBHzJNaCS6tTCzA1frG3ljVFuu5Bc91PSIu+philC+xaMhwV/2anFQYkEKtFyWu
	2v5tKMxQe7df4tUhi5fMPxMZ4CUIRN6IwqZAze6/784hvLjjrLNaxk/4E8IVcMr6/5KAclCzjQ5
	4NcBdYuAT37lzJ2POPgGejIyPTnlu0lVIjm7jRFKfDnX35GPVi+lQXN2p9wRH1ZQnQBTTNjlZUH
	t7vAq5S0XpuVjS4x1LPLQWV/JK5AQlbTSl4ObV1N8/tt+d1RovcqtDrozPQZ3NcpEI2T6H3+KrG
	icO7ib3aYcI5audJYzLkTHcTcIediNbJ9vVacqDisWIxBPcoe3zPlhXP7NLui5ncsmblXAieVbN
	3kIiwQDDxoqAX8D9122/X5Xwxbpd/oCQjr+okbQw0XdaXvn07MbrpGvNp36zIz32bqmi0ZXC82p
	gZh6a7IjXW7AEC5auNlwCeGlUW7dxAYEBA888UDVW+GVFJ6Gc6n9Yhs1DUMr0hKSepW10fXeYT6
	Q/0oVgmiiTDM2Sgc9MsZZGlkb7kdjNcsKwITgBW5PfR9MmwT7Y3bEJyjfynkBSYbVCBJsAfZGqB
	VK+MnGEbYpDqW+L9xIRuH2j5DFKTL6roKf9jlHkiQujDsWOLnXm139TPuVAHqhbC4dKIw67Isv5
	3uFTEMO1+i05oquaqqcbMCHWbMPoN+Tt1WFG3YNaUEfXCQzXCqLV/RCkAr5jWLF8HJJpoLWXYEv
	B+fvUEDpTkGU/Ntn9mgrDt2W7A==
X-Received: by 2002:a17:90b:2651:b0:3b4:1cd1:c1c5 with SMTP id 98e67ed59e1d1-3b41cd1cd70mr14496692a91.29.1795762917133;
        Thu, 26 Nov 2026 23:01:57 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4efb59622sm6385312a91.4.2026.11.26.23.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:01:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 5/6] python3-pillow-heif: upgrade 1.8.1 -> 1.9.0
Date: Thu, 26 Nov 2026 23:01:44 -0800
Message-ID: <20261127070145.2286713-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070145.2286713-1-khem.raj@oss.qualcomm.com>
References: <20261127070145.2286713-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133325
Content-Type: text/plain; charset="utf-8"

- Pillow plugin: Image.open() with a file path now reads only the
  metadata; the file must stay unchanged on disk until load()
- Requires Pillow >= 13.0.0 and libheif >= 1.23.7; Python 3.10 dropped
- Files with an unreadable metadata item now open; invalid HEVC NAL
  unit size raises ValueError instead of EOFError
- Fix crashes/buffer overflow on memory exhaustion and with a
  preferred decoder ID longer than 63 bytes; NAL units over 16 MiB

Recipe: checksum update only. The cross-compile setup.py patch still
applies (offset only); python3-pillow 13.0.0 and libheif 1.23.7 are
already in the layers.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ython3-pillow-heif_1.8.1.bb => python3-pillow-heif_1.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-devtools/python/{python3-pillow-heif_1.8.1.bb => python3-pillow-heif_1.9.0.bb} (84%)

diff --git a/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.8.1.bb b/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.9.0.bb
similarity index 84%
rename from meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.8.1.bb
rename to meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.9.0.bb
index e111a3968c..8845c2fc44 100644
--- a/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.8.1.bb
+++ b/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.9.0.bb
@@ -9,7 +9,7 @@ LICENSE_FLAGS = "commercial"
 inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://0001-setup.py-support-cross-compiling.patch"
-SRC_URI[sha256sum] = "521ebffb8a181d56c3904e5a61f20903edee0d9d3275967b8fb345f866215c06"
+SRC_URI[sha256sum] = "8a13d15106c9dbbd66a65966edee2ee0de3950c18dc3ea42912442cda803ea4c"
 
 DEPENDS += "libheif python3-wheel-native"
 
