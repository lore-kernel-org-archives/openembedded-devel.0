Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34342.1794851728738435374
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=DAHbsgQg;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36f8cdd30beso6022668eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851728; x=1795456528; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFzKFsBenDekIDoLYp3UJ0Pg9gAsBr6/sJMAb+7/EXo=;
        b=DAHbsgQgsh3SOT04yqCQCLgLZk3ZCI3zf6TQqe63XYgbHzFvb9D2EUM6IdIxr27zsM
         p/CfQWGh6dYKd3Z4HgkcXf/GWCu8askc2+3KBJPu7JDYV7xRTzcYLVDzx/EUxxtjXYlO
         TX9XwbxcsLRgUJ7YXfBtHnHjjhyxkRfbEep1C+eFIhhxIdBC9B4mCtlgCFZrT7FBCC98
         j9lwyP1NMVwyGZbzcKPI9GvC1lO5zZuYBR1DtPqHs7bRGybnl6s4jwJEvlwoV216LM8E
         SvVwzKm38gKytxKvOsvVykfzBZVnckiZ25IEbxqVeNT3rkESArvDk/CfOokUR3iZVFyX
         sEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851728; x=1795456528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jFzKFsBenDekIDoLYp3UJ0Pg9gAsBr6/sJMAb+7/EXo=;
        b=ScGHr1sNCqn6Vp+O0dyPOlhn5ETAGaJbtj2Ur80KnDSyUQrwE/45PIhTwONUN+Phsr
         6GYudZ+DM1NNzs0iQvkEwjgF8eBhz//LRwbyVRe0JsGWClqKM3GuROw6d+/NnfVLG3kz
         Otc6q2PeSl9WJhIaSi8j/QFwGh3VdH5e7A5mSGOATRx1+pauxW6k0AHQ7SEXinSatM13
         YHk1IHmKPMDuD3Na9I8dJAuZ1h/1OgefI5YykPbDTApStZO1f0bdg8+od+smgNHIXYQs
         nXc0sDJ1+k7YJKKb8Dxt2CSu95D8egX+gQ00o60kMtBpY4S6z01WWmBlros+/fmbWk3j
         S4kA==
X-Gm-Message-State: APuU4Z/vEQshJPqn8K8fPHDvopCB26hSRUsWdLaRvb9aaCjJg+jPNUqp
	zRydVQvxCmt5YhgPH/xKCLNN2nTaVkXZbIYWhXcgHr9U0UTCJ8oNW3L+gfBDV969
X-Gm-Gg: AZFdTZcZxP3+BHWkckMfPzp4KLB/bSPe08lo5MTY3Z7Yf4kG/7BsxL1Ep14sqZpXQVi
	MRJUyGg15ZuhxPHnwk62E/EPerGGTfPUbtPERMMhJ32blJWGw4wqxr8uOWS78m5Jj8wiQs29a8J
	8q27n/oZ/9YNKflgNT4u4orPA7/yyUJUvDTYp+T00L3x68OHj1/FcfqdsmbO2EnHh7TKpQWPQKL
	/aaI9+nUtNtq0JverhgbUWb6px+hLvyorUgfW8JdvQgWIe+mY0A+dXNpI6J+/jmQlsz0Z57JXPw
	wNTXtCQ5lbbn7mqhU9kCwKa1bEO/P2JJvWfcx/+suNjz59hzSBN4XL2qaD8OiUye/goOuU+mSXA
	hnnTBcSwMkiEDxZ2x94mKyCEWPcRcejGe6/5CHb2KhVHCVe6qulHJfzErlOWgcPC+xJKlmMn3kM
	usej08Q7qxwC80S3E2rziurVWijBTqSTFeZKhUUt4pvJSbUmoYfDCSqMi735iAzAonS/riW4+vM
	hoZAfPotJfYoll2WWMLDMgc4fIaoPgqfictTONEm2igKuLUb/t345oUmVIpynquvgg3nQsCp0DF
	rkdHCz66wtjkR0Whg9YVBfjo1KeH/nguBPFj8qxW6QDeBGDTyN8vgKbxV0x5XaiVAPp8BOBHBVD
	j5WujdiNqwHE6VoI8Ilzowp2BatVEKokvcRnkLbTFPoVWIoqEqzta2qk9wAdTv1aIvXb6zJFo1r
	BFMxCNX5YnStfot0puiMHByYqzSN7VVWv7USvzwQ5SXbBAd0UkbnRoBJWURXnkzXCqpnaKxKhby
	VOu9eT9XuTabb50ySYjXM+acQPM4NU18d3Q8LKbS/GF9U4B9PQELGRWN+/whEtYEnUrDlw0pFAE
	0/T/
X-Received: by 2002:a05:7300:e78c:b0:381:7ee:d351 with SMTP id 5a478bee46e88-38107eed442mr273614eec.15.1794851727991;
        Mon, 16 Nov 2026 09:55:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 060/105] python3-pocketsphinx: upgrade 5.0.4 -> 5.1.1
Date: Mon, 16 Nov 2026 09:53:12 -0800
Message-ID: <20261116175359.342679-60-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132516
Content-Type: text/plain; charset="utf-8"

Changes:
- Security fixes (5.1.1): potential buffer overflows in language and
  acoustic model loading corrected; JSGF memory leaks fixed. No CVE
  IDs are listed upstream.
- 5.1.0: fixes for heap-buffer-overflow in ps_mllr_read, stack-buffer
  overflow in WAV chunk ID logging, NULL dereference in
  ngram_model_read; thread-local RNG; phone support raised to 256.
- CLI enhancements (alignment help, pocketsphinx_lm_convert fix),
  external timestamp support in the endpointer; removed pygtkcompat
  use in livedemo.py.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...hon3-pocketsphinx_5.0.4.bb => python3-pocketsphinx_5.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pocketsphinx_5.0.4.bb => python3-pocketsphinx_5.1.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.4.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_5.1.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.4.bb
rename to meta-python/recipes-devtools/python/python3-pocketsphinx_5.1.1.bb
index 3a53b6fc23..c4f664eb89 100644
--- a/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pocketsphinx_5.1.1.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-2-Clause OR BSD-3-Clause OR MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c4d720cdc9c6953091f65e8b01524bb4"
 
 SRC_URI += "file://0001-cython-Use-cythyon3-in-cmake-check.patch"
-SRC_URI[sha256sum] = "17d2971e998490def9554b6ba41886708422af5b4ae888723b1b077aab0fe8d4"
+SRC_URI[sha256sum] = "675778b309a22dfc9b7d37f7621976bba491d2a5f8c59696bd77fd6d07271355"
 
 inherit cmake pkgconfig pypi python3native cython
 
