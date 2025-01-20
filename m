Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A3DC02195
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:21 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.32643.1737360860755505135
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=P8S/keMt;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360860; x=1768896860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aKi8m0H0y9EWiBDqrZ6cqNanxmiqhAhJ81hEbbuEM68=;
  b=P8S/keMtMzksf/61uqVIDsjcz/2uoDknYCQNC4AAPCFZhC76tWYEMK+s
   Qha/uzQ9KSYbqH3XnWSeo5nu9ZKi8ZghYIOflS7ZEqtyEN+AHkrWihzjg
   vMW6evAYVNMhcvlU2ZpWt2o0sMbN9oa07xArCMT80+fqfltoFLzwe/eYn
   fTtFxXDHnGk9mXXQc0BsTpXdwa6BTdFAscMiLWXAg9CU1pWa4WU1rOlUP
   +T0WVzNxvi79UwOvbmYWCN1nLdPvTFuglQxJRELPsr8mSK69OLxcOVGqr
   fNRjC7vEfhAu7Mxch/b82ueA5IhzXL28nEGm9OKVCmI/oq/FOY0d8eyMV
   A==;
X-CSE-ConnectionGUID: qqqZ3YacQGWEzn254qXq2Q==
X-CSE-MsgGUID: Ek0QHg1zTqCLuhKX1wTj3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="187354166"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="187354166"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:18 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1C041E076A
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E7C3415907
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 77CAE6BAD4
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:15 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2832E1A0074;
	Mon, 20 Jan 2025 16:14:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 13/32] openvpn: upgrade 2.6.12 -> 2.6.13
Date: Mon, 20 Jan 2025 16:13:47 +0800
Message-Id: <1737360846-4824-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10--1.179900-10.000000
X-TMASE-MatchedRID: 19A9OAtP7iyjz0nOeth/yUIIxwDaU5mrhnCFIAQefsg+KSDQ9ztlrW8q
	nFk+BWUXxO4FvTZs+ZwEpvi3XSh2ZGrs+r6+nS7OgvmNrsT46HJZoq85oEW2FOfdksK3etFJFFy
	os4QuK8OinZ5aDN1lPxCUWSZ2TdU6lPpop9nq2f1IcJTn2HkqsReK/B+WKxKsipRnPSc15qJTWf
	eJOsRVyttvaWgfeCxwzSwxJjmB0s8mkWYIBA7LzAPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn6
	DBj/gsEIvrftAIhWmIAf/HImzvCGCO6nmopU4eXnVTWWiNp+v9lRzZAkKRGDXhzGUAKmTAro8WM
	kQWv6iUoTQl7wNH8PtxWF9NJ0ly43QfwsVk0UbvqwGfCk7KUsz4XHxHOciDBiUkalvmK0U8ALS2
	cVrTp5RrQs5SO2ZrQ6AAC+CczQs9ot77vEfHHHv/BhOz2rYqwYuhHpngv5nNhMWU+a7+vN4gepp
	QyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114977

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Refuse clients if username or password is longer than USER_PASS_LEN
- Improve peer fingerprint documentation
- console_systemd: remove the timeout when using 'systemd-ask-password'
- Fix missing spaces in various messages
- GHA: Update macOS runners
- GHA: Simplify macOS builds
- Various typo fixes
- forward: Fix potential unaligned access in drop_if_recursive_routing
- send uname() release as IV_PLAT_VER= on non-windows versions
- preparing release 2.6.13
- Route: remove incorrect routes on exit
- Use a more robust way to get dco-win version
- Fix check_addr_clash argument order
- Add calls to nvlist_destroy to avoid leaks
- proxy.c: Clear sensitive data after use
- Protect cached username, password and token on client
- Fix more of uninitialized struct user_pass local vars
- Fix IPv6 in port-share journal
- Fix port-share journal doc

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openvpn/{openvpn_2.6.12.bb => openvpn_2.6.13.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.6.12.bb => openvpn_2.6.13.bb} (98%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.12.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.13.bb
similarity index 98%
rename from meta-networking/recipes-support/openvpn/openvpn_2.6.12.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.6.13.bb
index 958eecb63a..03b9b1b64f 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.12.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.13.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "1c610fddeb686e34f1367c347e027e418e07523a10f4d8ce4a2c2af2f61a1929"
+SRC_URI[sha256sum] = "1af10b86922bd7c99827cc0f151dfe9684337b8e5ebdb397539172841ac24a6a"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 
-- 
2.43.0


