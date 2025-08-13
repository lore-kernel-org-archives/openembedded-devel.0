Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034C1CA0EDC
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 00:50:58 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.90046.1755046256043133766
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Aug 2025 17:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dkbb0aVX;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso4520651a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Aug 2025 17:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755046255; x=1755651055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n8/wfDx5UxVyxLQ/I+HR7hUsTSD2ipTpDCTqn6+ckF0=;
        b=Dkbb0aVXVR/ZjePXme63agH+nABH5OlPJ4UNBQiWXZAFIxhQPJN/8vd+vVLrb5MkKc
         9gWVVGUvxJWi3/9esqpEezy1gL5bhkAuPWiMw7/s+d/SiP9LKU069p3QoW1VEL4nhRSZ
         oVWVGeMUy3debiE3gS+4bVWyZQFUPwh3r24RttAuBAV82AJPUdWKwLre0XxtV+G7kxRR
         Fe2/7rQInUkuAE3+Y8ISFlVNUh6RC6ecjywWxHocb+hNpd1ThF/mFiqwUTUtX/Usf6J1
         l8j3NFwWi08TlfvMA8LYlNe67hFS/hQ/J74Wvkxqv0I/flMtFBKbcC/vUD46gRWXy+BV
         0/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755046255; x=1755651055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8/wfDx5UxVyxLQ/I+HR7hUsTSD2ipTpDCTqn6+ckF0=;
        b=eIyKhnQ17guAlvLpdXt0S5BzWKczzE1re1Xv0Tt4tQOZTa6fzrdWgI1PEJufsvh8tZ
         r5kYZwMbEUkSBEKham9X4FGBz3QVOYRkJWCZY3wpjRhJG6Crq7Q9ID04qp2e+zTIS2+x
         4criAKOhDNJzkK6pR7Llx8XtpnkG/vT2F/cQqsGaq5KSvFKIFXgS/OEa7bTqk/cjrJfG
         KK3t6ZEuuICrgRCp78l8DG2dHAsU9gFXAeZH2qrxTtMa6ouVYb0T+d83LVflKlmKX2FO
         uMOAHmd6IkFGKxQko7A8kyh2dhKkmw2Ubm2Xsl8u9p59ODS7A69FzB0Xuj21bbZjb8Dc
         SY0Q==
X-Gm-Message-State: AOJu0Yz0Kz8H8DRmMl0ppZUH10MmprvJUO/oLnpJHWsvTC4eTQaONEOV
	AbOLnd0+1ytp9rO7k/DS5hc4aX6P9YqifkF9LkM+UD4yxhaLkXPxDyWPG6muSYCPWp8=
X-Gm-Gg: ASbGncvLWqzlw/7ezMVCkQCfTuXO1A0v4e5rpBdGy8clWzuCNUXlilDykPods2uKmga
	i9l/lMLPVXaAcWT4dtk6DhcAzvizbCnNe2hXxVmm8EG947YKc628JolvX664ehAFay5Yw5OmeaS
	drZ6D9Tk+YXljF2JXoFUKpzIMtMgm26Q4QuJGWHAEitkTCrxRuM8A1dAMhIXRJ8zhp9h3pgCpMM
	qZLJnnq5TrvYqfzn5TPYVTau2tloDOJ27fyU3s3OtF7KHgUu3r/tTSUEZKvelyajNMpiAcidh2P
	A6eFaBPWTZio570iVwilITG2Mlf/4GRFbMZvBr4D5CrW1K3H8I3ZF/xDktroNtJF3oJaLMKz3ZQ
	/ON/+JkIHIjUJJ7IRl/cGug==
X-Google-Smtp-Source: AGHT+IH/VOc25XUHr10SRommGFQojISW17HglCTiu+5J/J6v14RHdehkWdkfwlfxIxafCd4SDL64Tg==
X-Received: by 2002:a17:90b:3f4f:b0:31f:8723:d128 with SMTP id 98e67ed59e1d1-321d0ef197amr1237240a91.34.1755046254970;
        Tue, 12 Aug 2025 17:50:54 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::2adb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4289c5e123sm13875834a12.3.2025.08.12.17.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 17:50:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] oprofile: Adjust ptests for UNPACKDIR changes
Date: Tue, 12 Aug 2025 17:50:52 -0700
Message-ID: <20250813005052.150201-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Aug 2025 00:50:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118921

Location of S have moved under UNPACKDIR and this
needs to reflect in ptest install structure as some
of tests access the sourcedirs relative to itself
during run, these locations are built into tests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb b/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
index 45f70aa381..38bb957430 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
+++ b/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
@@ -59,18 +59,18 @@ do_install_ptest() {
 		find ${tooltest} -perm /u=x -type f| cpio -pvdu ${D}${PTEST_PATH}
 	done
 
-	install -d ${D}${PTEST_PATH}/../${BP}/events ${D}${PTEST_PATH}/../${BP}/libutil++/tests
+	install -d ${D}${PTEST_PATH}/../sources/${BP}/events ${D}${PTEST_PATH}/../sources/${BP}/libutil++/tests
 	# needed by libregex regex_test
 	cp libregex/stl.pat ${D}${PTEST_PATH}/libregex
 	cp libregex/tests/mangled-name ${D}${PTEST_PATH}/libregex/tests
 
 	# needed by litutil++ file_manip_tests
 	cp ${S}/libutil++/tests/file_manip_tests.cpp \
-		libutil++/tests/file_manip_tests.o ${D}${PTEST_PATH}/../${BP}/libutil++/tests
+		libutil++/tests/file_manip_tests.o ${D}${PTEST_PATH}/../sources/${BP}/libutil++/tests
 	cp ${S}/libutil++/tests/file_manip_tests.cpp \
 		libutil++/tests/file_manip_tests.o ${D}${PTEST_PATH}/libutil++/tests
 	# needed by some libop tests
-	cp -R --no-dereference --preserve=mode,links -v ${S}/events ${D}${PTEST_PATH}/../${BP}
+	cp -R --no-dereference --preserve=mode,links -v ${S}/events ${D}${PTEST_PATH}/../sources/${BP}
 }
 
 RDEPENDS:${PN} = "binutils-symlinks"
@@ -78,4 +78,4 @@ RDEPENDS:${PN} = "binutils-symlinks"
 FILES:${PN} = "${bindir} ${libdir}/${BPN}/lib*${SOLIBS} ${datadir}/${BPN}"
 FILES:${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/lib*.la"
 FILES:${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
-FILES:${PN}-ptest += "${libdir}/${BPN}/${BP}"
+FILES:${PN}-ptest += "${libdir} ${libdir}/${BPN}/sources"

