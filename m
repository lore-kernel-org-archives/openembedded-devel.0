Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E10C3A5A3
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.6676.1649900772265819291
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 18:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fI/Oti/i;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649900770; i=@fujitsu.com;
	bh=I9lymhBbISaw+rbfKBEQnnzx1X047yL7G85aHr/oXg0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=fI/Oti/ir8rlRSsmG0A//Cadftf3mhsVQRJYNqXroIORz+SAhW9JlsaGURl4eW6Ev
	 Qm9cLtGtHQ+3Mq+26BC+sQiY0A5+LIofez+2ZVxpeUn8Cnv6ywFdRW7wVsAQGlcbr9
	 g9BANw6dsZutOTddKZJqO/NlEFOdYtWTfjESnUJTIioQXDldDayUa8LaL75MjnZ4vx
	 gS0lkZEjYx6P50VTBccOBpwbninxIa2+yUPztkhpZbcPr9YIohAflmRdFPmkzc7FMs
	 0yvPK/UFxXqeYBD72DBbGi+vg38Hl42EDJfgiy/5J1XxR8kw2Q9NLK4Yf87rBNDK0J
	 HBucYlrXUYszw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqPuwJjz
  J4PcdXYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePbj07mgsOcFW3nNrM2ML7i6GLk5BASeMIo
  MXFZZRcjF5B9gUnizdL/rBDOSUaJZfe72EGq2ATUJR7ffM0IYosI6Essnb2HGcRmFlCV6L64B
  qxGWCBA4saK1ywgNgtQ/EzrPrA4r4CbxOev88BsCQEFiSkP3wP1cnBwCrhLNDfHQxzhJnH12U
  0WiHJBiZMzn7BAjJeQOPjiBTNEq5LEiRUfmSDsConXhy9BxdUkrp7bxDyBUXAWkvZZSNoXMDK
  tYrROKspMzyjJTczM0TU0MNA1NDTVNTbSNbSw1Eus0k3USy3VLU8tLtE10kssL9ZLLS7WK67M
  Tc5J0ctLLdnECAzilGKFvTsYL6/8qXeIUZKDSUmUN8swPEmILyk/pTIjsTgjvqg0J7X4EKMMB
  4eSBO+pKqCcYFFqempFWmYOMKJg0hIcPEoivHPygdK8xQWJucWZ6RCpU4yKUuK8CcA4FBIASW
  SU5sG1waL4EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3oPVQFN4MvNK4Ka/AlrMBLT426p
  QkMUliQgpqQYmu9s/XR/9Kjqc+UWyMZ5BJUVozpLuWft4dgYElaf9PTm7dv3L6ZNYnx05Fady
  7c2SNjfbgHRJ6RgXqeN75jlnP1W9xPpyx1yr3ovFUlMENCvv6PhUvy5ZVRBss3HPrJ9/1y+68
  3D5J//W37JP54bc0HnzQvDBTp9Lbeuaf99yCHVUdVY/kDSX2VTD3+O1zypl33dR6kpvrB9y6z
  zW+qNyxP5JiC1veb+TR9Ldg+cLuTvuXXHqPC2Qc89iWe73+BwdxWcaF3O2n27i1d9+110w13X
  7XNd47vCpikf5tnqELt95LaVUPJyL90HqxUKpH0fYb7/ceLHWZ5363ekHRJTYfM+uaQ9b9z5P
  Wahje3ysEktxRqKhFnNRcSIADkkHHV0DAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-548.messagelabs.com!1649900769!210135!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27468 invoked from network); 14 Apr 2022 01:46:09 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 01:46:09 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 0FD2310018F
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 02:46:09 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D7E4410019A
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 02:46:08 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 02:46:00 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 1.4.34 ->
 1.4.35
Date: Thu, 14 Apr 2022 09:46:20 +0800
Message-ID: <1649900780-5925-5-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649900780-5925-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1649900780-5925-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96626

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...ython3-sqlalchemy_1.4.34.bb => python3-sqlalchemy_1.4.35.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.34.bb => python3-sqlalchemy_1.4.35.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.34.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.35.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.34.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.35.bb
index b99ed83f6f..5d199dbedb 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.34.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.35.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f4001d1ca15b69d096fa1b4fd1bdce79"
 
-SRC_URI[sha256sum] = "623bac2d6bdca3f3e61cf1e1c466c5fb9f5cf08735736ee1111187b7a4108891"
+SRC_URI[sha256sum] = "2ffc813b01dc6473990f5e575f210ca5ac2f5465ace3908b78ffd6d20058aab5"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.25.1


