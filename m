Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.1537.1586020410816761171
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id a49so10741623otc.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+OjOojfTHu//p4y+I6jz3PmkLSNm3m+VHCyHimRRlvg=;
        b=o6C6kxTZUm7x2V60cQqEW+Jnhh2QSlWmEqDMmzomg99SemjXFK0nGZl3WsiWfmhEzS
         1BlxWvpS/266/cScbl94frPVuw8cke8w9L0g1GAtnxUS42fYbjWrA9vvxcBni1xkU6+n
         nFRDF+xLWqYxw4Hvq8ECulfUdE9NFBBBP2ig5kB2+z/Cb/GKdrA5dplomIEsQvkIF4lM
         0BY7ek6JU4bt8rVmEaBEZzpWqnhIiWuxoS/QTAQgdENmJLDp+Muc4JGi3UPgY3KmqrxW
         OGIHykD6XbRFnmys5u/S8lcLRGH9MJmH67ZvscqopJtAFOqlVQsy8GCOdHFqfSot2Jkw
         kB1A==
X-Gm-Message-State: AGi0PubtzsWgOEVxZXlUXTJUorujUdBT0/Fxq5L7kGM8HNgqjVY35fx1
	WGCWN9ppiqx9Te+gGbta50rrkVZ3FeQ=
X-Google-Smtp-Source: APiQypLZt6YIEPbOXIUhSzQkXGS68qFrGao8m/cPo7xmANDH5ZZgQohMyuigwJc7MQB4gCWXIBZMoQ==
X-Received: by 2002:a05:6830:19e2:: with SMTP id t2mr10401567ott.97.1586020409660;
        Sat, 04 Apr 2020 10:13:29 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:28 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 25/27] python-semver: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:49 -0400
Message-Id: <20200404171251.19823-25-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-semver.inc      | 12 ------------
 .../python/python3-semver_2.8.1.bb                 | 14 ++++++++++++--
 2 files changed, 12 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-semver.inc

diff --git a/meta-python/recipes-devtools/python/python-semver.inc b/meta-python/recipes-devtools/python/python-semver.inc
deleted file mode 100644
index 3c95c06eaf..0000000000
--- a/meta-python/recipes-devtools/python/python-semver.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Python module for Semantic Versioning"
-HOMEPAGE = "https://github.com/k-bx/python-semver"
-BUGTRACKER = "https://github.com/k-bx/python-semver/issues"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
-
-SRC_URI[md5sum] = "dc579ba9d0bb2137bad5324d4bdb7e40"
-SRC_URI[sha256sum] = "5b09010a66d9a3837211bb7ae5a20d10ba88f8cb49e92cb139a69ef90d5060d8"
-
-inherit pypi
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-semver_2.8.1.bb b/meta-python/recipes-devtools/python/python3-semver_2.8.1.bb
index 77925ae2b1..a469b23b10 100644
--- a/meta-python/recipes-devtools/python/python3-semver_2.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-semver_2.8.1.bb
@@ -1,2 +1,12 @@
-inherit setuptools3
-require python-semver.inc
+DESCRIPTION = "Python module for Semantic Versioning"
+HOMEPAGE = "https://github.com/k-bx/python-semver"
+BUGTRACKER = "https://github.com/k-bx/python-semver/issues"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
+
+SRC_URI[md5sum] = "dc579ba9d0bb2137bad5324d4bdb7e40"
+SRC_URI[sha256sum] = "5b09010a66d9a3837211bb7ae5a20d10ba88f8cb49e92cb139a69ef90d5060d8"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

