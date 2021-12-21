Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7872AC433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:07:02 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.6329.1640012821790469399
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:07:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PwgVlbUD;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640012819; i=@fujitsu.com;
	bh=VWMoxO9pwJdWZD/tJqp1gR5wm5qgVeVeGZfMO6Ssx1s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=PwgVlbUDwVbq02Ym7/O+pY1J66fn0WoPtQvWuBGhNeLaTDk5HHvzJhk3fMWYtGg8x
	 4b1r5ZnWlB8b7Jqevli73m89VLMEkVYHdUH6++3oiq8SJCl25faDhNDO1dsPu/NP09
	 qo5XSPJkcbRat7XKtXTXb9Wg+uWPfwBu2WMrpx4tlOm8zhnpj82C/ymILVdeZoomg9
	 dP1B92uQU5IE89UA7iPbpKf121hEE5WI0fXy8vnXiRX9Fk0gBn+t4dmykG3q5854k1
	 E7VpbFXr9w9u5VC6rd/omVPh/a8p3Ek1smiE2ThQasnWvdVPiQ3qbqWZiwEcW03rfx
	 DtC/TjMTii8Hw==
Received: from [100.115.32.64] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id C6/0C-09428-31C90C16;
 Mon, 20 Dec 2021 15:06:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRWlGSWpSXmKPExsViZ8MxSVd4zoF
  Eg427xS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxrX7uYCnaIVqz6c5ypgfGZUBcjF4eQwBNG
  iX2989ghnAtMEhtmnWXrYuQEcvYwSvRNiwCx2QR0Jc49XssOYosI6Essnb2HGcQWFnCXWPlkF
  VicRUBVYuOGl6wgNq+Ah8Sn5zvA4hICChJTHr5nhogLSpyc+YQFxGYWkJA4+OIFUJwDqEZRYv
  Z0eYjyConXhy8xQ9hqElfPbWKewMg3C0n3LCTdCxiZVjFaJxVlpmeU5CZm5ugaGhjoGhqa6hp
  b6BoZGuklVukm6qWW6panFpfoArnlxXqpxcV6xZW5yTkpenmpJZsYgcGXUqx2ZQfjnlU/9Q4x
  SnIwKYny8vseSBTiS8pPqcxILM6ILyrNSS0+xCjDwaEkwftzBlBOsCg1PbUiLTMHGAkwaQkOH
  iUR3iaQNG9xQWJucWY6ROoUo6KUOK/3bKCEAEgiozQPrg0WfZcYZaWEeRkZGBiEeApSi3IzS1
  DlXzGKczAqCfOmzwKawpOZVwI3/RXQYiagxUrh+0EWlyQipKQamHSs7b2/6sR3Jn08U7KU5Uz
  QvnkLz96ZE15eM/Fca2KaXaHXoQ/HF3NadRfe+qVofk8ztS1eddKrzQaMy86zzJD7trHycx/T
  72svTKruZ22u12O83GHEY/Fe7Fihzp+9n/dOcPtceu3effFUZSOz/MOlbs0+ctOcSy5e5Kt35
  L/RuPvVBUvJJT8Of2xwMbQ9NWVKdhIr287jhtMObN2mc+uqS8XsorwKhZlHDW5vOB7D9TS9fd
  He7Xn1GVMWK8W+/mR29/Lrvbtb3DemCTEXXmDX36G1Jcld5ZXNc7HvTzb8Z4/YMe/O8mfvFvB
  /yGHfknM17uwdM0lP1Yfbnk8uCj91/k2FR+W+jlcsGl/E575RYinOSDTUYi4qTgQAbLjJ5jkD
  AAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-565.messagelabs.com!1640012819!33066!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1084 invoked from network); 20 Dec 2021 15:06:59 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Dec 2021 15:06:59 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id F20FB1000FD
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:06:58 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D662110045E
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:06:58 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 20 Dec 2021 15:06:56 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] openvpn: upgrade 2.5.4 -> 2.5.5
Date: Tue, 21 Dec 2021 08:06:50 +0800
Message-ID: <1640045210-88169-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Dec 2021 15:07:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94452

Changelog:
=========
 Fix error in example firewall.sh script
 configure: remove useless -Wno-* from default CFLAGS
 Add argv_insert_head__empty_argv__head_only to argv tests
 Move deprecation of SWEET32/64bit block size ciphers to 2.7
 Include --push-remove in the output of --help.
 Move '--push-peer-info' documentation from 'server' to 'client options'
 add test case(s) to notice 'openvpn --show-cipher' crashing
 BUILD: enable CFG and Spectre mitigation for MSVC
 Fix loading PKCS12 files on Windows
 msvc: fix product version display
 msvc: add missing header to project file
 config-msvc.h: fix OpenSSL-related defines
 contrib/vcpkg-ports: remove openssl port
 GitHub Actions: use latest working lukka/run-vcpkg
 Use network address for emulated DHCP server as a default
 Load OpenSSL config on Windows from trusted location
 ring_buffer.h: fix GCC warning about unused function
 ssh_openssl.h: remove unused declaration
 vcpkg/pkcs11-helper: compatibility with latest vcpkg
 config-msvc.h: indicate key material export support
 Don't use BF-CBC in unit tests if we don't have it
 Define have_blowfish variable in ncp unit tests
 doc link-options.rst: Use free open-source dynamic-DNS provider URL
 Fix some more wrong defines in config-msvc.h
 Ensure the current common_name is in the environment for scripts
 Require EC key support in Windows builds
 resolvconf fails with -p
 Update IRC information in CONTRIBUTING.rst
 doc/man (vpn-network-options): fix foreign_option_{n} typo
 README.down-root: Fix plugin module name

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../openvpn/{openvpn_2.5.4.bb => openvpn_2.5.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.5.4.bb => openvpn_2.5.5.bb} (97%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.4.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.5.bb
similarity index 97%
rename from meta-networking/recipes-support/openvpn/openvpn_2.5.4.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.5.5.bb
index 6b588a5f5..2dc3af6bf 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.4.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.5.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "f80f3c3df1b94a8892ae547df84f152583250684a24bd022ccc98ef56fa93d97"
+SRC_URI[sha256sum] = "7500df4734173bce2e95b5039079119dacaff121650b2b6ca76d2dc68bdac1c5"
 
 # CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not for openvpn.
 CVE_CHECK_WHITELIST += "CVE-2020-7224 CVE-2020-27569"
-- 
2.25.1


