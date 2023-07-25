Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C9BC0015E
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 19:09:55 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.28857.1690312192381171042
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jul 2023 12:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=s+F5Rn93;
 spf=pass (domain: baylibre.com, ip: 209.85.167.182, mailfrom: tgamblin@baylibre.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3a37909a64eso3727718b6e.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 12:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690312191; x=1690916991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x0JKfxtlMCKfzBuwMJA0oRHUqKtk/+AIqVHLrtsK/8E=;
        b=s+F5Rn93InvD4EdQCCmEI/B15gljNFMzP9cbemjk3m35DH2UA3XO5FBnqE3XOUZXCG
         PMr/BZ/cTVJDjdUFKBeDvGhQwX2VHEZWA8sU/wosK8v27ycW0DuLVCw5Mt/IQZG7ROka
         IznkuS9rEt8NFOt49w4ELTHexqOpRh//NiNtJI1IptEy2pSDhDuKSEnJPh/qFQmYMfZB
         mILi7D1SNw+zUsJCyXrpzVp/bQMBN2p+cOXHTPzELEt2xZC8/M2j+WBzQjSpn01836CZ
         qEkOvm2wquWh8B05CmIZFH8qCX29WGpMbKnUJvY6IgsVp1T750E7gBXdY1SlqtP0+n43
         ukKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690312191; x=1690916991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0JKfxtlMCKfzBuwMJA0oRHUqKtk/+AIqVHLrtsK/8E=;
        b=GAuc5aAr0EIo72BuDHzTPk+/eZadGUIQkU581SOCxIg95tkc2ks9tua23PZw6i55iy
         03gKaE9eiLk2i+15MjYr3ueg4dQjx9mWeXoXfECz7l0hmlGX3oGJhP4XuA7kAhu5hOER
         mkgPcWz0gslikae3To6vbTDpfR+h4NaRer260nCwWkoZsRIxboAL8BtvztfM53Vic+EC
         HLC0yJae+QqWugGQ5KprfrV3tUz389x+Dyd9Dajkgb1PbK5oqay7HdlfD00EJ1f5R7E/
         9+kFtlVDe9Ag6T4d80hYxBSeNWwLdAUxfvdZgul1JYbAP7CJdrDETGR74z48pbrVMc9L
         UFEg==
X-Gm-Message-State: ABy/qLaXY66PQOyKYRBGI/D9Pls5uZRXH+W+bSyMoKik2TXQra6q8Urm
	Dl6EQXxSftigioKJZ0BXyZdrNRVzhwGWk2LtAKM=
X-Google-Smtp-Source: APBJJlEWOYcDolGNTYZ8HVqaGOO/YNmSsKxSGxYqfAxfzEIUwfM6sV4dqeAZ39EDyK49y0bx/WIFOA==
X-Received: by 2002:a05:6808:1784:b0:3a3:b98a:d7b3 with SMTP id bg4-20020a056808178400b003a3b98ad7b3mr17388386oib.15.1690312191535;
        Tue, 25 Jul 2023 12:09:51 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id z9-20020a0cf249000000b005ef81cc63ccsm4526109qvl.117.2023.07.25.12.09.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 12:09:51 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 4/7] python3-matplotlib: upgrade 3.6.3 -> 3.7.2
Date: Tue, 25 Jul 2023 15:09:40 -0400
Message-ID: <20230725190947.660933-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725190947.660933-1-tgamblin@baylibre.com>
References: <20230725190947.660933-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 19:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104021

- Adjust target lines in setup.py for LIC_FILES_CHKSUM, since the
  content of interest has moved (but not changed)
- Tweak matplotlib-disable-download.patch to apply on 3.7.2
- Remove backported patch since it's in 3.7.2:

[tgamblin@megalith matplotlib]$ git log --oneline --grep="removed RandomNumberGenerator class"
601d92a885 removed RandomNumberGenerator class, included <random>, replaced random_shuffle with shuffle and used mersenne twister engine to generate uniform random bit generator for the shuffle.
[tgamblin@megalith matplotlib]$ git tag --contains 601d92a885
v3.7.0
v3.7.0rc1
v3.7.1
v3.7.2

