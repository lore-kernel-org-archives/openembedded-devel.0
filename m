Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299C3C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:10:04 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.66408.1680516595774319444
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Bs/qqMF+;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516594; i=@fujitsu.com;
	bh=pb4Gx7A1KfmukycEfYnhUmBcmjonuEKm3LxRrZJ/VLY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Bs/qqMF+BdFINtVl1gqFE/GSnV/xcL543D3j76LEMYqsVy86Qsgcn1zelQKI3+YfE
	 6Vh9KoFKB014SKESx7J5J2o6KK5A1xcrakDRBpA/54yg3BNiIkX2yQ6mEUj9Qch8xg
	 8qwjo2gBtGI01DHH9F1OmIX9pbuiZVxXFnNsUVW5ozMDzoJwBlycnCzB2/t+grOc5C
	 crKTik8249OpkHeFgh+rbnLysPXH/uqDAVN0mH6NKMpsfKzLnE0Vgt5Z+ev3xHEsBB
	 WYgtCeY9+k6aopvDbPVrweVt5JVSKDVpMKIxfNhlz/5jHykVHt8dmKmBxIcAi239xo
	 0Tkn5DgDSzDAQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxSffjUq0
  Ug7a7FhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bTpd9MBUu4K16uOsrewPiKs4uRi0NI4Amj
  RGfbSSYI5zqTxKMzC9kgnN2MEpd7twJlODnYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48buHH
  cQWFnCX2LRlM1icBSj+dNVCMJtXwEni96MHYLaEgILElIfvoeKCEidnPmGBmCMhcfDFC6gaRY
  nZl5tZIOwKicbph5ggbDWJq+c2MU9g5J+FpH0WkvYFjEyrGE2LU4vKUot0TfWSijLTM0pyEzN
  z9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS9PJSSzYxAoMxpVht1w7GCX1/9Q4xSnIw
  KYnyCtZrpQjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4J23CCgnWJSanlqRlpkDjAyYtAQHj5IIr
  +ICoDRvcUFibnFmOkTqFKOilDhv3BKghABIIqM0D64NFo2XGGWlhHkZGRgYhHgKUotyM0tQ5V
  8xinMwKgnzii0GmsKTmVcCN/0V0GImoMWtURogi0sSEVJSDUw5/7/901vs0feak1s49O7lV15
  lN5crpPLyJG+4LTBlFp/Ek9h5q+a2Rsnlte76uEb1wxyxU/oe/yvVGFtL4jdfk+edu/3jykVP
  lX493FW33dKQ9b4KN+PkV6a7DBjWqZ56UL3+juxz34WqRltW3vozhc82pZBx254nM5PZ832Uk
  q0e2RY4CTlv+5AQe+bYjdbNzRU5ImoXVje7mczvv/rr69Fej+tzD3KXvouq9Uv4NXVq+y2RVe
  GFG/887Lk34/WqNWdFxELefkqe5fdeYvOi++y5l7N+xEqf+PzfpUOcx5x5rleZPd/Eg731swr
  FCt2ubfDd8MU591pPA2Od4d2bO/QV1rT3vAkLWHpl76efSizFGYmGWsxFxYkAGjvmQ0EDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-571.messagelabs.com!1680516593!356625!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3604 invoked from network); 3 Apr 2023 10:09:53 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:09:53 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A31491009B7
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:09:53 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 96A281009B6
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:09:53 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:09:52 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] samba: upgrade 4.18.0 -> 4.18.1
Date: Mon, 3 Apr 2023 18:09:43 +0800
Message-ID: <1680516583-31116-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:10:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101934

From: Wang Mingyu <wangmy@fujitsu.com>

Changes since 4.18.0
--------------------
   * BUG 15276: CVE-2023-0225.
   * BUG 15270: CVE-2023-0614.
   * BUG 15331: ldb wildcard matching makes excessive allocations.
   * BUG 15332: large_ldap test is inefficient.
   * BUG 15315: CVE-2023-0922.
   * BUG 15270: CVE-2023-0614.
   * BUG 15276: CVE-2023-0225.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../samba/{samba_4.18.0.bb => samba_4.18.1.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.18.0.bb => samba_4.18.1.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.18.0.bb b/meta-networking/recipes-connectivity/samba/samba_4.18.1.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.18.0.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.18.1.bb
index d29c1959e..7992fa968 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.18.0.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.18.1.bb
@@ -32,7 +32,7 @@ SRC_URI:append:libc-musl = " \
            file://cmocka-uintptr_t.patch \
            "
 
-SRC_URI[sha256sum] = "70348656ef807be9c8be4465ca157cef4d99818e234253d2c684cc18b8408149"
+SRC_URI[sha256sum] = "cedeaa2f244a0862c4f73b7b9f2ff92d181fd3ba7df80284a2f25f7713b9cc0e"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.18(\.\d+)+).tar.gz"
 
-- 
2.34.1


