Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A4EC54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 11:25:04 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.6498.1662549894205554210
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 04:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=azgKDhcl;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662549892; i=@fujitsu.com;
	bh=LvsOlNzTQDm4dZuK0Cjm+K5iNT4yh+fGYdIjMeGGoVQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=azgKDhclKaTc+zvi0h/rP+iEuUl+qgqgkqmEZhmxaXT1A+AR8dV2/ULb02ujy/bBe
	 bG1F4UqHD9FtUE/oC6qXBBCJoYDZvR9oC2YdJyshWHrh3AmpS6ef7FDTZ7r10iaV5D
	 k4u2Aq0NLsIZ3apjWCPlcqnU8Z1Cv5wzjhxsYKzAIwEh8FNIKzZseJSV7+t/b72fe+
	 gtLDDq04V+3Qm1WB6j1I9x/Mi3QjmZ+xYfqR06FnJry/IB42uNraffroupeISu0b0j
	 l/alu1ZT8cI7Aj51bNc8pfRz9s/LTNd2Rn83W6FSzFjn+j2kLdjJ7XxFz2IuNXPniw
	 k+VW4G7L/GhkA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8ORpNtSL5F
  sMH0qr8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtF38yRzwWLOin/LXBoYL3J0MXJxCAk8ZJS4
  +vImE4RzhUni7uIF7F2MnEDObkaJk3MCQGw2ATWJ6bdusILYIgL6Ektn72EGsZkFVCRe/O4Bq
  xcWCJL4/281G4jNAhT/dXUdUA0HB6+Ak8SFG4IgYQkBBYkpD9+DtfIKCEqcnPmEBWKMhMTBFy
  +YIWoUJWZfbmaBsCskGqcfYoKw1SSuntvEPIGRfxaS9llI2hcwMq1itE4qykzPKMlNzMzRNTQ
  w0DU0NNU1ttA1NDLXS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxNzknRy0st2cQIDMmUYrX6
  HYwvVv7UO8QoycGkJMob5yWRLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCV6oGKCdYlJqeWpGWm
  QOMD5i0BAePkgjvs1qgNG9xQWJucWY6ROoUo6KUOO9ZkIQASCKjNA+uDRaTlxhlpYR5GRkYGI
  R4ClKLcjNLUOVfMYpzMCoJ8zLUAU3hycwrgZv+CmgxE9DirYHiIItLEhFSUg1Mannf97ypviZ
  Z9ODlzndbLWbvyyjlEHxmOdtfeaGnOYfqzu+F30SXCUnGr717/Fc4m8r7CKE/t41yRSKMXY3z
  dt3/K/DS9jwfR8qDvLSVpx6sYbu+wa56/sX3ZSqfzeLK3dbnJmwPWKfCF263bbvQu2k7/+7Ky
  Mw1+3PlUR2z1XRtvmXer0OXlqaKi9WKvHwdHbJDd/4V/Z93PBXqTFO5eJ4kFojaOvU/dudW5/
  5vIHh9H/MOv9U+DkWOiwvyajrcQ0UkQ+cc0xCxOOH3lSXnLM+j7K2vp/D1LN6wimnfpML9D1l
  WH5UIXJCWOmFx/3SGXyf9RIo+veE4uP3ei6gX/1crbVy5p+L8w9QV1q0flViKMxINtZiLihMB
  5RUKdkQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-565.messagelabs.com!1662549892!333314!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23576 invoked from network); 7 Sep 2022 11:24:52 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Sep 2022 11:24:52 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id DD3C91B1
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  7 Sep 2022 12:24:51 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D22FB1AF
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  7 Sep 2022 12:24:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 7 Sep 2022 12:24:50 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-grpcio-tools: upgrade 1.48.0 ->
 1.48.1
Date: Wed, 7 Sep 2022 19:24:27 +0800
Message-ID: <1662549869-17948-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 11:25:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98686

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-grpcio-tools_1.48.0.bb => python3-grpcio-tools_1.48.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.48.0.bb => python3-grpcio-tools_1.48.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.48.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.48.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.48.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.48.1.bb
index fcd2840701..d295429ae3 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.48.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.48.1.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools3
 DEPENDS += "${PYTHON_PN}-grpcio"
 
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
-SRC_URI[sha256sum] = "dd7f757608e7dfae4ab2e7fc1e8951e6eb9526ebdc7ce90597329bc4c408c9a1"
+SRC_URI[sha256sum] = "1178f2ea531f80cc2027ec64728df6ffc8e98cf1df61652a496eafd612127183"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
 
-- 
2.25.1


