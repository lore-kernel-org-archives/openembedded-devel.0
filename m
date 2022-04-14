Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B28FCC5DF62
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:55 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.8752.1649919705362613169
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 00:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=F8615gie;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649919703; i=@fujitsu.com;
	bh=2RMooCAr+o6d5lBQ0zeO7XBPUgXPcH+6eQBmSlW2LgE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=F8615giecoJesjVMkyDiMpOMKHoDZu9wrN3dgmJFUPxYcQ+4yKzYQ+33j1WrLz2fI
	 VwYd27KwNqnJ8tbS/sXIyKNaPnJaNsgL3LI4kBXUOoYCcwbVQbdqsEhX46Zc8tY6cg
	 cAQEVDWuJKc8RwG2XViBhFUvlZdMoeWUKM2tY8ZcDCMASTlkeewgeM9vNpXmwd0sLh
	 9c2hzIDpGaGrobKE+GBkYC1Z7u5P3fLwu65zmEQ703z3RczJ0XWOQxpeX0GhMmJiDt
	 Fbf6b95EXN736TNwra5mp99Jn17m2uTtemgo7WVZZPRWhmDU3vMTNaQdm8WLc3ZoPS
	 ivb1gNiS4ZLQA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MRonv9WHi
  SwZv7rBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8biS4fZCu5wV3w+5NHAeJCri5GLQ0hgNpPE
  rafzWCGck4wSH3dNZOxi5ORgE1CXeHzzNZgtIqAvsXT2HmYQm1lAVaL74hr2LkYODmEBb4nuj
  QkgYRagcOeae6wgNq+Am8Sa1cvAWiUEFCSmPHwP1sop4C6xaflZJhBbCKhm5/+3TBD1ghInZz
  5hgRgvIXHwxQtmiF4liRMrPjJB2BUSrw9fYp7AyD8LScssJC0LGJlWMVolFWWmZ5TkJmbm6Bo
  aGOgaGprqGugamRjrJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEBmRKMcPn
  HYwL+n7qHWKU5GBSEuVtOhqeJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC9/8RoJxgUWp6akVaZ
  g4wOmDSEhw8SiK8fiCtvMUFibnFmekQqVOMilLivDEgCQGQREZpHlwbLCIvMcpKCfMyMjAwCP
  EUpBblZpagyr9iFOdgVBLmbQWZwpOZVwI3/RXQYiagxd9WhYIsLklESEk1MAUkRp28bGjzWPO
  IXcqDuazLTdhnc4vn1XQknUq3L3w57Q/71XVZu+yyei+d3t609+v/Cw4Ct9ZO2XvehWH781Sb
  sxNOvXKYq6fnoTIz2yGm5f60mjNbuzV6vu56EbbsekpV4oln64zfnLHmeJ9/Ze8Pgy3zZr1+7
  sbXkfhz9v/Md5rL/89ftfjipyqOsGUefE4XUgS2dnTMu7mo56+BkVGFWvem8sWWQp/jbnznaZ
  yeHZi7QDjS1sLptsqkhdoVt2clrO+yvHfM1e/enqSgvyvOX6tao7lvfdKjzRGtbxnmR9zN2Le
  DMTJt5flflofqPzC9jGjZUp/K42hhoB3dt8dU9eu5RYo7YhmsjnFcO26sxFKckWioxVxUnAgA
  MK28tEMDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-19.tower-587.messagelabs.com!1649919702!98781!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30604 invoked from network); 14 Apr 2022 07:01:43 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-19.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 07:01:43 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23E71alX002687
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 08:01:42 +0100
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 08:01:37 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH v2] python3-kivy: upgrade 2.0.0 -> 2.1.0
Date: Thu, 14 Apr 2022 15:02:05 +0800
Message-ID: <1649919725-9565-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649919725-9565-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1649919725-9565-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96647

From: Xu Huan <xuhuan.fnst@fujitsu.com>

License-Updated:
years update to 2022

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-kivy_2.0.0.bb => python3-kivy_2.1.0..bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-kivy_2.0.0.bb => python3-kivy_2.1.0..bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb b/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
index 38f5216f56..684bca03e1 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
@@ -2,7 +2,7 @@ SUMMARY = "Open source Python library for rapid development of applications \
     that make use of innovative user interfaces, such as multi-touch apps."
 HOMEPAGE = "https://kivy.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f0c851d60495c7e27225a819e179208a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=22e7b4dd8140eec57fd7edfd9fa23dfc"
 
 inherit setuptools3 pkgconfig features_check
 PIP_INSTALL_PACKAGE = "Kivy"
@@ -18,7 +18,7 @@ SRC_URI = "\
 SRC_URI += " \
     file://0001-add-support-for-glesv2.patch \
 "
-SRCREV = "dedcb6bcabe3d8d6758dcee607e8c33b174d782b"
+SRCREV = "960b95dc666753f59eff1b449124490fbec10184"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


