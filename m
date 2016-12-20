Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id B5DDE77236
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 05:33:57 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c4so8372307pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 21:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qEAd7hR9moI52sU0rEAPnc9NZl3YBwGbjtyyRbTjQTY=;
	b=ZSbOrLutGbSzegyaDssSBR6VSYnecAOmRrnVJ+DNx+UKIDnXI9mUMI3P4pkF5lAp3+
	7m4Vii3cwyjDHTB6KQp0HlyWSmqJBdWVJ9PMJj4D3D5yJUeirGV6389QIUqJgFmm7a/h
	CTF3O0kx2iJ3lDDj/EesUUBweK31vBxWhGwetxeE+Z9WlSL/+2EYrnNe5UjTTYVwKXVu
	RzDigqnO0n3uY7zLBeuhYVRzo8NlLjcobTkj8oe/p41wazaE3IItWhT8pb24nk2UxgG6
	40MhGm8zltCecH07dPB/KPJPThOnOZme6iwOi9Efzm4K44Nvjlz8uKqZ04tS9KlWlZra
	U8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qEAd7hR9moI52sU0rEAPnc9NZl3YBwGbjtyyRbTjQTY=;
	b=G9YpVmor9+RXUNlFLQukto0bz3NPNIFonA8i52ZMYKoUWUuE3Q/1VpeXAH3yvRrVcL
	0qI6RwLfNORKVPstI+fKdoBhjEfyYxcm70G+VKpB2auN9yFzzggcVQ3pQyGGbm6z3JpX
	XlTvQZzT+0mgFODvvas5gx/7NCuOEm9FoqPJ/Kfqo1PTvXGp5mYh1GYEwRdMUNabQDLi
	WioNJCyUovw80I+1uvCbk8Ja3c8tGfpOEdSJdWfqLoRt0NAY1bfEcsvWREq7ze/rv6L3
	JCl8mpg1wVYw5MhMei520aA2ppJrLi+qImQc1E/WsY4Lvw1oOkeM/ekBa7xV4cBeyn+q
	+z1w==
X-Gm-Message-State: AIkVDXKnGDnuCpuZB8ybhp5I/g2Nz0wdvLXAQyZcRcBP9gs+qBTF0h0MknYEECebo74qow==
X-Received: by 10.84.217.10 with SMTP id o10mr2954711pli.132.1482212038607;
	Mon, 19 Dec 2016 21:33:58 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	y89sm35200123pfk.83.2016.12.19.21.33.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Dec 2016 21:33:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Dec 2016 21:33:51 -0800
Message-Id: <20161220053351.4499-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH V2] yajl_1.0.12: Add recipe for yajl1
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
X-List-Received-Date: Tue, 20 Dec 2016 05:33:58 -0000

yajl1 and yajl2 are not ABI compatible, therefore
add a recipe for latest release of yajl1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../yajl-1.0.12/0001-bump-version-to-1.0.12.patch  | 25 ++++++++++++++++++++++
 meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb       | 21 ++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/yajl/yajl-1.0.12/0001-bump-version-to-1.0.12.patch
 create mode 100644 meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb

diff --git a/meta-oe/recipes-devtools/yajl/yajl-1.0.12/0001-bump-version-to-1.0.12.patch b/meta-oe/recipes-devtools/yajl/yajl-1.0.12/0001-bump-version-to-1.0.12.patch
new file mode 100644
index 000000000..5e8aef051
--- /dev/null
+++ b/meta-oe/recipes-devtools/yajl/yajl-1.0.12/0001-bump-version-to-1.0.12.patch
@@ -0,0 +1,25 @@
+From 17b1790fb9c8abbb3c0f7e083864a6a014191d56 Mon Sep 17 00:00:00 2001
+From: Lloyd Hilaiel <lloyd@hilaiel.com>
+Date: Mon, 25 Apr 2011 12:56:24 -0600
+Subject: [PATCH] bump version to 1.0.12
+
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 727a488..c703244 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -34,7 +34,7 @@ PROJECT(YetAnotherJSONParser C)
+ 
+ SET (YAJL_MAJOR 1)
+ SET (YAJL_MINOR 0)
+-SET (YAJL_MICRO 11)
++SET (YAJL_MICRO 12)
+ 
+ SET (YAJL_DIST_NAME "yajl-${YAJL_MAJOR}.${YAJL_MINOR}.${YAJL_MICRO}")
+ 
+-- 
+2.11.0
+
diff --git a/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb b/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
new file mode 100644
index 000000000..f8451a406
--- /dev/null
+++ b/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Yet Another JSON Library."
+
+DESCRIPTION = "YAJL is a small event-driven (SAX-style) JSON parser \
+written in ANSI C, and a small validating JSON generator."
+
+HOMEPAGE = "http://lloyd.github.com/yajl/"
+
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://COPYING;md5=da2e9aa80962d54e7c726f232a2bd1e8"
+
+SRCREV = "6a8906d409dfe6dd3f1e01ed066aa162b1729cec"
+
+SRC_URI = "git://github.com/lloyd/yajl;branch=1.x \
+           file://0001-bump-version-to-1.0.12.patch \
+          "
+
+inherit cmake lib_package
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
-- 
2.11.0


