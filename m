Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0E92B7E1F9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2019 05:10:00 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id p15so3671283pll.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 22:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WuhWrt9LwRO77Abw51pgSthvw8NW6bep+TDnTX2G7MM=;
	b=nCtAcSCAp5ousXU1CUgWbCyBp3A7rWIy4kmE2mu27f9+n7Nm6IJi+k854xXK6QX8KB
	UBle4plv9j4e6hq1FtnKaVyrm0ptXscJh6xWWDtcWbfYGCeCFh3ou5rXpankqrMxrQGR
	0AHexkw8DN8OcGyhxgP8hFFTYzIQE0+QosZYihXJCFJsrq3GjlU1ktmBw1tjjY7RYkUS
	KKcV45638Te9oKO0EYjCeVIBA7PlNmnTy12YIthlL04Vp5zGj4BvjpUq5XxVUZNTWIPm
	H+rO5iINQvAVY8qcFtkrdoKzZ54iMIi6vvR5o5djP+AcBV/Fq7iOo8d+kMdvbz9IGrWA
	ZWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WuhWrt9LwRO77Abw51pgSthvw8NW6bep+TDnTX2G7MM=;
	b=IZi8tAnChfUvnZ3aXTlt4587nVa3O2dQTWW11cD+7KQLMbIfZ1kq8/B9G8C7Ony8zW
	keCyt2h0pLb948RMrO/ScJJI9e290gED2+tAX5vrakv0QbRHluI5+VLScboKadp2k3fm
	7F26df9FJOjG/JXT1qv2dW9RBtwkr8uFXS87miu8ZEV/04oAh9sI3b/O9uH4G7A+PXPG
	aIWmrqQhur+ysKvr+HbM/PvIifo2zb6yw08S5mpydjFW5CvXii1TrwTh4lKkEkzCKCQp
	e+nrl8FiQw1dg6txDMV+K2rHwYCqwkkOZg9Dq1q7QnognHZrC8P/OurJz1JuL4nhD+mj
	ngWg==
X-Gm-Message-State: APjAAAU2Bui71lzzl8Fe1Vx3Lyfx9A+7a1iOVjOA9gCgi3QYDTK2ST0Y
	oXcSz1NgNZEhBUMO9Z/nc5wdqxPpDOs=
X-Google-Smtp-Source: APXvYqxxVQZYwoHamDFCc/C4jDLDDrU7tGwJU8fSH1rSFYWrcvJIFmbzfc4DVcoFHfAQg1VdT4ah/g==
X-Received: by 2002:a17:902:b195:: with SMTP id
	s21mr1232098plr.16.1558674601637; 
	Thu, 23 May 2019 22:10:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::e252])
	by smtp.gmail.com with ESMTPSA id 4sm1212803pfj.111.2019.05.23.22.10.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 22:10:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 22:09:53 -0700
Message-Id: <20190524050953.9647-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190524050953.9647-1-raj.khem@gmail.com>
References: <20190524050953.9647-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] udisks: Remove bash dependency
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
X-List-Received-Date: Fri, 24 May 2019 05:10:01 -0000
Content-Transfer-Encoding: 8bit

There are couple of scripts which explicitly calls out for bash
interpreter but there is nothing bash specific about them, so let
it use sh interpreter.

Fixes
ERROR: QA Issue: /usr/libexec/udisks-helper-mdadm-expand contained in package udisks requires /bin/bash, but no providers found in RDEPENDS_udisks? [file-rdeps]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...r-Use-sh-interpreter-instead-of-bash.patch | 38 +++++++++++++++++++
 .../recipes-support/udisks/udisks_1.0.5.bb    |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-support/udisks/udisks/0001-udisks-helper-Use-sh-interpreter-instead-of-bash.patch

diff --git a/meta-oe/recipes-support/udisks/udisks/0001-udisks-helper-Use-sh-interpreter-instead-of-bash.patch b/meta-oe/recipes-support/udisks/udisks/0001-udisks-helper-Use-sh-interpreter-instead-of-bash.patch
new file mode 100644
index 0000000000..ef7f6f9c32
--- /dev/null
+++ b/meta-oe/recipes-support/udisks/udisks/0001-udisks-helper-Use-sh-interpreter-instead-of-bash.patch
@@ -0,0 +1,38 @@
+From 44953e5501e92c87611be45221338004e8032a74 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 23 May 2019 22:00:14 -0700
+Subject: [PATCH] udisks-helper: Use sh interpreter instead of bash
+
+These scripts do not require bash, since they do not use any bash
+specific extentions
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/helpers/udisks-helper-change-luks-password | 2 +-
+ src/helpers/udisks-helper-mdadm-expand         | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/helpers/udisks-helper-change-luks-password b/src/helpers/udisks-helper-change-luks-password
+index edcf6c9..c71fc72 100755
+--- a/src/helpers/udisks-helper-change-luks-password
++++ b/src/helpers/udisks-helper-change-luks-password
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/usr/bin/env sh
+ set -e
+ 
+ DEVICE=$1
+diff --git a/src/helpers/udisks-helper-mdadm-expand b/src/helpers/udisks-helper-mdadm-expand
+index 8b4e23d..921f96a 100755
+--- a/src/helpers/udisks-helper-mdadm-expand
++++ b/src/helpers/udisks-helper-mdadm-expand
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/usr/bin/env sh
+ 
+ set -e
+ 
+-- 
+2.21.0
+
diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
index 0373749f0f..0918fedda5 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=${BPN} \
            file://0001-Make-udev-rules-directory-configurable.patch \
            file://0001-include-sys-sysmacros.h.patch \
            file://0001-tools-Install-bash_completion-script-in-etc-bash_com.patch \
+           file://0001-udisks-helper-Use-sh-interpreter-instead-of-bash.patch \
            "
 
 SRC_URI[udisks.md5sum] = "70d48dcfe523a74cd7c7fbbc2847fcdd"
-- 
2.21.0


