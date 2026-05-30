Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC83CD6E4A
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 06:27:39 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1723.1780122452794398913
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 May 2026 23:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m8VAn8TN;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7cfd0d8eb09so114659207b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2026 23:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780122452; x=1780727252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qNoEYbKgnKv73H7Da8rx5VV8dpON3iK7KVcumOHBCdE=;
        b=m8VAn8TNeDizPkqEum5/iMr10KBTIO/JVq9i98nnew6vg2dYLnTxEXXu0RNEBN5gm0
         knpA6JsgVoNb3wzYIRObQdiHUNPRYvvRqkTO3yq+8jHFOvHWcuNlKI+Q6+dbjM2Rvb3K
         lBfP2h6gmZlrBw/7SBlSTFkDjW3/6UVkpsQvllmFU7sXnm0REsolnphNjeQKEhaHTuAG
         U8t9E4mtIvoKkhNKTBMFBXKeFYMBSZ0He4Yrk+cNtUFExf/Ug4UCm05TY+tVQ54v3jmx
         j67o+k4fkBbGyGF55zqYp0CNU1K25N6jYS12fXCoyDoFtkclCyntSUYhP///a4Fx3piV
         i13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780122452; x=1780727252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNoEYbKgnKv73H7Da8rx5VV8dpON3iK7KVcumOHBCdE=;
        b=GV0bapk1jSxTgdjHWL7ic3TJ8OKlC4UYe+SWim6bpFAgYGWx91qKUZ1NFKaaOgUxkZ
         OHaG34nzt2qt/gVMXPyc/+TOcacbkWXFN1Hg1NZnT4+t/8IMdWM7ZkpLDorEsoEz74Zi
         Njqmsr5aWnC5LxngBKFm3R3/IZZCu04NuwaofpHoEVLp3u9bl07JPhX6z1S26kKfO7Se
         HXzhATjZlUpRO6n86TFvVzLxe3ZXcd/HbxquW3pff2GxMIAiEU1E0vWppLUvCR9lVDyy
         7aDbx09f7f74ENnImOle0HFWUeRW8AooqSyBYOSOub6zteKGBUBwdbxDAo/aLhQewpco
         XrOQ==
X-Gm-Message-State: AOJu0Yxxh8Iiel+xmHHOrThy/K9H7nvJpLOv4GcTEWMH33PJjYAPaDau
	VjX0KhJRG0Bb0KmXIffai1BuWQeaCCUK7Ylv852HryH6KcCZme+oXwHjpxdANRSL
X-Gm-Gg: Acq92OEUS48GGHOQXPNGlGB+3XXLSsr0EbOn91a7xS9dXeWo+Xwv1brUgEnRKxG4iTn
	H1qGw0/mcP5w3sUQRFuFaO/bBiX4rXSoVNL9IdjB47TkGegXWY9v1PmKCyOulCfk2fudTcSmJ6I
	ZhBX9b8sJ3eDBHzyVgnUkMulplhTdgUuJ6XM2KkxuCidsOLHuXS5JzLl4MOwwGsy3PB0DQyb43i
	SoQ6hURFAuMUDzxdMztZnfNIXPy9EQ85F1iB3XS3GzGCDyTPz55TXyRNukAW8OZ5TXwhbSODs/+
	sZuZkIWJ3rKLi0VnsDM3tya/n78XBHNOqHrdCiz/BJj5LNhTNOW68PwtGsan4yTkghSFkcligQO
	Al5Oxrysnmrl434ly/j8J802w5QYy5CCZpR5SVzot1NB9o131f81B0ojDZvTib9OIg1YyGrqkPl
	ImFozVHcGcK9h1LNvnptD+TA8qSuaAdt5gtAWpvYNa6inuBURRAKQBB8lVvliuHyCN2QbpXuUQQ
	eUklly0XkgvBJ+HvWELXOoBIuVeRCif0yb9Z1SXblGCVWFNqPlQ2mJhUF0J7mllIGbpHqDL
X-Received: by 2002:a05:690c:6a03:b0:7d1:d41a:5733 with SMTP id 00721157ae682-7e05d3f5903mr23972327b3.27.1780122451526;
        Fri, 29 May 2026 23:27:31 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7e175de2469sm2720707b3.2.2026.05.29.23.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 23:27:31 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH] Update README.md example with new branch name.
Date: Sat, 30 May 2026 02:25:43 -0400
Message-ID: <20260530062543.5477-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 May 2026 06:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127291

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-filesystems/README.md | 2 +-
 meta-gnome/README.md       | 2 +-
 meta-initramfs/README.md   | 2 +-
 meta-multimedia/README.md  | 2 +-
 meta-oe/README.md          | 2 +-
 meta-perl/README.md        | 2 +-
 meta-python/README.md      | 2 +-
 meta-webserver/README.md   | 2 +-
 meta-xfce/README.md        | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-filesystems/README.md b/meta-filesystems/README.md
