Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.83])
 by mx.groups.io with SMTP id smtpd.web08.4467.1628134525298755053
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 20:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WYy4cc79;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.83, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1628134522; i=@fujitsu.com;
	bh=R3ZO4zuWTkIFdILr+i3sef4bzvQd+WbJKvC5ECIKk0I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WYy4cc79zikSe2M4Ib0TvrdJW2jSefXA6K/xX26A8fjpfiHCMWtlZ+bD/kLsZkjWv
	 064LHe6hsVhlq7SdYtXuheeEjbW/X1cyNE1umgNejerADD+XKNaArIj2XweFoqOM84
	 9+e2MtFzohcXUpyGO8WKvCKqfEt9equyMmYAUUw+AnpXOMwErLRyhXeKLWivkU9uFW
	 bTjpVuYMJmlNTQl+0VNfuJ/NdSJ3u6Ex2ygaTiqwarkhBGSJwOheBNqrPUSv1lhQm0
	 pzUsjxN0eVPRHiSG/mGRHHec56Z0emXA2nKJvbsOdO3P+6ABLvuYODPscSRUY5nmUv
	 rfUlqeo46caHw==
Received: from [100.112.198.115] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 85/9B-07821-A7C5B016; Thu, 05 Aug 2021 03:35:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MRolsZw51
  oMH2ClcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFq7RzmggccFU0T97M1MP5l72Lk4hASmMUk
  sauhjaWLkRPIOc4ocfmKF4jNJqAmMf3WDVYQW0RAX2Lp7D3MIDazgIrEi9897CC2sICDxJtDd
  xhBbBag+LflO8BqeAUcJfZ8PgZmSwgoSEx5+B7I5uDgFHCSmP1OCWKVo8SyrheMEOWCEidnPm
  GBGC8hcfDFC6hWRYnZl5tZIOwKiVmz2pgmMPLPQtIyC0nLAkamVYwWSUWZ6RkluYmZObqGBga
  6hoZGuoaWFrpGhqZ6iVW6SXqppbrlqcUluoZ6ieXFesWVuck5KXp5qSWbGIHBmFJw7PoOxquv
  P+gdYpTkYFIS5f0gwZ0oxJeUn1KZkVicEV9UmpNafIhRhoNDSYK3IBooJ1iUmp5akZaZA4wMm
  LQEB4+SCO/SMKA0b3FBYm5xZjpE6hSjopQ4bwBInwBIIqM0D64NFo2XGGWlhHkZGRgYhHgKUo
  tyM0tQ5V8xinMwKgnzzgCZwpOZVwI3/RXQYiagxRdiOUEWlyQipKQamDIcfG4YG4pbXViW+Wu
  e3iKxRVKz5V45a+87aGjIM296XSzDL/muK7+O//rL6DF1G8cPHtummolvP7R4Pm10XlCac3lH
  WvwZvsv8bxjVUlSnqNnfeFSilq32Q/9P5sq3RkuP7qm6/nn7pT0LcnfVdYotPLE0IXRHXt1/9
  /Q8CSEuv51hm0wbnEx+PbVI7HNhWzXFSuGG54J7SVutdBe3PN3ZeumOBJ/X2iKDx/Pq7vUJr9
  YLOrqPTz1y8a8tX9w8L99acu1+xluf249ZtjB5rFIz/dxnedvd44q7Q8gfu4g1nxR+LXg6dau
  S1+nydMs88WvXrJzf6Lc6rDj6Quq8wya/PSsd1H89yP105UrKDwElluKMREMt5qLiRAC2PSYF
  QQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-285.messagelabs.com!1628134521!591361!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25771 invoked from network); 5 Aug 2021 03:35:21 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-16.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Aug 2021 03:35:21 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1753ZGJp017343
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Aug 2021 04:35:21 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 5 Aug 2021 04:35:16 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libqmi: upgrade 1.28.6 -> 1.28.8
Date: Thu, 5 Aug 2021 11:34:50 +0800
Message-ID: <1628134490-5097-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628134490-5097-1-git-send-email-wangmy@fujitsu.com>
References: <1628134490-5097-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libqmi/{libqmi_1.28.6.bb => libqmi_1.28.8.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.28.6.bb => libqmi_1.28.8.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.28.6.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.28.8.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.28.6.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.28.8.bb
index f062d8631..ebc8b8b8a 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.28.6.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.28.8.bb
@@ -14,7 +14,7 @@ inherit autotools pkgconfig bash-completion gobject-introspection
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "cbb890893de1dee06ea5ebdac2d22f0469314a6f93f15f61f2f1206a1c9ae5fd"
+SRC_URI[sha256sum] = "6e3bbbd200bc1b64b23f6254fef9212f2699ec77cfb32075d2ba5079c73a9f78"
 
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-- 
2.25.1

