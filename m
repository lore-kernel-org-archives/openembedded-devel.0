Return-Path: <bill.randle@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7DB9E781E4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2017 04:49:48 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id m30so6103600pgn.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Sep 2017 21:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=F3nhDmZTO4KZHwyPhi6AV9hHLro5+6HP9s7USflusJ4=;
	b=ukKSMNvwGyUgU2iaSqUECS0vAXrDABla5T6UG/coP1G8tpq8hD3frOnRCjHJHf/ALw
	nwX92npTbGsksFXn/qWPPByX2TP1vEgOqZ3fmeRvG9A3jq10rmWZkWUiZyQQzCNywcXj
	5iUDVTjfRKVOZfeG9GHHIRCVdXepp8dN364/EBmuL4rvI/HodNRK+zBFTMNj5NwChl/c
	chA09wvmKrnuhTqbeDOaghRFx5VIHBjMeyVIHc6ggpXHBJDoR1J4RFLm5SGgpE3bAYnR
	vLkGcQ3UHoqgUPb0eeDdygg9YaPOa7Wt00zSON8vrssosfbJQZWhlW4l89lL33l/YHJ3
	TgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=F3nhDmZTO4KZHwyPhi6AV9hHLro5+6HP9s7USflusJ4=;
	b=HkI/LxmvqYLNYEKMY3MYWBoPwpDc+NraSH3C5VJ+YS7C82ZdEirtgYQzPN8qNB3hzN
	mpt5psQnYTixa6Wj2q9euYsnykzkDRw4QL7XChv5L6bY/mw9jW3L2NvW0HvoMC7N1JZR
	Ux7rkugZgEeQbwgEtCKbgOVtfdowk8H1KvP6R2g8CJw5q8JURhOOx62g42juQgGhx8Ad
	rdro6nPVpw9/JGLuxaaKXe/NReSVKY7KOtguxEmj3anAMvOBooPPHdcpKoj/QAstMaF0
	KhHNsy0+ezyW1GAk79jRfBeNEyWDsr4sLI2p3WIHihOe58cB3d0rY3I96ndupnbOtGPh
	bNDw==
X-Gm-Message-State: AHPjjUja83RgwcOhCyCwy4w+18sNv2KZe0ENT6l0ApqDRVWq2klRPGaP
	DQVVNlBsV9rBA1R+npTAfQFk1g==
X-Google-Smtp-Source: AOwi7QCetDkv/k0etW5CG6UMq94fopO/aZv6xd6eSPx5rCB0MAeqAG8/kpiMtoPm6UU1psMuYAXuGg==
X-Received: by 10.101.81.77 with SMTP id g13mr9541946pgq.78.1506401389130;
	Mon, 25 Sep 2017 21:49:49 -0700 (PDT)
Received: from neosoft.neocat.org (67-5-150-243.ptld.qwest.net. [67.5.150.243])
	by smtp.gmail.com with ESMTPSA id
	28sm14144011pfl.14.2017.09.25.21.49.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Sep 2017 21:49:48 -0700 (PDT)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Sep 2017 21:49:33 -0700
Message-Id: <1506401373-2054-1-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-can: update to version 2.0.0b1
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
X-List-Received-Date: Tue, 26 Sep 2017 04:49:48 -0000

While 1.5.2 is the latest release on the master branch of python-can, it is over
a year old and many improvements and bugfixes have ben made in the develop branch
that make it worth using over master.

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python-can.inc         | 4 ++--
 meta-python/recipes-devtools/python/python-can_1.5.2.bb    | 4 ----
 meta-python/recipes-devtools/python/python-can_2.0.0b1.bb  | 4 ++++
 meta-python/recipes-devtools/python/python3-can_1.5.2.bb   | 4 ----
 meta-python/recipes-devtools/python/python3-can_2.0.0b1.bb | 4 ++++
 5 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-can_1.5.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python-can_2.0.0b1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-can_1.5.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-can_2.0.0b1.bb

diff --git a/meta-python/recipes-devtools/python/python-can.inc b/meta-python/recipes-devtools/python/python-can.inc
index 1878f31..1dbc809 100644
--- a/meta-python/recipes-devtools/python/python-can.inc
+++ b/meta-python/recipes-devtools/python/python-can.inc
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=38138baa100d7259934590850bc0406e"
 
-SRC_URI[md5sum] = "f653aecf8b9034bbba32cc04ca6a7b6d"
-SRC_URI[sha256sum] = "edabb426e6cd11c2dc7a98980340135aa0eb02143b0d51bf14e3e6178c131cc3"
+SRC_URI[md5sum] = "b2a164887c1c6a2a2490b5afb36e36db"
+SRC_URI[sha256sum] = "b961b6ce75a7f08b586f4d2cae8cdc409881731b851fc405fa21cb16bad00d87"
 
 PYPI_PACKAGE="python-can"
diff --git a/meta-python/recipes-devtools/python/python-can_1.5.2.bb b/meta-python/recipes-devtools/python/python-can_1.5.2.bb
deleted file mode 100644
index ec81a9e..0000000
--- a/meta-python/recipes-devtools/python/python-can_1.5.2.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require python-can.inc
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "python-sqlite3"
diff --git a/meta-python/recipes-devtools/python/python-can_2.0.0b1.bb b/meta-python/recipes-devtools/python/python-can_2.0.0b1.bb
new file mode 100644
index 0000000..ec81a9e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-can_2.0.0b1.bb
@@ -0,0 +1,4 @@
+require python-can.inc
+inherit pypi setuptools
+
+RDEPENDS_${PN} += "python-sqlite3"
diff --git a/meta-python/recipes-devtools/python/python3-can_1.5.2.bb b/meta-python/recipes-devtools/python/python3-can_1.5.2.bb
deleted file mode 100644
index a1d45b8..0000000
--- a/meta-python/recipes-devtools/python/python3-can_1.5.2.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require python-can.inc
-inherit pypi setuptools3
-
-RDEPENDS_${PN} += "python3-sqlite3"
diff --git a/meta-python/recipes-devtools/python/python3-can_2.0.0b1.bb b/meta-python/recipes-devtools/python/python3-can_2.0.0b1.bb
new file mode 100644
index 0000000..a1d45b8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-can_2.0.0b1.bb
@@ -0,0 +1,4 @@
+require python-can.inc
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "python3-sqlite3"
-- 
2.7.4


