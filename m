Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.1305.1591500309508805436
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BHssL/8V;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id k7so493560pjj.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8t3QwiiIAzoVCaUza+40A4+xmzZyNF2Bt2KY0UVMdI4=;
        b=BHssL/8V+/ecJ1ksx2ZpHMe0P5T7fM8kY457w0sWzLgPdMPPSNz/RPBjDDCuSECjsv
         bnVwjTa9BOlDfzIinxjzCv4qUZqwyle+PysI6az08hXsv35pv1q0lzVd4kDjtvmnKGeT
         yyNvQzQMcVolODjR+IaBuJgtMwpCej0RS0kBpfMxRPGNUUhFqFeyBYkQnd/F+NhK2Jup
         mFHW+q6WyuGTGH/rSLiSKOOwiioBfXP2d/52kfHA08brH0974wB5vcfx/5EfYp1KUsCM
         napNsYyvhqEoxorYadj8s6QhRE0kWO+nVOwYThLG12jA0MJOrWA0O3QshiOPNpg5vpvG
         wGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8t3QwiiIAzoVCaUza+40A4+xmzZyNF2Bt2KY0UVMdI4=;
        b=tm2acEBSiI6SxC2J9b5Ep0rLkxSJ/q4YEqRq7lOE4I/s0VIS8LEphiLH44DRcwR+ha
         2lhdKccbN0tsly8rF5ZcfVyhV2htflaiSIrSujsc2BifF9dxeJOLwHOzUbWkKC7AqDJc
         9GqnusQX+4lr71Ldnm/Rg8HhLoXW7/dHHppFPKmzptmAFUky87F3boZYmlGpEAyxcNk1
         u/9Dd7YVJIRfMBTkLHf+wumUjC1bw3Rfr/OVRlPdYSKERnj9MFa0D6NSboVIFdesYQ4m
         zL/GP2mobxAxyN4sYfeb5wYIlaDnmz1Kb/YqxdRNkoUsjSk5RTWU96BJEouBvdSUxfyR
         9ruw==
X-Gm-Message-State: AOAM533F20B2rdYVZLhKcH164g9cTwBHY4Z/UMmsZ5xgRSXq9PkLnjnn
	Ed4NJe8MrVYEtifVexupcscFC2TP
X-Google-Smtp-Source: ABdhPJxG1ScIUMXCPjQXu8eijj4ghV3aHXOyt4Pt8cdHOgiequAmlV4y2QJ/iXfCuzkDvovGhVbJOg==
X-Received: by 2002:a17:902:be0e:: with SMTP id r14mr16379645pls.30.1591500308803;
        Sat, 06 Jun 2020 20:25:08 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.25.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:25:08 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 25/26] python3-pyelftools: moved to OE-Core, remove from meta-python
Date: Sat,  6 Jun 2020 20:24:35 -0700
Message-Id: <f93d9c9c32ac8253b6815752111ca992d0586457.1591500140.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7aee545a61c4f91d5e462d5b46b1b8f9a8bad1e3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python3-pyelftools_0.25.bb              | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb b/meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb
deleted file mode 100644
index 03d96db3c2..0000000000
--- a/meta-python/recipes-devtools/python/python3-pyelftools_0.25.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "pyelftools is a pure-Python library for parsing and analyzing ELF files and DWARF debugging information"
-HOMEPAGE = "https://github.com/eliben/pyelftools"
-SECTION = "devel/python"
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
-
-SRC_URI[md5sum] = "c5629b9a5d19c82107a946cce52eeec2"
-SRC_URI[sha256sum] = "89c6da6f56280c37a5ff33468591ba9a124e17d71fe42de971818cbff46c1b24"
-
-PYPI_PACKAGE = "pyelftools"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = "native"
-- 
2.17.1

