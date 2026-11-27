Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11813.1795762995481319994
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:03:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hJFnbzjG;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-14394530ec6so1575404c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762995; x=1796367795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HfpHaL9YMvJa0Pd1IvEu/hIwBC6uf5VsNNFGWplq3fw=;
        b=hJFnbzjGX4SZfcXb+SoI67SqgRmZY+jy6QymKZPGVpTAVGYW2aRdm9iSLnIsAIx9bY
         DLox86mbEhdklieai8f9747iPYAmqYwyytv5XnBxvK0FXxL8GGFAit8gAchApkj4eNBU
         3pO2xQ1Z8duv2BkyRT4zJIxbDcP2Waz2fzq9rcZ3yz70DuvQYUGfEmmRwxqRYqGqD/Sp
         VirH/rabdsRFx/XPFzx00ZpcW5f51JcJZp8Pmu1X23MxRt0wyMvC7cmrHICbQv9y/g3s
         rTL0mYuRF5Yx2HWiCntKc1F63lha2Qewn8GkaeKH/9wh8gP3WWjDBEht/MUlX1lJ0E5x
         3d/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762995; x=1796367795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HfpHaL9YMvJa0Pd1IvEu/hIwBC6uf5VsNNFGWplq3fw=;
        b=GhnIw1tTpMpntuV14aHQcSKYLrFnv/mTfsZYVsmF6V1bDErsR2W3WMiVbZfBsFhjZG
         nAXvcHaIZuD3oaWBqWJN+Cf+YYvwJvb+dKspAjHMz2paCrJKbtW5Sq9e7rH54fJP/Wx4
         45Z6RL1xsnFZ3SG2clankgGvZXm32hyAoGLkjZflOga9KQR2hsTMuNDPqQI9DJk3+832
         itUOU6MjEDLjfYR5IBlEXmemXM/cUPzlQ+WLLkGNpByPnSe3brcKSvb7SQNUHpom3u4Z
         9+14+jk5YH3ObANCEGqMC/iyX6Z3nE/eN+7K5j4D+vo3fMHlplzX9aOtROudvvGS2+wX
         f6DQ==
X-Gm-Message-State: APuU4Z/+ypHduX7Nj6kZD1/TU1N5bnsCS6Txi6K8bcIqRmq2daZstcQj
	fHziY2mvxQkWYt5u6rqYYbgiuW5VDvnv1E3hMf4OmHE78wEU27cpygdemD6/GtKz
X-Gm-Gg: AZFdTZdNPtIlAT+1wmEOn+0H7UYoznOD1Mq3YbI8mQI25e3ULtT//yD/Tc/O1/3+mw9
	kuU/Xgk9eFMRzx2BxJ6UknVNhPmMTTjsgukZoGAbfYxFx8bZJx9QDQ2CjcmsD/bOpv+0lmuE9V6
	vleDRgTsYRpjOroo5KdZHcCYj1z6gUUZQ0er2kHV22lHuGwlB4NBbQ4w86j1i1Dq4RMJC61D1Kl
	ly71XX7+xkETVV8qoTfXwe703jfO05+sJnBeGQ5BlPs33p1M6Via0lk1z/NkBTcqYglOpbdivxL
	P0lfwjPQub0/wF8gbwG8tXV46XNvEYDLSwX9+FvEHjPNxVECkH/sDMS7HwO0B3zsJGagj/aW7WO
	vLyjaqi7eTVHnjv1meKFLnUPyBR2rjrBJr/8Trjv6H8P8ZZgeRTCfMcbvR6hME4OVylW+7Qj9dz
	JRbE8A/CPQzI7mWbvvXouDanI5Wg1qgFNwgkhVQU2Sr2jfE5vAz5lLgITFhxyhFU+e0zUzHbBgM
	zsdc7w6gd7qR5p2Cwo83GUYF5ZdJqu8XM/YFCBRKwFWOVDqhfihXRqJiNZNolG9N+6M6qMDo0Bc
	ZZ1B/8T1Tlioa6FNe2AWctw4N0xAN7ciNF7SoqVxMgPl/ymTZXO/wykGsezhNse64x+JtHiraTk
	VmWD6YJ/4EQCFDGHDY/wWu/8X0OrPF/CcwfmVeTPTuTx37mMfULmCWaHw3KI5bVOrvLqX1MDIjR
	Y67vEnU15hVnaFnDqEtY8auM2ZaxHU9peKyLByKkeyqDclFGjv6Qrg58BX3AczBDf927U57mLvW
	C67O39WQuEqBr5qC55OhnmVYuPiFAbDgPwLymcraSQU6iM4Yn7EW32WAGWHCaxKTW1ZU46D+bYu
	trJP
X-Received: by 2002:a05:7022:7f14:b0:1b5:39fb:c6ba with SMTP id a92af1059eb24-1b5568fe968mr21590715c88.35.1795762994805;
        Thu, 26 Nov 2026 23:03:14 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm52671117c88.3.2026.11.26.23.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:03:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 3/4] libterm-readkey-perl: Fix upstream version check
Date: Thu, 26 Nov 2026 23:03:07 -0800
Message-ID: <20261127070308.2377122-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070308.2377122-1-khem.raj@oss.qualcomm.com>
References: <20261127070308.2377122-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:03:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133358
Content-Type: text/plain; charset="utf-8"

metacpan.org/release now serves a bot challenge page, so the check
found nothing. Drop UPSTREAM_CHECK_URI so the CPAN author directory
listing is used.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
index 26ca37ea2c..8136f9f1f2 100644
--- a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
+++ b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb
@@ -18,7 +18,6 @@ SRC_URI[sha256sum] = "5a645878dc570ac33661581fbb090ff24ebce17d43ea53fd22e105a856
 
 S = "${UNPACKDIR}/TermReadKey-${PV}"
 
-UPSTREAM_CHECK_URI = "https://metacpan.org/release/TermReadKey"
 UPSTREAM_CHECK_REGEX = "TermReadKey\-(?P<pver>(\d+\.\d+))(?!_\d+)\.tar.gz"
 
 # It needs depend on native to let dynamic loader use native modules
