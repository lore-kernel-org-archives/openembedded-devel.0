Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.7349.1587046635366301466
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2020 07:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lmeNAlKR;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: gregory.vimont@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id b11so5024268wrs.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2020 07:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xelKIx4uMnupMUuZwQiQXYr/z+sNim2mqvDZcIcQRvo=;
        b=lmeNAlKROA2pNteqzYG5sV7BMI3cMIHZfHYZQ/HpuLqe0Dl77GqeG8NQxFuTmoFqk9
         abLbp3nJe0FIFJxbA0JFUUx6nhoLgTjlW8MkfqLA7dItxpNOyL9ojDrP6AtRRmtf76vm
         QNat90NrEOikJaqZNbgiH8N+mH1NCV9bv0reOviXGcttKl7uohDZcWejJDpJca8FwdjA
         lELTHPRBcArmfcLg6JGdqghuvyGAlm6GZb1q5CDFGk5RXcvAjfXcAwrAR0paqX0uMl4H
         xvs71w+K+6UHrTsqgFkWyMEmkuCDGabo7WYL4oLfBq+tTuCA+fuUD8m2Hg4jucbqfaye
         T7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xelKIx4uMnupMUuZwQiQXYr/z+sNim2mqvDZcIcQRvo=;
        b=Hwi8z/hlHMPPr5nlHRMIF4jeEOTW4C6GTPBaHvq8Pue4Npk1Lb0YsszHcjzoVfh03x
         BPcXnkMlWHhLxtPqBSf4gkDn9twPPL+D5vk3NypT6uUJAXpQiJInHAawR3oNK0PJC6ab
         52wzWbGFMKiUR/joroODvJKDcmbwLv2jx3LJrUQeYHWfMDMO1rnxKdu9xv3LtomIkbB6
         fYUqowelOxzFHfitk0zHZ/dZQjTrvKA1zCB4568hBaZKYMWlgQZQaKL8TOdi4lVx6qx7
         KabALTYwTiSnDwlFyRku8n6xSZO8qup9ggzYPnDDgFCIS9fC9ztakjWiOlvnK3IwVKPy
         h21g==
X-Gm-Message-State: AGi0PuZ/ULr8QNnUHwBjQxEN8btjANnarHxOmPh03jRTdsTztwcMIPBr
	WWMxdfiy+Ko5M6rwSlmbFEqqKRpQd0I=
X-Google-Smtp-Source: APiQypINlhg+cPTrmg5CPY6peNT6S4WZG3/H1Mei1ezvAJggr9psMTdltlf7EHDApxHL/YEo/ZIdmA==
X-Received: by 2002:adf:ff89:: with SMTP id j9mr20400756wrr.245.1587046633539;
        Thu, 16 Apr 2020 07:17:13 -0700 (PDT)
Return-Path: <gregory.vimont@gmail.com>
Received: from ALD-1799-DE.aldebaran.lan (softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu. [158.255.112.194])
        by smtp.gmail.com with ESMTPSA id r27sm8640992wra.83.2020.04.16.07.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 07:17:13 -0700 (PDT)
From: "Gregory Vimont" <gregory.vimont@gmail.com>
X-Google-Original-From: Gregory Vimont <gregory.vimont@softbankrobotics.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gregory Vimont <gregory.vimont@softbankrobotics.com>
Subject: [meta-oe][PATCH 3/3] opencv: Fix CVE-2019-5063 and CVE-2019-5064
Date: Thu, 16 Apr 2020 16:16:56 +0200
Message-Id: <20200416141656.7900-3-gregory.vimont@softbankrobotics.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416141656.7900-1-gregory.vimont@softbankrobotics.com>
References: <20200416141656.7900-1-gregory.vimont@softbankrobotics.com>

