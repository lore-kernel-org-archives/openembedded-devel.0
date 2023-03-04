Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF971C678DB
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 11:03:44 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.6823.1677927814919066142
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 03:03:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vcP1eG8l;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677927814; i=@fujitsu.com;
	bh=hYfXnOpyk2RJ2sdazK80G3WiQYU93ayEm9RumnYfgdg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vcP1eG8loAePnZtnlz2WSWNb00fY8mxRAzVKPuz/atdJqaIWD8nTwqrVGhzAkG0wx
	 VxWJzG3sindEQ+Z3lnrff2OWIob4PS9f4Ja2Lev0cNmBVyelUnrf0giG/ftdK9v+Le
	 tPfnpBk2SvzROb8CrUMm8WEZckepVQeM8gIcqjv7q5cDx97TUGFHfdX7FdU3ZbpZUi
	 gLU2TkS2qqZ6iDBUgnruFZ2Ci7IAD0vvUGMiL3qFhe3pCV6tqnNUZezOKCWCvj+yNq
	 E3Y1k6ILDXWbb+bVTV1NiuSZrGJO9NRxJdL2ZTlk2nv2x8gAF2dza29VQfjX9Ie9tX
	 In0nxFd+PEg/A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8ORqNumypx
  icCTc4uLhpcwOjB7nNq5gDGCMYs3MS8qvSGDNuHegomAXZ8Wc45MYGxjvcHQxcnIICTxhlJh8
  zwrCvsEk8fcCfxcjF5C9h1HiyJ6jTCAJNgEpiRv3/7OB2CIC+hJLZ+9hBrGZBVQkXvzuYQexh
  QWcJHZfaASq5+BgAYrvnhwDEuYFCs/bOgVsjISAgsSUh+/BWjkFnCVeXPzLDLHXSaJt1WFGiH
  pBiZMzn7BAjJeQOPjiBTNEr6LE7MvNLBB2pUTrh19QtprE1XObmCcwCs5C0j4LSfsCRqZVjKb
  FqUVlqUW6hnpJRZnpGSW5iZk5eolVuol6qaW65anFJbpGeonlxXqpxcV6xZW5yTkpenmpJZsY
  gSGbUqw8cQfjit6/eocYJTmYlER5J7EypAjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4OVQZE4RE
  ixKTU+tSMvMAcYPTFqCg0dJhHeLCFCat7ggMbc4Mx0idYpRUUqcV0AZKCEAksgozYNrg8XsJU
  ZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvP9BpvBk5pXATX8FtJgJaLHGaQaQxSWJCCmpBqb
  Cn/w5J12Fv+XddFiz7cD2gqbmtxW2i7Jq9B7PPdKirZ7/9b4p74lPLBJ7vtcm+V/j455c7nHA
  oidvdqjv0mbFFzXFbR4M7LPrX+8sFQ/vXqI3e/qknU2r9+9VCT7wKa1paQbLvNRfR8qlAyPdv
  2/wNjoRbV3U5XXI1vvGAang2Y/W5H19EvaOc4PujwvvNE6/P/VR4yvL/2OR/DePvZO8fOupZ4
  6lRu75wMJ9rIEZU5cedNR4KHXmyaOgxI8uvv/1379/tsUhMfTdztCL030nanasqLTyfZliwyN
  4O+h/9M4q8anZjC31Ug3f8s9PT/4z9+aNL7d0ny++/iLj72Xr3fFuAWtqijgtNpzx3bhQiaU4
  I9FQi7moOBEA2AdKzVQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-548.messagelabs.com!1677927813!242547!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5587 invoked from network); 4 Mar 2023 11:03:34 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2023 11:03:34 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B4B4B10019F
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:03:33 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A7EC810019D
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:03:33 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 4 Mar 2023 11:03:32 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] bubblewrap: upgrade 0.7.0 -> 0.8.0
Date: Sat, 4 Mar 2023 19:03:16 +0800
Message-ID: <1677927799-22851-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677927799-22851-1-git-send-email-wangmy@fujitsu.com>
References: <1677927799-22851-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 11:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101357

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../bubblewrap/{bubblewrap_0.7.0.bb => bubblewrap_0.8.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-security/bubblewrap/{bubblewrap_0.7.0.bb => bubblewrap_0.8.0.bb} (91%)

diff --git a/meta-oe/recipes-security/bubblewrap/bubblewrap_0.7.0.bb b/meta-oe/recipes-security/bubblewrap/bubblewrap_0.8.0.bb
similarity index 91%
rename from meta-oe/recipes-security/bubblewrap/bubblewrap_0.7.0.bb
rename to meta-oe/recipes-security/bubblewrap/bubblewrap_0.8.0.bb
index 4d053b54c..06c42addb 100644
--- a/meta-oe/recipes-security/bubblewrap/bubblewrap_0.7.0.bb
+++ b/meta-oe/recipes-security/bubblewrap/bubblewrap_0.8.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 DEPENDS = "libcap"
 
 SRC_URI = "https://github.com/containers/${BPN}/releases/download/v${PV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "764ab7100bd037ea53d440d362e099d7a425966bc62d1f00ab26b8fbb882a9dc"
+SRC_URI[sha256sum] = "957ad1149db9033db88e988b12bcebe349a445e1efc8a9b59ad2939a113d333a"
 
 inherit autotools bash-completion github-releases manpages pkgconfig
 
-- 
2.34.1


