Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A2D8CCD193
	for <webhook@archiver.kernel.org>; Sat, 18 Oct 2025 10:19:46 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.3243.1760782781499222691
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Oct 2025 03:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SuKgJLLV;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4711f3c386eso9297995e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Oct 2025 03:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760782780; x=1761387580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ACmTODlpM/dPOnY12neSw2ObeLIcMhIpX4/U60Jfsg=;
        b=SuKgJLLVM7+Ik9umyi4JBZHSzdgVWKoV3B6mTINndxHjtpkCpqEWYx+qw4pgVLSlOb
         PFgq8kzAH4vSMcLgURPtSeBfFuxg9PXwB76NQ+VCn+Jh+F8TcpZ8Zgl7GkqgZiLqB9Sb
         NPHk4NPcKik5Y7CDYMXBPhJY21sT3ZZScD+dY/274SuuVGL6ZAkc6AiS3M0djR41XVwe
         a+xSE6Fnlp9ReHksBRVjumadbbL5DoRjRn9zutZxM5SBe21RHsuVQQvb1Ena4W7mXuma
         dtRW7llsu/Rxaq8TkTemUO9pYV+zol5ybYRBvHkVuhA84aHHUDTfCXbyrgPDmXXNXves
         ay1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760782780; x=1761387580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ACmTODlpM/dPOnY12neSw2ObeLIcMhIpX4/U60Jfsg=;
        b=uuDshEw59DDf+5A3hjLr5T9zpk27/DA4K1FHpZEP6NvX9zyrVy5+6VAOLTBX3VvqmM
         AEdPoxvaftJfgjnspHIrsZzDgpi+JuIxn+h1TrAr+Nw0k2gVuEGiCD/HczxQ2vLyEmEc
         GImPUmHRJkaDJSBEtAxXnQCjR75EYgESHNpsQZU4l+gqvLsqqXM0DIHH44AVffQNkb1F
         YMw/oeUb+j/x2D3jpArcmUSmLuDCgTYoyCvjqfR3mwPS+zHPmku/yQY+AhjSvgI/ieZ6
         hmjuYJBBBcUUwrmCnthvzt7cyLf9Gt2Z3mAWyunjzewp4kVxRc1x27ZzbT3P3OH/iPAH
         nZcQ==
X-Gm-Message-State: AOJu0Ywci2m0mlvP/Iu1ZAWmnS6XfhDg/nXXZOaaq+4pyQFKoWdl8MgH
	jpoettj7DiM0FvyvaTevbmYuTRBXfs5CtsF7TY5k9g4nCw55TMztZFx0iScBwA==
X-Gm-Gg: ASbGncsohIH8CnNzUTAbONeNuNBiGMkYhzzUQAyWwoKjFsdyQASjKSMHsNJ5+zhvMWJ
	ArZxPsS9mxI7AQPP6+E8HSeQNQ4JcWY8UUmHF7Aw4Ox3aPQ2Lrk0aAqxr9q+u/hGkv+KX6tpiKG
	ypyMWv8eVs4tP6B5O/lGqEg9rmdzZz/9SUe0yUWvWJjaynCm6GifB3Lup5xilvgSTfpNGYtM/Wf
	FJSKpPOKdqO8HrylqWRU4FrhEc3gKHUNP+4IvqySnwOtsjqlSSL0KvUX7i3PbgGV8k75SDEnwp0
	5CDsb56QIiQFCcoPJ9izWX6QPbMCkch7KaYu9VUSWvkU2DIivLqfhucFgE4cNJxqczgAs0WvuuQ
	swro4scKlCOjGg3jJd0G2aYFDb/afU/63gGDLqCaBWRpHzOo5BdNvF5W9GdokjcN/yJlNDGoubA
	==
X-Google-Smtp-Source: AGHT+IGYKxX8xwKOruMUe8x/BKsfr5wKBk45/p4OzS7WDcyLFGw4Mzns9Op9qXKJMGhXOtvj51vsHw==
X-Received: by 2002:a05:600c:8b0c:b0:471:15df:9fcd with SMTP id 5b1f17b1804b1-47117911c51mr50040615e9.25.1760782779586;
        Sat, 18 Oct 2025 03:19:39 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471556e1892sm39125495e9.18.2025.10.18.03.19.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 03:19:38 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] oprofile: Fix failing ptests
Date: Sat, 18 Oct 2025 12:19:37 +0200
Message-ID: <20251018101937.3979005-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Oct 2025 10:19:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120783

From: Khem Raj <raj.khem@gmail.com>

Files need to be in right directory structure

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 51b38953a6e7f2769b5f4ac021f55299f3c68b99)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb b/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
index 23e7d3d5c3..fb10992890 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
+++ b/meta-oe/recipes-kernel/oprofile/oprofile_1.4.0.bb
@@ -56,16 +56,18 @@ do_install_ptest() {
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
@@ -73,3 +75,4 @@ RDEPENDS:${PN} = "binutils-symlinks"
 FILES:${PN} = "${bindir} ${libdir}/${BPN}/lib*${SOLIBS} ${datadir}/${BPN}"
 FILES:${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/lib*.la"
 FILES:${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
+FILES:${PN}-ptest += "${libdir}/${BPN}/${BP}"

