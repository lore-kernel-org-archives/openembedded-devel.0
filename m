Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A038C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 08:34:35 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.22615.1647419673376669874
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 01:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=w+mwvfCE;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647419671; i=@fujitsu.com;
	bh=gRPoNSbDmrksJI0fqEqZMqYipXXcKWhgrVnbm1lFb9s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=w+mwvfCEab+wDynBk2qHrDMjq/Y+wQ4g7R73o5j+37PuVCtXhB+nr3q2Z+Vs9HVyC
	 IfF3NSdh4V1Q5XvlLPnx9jtp7e/i/1pa7trfOchU+87AAjWNLJr/Y/MpDhxfx70H8z
	 RMWiRLe/gDKFIMZNke4CNeTwR7mGpWkMX0vTOBevGNS8tEVQziM1QFms0lXLI9AgTZ
	 tbqrCHwbfpYZ1prseM+cJbHCIJqz4VRuD0siH0n0gvw+3cq4JnSp5BXdGosRIITnrK
	 r5hBDsIY0m174PeCR//zsXd3Fo2T8qBMwjzcXSG+8mSCkDPuMlZhndVRVTm3QeakdA
	 Kq7P2wmS+hLrw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MxRVd8oWG
  SwZJmUYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPjUB97wRbuiu7VB1kaGPdzdTFycQgJzGSS
  OPl9CQuEc4JRYufqaexdjJwcbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdA1YjLOAn8fvSe
  bAaFgFVibNb1zGB2LwCThILNzWygdgSAgoSUx6+B+vlFHCW2HKnnRHEFgKq6e7cyQZRLyhxcu
  YTFoj5EhIHX7xghuhVlJh9uZkFwq6QmDWrjWkCI/8sJC2zkLQsYGRaxWidVJSZnlGSm5iZo2t
  oYKBraGiqa2yqa2hhopdYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZm5yTopeXWrKJERiWKcXK
  O3Ywtq36qXeIUZKDSUmU9/xMwyQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEry75wDlBItS01Mr0
  jJzgDECk5bg4FES4XWdB5TmLS5IzC3OTIdInWJUlBLnZQDpEwBJZJTmwbXB4vISo6yUMC8jAw
  ODEE9BalFuZgmq/CtGcQ5GJWFemxlAU3gy80rgpr8CWswEtHietB7I4pJEhJRUA5PkpfApHtq
  Ct1SdPhZ/uLlzz2ur3QtCTY//lDDNe7rz59PnkT+3u795MHfnZS6H3zedflpqfNs3Q+1QdYP/
  u5vTLt7TyE1Sr+masbi2Xkz46dJFYhrbLe97sc6YKyf7quDx++Ve93fH/7g6X8pJe2N3nouGr
  m3B0T71kp93JX5UJflLX7FzOeT0ujv4VKbolFhG7i3LnfLPxR+9f2yf4o2t8wKvnqrxnOD0x6
  l8b+Mv1tsK7762b3JwqzIoO7jix+u5mjxcLQXOZQ/Xe06X/B389VrfaokydnaHjPsBfCcOSSs
  28W6bxC5umnLRlU9VpV3Q+7iD6rpZ+9ZMcjl8PXKDal5uZni6F6dl/MOJJnZKLMUZiYZazEXF
  iQCX5tNeRgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-565.messagelabs.com!1647419671!26105!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24388 invoked from network); 16 Mar 2022 08:34:31 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-4.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Mar 2022 08:34:31 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22G8YNn3007464
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 08:34:31 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 16 Mar 2022 08:34:22 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-asn1crypto: upgrade 1.4.0 -> 1.5.1
Date: Wed, 16 Mar 2022 16:34:01 +0800
Message-ID: <1647419641-81593-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647419641-81593-1-git-send-email-wangmy@fujitsu.com>
References: <1647419641-81593-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Mar 2022 08:34:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96014

License-Update: year updated to 2022

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...thon3-asn1crypto_1.4.0.bb => python3-asn1crypto_1.5.1.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-asn1crypto_1.4.0.bb => python3-asn1crypto_1.5.1.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-asn1crypto_1.4.0.bb b/meta-python/recipes-devtools/python/python3-asn1crypto_1.5.1.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-asn1crypto_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-asn1crypto_1.5.1.bb
index c052cb8c82..5fa2ed987c 100644
--- a/meta-python/recipes-devtools/python/python3-asn1crypto_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-asn1crypto_1.5.1.bb
@@ -2,12 +2,11 @@ DESCRIPTION = "A fast, pure Python library for parsing and serializing ASN.1 str
 HOMEPAGE = "https://github.com/wbond/asn1crypto"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7439e38f5e04ff62fae436184786b7ca"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b5cda97fbd7959ad47a952651a87051a"
 
 PYPI_PACKAGE = "asn1crypto"
 
-SRC_URI[md5sum] = "00bf5b72d37778e62cc73b1d8909ae27"
-SRC_URI[sha256sum] = "f4f6e119474e58e04a2b1af817eb585b4fd72bdd89b998624712b5c99be7641c"
+SRC_URI[sha256sum] = "13ae38502be632115abf8a24cbe5f4da52e3b5231990aff31123c805306ccb9c"
 
 inherit pypi setuptools3
 
-- 
2.25.1


