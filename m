Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B5BCCD184
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:53:08 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.18468.1759326781850868912
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JWpKSj60;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-634c01ca9dcso9153420a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326780; x=1759931580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=upOBRWRG0r1LvaPtQvBiMy9Th5x3fZcnBmXsj0iuj18=;
        b=JWpKSj60MHmoYaEPam4TfZDZg4m/wg1cqVqwAmT4TlP1MvfpEoSRK/2s+L1ydt9uYP
         QtUQDvns/vu+Guy+RMABFSwoj9hCvX3MELL/c/RMrhchRpiaAF++JZltemfUcUJifElW
         2TpBUY14rlChz5mEHy1DtBb7tRYt/1v0nXzPidHb1eMN2tlK47+I+yP6iEZPPCNC5W58
         B+cEoLZAOZix9jDTFxOwlnNpsZvm2aZL2h16PlEV4jNlbQRnZnWyDjQ23RGs7PAlUDlP
         bFVoTism8nM3ff7/SGTIFVUSk1zQGYUKE31sPc9g5abVYUw+O51+OQgmTY33fKiGC6zZ
         bpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326780; x=1759931580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upOBRWRG0r1LvaPtQvBiMy9Th5x3fZcnBmXsj0iuj18=;
        b=g7boEUCJK0iFpb8WcQv0pTb7HY+lycPWE8B7sISwcdzkeHSucLREYu6yCwBGXsBaLQ
         yC4HHAlKGq3i6TypRJoX5H5JHMJdk3toBim/ND1mT/3rkh9G53LRt0tpx+47tcLSGPSG
         KDOxLD0V8Nq9MpSoMvpkv/4+Kqd+56jdxpql17fqO1nDnf1ptDKKnTisPiezwP8moM6R
         awk8h7Y9LfCt1IZhxMkMF88GXMn22v0dcI20YBrJYHf7bZMEHSA9C7CbCf3FC2Jyiqaz
         AeRpsyLZicjq8eD5Y5p6aTwCM+ODbZ/mmgU++xX89ugyJCERynRcHgD7iXQxyZDUKWXh
         p12Q==
X-Gm-Message-State: AOJu0YxtaOHHW5IntYwr37WxDEpYuoHws4tta/fhkkT+PS2Kr+tCN1bx
	bB0/tnatDm+HjZZfuVmmq0371IEOjYW4saN2bm7i+M8ylgOD8czYI5cl7UhFOQ==
X-Gm-Gg: ASbGnctmLmzFaWec7ADfAynarioD1bMMVGoFDRajfNRLb/pAKMRfJfu0Jh99sW2AcZb
	sCGL/yqQEDGorEzRSm2uhXrk6L1PuHqxZHlZ5SLZELZNHZ2tWwVwkBcelztZX34CndoWm6xdh0g
	vvsZgISkCyLB44740IFiSQDVGlPpAeFyHjyCq5RK+rp9T3rnlRnVuEmqr6p2XyJwxnxgWmJJhlo
	/OXu/ltJCBtps6ahYmfTMwKuQ+UnABszG18JacPKb87RQZ8sMbinSDytoQhcJ1tQrU5U/Ju6CgV
	EnNfDbR79DVXKZ3V7zWJNvNNSGjn5+3rGNRPSVHzZaGb2az1ozBQMsJcoOBxohSun+BlB6GYJec
	ZOtsJy5lR/A/1cTlZUqztUwYMyOgkQSyStCyyMcizwFiq
X-Google-Smtp-Source: AGHT+IG86oZM3QfB44WB1+pOUCJqrN8XcSq1dTF2nT2aygRwhT2bqhNAHngXK1yIMpC/ZXExSpOAOg==
X-Received: by 2002:a05:6402:2812:b0:634:ab34:ed40 with SMTP id 4fb4d7f45d1cf-63678a99e53mr4051660a12.0.1759326780086;
        Wed, 01 Oct 2025 06:53:00 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.52.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:52:59 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 19/25] libmad: switch links/SRC_URI to https sites
Date: Wed,  1 Oct 2025 15:52:37 +0200
Message-ID: <20251001135243.1490753-20-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
References: <20251001135243.1490753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120134

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Switch to the sourceforge SRC_URI since the mars.org site only supports ftp.
Also switch the HOMEPAGE and BUGTRACKER links over to https.
and drop the obsolete SRC_URI[md5sum].

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f61cc5260954e840494194805f6f957f60cd4833)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
index d3ac85ee0b..f197a4238d 100644
--- a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -1,6 +1,6 @@
 SUMMARY = "MPEG Audio Decoder library"
-HOMEPAGE = "http://sourceforge.net/projects/mad/"
-BUGTRACKER = "http://sourceforge.net/tracker/?group_id=12349&atid=112349"
+HOMEPAGE = "https://sourceforge.net/projects/mad/"
+BUGTRACKER = "https://sourceforge.net/tracker/?group_id=12349&atid=112349"
 LICENSE = "GPL-2.0-or-later"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
@@ -10,7 +10,7 @@ SECTION = "libs"
 DEPENDS = "libid3tag"
 PR = "r3"
 
-SRC_URI = "ftp://ftp.mars.org/pub/mpeg/libmad-${PV}.tar.gz \
+SRC_URI = "https://downloads.sourceforge.net/mad/libmad-${PV}.tar.gz \
     file://no-force-mem.patch \
     file://add-pkgconfig.patch \
     file://fix_for_mips_with_gcc-4.5.0.patch \
@@ -19,7 +19,6 @@ SRC_URI = "ftp://ftp.mars.org/pub/mpeg/libmad-${PV}.tar.gz \
 "
 SRC_URI:append:toolchain-clang = " file://0004-Remove-clang-unsupported-compiler-flags.patch "
 
-SRC_URI[md5sum] = "1be543bc30c56fb6bea1d7bf6a64e66c"
 SRC_URI[sha256sum] = "bbfac3ed6bfbc2823d3775ebb931087371e142bb0e9bb1bee51a76a6e0078690"
 
 S = "${WORKDIR}/libmad-${PV}"

