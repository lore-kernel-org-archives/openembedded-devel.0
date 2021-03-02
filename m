Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.624.1614719012462827918
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 13:03:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PNGaGGIP;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id e3so10633460pfj.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Mar 2021 13:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zBTx1VPJ+9f0Qsb0j8m+8EYByN3l+rCJ3Gm/Tbec3+w=;
        b=PNGaGGIP7aknv3nlEIXJs8Dkqbxl/Bzb/ZNf0ifDbR3JsN0u6drk1qSjUNyoB7Vup+
         PIOhK2gIiJkW1BBopg+xvMzvFREC62U53umfpvera9bMXmxmwGAQwZ2g76mVE4mZKimP
         B9a3pf7aGGEAPQSS9xNYgZkJzFqAYqaRiLWytKZoF5C/W9veo7bHwuQlm1DpfFvxTH/7
         V0icHQOOJlunKzPnGZG4JHzveyFL5Nx7cs/A06bS7llogQ0y1POn/9Zlip6qTCoI85PC
         i/c8hbNVPtwzYrfCUxjlQgBibJcH6H6vJxbKl6xJLIkzDHCVfQoNBfJNAfOj5HLll/xi
         P0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zBTx1VPJ+9f0Qsb0j8m+8EYByN3l+rCJ3Gm/Tbec3+w=;
        b=tmuxhlyKNs4HHsWpoUNV7xllApA3H7YTj/yjFWkAnEIk2wCJ404/xhMiBB3aZ4e1hP
         aW7sHQk1ayg7o5vu1hoUs5rj7XV3XMBEQPk2X7gnoFh5qdp7pjWjULN/8OC8cCOKKPBU
         OtrwyG99Gg0Hbzo/IKLRUy53Z2a9koEAVaIz6AQwvZwiF4UtJvqisIncQzgGD5Yy6OdS
         b2bQa9ifSsLcRlU8lkfCvOVqntfJQFg3NChHq7gnLBn8S5jtRjCCE9EYfrpwmLPyIwwa
         Pp9Fsgc/IT+k0WNiF/CqduIyl5BzRbexEw6nYPcPJ0lYYbxqVrXx5xzeRbjyTBjh7u7U
         As1A==
X-Gm-Message-State: AOAM530nZRolQQeZG18l5JdhZaSLsoaFvQrk5OCKq6OdIA6wgxRvN/sQ
	70N6m8v8V0fRQ9sD+NUyjHw1ocDd7JLIow==
X-Google-Smtp-Source: ABdhPJzu5Acr5oAvpHEryx4YviwgUROfrI8Gl7K10ubdRiF/LHP5IFlZzFq4p1CuDB5oG7FlmEkpgA==
X-Received: by 2002:a62:43:0:b029:1cd:2de2:5a24 with SMTP id 64-20020a6200430000b02901cd2de25a24mr4839571pfa.27.1614719011709;
        Tue, 02 Mar 2021 13:03:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id z137sm23455607pfc.172.2021.03.02.13.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 13:03:31 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-multimedia][PATCH 2/2] gerbera: Update to 1.7.0
Date: Tue,  2 Mar 2021 13:03:27 -0800
Message-Id: <20210302210327.1143245-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302210327.1143245-1-raj.khem@gmail.com>
References: <20210302210327.1143245-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix build with gcc11

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-include-optional-header.patch        | 32 +++++++++++++++++++
 .../{gerbera_1.6.0.bb => gerbera_1.7.0.bb}    |  5 +--
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-include-optional-header.patch
 rename meta-multimedia/recipes-multimedia/gerbera/{gerbera_1.6.0.bb => gerbera_1.7.0.bb} (88%)

diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-include-optional-header.patch b/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-include-optional-header.patch
new file mode 100644
index 0000000000..f3197f937b
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera/0001-include-optional-header.patch
@@ -0,0 +1,32 @@
+From 5719ed8ce9ba60beb9c1670b49296b1c66430dc2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 2 Mar 2021 12:57:37 -0800
+Subject: [PATCH] include <optional> header
+
+Fixes build with gcc11
+/src/util/tools.h:165:6: error: 'optional' in na
+mespace 'std' does not name a template type
+|   165 | std::optional<std::vector<std::byte>> readBinaryFile(const fs::path& path);
+|       |      ^~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/gerbera/gerbera/pull/1273]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/util/tools.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/util/tools.h b/src/util/tools.h
+index 3a4064e9..e5142966 100644
+--- a/src/util/tools.h
++++ b/src/util/tools.h
+@@ -37,6 +37,7 @@
+ #include <sstream>
+ #include <string>
+ #include <unordered_set>
++#include <optional>
+ #include <vector>
+ namespace fs = std::filesystem;
+ 
+-- 
+2.30.1
+
diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.6.0.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.7.0.bb
similarity index 88%
rename from meta-multimedia/recipes-multimedia/gerbera/gerbera_1.6.0.bb
rename to meta-multimedia/recipes-multimedia/gerbera/gerbera_1.7.0.bb
index 7f26741832..d4242aa062 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_1.7.0.bb
@@ -4,9 +4,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=25cdec9afe3f1f26212ead6bd2f7fac8"
 
 SRC_URI = "git://github.com/v00d00/gerbera.git;protocol=https \
-"
+           file://0001-include-optional-header.patch \
+          "
 
-SRCREV = "b219e22f09e346dd048f614a01ca2cbc55edd940"
+SRCREV = "7bc33b98994411e1748d3b3fa9a8424c49e236d6"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.1

