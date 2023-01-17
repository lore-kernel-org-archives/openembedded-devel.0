Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C77C6379F
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 05:22:52 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.190222.1673932963011407599
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 21:22:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HS4FwpPm;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id z9-20020a17090a468900b00226b6e7aeeaso33078834pjf.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Jan 2023 21:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HeCDoGrS50ppwj0lOfM49RP88eNimCKsDQGfGIl9xo=;
        b=HS4FwpPm7pQg9/Ld5rSFnotNDVW0iXpGjEkIYJoyYftqc1I1e4v0JCs2xIEDxtVtgR
         y8HPLOVWOo1ukDp+dQcdoNViFbjw+ThJhdi9sgZHLO0Np6dVrtWQqW/6yKww1PrHnngj
         thxi2C+8huQDaGNLUV56/M73P8cw5Sg7GLTWqs+vM1Hh/EzLEuHdxhCSBjpfmYlKHulG
         AqiKQEZ35qS7+EEEKRPPOMcdoD+MMXV9ndpSYUuLyaRxtZtBv0MTMbpcDXMWjQdVRocf
         s0MkQOURo3cftB5VRpjs6P5TvYOKyLRVoFo6OMETlVFYJ3X3qRqIJpR2Fu8u9iZhDI+F
         ldAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HeCDoGrS50ppwj0lOfM49RP88eNimCKsDQGfGIl9xo=;
        b=K/M7rYv62LFBhbqF66TwbZZGO1BM19u5pQGJuZjWySHxRL84IzAotweJOEEHYfw7w9
         UfL8g6dmSfLgB6bdJ2KOxO8dAMJ6pwldFySBllz//1X7i4pUCSG/P7PA83vC4FJwGbDS
         TARB/ijdI+owXkWj19DhGNy3Vj6BawOBofT8y6vycC6PCesqbsaCsSNdECAXdvB5Nzgz
         031xyDV+tDL7ePwXe7a/UE1LFNvFWB+J2R1/yuT1Zix2JbjAKy+w68DHQSJYvKFPqftl
         StOjjb5r8qsCrLSD+fvz2HdP3XRrLSLkZvHK5u1BGBpnrmhpksWCz6vwELZslJHN7ypM
         C4gA==
X-Gm-Message-State: AFqh2krKzxxW2DpL8y8eCqHG2jZKl5jk2FR6gZtvewVJsthhkXgPl168
	ddp9EwGq2Yo8vWeNNxACdOnSIAWmfKdpTw==
X-Google-Smtp-Source: AMrXdXs0F85kvZc9Cj2Gp99wtr9631j8eY4wg9SwiLd3dLSFD/cRWCv7fx6CQmOg/TtKAqIBL5IcoQ==
X-Received: by 2002:a05:6a20:a009:b0:b8:b0fe:cd40 with SMTP id p9-20020a056a20a00900b000b8b0fecd40mr2516485pzj.39.1673932962225;
        Mon, 16 Jan 2023 21:22:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id c22-20020a6566d6000000b0045dc85c4a5fsm12682692pgw.44.2023.01.16.21.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 21:22:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 4/7] fatcat: Fix build with std=c++17
Date: Mon, 16 Jan 2023 21:22:34 -0800
Message-Id: <20230117052237.3117521-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117052237.3117521-1-raj.khem@gmail.com>
References: <20230117052237.3117521-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 05:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100590

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Replace-std-ptr_fun-for-c-17.patch   | 48 +++++++++++++++++++
 .../recipes-utils/fatcat/fatcat_1.1.1.bb      |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/fatcat/fatcat/0001-Replace-std-ptr_fun-for-c-17.patch

diff --git a/meta-filesystems/recipes-utils/fatcat/fatcat/0001-Replace-std-ptr_fun-for-c-17.patch b/meta-filesystems/recipes-utils/fatcat/fatcat/0001-Replace-std-ptr_fun-for-c-17.patch
new file mode 100644
index 0000000000..277a368b67
--- /dev/null
+++ b/meta-filesystems/recipes-utils/fatcat/fatcat/0001-Replace-std-ptr_fun-for-c-17.patch
@@ -0,0 +1,48 @@
+From 455001cb0112f7324ab50f555aa5ed5eae1bb93b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 16 Jan 2023 19:23:18 -0800
+Subject: [PATCH] Replace std::ptr_fun for c++17
+
+std::ptr_fun was deprecated in C++11, and removed completely in C++17.
+Similarly, std::not1 is deprecated since C++17.
+
+Modern compilers like clang >= 16 have started to notice it
+
+src/FatUtils.h:41:46: error: use of undeclared identifier 'ptr_fun'
+|   s.erase(find_if(s.rbegin(), s.rend(), not1(ptr_fun<int, int>(isspace))).base(), s.end());
+
+Therefore replace ptr_fun with lambda
+
+Also use 'unsigned char' parameter to std::isspace, for reason see [1]
+
+[1] https://en.cppreference.com/w/cpp/string/byte/isspace#Notes
+
+Upstream-Status: Submitted [https://github.com/Gregwar/fatcat/pull/36]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/FatUtils.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/FatUtils.h b/src/FatUtils.h
+index 5080f2a..a8d69ee 100644
+--- a/src/FatUtils.h
++++ b/src/FatUtils.h
+@@ -32,13 +32,13 @@ using namespace std;
+ 
+ // trim from start
+ static inline string ltrim(string s) {
+-  s.erase(s.begin(), find_if(s.begin(), s.end(), not1(ptr_fun<int, int>(isspace))));
++  s.erase(s.begin(), find_if(s.begin(), s.end(), [](unsigned char c) {return !isspace(c);}));
+   return s;
+ }
+ 
+ // trim from end
+ static inline string rtrim(string s) {
+-  s.erase(find_if(s.rbegin(), s.rend(), not1(ptr_fun<int, int>(isspace))).base(), s.end());
++  s.erase(find_if(s.rbegin(), s.rend(), [](unsigned char c) {return !isspace(c);}).base(), s.end());
+   return s;
+ }
+ 
+-- 
+2.39.0
+
diff --git a/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb b/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
index 982a52d62f..214b3f914c 100644
--- a/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
+++ b/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=57fbbfebd0dd1d6ff21b8cecb552a03f"
 SRC_URI = "git://github.com/Gregwar/fatcat.git;branch=master;protocol=https \
            file://0001-Use-unistd.h-not-argp.h-for-all-POSIX-systems.patch \
            file://0002-Enable-64bit-off_t.patch \
+           file://0001-Replace-std-ptr_fun-for-c-17.patch \
            "
 
 SRCREV = "99cb99fc86eb1601ac7ae27f5bba23add04d2543"
-- 
2.39.0


