Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id A4FFC7FC7C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:28:07 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id q9so9842619wmj.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=1l0ziRM3m740T255hvvXzOE+hwrhT7GMZbs1dmCCBEw=;
	b=bhKUEbS9Al0xCzOBVvIHlbGHHpcCGTdsKnrb5IRHubr3d2a0LsawdjtxtPdnVKt7kG
	8V1KiGTKn5pPrLAAs0sT3xEDwORVvUb1OY6U7ZypNH/0fLmmvrtXGrYCn392oUw3o0iZ
	O2KXaxOW4EZbhjyp9bLHnGr4onxR65TyzmS7FdDMKTi7dt3nC4VszMuoQnzNXpT4g+CH
	CGHPmKvU07PVFIM6oCg/6X1UTIYtF9XNucm7yL+WA2TacY/56AbSc5oDE/Va94Dy/IZZ
	y9z0pW8loWeXwRiSXc/MZiTstveZ9y6/hSEOd1ayI9gHyl/LECmIEhB2ERt+uaZKKBGX
	J0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1l0ziRM3m740T255hvvXzOE+hwrhT7GMZbs1dmCCBEw=;
	b=MrD4EKpWIxTf1PehUJSGe98F0Jf+ko8g/tr/VyPDI7rokHX/IpNUDxXchUorcp0gDQ
	8t1UYw5fcJeNxNCjA5gYI+BPC0wTLAAYZ873fWwFqYvVYdwYNmt0ZPyqySVACKM+IOfM
	dF47o2SxSftAfC0i73g9gj1/RHH8l1DB+IADtV1rJJTOqgAiJI9VA5tzh9fFZskOnmK3
	buqR4MylcI2g6qNSPDKjXYpPLcXYCiGOUGL9eO+kUsLPFGZQWBw/dalOIYnkAC/FoA18
	65ldTDdj9KtfVI5o57qkg98TidfRg6CYkIs4IVmfblf7utaCX0sKMk/MCBj4nt4yfwno
	5aNg==
X-Gm-Message-State: APjAAAVlqQ4gymrkR+zR3kzbkr1XNmZpRQ+AOANxyLHuINT+mgDXetnp
	iWqb+xQu2Z+qG8sbzqQZZylBAOL3Rnk=
X-Google-Smtp-Source: APXvYqwYeFfbC3Y3Wj0Zopzj6t6fgm8KX2RcTNU0/yH2/FGdkmQ+iOnQdPM39LRSro62eACcr8KU0A==
X-Received: by 2002:a05:600c:24d1:: with SMTP id
	17mr9001039wmu.136.1579346887941; 
	Sat, 18 Jan 2020 03:28:07 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CA15804DD3CACFED9DBE9.dip0.t-ipconnect.de.
	[2003:f0:7f3c:a158:4dd:3cac:fed9:dbe9])
	by smtp.gmail.com with ESMTPSA id
	b15sm2965720wmj.13.2020.01.18.03.28.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:28:07 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 12:27:36 +0100
Message-Id: <20200118112757.5287-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200118112757.5287-1-schnitzeltony@gmail.com>
References: <20200118112757.5287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/23] itstool: remove it lives in oe-core now
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
X-List-Received-Date: Sat, 18 Jan 2020 11:28:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-build-time-hardcoded-python-binary-.patch | 35 -------------------
 ...ld-time-hardcoded-python-binary-path.patch | 29 ---------------
 .../recipes-support/itstool/itstool_2.0.6.bb  | 20 -----------
 3 files changed, 84 deletions(-)
 delete mode 100644 meta-oe/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch
 delete mode 100644 meta-oe/recipes-support/itstool/itstool/0002-Don-t-use-build-time-hardcoded-python-binary-path.patch
 delete mode 100644 meta-oe/recipes-support/itstool/itstool_2.0.6.bb

