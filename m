Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E32FCA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 15:15:07 +0000 (UTC)
Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.191.1790694655763103076
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 08:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=klms2vmY;
 spf=pass (domain: gmail.com, ip: 74.125.228.97, mailfrom: mehmet.fide@gmail.com)
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ac6f5c507fso3674930a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 08:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790694654; x=1791299454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B5nX+tCIoXubtHS4AfclzChnZprFb2ZmNXHM9dqSmKk=;
        b=klms2vmYMhilgwdbntpJIGJQRTbypNTLP54gf0BERlXEDWcI4orPSKZTr6t/dRcfjm
         P/irIlQt8iEG2WasjXNHoiyeE/TYMqyoz08LtRvhgm8+GuZUu6+wzdJy+4hmJphU3Xa2
         cIlblknrnrLfuT9k2vBBXxUHh5mJ34eUAqqMpPYl7F9WlymLkmsuKnq3FvRhX0jbNaLI
         pTb082vIOcBQixuGrIc5C9gBAUTIz3tcZbNdI+UfMxeeCNz/dFWZYT1I61cClvFsze8p
         ICKdEIq8Z2+W4fJNLJjVhT49yElxsZhW2YUHlrehlZqUI4l7ssee7OXan/1wdgyGbXTa
         q0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694654; x=1791299454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5nX+tCIoXubtHS4AfclzChnZprFb2ZmNXHM9dqSmKk=;
        b=NQ4TqxowPMeLTnyogWrx76xrgm3eBh9TISn7ksmAaY30tdNhqgZRtWLyPFABXdwp6K
         Ikeye87L5ynq+GhFaZIGfz0tHJirUokB9zi74MfRAtevgXWwOCaQznAxoQ+Smgp37Hf+
         S3VQQ2d+V4eZvrj1CrD0JeipD82qm5ghYbkwh7eghymJTFmPrchyS8JpglEvgtcxrw0I
         kvhn2IFXxzI7xtIn+CQerQBCXHdrArt1cH1MFS4J3/hAx8Wj5lqr+WvN71r0V7G85gUo
         EwJys6n2/E7EPXgtewg5gzeBo2PH5kWLARifQu1dv7zbyHvPKdby8wxKDq12EB4NvlWT
         1/sA==
X-Gm-Message-State: AFq9FYJqC1qZZLToRHFWzaXWqkXtWvJQBagfrYvJFLKDRnfAppzIg0PB
	gJKP7e7dSncxMcx+GShJRbMpKYO3yfK6mtjdV7IPZdrFvHF89+nsxbt5h0vNyw==
X-Gm-Gg: AYBFou36xffZS2LHdSmCFoV5DkH1Tf9DoNb5j5l11KGNfRWj7/DWLRnD1inHw8P20HN
	Y8qGjodR6IkneyOaSq7yEbVfhEa06kEZLfVWaPEeBCbx9xZ5Kd+QxqcF/AMRiN0fwuUiNKnXzL7
	0/OyiPxmbN67n1XDp5deL8Az42QVziVZzfl3b2J2xd0S+Ac41CUy3u3E7uqDu42wf3Et9sTSHr+
	bGtWUTVL5qCDbjy2yJXVf26uG8q+Ru/vrqxFCtSP9+YVBZ/4DDeW9P7Ud5ZnbFT+QDSOQsS8bZm
	6wuAslCm5a3TTbCVFu8+siDXMwTpeaFySOqxYW/CROEUL4Gm8625K1eNjcex9VAFZwMbZpEk9ex
	49eoBpzq6vj3060/akRmFhpaFxCRTIDdYQjcjETAxRQx5w4oBwCTXp3DsAfU5Rtf03YGAXxnOnG
	YdrVCq3yP2c1giEu//YHQOkXnh8LnLMeiftI6juKRs2KLRoYnTxzKXRhpOZJNpaBxWKfuTDIJdo
	c2U
X-Received: by 2002:a05:600c:1d28:b0:49c:fc6e:8cbd with SMTP id 5b1f17b1804b1-49fe66fc677mr314140055e9.33.1790694276417;
        Tue, 29 Sep 2026 08:04:36 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013d0ddf5sm6359775e9.3.2026.09.29.08.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:04:35 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	mehmet.fide@screeningeagle.com
Subject: [oe][meta-oe][PATCH] spidev-test: clean the build dir before configure
Date: Tue, 29 Sep 2026 17:04:35 +0200
Message-ID: <20260929150435.2951493-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130483

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The recipe builds out of tree with O=${B}, and the kernel's tools/build
writes fixdep .cmd files into ${B} that list the compiler's own headers
by absolute path, version included. When the toolchain changes (gcc
13.4 -> 13.5 here) do_compile reruns in the same ${B}, make cannot find
the old prerequisite and stops:

  make[1]: *** No rule to make target '.../recipe-sysroot-native/usr/lib/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/13.4.0/include/stddef.h', needed by '.../spidev_test.o'.  Stop.

Empty ${B} before configure, as bpftool does.

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


