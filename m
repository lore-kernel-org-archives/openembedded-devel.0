Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 655A4CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:39:19 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.6639.1760474355087154263
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:39:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DkDjtZAF;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-78118e163e5so250573b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760474354; x=1761079154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEupTtAk1y1pw9nSh6GXJuMNFencLf7Fj6L1Xzx6HIM=;
        b=DkDjtZAFdAI4bAxkR5Xg0qnYQ0rn8TUpqYQ2ht8KxtjrtT7lWwuW/ESD2cKWmxh3LT
         u8GqFDUtrgKr6Sz781JSVqCaNUIEYmDUPoJEZw5zyj5oRsOTvkvYa3S4GUD9TrqcJREJ
         P9P5eXE7cgMMAI0LQ2kERvz+uw0dvJyOkdlcG8Fr5OeajiOtfljDhX6IkyCDFiBAhd2v
         55Ry97g7ibc1Zu/Ctuw+jBIbCNkmUkfpMkFgJqXmp5Sj7ECETmrasEEHnCU5FpuGCrCx
         WG8vyPJj7f4q4a/431KeABbX/SqzWF0pgqhs2w5WZDOW4cG1am1qH213EQ38Iw4rPb0K
         VjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760474354; x=1761079154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEupTtAk1y1pw9nSh6GXJuMNFencLf7Fj6L1Xzx6HIM=;
        b=sZKUo812OsvSGtonIVLligFaMwfvtjqV+QUJBVYY+ihUQNWKrypT7zKVYO7XRQvx8F
         Dc/qPDb1b8mmP8EyeT3IPyGFzVvDOqM0wE3GRSk+k5/VETfCLfnpFhaizvjPbyLisS56
         6Sy3S1gy54CyOeJFlMR4ZvQq7enZXtEEHuPnwnCUKfe+gDdvo4KlBdrYmLnvxrz17IPX
         yxvo67kkvSNDhje5YITZsd2V7Z/S/SYl7rICj48nADAS6Y67Z95cbYAK2XIRr0XptrkN
         jTxsu5flPdp6Ut0umgBjyhdIfFSAwj4hZc4zKkDW48zI6TDGpmeA8FyWb5Cdcc4NP6GD
         4aFQ==
X-Gm-Message-State: AOJu0Yy8LlklEI7byhETbaXevDy2HKQmn+fFJDtKAWEbZ7HdzU/KPBJg
	e0f9U4FUH/NVWdcTKnUV/YaYO/rTjgfAOpbjv9vvjrpyi7ThtXp+RqqCTbLWAw==
X-Gm-Gg: ASbGncvKAfrg0kMvzxaN4l/1U5qqTV5F4Zg/GTB5ILzhEgZKvupyNffw5zWWL31WGYa
	TjjV/OY7YWtgsrU6EKozdllSimLSHjpg0yxxZQeAo4LPjok9g0gh5T1nXXNE7gS2wUluJiYIVnt
	l7CLWOIkBz6ZxaD3NJB5ZIAQwQFb3Zw9sj/5T5D8V/5Nb2YdlA4I9rz37PpVHxmJOKo5pHyX7qy
	AND+/iIC9+wE3a6htIdvM41BXQG7Jt4MVqHhToAbxsH2k5o6RHP3bUfsOQx0foojCSItk16VnCS
	cZXLTWL82YCGyXyasUNj98xQgiV+rDhVnfCOok1/OgdBPTS1TcMyBDVST8Rdil2WfYVuxZ2Jw3I
	+2X6RoyuPq6lOP7M2TmgJ4EwMMuGEBhXQL4vm/CmrKSdDFwNqwlfEAU7Y9pm1Qqy/Ng==
X-Google-Smtp-Source: AGHT+IHlVfU8YzToc1YgKbnp+YVjx2fbSO6Cthok7K6rVJUEtRDdG/oW7/Gksk3YpsrQhvN1doO/Lg==
X-Received: by 2002:a05:6a21:6d93:b0:2ca:f345:5673 with SMTP id adf61e73a8af0-32da90145fdmr30899717637.27.1760474354347;
        Tue, 14 Oct 2025 13:39:14 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b733355sm16009495b3a.26.2025.10.14.13.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:39:14 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 2/6] corosync: fix upstream version check
Date: Wed, 15 Oct 2025 09:38:57 +1300
Message-ID: <20251014203901.1479326-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014203901.1479326-1-ankur.tyagi85@gmail.com>
References: <20251014203901.1479326-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120627

From: Peter Marko <peter.marko@siemens.com>

github-releases is needed that it work at all:
ERROR: Automatic discovery of latest version/revision failed - you must provide a version using the --version/-V option, or for recipes that fetch from an SCM such as git, the --srcrev/-S option.

UPSTREAM_CHECK_GITTAGREGEX is needed to get correct version, otherwise:
$ devtool latest-version corosync
...
INFO: Current version: 3.1.6
INFO: Latest version: 414.336.75.75.75

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit 9aed476a9031577e7acfc2ba2f4ff0abd5106580)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-extended/corosync/corosync_3.1.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-extended/corosync/corosync_3.1.6.bb b/meta-networking/recipes-extended/corosync/corosync_3.1.6.bb
index 8fca576614..eb70bbe923 100644
--- a/meta-networking/recipes-extended/corosync/corosync_3.1.6.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_3.1.6.bb
@@ -5,13 +5,13 @@ HOMEPAGE = "http://corosync.github.io/corosync/"
 
 SECTION = "base"
 
-inherit autotools pkgconfig systemd
+inherit autotools pkgconfig systemd github-releases
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://corosync.conf \
           "
 SRC_URI[sha256sum] = "ca6ed32b4d7f33ed614afce8760fe58d0de92c68b575d4969ebacd892f3d1e27"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.(?!99)\d+(\.\d+)+)"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a85eb4ce24033adb6088dd1d6ffc5e5d"

