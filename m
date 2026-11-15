Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10711.1794762022763215487
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 09:00:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YliSKJKW;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so2947605c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 09:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762022; x=1795366822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=moeOgfdf26MaqrYBYE0BWLrU1fTdIRaTm1r4TqrF5oY=;
        b=YliSKJKW9e618WKWOtpvQmVPo0SbYesbjRZxaVeMzpHXK1vf2NUiND0rioMMJVnpWh
         2eQmiot4RysZ/Soa28fs30Nmd76Nr1GT8BG6gteadM8t4FAcMnZ+vESpkldppWw+RVGX
         fuK0KimqwGBGbOcwwonNjdKynjb3DNBxbpxuusre9Lk3myEpCWYpOi0W9YVzK6h+Wj8m
         P03ijz+KynPLbbP1r9xJROIMEKTCecOYwIi55nfxfvuLVT1LrqtQOlpIn5Kq81huQWDy
         i6B5wZmMSPSexM3Rjzq79NhPVcbI+SUQ7fwHVF3URAIOEYXV9kj4gYXc+lrCcSbwS0Xv
         xwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762022; x=1795366822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=moeOgfdf26MaqrYBYE0BWLrU1fTdIRaTm1r4TqrF5oY=;
        b=JjWVc0cdQrB5m4aKc9BDHUOQrBTave/g1FMBC87p66/oP4iAXez+a+NkWeMP9pwHsC
         CbPyr+ITsUOS47TV8v30Bp9MH9jOr3FT89tYn0z/ObyDd/fbyCWp3ZJa/pj53NuO0Tda
         uS46XqLiRdrUTq+FLR7sIforGhqH5zGiLjUvOWrA7PrmOFrf4+amma+hbgE6BitTNekJ
         Xs4NE2eFYWjTYdNEqGLxE+4iRxW3dYZF72GivkCu0AajrGGj4RfQx46ShGktTiWq5V3i
         VaIJYeEqobAjB61Z9wsviNZXEQxpruDP/IYsxozHoczt9qBEb3+tq5JnVafJ51qLPlK3
         TZNw==
X-Gm-Message-State: APuU4Z+OTpS9ATscf9YXyN0Jl8ut3bUHQ2OlKtebFN7rOhcORUVquYPk
	fKcf5SXYdbarlcS5kCmJzT2Jzsypes8LpJNeyAsQqW9TgHJ1bp1xIou1NMYkz8w5
X-Gm-Gg: AYBFou2GIRhKt9BORKrZJsu37fpcXu4dYYuV4J1hwF21BRARcGY+qDtcDZUpucCS+aY
	GeYlHNXLMkHdKEbEhQBqBjErTF434gne+K+d8ZtLCOLhPQ62KsMFLFjy04NlTP5zZgzOsZFwA2O
	Es411YgK5N5dDTW7dmzywc+7lNXiulx0PrMe36DflKBXIFVzQ6Bl1LppVokMtZ5ZkbmNt2oOEDY
	b6ARe+AvKRSq+RRyDsW0yx/qdqEEd+rn+q9G8QU3xUsVPMYD9Yo6Wj1mIAYndgzDKqvAJpUqiai
	Hi6XuVaPqtyamlepIhYdSPaghPJ+dsgydlQ9/xO8ByWbAQmHZ9LmT+ZsKz2MhIV+0iIXAQ+NK6K
	nnQQ1GVDQelk4ubt4UeSKVa9gMbxPU+FlB0cqA3SjAkHa18FC59HJw1HmQKqW4syBE9X4OFViDt
	G/fxUgRzFPtSi6fFrzhu1u9Yzs9DTZTguXaG3dd6GkgMuAryGXX+lhjVqPDq6sXoMlKS6DnL/40
	l+5FSOHd04C6MafqfuqLrebgE45XG/0rUX6U7Bs2M1HKPMoPnEICBWU0nxDU7FjuByPTwE1oLTw
	AjzM+b//p9y6evObOyn/Om3PdH5+4sQQ2/mfshC7Rxg4DPCcOBs2m0xUm5sKocaj2rTcGZ1uY0S
	OHkK5K4c0BXj8Lna5Mr5N+zUvtSD/I24sAxZMf+cjpzKij/ehfuUPp6766PYhO2VbG5cShSpjrx
	gdAlq7wB3/VNS7eI7h7vyQS+1NOHoXWily0nrmnJVYQl2Oxyx0ujudM47PU40+MGhDxNQrIDEyz
	rjC8kpB0zRg1H5MPnZwyziGcXJY5ld2MCn66Y+SzryG7Zc1WzhQjdXxkuGRzU3h4ZTkWbohDZsV
	5CUF
X-Received: by 2002:a05:701b:240b:b0:1b2:6cba:7f88 with SMTP id a92af1059eb24-1b503169447mr8202038c88.44.1794762021866;
        Sun, 15 Nov 2026 09:00:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm29442397c88.5.2026.11.15.09.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:00:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 15/15] sshfs-fuse: upgrade 3.7.6 -> 3.7.7
Date: Sun, 15 Nov 2026 08:59:54 -0800
Message-ID: <20261115165955.3485789-15-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
References: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 17:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132381
Content-Type: text/plain; charset="utf-8"

The new tests import ctypes and shlex, add python3-ctypes and
python3-shell to the ptest dependencies.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../sshfs-fuse/{sshfs-fuse_3.7.6.bb => sshfs-fuse_3.7.7.bb}   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/sshfs-fuse/{sshfs-fuse_3.7.6.bb => sshfs-fuse_3.7.7.bb} (88%)

diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.6.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.7.bb
similarity index 88%
rename from meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.6.bb
rename to meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.7.bb
index 6514599261..3a04e9cd4d 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.6.bb
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.7.bb
@@ -6,7 +6,7 @@ DEPENDS = "glib-2.0 fuse3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"

 SRC_URI = "git://github.com/libfuse/sshfs;branch=master;protocol=https;tag=sshfs-${PV}"
-SRCREV = "7a2d988775446ebe7af9b01c99b3b8e86bddb05a"
+SRCREV = "ab648e583fe6490f910ec37414408a01fc772227"

 inherit meson pkgconfig ptest

@@ -16,6 +16,8 @@ SRC_URI += " \
 #python3-compile for filecmp module
 RDEPENDS:${PN}-ptest += " \
         python3-compile \
+        python3-ctypes \
+        python3-shell \
         python3-pytest \
         python3-unittest-automake-output \
         bash \
