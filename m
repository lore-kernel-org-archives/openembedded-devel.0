Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860ECC52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 01:22:25 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.22997.1722993742472347386
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 18:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NE1uusNo;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722993743; x=1754529743;
  h=from:to:cc:subject:date:message-id;
  bh=yFzwNqcITBOExwNSY6t3NySFEz8L2hbMhZBgGpssn9U=;
  b=NE1uusNo7cNZtn6p1soUqbxjdfjvr8kMyFjKl3LLU7ASW4qrG6j78jIO
   QRBH8SzhEIGn6B0U5R91dhHQXbC+lc+Uph7A84BgA3YX2oNU9iI2AUDQK
   UKkxgad9yrHGArYiop1TT3fJ8lstxRfh/3W/04mUf+UpdgzrN0kYCetQv
   Wim5VOtnYpjozwsDc35kqMNSBZzAU+6+LrAQChtF7q7JyPsPaTYRN97bD
   4J/G8mduRetMMymtUzI6L/nmk9oo9bePQdP+IioTs/jFiqsI0AL9QS4J5
   YXA4Dk1MrF2+qzW0H5DkKsENxiD3zYPSyH/7QHSfEyzs3oUIKvtZBYG+6
   g==;
X-CSE-ConnectionGUID: N3o6m5kYRSWGekDDrVGCHg==
X-CSE-MsgGUID: kaYNGoX7RauE5VbW6Vkmsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="170031833"
X-IronPort-AV: E=Sophos;i="6.09,268,1716217200"; 
   d="scan'208";a="170031833"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 10:22:20 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 04C21D29E1
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Aug 2024 10:22:18 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5BCEBBF495
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Aug 2024 10:22:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E85D520086307
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Aug 2024 10:22:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6D0171A0002;
	Wed,  7 Aug 2024 09:22:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] hostapd: upgrade 2.10 -> 2.11
Date: Wed,  7 Aug 2024 09:22:04 +0800
Message-Id: <1722993725-6061-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28580.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28580.003
X-TMASE-Result: 10--25.095700-10.000000
X-TMASE-MatchedRID: OIStEy/X03Cjz0nOeth/ySAWHOR37+ATpxAd6mi1Ga2UO40qHXu8fWnX
	UUBQ4UsQA+jzQdHPVib/OnYGesGMoFdvtTbdcIRVe98LrotgpVSX10IS8HM4/xcL2nROEpDhwRq
	QfbgaJhe9492ei9lo7dIq66o1vYO6qPsnDqCMYYK55gHWZJfOv7TrV2IG143XxFOmU6TUrNbT6Z
	/7gOjQOMEbViSldjyYVNQgAsHni+CwYF3neS0luirLqyE6Ur/j31WgqCdyNNmynk7TnYzMusRFw
	efYldWwgExzV+J9XRgpG7TeLn9NOh/7O97RfsNrx7L94BGnWsRUENBIMyKD0QfxTM57BPHD7v0M
	lFSLfmlNDQmQ8bbzv+affHI8kAmih2EU0vzIu2/FVAV8vDjN/99WrDP4LKdpXjbObVmL4wkfF7U
	3vuk4UxeNByEqkiuq184oKeilRNTpZnwb/PFSE54CIKY/Hg3Am4n49vyf9XEvM/mydp5vVCq2rl
	3dzGQ1DBbGvtcMofyUTGVAhB5EbQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 01:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111600

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright updated to 2024.

Changelog:
===========
* Wi-Fi Easy Connect
  - add support for DPP release 3
  - allow Configurator parameters to be provided during config exchange
* HE/IEEE 802.11ax/Wi-Fi 6
  - various fixes
* EHT/IEEE 802.11be/Wi-Fi 7
  - add preliminary support
* SAE: add support for fetching the password from a RADIUS server
* support OpenSSL 3.0 API changes
* support background radar detection and CAC with some additional
  drivers
* support RADIUS ACL/PSK check during 4-way handshake (wpa_psk_radius=3)
* EAP-SIM/AKA: support IMSI privacy
* improve 4-way handshake operations
  - use Secure=1 in message 3 during PTK rekeying
* OCV: do not check Frequency Segment 1 Channel Number for 160 MHz cases
  to avoid interoperability issues
* support new SAE AKM suites with variable length keys
* support new AKM for 802.1X/EAP with SHA384
* extend PASN support for secure ranging
* FT: Use SHA256 to derive PMKID for AKM 00-0F-AC:3 (FT-EAP)
  - this is based on additional details being added in the IEEE 802.11
    standard
  - the new implementation is not backwards compatible
* improved ACS to cover additional channel types/bandwidths
* extended Multiple BSSID support
* fix beacon protection with FT protocol (incorrect BIGTK was provided)
* support unsynchronized service discovery (USD)
* add preliminary support for RADIUS/TLS
* add support for explicit SSID protection in 4-way handshake
  (a mitigation for CVE-2023-52424; disabled by default for now, can be
  enabled with ssid_protection=1)
* fix SAE H2E rejected groups validation to avoid downgrade attacks
* use stricter validation for some RADIUS messages
* a large number of other fixes, cleanup, and extensions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../hostapd/{hostapd_2.10.bb => hostapd_2.11.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/hostapd/{hostapd_2.10.bb => hostapd_2.11.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
rename to meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
index 44683bf73..693afe6c5 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
@@ -2,7 +2,7 @@ SUMMARY = "User space daemon for extended IEEE 802.11 management"
 HOMEPAGE = "http://w1.fi/hostapd/"
 SECTION = "kernel/userland"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://hostapd/README;beginline=5;endline=47;md5=aa03b8bd6216d1a7ca01fd4b89863073"
+LIC_FILES_CHKSUM = "file://hostapd/README;beginline=5;endline=47;md5=8e2c69e491b28390f9de0df1f64ebd6d"
 
 DEPENDS = "libnl openssl"
 
@@ -14,7 +14,7 @@ SRC_URI = " \
 "
 
 
-SRC_URI[sha256sum] = "206e7c799b678572c2e3d12030238784bc4a9f82323b0156b4c9466f1498915d"
+SRC_URI[sha256sum] = "2b3facb632fd4f65e32f4bf82a76b4b72c501f995a4f62e330219fe7aed1747a"
 
 inherit update-rc.d systemd pkgconfig features_check
 
-- 
2.34.1


