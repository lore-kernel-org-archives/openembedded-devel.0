Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web12.3201.1627007155252137998
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jul 2021 19:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xkGND2tR;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627007153; i=@fujitsu.com;
	bh=h93Qr4WQcdMdYMLWpSMTqItYcH7UmWWZBfkshp5DbAg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xkGND2tR82K7eHHcUb1/jXLYYu6cCRhFgH/X09LFgpbaMsDxUREgdh6PFVxD07eWI
	 pypA5qOqyxORf7uBQycGUoIz+dvngZW6tGz5ymp+1g1v0s0aLZYc4FZbRc5U9KMFT5
	 OfU/LYGjWXXXwBlB+HOkiyn1KFw97kInkz39+nfYcG/j5R9E1p0vcdZQmSdYk/ZTYh
	 Kzf7wqx4DickUzdw4R8xk13z/DL9nXJmzEXj8iHqw/Q7eYawJ3vd+3vpO3PU0yxsGz
	 2sjTsw3Dx7QZoQ4akEP20cQ9nlx/bX5PegL+91QJ53mzBT33pvYo0D/n9zupYty9dJ
	 1BupL/O3YbYHA==
Received: from [100.113.6.138] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 74/E7-07230-1B82AF06; Fri, 23 Jul 2021 02:25:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8MRortB41e
  Cwfyf2hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aBZffZCxq5K76+nsHawDiFq4uRi0NIYDaT
  xIzDExghnBOMElten2XrYuTkYBPQkeh40c0CYosI6Essnb2HGcQWFgiQeN53EizOIqAqsWr+e
  nYQm1fATeLTy29gNRICChJTHr5nhogLSpyc+QSsnllAQuLgixdQNYoS23eeYYGwKyRmzNjGNo
  GRZxaSlllIWhYwMq1itEwqykzPKMlNzMzRNTQw0DU0NNY11zUyNdJLrNJN0kst1U1OzSspSgT
  K6iWWF+sVV+Ym56To5aWWbGIEhlJKIfufHYzXX3/QO8QoycGkJMordfhnghBfUn5KZUZicUZ8
  UWlOavEhRhkODiUJ3hUyvxKEBItS01Mr0jJzgGENk5bg4FES4S2VAErzFhck5hZnpkOkTjG6c
  jxbu2QRM8eGeUuB5P+7d4Fk/4KDq5k5brYfWs0sxJKXn5cqJc57VA2oWQCkOaM0D240LCYvMc
  pKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmjVYHmsKTmVcCd8EroOOYgI471fUT5LiSRISUVAO
  T+7GKW9qvZr+9/vGi2q7HkvnzuK9pP9FrXiww8UXxkdycVW46IhJMom8UNp5hvvBV5Hnxs901
  rTG/c6e/eGAcq6O48762VuDdqwe8t8wyfnZ40gxdnWUXHh7PtL33ULItxPXnyWUnPPm+8wSdr
  1SY0h26773BqR0Pfn8M/W3t1J6+0yGrO/rg7r9K6y2XX+7vinTdYnhqjvjjDRde1UyZtEm362
  G1oP/kz3u4Jdebndr+wDL4rsjL6Q7LvjziLus/4en7zVrAXTNOZaZQfBSjB++VxzLLLz4y4XY
  QtE4O4br/sljUqYxHpGvvR1u2ZQ1RAgem3Nb8Jl4RxXN1V/PjiXMC5HlKP3gd1G+fcvNbshJL
  cUaioRZzUXEiAKWNDoBEAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-238.messagelabs.com!1627007152!94369!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30507 invoked from network); 23 Jul 2021 02:25:52 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-8.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Jul 2021 02:25:52 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16N2PnGU020293
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jul 2021 03:25:52 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 23 Jul 2021 03:25:47 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-simplejson: upgrade 3.17.2 -> 3.17.3
Date: Fri, 23 Jul 2021 22:25:39 +0800
Message-ID: <1627050339-7381-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Version 3.17.3 released 2021-07-09

* Replaced Travis-CI and AppVeyor with Github Actions,
  adding wheels for Python 3.9.
  https://github.com/simplejson/simplejson/pull/283

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...thon3-simplejson_3.17.2.bb => python3-simplejson_3.17.3.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-simplejson_3.17.2.bb => python3-simplejson_3.17.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.17.2.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.17.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-simplejson_3.17.2.bb
rename to meta-python/recipes-devtools/python/python3-simplejson_3.17.3.bb
index cab0da6a15..11b057743c 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_3.17.2.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_3.17.3.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRC_URI[md5sum] = "27fba3bc75a32318bd3b163b8a31aa7e"
-SRC_URI[sha256sum] = "75ecc79f26d99222a084fbdd1ce5aad3ac3a8bd535cd9059528452da38b68841"
+SRC_URI[sha256sum] = "da72a452bcf4349fc467a12b54ab0e63e654a571cacc44084826d52bde12b6ee"
 
 inherit pypi setuptools3
 
-- 
2.25.1

