Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7ADB57FE5B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 21:04:24 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id y11so13331324wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 13:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Pr0u7+3slJ5RtnntYqPBV/bs8f1FsGQZKpkoiDuDTiI=;
	b=YeQKR3z7NlTMwfwXUyT3h1t4m/Fina5FEJkFxRRHM52Gm0QI0NOB7m4OBG9t45BCeQ
	58VsEr1iEYoRuUXk8FAF0Pk5BTSZO4M/8Y3HbbH9eYJT7arYwr6vV4MHgNmswGa+wctC
	U3SAEM/Ew6n25JcoM50VssbJjCV/a9yDrDvk4EzwOWxprmabGS0Yz5Bxlve+9zfpBaYo
	sKen3sTZzypWRtAh7dtPKL7XvxLNXiGnd7Q/6LvxJBa6cDuFU1ap7Am1+Yr4J21CZ9/m
	z6wN6BOnPleIWMidUp9XUMItalmEjGiIAR0RrzxjZPJjduP/zGSZkAY1w4/q9gc7SD4X
	eVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Pr0u7+3slJ5RtnntYqPBV/bs8f1FsGQZKpkoiDuDTiI=;
	b=lp5FGzjRcgp3fHie/jfYgkifiNFjEBxKk5Ao6wCbG3+6WqKxuSGP9qPyerJzux0mgU
	n3ll+joWTsCbEiI0G6yTZdYNzkjClLmHer5MMkaa9T77XL+BkVsjEYR0NStHGDBSMS5w
	vhd+U29TmFjlWiVE3PN5puUUtAGdkrtltpYt450zTgrnblBvNpkOyeN/CjK2TrSi8fis
	XMGcjKsw2xIZbay7HO62ktkOrxns4QVy569z9u6h21Bl8pP+9qOT63QZ8AaQqeb2wYwt
	BxJqprjrYq4oRr4QUlOI3vsYvwIrW1iw+hxZt3EeBqtvum5yj9Ec4mQhiQRZuylDM42t
	GE0w==
X-Gm-Message-State: APjAAAWomqQhnly/4w8RyBwAYKFtqNbn8pCauRVm1UAmfBLA3XaQJoPC
	mqfqj7rRGYhTKygdLEbmXbFyIJ8QaCk=
X-Google-Smtp-Source: APXvYqwtbKY4zL5D45mFYVug/ihl0ieKI23m6OKJP7d2kQ7ZNJs8dkZjFFuWFoPtm03rDY/DNb/N0A==
X-Received: by 2002:adf:e6d2:: with SMTP id y18mr23673475wrm.262.1580159064999;
	Mon, 27 Jan 2020 13:04:24 -0800 (PST)
Received: from lab-linux-pc.tendawifi.com (cable-static2-2-7.rsnweb.ch.
	[146.185.2.7]) by smtp.gmail.com with ESMTPSA id
	m3sm21787004wrs.53.2020.01.27.13.04.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 13:04:24 -0800 (PST)
From: Andrey Zhizhikin <andrey.z@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jan 2020 21:04:13 +0000
Message-Id: <20200127210414.25338-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v2 1/2] libteam: update recipe to use python3
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
X-List-Received-Date: Mon, 27 Jan 2020 21:04:24 -0000

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
index 821ca1938..4ccc280da 100644
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
+RDEPENDS_${PN}-ptest = "python3-core"
 
 do_install_ptest() {
 	install ${S}/scripts/team_basic_test.py ${D}${PTEST_PATH}/
-- 
2.17.1


