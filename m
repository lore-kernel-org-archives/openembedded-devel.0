Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id BA8F67F867
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 20:17:58 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id z3so851361wru.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 12:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=C0lWpck9/T2EVK2OKLq6S7ER3kGGQR/RmweLdQGjsT8=;
	b=ZbbO/8vlmPaKiiIU5JzQmR6MzWhGPxVa6eaBKX/nA7IqOKeG9KZLuQYBNqxEJ6FtIC
	JEPeXXxJl89WXz/EzfOiiKeBK5RFqbwm7zvVhq1Z6/HvVokpws/3TwMleJ83M4ww+/ic
	CmGaWehTg/5chj5OOkBrH5FvxN8n2NP1SGSCWY6f1jFLTpt+O67Y90hGgADHxcJJGcvF
	xZK/s+47NW+zkqLfLo4C1QOkqhG8TzlN4zAfQh9Rmen67fE6jsKfT1MPR8SnwcKxqXG0
	BmaTfwhQZAMkY2n/46RjY+S3v2kepwXPlTjlUFIkpIBap6+M8GzZSZEBousIHWPba8br
	yLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=C0lWpck9/T2EVK2OKLq6S7ER3kGGQR/RmweLdQGjsT8=;
	b=HYQHjFdTaA2Z55NrJGzWpFUpaeYt+XtLuSfqzc4q4HPcxjp6dNXup8l+msL4xRk2RI
	AnC7sKsnMRTRkojcRJM9vsDRAB/WK9l/VzUg687NGlqGtuPsmYCpC1W26pEYR5YFWibI
	1hn7ce5a7Enzg/bhQrdP0crKHP2tdA+HdgpWKKUK5JWFjp0ZqJQJNVa/mCgRTWAX0Esd
	JjxThpeb8B1THnkn9gdPF+BSQgd3um9TC6sG04SWHUqAgdpuQTu0LzaVjMaqLSEL6Cb4
	RZyBCuSLY0W6A4Ft8cZQePpQ/+Th1JSgZYr6aDdsNtuJcaecA/VSz5QoD2fsIT8Lmkyy
	R3IA==
X-Gm-Message-State: APjAAAX/V3faqE45R716i42ElSw/Qft9ALrvalmFIx0DmmKwKmvswAKq
	7D24/wjHRuTVNBHO1nSxnk2qbh7vcUQ=
X-Google-Smtp-Source: APXvYqwdwP9XC8T5QUmUKsWODMp7skzrvkQpnQN2zdVW3lY4vKfLyg5A6debsM9rJBVNY8E5AcwiWg==
X-Received: by 2002:adf:e641:: with SMTP id b1mr1237303wrn.34.1579551479358;
	Mon, 20 Jan 2020 12:17:59 -0800 (PST)
Received: from lab-linux-pc.tendawifi.com (cable-static2-2-7.rsnweb.ch.
	[146.185.2.7]) by smtp.gmail.com with ESMTPSA id
	d8sm50174339wre.13.2020.01.20.12.17.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 12:17:58 -0800 (PST)
From: Andrey Zhizhikin <andrey.z@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Jan 2020 20:17:50 +0000
Message-Id: <20200120201750.29842-4-andrey.z@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120201750.29842-1-andrey.z@gmail.com>
References: <20200120201750.29842-1-andrey.z@gmail.com>
Subject: [meta-python][PATCH 3/3] meta-python: update recipes to use python3 classes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Jan 2020 20:17:59 -0000

Update recipes to use python3 classes instead of deprecated python2
variants.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 meta-python/recipes-connectivity/gateone/gateone_git.bb         | 2 +-
 .../recipes-connectivity/telepathy/telepathy-python_0.15.19.bb  | 2 +-
 meta-python/recipes-devtools/python-jsonref/python-jsonref.inc  | 2 +-
 meta-python/recipes-devtools/python/pamela_0.3.0.bb             | 2 +-
 meta-python/recipes-devtools/python/pyrtm_0.4.2.bb              | 2 +-
 meta-python/recipes-devtools/python/python-yappi.inc            | 2 +-
 .../python/python3-robotframework-seriallibrary_0.3.1.bb        | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-python/recipes-connectivity/gateone/gateone_git.bb b/meta-python/recipes-connectivity/gateone/gateone_git.bb
