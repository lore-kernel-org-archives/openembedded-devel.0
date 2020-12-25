Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.14580.1608931069958531817
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Dec 2020 13:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oJy7cysj;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: rfried.dev@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id c124so4142421wma.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Dec 2020 13:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=TakUp7nSOizyDSaqsTMZF0GFIq/LbST1wzUE8tBLt08=;
        b=oJy7cysjPhxSCLnZ62W8dNEGUZmBm878zVCCErGrWMim5A0I9jjEOXrKHeLcCq3v1B
         G17/eJrqW/ZRtNfvQ6ZlfN6i0r5rllw8cSlgGkAIakXVelQaxDeO3dresFPaYNhFshAS
         Ab+vUnxvDU1PctZBqhH2x36IQb8aNE88y4AKG9Wp2XhIu/UHG2df2XY7P0HdaslcjqhX
         5SboGYVWEDFBM5ZZ92SV+eNWQOqBiLUegOwvdKH/W5TmxXK82mfwxj3KG70zEEuAH0wR
         zw6Q5Gtn1U9gAHzUp7YT1v1wv4/m2FwpJgD439LwGb785xAKnD6XehGoDAVHBwNr/iGK
         YOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TakUp7nSOizyDSaqsTMZF0GFIq/LbST1wzUE8tBLt08=;
        b=ECQLe+BtGZ44Vm5jZrNU3y7v1r1GQ+qG2lB7v2rbYLW9lkjL0yHtIQyWWfLbziRttD
         ynbBfIOaDlNsOErS8T/2KANluZlEu6pQyahE5tgWTqhRjbVWuvpbtO8yj4+hzS+gm9mF
         gO2hlzVeXsW1bjBm1vcKaqaaF2n2MHC0qBu4vltldwnEhg+NTqnhrvZJc2NCEYM013NY
         oSvOMHTVdbYAjoWSqK5pEkjBZcaM2cwoOw5LaP1RjiuOtTqyK08MXe/Ns7oCbDzvyPmc
         tP+ZTH/KK1++UXS14K1bkgmRKIgpFUZInFj0QdXrnfL6OY2AboW+pQbKkniV1Eh0cDkM
         5ZnA==
X-Gm-Message-State: AOAM530wJRYjKMP6k7avWjWr85D3XTmN/R3484Ve8dKbI5bYPAASH2z3
	krs07D9/KCyJ6PJXvMaeZq8iqUZHdcswKg==
X-Google-Smtp-Source: ABdhPJwx93eoz436EXu+79fOWCKBRhnajsx8j6Z4lj3rahiXlMGmXshBY1eHuDa6oNdOtr1BaaY16w==
X-Received: by 2002:a1c:4107:: with SMTP id o7mr9916545wma.69.1608931067964;
        Fri, 25 Dec 2020 13:17:47 -0800 (PST)
Return-Path: <rfried.dev@gmail.com>
Received: from lotus.nr.ent (82.166.25.98.fix.netvision.net.il. [82.166.25.98])
        by smtp.gmail.com with ESMTPSA id o7sm45916327wrw.62.2020.12.25.13.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Dec 2020 13:17:47 -0800 (PST)
From: "Ramon Fried" <rfried.dev@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ramon Fried <rfried.dev@gmail.com>
Subject: [meta-oe][PATCH v2] yaml-cpp: add new recipe
Date: Fri, 25 Dec 2020 23:19:08 +0200
Message-Id: <20201225211908.39571-1-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.17.1

yaml-cpp is a YAML parser and emitter in C++
matching the YAML 1.2 spec.

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
v2: Remove redundant FILES_${PN},do_install_append() and PV.

 .../recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb

diff --git a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb
new file mode 100644
index 000000000..9d359d624
--- /dev/null
+++ b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb
@@ -0,0 +1,17 @@
+SUMMARY = "yaml-cpp parser and emitter library"
+DESCRIPTION = "yaml-cpp is a YAML parser and emitter in C++ matching the YAML 1.2 spec."
+HOMEPAGE = "https://github.com/jbeder/yaml-cpp"
+SECTION = "devel"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6a8aaf0595c2efc1a9c2e0913e9c1a2c"
+
+# yaml-cpp releases are stored as archive files in github.
+# download the exact revision of release
+SRC_URI = "git://github.com/jbeder/yaml-cpp.git"
+SRCREV = "9a3624205e8774953ef18f57067b3426c1c5ada6"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-DYAML_CPP_BUILD_TESTS=OFF -DYAML_BUILD_SHARED_LIBS=ON -DYAML_CPP_BUILD_TOOLS=OFF"
-- 
2.17.1

