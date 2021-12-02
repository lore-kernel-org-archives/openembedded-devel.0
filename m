Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06028C433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 02:41:43 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web08.3236.1638412901256637677
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Dec 2021 18:41:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uwyCUI6E;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638412898; i=@fujitsu.com;
	bh=x1ff0bspkcrtJ07nf65vtxxcwY7nL0C5soPWEGWjUag=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=uwyCUI6ECRmVmiAArw1mJ4fNHdPOQ4dT55Wm1YCFplgJrCvLReMWN+k1ILoIwGLGS
	 8ghnIRyTS9K3DL4wNz/U1Bw4/QTUPLncNKIWwVOVT0ym0bysOypIWDnqXve+TtJOxe
	 4D3sXpB0gkqmW+s6dudtGltzP61438OR3iEopARY7sBWo5mp/TvhlromxWIxcBqd6w
	 sX4D4k5iAKvUzxe/Av9tYuGH9qr86y10+ryzwrvIShRC0XExNc7zVlBA4FVH64+Y91
	 7QXur97jg4tGlkpcYN9RXEpmHiiNNwpQno54RCZErQ5vIxoUviwM9G3bZaekTdedsd
	 s0wE8HTqqXQYg==
Received: from [100.115.2.64] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id 76/A2-14731-26238A16;
 Thu, 02 Dec 2021 02:41:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+GYoptktCL
  RoGcBq8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtFz5QxrQQNPxa8XJ9kbGD9ydTFycQgJzGCS
  WHd7BzuEs5tR4uesFcxdjJwcbAK6Eucer2UHsUUE9CWWzt4DFhcW8JC4euQomM0ioCLROmEKE
  4jNK+Am8Wp9OyOILSGgIDHl4XtmiLigxMmZT1hAbGYBCYmDL14AxTmAahQlZk+XhyivkHh9+B
  LzBEaeWUg6ZiHpWMDItIrRKqkoMz2jJDcxM0fX0MBA19DQVNdQ18jAWC+xSjdRL7VUtzy1uET
  XUC+xvFgvtbhYr7gyNzknRS8vtWQTIzCUUooZT+9g3NT3U+8QoyQHk5Io7yuWFYlCfEn5KZUZ
  icUZ8UWlOanFhxhlODiUJHiLdYFygkWp6akVaZk5wLCGSUtw8CiJ8H7SA0rzFhck5hZnpkOkT
  jEqSonznjAASgiAJDJK8+DaYLF0iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwrwbIFJ7MvB
  K46a+AFjMBLT48aznI4pJEhJRUA9OGSX9ZeSfun3iB565M58PSzzlqK11CJMKfH5j4en7Q1Vk
  lCzdv8dQ0j7qWYSYl/GJqwZv773cXHl307bja2XyOxBSOaZXHwlxXtu18GR0cVNFq8v3h1Lq6
  HVb5/HG3brYqbipWL6l++UokfkvrJOmsy//VfQrvXuSs+Ls5xmZ5u9iO2IAna48/fHrbPtZvm
  5D6QZ70pOIP+qVh15fq9U/4FvVjt5PYeoGNaX3FF3cdtI69XnPFrmN/juuRjxw97J0q8VfWaj
  SdTzRe2Cxxu2Ais6HpO4Ui/7OBzJuLIufEvpA/u/T8PJe/33P9wjmDr5kenZuUYXL08V+Wj2e
  vbZ9nFTNbgk/d7kP144mPo7qVWIozEg21mIuKEwEVPRqEIAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-591.messagelabs.com!1638412897!179207!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8995 invoked from network); 2 Dec 2021 02:41:38 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-6.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Dec 2021 02:41:38 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1B22fVTE025212
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Dec 2021 02:41:37 GMT
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 2 Dec 2021 02:41:29 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][PATCH] python3-rdflib: upgrade 6.0.0 -> 6.0.2
Date: Thu, 2 Dec 2021 10:41:19 +0800
Message-ID: <1638412879-336-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Dec 2021 02:41:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94168

changlog:
====================================================
rename arg LOVE to ns in rdfpipe
Remove Tox reference to Python 3.6
Add Brick DefinedNamespace
Use setName on TokenConverter to set the name property
Add test for adding JSON-LD to guess_format()
Fix mypy type errors and add mypy to .drone.yml

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-rdflib_6.0.0.bb => python3-rdflib_6.0.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-rdflib_6.0.0.bb => python3-rdflib_6.0.2.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-rdflib_6.0.0.bb b/meta-python/recipes-devtools/python/python3-rdflib_6.0.2.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-rdflib_6.0.0.bb
rename to meta-python/recipes-devtools/python/python3-rdflib_6.0.2.bb
index 589e6638bf..49e6d33ab4 100644
--- a/meta-python/recipes-devtools/python/python3-rdflib_6.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-rdflib_6.0.2.bb
@@ -1,8 +1,8 @@
 SUMMARY = "RDFLib is a pure Python package for working with RDF"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=89aa9a14f80a6ac70e1d5da763a309ed"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b6cde159c801514e0e45a40cf0a9d3d9"
 
-SRC_URI[sha256sum] = "7ce4d757eb26f4dd43205ec340d8c097f29e5adfe45d6ea20238c731dc679879"
+SRC_URI[sha256sum] = "6136ae056001474ee2aff5fc5b956e62a11c3a9c66bb0f3d9c0aaa5fbb56854e"
 
 inherit pypi setuptools3
 
-- 
2.25.1


