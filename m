Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D02CD5487
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:36:59 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.2272.1695109016367222694
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="132481623"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="132481623"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:36:54 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BB94DB4CC
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:36:51 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A36D8D5EA7
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:36:50 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id BADF288749;
	Tue, 19 Sep 2023 16:36:49 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] libcoap: upgrade 4.3.1 -> 4.3.3
Date: Tue, 19 Sep 2023 15:36:05 +0800
Message-Id: <1695108965-7312-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.006
X-TMASE-Result: 10--3.766500-10.000000
X-TMASE-MatchedRID: 19A9OAtP7iyjz0nOeth/yaoXHZz/dXlxpxAd6mi1Ga3IFck3f6fvyNA3
	SZ3aWimv8prFIvXzDcBjaku0IPs9D/211Ty3YIoAQfSOYOlxKYtuviAEnPmsnrKeTtOdjMy60sN
	VRp2fBwwXjQchKpIrqjUBujBGVCoUVOc6pZRHw9d7TXnCjI8t9t4Z4Nykx3k2rTIoBBXzoI+9iE
	NzihaceRab+AC2MJ3sG+eiC7+lvXuGnc61hHySTHzmmMD/HXF+VBDQSDMig9EH8UzOewTxw+79D
	JRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOK0+leiJxLlfzndiJkHFMhGFHVj+6F+rI31wl
	3qzgklLtAdDE/EtBJIAy6p60ZV62fJ5/bZ6npdjGVuWouVipcn0CsSMvfdNJuduuLDU7+MakxGk
	Fcj6Lgz7CcdGi8+vWnH1fihMwSa8ATlkvMgaymJwJwGaxmvAJ0r/ijvNYr06kH8iuir8yt/6/2/
	nZkihaOgB/fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:36:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104971

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 Copyright: Update copyright date to end 2023 as appropriate
 Add in OSCORE support
 RIOT: Update to support latest libcoap code
 Add BSD-3-Clause

Changelog:
===========
* Source files reformatted according to pre-commit rules.
* Support for RFC8613 (OSCORE).
* Support for RFC8974 (Extended Tokens).
* Support for RFC9177 (Q-Block).
* Support for latest RIOT code and new examples.
* Support for MinGW builds.
* Support for AF_UNIX sockets.
* Support for WebSockets (RFC8323).
* Support for IPv4 only and IPv6 only libcoap builds.
* Support for defining maximum logging level.
* Support for maintaining Observer requests over server restarts.
* Support for Contiki-NG.
* Support for latest LwIP, including using TinyDTLS.
* libcoap now has protocol layered support, separating out the
  logical layers. Stack now is:-
    - Application
    - libcoap - CoAP
    - libcoap - CoAP-Session
    - libcoap - (D)TLS I/F using external (D)TLS Library
    - libcoap - Netif
    - libcoap - Sockets
    - Kernel Network Stack
* Fixes CVE-2023-30362 and CVE-2023-35862.
* Reported bugs fixed.
* Examples now support separate logging levels for libcoap and (D)TLS.
* syslog LOG_ logging levels replaced with COAP_LOG_ logging levels.
* New public API functions to aid / reduce application coding.
* Remove requirement for applications to have sockaddr knowledge.
* Support for clients sending IPv4 broadcast requests.
* Documentation added and updated (Doxygen and man).
* Fix ABI version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libcoap/{libcoap_4.3.1.bb => libcoap_4.3.3.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-devtools/libcoap/{libcoap_4.3.1.bb => libcoap_4.3.3.bb} (92%)

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.1.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.3.bb
similarity index 92%
rename from meta-networking/recipes-devtools/libcoap/libcoap_4.3.1.bb
rename to meta-networking/recipes-devtools/libcoap/libcoap_4.3.3.bb
index efea3fab74..6e5bc07c59 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.1.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.3.bb
@@ -4,13 +4,13 @@ devices that are constrained their resources such as computing power, \
 RF range, memory, bandwith, or network packet sizes."
 HOMEPAGE ="https://libcoap.net/"
 
-LICENSE = "BSD-2-Clause & BSD-1-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0fbe4435d52b2d27a16f980ffc8ffc80"
+LICENSE = "BSD-2-Clause & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1978dbc41673ab1c20e64b287c8317bc"
 
 SRC_URI = "git://github.com/obgm/libcoap.git;branch=main;protocol=https \
            file://run-ptest \
            "
-SRCREV = "02b76470ab9168947152c78ad50835bf043d7c84"
+SRCREV = "9cde7cdee171e3f47486c6e70d479fdf49f3d2d6"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


