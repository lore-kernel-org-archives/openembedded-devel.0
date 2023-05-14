Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC65BC7EE24
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 13:04:35 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.66030.1684069467145815266
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 06:04:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lD86CbOm;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1684069465; i=@fujitsu.com;
	bh=z0ikTIzxOSZdqqwjdDWNaEwhYgPT9znif2nN8EuZeAA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=lD86CbOmo9c9EV1HmPdgl0XpXdvqUcoqXVBjhDIBY35w3DUeefMxQHBV3IMCpPicQ
	 Au6ll2UweGLetG8DnuC+jBPcEWIghLH4FFseEvuCebL2lN7OHWPZxjbNjo/XeoDI8v
	 ks9U7sbSASyidpF3ZXThkqtLZT/NQtovn+p3apN/XTJmrE4FEXaT/ijHVzlGJ9+IQP
	 Xq1fuPF31Bpx5E0kxfMl2uf+uwfyHdYNTAr0QWf136soaOi31aFVFle3TL+lGuvrjL
	 /781IGXbeSHzl9zjdP8EHC7xP92CuoImDCv8qQGbuSrcT2cV/2r5QFvUFb6yVYW7l0
	 7ruthgucWKJfQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRWlGSWpSXmKPExsViZ8ORpBtxJyH
  F4ONNQYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePVkv/sBb+4Kh7cuMnSwPiOs4uRk0NIYCOj
  xNqrfl2MXED2VCaJr8cmsIAk2AQkJKbvPckOYosI6Ep8/DCXEcRmFlCRmDH5CBOILSxgLfGh7
  RcbiM0ioCpxcd0lZhCbV8BJ4lXrf7A5EgIKElMevgeLcwo4S6zadpAVYrGTxLQFtxkhatQkrp
  7bxDyBkWcBI8MqRtPi1KKy1CJdU72kosz0jJLcxMwcvcQq3US91FLd8tTiEl1DvcTyYr3U4mK
  94src5JwUvbzUkk2MwIBIKWZi2MH4aOdfvUOMkhxMSqK810riUoT4kvJTKjMSizPii0pzUosP
  McpwcChJ8OrcTEgREixKTU+tSMvMAQYnTFqCg0dJhDfuKlCat7ggMbc4Mx0idYpRUUqc9wBIn
  wBIIqM0D64NFhGXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnz8twAmsKTmVcCN/0V0GImoM
  W39sSDLC5JREhJNTAVCNTcZ/C2au01Zs4ylticEsfznV1NiOuPbsKCG8u5tle9/lHwxiX2zpO
  b5czv3I/0eXA4l3QtrhCZ9eRe9sXmrAlbXqmGK65yVdx/3+DDB+3pDrkNf1+kO6Ut2uX64Gdv
  puRyXd6i/aenfFKu6+fSmFi1zv6fJHezoX68/anMrb8UhQVXzP4mf9K+yd541rQZU9a7Sa1bL
  79exe/ak+nSVezanSs6dyrxF3yfx1X/s3lmlrPejdOC1xLrV2/MXrHQes6jwGczu94UB7w92/
  wi+Mg5pcu+quv75vULMbyb823NhIBg490V2c7bzomcPN9ZM3d+Uujk+XoX3xkxLvvXcCWpeFH
  mvrc/b+wUjdNXYinOSDTUYi4qTgQA82fELQMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-591.messagelabs.com!1684069464!241917!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7302 invoked from network); 14 May 2023 13:04:24 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2023 13:04:24 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E32881AC;
	Sun, 14 May 2023 14:04:23 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 1610E7B;
	Sun, 14 May 2023 14:04:22 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe][PATCH] fmt: upgrade 9.1.0 -> 10.0.0
Date: Sun, 14 May 2023 21:04:01 +0800
Message-Id: <1684069442-12244-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684069442-12244-1-git-send-email-wangmy@fujitsu.com>
References: <1684069442-12244-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 13:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102569

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 Add " and {fmt} contributors" to Copyright

Changelog:
 https://github.com/fmtlib/fmt/blob/master/ChangeLog.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/fmt/{fmt_9.1.0.bb => fmt_10.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/fmt/{fmt_9.1.0.bb => fmt_10.0.0.bb} (77%)

diff --git a/meta-oe/recipes-support/fmt/fmt_9.1.0.bb b/meta-oe/recipes-support/fmt/fmt_10.0.0.bb
similarity index 77%
rename from meta-oe/recipes-support/fmt/fmt_9.1.0.bb
rename to meta-oe/recipes-support/fmt/fmt_10.0.0.bb
index 34896153c2..a8e6e563da 100644
--- a/meta-oe/recipes-support/fmt/fmt_9.1.0.bb
+++ b/meta-oe/recipes-support/fmt/fmt_10.0.0.bb
@@ -2,10 +2,10 @@ SUMMARY = "open-source formatting library for C++"
 DESCRIPTION = "{fmt} is an open-source formatting library for C++. It can be used as a safe and fast alternative to (s)printf and iostreams."
 HOMEPAGE = "https://fmt.dev"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=b9257785fc4f3803a4b71b76c1412729"
 
 SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
-SRCREV = "a33701196adfad74917046096bf5a2aa0ab0bb50"
+SRCREV = "a0b8a92e3d1532361c2f7feb63babc5c18d00ef2"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


