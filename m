Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13572.1793718604725835474
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 07:10:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=UOmfYygx;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15ea896ddc8so7252294c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 07:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718604; x=1794323404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dEU71IS0wwhMDTJrSbomDqDev0IoHSU56kpILI3UNAg=;
        b=UOmfYygx81SymDqMaTPg49CpJMgUhaLznMdcoHyTxj8K9W4w6eq7JjUBoztdzV9Yku
         AwuDiptNCJFPIwIAIxg+ItA4TNx5Pj/VyabvPRKu5rlKVkJ7rfRrP7c8zRNZ73grmq9u
         +Jxb3UY0a5Y4gL0led1EX1EXebB+G8Q8/OnMAD1uTTqQ5uTXA1SxvKbAxf8Ljh1TiclX
         Pa3/+PYiK1mqy92oClfu7Hv78QELLPXVoo8KXADrKsZSGdTPNku0euntdpERIk/BD1QQ
         0vys+m4NVO7ggE6k4GgIdWD/zuoHgjJalr6xvxkKLlZDdUthG5tsM9GeRFDXLASOXDJ3
         vt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718604; x=1794323404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dEU71IS0wwhMDTJrSbomDqDev0IoHSU56kpILI3UNAg=;
        b=vI7blrDMaGaIDe8GX2uF93achcvuEasUM0hjh68to8sWYa8B0CkQgFJ1bBwh3U7RWe
         ltIFsJWkHHqkZoWCNb3YrV9Rcg59FHfdzoEQzxnC90d/FW8mSBcu8LkCwXaoKW2p/YKK
         fAknAuoAd5UYo8ds6aGGF/Pp6C7EYvbvBjvHBRnLouYIaDouo3Yzq9qo541VuEjMfHT1
         W5s+bQZZU+FKumJcCrm2aJ4FD2gE2Z3nx+yvzzPkicrV5/v2JXF/3rXLjMk5j1Ny2+e+
         MOy22UhMsbUfmcMVuCIivAfKEhTQg/M+zg0t4fFmKd/MqqPgh9qndoNOGh5St4pvu1yR
         HyEw==
X-Gm-Message-State: APuU4Z9bWygW8S6x9Oc7T9r8i6gI+y/qk32/JpZBJZKB0DH4T56ezDbL
	n3Ohuir2sepA6bRzOpchNaaW8hGPSUbcuEK1hvg1bD3kbOBhGykzArCZYtZ14gyj5n8d+w==
X-Gm-Gg: AYBFou3rRwyk7WUrrJnh1CyA1Nm6JQYOTWU6ANzNbVsb6vPvQvlV7ACtFXIO9kA5dhU
	HDBHiK8sRrlXv7ETPACikAXHsQDbWoZc5j9hEJERlk6yIqocLci8OJWvjOHjuj6iQ4SvgMz2XuE
	7EFDjIuBzNczgjZc/npQsuzbVQ0tZtNKbWD1/fWT7URdhzaP/tpRUylEAnU++XBj9B3k5au3Pn+
	2j2KnFdtAWCj97SmTzs1dKUWG6HkO9dA8QDGQ87wg3HuyOWQFnCAH587t8rICsZpZkV7NY9GVOP
	Eg+vLj/RsQ6I4bHiNzVbKlavTRbnOTJRsEowehd1BMCv/AhaW5FCkY7VAAXURO4Ibgk7Bbo/MLM
	twqz/XnZPnCLZ+awpAYZwjcgDh4xQ6g/WbvWX6VU0bdWmh1Amke4WGUGIbZfzs64C7jNSd+KtyT
	G/bZNduIiyOtxpLox+Nli/zB91TnlYG2GbJFDD8ENRylk5DWM4LusqqL/TwsJkiTIhBKK109CtY
	AUnrHYe/91tjC9yCcsr3haxM79ziw/ZGDuo5wwQ1NSqwvsag24BJg2pQPgyYQDuMNEpcWep7Ikf
	l1ZlxkJbY9pO3HNM+6kCnsXp4w4BAhZT+kebiSIGZDiaqge/wilAJI3eZgD6rbtg7TiTgf/+wTA
	8CIN5x8m+XYoqh9DbOfNlIQM6lyl++2089+v9taYMW5WW0A7PL5efFEIIbLz/SQoi9RU+2r2Spf
	DWtm1Jdd6+cfXWrA4OWNWEQAoUVBkd1s2lDtLePrzQG4BpWySzYcL3q4PLN/TkFkWXPmMCA87Vr
	0xnE4AE6NE3z1Y45IXtTADll7vn1edJ40b/iaIa1XqBnu00x6XuDw0lnB77AGrXIGTzpjFuQI3D
	SVlZ
X-Received: by 2002:a05:701b:2087:10b0:143:7001:7645 with SMTP id a92af1059eb24-1ac5d889adcmr20507076c88.47.1793718603701;
        Tue, 03 Nov 2026 07:10:03 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm75076204c88.10.2026.11.03.07.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:10:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [meta-python][PATCH 2/2] python3-tomlkit: Remove recipe, it is in oe-core now
Date: Tue,  3 Nov 2026 07:09:59 -0800
Message-ID: <20261103150959.4060867-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103150959.4060867-1-khem.raj@oss.qualcomm.com>
References: <20261103150959.4060867-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 15:10:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131796
Content-Type: text/plain; charset="utf-8"

python3-tomlkit was added to oe-core (46d3b26a63 "python3-tomlkit: add
new recipe (from meta-oe)") and is at 0.15.2 there, so the meta-python
0.15.1 copy is not used. Drop it, and drop it from the meta-python ptest
list as oe-core's ptest-packagelists.inc already lists it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 -
 .../python/python3-tomlkit_0.15.1.bb          | 21 -------------------
 2 files changed, 22 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-tomlkit_0.15.1.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 6e4af06aaa..5e999e6f1a 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -115,7 +115,6 @@ PTESTS_FAST_META_PYTHON = "\
     python3-time-machine \
     python3-tokenize-rt \
     python3-tomli-w \
-    python3-tomlkit \
     python3-trustme \
     python3-typeguard \
     python3-typing-inspection \
diff --git a/meta-python/recipes-devtools/python/python3-tomlkit_0.15.1.bb b/meta-python/recipes-devtools/python/python3-tomlkit_0.15.1.bb
deleted file mode 100644
index b0c51f21c5..0000000000
--- a/meta-python/recipes-devtools/python/python3-tomlkit_0.15.1.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Style preserving TOML library"
-HOMEPAGE = "https://pypi.org/project/tomlkit/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=31aac0dbc1babd278d5386dadb7f8e82"
-
-SRC_URI[sha256sum] = "e25bbf38843005246210a12982776f27f99cb9be67160e14434d0c0d21ee1e97"
-
-inherit pypi python_poetry_core ptest-python-pytest
-
-RDEPENDS:${PN} += " \
-    python3-datetime \
-    python3-profile \
-    python3-stringold \
-"
-
-RDEPENDS:${PN}-ptest += " \
-    python3-poetry-core \
-    python3-pyyaml \
-"
-
-BBCLASSEXTEND = "native nativesdk"
