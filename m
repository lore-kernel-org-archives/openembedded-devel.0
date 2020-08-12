Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.290.1597264893942156922
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 13:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bkgfbgbj;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id o13so1650299pgf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 13:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gMvG0KghXK8AvLDx0I62YTjau+6XEVjYkIke90h1BJY=;
        b=BkgfbgbjFkRgVtxcuky5bkc583bdPZtpBBlm7l/NsZe4n9kmLp/CV0ztBhXq3Oj2Ik
         p6Mz+L6G6FD7P8fZG9WMtkJHszEkcBaBO+MGFYWyJVtAb81bAkbnWY8VsvURr3V9iNx3
         VF6pGmwqjtj62TiemryOMjh+ICD7Mn86VZS5FJWOY4vQgkF2WKK++lfNVE6OAdGl2yP0
         DiRckVycGBXUmNtG1wRSILCb54K5xuTeAkQGiLUgf4F8fhaG+YTUF1lhyC+FGr23W3jT
         a4suHMB4UOpyi57gNVhMPjchHLkKkkKO68VCN9t4cRmpej+Vj5A4hROp5PEV2Z9NcsnX
         cLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gMvG0KghXK8AvLDx0I62YTjau+6XEVjYkIke90h1BJY=;
        b=KkLk/7JYWBatsnoFFRltFn2J6mVq1EtWL9W40gLFZAlaMjZv7iw5C/Ggj7UUUwKupu
         5s5w4O9xEaLj8KOQAzA+oPwLHf/xltsxGzYbP9suoYFbhrSIX4FFVzSqx8omZ2BYIRJV
         wXgQRdqe45PreCC5XLlCsFI+8Q1ZThL1qMCNo9ntp0qqtj2RLaczQWmbncWgRbiwVMOd
         dEkL4hhNP9sjPc/i8xC6a8LchUCpZbqhlcMZPUdvkKApcZOEztH9sZvmj5Srpnp5tVt/
         bZ+5mFT72KbdPTDIgMRlG1WF3GKrjMfWWMUYfb4x5FH+ysXKsUznSmZhZT7Deydq07gw
         Vv/A==
X-Gm-Message-State: AOAM532iWcy3sk+76CxSWlWyLJJDjYylEJuEeOANzboiWNbSFfy4G7EY
	U515eQggxKpk62LNYQ7/xJyZ3scE7TU=
X-Google-Smtp-Source: ABdhPJzA91C0Y7y3Pl0Kz8DtW2fSsWq81hS0HENXUPeu+LlGjsEtlRHaoKPUtOeLXouyytccIz7CwQ==
X-Received: by 2002:a62:ee06:: with SMTP id e6mr1170898pfi.313.1597264892790;
        Wed, 12 Aug 2020 13:41:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id l22sm2984287pjy.31.2020.08.12.13.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 13:41:32 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 01/18] htop: Fix build with -fno-common
Date: Wed, 12 Aug 2020 13:41:13 -0700
Message-Id: <20200812204130.1012160-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../htop/files/htop-gcc10.patch               | 31 +++++++++++++++++++
 meta-oe/recipes-support/htop/htop_2.2.0.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/htop/files/htop-gcc10.patch

diff --git a/meta-oe/recipes-support/htop/files/htop-gcc10.patch b/meta-oe/recipes-support/htop/files/htop-gcc10.patch
new file mode 100644
index 0000000000..5be06277d7
--- /dev/null
+++ b/meta-oe/recipes-support/htop/files/htop-gcc10.patch
@@ -0,0 +1,31 @@
+Fix build with -fno-common
+
+Upstream-Staus: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/CRT.h
++++ b/CRT.h
+@@ -140,7 +140,7 @@ extern const char **CRT_treeStr;
+ 
+ extern int CRT_delay;
+ 
+-int* CRT_colors;
++extern int* CRT_colors;
+ 
+ extern int CRT_colorSchemes[LAST_COLORSCHEME][LAST_COLORELEMENT];
+ 
+@@ -150,13 +150,13 @@ extern int CRT_scrollHAmount;
+ 
+ extern int CRT_scrollWheelVAmount;
+ 
+-char* CRT_termType;
++extern char* CRT_termType;
+ 
+ // TODO move color scheme to Settings, perhaps?
+ 
+ extern int CRT_colorScheme;
+ 
+-void *backtraceArray[128];
++extern void *backtraceArray[128];
+ 
+ #if HAVE_SETUID_ENABLED
+ 
diff --git a/meta-oe/recipes-support/htop/htop_2.2.0.bb b/meta-oe/recipes-support/htop/htop_2.2.0.bb
index 64eb0c571f..c608077dee 100644
--- a/meta-oe/recipes-support/htop/htop_2.2.0.bb
+++ b/meta-oe/recipes-support/htop/htop_2.2.0.bb
@@ -9,6 +9,7 @@ DEPENDS = "ncurses"
 SRC_URI = "http://hisham.hm/htop/releases/${PV}/${BP}.tar.gz \
            file://0001-Use-pkg-config.patch \
            file://0001-Ask-for-python3-specifically.patch \
+           file://htop-gcc10.patch \
            "
 SRC_URI[md5sum] = "0d816b6beed31edc75babcfbf863ffa8"
 SRC_URI[sha256sum] = "d9d6826f10ce3887950d709b53ee1d8c1849a70fa38e91d5896ad8cbc6ba3c57"
-- 
2.28.0

