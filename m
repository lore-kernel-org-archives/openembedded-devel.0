Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.4313.1630042828385461649
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Aug 2021 22:40:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KVdJGxZ7;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630042826; i=@fujitsu.com;
	bh=WnQe7nWdi947kxwQM8SXW0hWc/bBNi/TJtmufErHsCI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=KVdJGxZ7u/32MRcWxn3wlWgc7QYqdc/mZBwcg7nmk8w7rFpAuePWOn8Cz4hr61+wM
	 LlKbYDVRS01jKyCSOJf/PpQFCINGhjm/L+w5Bo4qce75hNCQcW/Xq6eEPxMfR2Hkv7
	 3dHgJtckDjOuSD/QJS9EbeNWlHfx8d94o+AWd/tWzFzIHUBjAVikez3Q3AMB4VDgeg
	 f8mLYVbW9ngSZhXoF9JUX4hWYj/Na/4tdaZvDatXs4OuYc2jTI9akc7SBeSX3vxI/f
	 HneV23lBoxUOmwwB9ZAqaHhAoS7MX8dOz+mNefcmYXNGmJ23++Yz5us/oROgA+ily7
	 SKWg39xAKlfog==
Received: from [100.112.192.29] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 0B/5C-13722-ACA78216; Fri, 27 Aug 2021 05:40:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI0T1VpZF
  ocGSWqMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFi6QzWgll8FX/OrGZuYHzL08XIySEkMJtJ
  4vdcgy5GLiD7BKPEx60NLCAJNgEdiY4X3WC2iIC+xNLZe5hBbGGBOInXq7qA4hwcLAKqEn83s
  YGEeQXcJSYdXQdWIiGgIDHl4XtmiLigxMmZT8DGMAtISBx88QKqRlFi+84zLBB2hcTrw5eYJz
  DyzELSMgtJywJGplWMFklFmekZJbmJmTm6hgYGuoaGRrqGlqa6RoameolVuol6qaW65anFJbq
  GeonlxXrFlbnJOSl6eaklmxiBQZRScPj6DsZbrz/oHWKU5GBSEuXdka6RKMSXlJ9SmZFYnBFf
  VJqTWnyIUYaDQ0mCd10FUE6wKDU9tSItMwcY0DBpCQ4eJRHenkqgNG9xQWJucWY6ROoUo6KUO
  K8/SEIAJJFRmgfXBouiS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEecNApvBk5pXATX8FtJ
  gJaHEBnyrI4pJEhJRUA1NQyNQLd7NEV83kjvXZY7nnsdmf6vmHMvj0f5TuvN60MTnYUcS1ZkN
  7s6OpWvP1uDSdeUdmaD+JudmxvXTFX59tYndiP8qXvlW91dwh2HzQbSJPxVZl7wmr9OwS58+4
  pJMau/NC5Volm+4NRhHMFx0FpsTKh0trr+9bYh0xZUrt1+cRXD/ybc7zfY/aL+Lh9DuCuzzAR
  3e6u8dH4Yq+s1+zXRZs+bo/3GVRUMSvfoWjBwX3Oa7qnvw1e1Le9W/njy288CP5ncC8uOeTi2
  wKV1q7LXpvud9TRlEq9eKmizobH/yV7H71aFWV/860+XUzPzzP5Pi0qmK9hsDLyIk7oq89vra
  Dzz7/q8jVTy8NTO2UWIozEg21mIuKEwG1xXAKHQMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-267.messagelabs.com!1630042826!85023!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20172 invoked from network); 27 Aug 2021 05:40:26 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-3.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Aug 2021 05:40:26 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17R5ePAO031619
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Aug 2021 06:40:25 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 27 Aug 2021 06:40:24 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.17.0 -> 2.18.0
Date: Fri, 27 Aug 2021 13:40:19 +0800
Message-ID: <1630042819-53095-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Features
analyticsadmin: update the api 
apigee: update the api 
appengine: update the api 
bigquerydatatransfer: update the api 
cloudfunctions: update the api
compute: update the api 
containeranalysis: update the api 
container: update the api 
documentai: update the api 
gkehub: update the api 
iam: update the api 
ideahub: update the api 
ondemandscanning: update the api 
osconfig: update the api 
people: update the api 
securitycenter: update the api 
slides: update the api 
tagmanager: update the api 

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...ent_2.17.0.bb => python3-google-api-python-client_2.18.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.17.0.bb => python3-google-api-python-client_2.18.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.17.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.18.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.17.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.18.0.bb
index 4975b2a5e1..0dc31826b5 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.18.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "20bc8f711883f9f8f96d96bc44b40ad0e2b0a9ef7df53e7c738948584fddd1c2"
+SRC_URI[sha256sum] = "a25661ec6cf4c159f41fe9c061c2bee31b2dddaf2ad787e23617048a25b53842"
 
 inherit pypi setuptools3
 
-- 
2.25.1

