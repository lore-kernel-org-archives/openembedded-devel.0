Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48001.1795411797908901972
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:29:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=AkOWnMMR;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-385d8a00598so3933474eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411797; x=1796016597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rl42tKMNLtLNA1enHGhZinxfCFrGaSuRlYL8QJGoows=;
        b=AkOWnMMRsS+m5M+0ywAFd5lWmGakP0B7n2CpOeCcfLh5yTZDmnK8w7ZGShOfpIL41B
         vJpVaqv/CfEx0oUVn1k+d32HjtYbiK+0MHaOr3+fyFiIYZd3rwPfTL+0DNRVl8Ii0t6j
         0JHRlhf/2UK8MVf+OroFlJmHBXWj2s6wb4Ds697YY3xRdv9E2ou9VYzDkS1tjK7V2t2s
         dYMBiTzHs8wHAspIQxCU2n6vmvYGqrwjF3/VibhPXuhdn8N+ftY+An8mDx2Mt1mhfPZs
         1+CroMC+3+/m8x7/rvhHrkupFDmnOyNW3zIo1aW8H6t6jt6dRZoPDQf/Wz1bTjIPJn7x
         QSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411797; x=1796016597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rl42tKMNLtLNA1enHGhZinxfCFrGaSuRlYL8QJGoows=;
        b=ivOEpIfdnXCiw5TMbAoLjpRqN2OtrXPKFltNniP7R+Bi9lBIui4r5u36xNKSzlTBYA
         CvK51L88s51xgE9tlbbeQwdmSuH++SWJSQxkYiWGTzVNThVFvhriVofCGN3jXfgo9H2j
         hWverJjsAau0XDznxesAecMSGDl1NBtxzEXN+IcjHUCpeJI7JK5puRvux88xFcnONmGL
         dAroSo13pMKeKD0qtZIU/9Qcpk+bTU/Qqm7d+Mjte7AhCo/iDy6DBO1Tp7O+OQV3SQey
         YCKkqnAFh4nEglsbYviK2JwCMlS8wjQ+vQto6nP9/tYvWe+ckBarcFtdQMxEDaO9mADN
         8vOg==
X-Gm-Message-State: APuU4Z+lbUyZegvbS+8KfnSOKF551Pg2IuJXccyyTdIgFeWzHCz0dzWr
	Si4uQ7Va/WAxi8GS9YKv62hETFsVfQTNctS4gJAOUR7JQx/j9gh8i7CPVfBLto3fZ+o=
X-Gm-Gg: AZFdTZdzH45PBn73Vr0ra7mHAeZVaSRNi3ClF7yV0hIV/D199RdsSU0aBGFm7ZpVz9J
	TgppjjcHMHiNh4BUi4xTkEG0Ust2DPfDE9ccfTzQkUOG0CGLhZf6dKTwUMoPnsE6GToRY2bi57U
	JTrWVSjisbkbjLZx3gINHF/TB2U1OBT3oYz3CcF5W5NPVYgr0sujUVDp60a5pYZNNkO59Oc13Q+
	S3zKnw4L3TuSGYDKeW+BKeyRUuqACEqJFEo5pS/VPBxrfu1M4aagk+UmX7dsobuI6iHIuDNGxEE
	wzuILk2oA6Y38TtlVysUheBr/ooyfvoRKAXYj3tdQY9VFRcD/F6Tqhn801AoXNV3hNAuFtIS24/
	eh308Ym4DBL995BAhPws/yL4YlpQmFT60MZxxBAkMyYG0qd8dpATuzm9qP0egcLgIVHFZTu/Z7y
	5F74M97a19oBD1rybc32DPUi9ntp8YiSdMuker9pHt2ZYCV/mSskWmvSPk3s+liDg5e7sO+640G
	4ZFI1s/sapupHaXwWXaYVeSuZc40e8Zuris2iu69JO0/o80JUdB6+JQIBbttc59OgAngz6IC4Uq
	wbJkojtyeAn6Wm9h101u45qMtcQoSd2GwZchFHTG4/ijjoDS1vMzdASv0SNpK7wrDQL3AJJq1H0
	BtgIU2afsAwvKPShzFkE2XNykwEsVy8owzCUJoTzzFxhVVznzYPfor2aWm1cUzh3CrWZvuD6tCS
	cAf0piRJIhzzLd5eUek5ZYu9GxZJrVtDQmWaGxWlLIRre5o7F8ZLxGX8ukUGKWbbYFlcFCpogw/
	nFCDI+I2LWTh8aGkSWiXQ0qCYUX1pw/n9UZgctw/+zlu9wpr8iMth7dGqtq5eDGUZMzxqKyONWO
	VXk0
X-Received: by 2002:a05:7300:fb97:b0:381:6ac8:ef2e with SMTP id 5a478bee46e88-3856ff5db0bmr14854577eec.25.1795411796988;
        Sun, 22 Nov 2026 21:29:56 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:29:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 0/2] exfatprogs upgrade, remove logfsprogs
Date: Sun, 22 Nov 2026 21:28:17 -0800
Message-ID: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132788
Content-Type: text/plain; charset="utf-8"

Upgrade exfatprogs and remove logfsprogs, which has had no upstream commits
since 2012 and whose filesystem was removed from Linux in 4.15.

Tested in Yoe CI with world builds for qemuarm64, qemuriscv64 and qemux86-64 and
ptest images for qemuarm64 and qemux86-64, each with glibc/systemd and musl/sysvinit.

Khem Raj (2):
  exfatprogs: upgrade 1.4.4 -> 1.4.5
  logfsprogs: Remove recipe

 .../0001-Add-LDFLAGS-to-linker-cmdline.patch  |  48 ------
 ...licts-with-libc-namespace-about-setk.patch | 137 ------------------
 ...smacros.h-for-major-minor-definition.patch |  24 ---
 .../logfsprogs/logfsprogs_git.bb              |  29 ----
 .../packagegroup-meta-filesystems.bb          |   1 -
 ...xfatprogs_1.4.4.bb => exfatprogs_1.4.5.bb} |   2 +-
 6 files changed, 1 insertion(+), 240 deletions(-)
 delete mode 100644 meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-Add-LDFLAGS-to-linker-cmdline.patch
 delete mode 100644 meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-btree-Avoid-conflicts-with-libc-namespace-about-setk.patch
 delete mode 100644 meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-include-sys-sysmacros.h-for-major-minor-definition.patch
 delete mode 100644 meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
 rename meta-filesystems/recipes-utils/exfatprogs/{exfatprogs_1.4.4.bb => exfatprogs_1.4.5.bb} (93%)

