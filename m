Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2464171BE5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 06:03:12 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id w68so8996409pgw.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 22:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=da8zYE+YkPXg2XzMSl+DjfePd9YezSwvzETIzAwx7Lw=;
	b=XbCjcy58Vo8zGSOEy3i+KB+YLxOkv1EoR1fjlcPulOF5VW8brD0gOEbRY1EoaH+oX6
	u6x3PFAmGJUIKfhCRnfHZFBtKGDQRsDgsQqRKOI/Pjh52OAg0PZW27GiQi0MDs909cZA
	qdpCgTDhKzoCFLBjAkLS7uqg1CsETwF1MCdeK++nIbXrf34woH5KIfSLw7DuMpZw/dFF
	vqorBrURKNL23MPYCPU0y4mf9OZNJ8YqSKP8wm8wT9j0rxE06TUY7LPHpyBsLfV85+OI
	W6nhOBkwRI5M10nY8cIZOXv/szytnokSsJkgPThbUsgpWdL2/S8oP94Jwpk7labNfWKR
	eEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=da8zYE+YkPXg2XzMSl+DjfePd9YezSwvzETIzAwx7Lw=;
	b=nblx3GOuDRmdYgwNMMwcPA4JrHH+wL/8ERFUP1xdjwhe0y3d0EIBLw5xy81KJP/wQd
	t+pDH3CyXZxNK6G0sMhtghj8De7EKRYEAcv1YEiWWDVA7Mi4fPcCTb3OTNVxNS9GkKG4
	61lVc2Elj+EM5MffqBpz50MMTFwFqelT0GRgKrsrQaBTyeHLH7hHmo7QqK5VjscpQ5f9
	lVtZgVYGzF3Rp1AMd4b/C6jhwz5vPzg97vyijR1cGc4xx3f2yBCz26A7KJ0ntsFH1i26
	hW8HITgw7Ax83uUa0HP7ScTtZ/D9duX3cF31ZFkW7eDjOz9/mxHk59J8SRr1DFqYp8gP
	iYMw==
X-Gm-Message-State: AIkVDXIEMcK/kYXrdCb86VBzhXq5KoIFCsMn+iTlZkWcFFwT/3exp5dFFZaLXhnCgoZkvg==
X-Received: by 10.98.220.75 with SMTP id t72mr2665441pfg.164.1482300194243;
	Tue, 20 Dec 2016 22:03:14 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	s197sm43526435pgc.38.2016.12.20.22.03.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Dec 2016 22:03:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Dec 2016 22:03:05 -0800
Message-Id: <20161221060306.19798-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161221060306.19798-1-raj.khem@gmail.com>
References: <20161221060306.19798-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V3] yajl_1.0.12: Add recipe for yajl1
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
X-List-Received-Date: Wed, 21 Dec 2016 06:03:13 -0000

yajl1 and yajl2 are not ABI compatible, therefore
add a recipe for latest release of yajl1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../yajl-1.0.12/0001-bump-version-to-1.0.12.patch  | 25 ++++++++++++++++++++++
 meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb       | 19 ++++++++++++++++
 2 files changed, 44 insertions(+)
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
index 000000000..8ced7b84f
--- /dev/null
+++ b/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Yet Another JSON Library."
+
+DESCRIPTION = "YAJL is a small event-driven (SAX-style) JSON parser \
+written in ANSI C, and a small validating JSON generator."
+
+HOMEPAGE = "http://lloyd.github.com/yajl/"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=da2e9aa80962d54e7c726f232a2bd1e8"
+
+# Use 1.0.12 tag
+SRCREV = "17b1790fb9c8abbb3c0f7e083864a6a014191d56"
+SRC_URI = "git://github.com/lloyd/yajl;nobranch=1"
+
+inherit cmake lib_package
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
-- 
2.11.0


