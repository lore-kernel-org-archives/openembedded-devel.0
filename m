Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255F1C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 06:31:07 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.6440.1709706662451228542
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Mar 2024 22:31:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TbQgxxTW;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d3fd0e6832so6400161fa.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 22:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709706660; x=1710311460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Q8uLf9z3jmDUJ4b3F2m6GTwSoWWkHOF+VJ7J/obAWo=;
        b=TbQgxxTWBzKOH8LzxD6Dg6NsSA6oFGHGw36byP+ey9aPtDSZdcmIqWdspNQ+ot2tTl
         /kGCBgW0H/EJ4+zOwLS+KPl/GDh/timYPhIYaIem0ZK/PnqHH4gFK5EmVR7QlfmsetD7
         0P99y2WXI3mfsIqO1sH9BbNMQb9KtjV5Fn750QX7xPk1m8fNcWqjAsQu3wddsO0dn4mR
         KnoTfV2uUpGOIVPbVf0gjFBU4lFfcmkkD68z+cWVMPva30xctenTFPmS1/ELa8+XHSin
         x6vygPYyDOiLXmFi23ZQp6i6MyusD98cX+/7yT1nrQx6fwIiN8Ai0j84BmTYqtcWH0Jb
         he2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709706660; x=1710311460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Q8uLf9z3jmDUJ4b3F2m6GTwSoWWkHOF+VJ7J/obAWo=;
        b=SdwoQfhrZhqL9/ibc8cZnRBpBcA0b0YoXbwyLv+s5g2w7ytJ5UtKfjf5qUQWF+KInu
         AQPkP9tbrZOdYaL9TTTTNLkUM1Qd7owW36/l8HlFi5LyqS+ksxY7kKJB0t8EbE5apO0m
         hugV0aecQOS01jfhMLoa7MgJ5VLBh4xnLvHxA9Nll+qEG+VAVgLGb1iDSC0aimBNGX8A
         FQGU8+dfquTMGkYHFWGd85jE62vYrGW4xcQH7/QRdHMVKJMk3unK4gBlqAvKsHloFft2
         VxekfcIF200GgkN9/ZAjzHtDHMH06PbHpmfZIeR8sBn/5PeUcmEqb1NbdKqYbjJCVAzv
         qTgw==
X-Gm-Message-State: AOJu0YxvLOezdPj7AFXblHCY3XxXGikQsyK79ffgOxrp1s+D+tjzYAi5
	qrgV9/vkLYz183LdaMV/fZvow4AqFrcKm15SdrNDVLd4qkkZNRM5Zt1hj+i3f48=
X-Google-Smtp-Source: AGHT+IFTOV7yYdxbYTzLo5ZKGQZ22dNkQOwovBfhoAaKu9k1QS3iqiGoQFFxqccq1kpdmaRylRWyPg==
X-Received: by 2002:a2e:bc14:0:b0:2d3:e0ec:36c7 with SMTP id b20-20020a2ebc14000000b002d3e0ec36c7mr3204531ljf.43.1709706659639;
        Tue, 05 Mar 2024 22:30:59 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id by1-20020a056000098100b0033e22341942sm13699430wrb.78.2024.03.05.22.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 22:30:59 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-marshmallow: upgrade 3.20.2 -> 3.21.1 and add ptest
Date: Wed,  6 Mar 2024 09:30:51 +0300
Message-Id: <20240306063051.127428-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 06:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109140

* Upstream provides a pyproject.toml which declares a flit_core.buildapi build backend instead of setuptools.

* Updated runtime dependencies.

* Ptest and library example tested on qemux86-64 and qemuarm64

* Add ptest into PTESTS_SLOW_META_PYTHON

* Upstream, excluded test/mypy_test_cases in the pyproject.toml file. More descriptively,
norecursedirs tells pytest where not to look and tests/mypy_test_cases already defined in it so has been removed from runtime.

	https://github.com/marshmallow-code/marshmallow/blob/df23ad0048b5443346fe47810cda052641558257/pyproject.toml#L89C61-L89C76

License-Update: Removed license year

Ptest result:
==============
qemux86-64:

Testsuite summary
TOTAL: 1228
PASS: 1228
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 56
END: /usr/lib/python3-marshmallow/ptest
2024-03-06T05:33
STOP: ptest-runner
TOTAL: 1 FAIL: 0

qemuarm64:

Testsuite summary
TOTAL: 1228
PASS: 1228
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 51
END: /usr/lib/python3-marshmallow/ptest
2024-03-06T05:28
STOP: ptest-runner
TOTAL: 1 FAIL: 0

=============
Changelog:

3.21.1 (2024-03-04)

Bug fixes:

    Fix error message when field is declared as a class and not an instance (#2245). Thanks @travnick for reporting.

3.21.0 (2024-02-26)

Bug fixes:

    Fix validation of URL fields to allow missing user field, per NWG RFC 3986 (#2232). Thanks @ddennerline3 for reporting and @deckar01 for the PR.

Other changes:

    Backwards-incompatible: __version__, __parsed_version__, and __version_info__ attributes are deprecated (#2227). Use feature detection or importlib.metadata.version("marshmallow") instead.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-marshmallow/run-ptest      |  3 ++
 ....20.2.bb => python3-marshmallow_3.21.1.bb} | 37 ++++++++++++++-----
 3 files changed, 31 insertions(+), 10 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-marshmallow/run-ptest
 rename meta-python/recipes-devtools/python/{python3-marshmallow_3.20.2.bb => python3-marshmallow_3.21.1.bb} (38%)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 99cae21b2..5d9eb0fa1 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -77,6 +77,7 @@ PTESTS_FAST_META_PYTHON = "\
 PTESTS_SLOW_META_PYTHON = "\
     python3-arrow \
     python3-lz4 \
+    python3-marshmallow \
     python3-yappi \
 "
 
diff --git a/meta-python/recipes-devtools/python/python3-marshmallow/run-ptest b/meta-python/recipes-devtools/python/python3-marshmallow/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-marshmallow/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.20.2.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.21.1.bb
similarity index 38%
rename from meta-python/recipes-devtools/python/python3-marshmallow_3.20.2.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_3.21.1.bb
index c08aec5be..5a0a79a54 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.20.2.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.21.1.bb
@@ -3,21 +3,38 @@ DESCRIPTION = "Marshmallow is an ORM/ODM/framework-agnostic library for converti
 HOMEPAGE = "https://github.com/marshmallow-code/marshmallow"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "\
-                    file://LICENSE;md5=653847350fed2e0e7b02791a35b98d59 \
+                    file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "4c1daff273513dc5eb24b219a8035559dc573c8f322558ef85f5438ddd1236dd"
+SRC_URI[sha256sum] = "4e65e9e0d80fc9e609574b9983cf32579f305c718afb30d7233ab818571768c3"
 
-inherit setuptools3 pypi
+inherit python_flit_core pypi ptest
 
 PIP_INSTALL_PACKAGE = "marshmallow"
 
+SRC_URI += " \
+        file://run-ptest \
+"
+
+RDEPENDS:${PN}-ptest += " \
+        python3-pytest \
+        python3-pytz \
+        python3-simplejson \
+        python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/tests
+        rm -rf ${S}/tests/mypy_test_cases
+        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
 RDEPENDS:${PN} += " \
-	python3-core \
-	python3-datetime \
-	python3-netclient \
-	python3-numbers \
-	python3-json \
-	python3-pprint \
-	python3-packaging \
+        python3-compression \
+        python3-datetime \
+        python3-email \
+        python3-json \
+        python3-numbers \
+        python3-pprint \
+        python3-packaging \
 "
-- 
2.25.1


