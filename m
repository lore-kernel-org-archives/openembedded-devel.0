Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BEDD339A9
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 17:15:02 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.57721.1730135700286178001
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 10:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OOA8qIJD;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20bb39d97d1so36020915ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 10:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730135699; x=1730740499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6kaLv0vt0IHQk03YWspmaqcN7Z+wWIELyoRnfAxTas=;
        b=OOA8qIJDBewRe//RM7j3NkQbNcChmVqt3Xw0pctp3fBSTQ0GvIv+4a05HMiHr7xc1h
         vAS6/KEVA+a+5WLHYFXHhZPzzTZGPiaJbpWoTAHKoHTQMuKuZP/AhgUGWUHe05T3H8qH
         0uwXBYJmPraSW0b6Ei8xbkzK0+I1d3zygYUuzf0+0s+msYggHEzidPo0s/fSmUWWIbMO
         wc5jUEjyAXbOy7qYT980ydpzbgc1IC4vqOlTqpRJTnB8Mj0LMMGaEnCyNsG+Zy2eOGXK
         hcwvXJ23RBQo5jDHdg0cHYbNmlYZ9rvzZfkrTErfa2/xt6DJfxkM8gaJMKGfx3Mva+87
         jRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730135699; x=1730740499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6kaLv0vt0IHQk03YWspmaqcN7Z+wWIELyoRnfAxTas=;
        b=NfoZkgk18WZvOcbth+TzEMpIHtxCrBGd8mWC9HlMKtkWo+ykB8kGqMYk2QXwgLk1Kx
         Xph0JJ7+0BHcw60754zXUUtufF4bQKVtNusR6Wrd5Jj6rI/NvWx/nc57EjvQm1bpVETC
         3nnWsL5WMqLETejTz6nV8CkfhLcPF538l8Holoc5hTupfYMvgFLcZfxVTNZQpTsdtFkX
         ZLTYysFOdiTv5FyC41zXSmkQ2MWLvlEZyL/kEyk5iycmwtxA+nzcYMe4HumME0x7NJzL
         w+6n5KKluSvcM9OrrpgYPamePzqFxhcifwija8pUggGqRUhM9dSefiCz1vTpJUv5AadS
         Ff6A==
X-Gm-Message-State: AOJu0YwMd9uO58Gxm3x+mIc7rWIv6cvrFarzhZiKBILcJqaEpJEyGisW
	xG3ir8ZAwbU2iR0oMh2bnIzyeYl1UIbETnxVE+0DARQ9Q23C+vWzYWAk4bE9
X-Google-Smtp-Source: AGHT+IH2N5gU892mG9Gb0re9M02K02ghNF800GNQDvG2REVApgbu0tQmw0r+NEgw7emBOxS0Rwwb0w==
X-Received: by 2002:a17:902:f54e:b0:20c:a19b:8ddd with SMTP id d9443c01a7336-210c6c979a0mr112737865ad.51.1730135699231;
        Mon, 28 Oct 2024 10:14:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9a1e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc04b8bbsm52656095ad.244.2024.10.28.10.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:14:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/3] python3-whoosh: Remove
Date: Mon, 28 Oct 2024 10:14:55 -0700
Message-ID: <20241028171456.2462158-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028171456.2462158-1-raj.khem@gmail.com>
References: <20241028171456.2462158-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 17:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113263

This package is unmaintained upstream, and has no
new releases since 2016, now it does not build with python 3.13
since it needs cgi module which has been removed in 3.13+

if we still need this functionality
then something like whoosh-reloaded might be better

https://pypi.org/project/Whoosh-Reloaded/

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 -
 .../packagegroups/packagegroup-meta-python.bb |  2 -
 ...nstic-test_minimize_dfa-test-as-XFAI.patch | 29 -------------
 .../python/python3-whoosh/run-ptest           |  3 --
 .../python/python3-whoosh_2.7.4.bb            | 42 -------------------
 5 files changed, 77 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-whoosh/0001-Mark-non-determinstic-test_minimize_dfa-test-as-XFAI.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-whoosh/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 9e828fa5cd..ee8f957cca 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -116,5 +116,4 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-dnspython \
     python3-fastjsonschema \
     python3-pyzmq \
