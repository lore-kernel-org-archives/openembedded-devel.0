Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63235C9832F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 09:22:35 +0000 (UTC)
Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54643.1790587350710973025
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 02:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HH7lRDLw;
 spf=pass (domain: gmail.com, ip: 74.125.225.97, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-482f6351831so1571614f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 02:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790587349; x=1791192149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6zFdXYWNbIoAZVc0MRxuL0Y9GeIS2GDi0r2BXK7Unw=;
        b=HH7lRDLwt3gl9+RSpL8fh6jNd4maOjWigXkHd3NUlaEf9fPglccdpy8Hvbw0aNBYD6
         guWpBrrX1E/O8jACXwHrYkjxERtmXN9XRrTb8mruII1Kw8bFpbH9wFLHK5kGFd2FQ+Jb
         ej+ipYdKG9fe8738opNKmrmv7h81gXNpSIVv8aNXeTYp9r0I33A9MCPaF78nxzOxhhwA
         +lofqJPoRoR1ROF44NEtLtUeVzwU7XUrSGMF6KwbosDQNzOVHQtVToQO8P8opE/lbuy1
         0XOgUk/tCOixItZr4hLKaollwzgfTjd7kxb1JKHENXnSJCQNRipbfKdx9lm+eWjsbVFk
         nxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790587349; x=1791192149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I6zFdXYWNbIoAZVc0MRxuL0Y9GeIS2GDi0r2BXK7Unw=;
        b=F17MduEwFI28x+FnOwsF1oHjzde5RInK/lWDBz4BOpl4TwVqQFaFD/fO0+qicgA40/
         H2jhueHkfJEhYpEQcXKJA9kDpTTJL8NNKxwv610Esb1yMbrh4iPa91KH+4N2BWtBkIEN
         Cy82GrwKCt+aOcq8RrHCIW00y9vgk9bRTiNy9o6M1Q720p2DW6/b56K2L237Df8q9PUU
         GLjDpttu9RSp/aWFNltnxZYpIwzDMCz+3Ifr46yujsdxQSO/AcHTnJMi33Wt7O+7ZKcQ
         3j7ET2yqNVC7TG2HGXkU7HUPWmI65cQy8VSf+BheeQBDlaW54IxZTuodSzDPSWjNG+Me
         KORA==
X-Gm-Message-State: AFq9FYJsaCEoW4McMcIY5b3K2C3X6aLmwZYg8taAbEVG2MI3F10YZ2I6
	Aha/jb630vfliOPCdcVmwwZTZjxJynpQYjOCm4Wz+PKMhlFk8eWMWfwpWcJapA==
X-Gm-Gg: AYBFou3ADSn64CRx5hoJVdnhoahp4S9amTDA//Q/3iet1hVyrLbD3Rqdm6Hdk/722+e
	liaw4wYtYZnHRtEGeewLC5p4l8kE5kDKrLGg09jx6oD4EKKQ2Op0xoAdO3kKs4L/sE9ZpotfxyX
	aHOVuJUxh5TUCbbsoagtZIM6ee2O+Jb40nC/Gr1fA+AmlpZIuWNHdbqKB8BJXwjWXvn9a8Z5wsP
	oLLeY22z3OeMx7308bTowzk1zNoJpBdYVoxito1rNlmeUyke9izvEWx8R9N2gX9lbldbiO7BbJ5
	6Bo47nRjGoAZBvGHb4zw3G0LjYkvA4o9DT0AK9a6TK3lnZ7SRYt04KjIY1ij0/Xx/s7W5aSvKaf
	BMhFSxV06Y3DdvjfI6fwMj2Qq9JEump6RKaOrsdmdBkY3r4/PqY0N336aBFRGRmO25PYFfOmw4J
	HCx05dVZmUnRbXCDsq5Np4bwXGwpNk9Q7o5Hgcp83LhRTVsl1+W2UcE0oJ2zuMr3l7X/SGhA+Ed
	cecL+qG0AKSvwk0VOMjuASekF2IowFLu5YAjglZdws6+drBeqdegQGUCQ==
X-Received: by 2002:a5d:59c5:0:b0:488:583a:715a with SMTP id ffacd0b85a97d-4887174b71dmr24409425f8f.35.1790587348811;
        Mon, 28 Sep 2026 02:22:28 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm24893344f8f.35.2026.09.28.02.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 02:22:27 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-varlink: add recipe
Date: Mon, 28 Sep 2026 10:21:42 +0100
Message-ID: <20260928092140.2252231-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928092140.2252231-2-alex.kiernan@gmail.com>
References: <20260928092140.2252231-2-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 09:22:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130428

Reference Python Varlink binding. Fetched from git as 32.1.0 was never
published to PyPI (latest there is 31.0.0 from 2021).

AI-Generated: Claude Opus 5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python/python3-varlink_32.1.0.bb          | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-varlink_32.1.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 9d07fc44e27a..f84941daf08b 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -440,6 +440,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-ujson \
     python3-unidiff \
     python3-uritemplate \
+    python3-varlink \
     python3-vcversioner \
     python3-versioneer \
     python3-versiontools \
diff --git a/meta-python/recipes-devtools/python/python3-varlink_32.1.0.bb b/meta-python/recipes-devtools/python/python3-varlink_32.1.0.bb
new file mode 100644
index 000000000000..8c532371d0a2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-varlink_32.1.0.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Python implementation of the Varlink protocol"
+HOMEPAGE = "https://github.com/varlink/python"
+SECTION = "devel/python"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
+
+# 32.1.0 is not published on PyPI
+SRC_URI = "git://github.com/varlink/python.git;protocol=https;branch=master"
+SRCREV = "8b3ba4e8206b098c524f538036a941b47797840d"
+
+inherit python_setuptools_build_meta
+
+# Keep the bundled test suite, and its python3-unittest dependency, separate
+PACKAGES =+ "${PN}-tests"
+FILES:${PN}-tests = "${PYTHON_SITEPACKAGES_DIR}/varlink/tests"
+RDEPENDS:${PN}-tests = "${PN} python3-unittest"
+
+RDEPENDS:${PN} = "\
+    python3-core \
+    python3-datetime \
+    python3-io \
+    python3-json \
+    python3-netclient \
+    python3-netserver \
+    python3-shell \
+"

