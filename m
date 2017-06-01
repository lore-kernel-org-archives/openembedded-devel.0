Return-Path: <moritz.fischer@ettus.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 482EE77D2F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jun 2017 16:43:16 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id 9so31960529pfj.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jun 2017 09:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zJy3LMPkjrGKPidFLoQvOz/+r3k4p2vQvIX6hSlT2n0=;
	b=OHTRHowLfSCgoX96LXZ2wJkKfRdVvcdA0GNlG2MACSi6KAhRBXhoddgt8f9Hn1JOsE
	2o3U/o+R7kQovKhGW88Tb6O7+5ejjZycOZqXHdosGmXF+TRAlOK0eyBUWa3U9Es42M/5
	hdUJZFydfkD/vxOJR6kB7OIkZCpng9klYKaC0gQKXy+yCPbgt5vp3i9bPQ9QbUZHpl3P
	RMiow/vRbslcOR1Ej7VjK5GhtSVKxwXfgIDPDR8it8QTZy0RdixELYlqAVQESNDGyFhf
	RNQBDiM/NPsPW70K6jtFmkukjPN4O/jxR5X382pgFyUgMcMPgepwqQ17LP5cqcv7JubI
	pr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zJy3LMPkjrGKPidFLoQvOz/+r3k4p2vQvIX6hSlT2n0=;
	b=pfxuqjjnVOlke8CPfHoQW3IWFnpNqhJnyxH55LH6dPpGGI16RMdh5o16IypRn22MVM
	YgPnC9m/uJZpHEPCFDvm0Hlc1W8b7/zxvWlztca308+jL6DnQdj0Vz3qVXiJod95Fh1Q
	xDUL8T/OkXyoauu135lS80fLqPsEpgUnZm1jmkqzc3lN9bZ3X/s0vWuwWFw0KjPG9TcA
	aEfHhxyViY16cEvV/BIlxe0mXhjOV/kzzQLcJyygOsx7r7JeX3pt+fmuJrOdOjVUPJr8
	FxRsKMLqvke+O0HoXaUTNhAggKCF74Fy3ZgdKy2eAtg7MLZL/ZDtlgDgW8DyR7LCsHFL
	Jz0A==
X-Gm-Message-State: AODbwcBQdyvjjUbQ1MSqjxYelxOGQuURsut8iZ0lYivbC9WCfBuFWeZS
	WDqCIf2OyYWvcwwrFsuiCg==
X-Received: by 10.98.89.201 with SMTP id k70mr1880028pfj.196.1496335398065;
	Thu, 01 Jun 2017 09:43:18 -0700 (PDT)
Received: from tyrael.ni.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	19sm30635779pfz.39.2017.06.01.09.43.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Jun 2017 09:43:17 -0700 (PDT)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Jun 2017 09:42:54 -0700
Message-Id: <1496335374-25575-8-git-send-email-moritz.fischer@ettus.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1496335374-25575-1-git-send-email-moritz.fischer@ettus.com>
References: <1496335374-25575-1-git-send-email-moritz.fischer@ettus.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 8/8] python-pyroute: Add support for python3
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
X-List-Received-Date: Thu, 01 Jun 2017 16:43:17 -0000

Extend recipe to support python3

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 .../recipes-devtools/python/python-pyroute2.inc    | 26 ++++++++++++++++++++++
 .../python/python-pyroute2_0.3.22.bb               | 26 ++--------------------
 .../python/python3-pyroute2_0.3.22.bb              |  2 ++
 3 files changed, 30 insertions(+), 24 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pyroute2.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pyroute2_0.3.22.bb

diff --git a/meta-python/recipes-devtools/python/python-pyroute2.inc b/meta-python/recipes-devtools/python/python-pyroute2.inc
new file mode 100644
index 0000000..da1d4cd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyroute2.inc
@@ -0,0 +1,26 @@
+SUMMARY = "A pure Python netlink and Linux network configuration library"
+LICENSE = "GPLv2 & Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://LICENSE.Apache.v2;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[md5sum] = "733adb362b6603c7269c0b3df3045a55"
+SRC_URI[sha256sum] = "5cdf44656cf623369f0cbf183d9d14a1a50ebdffbd50d4e30ffda62c0a05d7b3"
+
+SRC_URI += "file://import-simplejson-as-json.patch"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyroute2:"
+
+inherit pypi
+
+RDEPENDS_${PN} += "\
+  ${PYTHON_PN}-distutils \
+  ${PYTHON_PN}-simplejson \
+  ${PYTHON_PN}-multiprocessing \
+  ${PYTHON_PN}-io ${PYTHON_PN}-pprint \
+  ${PYTHON_PN}-pickle \
+  ${PYTHON_PN}-logging \
+  ${PYTHON_PN}-threading \
+  ${PYTHON_PN}-textutils \
+  ${PYTHON_PN}-subprocess \
+  ${PYTHON_PN}-netclient \
+"
diff --git a/meta-python/recipes-devtools/python/python-pyroute2_0.3.22.bb b/meta-python/recipes-devtools/python/python-pyroute2_0.3.22.bb
index 79d3bdd..7b9c8e0 100644
--- a/meta-python/recipes-devtools/python/python-pyroute2_0.3.22.bb
+++ b/meta-python/recipes-devtools/python/python-pyroute2_0.3.22.bb
@@ -1,24 +1,2 @@
-SUMMARY = "A pure Python netlink and Linux network configuration library"
-LICENSE = "GPLv2 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://LICENSE.Apache.v2;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-SRC_URI[md5sum] = "733adb362b6603c7269c0b3df3045a55"
-SRC_URI[sha256sum] = "5cdf44656cf623369f0cbf183d9d14a1a50ebdffbd50d4e30ffda62c0a05d7b3"
-
-SRC_URI += "file://import-simplejson-as-json.patch"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-  python-distutils \
-  python-simplejson \
-  python-multiprocessing \
-  python-io python-pprint \
-  python-pickle \
-  python-logging \
-  python-threading \
-  python-textutils \
-  python-subprocess \
-  python-netclient \
-"
+require python-pyroute2.inc
+inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.3.22.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.3.22.bb
new file mode 100644
index 0000000..a23e72c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.3.22.bb
@@ -0,0 +1,2 @@
+require python-pyroute2.inc
+inherit setuptools3
-- 
2.7.4


