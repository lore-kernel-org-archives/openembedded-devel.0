Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C13C54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 09:10:12 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.8829.1664269802763175633
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 02:10:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xcWgAsoD;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664269801; i=@fujitsu.com;
	bh=eK5vd2f8y9yy4e7ZN9qg4khsz6XSQIKW+pqS4fpMDYI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xcWgAsoD+1POhkWanYW/hKx9Gs/cmt6GxRRswUzRaEhyHuMGXxxk99C0K9XJERCVV
	 m3HlG0IL5zjqO30uan3dqU9dDNOXzI93711l4AnK6j22Y5hbsBLUJEi40iwBp4hGsZ
	 GfgLf9QR+tyFkp8k4Immx4v6FVD69dv0VDIAnJq/oxZpEqxG8itc2LX9/R/Nh1Ej9N
	 rYkJgrPUz2lIhQpu0Gp2+SfE6J22+n2KJ4Gyxt+QGKmnWTU3wnUeyaQ4etRgQ0NwRF
	 8yHbHi1nniFEsFFJQNMa5ieJiTYNDv3TxB7VGxpNEdxI3zPPVuPSkUvIDkCY6CTtXQ
	 zWK0D340w3h1Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqPtir1G
  ywaNVJhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bMl7fYC1bwVKyZntTA+JOri5GLQ0jgCaPE
  12N7GSGc60wSLZOOMUM4exglzp1+wt7FyMnBJqAmMf3WDVYQW0RAX2Lp7D3MIDazgIrEi989Y
  DXCAj4SK0/PYwGxWQRUJZ5NXAUW5xVwlJg8rZ0JxJYQUJCY8vA9WC+ngJPEh7vdQDYH0DJHib
  6WBIhyQYmTM5+wQIyXkDj44gUzRKuixOzLzSwQdoVE4/RDUCPVJK6e28Q8gVFwFpL2WUjaFzA
  yrWK0TirKTM8oyU3MzNE1NDDQNTQ01TW20DUyNNJLrNJN1Est1S1PLS7RBXLLi/VSi4v1iitz
  k3NS9PJSSzYxAoM4pVjtyg7GPat+6h1ilORgUhLltV9klCzEl5SfUpmRWJwRX1Sak1p8iFGGg
  0NJgldyN1BOsCg1PbUiLTMHGFEwaQkOHiUR3nVLgNK8xQWJucWZ6RCpU4yKUuK8pluAEgIgiY
  zSPLg2WBRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMa7oHaApPZl4J3PRXQIuZgBbb8em
  DLC5JREhJNTAtWW8y1f1Y4bwrhyyjhb5tXC54/KqHwddFN6XV7JLfiq+aOHN5fHYKb/Wiferx
  s8tV2eIrNn85Nd+hdmflu+pwlgfb4pf/O/dDRPGe6yLl16uli/PZYtPjPJZc/rpr9tmLFrExs
  S5ZOtxrXvP/mhe1u6wgd2+5I5/fuvwJqbE/v92f9I+rNIyj23q9Ltc75UPT+Uw0f8fKrW3keD
  939/SFS+9vk3Zt9Zx/49H3PQrLrR4fvfNAQJMt8lGB2tE8ebvMRqMTHQyv3F5UvVfeuOqZn8W
  U1o+ztKS9Ju5ICWv5WXha4Yms3JmlpzK4p8t6mlZ85/zh0eX1KPr2rc+vQ7vvifpfFus5N3Xu
  DyWmeznJSizFGYmGWsxFxYkAytr7Jl0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-571.messagelabs.com!1664269800!492310!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7368 invoked from network); 27 Sep 2022 09:10:00 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 09:10:00 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 8DBB010019E
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:10:00 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 76AC3100199
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:10:00 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 10:09:58 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-humanize: upgrade 4.3.0 -> 4.4.0
Date: Tue, 27 Sep 2022 17:09:39 +0800
Message-ID: <1664269780-2655-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1664269780-2655-1-git-send-email-wangmy@fujitsu.com>
References: <1664269780-2655-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 09:10:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98982

Changelog:
==========
Added
-------
    Add installation instructions (#56)
    Internationalise the decimal separator in intcomma() (#53)
    Internationalise intcomma for de_DE locale (#49)

Fixed
------
    Replace short scale with long scale for Polish numbers (#54)
    Fix intcomma() failing with a string as input when ndigits is not None (#52)
    Fix some pylint findings (#42)
    Fix "ValueError: math domain error" for metric(0) (#47)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-humanize_4.3.0.bb => python3-humanize_4.4.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_4.3.0.bb => python3-humanize_4.4.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.3.0.bb b/meta-python/recipes-devtools/python/python3-humanize_4.4.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_4.3.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_4.4.0.bb
index 55386b6907..7bb03b75f2 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.4.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "0dfac79fe8c1c0c734c14177b07b857bad9ae30dd50daa0a14e2c3d8054ee0c4"
+SRC_URI[sha256sum] = "efb2584565cc86b7ea87a977a15066de34cdedaf341b11c851cfcfd2b964779c"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


