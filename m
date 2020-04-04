Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web12.1521.1586020396606212102
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 111so10749014oth.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WwnQccLb/k/yY556Ct7RgD2ydcMmpzzOoBorH7RSUMk=;
        b=m0ZDQ0stlm+ft4l+wN+LxaX1n6weX7WvQbkSDk3U82k18E4LCDMy1z3/aHDoYama+O
         VPSI6r+qIps1NOUj5QcPmRSVVp+nj+EZKiv4o/ho1qjaiF1YpYqLOmWalXA9oCameeLA
         3QcZyVJtue0EYshqztFS3fWiM4U/8aIoa/4HKN5NHvJJctWuWxJurGuPd32IvDGgcl9b
         N5rSdSycSRKC7wBbhFLHU5ytxAXl7dfSnj1U7EYNehH6ei8L6XaLRoWp1lqgIcR49ECI
         xie9zbZQNAIuPbtoOVb1tCA4LLHHtu1QzKxFkLbx12zjbep7wqdtNCqwka/qpoWoqyNB
         P/SQ==
X-Gm-Message-State: AGi0PuZnnzyb+l6u/aLpGPjBRO6jLCEGhnRyQLoCG3rNl86KwQxvnjie
	hzbc7VJaF5W6jIrcrkprKqCz/1uWYmw=
X-Google-Smtp-Source: APiQypLFzqaInWpNED/4jHxNBqb4jpUdOkoCBh3g3r5HQW8Tll5TR9WGJvKArKag4B5JD5/YFUVJAA==
X-Received: by 2002:a9d:3423:: with SMTP id v32mr10948756otb.46.1586020395668;
        Sat, 04 Apr 2020 10:13:15 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:14 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 09/27] python-stevedore: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:33 -0400
Message-Id: <20200404171251.19823-9-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-stevedore.inc                 | 15 ---------------
 .../python/python3-stevedore_1.31.0.bb          | 17 +++++++++++++++--
 2 files changed, 15 insertions(+), 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-stevedore.inc

diff --git a/meta-python/recipes-devtools/python/python-stevedore.inc b/meta-python/recipes-devtools/python/python-stevedore.inc
deleted file mode 100644
index 5aa9fb424c..0000000000
--- a/meta-python/recipes-devtools/python/python-stevedore.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Manage dynamic plugins for Python applications"
-HOMEPAGE = "https://github.com/dreamhost/stevedore"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-SRC_URI[md5sum] = "42fa2bf0251c96b543765c5ce13f37c9"
-SRC_URI[sha256sum] = "e0739f9739a681c7a1fda76a102b65295e96a144ccdb552f2ae03c5f0abe8a14"
-
-inherit pypi
-
-DEPENDS += "${PYTHON_PN}-pbr-native"
-
-RDEPENDS_${PN} += "${PYTHON_PN}-pbr ${PYTHON_PN}-six"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-stevedore_1.31.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_1.31.0.bb
index 3f557f2cbf..b985ca5b13 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_1.31.0.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_1.31.0.bb
@@ -1,2 +1,15 @@
-inherit setuptools3
-require python-stevedore.inc
+DESCRIPTION = "Manage dynamic plugins for Python applications"
+HOMEPAGE = "https://github.com/dreamhost/stevedore"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[md5sum] = "42fa2bf0251c96b543765c5ce13f37c9"
+SRC_URI[sha256sum] = "e0739f9739a681c7a1fda76a102b65295e96a144ccdb552f2ae03c5f0abe8a14"
+
+DEPENDS += "${PYTHON_PN}-pbr-native"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-pbr ${PYTHON_PN}-six"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

