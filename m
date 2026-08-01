Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7861BC55181
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:35 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13594.1785620734858053873
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dPVGPbYo;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cf50c6f235so24457815ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620734; x=1786225534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1BlnFmMrCL6VUHpMHkTEX1S0DovpQNNXDOQc+W3lci0=;
        b=dPVGPbYomPHZgFh6A1I8v6GAlrrbfkjPZasOhfVZdUs5XpPaMxB1gnpjJxMfExNmvu
         KvzoaTladBgFqqZIpDZYMY0s5tBwh/+TrG2wKr5XLd1Ln8u+KQM6RuY+zurMORlN7j9t
         ktGxnsucRkQHblKOR2JgSL60SGWgCFPZ87onowwDT8UPgbKzcsfNHipLc3sNNlKA4qDt
         2QTGmyXRXTC5xmnrxLUDqG07/12zC6C6s19pvijbKTuUlGjDOnJndWj/Z6NonbSvDWdw
         rRZX2JML9CNL+P4clgBJJ0MC5ze5KUoJIKXUMrRJthW3PNy6gc/0mrDPEg5Kzw14AIbL
         yeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620734; x=1786225534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1BlnFmMrCL6VUHpMHkTEX1S0DovpQNNXDOQc+W3lci0=;
        b=ThKXMfz372twWu2WXTuNkkrBAAv9co8Iu5b3R6uqqJNBxwtIaoCBvGFCVC0Fad6KF/
         IHyPqJVl/jIt+e5mjARorse4D5ZwYyPdr0wX/BUmIVqLmpKXf/ExjhkZ0RISSQI2X7FP
         GJ3gl2DRSqLqD/g4Gv2qSVkKbkZVplfzPpFBRbExVsaqcNOmkHmGPx5PHusbklw72hrF
         yCKutynv2Tou4w2hfNmbvdoEYXJOCmQaNY+q34+QB7+VYBYKASVaBEKQe4gwpsWdk8cW
         kgzrM6CXX4Fd5oZ8cAvRzbZBgVQuAesZBxqCpoC+1GYPcOSC6EfH5cC/pMYeIURn+Ifx
         +2Hw==
X-Gm-Message-State: AOJu0YxVA7X5RTfLRVkSx+rdYVY6y6RRveE7ntAj1SCIx6fztg79ZIhM
	ZaL9XsCzPK5fi+omcpK2y1sy+2wfBtoQrdxx2ngIxy2hmNngI+miIRYy45R1w6w1
X-Gm-Gg: AR+sD131vVNq5Ohohp8WJyGTp9ytW7FSM67mMVvoGCrs+cxHPFtMNnTcnhCqq5/p+U8
	4QxrROoVqqSffs3TjgVyEfx5vwRBOKkp6lBbkzHDlkgHfSN4WztgmQcH9kMclYlVSOAiAlNDXwL
	psN0CYrxr8LnZYKJn6LnJN1vxu+vM14sZaRVSAaD37Eqngi9H5bKSH5Y77LpOZldWwlaPU7kmEa
	f2Hgr/nui90s60JM1Hf0NZ35CSiWz5zt3DOcQS6Y6L5+qs9qkfno3C5aNZ1/RC6YCHBNlyh+gWF
	I3yDYPdpCz/WDxfr0KiGhN2T2+qorBgTjcg9V791ERwXTUMV4npLx2JwBN7km4TEhiZnPmdrOBm
	VKaEX9LwSAf1LNOAtionLGi/DiMGI/79dZUYbssCpeZA3mTWQDSqUTSNaOUeKGg4l6NndcYpXDC
	hbOpmu+MUhbTeCbe+AtkJKEc50bQwMT1v+MqeW8j9l0ry1cycfblWONTyDMDOFz81+6wIjZSRAE
	7ext5XTdIR+v+UdF6IuxRd35LmhFKDtofgi2tLZiBSWW94OiLFt6JatqhB4r03oAkrzKmvRwuTy
	00xjy96KQY+zOG4WdMig0YWkLWDv4SPxlx6NU72ss+eqMQZiGv9l++W/8pqfTB02/f64BvTy/Ur
	T8A==
X-Received: by 2002:a05:6a20:3d19:b0:3c3:dce5:b1a0 with SMTP id adf61e73a8af0-3c92a93cc60mr4848805637.64.1785620734213;
        Sat, 01 Aug 2026 14:45:34 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 06/31] libde265: upgrade 1.0.18 -> 1.0.19
Date: Sat,  1 Aug 2026 14:45:01 -0700
Message-ID: <20260801214526.788343-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128623

Upstream changes (release notes):
 * 1.0.19: security and edge-case correctness fixes - heap-buffer-overflow
   read in decode_slice_unit_tiles() from unvalidated PPS tile geometry
   (CVE-2026-45382) and heap OOB read in decode_slice_unit_WPP() via an
   out-of-bounds CtbAddrRStoTS access (CVE-2026-45383); dec265 SDL fixes
   for 4:4:4 streams and mid-stream resolution changes. ABI compatible
   with 1.0.18.

Not upgraded to 1.1.x: 1.1.0 reworked the x86 SIMD path to dispatch at
runtime via __builtin_cpu_supports(), which reads the compiler-rt global
__cpu_model. Under this distro's clang/lld toolchain, linking the shared
library then fails with

  R_X86_64_PC32 cannot be used against symbol '__cpu_model'; recompile with -fPIC

because clang emits a direct PC-relative access to that exported,
preemptible symbol. Building the objects -fPIC, -Bsymbolic,
--exclude-libs, -fno-direct-access-external-data and a version script
localizing __cpu_model were all tried without success (lld validates the
relocation before applying the localization). 1.0.19 stays on the
compile-time SSE path and builds cleanly, so it is the latest buildable
release here.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libde265/{libde265_1.0.18.bb => libde265_1.0.19.bb}        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/libde265/{libde265_1.0.18.bb => libde265_1.0.19.bb} (93%)

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.18.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
similarity index 93%
rename from meta-multimedia/recipes-multimedia/libde265/libde265_1.0.18.bb
rename to meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
index 4d1795abb9..ca05e9099e 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.18.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
@@ -9,7 +9,7 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 
 SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "36ad04841c209cb8b3577ec2723d431b6bf7efa0"
+SRCREV = "824b4138ecd51611d7073f1b50d5d6f982609b06"
 
 
 inherit cmake pkgconfig
@@ -22,4 +22,3 @@ PACKAGECONFIG[libsdl] = "-DENABLE_SDL=ON,-DENABLE_SDL=OFF,virtual/libsdl2"
 FILES:${PN} += "${libdir}/libde265.so"
 FILES:${PN}-dev = "${includedir} ${libdir}/cmake ${libdir}/pkgconfig"
 INSANE_SKIP:${PN} = "dev-so"
-

