Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D3DCCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 17:40:35 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2535.1762796430460972980
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 09:40:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KiwDbjeS;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b39d51dcfso681251f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 09:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762796429; x=1763401229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7TQk+MwScaM9LokbIEPIlRc/I93AjvTWSd+0PeyrDs=;
        b=KiwDbjeSLBi2BL+npfkTSNdhoekJGumbBb8R0nnaFk9jxMTN6Jk2qXbcmQcEACsNIQ
         Twkat8LqO1TNYeaGkj12Pr7dSw0MT1Su5nn06Np+vwSpjM4uhPojy/Gmf/Vb3PFRxb5U
         It429ULBzLXxmPCDJ50QUauo/HuJdpH5z98eoEid676cw/dj6qaFIc6dGrJ7qHVdGfn2
         SqLSURuPhjRC9SjXj9EZLz5PKlnmdSQuZwCHSzaU6je83eNmpp9NPdrceMXuxZeneSRh
         VxmDY4bFMEQpHMLywEufT/ZO6fFXsSG4S3UuPqi4AtbFcDZAyR+sVWrPAzvSRXgpvxsk
         U9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762796429; x=1763401229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7TQk+MwScaM9LokbIEPIlRc/I93AjvTWSd+0PeyrDs=;
        b=V/bufMYUTuOITkNK8AHAz/7s3jSnx0dBywu9GPovMbA6DvEM2FLjZFmc83itQN9Uri
         GUtmyajfDgAzoXwTAOOzdbZ3+WXl1xJQ/523uSaTFiFbv28rY81B+0v3dDmJzr3ztRGw
         S0oWlJ2Lf62Yo6+ywgGwAwWKAaIDAj8X6Rh4EJLSSDdwNosAqNTUzRRlDsEWRRF9owcz
         LTbGWNq9J2YpS91fQb0nHkQyzSINO+jARpCFwK1sP5NOVZpWMSRMFzUa0pEaRNLNdqez
         o37w92Tm6wP6y2WMOn8v0bwyzHcRNitza0r1NnGZ+B3f+wIDoyBP9AINPNU7nyVI8Jpo
         ItRA==
X-Gm-Message-State: AOJu0YyeUHtIdIkzGYQQ7sJOMLyeuJ+g1AqPawYRTGeFFfRVaQ6pX7at
	lm8zdnwAw+yxYhNKgQ9sxRgwQ/aZ08EfaXkOEoX0yAnJGO0sMLotjJPBtka2TuO0
X-Gm-Gg: ASbGncsUy5gks2JOjvCz1OyWP62PkB2lzuUovq5xKUXGJYt2+6s2ABJduPHy6JtA5mn
	EfWJ3LsgzC9IBdZ5SdgozXqwiVnQf2YmEf4b+hpi23InDUeow5WGKSSyzgQ0tmHF/82jVaF6WMd
	yal9gcyXkBw3mnldXjhAw1YeCU0LY6IE/rR4mUr5UJgAQJBk7UZxYo4qhwAZKdAXqkRpa4C+f+e
	Fla3FwX24t3pFZDbGpFEfMEyW0wVKUOtn9yIc/7tCC7o0slABVfiAIV98j+2xbBdhgqaksST7mO
	L/RZe7qBe0CMN94OHLo7OTW1W84HoQzPKKzl38EIEIKQkYajwFO44m9NkCVoFHSVG7erMLMhU5b
	luIjRpDYysFyTKgXNVkd+czLNMENipAQV00cvpIizParXabO2MPpVPmlaMd93sJNkpjDoB+eSyr
	6DyEFL5riKm/EhIQd1jIrE986m+c8C2LCgbzvfJZUbzSx3WBvUxCAnB3MH4OB6gX7iszRnFqSHu
	f/6vrNHMbnZC6VUYhBsyIsLUowUh0S8fbjYr/V3n9E5w2ya6tVFTikTThO8+Q==
X-Google-Smtp-Source: AGHT+IGhkoAuqg1DqXFOO9t1Y+jGLJdqrODMcvtAkKdgRjzkCvImeVDql0G7mxiyHhl57Rcoy7RZTQ==
X-Received: by 2002:a05:6000:4212:b0:42b:3cc6:a4d7 with SMTP id ffacd0b85a97d-42b3cc6a731mr2629114f8f.37.1762796428454;
        Mon, 10 Nov 2025 09:40:28 -0800 (PST)