index 78a4429ce2..0fec1ee2d2 100644
--- a/meta-filesystems/README.md
+++ b/meta-filesystems/README.md
@@ -30,7 +30,7 @@ When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix='meta-filesystems][PATCH'
+        --subject-prefix='meta-filesystems][wrynose][PATCH'
 
 
 Table of Contents
diff --git a/meta-gnome/README.md b/meta-gnome/README.md
index 6c23b4e671..579a4f11bb 100644
--- a/meta-gnome/README.md
+++ b/meta-gnome/README.md
@@ -11,6 +11,6 @@ branch: master
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
 
 When sending single patches, please use something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-gnome][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-gnome][wrynose][PATCH'
 
 Layer maintainer: Khem Raj <raj.khem@gmail.com>
diff --git a/meta-initramfs/README.md b/meta-initramfs/README.md
index e074142be7..eefaa9a387 100644
--- a/meta-initramfs/README.md
+++ b/meta-initramfs/README.md
@@ -22,7 +22,7 @@ Send patches / pull requests to openembedded-devel@lists.openembedded.org
 with '[meta-initramfs]' in the subject.
 
 When sending single patches, please use something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-initramfs][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-initramfs][wrynose][PATCH'
 
 Interim layer maintainer: Khem Raj <raj.khem@gmail.com>
 
diff --git a/meta-multimedia/README.md b/meta-multimedia/README.md
index bda470a6f6..f55d965787 100644
--- a/meta-multimedia/README.md
+++ b/meta-multimedia/README.md
@@ -10,7 +10,7 @@ branch: master
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject
 
 When sending single patches, please use something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-multimedia][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-multimedia][wrynose][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-openembedded to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like GitLab, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
diff --git a/meta-oe/README.md b/meta-oe/README.md
index da6c4cbe79..dee6fb4cd4 100644
--- a/meta-oe/README.md
+++ b/meta-oe/README.md
@@ -19,7 +19,7 @@ sudo apt-get install gcc-multilib linux-libc-dev:i386
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-oe][PATCH"'
+'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-oe][wrynose][PATCH"'
 
 You are encouraged to fork the mirror on GitHub https://github.com/openembedded/meta-openembedded
 to share your patches, this is preferred for patch sets consisting of more than one patch.
diff --git a/meta-perl/README.md b/meta-perl/README.md
index 9d56dbe8c6..3cf0bb7b9d 100644
--- a/meta-perl/README.md
+++ b/meta-perl/README.md
@@ -76,7 +76,7 @@ Send patches / pull requests to openembedded-devel@lists.openembedded.org with
 '[meta-perl]' in the subject.
 
 When sending single patches, please use something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-perl][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-perl][wrynose][PATCH'
 
 Layer maintainers:
     Hongxu Jia <hongxu.jia@windriver.com>
diff --git a/meta-python/README.md b/meta-python/README.md
index 36c193957c..33caca8a19 100644
--- a/meta-python/README.md
+++ b/meta-python/README.md
@@ -31,7 +31,7 @@ Send pull requests to openembedded-devel@lists.openembedded.org with
 '[meta-python]' in the subject.
 
 When sending single patches, please use something like:
-git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix='meta-python][PATCH'
+git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix='meta-python][wrynose][PATCH'
 
 Maintenance
 -------------------------
diff --git a/meta-webserver/README.md b/meta-webserver/README.md
index 17c7c76d94..35e04853de 100644
--- a/meta-webserver/README.md
+++ b/meta-webserver/README.md
@@ -54,7 +54,7 @@ with '[meta-webserver]' in the subject.
 
 When sending single patches, please use something like:
 ```
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-webserver][PATCH"
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-webserver][wrynose][PATCH"
 ```
 
 Layer maintainer: Derek Straka <derek@asterius.io>
diff --git a/meta-xfce/README.md b/meta-xfce/README.md
index 564590ff39..e7386b576b 100644
--- a/meta-xfce/README.md
+++ b/meta-xfce/README.md
@@ -16,7 +16,7 @@ BBMASK = "meta-xfce/recipes-multimedia"
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
 
 When sending single patches, please use something like:
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][wrynose][PATCH'
 
 Layer maintainer: Kai Kang <kai.kang@windriver.com>
 Layer maintainer: Khem Raj <raj.khem@gmail.com>
-- 
2.43.0