-    python3-whoosh \
 "
diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 8850f8eb9a..81f45fb78d 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -452,7 +452,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-websocket-client \
     python3-werkzeug \
     python3-werkzeug \
-    python3-whoosh \
     python3-wrapt \
     python3-wtforms \
     python3-xlrd \
@@ -524,7 +523,6 @@ RDEPENDS:packagegroup-meta-python3-ptest = "\
     python3-unidiff-ptest \
     python3-uritemplate-ptest \
     python3-webcolors-ptest \
-    python3-whoosh-ptest \
     python3-wpa-supplicant \
     python3-xlrd-ptest \
     python3-xmltodict-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-whoosh/0001-Mark-non-determinstic-test_minimize_dfa-test-as-XFAI.patch b/meta-python/recipes-devtools/python/python3-whoosh/0001-Mark-non-determinstic-test_minimize_dfa-test-as-XFAI.patch
deleted file mode 100644
index 91fea24524..0000000000
--- a/meta-python/recipes-devtools/python/python3-whoosh/0001-Mark-non-determinstic-test_minimize_dfa-test-as-XFAI.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From ede95a4f4487b4fc3cad8452ae388376966fca0e Mon Sep 17 00:00:00 2001
-From: Chris Lamb <lamby@debian.org>
-Date: Fri, 5 Apr 2019 15:48:23 +0200
-Subject: [PATCH] Mark non-determinstic test_minimize_dfa test as XFAIL
-
-Sourced from Debian [1]
-[1] https://sources.debian.org/src/python-whoosh/2.7.4%2Bgit6-g9134ad92-8/debian/patches/0003-Mark-non-determinstic-test_minimize_dfa-test-as-XFAI.patch/
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/test_automata.py | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/test_automata.py b/tests/test_automata.py
-index daab96c..7031dc3 100644
---- a/tests/test_automata.py
-+++ b/tests/test_automata.py
-@@ -327,6 +327,7 @@ def test_regular():
-     assert not ex.accept("bc")
- 
- 
-+@pytest.mark.xfail(strict=False)
- def test_minimize_dfa():
-     # Example from www.cs.odu.edu/~toida/nerzic/390teched/regular/fa/min-fa.html
- 
--- 
-2.44.0
-
diff --git a/meta-python/recipes-devtools/python/python3-whoosh/run-ptest b/meta-python/recipes-devtools/python/python3-whoosh/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-whoosh/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb b/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
deleted file mode 100644
index cd5f67a62a..0000000000
--- a/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-SUMMARY = "Fast, pure-Python full text indexing, search, and spell checking library."
-DESCRIPTION = "\
-Whoosh is a fast, featureful full-text indexing and searching library \
-implemented in pure Python. Programmers can use it to easily add search \
-functionality to their applications and websites. Every part of how \
-Whoosh works can be extended or replaced to meet your needs exactly."
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05303186defc6141143629961c7c8a60"
-
-SRC_URI += "file://0001-Mark-non-determinstic-test_minimize_dfa-test-as-XFAI.patch"
-
-SRC_URI[sha256sum] = "e0857375f63e9041e03fedd5b7541f97cf78917ac1b6b06c1fcc9b45375dda69"
-
-PYPI_PACKAGE = "Whoosh"
-PYPI_PACKAGE_EXT = "zip"
-
-inherit ptest pypi setuptools3
-
-RDEPENDS:${PN} += " \
-    python3-email \
-    python3-multiprocessing \
-    python3-netclient \
-    python3-numbers \
-    python3-pickle \
-    python3-shell \
-    python3-stringold \
-"
-
-SRC_URI += " \
-    file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-    python3-fcntl \
-    python3-pytest \
-    python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}

