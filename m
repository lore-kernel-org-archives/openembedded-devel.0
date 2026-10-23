Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1665.1792738465979813229
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FrO4/Stl;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so435391b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738465; x=1793343265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9WcUYuQgJZXdhbmtSaO5+xr2vFVV0GBCliyT2OOJN60=;
        b=FrO4/Stlmr02P/aKIKOExYgG5t7Yp1ZzZhqS26QMmGdpNWi3CP5hunXJexd+7gUVid
         s9LJXSvH0gxwYfNof4qP3tujDJU66jKkH4VrLXwemy2PT87/pZfWspwl+ANcl6+mAmWD
         jxg1PMhWGdNPFk/VXqhr3hGj+Y7CvYos/w6BWLd0UekeWgOr3a+ub/o88NrlxJeAeMrs
         SDM3RRO2jvzvBeByOHD/TvKZG8wMW3S7TlUhzGDs3pWApQVcVapqK916t1C+crbZ5uhG
         fWtqO77klgHwm2uMt/BxFW4yXGxNH8wJ2SJ4Aibk+f/cLvjuXSPbiri0gTk7upjCUqBX
         MYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738465; x=1793343265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9WcUYuQgJZXdhbmtSaO5+xr2vFVV0GBCliyT2OOJN60=;
        b=g7paX6ws4VmL79qgwzmLfujNj+hotsCgTCU3MwhlLaiC8o2RFBj/DJa8toY3M2D0WA
         1LglvTY63R/G/ccSEPCr8C9Cg2g5IGPay1pxWxnaGsmY7a9VqooJPMQjD4d6ZxReGJpz
         N4ja625Es7L9rzC4TigmF82GmWtDubzMi/0iBuSGXY5OCmFAp8GaTqLcOGbgOEBiLw0F
         L1OPTUMI0cYriroU9oTrUPONCoLWyBBl/xKx6pMUS4kcWUrUKiIUBlsUuepjkMGMEiqu
         RGJ2h53AZiomBQ4pGVfdW0Y6qmWjnAvsIuTyFgwpN3qBLfnqEzZdPD2JnoZD2hmxKu7P
         gbmw==
X-Gm-Message-State: AFq9FYJiafBs7OwZHKCEpCJ8qv2ZMqiTxUj7EFrJQbXT21co3yADkpt4
	n4Ql54eMdgsh8opMNaIrQHHQRqm0KGagw9q9virHMxAT7GlcnJ3v+zaXW99XeuP/AFQ=
X-Gm-Gg: AYBFou2Pu71k20oToMAJZsHe5U6qJx4KGF7WBHAGevS1dPVc8Rvu+zc70FemXgLteRx
	JVp5gNLy8RG/LPXC/PL3oLnllA2YWchKAP/3DkzZE2ItMpLdkYNfp236GvbDCX31Al/lSeBH1cf
	mof4ZuPovXVuH6jXHZOwVFE/0lTyvt384NgPd0zxZ+FIEZAPOihzfvXJ4sRJ/08B6x/MHiANhRR
	IaztMloCTM26K+s1WoqSGq81Ot9aD+bu6pwK8nS3Q3GJS5JXCrXSdjn5e3b6sdAAjtd/w4yo5UE
	hke6WNXzq9RRlXV5ltwAdLg++2zh1izEBOZ+Wb9k+UKS6fyx/Ov5MfUnteEAkm4A0EQujIBi6G/
	olKZbz1UvVhxIKqAExLtUo4jB2LfRlt7QxuqBwADB2Qus9640aAU9JR9W4FxhwjQukoHnnaBqWN
	SNjQcYgW9LCLSOlwxEmR7MkOUnzF3/ITuC9lLaXPMi5yUKGRokzE1Fcffa8mlYdJ5XE9yZ9FX0o
	H7gWbn9mJ+lb6Lu90y7rcpUml0LPHAVZAFJRvV5G05zYum/IR9BqAvaUFFUJaK8kH0EWmt3Ws8d
	39s/Zd24hZv71vDM8nkfeL2rEDT+qCTWpOFQjMG/HxzJA9Bp5stiCyax+gxf6N6n9Ff0AAMr7I+
	77j9OKN0c2vpigl93NMCv/rqYYB16PRRJNZgbzkHxbNGCvmVe2fpAswgNLbSSblS3/YR3znjp5T
	pfFsppkzFam2tQoJEkABAh1ulqOfmHUyW4o7x7hczkfziUGuCFz6R7MhiEUqv7RsRDUHNSntiDV
	Myz8Cnuq2ZHM/KdXbniOhcalEHjUwA=
X-Received: by 2002:a05:6a00:13a6:b0:89e:fe2d:abe2 with SMTP id d2e1a72fcca58-8a2c664f586mr1233026b3a.44.1792738465372;
        Thu, 22 Oct 2026 23:54:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:54:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 27/29] samba: Fix riscv32 waf cross answers
Date: Thu, 22 Oct 2026 23:53:48 -0700
Message-ID: <20261023065350.3228996-27-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131351
Content-Type: text/plain; charset="utf-8"

The riscv32 cross answers were derived from arm, but riscv32 has no
legacy 32-bit credential syscalls such as setresuid32, so samba asks
"Checking whether we can use Linux thread-specific credentials" instead
of the "with 32-bit system calls" variant. With no answer, configure
fails:

  Checking whether we can use Linux thread-specific credentials : not found
  ...
  The configuration failed

Answer it like riscv64 and aarch64 do.

riscv32 also has a 64-bit time_t, so the time_t maximum value check
succeeds like on 64-bit targets. Answer it OK so that samba does not
limit TIME_T_MAX to INT32_MAX.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../files/waf-cross-answers/cross-answers-riscv32.txt         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt b/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt
index 5655a65852..23cad95b9f 100644
--- a/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt
+++ b/meta-networking/files/waf-cross-answers/cross-answers-riscv32.txt
@@ -28,9 +28,9 @@ Checking whether POSIX capabilities are available: OK
 Checking if can we convert from CP850 to UCS-2LE: OK
 Checking if can we convert from UTF-8 to UCS-2LE: OK
 vfs_fileid checking for statfs() and struct statfs.f_fsid: OK
-Checking whether we can use Linux thread-specific credentials with 32-bit system calls: OK
+Checking whether we can use Linux thread-specific credentials: OK
 Checking whether fcntl locking is available: OK
-Checking for the maximum value of the 'time_t' type: NO
+Checking for the maximum value of the 'time_t' type: OK
 Checking whether the realpath function allows a NULL argument: OK
 Checking for ftruncate extend: OK
 getcwd takes a NULL argument: OK
