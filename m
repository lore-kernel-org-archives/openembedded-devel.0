Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8230.1795739770518247839
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=AKVZ/eg8;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f046b0adc0so43073115ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739770; x=1796344570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WU8bbKeK1QQ8AskMTp7LUtUnjdjqoYSU19jk6+cYVEg=;
        b=AKVZ/eg8a88FRi6H+QveGVwm+LK09v2ATjl1E9g4ubE9m843+cBW2+fHggxWXzCUAy
         nREzLOMwMX/GgplexKyayOAGt+KBtZljvpzR7xOabN1QZMRKTc6FtOxrARNUim7saET9
         FaT+X1/ze2sSan/kdJrlQ3MNIUAbRRNiU+D5H8k2U9ATU1xHpG7H7Ma8rBtCuFZAcykQ
         uArcs5pffHzrSFTaUTknvuXmhMhYcJT2j1AzFYbjB3JtU0O8qepfTle6231lsGea7Vkm
         ULOu1H6tLwkXyKtXTvhGHmr82eqh4xwxCzUcVWyammPqua6AntQ4LPw8ne0aRqAxGLI8
         DhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739770; x=1796344570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WU8bbKeK1QQ8AskMTp7LUtUnjdjqoYSU19jk6+cYVEg=;
        b=rCTkYXUmLxhdjtU0i8mrjSRQFXBUoPLQxgFqy0j0UAuZjP8f33CuyHOjlXkv+UhsDT
         Bvfofm6V5rnxDxvA/kEl71mBhYr1OP/LKx3ItaeTKgqc8nqR94seP9+fMRiCMwKgyIoE
         LB9Xs8q9pEtuk92/cs5ygHqqJQYtMANOZJe+puij/HD/9dDrbcZg0VfmDkgvYeMqGf77
         qmFfxH8i4Mj3XHXuAOZHWbEoiV/TRB9nA+zxLtZjrG6iWrKPlz2XQmiZUhvYZj8mANHj
         ISg5CQg2/yexGI9LiXFNudnNOqAo/aRyLLYzS2DvXuhxFI5f02fycV7U64vvgyMkL5en
         IY/g==
X-Gm-Message-State: APuU4Z85cbTFxfpsA/mZhjqA30k8U0HHMKSa8anA4QkG8eAABuI/nWCE
	YRkK8VaNtkwwcmGvUAk9stBRfx1evB4+JrFspBOvHx1xh9IS97ivNyeGX52jB1/Q
X-Gm-Gg: AZFdTZe8FYIMrf5gvePNLasZ/chO3b/bniRvdxsMcRg0jj1YF6fX39GT/6T2hz/Zn9D
	yKs+ewzm7HnIdBr7XbXRviScjRSpNT3T1eT88fUqTt8XqKH5CTl45i+gCogYtlFZzgznkxP9D7B
	p/yGAWoMiR317VQ9pbkRVUPAktcwPjGO4xd1uefFj87NJgDMBN2Bn7xUwz0L3LTwiIHqO+/+29Q
	AsBWaPnGww2kWGlA1QSCqPPiGt/qqbPrcQG4hfVpDnYXwstHI33tfzt91MLy7r982LfkZFYRTAZ
	T+MhHZwrSnnVreh6hf3R5A8aT/cf7kY73gtRo4UTzljRjq25KHAohBr+jvAYDqXwBgkjesGFcWe
	lCxIE/HxffM8BA5kk4AFpmaTShJaDPlbeINjjjpkIIGYFvttvj//0IPHaxbLgjcEMVhAB5BQOqr
	JxBnXUF+F7uA5EdIbE8VT+wwOrwJ09fF+H9pQ3zA11UfBpyOm/YwUbNYDjmOX02vLnhcQ2lVBMD
	ctxSdrgKYsHhgPwAniy/rt+V1Tow8HD7P4Sxamo4AlcFGhSY9xJiwJ0bwEtrR8Bb+KoKMuhj7nK
	9exeolYrURg1WjuKQdl6x8UF+eEw7tTiV/7oFJntuObwvsF53jIa3HZ/sj08qWHRUHLI1ORML1N
	2HSf0Nidwn3GU2L1OxDJDiXRgVY/67BRO6dszj8013qYOY/vOJlwCByaRqlvsJW7+5bcuNjbE1Z
	GYmjHqS9Vx1TXg6hvNBWXOi2qyV04rtYFInPr4KXx2kgA3h1c4jXWAxGMylDHwESBr2ihYpRcAL
	wxqk7+JJLl2l3l30uFd8L+QmjxFu75VcStUR0ALrRqD1fXzJTZH11yo5C2NwQF1olJ3nARZbXl/
	ZXRB
X-Received: by 2002:a17:902:e80b:b0:2e9:9a19:c43 with SMTP id d9443c01a7336-2f03f118277mr226782195ad.15.1795739769842;
        Thu, 26 Nov 2026 16:36:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 05/39] libubox: Fetch over https
Date: Thu, 26 Nov 2026 16:35:09 -0800
Message-ID: <20261127003543.2167775-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133175
Content-Type: text/plain; charset="utf-8"

git.openwrt.org no longer accepts git:// connections.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/libubox/libubox_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/libubox/libubox_git.bb b/meta-oe/recipes-devtools/libubox/libubox_git.bb
index 3c51d36848..5b24cdc31d 100644
--- a/meta-oe/recipes-devtools/libubox/libubox_git.bb
+++ b/meta-oe/recipes-devtools/libubox/libubox_git.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "\
 "
 
 SRC_URI = "\
-    git://git.openwrt.org/project/libubox.git;branch=master \
+    git://git.openwrt.org/project/libubox.git;protocol=https;branch=master \
     file://0001-cmake-Set-library-version.patch \
     file://0002-cmake-fix-the-CMAKE_INSTALL_LIBDIR.patch \
     file://0003-cmake-Don-t-include-lua-and-examples-directories-if-.patch \
