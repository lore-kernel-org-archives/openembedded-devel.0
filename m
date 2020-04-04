Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web10.1585.1586020401982510890
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id m14so9228564oic.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=w1QhOERC91r7+8HLJ01wwy9CSd665o3V5HXsd4Jgtew=;
        b=T0rjKVt5se7/G9iQ95QRaAQnEOL4jqVpw4djRAZthhThNntniLI5981RLe0+8sSoqf
         7NibeIYI3ugzZcEhyhVLjP8z59eA/Twxpzhyl8dqh/gVWGEEirx+hbcrsJyyAWly5+cI
         dIHoONwKv6926JFbv2q8dNdOIFb39jOomN3iEcBqHnVFiiR1QcJg8F3r3jxLah9lWWM1
         U8TdvzOgVE+EfKSnFGXzCrHLMrVWqJvaum9nUvvd/Hq70Ez2kOvNs0Erk0CXOPVlXWsQ
         YRdC0zXfmpbzhq7zP5NXyYChcEwhYngtH+EHXxA25THTokTvKAcl+74eIfn3xZuwbxDk
         387g==
X-Gm-Message-State: AGi0PuaLVXzJ8AOo9xxdz+gYr2dSW8H2ehtUhW1irvkP+uknuAobJG/3
	zsiBQpMJEHDXZw2zPgSlW1BCa0U2ptY=
X-Google-Smtp-Source: APiQypKhCggVzCZUa/E7QO7BdePXT24UotonjbtI+GZVa8EfjQOxO1gIHJxyQb8ygPOXApvaEM525g==
X-Received: by 2002:a05:6808:207:: with SMTP id l7mr7499397oie.171.1586020401006;
        Sat, 04 Apr 2020 10:13:21 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:20 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 15/27] python-smbus: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:39 -0400
Message-Id: <20200404171251.19823-15-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-smbus.inc        | 12 ------------
 .../recipes-devtools/python/python3-smbus_4.1.bb    | 13 ++++++++++++-
 2 files changed, 12 insertions(+), 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-smbus.inc

diff --git a/meta-python/recipes-devtools/python/python-smbus.inc b/meta-python/recipes-devtools/python/python-smbus.inc
deleted file mode 100644
index 8ba1ab2b82..0000000000
--- a/meta-python/recipes-devtools/python/python-smbus.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "Set of i2c tools for linux - Python module"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://smbusmodule.c;beginline=1;endline=18;md5=46e424fb045901ab25e0f92c28c80055"
-PR = "r1"
-
-SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/i2c-tools-${PV}.tar.gz "
-SRC_URI[md5sum] = "3536237a6b51fb10caacdc3b8a496237"
-SRC_URI[sha256sum] = "ef8f77afc70e7dbfd1171bfeae87a8a7f10074829370ce8d9ccd585a014e0073"
-
-DEPENDS += "i2c-tools"
-
-S = "${WORKDIR}/i2c-tools-${PV}/py-smbus/"
diff --git a/meta-python/recipes-devtools/python/python3-smbus_4.1.bb b/meta-python/recipes-devtools/python/python3-smbus_4.1.bb
index b357bcd822..1be77393b2 100644
--- a/meta-python/recipes-devtools/python/python3-smbus_4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus_4.1.bb
@@ -1,2 +1,13 @@
+SUMMARY = "Set of i2c tools for linux - Python module"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://smbusmodule.c;beginline=1;endline=18;md5=46e424fb045901ab25e0f92c28c80055"
+PR = "r1"
+
+SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/i2c-tools-${PV}.tar.gz "
+SRC_URI[md5sum] = "3536237a6b51fb10caacdc3b8a496237"
+SRC_URI[sha256sum] = "ef8f77afc70e7dbfd1171bfeae87a8a7f10074829370ce8d9ccd585a014e0073"
+
+DEPENDS += "i2c-tools"
+
+S = "${WORKDIR}/i2c-tools-${PV}/py-smbus/"
 inherit distutils3
-require python-smbus.inc
-- 
2.17.1

