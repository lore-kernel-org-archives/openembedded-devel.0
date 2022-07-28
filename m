Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C479C04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 02:16:54 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.27974.1658974608385171840
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 19:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HrsOO01+;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658974606; i=@fujitsu.com;
	bh=D+9kwkOwgkeb7+wkWpT/P0sCxgic6KwvUb4CJfYZxUQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=HrsOO01+IxnFyX3II11q62aSWdBobZuJLGLXOYjhTEkKeFOiry9PF4tMtC7SqWtw2
	 AmDihGpwg++t+rnWQlfz6tKqrQqdLzQzlhBGBGNhSzvEa0PJkYFMQPy+0WKg0pwHfT
	 BRJULrPGrJUIDrP+rJ51jAd0+MU0XEzrKvaYWoZeGULrVClUHe57aOrgRH8EqZzq/d
	 s940PqIItv4Ub9T/mLMeqx247Gl1dVKDc2kTQlXcLrW7kuIWc1LYVJsPibXqrLr020
	 xAGXayGBpPKH619Tu2UpqsxVBsDmzZdVr9v7xbf65NeU0ih2tKW3prP+O3g3kNN/l0
	 /GeZR+GINf8hw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSbfv48M
  kg6snOCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oztj68zFVzirlj+7iBTA+Mlri5GLg4hgSeM
  Eg3fZ7FDONeZJHYfP8sE4exhlLj1pZ2ti5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBP4kls3eA2SwCqhIbFvWC2bwCThJHP68CsyUEFCSmPHwP1ssp4CxxfuZ9JhBbCKhm3d
  KDLBD1ghInZz5hgZgvIXHwxQtmiF5FidmXm1kg7AqJGTO2sUHYahJXz21insAoOAtJ+ywk7Qs
  YmVYxWiUVZaZnlOQmZuboGhoY6BoamuoaW+qaGuklVukm6qWW6panFpfoArnlxXqpxcV6xZW5
  yTkpenmpJZsYgWGcUqxusoOxe+VPvUOMkhxMSqK8Mxc+TBLiS8pPqcxILM6ILyrNSS0+xCjDw
  aEkwbvpFVBOsCg1PbUiLTMHGFMwaQkOHiUR3gdvgdK8xQWJucWZ6RCpU4yKUuK8FR+AEgIgiY
  zSPLg2WBxfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMKwgyhSczrwRu+iugxUxAi7coPAB
  ZXJKIkJJqYFJjaXRrCyleOkNvW22VosGP/b+8SuYH90oxza7R+fY6J2ZthdPVq/4LLYzm3Nu9
  K0/p1L3COcIa83lSH0hNPTs7spC3x3ZdcqHQ1c3OhbpZor9X/dE8viDN6P2hmNYZce4NJamhD
  HMLE9rT2wKCJqUGdMYId5ft50nZfuxWz4PC9x/92Lo5nv2Z9/axRtFN+4Sr6TN6NXZOPOl4aF
  fG2wnLPoRIxNT/Z9y65VsXt8r0U8dnu7CysB2+dCcxP9oh+dntgOf6rnEtegmXCitnf3ZR33F
  hVUdoK6fILvk3IXxJpvf/K/I/znS0MpncYlGiynLqV+DKf9UHZXR8i448XPmwa2Z2mUWFZOXC
  BBEfJZbijERDLeai4kQAMcAW/l4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-571.messagelabs.com!1658974606!561576!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8580 invoked from network); 28 Jul 2022 02:16:46 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Jul 2022 02:16:46 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D3E971000C0
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jul 2022 03:16:45 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C7316100078
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jul 2022 03:16:45 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Jul 2022 03:16:44 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xmlschema: upgrade 1.11.3 -> 2.0.1
Date: Thu, 28 Jul 2022 10:16:29 +0800
Message-ID: <1658974589-10681-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658974589-10681-1-git-send-email-wangmy@fujitsu.com>
References: <1658974589-10681-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Jul 2022 02:16:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98028

Changelog:
==========
  Remove warnings during the build of the package using package_data specs in setup.py
  Fix decoding with process_namespaces=False and xsi:type in XML instance
  Refactor DataElement.get(), restore DataElement.set() (issue #314)
  Add map_attribute_names argument to DataElementConverter

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-xmlschema_1.11.3.bb => python3-xmlschema_2.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_1.11.3.bb => python3-xmlschema_2.0.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_1.11.3.bb b/meta-python/recipes-devtools/python/python3-xmlschema_2.0.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-xmlschema_1.11.3.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_2.0.1.bb
index 7837bc8a4a..68148b7b5c 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_1.11.3.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_2.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
 
-SRC_URI[sha256sum] = "28a135028f7ab1e0c934fc0c6717a66b2dc5f166d123dfe6ce61afc671ad113f"
+SRC_URI[sha256sum] = "1460ba451b4084d4edd031b564f460f5c11b14b20764ce1f64691f8c69e1194d"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.25.1