Upstream-Status: Backport [https://github.com/opencv/opencv/commit/f42d5399aac80d371b17d689851406669c9b9111]
CVE: CVE-2019-5063
CVE: CVE-2019-5064
Signed-off-by: Gregory Vimont <gregory.vimont@softbankrobotics.com>
---
 .../opencv/opencv/CVE-2019-5063.patch         | 35 ++++++++++++++
 .../opencv/opencv/CVE-2019-5064.patch         | 47 +++++++++++++++++++
 .../recipes-support/opencv/opencv_4.1.1.bb    |  2 +
 3 files changed, 84 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-5063.patch
 create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-5064.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-5063.patch b/meta-oe/recipes-support/opencv/opencv/CVE-2019-5063.patch
new file mode 100644
index 000000000..a2431c333
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-5063.patch
@@ -0,0 +1,35 @@
+From 161a6f06099f842dd4b5e499ddd6ce9daf643e40 Mon Sep 17 00:00:00 2001
+From: Alexander Alekhin <alexander.alekhin@intel.com>
+Date: Thu, 7 Nov 2019 14:01:51 +0300
+Subject: [PATCH] core(persistence): add more checks for implementation
+ limitations
+ 
+---
+ modules/core/src/persistence_xml.cpp  | 6 ++++--
+ 1 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/modules/core/src/persistence_xml.cpp b/modules/core/src/persistence_xml.cpp
+index 89876dd3da..52b5374425 100644
+--- a/modules/core/src/persistence_xml.cpp
++++ b/modules/core/src/persistence_xml.cpp
+@@ -627,6 +627,8 @@ public:
+                                         c = '\"';
+                                     else
+                                     {
++                                        if (len + 2 + i >= CV_FS_MAX_LEN)
++                                            CV_PARSE_ERROR_CPP("string is too long");
+                                         memcpy( strbuf + i, ptr-1, len + 2 );
+                                         i += len + 2;
+                                     }
+@@ -635,9 +637,9 @@ public:
+                                 CV_PERSISTENCE_CHECK_END_OF_BUFFER_BUG_CPP();
+                             }
+                         }
++                        if (i + 1 >= CV_FS_MAX_LEN)
++                            CV_PARSE_ERROR_CPP("Too long string literal");
+                         strbuf[i++] = c;
+-                        if( i >= CV_FS_MAX_LEN )
+-                            CV_PARSE_ERROR_CPP( "Too long string literal" );
+                     }
+                     elem->setValue(FileNode::STRING, strbuf, i);
+                 }
diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-5064.patch b/meta-oe/recipes-support/opencv/opencv/CVE-2019-5064.patch
new file mode 100644
index 000000000..1bf81c9b6
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-5064.patch
@@ -0,0 +1,47 @@
+From 161a6f06099f842dd4b5e499ddd6ce9daf643e40 Mon Sep 17 00:00:00 2001
+From: Alexander Alekhin <alexander.alekhin@intel.com>
+Date: Thu, 7 Nov 2019 14:01:51 +0300
+Subject: [PATCH] core(persistence): add more checks for implementation
+ limitations
+ 
+---
+ modules/core/src/persistence_json.cpp | 8 ++++++++
+ 1 files changed, 8 insertions(+), 0 deletions(-)
+
+diff --git a/modules/core/src/persistence_json.cpp b/modules/core/src/persistence_json.cpp
+index 89914e6534..2efdf17d3f 100644
+--- a/modules/core/src/persistence_json.cpp
++++ b/modules/core/src/persistence_json.cpp
+@@ -578,10 +578,14 @@ public:
+                             sz = (int)(ptr - beg);
+                             if( sz > 0 )
+                             {
++                                if (i + sz >= CV_FS_MAX_LEN)
++                                    CV_PARSE_ERROR_CPP("string is too long");
+                                 memcpy(buf + i, beg, sz);
+                                 i += sz;
+                             }
+                             ptr++;
++                            if (i + 1 >= CV_FS_MAX_LEN)
++                                CV_PARSE_ERROR_CPP("string is too long");
+                             switch ( *ptr )
+                             {
+                             case '\\':
+@@ -605,6 +609,8 @@ public:
+                             sz = (int)(ptr - beg);
+                             if( sz > 0 )
+                             {
++                                if (i + sz >= CV_FS_MAX_LEN)
++                                    CV_PARSE_ERROR_CPP("string is too long");
+                                 memcpy(buf + i, beg, sz);
+                                 i += sz;
+                             }
+@@ -620,6 +626,8 @@ public:
+                             sz = (int)(ptr - beg);
+                             if( sz > 0 )
+                             {
++                                if (i + sz >= CV_FS_MAX_LEN)
++                                    CV_PARSE_ERROR_CPP("string is too long");
+                                 memcpy(buf + i, beg, sz);
+                                 i += sz;
+                             }
diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.1.bb b/meta-oe/recipes-support/opencv/opencv_4.1.1.bb
index c77c7ff80..1b6a6c9fa 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.1.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.1.1.bb
@@ -51,6 +51,8 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
            file://0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch \
            file://download.patch \
            file://CVE-2019-15939.patch \
+           file://CVE-2019-5063.patch \
+           file://CVE-2019-5064.patch \
            "
 PV = "4.1.1"
 
-- 
2.17.1

