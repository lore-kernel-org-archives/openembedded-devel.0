Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B200DEB64DD
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 06:50:41 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.2318.1687157430824285363
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jun 2023 23:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="109589164"
X-IronPort-AV: E=Sophos;i="6.00,254,1681138800"; 
   d="scan'208";a="109589164"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 15:50:32 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7500CC68E5
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:30 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F7C6D3F32
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:29 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id D0B8F2FC5C6B;
	Mon, 19 Jun 2023 15:50:28 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] strongswan: upgrade 5.9.10 -> 5.9.11
Date: Mon, 19 Jun 2023 14:48:28 +0800
Message-Id: <1687157308-17342-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
References: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27700.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27700.005
X-TMASE-Result: 10--12.171800-10.000000
X-TMASE-MatchedRID: ZsQmnj20Xtajz0nOeth/yUIIxwDaU5mrHe8GMJDyf5rEWhdVdXNnvznG
	P45AxioiHc4daVyDggqL+miOHkbpqOaHepMfdPYEOf/Bx1+MuMJSqthBc1cZPy4C1mBPwSbcHGS
	C3ABVhzT0udhqJWC0djtflIU9bRE6jaZpiigzMURrzsINdopFUkWGJun24Wb1BeMWvOgcJKQvRK
	IL5tnSDyolWOAMg2fc5YH8A9q0NoyDTASlDkSywM2CuVPkCNzu3PqHZj0FCaqA+ITQt7D1APw/i
	Eodp594OKylu/QN0VJVF51vxLbfWe1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0K
	7bkUDKINUccATRyd1Mt+4gG6hwJMYwDOL7t3RyHdCok3ibXlQX0tCKdnhB589yM15V5aWpj6C0e
	Ps7A07Xi4XEoPXecxrFihMPdzj76RbQbb48ulkBSq7FO431Es4DQ/hs28nYo=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103379

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- A deadlock in the vici plugin has been fixed that could get triggered when
  multiple connections were initiated/terminated concurrently and control-log
  events were raised by the watcher_t component.
- CRLs have to be signed by a certificate that has the cRLSign keyUsage bit
  encoded (even if it's a CA), or a CA certificate without keyUsage extension.
- Optional CA labels in EST server URIs are supported by `pki --est/estca`.
- CMS-style signatures in PKCS#7 containers are supported by the pkcs7 and
  openssl plugins, which allows verifying RSA-PSS and ECDSA signatures.
- Fixed a regression in the server implementation of EAP-TLS with TLS 1.2 or
  earlier that was introduced with 5.9.10.
- Ensure the TLS handshake is complete in the EAP-TLS client with TLS <= 1.2.
- kernel-libipsec can process raw ESP packets on Linux (disabled by default) and
  gained support for trap policies.
- The dhcp plugin uses an alternate method to determine the source address
  for unicast DHCP requests that's not affected by interface filtering.
- Certificate and trust chain selection as initiator has been improved in case
  the local trust chain is incomplete and an unrelated certreq is received.
- ECDSA and EdDSA keys in IPSECKEY RRs are supported by the ipseckey plugin.
- To bypass tunnel mode SAs/policies, the kernel-wfp plugin installs bypass
  policies also on the FWPM_SUBLAYER_IPSEC_TUNNEL sublayer.
- Stale OCSP responses are now replace in-place in the certificate cache.
- Fixed parsing of SCEP server capabilities by `pki --scep/scepca`.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../strongswan/{strongswan_5.9.10.bb => strongswan_5.9.11.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.10.bb => strongswan_5.9.11.bb} (99%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.10.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.11.bb
similarity index 99%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.10.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.11.bb
index aecd32139..fb1bea2d8 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.10.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.11.bb
@@ -11,7 +11,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
           "
 
-SRC_URI[sha256sum] = "3b72789e243c9fa6f0a01ccaf4f83766eba96a5e5b1e071d36e997572cf34654"
+SRC_URI[sha256sum] = "ddf53f1f26ad26979d5f55e8da95bd389552f5de3682e35593f9a70b2584ed2d"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1


