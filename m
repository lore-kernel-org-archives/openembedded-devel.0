Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE41CCA481
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:23:24 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web12.31190.1654518196644353174
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oRg9CLKi;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654518194; i=@fujitsu.com;
	bh=2gKYm8mBPNlZj+Uui2X8W2HkaHHKuQaud53FhnC/l8g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=oRg9CLKiDJ5epQp+fUX5Ao6dOlwnkV1V5eZFj34JsctjzGNvqkV2j9JWSorkfkWaq
	 LiwHkMPP8RVIG0PZFltNDKlv9iLYBPAyjmpewhW6H4dR1e5ZDUumKIYXLiftMyyjjy
	 c3FjyPiuIphwSB00F9akdIFg442xPm+S7bBvYdtfApE9s7jbqGcvW9DYPv3ysatqjq
	 PcNzGOPmLPiCuaZEbmBHQxNpDqhH3CPNlPR/1iOWh3OgU6JN4yx2YBWclGpd0U0ia5
	 MP3a/6Gl2hJ10R/f7rdjqWwQUHZbAYsyDwysVjHnQQJ8NFy8hVXneC5fnd/J13Aauu
	 pJ1bMY1Hu+HXQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8MxSXfTx7l
  JBj8XsVtcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBnLzv1kL1gjXNHzfzJ7A+NigS5GLg4hgSeM
  Eus/rWCGcC4wSTz9+pQNwtnNKLH48HTGLkZODjYBNYnpt26wgtgiAvoSS2fvYQaxmQVUJF787
  mEHsYUF3CVOTD/CBmKzAMX7Vr8Bq+cVcJSYd/ELWI2EgILElIfvmSHighInZz5hgZgjIXHwxQ
  tmiBpFidmXm1kg7AqJGTO2sUHYahJXz21insDIPwtJ+ywk7QsYmVYxWiQVZaZnlOQmZuboGho
  Y6Boamuoa6hrpJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEhmRKMSPTDsZl
  fT/1DjFKcjApifLaX5ubJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCt+4DUE6wKDU9tSItMwcYH
  zBpCQ4eJRFe63dAad7igsTc4sx0iNQpRmOOv5/+7mXmmPm17QCzEEtefl6qlDjvrfdApQIgpR
  mleXCDYHF7iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw72KQe3gy80rg9r0COoUJ6BSfB3N
  ATilJREhJNTCtt7tQfmDN+eb325nuv9MwMVjy5VLCko+7/lt+PBuobLWvselZTGHY748rnHpf
  1egbpv7nNykuFHjxbIWU4ZmXvxaz3p+YLPnbUXqVik3+u/9ftq+ddpIhLncP35oW96Vb/kQs3
  1Yimlax2V+kIJBzr/cU99DVXwJyhNy1uM6KFO1y2j+pPWPan1oLweAzxx3ueayN8N6We+GGSO
  DrhDW6CyYy2DwOMKnLvxgm5C5yb92CXuEn8b+O33Wu6f+zWlkmR0539t4nUjvsn3H+e3imVmp
  jevGc5Vz/n8VcKzTM+3BOhPuK24bla60Nip3WrZ+lvN/d5+3OW0cPPH3NrH8/L0Mh90uXvDfb
  hw9yig6PlFiKMxINtZiLihMBcA0C0lYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-585.messagelabs.com!1654518193!147938!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32083 invoked from network); 6 Jun 2022 12:23:14 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jun 2022 12:23:14 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 980121009C0
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:23:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8ADE01009B3
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:23:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 6 Jun 2022 13:22:55 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] openvpn: upgrade 2.5.6 -> 2.5.7
Date: Mon, 6 Jun 2022 20:22:40 +0800
Message-ID: <1654518164-9091-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jun 2022 12:23:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97424

Changelog:
=========
      networking: use OPENVPN_ETH_ALEN instead of ETH_ALEN
      networking_iproute2: don't pass M_WARN to openvpn_execve_check()
      t_net.sh: delete dummy iface using iproute command
      auth-pam.c: add missing include limits.h
      Add insecure tls-cert-profile options
      Refactor early initialisation and uninitialisation into methods
      Allow loading of non default providers
      Add ubuntu 22.04 to Github Actions
      Add macos OpenSSL 3.0 and ASAN builds
      Add --with-openssl-engine autoconf option (auto|yes|no)
      Fix allowing/showing unsupported ciphers and digests
      Remove dependency on BF-CBC existance from test_ncp
      Add message when decoding PKCS12 file fails.
      Translate OpenSSL 3.0 digest names to OpenSSL 1.1 digest names
      Fix client-pending-auth error message to say ERROR instead of SUCCESS
      Preparing release 2.5.7
      cipher-negotiation.rst missing from doc/Makefile.am
      vcpkg-ports\pkcs11-helper: shorten patch filename
      msvc: adjust build options to harden binaries
      vcpkg-ports: remove openssl port
      vcpkg: switch to manifest
      Fix M_ERRNO behavior on Windows
      vcpkg-ports/pkcs11-helper: bump to release 1.29
      tapctl: Resolve MSVC C4996 warnings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openvpn/{openvpn_2.5.6.bb => openvpn_2.5.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.5.6.bb => openvpn_2.5.7.bb} (97%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.7.bb
similarity index 97%
rename from meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.5.7.bb
index 218e72b7a..3ed90a7c8 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.7.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "333a7ef3d5b317968aca2c77bdc29aa7c6d6bb3316eb3f79743b59c53242ad3d"
+SRC_URI[sha256sum] = "08340a389905c84196b6cd750add1bc0fa2d46a1afebfd589c24120946c13e68"
 
 # CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not for openvpn.
 CVE_CHECK_IGNORE += "CVE-2020-7224 CVE-2020-27569"
-- 
2.25.1


