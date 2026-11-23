Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48052.1795411890053594559
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Mza1rzfg;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-386ab9ab619so1497289eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411889; x=1796016689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sikmIcfGJ6AWjIBJ5USP/FVMhjuV6IAR0OgF/zzFu+I=;
        b=Mza1rzfgNtUyQicWUXURJeMH0OjAzihR445uoI5966Xj5TtfRaXFKOH5xqi1ojQGXT
         SYMwU1JEfSuYFytCqetGkdUadSxZT5DsOWqi2DW0NkP0vsCqYOEkoClBsRHNo8Sj+eO1
         1LoqC612L6Zec0h68IlJvJKIeeqlbaqZjhsU2UmfrW32r+yOema71jsZVhSZTrEXQ1wl
         IA5z6jNyvqna2m4T/b40pvS7mODgeLpbG9hMPAwB6WUr67B9eIT0xJHiVGCfkPc+qZiS
         l7941FTEiokb5JL5fenW9Dx1gdewGmSDSVfkDZF3b9qKtf5RJpoMtPqsEgJCZ9OELR/3
         zMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411889; x=1796016689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sikmIcfGJ6AWjIBJ5USP/FVMhjuV6IAR0OgF/zzFu+I=;
        b=Mrwu5f5+v8M+3SoaWlJsEqo6pr8CjA75A4JDVq6MIM6rfgjJoH39XeHQayZwjleW/g
         57fNbV9MbpN/Ppf70hBbfX6JI2CSvVp6qxMKRj5daekMmsVSKvus54mR/N3A+ybOZ5m0
         FIKQFsv5stz76Y2UcQ/erCmeOnOhsYbi2vvVRYlPJla86G92umef66TZWpxQhnaywonY
         9RNI/mVqvSMVuElu1qyo9/4qQvUq54VroESXP2vVjuUlBBY9z6v7gSgmyz3YxvlZ/rM1
         yGI6u/KwkspvlFl6n+17sRr21qTW06nqqf7gaJWLYCOtTqdIWd0ojFTRiKiKSB0GXoC/
         txFQ==
X-Gm-Message-State: APuU4Z99Qib4rksIKDSSg8n/E5+ugiI9wAW4k2c2Feo/bL2yR7hZ9LSR
	ADSrZFTbkW6o8k/fhAFKPc3DdbFvJeEAHa50LjnYIoDOVCV10NaVGgmuVcySShzqTZY=
X-Gm-Gg: AZFdTZftPNOiLv4T+udsLFYutjh2ZAF2wjIuK+Yv0EuhrMsupQGPZDOWb+9xFGA6+z6
	VYKqAlj99DezX/5F0443K0BI0c3HBs4wVj/P6DUaZYFrT2F5EBfMjB+d11EpugxfVFHwL0Qen5S
	7H+TrgyB5BPu3Pm6dRSCZdy7QCtTOM8eL+B9hfE9QbdrL2vLxBbNR5b7dFwUzy/i16RYQMRyXUp
	br7klx8yQ3uGEhUR9Fxzf9/HjVj63pcETiiuUQyinDksXswec9CvpfDNRMWs8sL7LBf0Z/6aBBf
	a0Ogi2L3KoXn3hkWUTT11jUe6HPL3mzGZ1gWagFIxAwuaAD4VihBgz/ak2QGjMW6PR4vLq4MPZD
	P3YFHUywRVI4vNaA2HhzKmxGMNVY+xsJVVH9VMlAX2UA1jkESHeONNsjqXV7xOk5T0XtcBmaHXr
	91CsWtZd0IjjI7bf1Ef79/FvFHpowPgjmvr6MD3A8lKsok/sJJN+bappyritgwCKFwEVvlxaILZ
	+/nQSgcUnTtA6HOvqOnp3/D5OgyKDlnufYer9Bcm1x61AGu68wt3Iy01oYnyVf6YkjkoOB34/gi
	f7MElaFIz5DnIfB8ZasePXesRKnaoM6xeavHijR9W8/QVnUTxzti8/uXjgQm6hHNERkJpmB3Ypi
	HLeyRAlz7ugU9wHQq9z13v8MSTyfYrA8w+H0Ps+SiTt1wPREqHMSCnsL27L5ytv07z3rW4aGbnx
	3dQEsOde5tUvP1fQPQnPH0ea1NX3Q0IPOyfTe0GczQMS8L42Alkesm6HqCjH3nW7GWuBd3pcNtL
	QJ60fgBEwzytyaiNNPZ4iFuSSha06Wcy/zctd2tONfWhzo67eXPhlI2ugBHfhyH1mQXV0K76D2B
	r0CI
X-Received: by 2002:a05:7300:1486:b0:383:6eb6:5730 with SMTP id 5a478bee46e88-38570e24c0fmr13009671eec.32.1795411889402;
        Sun, 22 Nov 2026 21:31:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 02/16] python3-decorator: upgrade 5.3.1 -> 5.3.2
Date: Sun, 22 Nov 2026 21:29:32 -0800
Message-ID: <20261123052953.3658549-76-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132863
Content-Type: text/plain; charset="utf-8"

- Add official support for Python 3.15
- Preserve each __wrapped__ layer when stacking decorators
- FunctionMaker preserves positional-only parameters and, on Python
  3.14+, copies deferred annotations without evaluating them
- getfullargspec is reimplemented on inspect.signature and no longer
  follows __wrapped__
- Fix FunctionMaker.create with return annotations, generator caller
  return values, and several dispatch_on StopIteration/TypeError bugs
- Decorating a functools.partial no longer alters the original

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-decorator_5.3.1.bb => python3-decorator_5.3.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-decorator_5.3.1.bb => python3-decorator_5.3.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-decorator_5.3.1.bb b/meta-python/recipes-devtools/python/python3-decorator_5.3.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-decorator_5.3.1.bb
rename to meta-python/recipes-devtools/python/python3-decorator_5.3.2.bb
index 611db8a3f5..7446fc2409 100644
--- a/meta-python/recipes-devtools/python/python3-decorator_5.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-decorator_5.3.2.bb
@@ -9,7 +9,7 @@ decorator, just because you can."
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fb3c386712bc6cfb52aae3692d1ebbd4"
 
-SRC_URI[sha256sum] = "4cbcdd55a6efadb9dbea26b858f4fb3264567b52d69ca0d25b721b553f60ea82"
+SRC_URI[sha256sum] = "d9883f1b8259e3bfc42565d0bc6fdc760012008552aa449f75efd2d48319b82b"
 
 inherit pypi python_setuptools_build_meta
 
