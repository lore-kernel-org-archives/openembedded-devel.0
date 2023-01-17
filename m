Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B72C678D4
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 05:22:52 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.189984.1673932964967845652
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 21:22:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A8ETshH6;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id g23so16821410plq.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Jan 2023 21:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6aewbRUKvoj5ow6tq/OHmCpwd0LOwcIVBFRmWjbfpo=;
        b=A8ETshH6H/twNrPKENV92MRPgLYj4RRHdCVtbRYASp3+6+OSxljRa0KmEJZdEf0r9c
         OmyC8fHi4f/FyFCnkXfC9ZXGL09fGMpyB/P7FUgfB91mZw3fAaGYZbuBDbzwbIecn9jT
         NvKyw1JYgsPj2qZg32wDaA1Q+84KgiHnAIr1KYgLtPyvqvF4VKAJHJfoTDu6a5SGHnNf
         juAlUgTexw98GALvnt659jBLA9pXYU6FL6DHaZcGifYxwmSJV+edRkZB6KnrjWbMATFZ
         XOfRoYa9tKg7Nsmq6SNooxznMQdvsAdwXHJ94KUEW/B6bg4b/XjeKUnwjf2E3fPTdtgU
         qOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6aewbRUKvoj5ow6tq/OHmCpwd0LOwcIVBFRmWjbfpo=;
        b=QaAFfzUmuGvs4AGqPzjTA7KlBXxr8mhfghBkDFcf47rk64Buk+bBn9tViMeT16g++4
         plqMtEn8UzaS0Wo2lq01ix4QOgN44ZA9x3ZFTUZT+DbbTOIgja2Q0+HM0gR5vWkPU+Y7
         4leSaHbNwciRXDo+cEP77/5st5cacq/cscN3Z2hpoSKS8K1p+glNsFE3cnpnN9bk+xaD
         UnCYYaxVH8IBn/haaMyh+0C81WruNtIpBK/rEZxkDfHUYiaRCFsH6n19r8WWXdn0C7Dq
         Ri5fKPszUDm8bVds215Ow9K87H1NOIG7OU3+ZwlTB3WUzKHmThoBpnMLCyYUJU8/rYER
         S90A==
X-Gm-Message-State: AFqh2kq2JmmVZYiQYOWlBU3PBj+5ws+4C29mmd98yM+iJtVwN8cEbd4P
	S2jLwXj+rY7dydZBc0GxGN0jzslELFxeaw==
X-Google-Smtp-Source: AMrXdXvLKG3KUlDQUtCPgH4EhjTzIeGtu53FkH4twc5DazAmB/P9Nkw1FMqNKvBl8eTOUZoDLG/Jiw==
X-Received: by 2002:a05:6a20:3b05:b0:b0:1e9b:e932 with SMTP id c5-20020a056a203b0500b000b01e9be932mr1682716pzh.40.1673932964071;
        Mon, 16 Jan 2023 21:22:44 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id c22-20020a6566d6000000b0045dc85c4a5fsm12682692pgw.44.2023.01.16.21.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 21:22:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 6/7] python3-matplotlib: Upgrade to 3.6.3
Date: Mon, 16 Jan 2023 21:22:36 -0800
Message-Id: <20230117052237.3117521-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117052237.3117521-1-raj.khem@gmail.com>
References: <20230117052237.3117521-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 05:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100592

Forward port the disable download patch
Location of license changed inside setup.py

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../matplotlib-disable-download.patch         | 26 ++++++++++++++-----
 ...b_3.5.3.bb => python3-matplotlib_3.6.3.bb} |  4 +--
 2 files changed, 22 insertions(+), 8 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib_3.5.3.bb => python3-matplotlib_3.6.3.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch b/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch
index 25c49afb97..899cac624a 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch
+++ b/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch
@@ -6,18 +6,32 @@ Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
 
 --- a/setup.py
 +++ b/setup.py
-@@ -316,8 +316,6 @@ setup(  # Finally, pass this all along t
+@@ -303,7 +303,6 @@ setup(  # Finally, pass this all along t
      setup_requires=[
          "certifi>=2020.06.20",
-         "numpy>=1.17",
--        "setuptools_scm>=4,<7",
--        "setuptools_scm_git_archive",
+         "numpy>=1.19",
+-        "setuptools_scm>=7",
      ],
      install_requires=[
-         "cycler>=0.10",
+         "contourpy>=1.0.1",
+@@ -315,13 +314,7 @@ setup(  # Finally, pass this all along t
+         "pillow>=6.2.0",
+         "pyparsing>=2.2.1",
+         "python-dateutil>=2.7",
+-    ] + (
+-        # Installing from a git checkout that is not producing a wheel.
+-        ["setuptools_scm>=7"] if (
+-            Path(__file__).with_name(".git").exists() and
+-            os.environ.get("CIBUILDWHEEL", "0") != "1"
+-        ) else []
+-    ),
++    ],
+     use_scm_version={
+         "version_scheme": "release-branch-semver",
+         "local_scheme": "node-and-date",
 --- a/setupext.py
 +++ b/setupext.py
-@@ -64,40 +64,7 @@ def get_from_cache_or_download(url, sha)
+@@ -65,40 +65,7 @@ def get_from_cache_or_download(url, sha)
      BytesIO
          The file loaded into memory.
      """
diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.5.3.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.6.3.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-matplotlib_3.5.3.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib_3.6.3.bb
index 1a0b93b030..809f9425ba 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.6.3.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/matplotlib/matplotlib"
 SECTION = "devel/python"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "\
-    file://setup.py;beginline=296;endline=296;md5=20e7ab4d2b2b1395a0e4ab800181eb96 \
+    file://setup.py;beginline=283;endline=283;md5=20e7ab4d2b2b1395a0e4ab800181eb96 \
     file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74 \
 "
 
@@ -21,7 +21,7 @@ DEPENDS = "\
     python3-certifi-native \
     python3-setuptools-scm-native \
 "
-SRC_URI[sha256sum] = "339cac48b80ddbc8bfd05daae0a3a73414651a8596904c2a881cfd1edb65f26c"
+SRC_URI[sha256sum] = "1f4d69707b1677560cd952544ee4962f68ff07952fb9069ff8c12b56353cb8c9"
 
 inherit pypi setuptools3 pkgconfig
 
-- 
2.39.0


