Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BC5C072A2
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 06:40:55 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.13920.1700635253251330998
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 22:40:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="119927498"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="119927498"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 15:40:52 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A9F21D5026
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:40:48 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E59B7D12DD
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:40:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id B68C587FE4;
	Wed, 22 Nov 2023 15:40:46 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] strongswan: upgrade 5.9.11 -> 5.9.12
Date: Wed, 22 Nov 2023 14:39:22 +0800
Message-Id: <1700635162-8330-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28012.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28012.005
X-TMASE-Result: 10--4.726900-10.000000
X-TMASE-MatchedRID: aL9W8lSYQvyjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwgXjbCEtErbdNb5
	DJLIuMyDt3gsBcjj0rrds6WtD+l5NibFpXq4ZRfV2Sa33ZGXWdZgg7HO8z2tNjRMpxC5/1NGVCN
	7HaefSl+YWk6u0fo95FsjIGwH+KpLs23+FIH5Toz3dt27LH8hnBCE2NlBjIjcikvLPxTKpjhTJU
	WWv6uHq+CzhFWHY5j5Dn1pBVB7rPI72d2F4DOSZCeaCBMY8cEng8C02zkI7w5gPgeggVwCFoPmb
	CpiCnvK0GrFgLXw+eWt499ucmaswNSxXbZonmxOBcaL/tyWL2MyhLY8urUHvpS5x6M6jKbvRtc2
	qGBany6XYZQAF2E+zEQ4/8yS0JD2vkYouhwK55L3Hev8a6G/JyeHMCGC+irnlPH7Ysio2a3TI48
	G/UH1dggvGgJhnjupVdNPsIcMVUMv+0FNnM7lDZ1U1lojafr/HNKOqzYigYrVtKZKT0dQ2g7oYc
	fGGBkPsX24ahsS5PuAMuqetGVetsmVgwFL4Dta3QfwsVk0UbvqwGfCk7KUs1RvoGmTEMYhIR6qd
	cercNLyJtgw9ODBxzMc+/ysC3Ctgk+6m3mxBwhONwuHmruSWDwIi1s8rX2RduXlD3t+eGmqudHv
	yBvFYogeppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 06:40:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107005

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fixed a vulnerability in charon-tkm related to processing DH public values
  that can lead to a buffer overflow and potentially remote code execution.
- The new `pki --ocsp` command produces OCSP responses based on certificate
  status information provided by plugins.
- The cert-enroll script handles the initial enrollment of an X.509 host
  certificate with a PKI server via the EST or SCEP protocols.
- The --priv argument for charon-cmd allows using any type of private key.
- Support for nameConstraints of type iPAddress has been added (the openssl
  plugin previously didn't support nameConstraints at all).
- SANs of type uniformResourceIdentifier can now be encoded in certificates.
- Password-less PKCS#12 and PKCS#8 files are supported.
- A new global option allows preventing peers from authenticating with trusted
  end-entity certificates (i.e. local certificates).
- ECDSA public keys that encode curve parameters explicitly are now rejected by
  all plugins that support ECDSA.
- charon-nm now actually uses the XFRM interfaces added with 5.9.10, it can
  also use the name in connection.interface-name.
- The resolve plugin tries to maintain the order of installed DNS servers.
- The kernel-libipsec plugin always installs routes even if no address is found
  in the local traffic selectors.
- Increased the default receive buffer size for Netlink sockets to 8 MiB and
  simplified its configuration.
- Copy the issuer's subjectKeyIdentifier as authorityKeyIdentifier instead of
  always generating a hash of the subjectPublicKey.
- Fixed issues while reestablishing multiple CHILD_SAs (e.g. after a DPD
  timeout) that could cause a reqid to get assigned to multiple CHILD_SAs with
  unrelated traffic selectors.
- Fixed a possible infinite loop issue in watcher_t and removed WATCHER_EXCEPT,
  instead callbacks are always invoked even if only errors are signaled.
- Fixed a regression in the IKE_SA_INIT tracking code added with 5.9.6 when
  handling invalid messages.
- Fixed adding the XFRMA_REPLAY_ESN_VAL attribute twice when updating SAs.
- Correctly encode SPI from REKEY_SA notify in CHILD_SA_NOT_FOUND notify if
  CHILD_SA is not found during rekeying.
- The testing environment is now based on Debian 12 (bookworm), by default.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../strongswan/{strongswan_5.9.11.bb => strongswan_5.9.12.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.11.bb => strongswan_5.9.12.bb} (99%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.11.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.12.bb
similarity index 99%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.11.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.12.bb
index fb1bea2d8..87d12bc6c 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.11.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.12.bb
@@ -11,7 +11,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
           "
 
-SRC_URI[sha256sum] = "ddf53f1f26ad26979d5f55e8da95bd389552f5de3682e35593f9a70b2584ed2d"
+SRC_URI[sha256sum] = "5e6018b07cbe9f72c044c129955a13be3e2f799ceb53f53a4459da6a922b95e5"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1


