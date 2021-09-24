Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.5413.1632471775786045054
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Sep 2021 01:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Rmpq8u7d;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632471762; i=@fujitsu.com;
	bh=Cp6I+ScPV083K5MCnXxAEZxJmxmzqQQFlQ0uZ8wgCNU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Rmpq8u7dBZ+iPF72riXOm7RI0ttYdZ6DFu/+teTohK4X9UQTp0jPot6f+jVEL2mFB
	 YWaC1KAlWPxwrwQaApn0r67kW5V3VuiihOSGQ6GA0TEqP/O2nB+qh5giBLGyqb7lQf
	 Oj8Xc5yGFb1gS5mBspELcyoxzwqmRlYEQ5XAEqYO1pz4LQNmszulCVz0v6ZNHA/vNL
	 k5Cm0PWzvN+5d46b4lz9w4EXwiNSlt8Om5YUOktd7sFY8RatH8w0kIyb+GswosisLt
	 PL8yvTcXsrA6iLRhFSiBhr9e5TJPnAhcx2w9qsJjJxxnWpphLTcX3L3xtVJkaKccJT
	 a3FeQhN5Ll0mA==
Received: from [100.112.195.47] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id CB/3A-02979-2DA8D416; Fri, 24 Sep 2021 08:22:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYonuxyzf
  R4OIRc4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNC3xL2gqd8FVs27GZpYJzL28XIxSEkMJtJ
  4unTU+xdjJxAzglGieaXViA2m4CORMeLbhYQW0RAX2Lp7D3MILawgJfErg0dYDaLgKrEiWvvw
  Gp4Bdwk3p9/zgRiSwgoSEx5+J4ZIi4ocXLmE7AaZgEJiYMvXjBD1ChKbN95hgXCrpB4ffgS8w
  RGnllIWmYhaVnAyLSK0SKpKDM9oyQ3MTNH19DAQNfQ0EjX0NJI18jARC+xSjdRL7VUtzy1uET
  XUC+xvFivuDI3OSdFLy+1ZBMjMIxSCg6c2cF46vUHvUOMkhxMSqK8+p2+iUJ8SfkplRmJxRnx
  RaU5qcWHGGU4OJQkeF80AeUEi1LTUyvSMnOAIQ2TluDgURLhTQZp5S0uSMwtzkyHSJ1iVJQS5
  /3WCpQQAElklObBtcHi6BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd7dION5MvNK4Ka/Al
  rMBLT4+VwfkMUliQgpqQamFrXzccwp8tfU/wdYWR9/HlR7ZZ7Ig669Xc2Hpdn42UIO2v3ZuP2
  G1OL44x2SYV+PPZ/1uWDbvQcKlzZ/+sH41zCwXe5qune/4Nnph9aEeyz/fOrj+V0PZX/q/nh6
  uvvL03n5/45F3tY515299c7yLtFF877tVfQLL7rg3fBVmcFvXsGNrG/zXX/vlnx7rVDD1+Te6
  tjTV5b0fNupW2yeGf2zvb7d49bfnfnWk/e+v3BdZv6bz/ceFe10Pa0jEqCmGrPF8aj0yzle4l
  N3Sz2qy8hdfvO7w/LU6wYMZmWrJr6uevNQoyIkcqNWS9u/lxfY9TYF8p3mfrdJJZx13e4dSw8
  JsFo0zZ+qyiT8SlX8W4oSS3FGoqEWc1FxIgDGY/lAHgMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-267.messagelabs.com!1632471761!82022!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25370 invoked from network); 24 Sep 2021 08:22:41 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-8.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Sep 2021 08:22:41 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18O8MfiS014103
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Sep 2021 09:22:41 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Fri, 24 Sep 2021 09:22:40 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-rdflib: upgrade 6.0.0 -> 6.0.1
Date: Sat, 25 Sep 2021 04:22:33 +0800
Message-ID: <1632514953-4648-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

2021/09/17 RELEASE 6.0.1
========================
Minor release to fix a few small errors, in particular with JSON-LD parsing & serializing integration from rdflib-jsonld. Also, a few other niceties, such as allowing graph `add()`, `remove()` etc. to be chainable.

* Add test for adding JSON-LD to guess_format()
* Add JSON-LD to guess_format()
* add dateTimeStamp, fundamental & constraining facets, 7-prop data model
* fix: remove log message on import
* Make graph and other methods chainable
* fix: use correct name for json-ld
* Allowing Container Membership Properties in RDF namespace (#873)
* Update intro_to_sparql.rst
* Iterate over dataset return quads

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-rdflib_6.0.0.bb => python3-rdflib_6.0.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-rdflib_6.0.0.bb => python3-rdflib_6.0.1.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-rdflib_6.0.0.bb b/meta-python/recipes-devtools/python/python3-rdflib_6.0.1.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-rdflib_6.0.0.bb
rename to meta-python/recipes-devtools/python/python3-rdflib_6.0.1.bb
index 589e6638bf..c08ad81c50 100644
--- a/meta-python/recipes-devtools/python/python3-rdflib_6.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-rdflib_6.0.1.bb
@@ -1,8 +1,8 @@
 SUMMARY = "RDFLib is a pure Python package for working with RDF"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=89aa9a14f80a6ac70e1d5da763a309ed"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b6cde159c801514e0e45a40cf0a9d3d9"
 
-SRC_URI[sha256sum] = "7ce4d757eb26f4dd43205ec340d8c097f29e5adfe45d6ea20238c731dc679879"
+SRC_URI[sha256sum] = "f071caff0b68634e4a7bd1d66ea3416ac98f1cc3b915938147ea899c32608728"
 
 inherit pypi setuptools3
 
-- 
2.25.1

