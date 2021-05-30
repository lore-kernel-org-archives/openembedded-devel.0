Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web08.34853.1622399682386162251
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 May 2021 11:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DJV8kqfo;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 29so6661266pgu.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 May 2021 11:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Y/s9+LUx7ULyMiNVumVHeqzFc9WAfgEu9XE1G/24u7g=;
        b=DJV8kqfoOkEYrB4msTxpJJPAEeTJXBJxxpxhVl2sWVmHDi2bCNQrrRhxsyk/Cl2W3J
         sbqm6/unISnG8DuhS7rYEEeYY4z3Vi+8ANjIXHehSvqi7Sx6cfgRPUyBn950VYfVenRM
         9vJ81J2p5IwIzTIHpuOYCFysTrwK9ug2fT+V3RgX2KHPQKfFj+ExrAFlK5ti1gb+XSlD
         GrPZDHfWEwFIYqarPH0WZ78qwLecKFA28eKo0/TnVrpuOmJ4s0UCbLHNe0cnbgHuJrin
         ObobkKJtnSJp3Mz96maxWWDOZiE4+vGkuXsMSh1KcGFbzsCxFmvem49NNv+q6JxzDU8P
         0vjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Y/s9+LUx7ULyMiNVumVHeqzFc9WAfgEu9XE1G/24u7g=;
        b=JoO7bfRFMAa4Jx9waUqzNzakX7XyaBCSVSlL7M3nE49juHRcKvZrpOnvpN00u0hyno
         qRKBWXmtJPBtBYN3vlLWvHwjaFoXrmdAj1sOLU/KJNRyf7k3JwF9hnkXWXKiomKj6L4m
         Y6opsxSgOnHX31qF0DofMi022Xh5V3H9U2TXR0NmilDG0aVyS8y+W8ZXMKog4ZiG3rYe
         9+ZBMKJZ/6xhBXseXal9d8NN3yBBfsYVkRTRmb2W4GKouf15wsMY9/XP41UKPg+TWXx6
         eEpmYAs0harBWJeTXsRdtLkhOXzSl78s1tWm5VbUi0uvsZCwJk+ufzwE+dTaNXLWm9yJ
         gHLw==
X-Gm-Message-State: AOAM533pp9d0W/28g6tVPNyMHdULWcRaes8EEQBvqfwGyZMRGbDEuxgt
	OXQxZ7sDzWssCYwmh8ltT0emxE7OfXykXA==
X-Google-Smtp-Source: ABdhPJwcJrGvTHlb9Gu9/BCUicEU5WAzszqSIjxC7PfA1iMDmWj6+EcwwOr7x9FMt64wDR6q07PJtQ==
X-Received: by 2002:a63:ff18:: with SMTP id k24mr19658094pgi.134.1622399681806;
        Sun, 30 May 2021 11:34:41 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:417e:d6cd:22c6:4534])
        by smtp.gmail.com with ESMTPSA id z19sm8828696pjq.11.2021.05.30.11.34.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 11:34:41 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 10/12] opencv: Add fix for CVE-2019-5063 and CVE-2019-5064
Date: Sun, 30 May 2021 11:34:20 -0700
Message-Id: <943f5560aa3b34f1c0baa0b8093fe978d5db558d.1622399528.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622399528.git.akuster808@gmail.com>
References: <cover.1622399528.git.akuster808@gmail.com>

From: "akash.hadke" <akash.hadke@kpit.com>

Added fix for below CVE's

CVE-2019-5063
CVE-2019-5064
Link: https://github.com/opencv/opencv/commit/f42d5399aac80d371b17d689851406669c9b9111.patch

Signed-off-by: akash hadke <akash.hadke@kpit.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../opencv/CVE-2019-5063_and_2019-5064.patch  | 78 +++++++++++++++++++
 .../recipes-support/opencv/opencv_4.1.0.bb    |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-5063_and_2019-5064.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-5063_and_2019-5064.patch b/meta-oe/recipes-support/opencv/opencv/CVE-2019-5063_and_2019-5064.patch
new file mode 100644
index 0000000000..b4d5e6dc44
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-5063_and_2019-5064.patch
@@ -0,0 +1,78 @@
+From f42d5399aac80d371b17d689851406669c9b9111 Mon Sep 17 00:00:00 2001
+From: Alexander Alekhin <alexander.alekhin@intel.com>
+Date: Thu, 7 Nov 2019 14:01:51 +0300
+Subject: [PATCH] core(persistence): add more checks for implementation
+ limitations
+
+Signed-off-by: akash hadke <akash.hadke@kpit.com>
+---
+ modules/core/src/persistence_json.cpp | 8 ++++++++
+ modules/core/src/persistence_xml.cpp  | 6 ++++--
+ 2 files changed, 12 insertions(+), 2 deletions(-)
+---
+CVE: CVE-2019-5063
+CVE: CVE-2019-5064
+Upstream-Status: Backport [https://github.com/opencv/opencv/commit/f42d5399aac80d371b17d689851406669c9b9111.patch]
+---
+diff --git a/modules/core/src/persistence_json.cpp b/modules/core/src/persistence_json.cpp
+index 89914e6534f..2efdf17d3f5 100644
+--- a/modules/core/src/persistence_json.cpp
++++ b/modules/core/src/persistence_json.cpp
+@@ -578,10 +578,14 @@ class JSONParser : public FileStorageParser
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
+@@ -605,6 +609,8 @@ class JSONParser : public FileStorageParser
+                             sz = (int)(ptr - beg);
+                             if( sz > 0 )
+                             {
++                                if (i + sz >= CV_FS_MAX_LEN)
++                                    CV_PARSE_ERROR_CPP("string is too long");
+                                 memcpy(buf + i, beg, sz);
+                                 i += sz;
+                             }
+@@ -620,6 +626,8 @@ class JSONParser : public FileStorageParser
+                             sz = (int)(ptr - beg);
+                             if( sz > 0 )
+                             {
++                                if (i + sz >= CV_FS_MAX_LEN)
++                                    CV_PARSE_ERROR_CPP("string is too long");
+                                 memcpy(buf + i, beg, sz);
+                                 i += sz;
+                             }
+diff --git a/modules/core/src/persistence_xml.cpp b/modules/core/src/persistence_xml.cpp
+index 89876dd3da8..52b53744254 100644
+--- a/modules/core/src/persistence_xml.cpp
++++ b/modules/core/src/persistence_xml.cpp
+@@ -627,6 +627,8 @@ class XMLParser : public FileStorageParser
+                                         c = '\"';
+                                     else
+                                     {
++                                        if (len + 2 + i >= CV_FS_MAX_LEN)
++                                            CV_PARSE_ERROR_CPP("string is too long");
+                                         memcpy( strbuf + i, ptr-1, len + 2 );
+                                         i += len + 2;
+                                     }
+@@ -635,9 +637,9 @@ class XMLParser : public FileStorageParser
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
diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
index de708fd06d..19d5d0c891 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
@@ -54,6 +54,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
            file://CVE-2019-14493.patch \
            file://CVE-2019-15939.patch \
            file://CVE-2019-19624.patch \
+           file://CVE-2019-5063_and_2019-5064.patch \
            "
 PV = "4.1.0"
 
-- 
2.17.1

