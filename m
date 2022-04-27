Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 720A9C43217
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 06:38:04 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.6855.1651127874009299149
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Apr 2022 23:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Sw8aoHeI;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1651127872; i=@fujitsu.com;
	bh=V5e1bVbgWwZc5Ri/fn7rebnejOCZO1pntqtLiH8cXIw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Sw8aoHeIk1B0DsLWDT92EMMCwEoIvFzf5kr1wsTuzn5iXsi0TIB6AomezsXk1sfa0
	 w7I2wb4kUl7asxGIzo6WYPOCBgky1/91ad6zgHGTw0IIixry6Cmqofk8Z/917tnKVY
	 IGVL6hoG/31lJfadHGm8rz/1hN6eRLTje2mi+nOw7xU+0/cTWDSLf5AdhbzQ2QoxzA
	 u+yZGOe4wB0PKHz+/2/Up/nNi+kxczJfOdDHO7IERWVmjO/J48TMEWig6yEk/LOv8K
	 wWLo06aHg256iAMUIp0rw80pwc6aJ8vrZCECJE/JCdkMiTkkglLBaKQAUnODJDh/Cb
	 cpoEe6NXfmIzg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSdfeLCv
  JYM9jM4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePT/2b2gs2cFVdWHGVqYLzN0cXIxSEk8IRR
  Ysasx8wQzgUmiYlbW6CcPYwSS15uZuti5ORgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBXYuqxOWA1LAKqEm0vvgDZHBy8Ak4Sz+eng4QlBBQkpjx8D9bKKeAs8fPdRLBWIaCSvk
  mTmEBsXgFBiZMzn7BAjJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI+C0n
  7AkamVYzWSUWZ6RkluYmZObqGBga6hoamusYWuoZG5nqJVbqJeqmluuWpxSW6RnqJ5cV6qcXF
  esWVuck5KXp5qSWbGIFhnFKsVr+D8cXKn3qHGCU5mJREea1Ms5KE+JLyUyozEosz4otKc1KLD
  zHKcHAoSfBmmwDlBItS01Mr0jJzgDEFk5bg4FES4ZUxBkrzFhck5hZnpkOkTjEqSonzLgSZKQ
  CSyCjNg2uDxfElRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK80SBTeDLzSuCmvwJazAS0eGV
  RJsjikkSElFQDE6uCWtpKqYD+ezcD7wYoPQ9h0/nhlbBC+PrBaOmVMVuSj6yWPjj7/18FWS+p
  B9Me/jHSe3Pv+OLDK1nrX/998+J5UPKc59yyNXN+Na03uHzk5CLj+5MiHT5Om1w1w3mGRVilX
  +rR6Z+k9Fcnufqz5PYlKzW59Gz+8fRFGbNNaGjT/IWHmSwOVF+avf1wbf907jbT2Xcfzt3v8G
  fB6UWXy77Y6THNWBm54bvR91XizJNq15fbh59Ku3349rE3alErhByj/p7U2Kn1Vjpttd3dZ7F
  Z87fteXpd6NXWYn/1bcqKldM+lrm/UX2+sVVyzzeJryfcWY5Z/C4VSZi+fbZb4I9Xd0yK990O
  X33Admp+lx+zEktxRqKhFnNRcSIAysGAVl4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-548.messagelabs.com!1651127871!33482!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14563 invoked from network); 28 Apr 2022 06:37:51 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Apr 2022 06:37:51 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 8B61C100445
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 07:37:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7510010033B
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 07:37:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Apr 2022 07:37:40 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-twisted: upgrade 22.2.0 -> 22.4.0
Date: Thu, 28 Apr 2022 06:53:28 +0800
Message-ID: <1651100009-17477-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651100009-17477-1-git-send-email-wangmy@fujitsu.com>
References: <1651100009-17477-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 06:38:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96819

Changelog:
https://github.com/twisted/twisted/releases/tag/twisted-22.4.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-twisted_22.2.0.bb => python3-twisted_22.4.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twisted_22.2.0.bb => python3-twisted_22.4.0.bb} (99%)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb b/meta-python/recipes-devtools/python/python3-twisted_22.4.0.bb
similarity index 99%
rename from meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_22.4.0.bb
index f4575c9c2e..9429f8faab 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_22.4.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.twistedmatrix.com"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f8d67f84b6e178c92d471011b2245fc"
 
-SRC_URI[sha256sum] = "57f32b1f6838facb8c004c89467840367ad38e9e535f8252091345dba500b4f2"
+SRC_URI[sha256sum] = "a047990f57dfae1e0bd2b7df2526d4f16dcdc843774dc108b78c52f2a5f13680"
 
 PYPI_PACKAGE = "Twisted"
 
-- 
2.25.1


