Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79654C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 06:31:21 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.40694.1712903474875961197
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Apr 2024 23:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UO+GSO4C;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6ece8991654so598013b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 23:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712903474; x=1713508274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ySpGB7b43vJnOHRlIARgtPUxUD8wTTI9EIzdnK1/Ko=;
        b=UO+GSO4CrNDGHkqWkueS8PCQDmfdS3+dLXuwoIFKrRkMtPCJFgiz1Wc+A39J3SbwTJ
         Qb/235wzawAFwH4X78RCO8G53nmfMoHa8EujMKtP03ZcSLChKNujdAM8P0ejj24rnj6v
         a03eRALG/dSlsm2S7TvWVcfwKeILJTzYvkctXY38HMroS5z4eIc9WTTyCFlhXv9p6wxs
         ZDbmb/abfGVGM5AIH5NiQ7FULBmqauUl6Mu+pblvfmBYP/Tc59sheaBERsWnyy1GIr26
         QNaoy3rNRF7PcNxspZft14fVPPYpBC4MVBC34ThPkCKBZrZ0BZvQBJayL7W1S2pVsxK/
         T9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712903474; x=1713508274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ySpGB7b43vJnOHRlIARgtPUxUD8wTTI9EIzdnK1/Ko=;
        b=pt+AhANw7eQiErmaz6GTRIweqVB/rCAMOBVSHz/BRmihYtC6WIp3mXEycBg8JQU6M/
         SJFiNGbyglHVeFgwORVRFrOSHu63Xql0Z3+vV1erqwC4rFw9M651YixxPnlwEG+74Q1x
         XLBk39zb75M/PXPaj92OYgcpwUYZEN7kjcQOtwQ+QTe8b/n3sPA9G46pw72gqyM2FUcX
         L9mrMBQp8ze7PoS5geXFczClObYWXINIl0K/H1l9HyEp1EJPqr8Iqd8p+l+6SX1338jG
         544uiSFl8B/D/mKVk4BmGN9kEPJRpH/g4V3jTb/d2p3lo1usTSeleXAlNIoAQIQeM7gn
         4jog==
X-Gm-Message-State: AOJu0YzHR/UsVznZwsQT1RO85oU2ERmF1w9J6s0MroH6x8hLrhVkVvum
	A9gCmiS7nWe98mp+WNgywGYbC0sAOKGWfr95Vl+Qgaa53w2wOd+wm6h60t1q
X-Google-Smtp-Source: AGHT+IEwVuqTdeHyFCoW5sbNhc3FfWhyslYhltCADuydIGhkz9tuzW1VyhKisdz5X6F0HLJ7RJwyAg==
X-Received: by 2002:a05:6a00:398a:b0:6ea:b48a:f971 with SMTP id fi10-20020a056a00398a00b006eab48af971mr2282317pfb.2.1712903473857;
        Thu, 11 Apr 2024 23:31:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d35b])
        by smtp.gmail.com with ESMTPSA id q18-20020a63d612000000b005dc9ab425c2sm2103036pgg.35.2024.04.11.23.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 23:31:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] oprofile: Fix failing ptests
Date: Thu, 11 Apr 2024 23:31:10 -0700
Message-ID: <20240412063111.1267280-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Apr 2024 06:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109934

Files need to be in right directory structure

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb b/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
index 335ab48bb2..092d22746a 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
+++ b/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
@@ -58,16 +58,18 @@ do_install_ptest() {
 		find ${tooltest} -perm /u=x -type f| cpio -pvdu ${D}${PTEST_PATH}
 	done
 
-	# needed by some libop tests
-	cp -r events ${D}${PTEST_PATH}
-
+	install -d ${D}${PTEST_PATH}/../${BP}/events ${D}${PTEST_PATH}/../${BP}/libutil++/tests
 	# needed by libregex regex_test
 	cp libregex/stl.pat ${D}${PTEST_PATH}/libregex
 	cp libregex/tests/mangled-name ${D}${PTEST_PATH}/libregex/tests
 
 	# needed by litutil++ file_manip_tests
+	cp ${S}/libutil++/tests/file_manip_tests.cpp \
+		libutil++/tests/file_manip_tests.o ${D}${PTEST_PATH}/../${BP}/libutil++/tests
 	cp ${S}/libutil++/tests/file_manip_tests.cpp \
 		libutil++/tests/file_manip_tests.o ${D}${PTEST_PATH}/libutil++/tests
+	# needed by some libop tests
+	cp -R --no-dereference --preserve=mode,links -v ${S}/events ${D}${PTEST_PATH}/../${BP}
 }
 
 RDEPENDS:${PN} = "binutils-symlinks"
@@ -75,3 +77,4 @@ RDEPENDS:${PN} = "binutils-symlinks"
 FILES:${PN} = "${bindir} ${libdir}/${BPN}/lib*${SOLIBS} ${datadir}/${BPN}"
 FILES:${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/lib*.la"
 FILES:${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
+FILES:${PN}-ptest += "${libdir}/${BPN}/${BP}"
-- 
2.44.0


