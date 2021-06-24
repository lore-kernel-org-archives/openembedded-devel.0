Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web08.1514.1624500023496493385
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jun 2021 19:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=I95IjFUF;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624500021; i=@fujitsu.com;
	bh=ziNANnDP6i3Fo7PWW0RAyyRrgrd4ALY5iNsw/xqDEhY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=I95IjFUFTUwz67jqf0ftobekegrBdn5fq9GaGs8k5oQtMxr21M5aB0HA0JyDI/J7i
	 se0pyHx18zdiHSrkJt+jFBXm8vi8KzBBDsz/ufbVTI/BqkEH/dX3PSZZ+ciDwXXRy1
	 DzJKHkc5nxI1Vsj/7u/q8PUd+WWDWvCxIOQzieCtcvdzQc3z5HDBQKwmhkLUE75msB
	 MzmxikoLmPji5hXrOvN9PBRvMjm6WHOslBrMB+7b/Um10aq7VUv7weM4aRtHPE71rc
	 MExOMsQRaAwJ9etyTjqxqdWbSmmNsu2Q1IfxRHInQn2Pxx1QA8/8XK2KdA8wdjda9t
	 2rtRQavPs7Plw==
Received: from [100.112.193.7] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 0F/08-56066-437E3D06; Thu, 24 Jun 2021 02:00:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxRdfk+eU
  Eg+t7RS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oz/H2QK/vNWXN/cw97A+Jini5GLQ0hgNpPE
  sj0n2CGcE4wSn1tmMXcxcnKwCehIdLzoZgGxRQT0JZbO3gMWFxZwl7g9fToriM0ioCqx5e1OR
  hCbFyj+bf8nsHoJAQWJKQ/fM0PEBSVOznwCFmcWkJA4+OIFM0SNosT2nWeg6iskZszYxjaBkW
  cWkpZZSFoWMDKtYrRIKspMzyjJTczM0TU0MNA1NDTSNbQEYiMzvcQq3US91FLd8tTiEl1DvcT
  yYr3iytzknBS9vNSSTYzAMEopOFC3g/HB6w96hxglOZiURHlL2y8nCPEl5adUZiQWZ8QXleak
  Fh9ilOHgUJLglXgGlBMsSk1PrUjLzAGGNExagoNHSYTX8glQmre4IDG3ODMdInWKMZbj2doli
  5g5XoLJDfOWAsn/d+8CyaZ7ILJ/wcHVzBxTwOTN9kNA8g6IFGLJy89LlRLnffwUaKgAyNCM0j
  y4lbD4vcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmLcNZApPZl4J3GWvgI5mAjpa4fdFkKN
  LEhFSUg1MjNelt65oPjfnOvupjkzRzRff/Oz61bjcLMZhtqriP7OENo5XnJ+rv/yd8iFua6RZ
  i1LIqbiL884f69qVuOVdvp6p8cUDLR/ONbT8vFwcdrUh25FNY92kdcdChZoMnfveBBx66qj+0
  vFLv8PWgrTGLnXGn69WGKc899tX9LqZ+8vng6mb3Qx7Nngrqxy6kFbi8XLtvUquVaEHdlTzcv
  UyOnuymIi6hu77rj3l0qNsRs90o6UVPy+zOVmoGDnplj86d9nt3fbpp3Iez9JgYLGxeWRVfdz
  lrOO69NS0plfvN225cfy0FZN/qIKhZegX3xkVd0ID+DVZj+y8X2t+gP88u/KjhEt2LcyWztuU
  O5yVWIozEg21mIuKEwET71jfWgMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-271.messagelabs.com!1624500020!93958!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17344 invoked from network); 24 Jun 2021 02:00:20 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-9.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Jun 2021 02:00:20 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15O20JDu005938
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 03:00:19 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 24 Jun 2021 03:00:18 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] openvpn: upgrade 2.5.2 -> 2.5.3
Date: Thu, 24 Jun 2021 10:00:11 +0800
Message-ID: <1624500011-10741-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

-License-Update: Copyright year updated to 2021.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../openvpn/{openvpn_2.5.2.bb => openvpn_2.5.3.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.5.2.bb => openvpn_2.5.3.bb} (93%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.3.bb
similarity index 93%
rename from meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.5.3.bb
index f82107dbee..20f971a3b7 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "A full-featured SSL VPN solution via tun device."
 HOMEPAGE = "https://openvpn.net/"
 SECTION = "net"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7aee596ed2deefe3e8a861e24292abba"
+LIC_FILES_CHKSUM = "file://COPYING;md5=377a495e6f12b2a3adcee797e59540b8"
 DEPENDS = "lzo openssl iproute2 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 inherit autotools systemd update-rc.d
@@ -14,8 +14,8 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[md5sum] = "7643f135b49aee49df7d83c1f434dc4e"
-SRC_URI[sha256sum] = "b9d295988b34e39964ac475b619c3585d667b36c350cf1adec19e5e3c843ba11"
+SRC_URI[md5sum] = "08895fd1142f25fdd94a98315632e1bf"
+SRC_URI[sha256sum] = "75f0044df449430555ca7b995a2b77ab24f2946fdc3668301b8edc23986a5f7e"
 
 SYSTEMD_SERVICE_${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.25.1