index 5d2ca00ef..37d356452 100644
--- a/meta-python/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-python/recipes-connectivity/gateone/gateone_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/liftoff/GateOne.git;branch=master \
 
 S = "${WORKDIR}/git"
 
-inherit setuptools python-dir systemd update-rc.d
+inherit setuptools3 python3-dir systemd update-rc.d
 
 DISTUTILS_INSTALL_ARGS += " \
     --install-data=${PYTHON_SITEPACKAGES_DIR} \
diff --git a/meta-python/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb b/meta-python/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
index b7aea24a7..2e8da0805 100644
--- a/meta-python/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
+++ b/meta-python/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz
 
 PR = "r6"
 
-inherit autotools pythonnative
+inherit autotools python3native
 
 SRC_URI[md5sum] = "f7ca25ab3c88874015b7e9728f7f3017"
 SRC_URI[sha256sum] = "244c0e1bf4bbd78ae298ea659fe10bf3a73738db550156767cc2477aedf72376"
diff --git a/meta-python/recipes-devtools/python-jsonref/python-jsonref.inc b/meta-python/recipes-devtools/python-jsonref/python-jsonref.inc
index 0e69e4534..45deb09c7 100644
--- a/meta-python/recipes-devtools/python-jsonref/python-jsonref.inc
+++ b/meta-python/recipes-devtools/python-jsonref/python-jsonref.inc
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a34264f25338d41744dca1abfe4eb18f"
 SRC_URI[md5sum] = "42b518b9ccd6852d1d709749bc96cb70"
 SRC_URI[sha256sum] = "f3c45b121cf6257eafabdc3a8008763aed1cd7da06dbabc59a9e4d2a5e4e6697"
 
-inherit pypi setuptools
+inherit pypi setuptools3
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/pamela_0.3.0.bb b/meta-python/recipes-devtools/python/pamela_0.3.0.bb
index 030c22f8f..b6bee0ca2 100644
--- a/meta-python/recipes-devtools/python/pamela_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/pamela_0.3.0.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "1e198446a6cdd87704aa0def7621d62e7c20b0e6068e2788b9a866a835
 
 PYPI_PACKAGE = "pamela"
 
-inherit pypi setuptools
+inherit pypi setuptools3
 
 RDEPENDS_${PN} = "libpam"
 
diff --git a/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb b/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
index 9d851abe3..798daeb21 100644
--- a/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
+++ b/meta-python/recipes-devtools/python/pyrtm_0.4.2.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE_EXT = "tar.bz2"
 SRC_URI[md5sum] = "7c87da94656b620dfe532ca63d642eb8"
 SRC_URI[sha256sum] = "b2d701b25ad3f9a1542057f3eb492c5c1d7dbe2b8d1e8f763043dcc14ee1d933"
 
-inherit pypi setuptools
+inherit pypi setuptools3
 
 PACKAGES =+ "${PN}-tests ${PN}-samples"
 
diff --git a/meta-python/recipes-devtools/python/python-yappi.inc b/meta-python/recipes-devtools/python/python-yappi.inc
index 54d408742..b3718d7d1 100644
--- a/meta-python/recipes-devtools/python/python-yappi.inc
+++ b/meta-python/recipes-devtools/python/python-yappi.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9a193c13f346884e597acdcac7fe9ac8"
 SRC_URI[md5sum] = "a545101aa8a435b0780f06f4723f58c8"
 SRC_URI[sha256sum] = "7f814131515d51db62b1a3468bcb84de30499124752806a5a6e11caf0b4344bf"
 
-inherit pypi setuptools
+inherit pypi setuptools3
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
diff --git a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb
index 440f69cbf..d82b7b96a 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework-seriallibrary_0.3.1.bb
@@ -1,2 +1,2 @@
-inherit pypi setuptools
+inherit pypi setuptools3
 require python-robotframework-seriallibrary.inc
-- 
2.17.1


