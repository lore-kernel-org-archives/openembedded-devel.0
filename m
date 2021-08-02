Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web10.15616.1627875512219021494
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Aug 2021 20:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yxL6KP5J;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627875509; i=@fujitsu.com;
	bh=uwuyi6MuvfEP8rtskBC4nQ/UI8qPCIl+gI3rhX/I4GQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=yxL6KP5J9zqO5BTCkVylWaiKJW1VY8GLsJyQ0TXbDW/hTLlS0y5oy7JZfIxisSKbj
	 B8mAE9j1gVUcc+IvIiDD0cOSF3pMiQBhtPEkp/+NdJcGNpiKCh16p2vOIbA6xX2Qkp
	 4dVdmannr6tvfg8WDE3YqK+/Tmh1CVheOxgYnG6kD4SkGUfDroZhkzc743tF5YQ6uF
	 sbjZxuCg2T3ur6gyXYTrKj72Ax0I2BY8wnmb4vi0Octbr5zza+2+XaYHLzsRwMamYj
	 nvxcXy6JFVwEnmYv+1ZQcvdzrQ3q/4wkK8W31Q+HiXKgpiM4KgRJjyspyb3alHNu2w
	 Zk80tpKsRly9w==
Received: from [100.113.1.116] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id B1/78-13315-5B867016; Mon, 02 Aug 2021 03:38:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0d2SwZ5
  o8OKMmcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHq2h+mgqe8FT+mH2FtYDzB08XIxSEkMItJ
  YsK1pYwQznFGifM7LzJ1MXJysAnoSHS86GYBsUUE9CWWzt7DDGILC3hJTDyxgRXEZhFQkTjT3
  cLexcjBwSvgLjFhgxVIWEJAQWLKw/dg5bwCghInZz4BG8MsICFx8MULZogaRYntO8+wQNgVEq
  8PX2KewMgzC0nLLCQtCxiZVjFaJBVlpmeU5CZm5ugaGhjoGhoa6xrpmhrqJVbpJuqlluomp+a
  VFCUCJfUSy4v1iitzk3NS9PJSSzYxAsMopZDJeAfjtdcf9A4xSnIwKYnyhrSxJArxJeWnVGYk
  FmfEF5XmpBYfYpTh4FCS4DVPZ08UEixKTU+tSMvMAYY0TFqCg0dJhHdmGlCat7ggMbc4Mx0id
  YpRUUqcdypInwBIIqM0D64NFkeXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzzgcZz5OZVw
  I3/RXQYiagxVMzWEEWlyQipKQamLSv/03coCfxPLjo+Y5OiUSL0NCzp1RNGlI+PPrzUHjLtZi
  1Ivkyx2d/02RxvZ94s/uRgado9JKEQ3qTWPl3caVpdtXHtPxR0DibK7a86OE/9pPeDjzJK/Z/
  drjofvzxBrvF/7cmSX5c9efDo5xb3f5+7Mb2Tsu0Lx+fxmuylvHT2ku/l4Zm7DJyfbSpVnqbW
  /Pef0w1wV2TMxbueJEwcQNbIPvhracWsdh1uOwJnH+nqPM9W4piltJ2lvTgnW1L5vXm7fn4wX
  rJ/RkXv+kekVnzwGbyh2gnToV3R5f9XvfgU+qa+UKHc5KWFS68WdJTcsD1wJIyYe4lLxMesfy
  4dvnazMSNbKreIdbeZ2JfzJZQYinOSDTUYi4qTgQAa0sZKx4DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-23.tower-232.messagelabs.com!1627875508!274680!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4998 invoked from network); 2 Aug 2021 03:38:28 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-23.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Aug 2021 03:38:28 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1723cSsP011785
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Aug 2021 04:38:28 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 2 Aug 2021 04:38:26 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-graphviz: upgrade 0.16 -> 0.17
Date: Mon, 2 Aug 2021 11:38:20 +0800
Message-ID: <1627875500-34256-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Version 0.17
------------
Drop Python 2 support. Tag Python 3.10 support.
Migrate CI to GitHub actions. Add ``pypy3`` to matrix.
Tests: implement ``--skip-exe`` via custom ``pytest`` marker.
Documentation: point Anaconda users to ``conda-forge/python-graphviz``.
Move type hints from docstrings to type annotations. Improve doctests.
Examples: standardize import convention and modernize.
Re-render example notebooks with Graphviz 2.46.1.

-License-Update: Copyright year updated to 2021.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-graphviz_0.16.bb => python3-graphviz_0.17.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-graphviz_0.16.bb => python3-graphviz_0.17.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.16.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.17.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-graphviz_0.16.bb
rename to meta-python/recipes-devtools/python/python3-graphviz_0.17.bb
index 1af657098b..306ada89cd 100644
--- a/meta-python/recipes-devtools/python/python3-graphviz_0.16.bb
+++ b/meta-python/recipes-devtools/python/python3-graphviz_0.17.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Graphviz protocol implementation"
 HOMEPAGE = "https://graphviz.readthedocs.io/en/stable/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f7831c564aeff14e68aa4ff7a93dc89f"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=87cd8818b7e63c6a9c580034e80d7521"
 
-SRC_URI[sha256sum] = "d2d25af1c199cad567ce4806f0449cb74eb30cf451fd7597251e1da099ac6e57"
+SRC_URI[sha256sum] = "ef6e2c5deb9cdcc0c7eece1d89625fd07b0f2208ea2bcb483520907ddf8b4e12"
 
 inherit pypi setuptools3
 
-- 
2.25.1

