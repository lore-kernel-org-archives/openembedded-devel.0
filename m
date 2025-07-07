Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B38D0C83F0D
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 22:54:29 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.5808.1751928863885670721
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 15:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l7AUj+dx;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55628eaec6cso3367909e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 15:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751928862; x=1752533662; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BT2/xDP2FNRSYN2LyBNV/KTbt54DV3eRQH/LFnl1BzI=;
        b=l7AUj+dxFAZSM9tgOBqEUUrPfIBFAG/IL2n7sIi+V8Mc0sf+l/scysAKqGDDORVlts
         aZuW5y1+FZZ4UqG/F1eFZCvE99h9uJtjrlMfwgBLq3Gm7slo/xj8lFp/d1U2TEXGcd/V
         t2LWSJ7rKPcpO9KpNr/FAnLVA1KTwZF1p5ZcKu50MM+Bixuw8GwiTIKyc10uyFrOitCx
         qY7QVhUI8kvDO5Khva2685jEeGBw4ED/8FNhBMYphvnDb2goAtsOGaDHDQz7kYnEeuHH
         Qvchx+fCuOMZqBiQbi7LfVplgaSltL4MrjP4alKh6yHf6eiKg4nPKmq7war/jI7ER20c
         zdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751928862; x=1752533662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BT2/xDP2FNRSYN2LyBNV/KTbt54DV3eRQH/LFnl1BzI=;
        b=HuJUNHvbtJ6q9gJc7rjosS6sX0P2QcHPEgvYNrAz+U/9HCxnnN3Vfdym+SkL28ihfJ
         m684NmvJfy6VH/NUdekKzFjf1MptQUyiAN4rEACTSR+/ExCYrpOPug7SBG5AtjjCv5wI
         bYbLfDtiC7vK9mCWdscjrGu3z0OCQBp7sRkFYQgaaSIrQNsW0upoinGee7mgTUOllxi5
         sHmp4QqIRPSjHQ3buPRJvJ15aosfBBP4jkjAbqQpJq+uy5uBfoXZ+1A7H8OE4ZtMt8rk
         o4rYfDnilwSgiaOsBCvZ5a2AlapzTTAajnExxjUroFsCHygmoToTVRztD8+BU3P/Gq49
         H1Tg==
X-Gm-Message-State: AOJu0YyCP0LzIQdj18vKRxwzQI6bvZ2Kujda2efwd6bZZNEP+YZo6Ohe
	HXWSV8fZ7qGBLl4ToUcqhIK77JYMzZ85KwA7dGmRy/BGOO6eRdh2QmaTH6tC3g==
X-Gm-Gg: ASbGncviHnat+0w/yUsvI/VYP/4V+z8sL8oB/b0WaoSpjdY4b4sZyKwnbfoxYudB0wM
	oOluVrW0htUm2xezuwfy2bLFcSMJBVAxnlYYmv6MAw18Avqn1kPoX5BtBwNFUtcaoMzJy0rbwBE
	dmu69npqDG6G8ZDH1E9Aa2JENzzQw8ILfPeOn2QRZSpd7YouTBw5k5WMr0YlwAf2v2uqFdw7eb9
	dKSbyHsA2qUMbfFPUJoweV6I3ka3Uib3yrlFcKZaWS/xbJdJghTISCmMl9JH94ZAyJrtxNxyyyt
	3DqOzZtmh7picbPPfL7a2jN3gHHq2xfQJxwkRa3ButGrFj7fDgjxWk6XV/q/B/Z9JBseb56ekTK
	DjkE=
X-Google-Smtp-Source: AGHT+IFS4r4LA8kisNLaMQmQuV/VAnNi4juLB7VQ/oOy5OqdLpAc1Cw5uTKdhVSsxYw7rfafLRke0w==
X-Received: by 2002:a05:6512:b8f:b0:553:24b7:2f61 with SMTP id 2adb3069b0e04-557f8391e2emr198198e87.57.1751928861481;
        Mon, 07 Jul 2025 15:54:21 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384b836dsm1476347e87.197.2025.07.07.15.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 15:54:19 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 4/9] docopt.cpp: Add patch for CMake 4+ compatibility
Date: Tue,  8 Jul 2025 01:54:02 +0300
Message-ID: <20250707225407.1558421-4-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707225407.1558421-1-alperyasinak1@gmail.com>
References: <20250707225407.1558421-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 22:54:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118292

Fix:

| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../0001-allow-build-with-cmake-4.patch       | 40 +++++++++++++++++++
 .../docopt.cpp/docopt.cpp_git.bb              |  3 +-
 2 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/docopt.cpp/docopt.cpp/0001-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..1990325d92
--- /dev/null
+++ b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,40 @@
+From 60c7540d1633e1bf14f0858bba8a8ea313a55e7d Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Mon, 7 Jul 2025 21:03:52 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
+|   Compatibility with CMake < 3.5 has been removed from CMake.
+|
+|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+|   to tell CMake that the project requires at least <min> but has been updated
+|   to work with policies introduced by <max> or earlier.
+|
+|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+|
+|
+| -- Configuring incomplete, errors occurred!
+
+Upstream-Status: Submitted [https://github.com/docopt/docopt.cpp/pull/164]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index feff32e..2768144 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.1)
++cmake_minimum_required(VERSION 3.5)
+ project(docopt.cpp VERSION 0.6.2)
+ 
+ include(GNUInstallDirs)
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
index 71305cc35f..cc13fd1067 100644
--- a/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
+++ b/meta-oe/recipes-extended/docopt.cpp/docopt.cpp_git.bb
@@ -18,8 +18,7 @@ PV = "0.6.3+git"
 
 SRC_URI = "\
     git://github.com/docopt/docopt.cpp.git;protocol=https;branch=master \
-"
-
+    file://0001-allow-build-with-cmake-4.patch"
 
 inherit cmake
 
-- 
2.43.0


