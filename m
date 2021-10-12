Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC96C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 23:50:15 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.1106.1634082610459711498
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 16:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pUk9FnWx;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634082608; i=@fujitsu.com;
	bh=Puc+boYWe0pijq7D7nLiiwvOANZxXRF91jFCl9gllF4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=pUk9FnWxGCP4lYlCKBxpy3e9lat/JeCZl+EO9Vo6zgwvLFAYsVfScGX4K1w32i37O
	 g2Cr+m+0sMdsssxNdJeq1Q1VFzossXh9e9pVLYpL8g2r1PjKSAMGfppeMyAoNinnJ9
	 YwBqBxWkFedqmwcXXlB0IJj/tBrW/PLz7p/oiFUe5H4fdLODQ3g+AlK7wNW10O0HTr
	 RfbKidWOrRzs7FbbUN6uULpPGZHv9rtQpjQw0fY3TidOUUE3OYp9yiMFJHyExxTRTN
	 lOTXWcEgKJaF8lfl5WYBuVXnkaNQuUAMontnMdBpu8MfmZ9mPqhovvT4GsGinu/rLG
	 ZIlm3E3M935ZA==
Received: from [100.113.2.26] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id FF/7F-08252-03F16616;
 Tue, 12 Oct 2021 23:50:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8ORqKsvn5Z
  ocPuUhsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrHz4XqmggcCFTO//GFtYFzP18XIySEk8IRR
  4toU9y5GLiD7ApNE799jzBDOCUaJ10u+soNUsQmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  1iNsIC7xILZR8FsFgFViZ19s8FqeAWcJaZe/8YIYksIKEhMefgeKi4ocXLmExaIORISB1+8YI
  aoUZSYfbmZBcKukJg1q40JwlaTuHpuE/MERv5ZSNpnIWlfwMi0itEyqSgzPaMkNzEzR9fQwED
  X0NBYF0gaG+glVukm6qWW6ian5pUUJQJl9RLLi/WKK3OTc1L08lJLNjECQzKlkKFpB+O7Vx/0
  DjFKcjApifLaLUxNFOJLyk+pzEgszogvKs1JLT7EKMPBoSTBe0U6LVFIsCg1PbUiLTMHGB8wa
  QkOHiUR3ptyQGne4oLE3OLMdIjUKUZ7jpdrlyxi5mi6dxdITllwcDUzx532Q6uZhVjy8vNSpc
  R5b8gCtQmAtGWU5sENhcXzJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvE4CQFN4MvNK4Ha
  /AjqLCeiswKgUkLNKEhFSUg1MrUdP9Lx3us6fpnevw1b97va5H03ffZ5af0AoVEzx7O7spz//
  lQh/NbW+YNn848iV/8VMfkF3I3WPHTJKXHF57w1T67w5Ta3rFdN3hsz+b+MetCzmtJlMwe+bm
  8rmt92sv3jo6YRjgsyP4x8Y1i3gWx55Qi76T9q3R4bZH7cml/9KKNgxoej6xvNZd0q3+55+Ff
  ei7EDO2Q3dn1TPpcx1cL/2eMWrtE1/0oUr19Vvyd1R0LmM+VSv/YXjK2wME2WsXL/PdGbxW5f
  TtXr1+XtN55VXydZ3TDR6m8h5RH3+iWe7ZS9O/7Em61ZJVuZzIYWwK9GXFWMKSiIYD2/5d8Nl
  fcu5Cr8r3+51xfQduZL4co4SS3FGoqEWc1FxIgCk7X1VYgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-226.messagelabs.com!1634082607!128705!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6524 invoked from network); 12 Oct 2021 23:50:07 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Oct 2021 23:50:07 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 1444E10025E
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 00:50:07 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 012B5100248
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 00:50:07 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 13 Oct 2021 00:49:45 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] openvpn: upgrade 2.5.3 -> 2.5.4
Date: Wed, 13 Oct 2021 07:49:33 +0800
Message-ID: <1634082575-112891-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Oct 2021 23:50:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93260

2021.10.04 -- Version 2.5.4

Antonio Quartulli (3):
      route.c: pass the right parameter to IN6_IS_ADDR_UNSPECIFIED
      configure: search also for rst2{man, html}.py
      networking: add networking API net_addr_ll_set() and use it on Linux

Arne Schwabe (1):
      Move examples into openvpn-examples(5) man page

David Korczynski (1):
      Fix argv leaks in add_route() and add_route_ipv6()

David Sommerseth (2):
      doc: Use generic rules for man/html generation
      man: Clarify IV_HWADDR

Gert Doering (1):
      Add error reporting to get_console_input_win32().

Lev Stipakov (3):
      Fix console prompts with redirected log
      Add building man page on Windows
      GitHub Actions: remove Ubuntu 16.04 environment

Max Fillinger (1):
      Update Fox e-mail address in copyright notices

Selva Nair (1):
      Minor doc correction: tls-crypt-v2 key generation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openvpn/{openvpn_2.5.3.bb => openvpn_2.5.4.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.5.3.bb => openvpn_2.5.4.bb} (95%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.3.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.4.bb
similarity index 95%
rename from meta-networking/recipes-support/openvpn/openvpn_2.5.3.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.5.4.bb
index a70e9708de..6b588a5f50 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.3.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.4.bb
@@ -14,8 +14,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[md5sum] = "08895fd1142f25fdd94a98315632e1bf"
-SRC_URI[sha256sum] = "75f0044df449430555ca7b995a2b77ab24f2946fdc3668301b8edc23986a5f7e"
+SRC_URI[sha256sum] = "f80f3c3df1b94a8892ae547df84f152583250684a24bd022ccc98ef56fa93d97"
 
 # CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not for openvpn.
 CVE_CHECK_WHITELIST += "CVE-2020-7224 CVE-2020-27569"
-- 
2.25.1