diff --git a/meta-oe/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch b/meta-oe/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch
deleted file mode 100644
index 19a858bd7..000000000
--- a/meta-oe/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 335ef14fc801c9dfbe7e5692dc71cfbe72049d2b Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Sun, 27 Oct 2019 16:38:52 +0100
-Subject: [PATCH] Native: Don't use build time hardcoded python binary path.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This is same patch as used for target build except that we do not use the
-'-S' and '-s' option because '-S' is relatively young [1] and elder build-host
-don't support it [2]
-
-[1] https://github.com/coreutils/coreutils/commit/668306ed86c8c79b0af0db8b9c882654ebb66db2#diff-83d9d52b1f12ac589739ab1334ae4f30
-[2] https://errors.yoctoproject.org/Errors/Details/274743/
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- itstool.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/itstool.in b/itstool.in
-index e64cd34..05d264f 100755
---- a/itstool.in
-+++ b/itstool.in
-@@ -1,4 +1,4 @@
--#!@PYTHON@ -s
-+#!/usr/bin/env python3
- #
- # Copyright (c) 2010-2018 Shaun McCance <shaunm@gnome.org>
- #
--- 
-2.21.0
-
diff --git a/meta-oe/recipes-support/itstool/itstool/0002-Don-t-use-build-time-hardcoded-python-binary-path.patch b/meta-oe/recipes-support/itstool/itstool/0002-Don-t-use-build-time-hardcoded-python-binary-path.patch
deleted file mode 100644
index b91105330..000000000
--- a/meta-oe/recipes-support/itstool/itstool/0002-Don-t-use-build-time-hardcoded-python-binary-path.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From cd9b56224895576125e91cca317ace8a80f3eb77 Mon Sep 17 00:00:00 2001
-From: Piotr Tworek <tworaz@tworaz.net>
-Date: Sat, 27 Jul 2019 10:19:11 +0200
-Subject: [PATCH] Don't use build time hardcoded python binary path.
-
-This path obviously won't work on target since they refer to build
-machine directory structure. Native builds will also fail if local.conf
-has INHERIT+=rm_work. Instread of hardcoding path to python binary use
-whatever is found in PATH first. This should also allow the tool to use
-python3 binary provided in recipe-sysroot-native.
-
-Upstream-Status: Inappropriate [OE specific]
----
- itstool.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/itstool.in b/itstool.in
-index b3c0033..7df2476 100755
---- a/itstool.in
-+++ b/itstool.in
-@@ -1,4 +1,4 @@
--#!@PYTHON@ -s
-+#!/usr/bin/env -S python3 -s
- #
- # Copyright (c) 2010-2018 Shaun McCance <shaunm@gnome.org>
- #
---
-2.21.0
-
diff --git a/meta-oe/recipes-support/itstool/itstool_2.0.6.bb b/meta-oe/recipes-support/itstool/itstool_2.0.6.bb
deleted file mode 100644
index 8290c5e58..000000000
--- a/meta-oe/recipes-support/itstool/itstool_2.0.6.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "ITS Tool allows you to translate your XML documents with PO files"
-HOMEPAGE = "http://itstool.org/"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59c57b95fd7d0e9e238ebbc7ad47c5a5"
-
-inherit autotools python3native
-
-DEPENDS = "libxml2-native"
-
-SRC_URI = "http://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2"
-SRC_URI_append_class-native = " file://0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch"
-SRC_URI_append_class-target = " file://0002-Don-t-use-build-time-hardcoded-python-binary-path.patch"
-
-SRC_URI[md5sum] = "4306eeba4f4aee6b393d14f9c3c57ca1"
-SRC_URI[sha256sum] = "6233cc22726a9a5a83664bf67d1af79549a298c23185d926c3677afa917b92a9"
-
-BBCLASSEXTEND = "native"
-
-RDEPENDS_${PN} += "libxml2-python"
-RDEPENDS_${PN}_class-native = ""
-- 
2.21.0


