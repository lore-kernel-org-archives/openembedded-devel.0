Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web09.5301.1626538106240448147
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jul 2021 09:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fsWQMAx5;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id y4so13390764pgl.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jul 2021 09:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D0Y0nWk0xx57N8z41EICMfHxnOttRcvE+wO9ksu41tI=;
        b=fsWQMAx5gMAr6AKgrNpeowE63dwcgJp48MSci9IPT0QMUNKFYuZro6IKvYywVrP7d1
         SkIcQj8ft1hr/+COgFwyl17yodDfhImdBoMwW5BQWAiyyzd5mgEXZi/jW6LO2QGioNvR
         7muiRm16q25furpoNaiIJ6LzkDnS20Mqnmk05nYWXXVdh4aSAmCI1ej9/cCwAjyMOroK
         uxA+0DFutEFtP10ztq+x2O5LxoAvtmp7im/rZWDA937UExJA2XyUDQUy+N5RRAmJEzIf
         EPlF+xJ7mmRPf0POSAW58dGLLwLs/OGZ98PhHCOZ6jOhPjk7/GUwe+j0Tt0pudD6Yqwz
         l9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D0Y0nWk0xx57N8z41EICMfHxnOttRcvE+wO9ksu41tI=;
        b=QqRUQEDS6OKzoTDFpSd97yi5hy0OLdkoXV0J8TDrkWixJipPc8zscIVFeU2TXMARtR
         4srDWwngXSR21bzM6D3P0nPVm1IUX7aiQBUlaczyeubXVR68ocWIOR7o2YdhKMcHy2GE
         SheMNQe2CW3V/ok+Ujc00BR+a+5/M4l+t/hUCI9DltAANd0Mx+j/X1xq6pZKjEOfwSJh
         WxGG0jHUBpTelf62h8THqwFYmu7fyjV5HrV/R6Ta1HDjl+570tV+hRJ9uE7nKo3mNq+P
         c39wHs0CFOPB3dYBIioeS8xhhUIRBcpf2U685JiP9U+TkIxACabrh5ybOZXxPz6k4+/I
         QoOQ==
X-Gm-Message-State: AOAM530AiwnxG9QHiv/nl8f9rnCL5OfzpZXwlL3H+K5qN37agEsf7mCV
	vo2G7KiIbEBPfCilOJduuYm5xQmBtY5qvA==
X-Google-Smtp-Source: ABdhPJzwHJgEi7eI52wsn1I0/pmQ6QEHW8/uIHsmTZ+tvvD+ef0pWvBKnV3Qisl1emXgJvlzcdZ97A==
X-Received: by 2002:a63:d648:: with SMTP id d8mr15401644pgj.280.1626538105370;
        Sat, 17 Jul 2021 09:08:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8300])
        by smtp.gmail.com with ESMTPSA id h24sm14595488pfn.180.2021.07.17.09.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 09:08:25 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] layers: Fix git send-email instructions in README
Date: Sat, 17 Jul 2021 09:08:23 -0700
Message-Id: <20210717160823.12894-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This ensures that cut-n-paste of this command from README will work

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/README     | 3 +--
 meta-initramfs/README       | 2 +-
 meta-multimedia/README      | 4 ++--
 meta-networking/MAINTAINERS | 2 +-
 meta-perl/README            | 3 +--
 meta-python/README          | 5 ++---
 meta-xfce/README            | 2 +-
 7 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/meta-filesystems/README b/meta-filesystems/README
index edcf8bfeef..78a4429ce2 100644
--- a/meta-filesystems/README
+++ b/meta-filesystems/README
@@ -30,7 +30,7 @@ When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix=meta-filesystems][PATCH
+        --subject-prefix='meta-filesystems][PATCH'
 
 
 Table of Contents
@@ -99,4 +99,3 @@ II. Misc
 
   --- xfsprogs ---
   It provides XFS filesystem utilities.
-
diff --git a/meta-initramfs/README b/meta-initramfs/README
index 79244d43f0..a8f17ba859 100644
--- a/meta-initramfs/README
+++ b/meta-initramfs/README
@@ -23,7 +23,7 @@ Send patches / pull requests to openembedded-devel@lists.openembedded.org
 with '[meta-initramfs]' in the subject.
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-initramfs][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-initramfs][PATCH'
 
 Interm layer maintainer: Khem Raj <raj.khem@gmail.com>
 
diff --git a/meta-multimedia/README b/meta-multimedia/README
index b4c2455a11..9c649ff87c 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -9,10 +9,10 @@ layers: meta-oe
 branch: master
 revision: HEAD
 
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-multimedia]' in the subject
 
 When sending single patches, please use something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][PATCH
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-multimedia][PATCH'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-openembedded to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like GitLab, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
index 5c4c4ce052..77e90668c4 100644
--- a/meta-networking/MAINTAINERS
+++ b/meta-networking/MAINTAINERS
@@ -8,7 +8,7 @@ When sending single patches, please use something like:
 
    git send-email -1 -M \
         --to openembedded-devel@lists.openembedded.org \
-        --subject-prefix=meta-networking][PATCH
+        --subject-prefix='meta-networking][PATCH'
 
 You may also contact the maintainers directly.
 
diff --git a/meta-perl/README b/meta-perl/README
index 67f291079f..2419ae2281 100644
--- a/meta-perl/README
+++ b/meta-perl/README
@@ -78,7 +78,7 @@ Send patches / pull requests to openembedded-devel@lists.openembedded.org with
 '[meta-perl]' in the subject.
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-perl][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-perl][PATCH'
 
 Layer maintainers:
     Hongxu Jia <hongxu.jia@windriver.com>
@@ -90,4 +90,3 @@ License
 All metadata is MIT licensed unless otherwise stated. Source code included
 in tree for individual recipes is under the LICENSE stated in each recipe
 (.bb file) unless otherwise stated.
-
diff --git a/meta-python/README b/meta-python/README
index ca0a290d9f..df6abe0e2e 100644
--- a/meta-python/README
+++ b/meta-python/README
@@ -37,8 +37,8 @@ before posting.
 Send pull requests to openembedded-devel@lists.openembedded.org with
 '[meta-python]' in the subject.
 
-When sending single patches, please use something like: 
-'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-python][PATCH'
+When sending single patches, please use something like:
+git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix='meta-python][PATCH'
 
 Maintenance
 -------------------------
@@ -47,4 +47,3 @@ Layer Maintainers:
         Tim "moto-timo" Orling <TicoTimo@gmail.com>
         Derek Straka <derek@asterius.io>
         Trevor Gamblin <trevor.gamblin@windriver.com>
-
diff --git a/meta-xfce/README b/meta-xfce/README
index 70ad47a2d1..bbf4b2edf2 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -17,6 +17,6 @@ BBMASK = "meta-xfce/recipes-multimedia"
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-xfce]' in the subject'
 
 When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-xfce][PATCH'
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix='meta-xfce][PATCH'
 
 Layer maintainer: Kai Kang <kai.kang@windriver.com>
-- 
2.32.0

