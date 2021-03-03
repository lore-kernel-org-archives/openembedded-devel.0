Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.2372.1614805197848643826
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 12:59:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FCgaO+Pk;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id i14so4958774pjz.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Mar 2021 12:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YtDfGArJmvG1V3w0G5r1vksqo3QKBemfUIikgchakkc=;
        b=FCgaO+PknYEUurrDbuMV3XkuthPMC0xUQFJ3e5BOPvfsc3E5hd+d2MlEyENK+xLB2i
         /UHVBiIqC6IyFn9bm7HF5ard7QdA7RiXQmcUafZ2eQ2KD3dwgnHueOAxWO5JjM+Lww4f
         +TlWVNisg4E9mPu8j6xgQvVXZbJ6JtWd0i3RQ6B8P0fLEiYogrNJxQkETxynO4i811yZ
         +FwbA0te4EAAVdGajvjuuNFDeBYX+k2zArN2+dIEYdYoZu9D1Jqa84xb9kWOS6PyQNs4
         m5UyK6taLhUYRp9PHpnOqTYVW9Lu75pfuTPX4sVimsnPey9dNwz1prKt7rdUPZfYWJGx
         i60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YtDfGArJmvG1V3w0G5r1vksqo3QKBemfUIikgchakkc=;
        b=rAoM/Nrz1OO9yjeqDCN/sliE9XZYpVTGbdYBV1DseP6bE1RLeEmOL/zxNvop1pDc8r
         gBu9HV0IcJxWZJ3IVDMG7H0Mbmjc/Dm0UxAlQ1hQtA72R+oaKNAZyDLPujZQHAlXKZtb
         pVG70ZS4p1trr5ADOagsM79VoHkaTIhfegGu9FMWfmc3ICrF6c6pUKrJ8cVHI6tjOaEr
         j7Vys/PAnxhCpNO6yU4H59H1GRZ2LoaEHlKUmxCZGEIf/W5ki0jDClJEnKmek90Ch0dK
         kSnQb2zD0gBuQ/FCeDX7EXXBx6+AV4YX+tVNGprW8s4X6UtApmRUTYL8gqswGyuLDQDi
         CQDg==
X-Gm-Message-State: AOAM533Lxgem0ipUoQoA9ngQ2zgMO4uHb3+lli8xwyr506ENkusgqLL4
	E54qig9JBlGmarp5loxNPStxRMCpbG+G3g==
X-Google-Smtp-Source: ABdhPJw70LGIPyZBxiq3/yW/9tOHX4xyOhRK02Dw5XfEKuMpwZ3oNHCPojKp7wc5RDnSL7aN3nL6uQ==
X-Received: by 2002:a17:90b:809:: with SMTP id bk9mr922266pjb.83.1614805197009;
        Wed, 03 Mar 2021 12:59:57 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id c29sm24228266pgb.58.2021.03.03.12.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 12:59:56 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mongodb: Include <optional> c++ header
Date: Wed,  3 Mar 2021 12:59:54 -0800
Message-Id: <20210303205954.2901536-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes build with gcc11

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-needed-c-header.patch        | 29 +++++++++++++++++++
 .../recipes-dbs/mongodb/mongodb_git.bb        |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-include-needed-c-header.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-include-needed-c-header.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-include-needed-c-header.patch
new file mode 100644
index 0000000000..581c2390ec
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-include-needed-c-header.patch
@@ -0,0 +1,29 @@
+From 383b1dda4800c2514cb31446cd7478692d7d26cf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 3 Mar 2021 12:43:16 -0800
+Subject: [PATCH] include needed c++ header
+
+Fixes
+plan_stats.h:214:10: error: 'optional' in namespace 'std' does not name a template type
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/mongo/db/exec/plan_stats.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/mongo/db/exec/plan_stats.h b/src/mongo/db/exec/plan_stats.h
+index ea75f673b8..0cc9b4636d 100644
+--- a/src/mongo/db/exec/plan_stats.h
++++ b/src/mongo/db/exec/plan_stats.h
+@@ -31,6 +31,7 @@
+ 
+ #include <cstdint>
+ #include <cstdlib>
++#include <optional>
+ #include <string>
+ #include <vector>
+ 
+-- 
+2.30.1
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index a153498480..d0c4eba7ee 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -27,6 +27,7 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4 \
            file://1296.patch \
            file://0001-Fix-compilation-with-fno-common.patch \
            file://0001-stacktrace-Define-ARCH_BITS-for-x86.patch \
+           file://0001-include-needed-c-header.patch \
            "
 SRC_URI_append_libc-musl ="\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
-- 
2.30.1

