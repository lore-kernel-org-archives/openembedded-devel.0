Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web11.5609.1625450182802422544
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jul 2021 18:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MrBjayRV;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625450180; i=@fujitsu.com;
	bh=w1cKzL688Jxt5XPjRzYw6liDckzxDkmz/DyrjJ4BNxo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=MrBjayRVW0itZy06h1TgHoPIcfE7VWY0neRNn3Lh6fW4/14V8SDLEdosvdoHNKTLi
	 1sLy8d1L5LCmTiabrJc4X2+E5EwoSnuOgVL5hU6GRek34Z5WRcJBKRJDarTb5MFHv1
	 mdAEJCuFNTzFI34QExUDDoohEV1kCQ6j3JpzsIKhdI2EjBPmsDQopzRyVMpsvBwIM4
	 dz6jDUo56QbI0ikxKs/vWPhOnHcHYGvAzFbmTbtXgw6axYnghDN0NK+msHEBtGwm8S
	 hzNjneeF3h9yXl3NFFSef/YAsD1QqfNURSIuqnrISpMg/HhiHTq3ZXGeBLw+cXqs37
	 C9y5AYRW6ozmg==
Received: from [100.112.195.193] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id D5/88-07800-3C662E06; Mon, 05 Jul 2021 01:56:19 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI0T2c9ij
  B4F+bosXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrH5yCLGgunCFedaXjA1MDYKdjFycggJzGKS
  uHTUqYuRC8g+zihx7skhFpAEm4CORMeLbjBbREBfYunsPcwgtrBAgERb/y4wm0VAReLBgYdAN
  gcHr4CHxJML7iBhCQEFiSkP34OV8AoISpyc+QRsDLOAhMTBFy+YIWoUJbbvPMMCYVdIzJixjW
  0CI88sJC2zkLQsYGRaxWiRVJSZnlGSm5iZo2toYKBraGika2hppGtkYKKXWKWbqJdaqlueWly
  ia6iXWF6sV1yZm5yTopeXWrKJERhEKQUHzuxgPPX6g94hRkkOJiVR3k2ajxKE+JLyUyozEosz
  4otKc1KLDzHKcHAoSfBWJQPlBItS01Mr0jJzgAENk5bg4FES4U2OA0rzFhck5hZnpkOkTjEqS
  onzsqQCJQRAEhmleXBtsCi6xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY9y7IFJ7MvBK46a
  +AFjMBLb557iHI4pJEhJRUAxPjvJTIpRFlzwqlnj6Q2yD/2pNfl+vwOlnvgto8+bhzRwX9dRL
  5DA4Wfna8GdySKlZ5a/mM7msXUpKyRE93tzReuHhb/sjaSb3v3spO+2M5Q+KDr3zqUdf7bWaB
  0xKOrXCa/LOWuUui+Mv8Ex9Xuc9Ss4kO+lKb3DrtWMLM/l//i3cKcuvpOAZ+SHdeo/N3/+yHw
  u/nbbSWu6ucd3bGMt1rJuufT9uYpDG/QLhK69umBe925k44dn3fq2dLi7fvKRFodCoMrElQZp
  mx2dioKOpyRZT7xvajQtNTl/xzNmk/rN2UmXVTR2jj9/2rjacnSJmqPvKvyb8s75Jnt9jv9+u
  4n78n7bky0Wdyi95CmWglluKMREMt5qLiRACDFub5HQMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-271.messagelabs.com!1625450179!296657!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3679 invoked from network); 5 Jul 2021 01:56:19 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-11.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Jul 2021 01:56:19 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1651uJe4021810
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 5 Jul 2021 02:56:19 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 5 Jul 2021 02:56:17 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pyrsistent: upgrade 0.17.3 -> 0.18.0
Date: Mon, 5 Jul 2021 09:56:13 +0800
Message-ID: <1625450173-115030-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

0.18.0, 2021-06-28
 * Fix #209 Update freeze recurse into pyrsistent data structures and thaw to recurse into lists and dicts,
   Thanks @phil-arh for this!
   NB! This is a backwards incompatible change! To keep the old behaviour pass `strict=False` to freeze and thaw.
 * Fix #226, stop using deprecated exception.message. Thanks @hexagonrecursion for this!
 * Fix #211, add union operator to persistent maps. Thanks @bowbahdoe for this!
 * Fix #194, declare build dependencies through pyproject.toml. Thanks @jaraco for this!
 * Officially drop Python 3.5 support.
 * Fix #223, release wheels for all major platforms. Thanks @johnthagen for helping out with this!
 * Fix #221, KeyError obscured by TypeError if key is a tuple. Thanks @ganwell for this!
 * Fix LICENSE file name spelling. Thanks @ndowens and @barentsen for this!
 * Fix #216, add abstractmethod decorator for CheckedType and ABCMeta for _CheckedTypeMeta. Thanks @ss18 for this!
 * Fix #228, rename example classes in tests to avoid name clashes with pytest.

-License-Update: Copyright year updated to 2021.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...on3-pyrsistent_0.17.3.bb => python3-pyrsistent_0.18.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyrsistent_0.17.3.bb => python3-pyrsistent_0.18.0.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python3-pyrsistent_0.17.3.bb b/meta-python/recipes-devtools/python/python3-pyrsistent_0.18.0.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python3-pyrsistent_0.17.3.bb
rename to meta-python/recipes-devtools/python/python3-pyrsistent_0.18.0.bb
index 72736c8917..7b792284e2 100644
--- a/meta-python/recipes-devtools/python/python3-pyrsistent_0.17.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pyrsistent_0.18.0.bb
@@ -1,10 +1,9 @@
 SUMMARY = "Persistent/Immutable/Functional data structures for Python"
 HOMEPAGE = "https://github.com/tobgu/pyrsistent"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENCE.mit;md5=ca574f2891cf528b3e7a2ee570337e7c"
+LIC_FILES_CHKSUM = "file://LICENSE.mit;md5=a4b94c2b800b582a8d3925a9939cbf44"
 
-SRC_URI[md5sum] = "cd38658ea772a7f9b12b6f9485a7018b"
-SRC_URI[sha256sum] = "2e636185d9eb976a18a8a8e96efce62f2905fea90041958d8cc2a189756ebf3e"
+SRC_URI[sha256sum] = "773c781216f8c2900b42a7b638d5b517bb134ae1acbebe4d1e8f1f41ea60eb4b"
 
 inherit pypi setuptools3
 
-- 
2.25.1

