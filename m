Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D92EC30658
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:15 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.167228.1719305832512079203
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fl7O7B5r;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305833; x=1750841833;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Td4sWJaYhl55+7Q19WUCBG/T4DPn8epajbAG3mrXW9A=;
  b=fl7O7B5rIClfEDpnagRgs8g7IvLy/p1Lshce621u1VxEz3u4rlBV/im9
   YFnXnNTYE9lnLvrQJFdgzEhCSwwunIO7igR/xOXWS5uAeNqKSn3PNXyeh
   +rtdKXigJksLzA8dBS4I64Vmr3x8Fh+4+3ENXPGN1mBKOtWE1L1LrJIil
   NW4fDwEWY5Dx74vGyz5+0HHXU15lLoX7XcTXILxuOQAHYVhtT95/rWmIp
   3M0G6fjp8wmpf5Hikm18RHzdiqmNHFNh4lhoa2Eb+C4vPdjZXnDjmui6C
   4dgUpCBq6fRSUZxA0eHnUzJ3GDHYl6irpWnzUA/aii3Sw9fuWWlEG8rvQ
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="166699611"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="166699611"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:10 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 89173C9448
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:07 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D309BD3F03
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4D50C2007CDC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EF0781A0002;
	Tue, 25 Jun 2024 16:57:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 21/57] openvpn: upgrade 2.6.10 -> 2.6.11
Date: Tue, 25 Jun 2024 16:55:54 +0800
Message-Id: <1719305790-11484-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--5.062300-10.000000
X-TMASE-MatchedRID: bwTBD8UNLVWjz0nOeth/yTo39wOA02LhpxAd6mi1Ga2dzY3Ic3tCtAbo
	TDS3zulAjDVMw6TJvuEwMs1siwmrKPnFHElSAEBLbqt0lNqAi/4YFQt+VRO1dC89EUWFxaFgaxZ
	lX1gwMFvhQf1Ag+Ol4a/iJdc/sDa+rFMDyJP7G27cgUVP3Cp+vU3yuY9BGW8rIZa32B/Rf9VPCV
	NdGJmNwRab+AC2MJ3sGCKI5kpcbfxIbkfZeRdu6nl14Xo5Ir2XLGGfhb0UUN3fUZT83lbkENb2e
	7N2CFQy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AZskwWqoib3Ez5vzLEGq8DtamZ
	mGAeo6hlAB70kOnQ4v52QubtoBCy7ABo0upccSorT6V6InEuV8zvBt5KTZctmyiLZetSf8lBgw5
	G4NYCZN9pjzubZ2rHIAcCikR3vq+73EEtu7IoBGnuXFRQqlaRfR2dwpbkm1DlhtZ70MFdhAdBFr
	kPAh0z
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111035

From: Wang Mingyu <wangmy@fujitsu.com>

0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch
refreshed for 2.6.11

Changelog:
=============
- Implement server_poll_timeout for socks
- Use snprintf instead of sprintf for get_ssl_library_version
- Add bracket in fingerprint message and do not warn about missing verification
- Replace macos11 with macos14 in github runners
- Only run coverity scan in OpenVPN/OpenVPN repository
- Workaround issue in LibreSSL crashing when enumerating digests/ciphers
- Properly handle null bytes and invalid characters in control messages
- Allow to set ifmode for existing DCO interfaces in FreeBSD
- samples: Update sample configurations
- documentation: make section levels consistent
- phase2_tcp_server: fix Coverity issue 'Dereference after null check'
- script-options.rst: Update ifconfig_* variables
- LZO: do not use lzoutils.h macros
- Remove "experimental" denotation for --fast-io
- Implement Windows CA template match for Crypto-API selector
- misc.c: remove unused code
- interactive.c: Improve access control for gui<->service pipe
- Only schedule_exit() once

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...gure.ac-eliminate-build-path-from-openvpn-versi.patch | 9 +++------
 .../openvpn/{openvpn_2.6.10.bb => openvpn_2.6.11.bb}     | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.6.10.bb => openvpn_2.6.11.bb} (97%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn/0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch b/meta-networking/recipes-support/openvpn/openvpn/0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch
index 03b454d62..7c6ad20a4 100644
--- a/meta-networking/recipes-support/openvpn/openvpn/0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch
+++ b/meta-networking/recipes-support/openvpn/openvpn/0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch
@@ -1,4 +1,4 @@
-From ea179d83b0aa62719d90748cd1fb260f40055f15 Mon Sep 17 00:00:00 2001
+From a4d4ca981433705057c73086a6f1b4ebe07e614c Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Mon, 13 Jun 2022 22:44:28 +0800
 Subject: [PATCH] configure.ac: eliminate build path from openvpn --version
@@ -31,10 +31,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 2f5f6bc..eddcbc5 100644
+index f56d0cc..27ca06e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1377,7 +1377,7 @@ if test "${enable_async_push}" = "yes"; then
+@@ -1447,7 +1447,7 @@ if test "${enable_async_push}" = "yes"; then
  	esac
  fi
  
@@ -43,6 +43,3 @@ index 2f5f6bc..eddcbc5 100644
  AC_DEFINE_UNQUOTED([CONFIGURE_DEFINES], ["`echo ${CONFIGURE_DEFINES}`"], [Configuration settings])
  
  TAP_WIN_COMPONENT_ID="PRODUCT_TAP_WIN_COMPONENT_ID"
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.10.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.11.bb
similarity index 97%
rename from meta-networking/recipes-support/openvpn/openvpn_2.6.10.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.6.11.bb
index ba53d40f4..cf599666d 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.10.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.11.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "1993bbb7b9edb430626eaa24573f881fd3df642f427fcb824b1aed1fca1bcc9b"
+SRC_URI[sha256sum] = "d60adf413d37e11e6e63531cacf2655906756046b4edffe88a13b9e2fec40d5e"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 
-- 
2.34.1


