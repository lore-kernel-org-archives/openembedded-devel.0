Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48007.1795411809379152757
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Y9MKvo9o;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38692f62b22so1249747eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411809; x=1796016609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hVjU6lpHcMbc1DaO2ebo/voyIEDtnEzb+ojxRRuFUJk=;
        b=Y9MKvo9otAFy7gxUSWI97vUiJO8m8EJtBepNqkMUMcBPVKVAqrbaXpIBuYsGE5HMxW
         cJvKfWuf1pWrnIJ14w28OsePAcAG090JDrzXZEiWS3pjOgkO2Dx5E/uCPs6ylppb6Rwl
         emwbMH1DJqnNrJuFPESVLlcdwv6Je11Hdr7KPYvfek272elKXXfSmJLpFt8ehKp7aEgo
         gEejL4LaYtSL73kLAEH2x+CSPFhJGZ3xcJ9C+QQxvUkHIBTdNkNHiNNHlxOSj0H859C6
         NaalZndhC1yZQ9mCPu+a6dmAoAv52pgLyn2pyDYyAs3hgsz+iL4DC5ZqAGGfuXWq7wgO
         1FUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411809; x=1796016609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hVjU6lpHcMbc1DaO2ebo/voyIEDtnEzb+ojxRRuFUJk=;
        b=yXLYmbe80Fmz+C87vq73Krf0NcbKTfFwM2YN24kYWjDsXVIraxEovfhB2UqB0aa04a
         mUnhE6K9RDQA1KD+aOLBITVt/v8jR3I0TIGGw17mR3luBP+V5DcXwR3HpBqJbVrEL2o1
         Yp3M8vJbOO20ufG360HSQ7qyRWf//YjgE9bWW1aVS0C843+zkXEmvNW2xgpgA4joXA5e
         TXHjl2pJD1nZXwFCK7AYKiLJ4M/t4HoIuIUTTHCLHsfJqkjLiSaSWINMvTniljWd4y6a
         KNubep18hut/LAsdOUmnOvhUyxprz4DakvzE7LVilTqsFHqVRGQDxE0rSur5Al0+X6tX
         noeg==
X-Gm-Message-State: APuU4Z+X9bN5xldUOk3dq5HMsS6iDfvceeMqmKkVX4NOc0VAoaf8p2OD
	prEvF2oB30VOMHMneHgb0QRTmk+jR20Pkt3FC9JN0P2KSzuwgawSE3O3k3Ms5ZubaXs=
X-Gm-Gg: AZFdTZfIEWTtGGdG3mV/Jxk8+ucsse8TIjlLXJHFv65FbNEcgh269tWlsA7j5UvEwwz
	a7pqWOa0DrAWZoFRBSRozoBdde47XkWoxtWG6fI3wbqQ7Q71zODbzLwPDes9hKxE3qWlsUPCTP9
	uw1h8OsytflCVtcYEOelzW4CuvEW2ipanwZ09MOOtRymYfGN0xBOxWhysU4TDonEW+UDq7Fr9zl
	zNlGd3KyHszADp5P3U/f/XKDl/g8A5zrIsak94g/1e2lTwi2bTpPgdh3QlPxmPcyEXXgsVkkjWX
	SVD4VL+sT9Ou9ekXurZECQFWzjspEMCuGoNeB6yBqDm7c+lLjsl7t40KJLQZ9d3BOZH2zJ4n+dM
	FfwE1Qp4+ZRlEWrxbVoqgZTlkyjARFen1NRPE/37Bhy94aoMTUjMDAE5E6JvfNr1eRmP9nkgL2Y
	FbREc1kEWHcW06ENApr2xKTIkrztZlpLS8VQFdHkj49mP/EPlSqbjOHLGPO8nWiFzmwrWqrQ7Py
	LMBJsMZVFd3lgx2/mpbp+Be1wngTFcxpFMc30pVeXF0Fs1flL2VjMRqqwfGN8CjTlpxd/1GuUO+
	CMaxYdqf1QA4Y2y9Tz4VYgenoCE7itT4Dz0JESOiJLWJhCWqvKMZvnUWQz9OM2lRsZhNb8ShGFw
	QB4coXcxUOgubaZzhAPhBgA9M6tcxrLdvNb6DI6K3trq1RT21x4wgF+x4yUWcbvhlagHvYK02PF
	4fUkwLjBUhyGxBZ5HYe01Kv+T+L9pbqCZV85/JL/uV1yLz+Fkfht36V/RP6T6KMtg/DyalXpRy1
	BtJnQEpP0H7uAfYghbzNwEQFW2wU5dYZoZkQfEmgQ2tDucEjyyrfwJPvDqzypdKgqKdtFhGIrb5
	1dl2
X-Received: by 2002:a05:7301:dd86:b0:351:2958:1740 with SMTP id 5a478bee46e88-3856fb641famr10888815eec.37.1795411808703;
        Sun, 22 Nov 2026 21:30:08 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-initramfs][PATCH] dracut: upgrade 111 -> 113
Date: Sun, 22 Nov 2026 21:28:26 -0800
Message-ID: <20261123052953.3658549-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132797
Content-Type: text/plain; charset="utf-8"

- Security fixes (113, 112): sanitize DHCP, iSCSI netroot= and
  network-legacy values, eval injection in overlayfs-crypt, die()
  messages, and parse integrity configs as data
- busybox is now a supported alternative to coreutils in the initramfs
- Helpers (dracut-install, dracut-cpio) are installed to /usr/bin; new
  dracut-extractinitrd helper, dracut-skipcpio dropped
- Compressed modules/firmware can go in an uncompressed cpio archive
- New --prefer option and new chrony and qcom-adsp modules
- Better cross-target builds and RISC-V / Qualcomm X1/X2 support

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/dracut/{dracut_111.bb => dracut_113.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-initramfs/recipes-devtools/dracut/{dracut_111.bb => dracut_113.bb} (98%)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_111.bb b/meta-initramfs/recipes-devtools/dracut/dracut_113.bb
similarity index 98%
rename from meta-initramfs/recipes-devtools/dracut/dracut_111.bb
rename to meta-initramfs/recipes-devtools/dracut/dracut_113.bb
index 8b88e441b8..8a957c8528 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_111.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_113.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PE = "1"
 
-SRCREV = "b3b4f7ef914b84964a56500cfec83f21dc513e6a"
+SRCREV = "091b134733d685677745dd36b4acbe1a52a2c50c"
 SRC_URI = "git://github.com/dracut-ng/dracut-ng.git;protocol=http;branch=main;tag=${PV}"
 
 DEPENDS += "kmod"
