Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.23488.1586111992825243163
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 11:39:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id r19so13008825otn.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 11:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=G0b3YOsRvHXJ3rQTr6BGwtk8O2SmrxC9i8hq53wPV+8=;
        b=Gqz7PCxqhJZWJEH4227HzYI8NGYv8Gt0iIUskuIp8CkoBtbSXc6/mnFybGqsXc9nyx
         1Bpe805ACcZlG6PGj/DN4/9R40oXLnoWAB4Nc9nPS4BIHkeED3ahE2X4/+3jrALxuSIV
         1r6OQqGeo9WKe7d6ouKsXvRsLDsRM9U3uLxikYYgNFEPwpQQXl+TaLMYS3KPfX9fhkh2
         jXZp60QT1YqeWXzL1vCQqND5hUgp/pmEWRkUL/k0lqdxdHwD3uK77rKoRf/iOnDFckAR
         sEqWalcotT1jQSpJtQ0Jxm5xQItTwUrC2CmE43MyEmof0Hjg1G8ZJmP+m4fv0nyN/QPx
         cXRg==
X-Gm-Message-State: AGi0PubYkm5h/oLXhMWOurGM+59OVMHeyVmM67ieYEPgs4prVeopJILb
	qfG0wiqSo/cdMwwxbV8pMzL33B7wyRQ=
X-Google-Smtp-Source: APiQypKCeAEzrfIERjwVuHscgqJK6/H0FqJIHhzLZBfNd/efT7oGybxXcxoGqc9ztjleYAR014cofQ==
X-Received: by 2002:a9d:1a3:: with SMTP id e32mr15265840ote.206.1586111991923;
        Sun, 05 Apr 2020 11:39:51 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q22sm3833927oic.22.2020.04.05.11.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 11:39:51 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 10/15] python-pyiface: consolidate inc and bb files into a single bb file
Date: Sun,  5 Apr 2020 14:39:24 -0400
Message-Id: <20200405183929.28266-10-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200405183929.28266-1-derek@asterius.io>
References: <20200405183929.28266-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pyiface.inc      | 11 -----------
 .../python/python3-pyiface_0.0.11.bb                | 13 +++++++++++--
 2 files changed, 11 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyiface.inc

diff --git a/meta-python/recipes-devtools/python/python-pyiface.inc b/meta-python/recipes-devtools/python/python-pyiface.inc
deleted file mode 100644
index 2e398fcef5..0000000000
--- a/meta-python/recipes-devtools/python/python-pyiface.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "Pyiface is a package that exposes the network interfaces of the operating system in a easy to use and transparent way"
-SECTION = "devel/python"
-HOMEPAGE = "https://pypi.python.org/pypi/pyiface/"
-LICENSE = "GPLv3+"
-
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fe869ee987a340198fb0d54c55c47f1"
-
-SRC_URI[md5sum] = "b066aa984656742738127c9c75436ab4"
-SRC_URI[sha256sum] = "e231e5735d329c5b2d4fc8854f069fdaa5436d3ef91ed64ee49e41e3f5e8a3f5"
-
-inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-pyiface_0.0.11.bb b/meta-python/recipes-devtools/python/python3-pyiface_0.0.11.bb
index 721e7b1c99..3022d08343 100644
--- a/meta-python/recipes-devtools/python/python3-pyiface_0.0.11.bb
+++ b/meta-python/recipes-devtools/python/python3-pyiface_0.0.11.bb
@@ -1,2 +1,11 @@
-inherit setuptools3
-require python-pyiface.inc
+SUMMARY = "Pyiface is a package that exposes the network interfaces of the operating system in a easy to use and transparent way"
+SECTION = "devel/python"
+HOMEPAGE = "https://pypi.python.org/pypi/pyiface/"
+LICENSE = "GPLv3+"
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fe869ee987a340198fb0d54c55c47f1"
+
+SRC_URI[md5sum] = "b066aa984656742738127c9c75436ab4"
+SRC_URI[sha256sum] = "e231e5735d329c5b2d4fc8854f069fdaa5436d3ef91ed64ee49e41e3f5e8a3f5"
+
+inherit pypi setuptools3
-- 
2.17.1

