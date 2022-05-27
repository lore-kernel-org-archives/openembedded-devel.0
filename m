Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1CEC433FE
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 01:16:15 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web11.2557.1653614169425853860
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 18:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nY43fEHw;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653614167; i=@fujitsu.com;
	bh=J/vcjltiLD/bhvVwqxhJrcdkn1thBAs0vw7hOyQwX4o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nY43fEHwq9dE8qQBZM7y198rER9nHRhuakujCAgLs/zJuxR8+DlG+jGT5HoyMh/jj
	 aEvmUq+SrPRjmhIUw5VBkb9DGoVOO42ck7xsmgv5nDjF+CnHFdLhc+4415CK5dYgAu
	 BIhZdaOg7kTXehWF0BEP+9uhNmV3AnvGbgN0aftoms2RHoJF7T7dxnAXjzVq4pOGEk
	 POgkb9WCcFXjfJJnNrSswqjY8f10h2Z2o6Lh+2BRLv2wetvU0HEHeBW/hozLqk9mO5
	 7ptI/DspiIrVzcC5SoHD1NyTH/v8xf/JugrCo+0HT+z//hiNYcApWD37ToqwtKjZ8t
	 peFij9TSmY08A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqBumNiH
  JYNZtHYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePQwa9MBS3cFU9aFzA2MDZwdTFycQgJPGGU
  uHJ7LxuEc4FJYv7KCSxdjJxAzklGidebXEBsNgF1icc3XzOC2CIC+hJLZ+9hBrGZBVQlui+uY
  QexhQV8JTbeewjWywIUX37nAhuIzSvgLjG59Q9YjYSAgsSUh+/BejkFPCTO3LnCCLHLXWLNmU
  ksEPWCEidnPmGBmC8hcfDFC2aIXiWJEys+MkHYFRKvD1+CiqtJXD23iXkCo+AsJO2zkLQvYGR
  axWiVVJSZnlGSm5iZo2toYKBraGiqCyRNTfQSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yorc5Nz
  UvTyUks2MQKDOKWYYdYOxll9P/UOMUpyMCmJ8mbe608S4kvKT6nMSCzOiC8qzUktPsQow8GhJ
  ME7S2lCkpBgUWp6akVaZg4womDSEhw8SiK8SjJAad7igsTc4sx0iNQpRkUpcd4nKkAJAZBERm
  keXBssii8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEubtVQaawpOZVwI3/RXQYiagxfm8vSC
  LSxIRUlINTL6C0lxHKtal8R2wMsq8zimf7v+95WdryCwloTu7nIVz8++sVff8uPH0xUeu+zlE
  l/Oa18Wlxh/IU2zz03jX5zVJrfLYoxUbdU3u2X0QVep6IfL3Sc+BQ2WVDSGb3deayf329j22g
  JXxI6Pys6o1O1rObNlZfE4w6e3MnPvTzwVO1wv/efjb2sSyZ1sVfA1Mfkm1BgivZoi20NIyf/
  DvXKv33F2lBUw1fs4uwe9znzDnz4s2XKu+d/H83U6T/gWvXX39hXDI2/OvbucuK1nh+/f4MpU
  8deP8FQYvSxJOz5m/du09xpOPxE7O9xfn47zG6Jrv+qV23bqY7GONDBq7lsg7fAxQ6fa/ra9/
  41VFsRJLcUaioRZzUXEiADGVbRNdAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-585.messagelabs.com!1653614166!97297!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6836 invoked from network); 27 May 2022 01:16:06 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 May 2022 01:16:06 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3C7F510019A
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:16:06 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2ACA4100190
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:16:06 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 27 May 2022 02:15:50 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-astroid: upgrade 2.11.3 -> 2.11.5
Date: Fri, 27 May 2022 09:15:29 +0800
Message-ID: <1653614132-27735-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653614132-27735-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1653614132-27735-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 01:16:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97287

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
=========
-  Fix crash while obtaining object_type() of an Unknown node.
-  Fix a bug where in attempting to handle the patching of distutils by virtualenv,
   library submodules called distutils (e.g. numpy.distutils) were included also.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-astroid_2.11.3.bb => python3-astroid_2.11.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.11.3.bb => python3-astroid_2.11.5.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.11.3.bb b/meta-python/recipes-devtools/python/python3-astroid_2.11.5.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.11.3.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.11.5.bb
index a2e911137..f11a4a13d 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.11.3.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.11.5.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "4e5ba10571e197785e312966ea5efb2f5783176d4c1a73fa922d474ae2be59f7"
+SRC_URI[sha256sum] = "f4e4ec5294c4b07ac38bab9ca5ddd3914d4bf46f9006eb5c0ae755755061044e"
 
 inherit pypi setuptools3
 
-- 
2.25.1


