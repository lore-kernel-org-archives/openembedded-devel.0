Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCAFCD98C5
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 15:30:08 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.132242.1781537398594067305
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 08:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mpt1r9g2;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so36183155e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 08:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781537397; x=1782142197; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2sM1zMChDsrbKro2Qy2tudT3XmkH7w47KB9VQDOdXCo=;
        b=mpt1r9g2Ened/IUbbKxe6oa6KrcjA24i6h+uK53BXe0BvBgk4ARE9HHSmcTf2KwUcL
         eD9RjzKfpuTAlOSNFAmOIX0klaSXdgh3XOvCDfCpoMk9BPWjsyZ4xEPzTKTaa7t8fZEU
         LQHLj2RLPOw0FG6eK8Ol5KoeBCjyO+3ZooamPmlPDjEshC8VhBTDRiA5WxlrhiMVLHrk
         yW+fx9MNEk0ZB0Z7v71+2TGwZ0h/SWXaynvHfPQmbO5tC/8/j3tfG+Nm7tmDVMIA6sAH
         yq0UG0yrYW5W+KYVdSnSSbPkie03MBr6NtTR5UEdZLXuOwgdntlbHskF1mrcqdjSdB/W
         2qRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781537397; x=1782142197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sM1zMChDsrbKro2Qy2tudT3XmkH7w47KB9VQDOdXCo=;
        b=ePUDGVQOBaG/eJ9KXGEmvQwb0xwxJMuQ2edRosHvrdeRd9RashOIXKnB/0SXsKgQOs
         Friq2Ad5ewJ2maJM50OURuPGqWTgx8IG8QGrZKN75ruO657wW5qKPklD6KLChBID5T2D
         iAcXOgQ6qqikEIM3S7xzy7/q2fr+fOhGkruw3ScM47J3bGRuh6p0srtFq6Ge30MKLEY3
         CXQAvNdD1YlMBFS3V5Dp7YMOIKoVEjqPSsCNse0gSUeSNQOT0jZfKAQnG45SfScJDe16
         aJVaaBmhH0qklXoAe9SBqgOOFgQ1kmvbLwSzwZg7ob7GkcOtEtPe7stgkj7o/Gp6ZNRz
         HQFA==
X-Gm-Message-State: AOJu0Yw8GrMsoiK0fJ/uB7J7eo+piVMZT/h0iMZlooEB3Yl9TdN7kXED
	5Iz2d/ae9kIsyhjBGmQg2WzTqN2LyL9THXmBtMFPxZMhrHr2WLzp/wOBMz40QxNZ
X-Gm-Gg: Acq92OHyQy2mXoscvWpmp/Ag0J9oo38OrzLbNBjetM2VEUSVDkoEGtIBiNIGDW1dyLj
	RcsG6t0bhPTmbc60ERKcgUUN6ihs+bdd3JxZZxC2Hc1comMFATLBzq+1ZE+ETOUw53Z3psHUMjd
	q2gX4EUKIxdoT/qULiGXiaGBuND6f5ofD1ZCQlZO+bOZUAG8rwdtcVD2lb3yWWMvnZOo7zhE36p
	yPtO8hMHf4ibpxo4gvg0HLK+DU3Sva23Y3QQ8hq1s1jlHW4E4QJpD/4cAxt4kru6w426itVJjgt
	XlDJh/KCz2rmGCIVaBIGzRhbQ2AflooKm3n/vUHX1B7i30BsZHeUOzpjSQNdeTrcsG4rHjMQfRt
	ywhGSKeTuTYbSDhGVezvxyTSeuXHRnIutK9gG05swyp/hDlIRbN1CDGV4bT/udAl7xT6V76pUEU
	inH5HT3fx1mAAgkBdEaMPr8QGA
X-Received: by 2002:a05:600c:820c:b0:490:b4cb:3866 with SMTP id 5b1f17b1804b1-490ec4d77a4mr152100665e9.10.1781537396425;
        Mon, 15 Jun 2026 08:29:56 -0700 (PDT)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2dbfb1sm38496698f8f.35.2026.06.15.08.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:29:55 -0700 (PDT)
From: uvv.mail@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [meta-oe][PATCH] tbb: Fix build error
Date: Mon, 15 Jun 2026 15:29:35 +0000
Message-ID: <20260615152935.138497-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 15:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127591

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

Target and ptest packages miss the run-time dependency, which causes the
following build errors:

ERROR: tbb-1_2022.3.0-r0 do_package_qa: QA Issue: /usr/lib/tbb/ptest/gnu_15.2_cxx11_64_release/test_tbbbind contained in package tbb-ptest requires libhwloc.so.15()(64bit), but no providers found in RDEPENDS:tbb-ptest? [file-rdeps]
ERROR: tbb-1_2022.3.0-r0 do_package_qa: QA Issue: /usr/lib/libtbbbind_2_5.so.3.17 contained in package tbb requires libhwloc.so.15()(64bit), but no providers found in RDEPENDS:tbb? [file-rdeps]
ERROR: tbb-1_2022.3.0-r0 do_package_qa: Fatal QA errors were found, failing task.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta-oe/recipes-support/tbb/tbb_2022.3.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb b/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
index 33741a7ac1..b9b75c62ad 100644
--- a/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2022.3.0.bb
@@ -30,7 +30,8 @@ EXTRA_OECMAKE += " \
                     -DTBB_DISABLE_HWLOC_AUTOMATIC_SEARCH=OFF \
                 "
 
-RDEPENDS:${PN}-ptest += "cmake"
+RDEPENDS:${PN} = " libhwloc"
+RDEPENDS:${PN}-ptest += "cmake libhwloc"
 
 # Hard-float 'd' ABI can't be used for a target that doesn't support the D instruction set extension (ignoring target-abi)
 # tmp-glibc/work/riscv64-oe-linux/tbb/1_2021.7.0-r0/recipe-sysroot-native/usr/bin/riscv64-oe-linux/riscv64-oe-linux-ld: /tmp/lto-llvm-264bc2.o: can't link soft-float modules with double-float modules

