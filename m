Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159FAC4450A
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 00:45:16 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1184.1783903506603155861
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2026 17:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LStCrt0i;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ceaf8a1265so11147995ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2026 17:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783903506; x=1784508306; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RqDlz71qpE+slElTV3MrZL/xXWa7hAfkYpJMlMUW7YE=;
        b=LStCrt0izHuIkp/a45vl2PwCvsLqtKemm+U5rAuhrgE+s1fsAIWsx+7zuVvAPyxEFu
         FXbluVQlPXCLbqKo/135xPKdOfwntBy7iNwK6dHKxdpplhAFN+k5PFcW6ms22Eihj2Q1
         DpU40Mdnt17ToFx/MEFJmwqlzf1UzKX0lpHaUTLqNiZODiRDxKZlnwhNfVoQV4kLVhSI
         wnXZjZhFCvJ05NXXKELDf4bWPfUZwTVc00D35HS3hmQHPP0RdFf6U6N0LHPop5iu4zwA
         yWZIGTV+syKZ+6sYNJwDgk6Y5Fk6nxjZugabRomuBHe0UlvyaUCv5b/AeZt0comCfWQe
         bd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783903506; x=1784508306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqDlz71qpE+slElTV3MrZL/xXWa7hAfkYpJMlMUW7YE=;
        b=Zk/n8DA281ycBiujkH5nA3uIxLWpY5lPxuiQ4pHknqTGwvO4fDDherhoS4okTQ1kzr
         bsytq4oLWTF5j0pjIqICZVgHJXrceutC/RAd+F/85daZh0UuHzl/CrJQC6rZ1dAeEOF3
         FoFtj1Aj3jbhUmyTyWekH1rGANtPRa6PThscFM0pnYOYvCjs8ONZCnhpMAjQeGPeV7Zx
         iggexWtUPBuAI/u1c2L06UgkKOWpLTGFAqQnPz0PvV0i3Zx5jNJ02LBaBEKTTTq4ttP7
         n9cKysU0G9UsF3twFOneTqtT9ak6eRTZv4Cn9U49f9DrUVvmzoqDe54bsushXF5Uu7cZ
         FccA==
X-Gm-Message-State: AOJu0Yxa20kq6XEV7uXA9NBvCV8/qnBp8ppZwTAcs8PClWJI9mtIu4p5
	N3pPWWjnGUDnQtC/sejo1s7/t8M7nAKmQggCoqdSnoX1NcCEJWguy4dK29f+D5b107w=
X-Gm-Gg: AfdE7clWgpeqk4JU1IS+poN488YFPTf5eWloyaI2mHTcj1hev9e8HqBwrhkQ6VP7a83
	YNyU8m1SLNI2mNMXIRaf6nPE/QnfORULkt694D5qLI6uqTrZleA/jj9K7Kv4C7mamCyA+ES57OZ
	ms35my38I63YaWvE7LhIP5b1IO30fGIyNky2kZxP8nMUU8zEBQgx5Sw1ubRZDFkd2Jw1MFUlU9J
	hVZ4loJ8S6VFvV6NrI/caGKx/WZI8KqWZEjxZ4bWysttOsSIBsdZhq6YelaI3VTUoMhEx0sBuKj
	VJ3TfzFus2nFOEW5dBhtWK68LPmU+CMWlQl4LlyFtJjQNsPI/u6bCUgvApNBoGItcpJVw1Oxt7r
	XF6SS07E+2DRmGC+onBUvF/9ohZ8IWZfYK3oDyDuMnMwnTvfmp4MQUgEide5rGmPNVMe7V0Inna
	LAvYa5JwQkLiOn9UQqR/pLrJnUr8h8hwnl3dufsjuszHcnbLhqZDOOt+wmh2xP+vgLD3zSNKS09
	6D5Jkq+tiezAU40srxG0+lduRUDM7JGa/msI3duJQbMyMW91Hh3oSLryck1UzVH5aTK7I4gNchk
	buyHuc1if0Cs29Y9KchhpUKGW7I7Gg==
X-Received: by 2002:a17:903:46cb:b0:2c7:faae:ab15 with SMTP id d9443c01a7336-2ce9e7adb67mr78617265ad.10.1783903505909;
        Sun, 12 Jul 2026 17:45:05 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm71206990c88.7.2026.07.12.17.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 17:45:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 1/8] python3-dbus-deviation: Drop all setup_requires to fix build failure
Date: Sun, 12 Jul 2026 17:44:55 -0700
Message-ID: <20260713004502.716970-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 00:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128143

do_compile failed with:

  AttributeError: 'NoneType' object has no attribute 'lower'

A non-empty setup_requires makes setuptools run fetch_build_eggs(),
which enumerates every distribution in the native sysroot and calls
packaging.utils.canonicalize_name(dist.name). Under the setuptools/
Python 3.14 in the sysroot one distribution exposes a None name, so
canonicalize_name() crashes on None.lower() and aborts the build.

Extend the existing patch to drop the whole setup_requires block
instead of only setuptools_git. sphinx is only used by the build_sphinx
command (not run during do_compile) and is already provided via
DEPENDS, so removing it is safe and keeps setuptools out of the
fetch_build_eggs() path.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...o-donwload-requierment-which-will-ca.patch | 25 +++++++++++++------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-deviation/0001-Prevent-trying-to-donwload-requierment-which-will-ca.patch b/meta-python/recipes-devtools/python/python3-dbus-deviation/0001-Prevent-trying-to-donwload-requierment-which-will-ca.patch
index b163db772c..7acb4493c8 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-deviation/0001-Prevent-trying-to-donwload-requierment-which-will-ca.patch
+++ b/meta-python/recipes-devtools/python/python3-dbus-deviation/0001-Prevent-trying-to-donwload-requierment-which-will-ca.patch
@@ -3,25 +3,34 @@ Subject: [PATCH] Prevent trying to donwload requierment which will cause

 'NewConnectionError('<pip._vendor.urllib3.connection.HTTPSConnection object at 0x7f1e83062ad0>: Failed to establish a new connection: [Errno -3] Temporary failure in name resolution')': /simple/setuptools-git/

+Dropping all setup_requires entries also avoids setuptools'
+fetch_build_eggs() code path, which enumerates every installed
+distribution in the native sysroot and crashes with
+"AttributeError: 'NoneType' object has no attribute 'lower'" when one of
+them exposes a None name under newer setuptools/Python. sphinx is only
+needed for the build_sphinx command (not run during do_compile) and is
+provided via DEPENDS, so it is safe to remove here.
+
 Upstream-Status: Inappropriate [oe specific]

-Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
 ---
- setup.py | 1 -
- 1 file changed, 1 deletion(-)
+ setup.py | 4 ----
+ 1 file changed, 4 deletions(-)

 diff --git a/setup.py b/setup.py
 index 245193f..d899e4c 100755
 --- a/setup.py
 +++ b/setup.py
-@@ -92,7 +92,6 @@ setuptools.setup(
+@@ -92,8 +92,4 @@ setuptools.setup(
      exclude_package_data={'': ['.gitignore']},
      zip_safe=True,
-     setup_requires=[
+-    setup_requires=[
 -        'setuptools_git >= 0.3',
-         'sphinx',
-     ],
+-        'sphinx',
+-    ],
      install_requires=['lxml'],
---
+     tests_require=[],
+--
 2.43.0


