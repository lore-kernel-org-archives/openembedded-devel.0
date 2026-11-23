Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48056.1795411893906899036
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Ule0KbSq;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38190551625so6116238eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411893; x=1796016693; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4TTCd8UaXuxIZyg8dJ1mC8gI1uUuG46l2Xg33sagoR8=;
        b=Ule0KbSqjpVmH+7xLmd9Api8HDGaAOd+pijzctjbNNIXApngakIuheH2M5aibIwILU
         +4haQw41If6FRl2EcPOOr9y6mI9vlRkvqSBkF6C9swIBbT/DyTx5Y2NAWt+eKxQf7A6P
         cIh1qcx2LkrvGCA4E/NKuaTguEh1ZOG6G45G1HMb9Ph+ZYIgRlQ/9aQJQupizMy3q+I/
         CPgVIovxye+eqXlnlEUUcZZUnld4IFrDBLzo2UVAJTUtHzk5Cp5ub3pfBtZ+DhB9K+/p
         cfXk6CvHwzeAmuZgwXNmp4A3W2TiqUUR8EEzQODgeXqVMpxnjjwFyAT8ML+bNeruW0Ms
         oOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411893; x=1796016693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4TTCd8UaXuxIZyg8dJ1mC8gI1uUuG46l2Xg33sagoR8=;
        b=jH2m8MYnnWB7id4Fi2RWnvKmQC7nJInL7Ws4LnfWxWdmB6bKyRS/zoWm4M5OJpG0Pp
         h8zRwVpeq3ShCDT1SkENLt3h3V5jkc3VIfmuxQE26NXsmOzVwh2W5lTb7Jtz8ESaNBAT
         gGSH12IZwp5olWCnrjaP/mYn3ZAY48MGEDmMddC/dKZ/Ed72+FOQePf3fW4rF1B/cScS
         qgof5Ac97H3R+iH5q4gQNOC0zn9v0b74iD0fhRSeGIlKEFhHxFyGtHH43XvoSto58crj
         8IAb9WcW/oDHim4NY4BS3YeO/e4/VV2qFzNhXvJOlbkLb01qXE9xEcvsNGw1UiWxPeSE
         EMAA==
X-Gm-Message-State: APuU4Z+OiD8/TwmHBXNdWiSSEniSFY3lZagi4FsGtNfdpE8o2V4RGE4k
	tCoFuT3AzUfUvm6M8M+SEFWZuISLF4iafWDsLoNMpSN4ZGT10OGPrxjtexC3c8MKFFc=
X-Gm-Gg: AZFdTZeK+WUcUDdBh10adQctUQj4GdrnYHTNFV8ZvlhTHy0ctUBpdb4wX86bOoAW4fz
	O3FQbJPDN7ROkcRmBjzjAjQ0A2yKJLVdWTBpkunfgEr7OlUD26N/L+gD3tPkoqqeop3LCA1zg4C
	P2xC83KsWjq20Lmir7dRhvCskzYxpUMtvAgBthcVO4LYslPrnFYn7FHdFq5pKu5C0pe1M0tFARf
	Kt+a6fuTbTakx9rmFEiCo9pQgUYM/u7E4IXQyc1oZ7kSNNeAfEuKwMc0wUnQuiY8mT8jP0QB6VS
	oQSAfpRCwA6XNJcv4E5UT6ZrruGIlN/wclT3sAOvflltWRshCDuBw5q42RQECLfZ/pwLrY5NRF0
	RX5K1g97UfSYKgQnMliAajkGM/73+zGt4s/ndu64QbzSwDnFKRSXi+zPzQK0sf1rMiKoGkwJjMd
	mAd6Bc6/YZP1INDZL5DATqDDV7dM1oXztRJqzGwgiOZuJ+54CKPuasdp2WBsafU8s8LVivB6sNf
	6JrUrUpYKfaIp2lB9dY9/m7v2hf+UBR/5dblhTb07gpWbPg0lo5b8S7rIJEYyJKgdhGIUTPZpTN
	JNZVufVKLB3BPT8MZwRV/C2JppHWn6KYy8HyoW+8ptvY+oIRB+NAWt398WSp+Rz4OUfMwChOZll
	QXIRAmQqhhD/jXrgLvgtf+4Ci6+gPNR4WUzHUpJ15ur54BBdpr6DCh8Dnf9KG7tnPFPAWE02SC8
	CS/lBVZfX+fgUSy/QuODfjNI5QL6m9sn75BfFC6OT6jAwXFlb+JS6v721WJps6DnMWufnmF5GZp
	Re7U0bgBQ+ONFt+IXwUGpiBaXXjpqQZs0aXa0YM8e50bVidrzh1Cen3ZcR1rcRSMNLGWft5X5B0
	W4NE
X-Received: by 2002:a05:693c:8850:b0:386:b351:d5eb with SMTP id 5a478bee46e88-386b351dcddmr1414366eec.7.1795411893208;
        Sun, 22 Nov 2026 21:31:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 05/16] python3-grpcio: upgrade 1.85.1 -> 1.85.3
Date: Sun, 22 Nov 2026 21:29:35 -0800
Message-ID: <20261123052953.3658549-79-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132866
Content-Type: text/plain; charset="utf-8"

Bug fix release: fixes a deadlock that could freeze the whole Python
process when closing a synchronous channel while gRPC background
threads were running Python callbacks such as call credentials
plugins. 1.85.2 carried unspecified refinements and bug fixes.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-grpcio_1.85.1.bb => python3-grpcio_1.85.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.85.1.bb => python3-grpcio_1.85.3.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.85.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.85.3.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.85.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.85.3.bb
index 2668771ede..01848eeadf 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.85.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.85.3.bb
@@ -14,7 +14,7 @@ SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
            file://abseil-ppc-fixes.patch \
            file://0001-abseil-raw_hash_set-include-immintrin.h-instead-of-b.patch \
            "
-SRC_URI[sha256sum] = "5f530287d5de5f7f66089ead81de44f6787162944dab3922efa65dfdff108a1d"
+SRC_URI[sha256sum] = "8e18f15d1b09b8771edbf59d634b26cbe4903bc2577cb667264934a6655eb8b4"
 
 RDEPENDS:${PN} = "python3-protobuf python3-typing-extensions"
 
