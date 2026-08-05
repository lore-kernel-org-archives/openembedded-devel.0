Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E81AEC55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 17:12:34 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.652.1785949953135619913
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 10:12:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mCyvnzEb;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso1285514a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 10:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785949952; x=1786554752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XakmDXUDZcCY13BMGg1vGrZSCislIyBAieMXxS1yhUA=;
        b=mCyvnzEbzRG21c63EKQxj7ceQXOjVE/JDdHLjZGZruzZTENhL1cq0aHjiOL7x1DGKZ
         tj/zZFWIDpXoMuynl/g3jpO5zPMm8s/ITIELhJMHfOdh/Oh1EGnPH5nxhkC1fVKCEydk
         HaSSCiZpPhyNiDStVOEwsGR2ffE9THUhkP1tIjirfqHsKMgr5RoacCDsSL9oKlGkEyHD
         KWvXQNpkHf44YPmZf03SOCarYRoo9cPQJDDIv4zLv22kWCfWAjamfe/aZciBb1ruxHsX
         Onlomv/hPz9CuURLSBGGiRc2xTxSjUQcGCIKgpIpgZOsR0bhboohmFOOplc+iVooKiP9
         bKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785949952; x=1786554752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XakmDXUDZcCY13BMGg1vGrZSCislIyBAieMXxS1yhUA=;
        b=payUhBtIRPtYzpp4o4v5skwvooaPGNtFTSjdNCRpAm2ALv2J36FS4ONzZQhM0QLSar
         0S6OKEuEfwq+Y4v0mMMs13L61qrDuP55RKV3coklr7uqEgjCExgweZMUC3NTLheOuitv
         VUDt12svgOphEG5GRPybahmlLY57bj3fveCUoQYwZU9D/6AF5+MjayMF5syw3+sdHnjH
         4jrwKYyarscHT1GN1Ggq3EFsNFuiLMS40YgPHF88upx+vjat5R4a69eVmb28+cyG1TKB
         OvsE1KTKrdOZftL2tLGCQI7gashPbJvo7MF5Rrd9mEOVlTYQ4cFnABTnHvASzLVe/0rD
         1uzA==
X-Gm-Message-State: AOJu0YwguNvIguK9+SF9Ucn6nEUYAOW5UxtDSNVSd134JTmNfqGvgUCG
	4/zI83fjrD8hdPC3RhPMgJT6sCi2TPsHfhvLUlwpSWzs3xQT4bHyZ956qY+JekQA
X-Gm-Gg: AR+sD10M4KRLPt6juGDznYpDd8Nv9AAjcl6p5G+NnPcSWMpPF3FIayLfTCP6COWjIFN
	BG6+SA3YG6RqgZBy+pWWYU1FGcACMynTlJm9bjdbqM9ghbeNEb/kIcs3pwlaELaoEu23ZDBxzpm
	i9QXbY9JrtzSe0x6gDD6Fm1+UzkKtxC4EFiz9bKuVsSBp6SOAKcrxEzxqFKpO/5Np6Cl9Exv26G
	STLmnONB8Ip2Tr4+q0qpf812WnRUkxzb2lQj0B4Iz/yXj59tzoYxduBgz+Nns+2HQEZXIXPheni
	W4WDyyO2NTk/2IZs6vVpe6AmXgEv6bcPXc1j2QNOI2dD1/sm7kBMViNIM8bEdoij7+wpgrPw6DZ
	LVKD+mW3BCp23dJ0igA6YLhZtFvEaTSfT3Q4qJCJYsKlRu3v/NipF2C4YiCTGPJqEEN+1uthXDZ
	25DAAHdrGqXZ+LJ3uQ9JIn3gbr1MBVVrv6qWrxH4DQXGS7oovM3q2Oy5dkE+sbL18q1m3ivi3oj
	RxVLbnp/g63TOt8TRMyeC7VvaK6qVRUcCq3qPyUac+RP/Efpo/fBC3urKy2nBc8rau/t/G+HuKv
	1aznm44cKsFJ5Y+y0gdZLEUtE217ykwDmZFW2moLVZNX7nIU/rw26aiV/pbyHePymfFjQoUfvzF
	8Zw==
X-Received: by 2002:a17:90a:ec8c:b0:38d:c74d:29c5 with SMTP id 98e67ed59e1d1-3903c5c0c92mr8890528a91.19.1785949952289;
        Wed, 05 Aug 2026 10:12:32 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca8df89asm29333653c88.9.2026.08.05.10.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 10:12:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] libsdl-image: Fix link failure by pointing OBJC at CC
Date: Wed,  5 Aug 2026 10:12:29 -0700
Message-ID: <20260805171229.3631757-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 17:12:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128822

configure.in calls AC_PROG_OBJC and libSDL_image_la_SOURCES carries an
Objective-C source, so automake selects Objective-C as the link language
for the library and emits:

  libSDL_image_la_LINK = $(LIBTOOL) ... --mode=link $(OBJCLD) \
                         $(AM_OBJCFLAGS) $(OBJCFLAGS) ...
  OBJCLD = $(OBJC)

AC_PROG_OBJC detects a bare compiler carrying none of TOOLCHAIN_OPTIONS,
so while compilation goes through $(CC) and is fine, the link drops
--sysroot and the tune flags and falls over:

  ld.lld: error: cannot open crtbeginS.o: No such file or directory
  ld.lld: error: unable to find library -lpng
  ld.lld: error: unable to find library -ljpeg
  ld.lld: error: unable to find library -ltiff
  ld.lld: error: unable to find library -lz
  ld.lld: error: unable to find library -lSDL

Export OBJC as CC so the link gets the full toolchain options.
configure.in already forces OBJCFLAGS=$CFLAGS, so that needs nothing.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb b/meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb
index 29fb8cb4aa..4b4cf4e62d 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb
@@ -17,6 +17,14 @@ inherit autotools pkgconfig

 export SDL_CONFIG = "${STAGING_BINDIR_CROSS}/sdl-config"

+# configure.in runs AC_PROG_OBJC and libSDL_image_la_SOURCES carries an
+# Objective-C file, so automake picks Objective-C as the link language and
+# links via $(OBJCLD) = $(OBJC) instead of $(CC). AC_PROG_OBJC detects a bare
+# compiler with none of the toolchain options, so the link loses --sysroot and
+# the tune flags and then fails to find crtbeginS.o, -lz, -lSDL and friends.
+# Point OBJC at the full CC; configure.in already forces OBJCFLAGS=$CFLAGS.
+export OBJC = "${CC}"
+
 # Disable the run-time loading of the libs and bring back the soname dependencies.
 EXTRA_OECONF += "--disable-jpg-shared --disable-png-shared -disable-tif-shared"


