Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web08.273.1617899824188472581
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nCtzLreG;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id n140so2774906oig.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Oemz0dWm6afot8t+qz51p8gRE1sWG6ba4qVIO6Z3UVs=;
        b=nCtzLreGEpcOotP8Yhg6YubpO6yebCZ3Gy3OopbBqQHFunilIc/jDkkN1/dyRNSw78
         jop/5L6G0bbu7YqyZnjaWXhviYQ75DHuq9/HSReI1grD5zCaw6+iFmzJ/oKsqA5AOPEn
         AcSYQKQdqndkJOszawp8ZN62JtYi5oVo7aK4VIFDp5oalIKUgTaIIv8xeKJ8ziP4QCi8
         xAVchecIq/H0Ry9I+5O7xQrFZ1XNKa69kncxcw5x+EZG81ndeYKv/lgtTE3EpBDtmCUK
         En1gQsAiF4rHYvV/uq0GIq8x99MQgMwDUhc/RCTHwbk29FUzqIDxzmCXjCidYI9xfZ1d
         dTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Oemz0dWm6afot8t+qz51p8gRE1sWG6ba4qVIO6Z3UVs=;
        b=O9+wky7GQ53jrtgZuDMCF1fHL9IEvCC9AgFRBLND7hiSHup8Y3DT3NXV2g4jG4AHGF
         4wSGmXTAKMGHpeUQlhz0FAKs6yjGY4DIBY1wmS4mRjfj9H4IgvkPfIwNJprvJnWNIX7i
         OM0ZWuFwtE5yTRgBPfNd/X3YjP4pN6//VwrJGH7RBCfTmhVyX1+rOxtfNLDHqYH8HNOA
         Gcu/zI34udaHH1lZK3kBEt1SmsP3cO+TC4U1HpUgrsBTkF+FYmRCM/W22M+vUkuTHcpw
         7GPYq9i7LE2Iwj0EaWCTQ1aGH5rNsqGH/WdmepPaJmB0w7hG+Qkmjao0ycozRRs87w6u
         oIeQ==
X-Gm-Message-State: AOAM530O9c0k88P7yhgDV6MXra1cidxmvYbXlFlcqCpEExsxHlWHVk+a
	+Vjgbx1J0aKiFnAiDNqcT2115hQfiBI=
X-Google-Smtp-Source: ABdhPJyMaBFbm97EQKnJ7r0e3bM/pDeO6awTqwOUTaGt3WdHl4hIBF/10x5rj/7Jnjz2Wj/fw2IXTg==
X-Received: by 2002:aca:da04:: with SMTP id r4mr6805089oig.123.1617899823330;
        Thu, 08 Apr 2021 09:37:03 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.37.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:37:02 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 54/64] phonet-utils: remove
Date: Thu,  8 Apr 2021 09:36:01 -0700
Message-Id: <f679287bbf93540e4bef978c9fedd52978357978.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* no update other than occassional build fix since 2011 when I've imported this
* it's also failing with usrmerge:
  ERROR: phonet-utils-0.0.0+gitrAUTOINC+4acfa720fd-r2 do_package_qa: QA Issue: phonet-utils package is not obeying usrmerge distro feature. /lib should be relocated to /usr. [usrmerge]
  ERROR: phonet-utils-0.0.0+gitrAUTOINC+4acfa720fd-r2 do_package_qa: QA run found fatal errors. Please consider fixing them.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 976c8d3f69c847aee33bc53663dcc2fdca7fb556)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-Include-limits.h-for-PATH_MAX.patch  | 25 -------------------
 .../phonet-utils/phonet-utils_git.bb          | 15 -----------
 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 3 files changed, 41 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/phonet-utils/phonet-utils/0001-Include-limits.h-for-PATH_MAX.patch
 delete mode 100644 meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb

diff --git a/meta-oe/recipes-connectivity/phonet-utils/phonet-utils/0001-Include-limits.h-for-PATH_MAX.patch b/meta-oe/recipes-connectivity/phonet-utils/phonet-utils/0001-Include-limits.h-for-PATH_MAX.patch
deleted file mode 100644
index 8bb7e5a1887..00000000000
--- a/meta-oe/recipes-connectivity/phonet-utils/phonet-utils/0001-Include-limits.h-for-PATH_MAX.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From f7ad9a4471cee2324f216a0d82ba8097ec746c56 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 15 Jul 2017 11:48:12 -0700
-Subject: [PATCH] Include limits.h for PATH_MAX
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/pnstat.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/pnstat.c b/src/pnstat.c
-index 661a5bc..76068e6 100644
---- a/src/pnstat.c
-+++ b/src/pnstat.c
-@@ -35,6 +35,7 @@
- #include <dirent.h>
- #include <unistd.h>
- #include <netinet/tcp.h>
-+#include <limits.h>
- 
- struct fd
- {
--- 
-2.13.3
-
diff --git a/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb b/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
deleted file mode 100644
index 3c599950fe8..00000000000
--- a/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "This small package provides a few command line tools for Linux Phonet"
-HOMEPAGE = ""
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-SRC_URI = "git://gitorious.org/meego-cellular/phonet-utils.git;branch=master \
-           file://0001-Include-limits.h-for-PATH_MAX.patch \
-           "
-PR = "r2"
-S = "${WORKDIR}/git"
-SRCREV = "4acfa720fd37d178a048fc2be17180137d4a70ea"
-PV = "0.0.0+gitr${SRCPV}"
-
-inherit autotools-brokensep
-
-FILES_${PN} += "${base_libdir}/udev/rules.d/85-phonet-utils.rules"
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 2958eac6a0f..d5e5aa01cd6 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -146,7 +146,6 @@ RDEPENDS_packagegroup-meta-oe-connectivity ="\
     obexftp \
     packagegroup-tools-bluetooth \
     paho-mqtt-c \
-    phonet-utils \
     rabbitmq-c \
     rfkill \
     rtorrent \
-- 
2.17.1

