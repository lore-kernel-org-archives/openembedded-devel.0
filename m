Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B74CA5FE6
	for <webhook@archiver.kernel.org>; Sun,  4 Oct 2026 06:44:43 +0000 (UTC)
Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19061.1791095505426884220
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Oct 2026 23:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OuyqwXcF;
 spf=pass (domain: gmail.com, ip: 74.125.225.97, mailfrom: mehmet.fide@gmail.com)
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b104f6aa3so344633f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Oct 2026 23:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791095504; x=1791700304; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+zXnLRsGfmHYtWHMDlJD5UXn8i13sztD8aJCTjv9Ug=;
        b=OuyqwXcFypZpyNWo1h2Quhl7kZKoueJalqTH3cIdrfiZ/S9jdBH04UpjyVmhrbejtJ
         2rOQh2TgfwAerKIN7G94IvQRRnimDinWlVmU+kw2Azrw5LZxQJtaDtriEoDUvlJnsDtT
         lXr6tfPmRxiQLRZ7A4q6bb7cvHmlfrTrDRf21aXOSDMa6WolR9sAvDI/6+meKJa9yQiX
         Fhx71QpSzpbrJaa0NYHfa8A8oRn+YcjB/ccic7Svl+8kp9vsSExQ/lglVmNRvcsWec2W
         bScV6Wi31JUyM7EghMXY91bNjQEmuKyov7ny3emFDfXPWLCbNQJgrorcT0on/XibQoOH
         4mLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791095504; x=1791700304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+zXnLRsGfmHYtWHMDlJD5UXn8i13sztD8aJCTjv9Ug=;
        b=t+4pY1bhImX/HMS6P5xi3GbGRec3y3j+yH8niTANWwE9KW36oPX6NmItTu6N19J6Me
         YGkcWK/4Lli9eSGb1cgrO3oJzUzYbYAqM0wI7tqG/N7ZeDPBRox1sVnIQNJiJsgDUFpl
         NOA1t1rhN1net2/uyw5rmlYkgBuR5Odi8AefvgQTFNM4P6udJtghheHKsT8r6lQByVR+
         gERW1an6MlTqNjAEYDpM0SnnA/ooYqFX35veohFnwa8dhGDSdXnMpD/5NY6FAFhgmv99
         aNXKWxqrmrZ9ic5Gh6Db1gffYsusGK+DqXvXcCidC7t6tKwJdnlmaOJTa7i5OLlGPhIu
         sFiQ==
X-Gm-Message-State: AFuF++lMzkpORWjrTVS1nYpoobrFHCU/lJdMuuj1XGvvQxBpL9BgOUbX
	i89JjIocupwVQ3QQS2UsJxRCCkSlHpawek3iZ6KJp7ycNZz6Em49cTKxqV4e7A==
X-Gm-Gg: AYBFou3kRYS7KEt4QQR+YdPLljX0DwQ/D+eZ8kX2WK+r88MYjkXobta38bRDe1L1hfZ
	0CBMrhC3gTCZLDq9uCad4VADOKefE8o0B+gNb6Lgr9KuQjs5bNVgsstpU+4MM5SIWjHRyYDbAMq
	omAWiZvQBc+wwqdA62ZtAKsCOkZsWLFDHWwDWw6uv3Zx980cDEDgndgTgqhz7ndxMx05kwtrK2Z
	bDLON1u9JyLucH6JfmTixWzaO59lGKYvSXj0H5ZOJkBZVNYZlQ/1VLNtggwrLceir2wKD3gKdtT
	S8JdJ5RKPTiD+it4JTEDanSBTnBQW0ORNR2cFGrNHOZhYa+XaOmi3EAbfXiD768siQ3mjCYg0Hj
	tzvY+w4wSbST9TPQ8ABoSWA1YuCGH6w8Uucyq+fU92vjmjsxUsbM86plRQDnl4RhJcGg6hCyKOf
	a4gSUR7T2CameU9zhZbUooDyd7e7/P5fUzzooka+iV6fUVc1ZwwvqCY6r9YIIKKgOHRsG+Yv7Zp
	9Nn
X-Received: by 2002:a05:600d:6445:10b0:4a1:6d21:93c1 with SMTP id 5b1f17b1804b1-4a16d2194fdmr24279195e9.16.1791095503448;
        Sat, 03 Oct 2026 23:31:43 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0316b2524sm268956555e9.1.2026.10.03.23.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:31:42 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@oss.qualcomm.com>,
	mehmet.fide@screeningeagle.com
Subject: [meta-oe][wrynose][PATCH] spidev-test: clean the build dir before configure
Date: Sun,  4 Oct 2026 08:31:42 +0200
Message-ID: <20261004063142.3490664-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Oct 2026 06:44:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130619

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The recipe builds out of tree with O=${B}, and the kernel's tools/build
writes fixdep .cmd files into ${B} that list the compiler's own headers
by absolute path, version included. When the toolchain changes (gcc
13.4 -> 13.5 here) do_compile reruns in the same ${B}, make cannot find
the old prerequisite and stops:

  make[1]: *** No rule to make target '.../recipe-sysroot-native/usr/lib/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/13.4.0/include/stddef.h', needed by '.../spidev_test.o'.  Stop.

Empty ${B} before configure, as bpftool does.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit bd52d9b47960059767da18c01adac11b9693889f)
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 meta-oe/recipes-kernel/spidev-test/spidev-test.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-kernel/spidev-test/spidev-test.bb b/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
index 7b87dd28df..4c59d861b9 100644
--- a/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
+++ b/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
@@ -11,6 +11,7 @@ do_populate_lic[depends] += "virtual/kernel:do_shared_workdir"
 EXTRA_OEMAKE = "-C ${S}/tools/spi O=${B} CROSS=${TARGET_PREFIX} CC="${CC}" LD="${LD}" AR=${AR} ARCH=${ARCH}"
 
 do_configure[depends] += "virtual/kernel:do_shared_workdir"
+do_configure[cleandirs] = "${B}"
 
 do_compile() {
     oe_runmake
-- 
2.55.0


