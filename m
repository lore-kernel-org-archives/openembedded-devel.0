Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.868.1616533953715629544
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Mar 2021 14:12:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KJNf615v;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so81108pjg.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Mar 2021 14:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kyGyuMNOnM3i8egNST6Vf43mX8Pm6RZq7Qp6hWOif6g=;
        b=KJNf615vttVfIy7LQIe/Y8rVtoHGT6yfCf4rkE2bu9bYNwNZmRlOHjiPtOUCAJ5c5L
         Nt12KIE3N0fqGbikkWBqAhPbg6AeZsaeSxLB76TnOG5EOMjzR07lS8aYT4jTfcx90sRN
         fQFHoITj5rmB9mMQUvvSGD7N94pV6ueWvyVHoUtRQ6l4af4tP40vArS0gfRBwM/yq8K4
         DuiXhlKndlDcLfgwOvn3ryLaZHOkXEqgOdLJSf59rfMwe8A3JKJMmQlW+k1Abw5mkrU4
         rMtzucauwpw0y4DKgHpr2nXqdJFX5uu9ejpSGEkYAXmHzkzNCjEsxfJALqCfXBSBkgoe
         RiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kyGyuMNOnM3i8egNST6Vf43mX8Pm6RZq7Qp6hWOif6g=;
        b=ICx/f0xas9czJih3zg2LoXqqaKBfgDZdGgFwZjz6SuBQ6l5n3cvKnhjfS+7kB3p6mZ
         45rgB3svb7mdTqhZPTDYqjkN3trGZfO33F4zP3d6A0aosuFZOqaLFCvOEiNse2CyCREv
         Xekf9Gki0H5FGxV3EoHr1nT/CoBgswKKEbBUrEqRayWhLLPiqoB6+6tPaWx/jukiBqAI
         mVSVUb3zw+rUg+L8SwcBmO+DaZmr62Wn8FfVPbFIyJubUMXEYFfvbgotOiM4gvr1wN5F
         ThcSxS2+pw9OYnhWjzcy77epJNyDpv8Ec3ltTC0+sl1ysff4/JpObgZdQDX2CASd9SuB
         oi9Q==
X-Gm-Message-State: AOAM533Sy6mVmR5aeh9WPX07UBFtXClw0p/gYTQx/CdDHlvlUkwewk35
	7s0GA5HfmfplmY7KG8lpa0FU5mWNS4UtPQ==
X-Google-Smtp-Source: ABdhPJzxofXIEAKpertig9fbiCBDwV/9HY/S44jTZAsMLbURnfssgbQjannr4RA/OwQLEi8yqBCGYA==
X-Received: by 2002:a17:90a:4d81:: with SMTP id m1mr52800pjh.143.1616533952883;
        Tue, 23 Mar 2021 14:12:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::4578])
        by smtp.gmail.com with ESMTPSA id i13sm128228pgi.3.2021.03.23.14.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 14:12:32 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peace Lee <iipeace5@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] guider: Upgrade 3.9.7 -> 3.9.8
Date: Tue, 23 Mar 2021 14:12:30 -0700
Message-Id: <20210323211230.1639990-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peace Lee <iipeace5@gmail.com>

Upgrade to release 3.9.8

Signed-off-by: Peace Lee <iipeace5@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../guider/{guider_3.9.7.bb => guider_3.9.8.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/guider/{guider_3.9.7.bb => guider_3.9.8.bb} (78%)

diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.7.bb b/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
similarity index 78%
rename from meta-oe/recipes-devtools/guider/guider_3.9.7.bb
rename to meta-oe/recipes-devtools/guider/guider_3.9.8.bb
index 88fad936ba..91693d8626 100644
--- a/meta-oe/recipes-devtools/guider/guider_3.9.7.bb
+++ b/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
@@ -1,4 +1,4 @@
-SUMMARY = "runtime performance analyzer"
+SUMMARY = "performance analyzer"
 HOMEPAGE = "https://github.com/iipeace/guider"
 BUGTRACKER = "https://github.com/iipeace/guider/issues"
 AUTHOR = "Peace Lee <ipeace5@gmail.com>"
@@ -6,10 +6,10 @@ AUTHOR = "Peace Lee <ipeace5@gmail.com>"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
 
-PV = "3.9.7+git${SRCPV}"
+PV = "3.9.8+git${SRCPV}"
 
 SRC_URI = "git://github.com/iipeace/${BPN}"
-SRCREV = "459b5189a46023fc98e19888b196bdc2674022fd"
+SRCREV = "f2e6d84ffa341728daf0cc2ba2736d58008ea9f1"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.0