Received: from localhost.localdomain (2a02-1812-512-2c00-5cba-763c-2ed2-f98a.ip6.access.telenet.be. [2a02:1812:512:2c00:5cba:763c:2ed2:f98a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2e96441dsm15954520f8f.23.2025.11.10.09.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 09:40:27 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: t.f.g.geelen@gmail.com,
	Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH v2] python3-python-dotenv: new recipe (1.2.1)
Date: Mon, 10 Nov 2025 18:40:22 +0100
Message-ID: <20251110174023.359922-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 17:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121469

Moving the recipe from meta-homeassistant to meta-opemembedded.

+ version bump 1.1.1 -> 1.2.1
+ add ptest
  - exclude 2 tests (oe-specific)
  - added to PTESTS_FAST_META_PYTHON

v2: += for -ptest (Thanks Gyorgy Sarvari)

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 ...y-skip-two-test-when-running-as-root.patch | 39 +++++++++++++++++++
 .../python/python3-python-dotenv_1.2.1.bb     | 22 +++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-python-dotenv/0001-test_main.py-skip-two-test-when-running-as-root.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index f0411f269f..43518ea2c8 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -65,6 +65,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-pydantic \
     python3-pydantic-core \
     python3-pylint \
+    python3-python-dotenv \
     python3-python-multipart \
     python3-ptyprocess \
     python3-py-cpuinfo \
diff --git a/meta-python/recipes-devtools/python/python3-python-dotenv/0001-test_main.py-skip-two-test-when-running-as-root.patch b/meta-python/recipes-devtools/python/python3-python-dotenv/0001-test_main.py-skip-two-test-when-running-as-root.patch
new file mode 100644
index 0000000000..154ab559a4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-python-dotenv/0001-test_main.py-skip-two-test-when-running-as-root.patch
@@ -0,0 +1,39 @@
+From 68e4f05ece6b20e8a7d914d047185483373db759 Mon Sep 17 00:00:00 2001
+From: Jan Vermaete <jan.vermaete@gmail.com>
+Date: Mon, 10 Nov 2025 18:04:27 +0100
+Subject: [PATCH 1/1] test_main.py: skip two test when running as root
+
+Upstream-Status: Inappropriate [oe-specific]
+
+The patch will only work for Linux and not for Windows.
+And it's not common to run the tests of a Python module as root in the
+not Yocto world.
+
+Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
+---
+ tests/test_main.py | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/test_main.py b/tests/test_main.py
+index 4496111..182bc33 100644
+--- a/tests/test_main.py
++++ b/tests/test_main.py
+@@ -61,6 +61,7 @@ def test_set_key_encoding(dotenv_path):
+     assert dotenv_path.read_text(encoding=encoding) == "a='é'\n"
+ 
+ 
++@pytest.mark.skipif(os.geteuid() == 0, reason="Skipping becuase user is root")
+ def test_set_key_permission_error(dotenv_path):
+     dotenv_path.chmod(0o000)
+ 
+@@ -167,6 +168,7 @@ def test_unset_encoding(dotenv_path):
+     assert dotenv_path.read_text(encoding=encoding) == ""
+ 
+ 
++@pytest.mark.skipif(os.geteuid() == 0, reason="Skipping becuase user is root")
+ def test_set_key_unauthorized_file(dotenv_path):
+     dotenv_path.chmod(0o000)
+ 
+-- 
+2.47.3
+
diff --git a/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb b/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
new file mode 100644
index 0000000000..58784fcf2e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Read key-value pairs from a .env file and set them as environment variables"
+HOMEPAGE = "https://github.com/theskumar/python-dotenv"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e914cdb773ae44a732b392532d88f072"
+RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
+
+SRC_URI[sha256sum] = "42667e897e16ab0d66954af0e60a9caa94f0fd4ecf3aaf6d2d260eec1aa36ad6"
+
+SRC_URI += "file://0001-test_main.py-skip-two-test-when-running-as-root.patch"
+
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+# Uncomment this line to enable all the optional features.
+#PACKAGECONFIG ?= "cli"
+PACKAGECONFIG[cli] = ",,,python3-click"
+
+PYPI_PACKAGE = "python_dotenv"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
+RDEPENDS:${PN}-ptest += "\
+    python3-sh \
+"
-- 
2.47.3


