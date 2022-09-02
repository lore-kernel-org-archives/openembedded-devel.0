Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D027CC6FA82
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 01:35:46 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.1646.1662082538555179477
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Sep 2022 18:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nvuRmYaV;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662082536; i=@fujitsu.com;
	bh=KLKCNce38tufFYhM9E71xfETADvsNzhwZTXVuB16z1I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nvuRmYaVmld5QPYafn26HajDse9ezjNOqdhnzpk6z0PEFfCmzlTz/zcWNnUWafljX
	 B6g86cuDztRsLMfPGM2dnv48vwMrRrS8F5qmPZz6c4Cy+XVgtbUGQcOD5UcCPkvdVx
	 VX2MX3UOHK4lFfavCQjeb09fHIxb5S+el/mAXvQW2e2BxDybl2gRNpmevaR9sNorLA
	 HW2GY6hPKuOOyHiQxotzaPmekd5bR02XKa4Dfd4QL3de1o2yBLHaAmv1CyqFxvtPE1
	 uZ6vtGND6SgK7UgfBfiII/E4q0FDP7ayyawmkHpA1ss+GBa6r8iu6oJu1EFdwZJb5q
	 1GXvgNuG0lI7g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORpPs8VjD
  Z4OdWNouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPalr3MBT2cFVdXHmZqYFzH0cXIySEk8JBR
  4uIFmS5GLiD7CpPEp/mnWCGcE4wSv349ZQSpYhNQl3h88zWYLSKgL7F09h5mEJtZQFWi++Iad
  hBbWMBH4u2TGWA2i4CKRG/jFKBBHBy8Au4SGw5zg4QlBBQkpjx8D9bKKeAhMWnFfTaQEiGgki
  3vPUHCvAKCEidnPmGBmC4hcfDFC2aIViWJEys+MkHYFRKN0w9B2WoSV89tYp7AKDgLSfssJO0
  LGJlWMdokFWWmZ5TkJmbm6BoaGOgaGprqWprpGloa6yVW6SbqpZbq5uUXlWToGuollhfrpRYX
  6xVX5ibnpOjlpZZsYgQGcUpxwsEdjCv2/dI7xCjJwaQkysv0RyBZiC8pP6UyI7E4I76oNCe1+
  BCjDAeHkgSvVoxgspBgUWp6akVaZg4womDSEhw8SiK8f8OB0rzFBYm5xZnpEKlTjLocM7+2HW
  AWYsnLz0uVEueNjQIqEgApyijNgxsBi+5LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5/SO
  ApvBk5pXAbXoFdAQT0BHTZ/KDHFGSiJCSamDimjV19X7df6ZTZZRrOkuyl+tO48674s99495B
  1pySe4kTM9fZLteOfBn1Nn6fabD99+CK0mvNWfy/dHbYWRtOtzhjpHZaoKhUtsvtUWLfm+0R1
  8K1pihXqho3XG08dPnlHKHN98798dj7ua9DglH3n6HUge2SyXJmBVWfY5T468X1Ah2ncrpJbX
  2qHPlItdAx6argYcVKt0M2mqxPo3WDL4nNZji+ksNvVZt2+qUbxy0ExZbllxRer35wKc4xau6
  0zZbarceify8LcP+damPoe9xRM03vzr3gTdNsk2vn3H25++X8Hr3Za/8GZSdNXra0/dnVqPUh
  iTKvuvRLHxuXWl09mXL0yuEkPo5aayWW4oxEQy3mouJEAM4n2yVpAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-728.messagelabs.com!1662082534!213519!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29968 invoked from network); 2 Sep 2022 01:35:35 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-15.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Sep 2022 01:35:35 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 8719E1AD
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  2 Sep 2022 02:35:34 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 7C34A1AB
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  2 Sep 2022 02:35:34 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 2 Sep 2022 02:35:32 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyudev: upgrade 0.23.2 -> 0.24.0
Date: Fri, 2 Sep 2022 09:36:39 +0800
Message-ID: <1662082601-12677-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1662082601-12677-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1662082601-12677-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Sep 2022 01:35:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98591

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-pyudev_0.23.2.bb => python3-pyudev_0.24.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyudev_0.23.2.bb => python3-pyudev_0.24.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.23.2.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.24.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pyudev_0.23.2.bb
rename to meta-python/recipes-devtools/python/python3-pyudev_0.24.0.bb
index 4c4c959eba..84154641ff 100644
--- a/meta-python/recipes-devtools/python/python3-pyudev_0.23.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyudev_0.24.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "A libudev binding"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI[sha256sum] = "32ae3585b320a51bc283e0a04000fd8a25599edb44541e2f5034f6afee5d15cc"
+SRC_URI[sha256sum] = "b2a3afe1c99ea751f8296652557eac559874da2a1b1ec0625178706ec5a345f3"
 
 inherit pypi setuptools3
 
-- 
2.25.1


