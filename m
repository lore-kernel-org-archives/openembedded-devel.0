Return-Path: <andrey.z@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6AFC37F2C0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 17:36:30 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id s10so4109994wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 09:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MVEtTe72SAbcC3mqBR/B6/AnxUcIcVSyvUB9wDyLcLg=;
	b=DFPHDke7+iXKciQ4eweVHOHTKdaHmKXCFn6dbIoDGO4Rff5D5ORiDRg88ND7AtACNs
	iYMjQZgV23bEtgFWwjoBsk0cT76ZILeBBO0hH7bQXX2b3iIl0PfperL6fAYPJ+qFpJqs
	cf11666MJ0WyyYHD38NutkfOtpZ9XXQybwTYwHqWT4nscDu6nbE4Xs/FscqJXNXx++0V
	sjqE+ZtQ+hlc7TTZnfHAFaxTMUDmGapBnuCoxgT5OjhjhjdGWRn8Ro9kg5h9AgdL9ny9
	HXnV33dL+zFmrRtFBvKrZEm7A/9/DDJTpAljLLKSJMBUxnLifqzGFPbuT3Sp6hDBKgyA
	5Cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MVEtTe72SAbcC3mqBR/B6/AnxUcIcVSyvUB9wDyLcLg=;
	b=LwlQgSn6axbqh3NR/Je0JG2fpt4zkko9TpwXGSheF1h+07m+E3YaE07vG/+B94hoZS
	C+ZdfPpiXRBY0n70BBXve7IZiTckFzA9pC05DEMQsTQc44Nsfq2BbOil8QI4xJdFw9CF
	pexHoXbOlaiwS2mwe2Ov1qE/qVCWTB5xrkDuGQYTbGKrG7x15jAo+LsyA80L61qbNTP6
	rnI3+wS22aBrWK95lknsBrAXhuIxFvSRBqge2GuuBjuLOW7aH2bWq+h74vl6RcT84eV6
	wYaeixSO6l37EqC51JIYmJy/fG85RqsEXoQt93NfZ9k4/+tLlUVYVhA8mmZo+qFKgro5
	Egxg==
X-Gm-Message-State: APjAAAXslV2LxBGU8B6QJfnMs/2bd+i2D3NX7kFYLEYD0I2IthIJ2ii1
	viE7FHOWNGpt6/cCSm8iW7KNOl6XZHE=
X-Google-Smtp-Source: APXvYqxAuWBcRrSGu08/wn0bbEHRnPKjD7CNzPIkcApy/cPV7SqkibGHto69NkSpwNkLUvPawAj4Dg==
X-Received: by 2002:a7b:c774:: with SMTP id x20mr126994wmk.67.1580146590861;
	Mon, 27 Jan 2020 09:36:30 -0800 (PST)
Received: from aherlnxbspsrv01.lgs-net.com ([193.8.40.126])
	by smtp.gmail.com with ESMTPSA id
	s10sm21916939wrw.12.2020.01.27.09.36.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 09:36:30 -0800 (PST)
From: Andrey Zhizhikin <andrey.z@gmail.com>
X-Google-Original-From: Andrey Zhizhikin
	<andrey.zhizhikin@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jan 2020 17:36:07 +0000
Message-Id: <20200127173608.24874-2-andrey.zhizhikin@leica-geosystems.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127173608.24874-1-andrey.zhizhikin@leica-geosystems.com>
References: <20200127173608.24874-1-andrey.zhizhikin@leica-geosystems.com>
Subject: [meta-oe][PATCH 2/3] libteam: update recipe to use python3
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
X-List-Received-Date: Mon, 27 Jan 2020 17:36:30 -0000

From: Andrey Zhizhikin <andrey.z@gmail.com>

Update recipe to use python3 since python2 is EOL and has been dropped
from OE-Core.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 ...asic_test.py-use-python3-interpreter.patch | 28 +++++++++++++++++++
 .../recipes-support/libteam/libteam/run-ptest |  2 +-
 .../recipes-support/libteam/libteam_1.29.bb   |  3 +-
 3 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/libteam/libteam/0001-team_basic_test.py-use-python3-interpreter.patch

diff --git a/meta-oe/recipes-support/libteam/libteam/0001-team_basic_test.py-use-python3-interpreter.patch b/meta-oe/recipes-support/libteam/libteam/0001-team_basic_test.py-use-python3-interpreter.patch
new file mode 100644
index 000000000..e27e4f329
--- /dev/null
+++ b/meta-oe/recipes-support/libteam/libteam/0001-team_basic_test.py-use-python3-interpreter.patch
@@ -0,0 +1,28 @@
+From 571c141b434dff13494c6a3afe621f63a8e610e9 Mon Sep 17 00:00:00 2001
+From: Andrey Zhizhikin <andrey.z@gmail.com>
+Date: Mon, 27 Jan 2020 14:29:34 +0000
+Subject: [PATCH] team_basic_test.py: use python3 interpreter
+
+Use python3 since python2 is EOL and has been removed from several
+distributions.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
+---
+ scripts/team_basic_test.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/team_basic_test.py b/scripts/team_basic_test.py
+index b05be9e..ad980e8 100755
+--- a/scripts/team_basic_test.py
++++ b/scripts/team_basic_test.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ """
+ Basic test.
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/libteam/libteam/run-ptest b/meta-oe/recipes-support/libteam/libteam/run-ptest
index 4ba5acf05..b5c6f4ebb 100644
--- a/meta-oe/recipes-support/libteam/libteam/run-ptest
+++ b/meta-oe/recipes-support/libteam/libteam/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-python $(dirname $0)/team_basic_test.py
+python3 $(dirname $0)/team_basic_test.py
diff --git a/meta-oe/recipes-support/libteam/libteam_1.29.bb b/meta-oe/recipes-support/libteam/libteam_1.29.bb
index 821ca1938..26c475053 100644
--- a/meta-oe/recipes-support/libteam/libteam_1.29.bb
+++ b/meta-oe/recipes-support/libteam/libteam_1.29.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/jpirko/libteam \
            file://0001-include-sys-select.h-for-fd_set-definition.patch \
            file://0002-teamd-Re-adjust-include-header-order.patch \
            file://0001-team_basic_test.py-disable-RedHat-specific-test.patch \
+           file://0001-team_basic_test.py-use-python3-interpreter.patch \
            file://run-ptest \
            "
 SRCREV = "e897f02bf2403d4859a99e090e34ea768b4c0540"
@@ -32,7 +33,7 @@ FILES_${PN}-utils = "${bindir}/bond2team \
 "
 
 RDEPENDS_${PN}-utils = "bash"
-RDEPENDS_${PN}-ptest = "python"
+RDEPENDS_${PN}-ptest = "python3"
 
 do_install_ptest() {
 	install ${S}/scripts/team_basic_test.py ${D}${PTEST_PATH}/
-- 
2.17.1


