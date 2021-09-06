Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web09.16948.1630891244435061999
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Sep 2021 18:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FNnOFE4m;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630891242; i=@fujitsu.com;
	bh=Wwr6kSr7WmaJGD8pF7xY9MEY35MAzuhOpjKWdxtyxQU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=FNnOFE4mFx3WEfJDG/locH7lB1ADGMWx8i9WZcMtXQJUWluqN7OeJvUuEJpd5/Bcf
	 tVmTN2Qz0+42reUgVlb4gaJGd5yvm/YFKgN4puE366qMPTO43CibiTA3zXnvcejzFd
	 BBU7sXJ+qSnLqn8UaPjM4Dl+eGtSeVplalIW0aP7Jcci8NNYhjoy9lur8pvttiTMRo
	 HsJHyDihqFwAgHYDXmb3insLQG68mlgf5hr4FRZ6UtciQXqmZkOSxsUds4jLutbtb9
	 bLw084sRfJ3n7tm/7hNArld2uqZtTo+E8SS19clXiUjC1WxeiAhaJNqtN012iYOgQ/
	 zrtqru6hbAO7w==
Received: from [100.113.2.146] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 20/AA-29868-AEC65316; Mon, 06 Sep 2021 01:20:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI1X2ZY5p
  osPizjcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrFl3Q6mgmlcFU8WXWdsYJzN2cXIySEkMItJ
  4toLxS5GLiD7OKPEna8nmEESbAI6Eh0vullAbBEBfYmls/eAxYUFfCXmPP0MFmcRUJG43HKAD
  cTmFXCX2LgHokZCQEFiysP3zBBxQYmTM5+A1TMLSEgcfPECqkZRYvvOMywQdoXE68OXmCcw8s
  xC0jILScsCRqZVjBZJRZnpGSW5iZk5uoYGBrqGhsa6hrqmhnqJVbqJeqmlusmpeSVFiUBJvcT
  yYr3iytzknBS9vNSSTYzAMEopZDTewXjw9Qe9Q4ySHExKorwadqaJQnxJ+SmVGYnFGfFFpTmp
  xYcYZTg4lCR4o7KAcoJFqempFWmZOcCQhklLcPAoifCeyAZK8xYXJOYWZ6ZDpE4xKkqJ85aDJ
  ARAEhmleXBtsDi6xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYtzUeaApPZl4J3PRXQIuZgB
  a3PTQBWVySiJCSamCSFt5u6X1g98yCzdvkTX3tnmx50Jkj2LP7auHHXyHPv2yczecxQbP7WPc
  x7+3Fq7yvqyzZeK2337hqRpDKkVUVb1em3rwvpbnxWuWOmpbXy2L3dO6v1f1WuF/5lvflp2eN
  LT8Fe7AvyrNjXa/XaF3QeHHb3fiQPzO7TP03Fez6/3Ke1EG7hq4E366HW86X9falqbCmaiqsf
  pMuOOu2CveDmyEmTKYaofukJ3YWLZm6VFv3pmPm1EPru26tKp5aZpeSyRSfHO8l02r2rdj+/d
  FOjb7jpley/SexGjd4v7aqubUwQvWHYIuGyuXtmVeVZcOf9ov3tZv4da8O5W18dsJP70aY2+t
  vpmVZvMHczEosxRmJhlrMRcWJANaDaB4eAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-226.messagelabs.com!1630891241!193445!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15587 invoked from network); 6 Sep 2021 01:20:41 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-6.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Sep 2021 01:20:41 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1861KfOp023560
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Sep 2021 02:20:41 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 6 Sep 2021 02:20:40 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-ipython: upgrade 7.26.0 -> 7.27.0
Date: Mon, 6 Sep 2021 09:20:33 +0800
Message-ID: <1630891233-61443-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

IPython 7.27 is a minor release that fixes a couple of issues and compatibility.
Add support for GTK4 PR 
Add support for Qt6 PR
Fix an issue with pip magic on windows PR

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-ipython_7.26.0.bb => python3-ipython_7.27.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_7.26.0.bb => python3-ipython_7.27.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.26.0.bb b/meta-python/recipes-devtools/python/python3-ipython_7.27.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ipython_7.26.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_7.27.0.bb
index 4c1d4ebd70..2ec0722c35 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_7.26.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_7.27.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "0cff04bb042800129348701f7bd68a430a844e8fb193979c08f6c99f28bb735e"
+SRC_URI[sha256sum] = "58b55ebfdfa260dad10d509702dc2857cb25ad82609506b070cf2d7b7df5af13"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.25.1