Changelog: https://github.com/matplotlib/matplotlib/releases

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...mberGenerator-class-included-random-.patch | 59 -------------------
 .../matplotlib-disable-download.patch         | 28 ++++-----
 ...b_3.6.3.bb => python3-matplotlib_3.7.2.bb} |  7 ++-
 3 files changed, 18 insertions(+), 76 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-matplotlib/0001-removed-RandomNumberGenerator-class-included-random-.patch
 rename meta-python/recipes-devtools/python/{python3-matplotlib_3.6.3.bb => python3-matplotlib_3.7.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib/0001-removed-RandomNumberGenerator-class-included-random-.patch b/meta-python/recipes-devtools/python/python3-matplotlib/0001-removed-RandomNumberGenerator-class-included-random-.patch
deleted file mode 100644
index 1f9b8cdeaf..0000000000
--- a/meta-python/recipes-devtools/python/python3-matplotlib/0001-removed-RandomNumberGenerator-class-included-random-.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 3eb9987b02cc10b93e09219ddc86aa6be5f10177 Mon Sep 17 00:00:00 2001
-From: tybeller <ty.c.beller@gmail.com>
-Date: Fri, 30 Sep 2022 16:13:41 -0400
-Subject: [PATCH] removed RandomNumberGenerator class, included <random>,
- replaced random_shuffle with shuffle and used mersenne twister engine to
- generate uniform random bit generator for the shuffle.
-
-Upstream-Status: Backport [https://github.com/matplotlib/matplotlib/commit/601d92a8850]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/tri/_tri.cpp | 20 ++++----------------
- 1 file changed, 4 insertions(+), 16 deletions(-)
-
-diff --git a/src/tri/_tri.cpp b/src/tri/_tri.cpp
-index b7a87783de..6e639eea44 100644
---- a/src/tri/_tri.cpp
-+++ b/src/tri/_tri.cpp
-@@ -12,6 +12,7 @@
- 
- #include <algorithm>
- #include <set>
-+#include <random>
- 
- 
- TriEdge::TriEdge()
-@@ -1465,8 +1466,8 @@ TrapezoidMapTriFinder::initialize()
-     _tree->assert_valid(false);
- 
-     // Randomly shuffle all edges other than first 2.
--    RandomNumberGenerator rng(1234);
--    std::random_shuffle(_edges.begin()+2, _edges.end(), rng);
-+    std::mt19937 rng(1234);
-+    std::shuffle(_edges.begin()+2, _edges.end(), rng);
- 
-     // Add edges, one at a time, to tree.
-     size_t nedges = _edges.size();
-@@ -2055,17 +2056,4 @@ TrapezoidMapTriFinder::Trapezoid::set_upper_right(Trapezoid* upper_right_)
-     upper_right = upper_right_;
-     if (upper_right != 0)
-         upper_right->upper_left = this;
--}
--
--
--
--RandomNumberGenerator::RandomNumberGenerator(unsigned long seed)
--    : _m(21870), _a(1291), _c(4621), _seed(seed % _m)
--{}
--
--unsigned long
--RandomNumberGenerator::operator()(unsigned long max_value)
--{
--    _seed = (_seed*_a + _c) % _m;
--    return (_seed*max_value) / _m;
--}
-+}
-\ No newline at end of file
--- 
-2.39.0
-
diff --git a/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch b/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch
index 899cac624a..aea8f62ea7 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch
+++ b/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch
@@ -4,19 +4,17 @@ Upstream-Status: Inappropriate [disable feature]
 
 Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
 
+Update patch to fit on 3.7.2.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+
+diff --git a/setup.py b/setup.py
+index 0bea13fa6f..f39d8fc871 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -303,7 +303,6 @@ setup(  # Finally, pass this all along t
-     setup_requires=[
-         "certifi>=2020.06.20",
-         "numpy>=1.19",
--        "setuptools_scm>=7",
-     ],
-     install_requires=[
-         "contourpy>=1.0.1",
-@@ -315,13 +314,7 @@ setup(  # Finally, pass this all along t
+@@ -327,13 +327,7 @@ setup(  # Finally, pass this all along to setuptools to do the heavy lifting.
          "pillow>=6.2.0",
-         "pyparsing>=2.2.1",
+         "pyparsing>=2.3.1,<3.1",
          "python-dateutil>=2.7",
 -    ] + (
 -        # Installing from a git checkout that is not producing a wheel.
@@ -26,12 +24,14 @@ Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
 -        ) else []
 -    ),
 +    ],
-     use_scm_version={
-         "version_scheme": "release-branch-semver",
-         "local_scheme": "node-and-date",
+     extras_require={
+         ':python_version<"3.10"': [
+             "importlib-resources>=3.2.0",
+diff --git a/setupext.py b/setupext.py
+index a898d642d6..474172ff8f 100644
 --- a/setupext.py
 +++ b/setupext.py
-@@ -65,40 +65,7 @@ def get_from_cache_or_download(url, sha)
+@@ -66,40 +66,7 @@ def get_from_cache_or_download(url, sha):
      BytesIO
          The file loaded into memory.
      """
diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.6.3.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.7.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-matplotlib_3.6.3.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib_3.7.2.bb
index fa0a78d6a9..72c369100a 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.7.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/matplotlib/matplotlib"
 SECTION = "devel/python"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "\
-    file://setup.py;beginline=283;endline=283;md5=20e7ab4d2b2b1395a0e4ab800181eb96 \
+    file://setup.py;beginline=293;endline=293;md5=20e7ab4d2b2b1395a0e4ab800181eb96 \
     file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74 \
 "
 
@@ -20,15 +20,16 @@ DEPENDS = "\
     python3-pytz-native \
     python3-certifi-native \
     python3-setuptools-scm-native \
+    python3-pybind11-native \
 "
-SRC_URI[sha256sum] = "1f4d69707b1677560cd952544ee4962f68ff07952fb9069ff8c12b56353cb8c9"
+SRC_URI[sha256sum] = "a8cdb91dddb04436bd2f098b8fdf4b81352e68cf4d2c6756fcc414791076569b"
 
 inherit pypi setuptools3 pkgconfig
 
 # Stop the component from attempting to download when it detects a missing
 # dependency
 SRC_URI += "file://matplotlib-disable-download.patch \
-            file://0001-removed-RandomNumberGenerator-class-included-random-.patch"
+"
 
 # This python module requires a full copy of freetype-2.6.1
 SRC_URI += "https://downloads.sourceforge.net/project/freetype/freetype2/2.6.1/freetype-2.6.1.tar.gz;name=freetype;subdir=matplotlib-${PV}/build"
-- 
2.41.0


