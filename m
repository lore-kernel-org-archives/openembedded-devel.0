Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11820.1795763013019758080
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:03:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=klpoVPDo;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15dd124bbe7so11427517c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795763012; x=1796367812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/Ksc6shTpsV/8V+9nqNAWPuRr01tnP8W9hlyXcJA8Y=;
        b=klpoVPDoSKj1AHx1KosjNfLTLJ6TEGsZlcVra9gtvKcnrfFwsB2o9hLc2lzRDVs3t/
         OK33U9EXWebwiNgmtvVLfaHEqrGIacvijHMD5p2zj/iRpdd26/qRfGj2nJSfjECRPXUI
         J28s8Ktq987Ak/1uyoohsGtFqdJIZwE8Ar6t9kl9EddSVTDIjgOFp+jxZYFoRW/cyZfN
         49k3jchKzHt6tSdvZIix9vXrO2NK0T93q+0jf+8YN56yZD06PedBNyAELKp0R4dKGvCl
         U48aL/5N3PiJb1u5OVkYXJdWp2FI7TYlinWj98HrVOYNUF+eT+nL7HXu3+8jPyJaTmfn
         C1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795763012; x=1796367812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/Ksc6shTpsV/8V+9nqNAWPuRr01tnP8W9hlyXcJA8Y=;
        b=BfG9F+jY9PubhH/eYeGNyJrv0LyV+DMuKEJOQCCf7pHT488xDP1PbO78L/aPcy3glZ
         E0vr69yDzucCjXNSZh9U+RHa7RJ4y1h6wfMf7JtWZuHP3dwRBZihemzymvX3LxgGEsQM
         tgfApItr4Gl5JbNDrWOkLrqsmTyIIOkXSdubvTox9IBonj949EcsJat7q3HKbzhbDYmi
         D46Rzp4R1CvXN5Pi8a+qWYuHuvTibj2dZtZU/hOWamLPGRFu/xTcUWjurgAtjlQdys2e
         b43c+s9hn496ria1G+8p3q57WpWrsu7rCenzkIpN1/7Gb8B/wLLM86zY1UAOFc8STjDh
         lAIg==
X-Gm-Message-State: APuU4Z+gQpYxMe17m8EqlswU+aJCv7z3dej+EXT1ziGUIy8DSjbUVO04
	dfdagDuBUKqJN8Lp5Xn+00GaOxzG2w5wjXMoomjfRkdc1/K7SL5aVP2UbgtSNvzg
X-Gm-Gg: AZFdTZeerWt0TCVtIZ8kX21Yzj1WaVabtZ0loSaIHH6NwfeetAtxLdP+Mr9FQFUDoia
	zxxIAVsAGVI6E3ohGb8z+WDc9MUZ1xkOj94N5OPnU9BKpkU/4/vhQK3BQRNMUVgVWgKyTaUJCvB
	9gwt9Bs6m1LjwfEOCkRehrDCkwbb77NeBAllGc+HstIjYb4QLTJ1g6h5ZmwmUzucBZE2b9Ox1+4
	IkbIo11gU4d+iz+mVMB1aOgZHQolCxmXiFuYBGI1kx206tFh/jJNGPnvM5Z8Uxh0m0epivjtSy/
	Yfl+lmQUM8/IAiQ7CT7P5g0Bl6onkvf7MOQ9OtnF7z8tFRzMHfU7qJEjpm3soA8tccL3eBrJ/d3
	Q1bmVJnpkXfo1mP2hwX0CJewFmgWhj98RM9cy3CSjwZL5BZ00NoQvD0eBR9dT1y3ofeJi8kUfl7
	5CRdAJQ5Som9SkDW6Mp2dnFWUsaodVGpvZQKmw82D6Q1iVQY14cxO0uYB2EluCxBgihYvCZCmwY
	p26RmQiMQnvkXstcVPhqPbcPh3QMdNS/Rl7YNDpXfxE9ruWduZ6HRlkEcmQl191XXGNvypp0Afc
	z/bIpOlpf2Cr+YN0irVrrzF5QCEravIVOVcP+AvvBSanza9ks/PX1fhRnarCN8kAY3bS6+EkP8G
	eNhuhQH5ZzaE/p5fOAMDE8WMuWlr0OGz6O9rp4yI3BaQSVfl2RZivE4RUCgJKH90NjwjBY2aUby
	qdCQmT5qdPNdFkxXiiDVSd9QXmGz70udcOsmTBlC16fNAvB6mtlfkfdekDaWJ7Nm1bjQ2fQVYHH
	i9euDajOBMcIat/9pWPgzly8tTx2vNpdkcEblw1PVutspdOtPaWeycS7HZrVexamjF2lYDi9OQb
	pa/y
X-Received: by 2002:a05:701b:4555:20b0:1b5:3616:5961 with SMTP id a92af1059eb24-1b556823656mr22740178c88.4.1795763012096;
        Thu, 26 Nov 2026 23:03:32 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm61327766c88.13.2026.11.26.23.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:03:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-initramfs][PATCH 0/3] grubby, kexec-tools-klibc and rsinit fixes
Date: Thu, 26 Nov 2026 23:03:26 -0800
Message-ID: <20261127070329.2393585-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133360
Content-Type: text/plain; charset="utf-8"

Upstream version check fixes for grubby and kexec-tools-klibc, and pin
rsinit to a fixed SRCREV; its floating tag made devtool
check-upgrade-status abort.

Khem Raj (3):
  grubby: Fix upstream version check
  kexec-tools-klibc: Fix upstream version check
  rsinit: Pin SRCREV and drop the v from PV

 .../rsinit/{rsinit_v0.1.0.bb => rsinit_0.1.0.bb}            | 6 ++++--
 meta-initramfs/recipes-devtools/grubby/grubby_git.bb        | 2 ++
 .../recipes-kernel/kexec/kexec-tools-klibc_git.bb           | 2 ++
 3 files changed, 8 insertions(+), 2 deletions(-)
 rename meta-initramfs/recipes-core/rsinit/{rsinit_v0.1.0.bb => rsinit_0.1.0.bb} (89%)

