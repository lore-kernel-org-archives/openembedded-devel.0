Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web09.2463.1631674277421526470
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Sep 2021 19:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tL0sw5f9;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631674275; i=@fujitsu.com;
	bh=NeQxBrMNXVlFIg50O1JUugGBS6kZHwH24NJmVBM/jgg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=tL0sw5f9dRB9zsnNPwad8TR7x2VsGe6pKYp/j2SqCPCl5uY9HTwIbBo2Ih6SAMBxA
	 6GlV0Ml7oEQ+QrkS2RyHj8Xl9O5NKgVEKjIoJNijfkhNLw1br6EyoXfNeJLqTCzwOQ
	 WXct/GpE5GeqAb2zBCpZUBRdNQBqXsYodZX7+cLkvlRglKij4dNx0NGh8b6WWq+SRM
	 Fzwi6pXe/bgHaYSvLIja5Io/xMO3tYi+AKbxvx2KjqkuuCeiBQ/FwDtitBHt/pc2gT
	 riN+lzJkTPyKmHBmru/bFACEazH1/9Tiy5CKsDsR8JKM1DAqu56xJ5Ut1Nt3v3+tCf
	 U97honkdxxw4A==
Received: from [100.112.195.149] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 4D/C9-02979-2AF51416; Wed, 15 Sep 2021 02:51:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+GYorso3jH
  RYNtOJouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePXvjdsBZ+EKl48f8zYwHhVoIuRi0NIYDaT
  xOr76xkhnD2MEuu2vWPpYuTkYBPQlTj3eC07iC0ioC+xdPYeZhBbWMBTonndbKA4OweLgKrEq
  TSQKK+Ah8SUw9/BKiQEFCSmPHzPDBEXlDg58wnYRGYBCYmDL14AxTmAahQlZk+XhyivkHh9+B
  LzBEaeWUg6ZiHpWMDItIrRIqkoMz2jJDcxM0fX0MBA19DQSNfQ0lTXyNBUL7FKN1EvtVS3PLW
  4RNdQL7G8WK+4Mjc5J0UvL7VkEyMwhFIKDl/fwXjr9Qe9Q4ySHExKorw+wY6JQnxJ+SmVGYnF
  GfFFpTmpxYcYZTg4lCR49eKAcoJFqempFWmZOcBwhklLcPAoifBqgaR5iwsSc4sz0yFSpxgVp
  cR5I0ASAiCJjNI8uDZYDF1ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMxrBDKFJzOvBG76K6
  DFTECLj+x3AFlckoiQkmpgqgq9e3TSiUgm7bl/hf0vlx7fdTdn2/2TLb+PZKyWVtix7oLDb+0
  z11oCvsjEXM2zuvFv616maSIhj8yv97zquML1IFT9yOOLC9lKtEJDLlb953A+Vr/v+K7W6YnH
  Ob785c4wfae1/LrEBT41l5sBQgvdf/GeXTC/6Elft0fohHgp0zlXqzZzpwWd4lttxub0LLBTv
  7xfOqBCKVjbufj6lC3q+t9ddL7pzpz5yjplyielksAVJeHK4qJ5Xye4uvCvlEqbPP++dNxfh9
  zAfzVy2puubH+Vvb9ir+n30OK0jr5TtXO/rPpbY7GfZUY774d02YC7AadfVinGVP+ZVjcx4NU
  xfUuV278/xOr7fbE+rMRSnJFoqMVcVJwIAJlrdL8cAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-267.messagelabs.com!1631674273!99194!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27321 invoked from network); 15 Sep 2021 02:51:14 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-10.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Sep 2021 02:51:14 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18F2pDpC011383
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Sep 2021 03:51:13 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 15 Sep 2021 03:51:12 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] unbound: upgrade 1.12.0 -> 1.13.2
Date: Tue, 14 Sep 2021 08:01:40 +0800
Message-ID: <1631577700-67521-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Features
Merge PR #317: ZONEMD Zone Verification, with RFC 8976 support.
ZONEMD records are checked for zones loaded as auth-zone, with DNSSEC if available. There is an added option zonemd-permissive-mode that makes it log but not fail wrong zones. With zonemd-reject-absence for an auth-zone the presence of a zonemd can be mandated for specific zones.
Fix: Resolve interface names on control-interface too.
Merge #470 from edevil: Allow configuration of persistent TCP connections.
Fix #474: always_null and others inside view.
Add that log-servfail prints an IP address and more information about one of the last failures for that query.
Merge #478: Allow configuration of TCP timeout while waiting for response.
Add ./configure --with-deprecate-rsa-1024 that turns off RSA 1024.
Move the NSEC3 max iterations count in line with the 150 value used by BIND, Knot and PowerDNS. This sets the default value for it in the configuration to 150 for all key sizes.
zonemd-check: yesno option, default no, enables the processing of ZONEMD records for that zone.
Merge #486 by fobster: Make VAL_MAX_RESTART_COUNT configurable.
Merge PR #491: Add SVCB and HTTPS types and handling according to draft-ietf-dnsop-svcb-https.
Introduce 'http-user-agent:' and 'hide-http-user-agent:' options.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../unbound/{unbound_1.12.0.bb => unbound_1.13.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.12.0.bb => unbound_1.13.2.bb} (96%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.12.0.bb b/meta-networking/recipes-support/unbound/unbound_1.13.2.bb
similarity index 96%
rename from meta-networking/recipes-support/unbound/unbound_1.12.0.bb
rename to meta-networking/recipes-support/unbound/unbound_1.13.2.bb
index 8ab8b7b84f..17f750c5f1 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.12.0.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.13.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master \
 	file://0001-contrib-add-yocto-compatible-init-script.patch \
 "
-SRCREV="52b04806f4236c37acd10179ab465a54adc7e86a"
+SRCREV = "8e538dcaa8df2d0fab8ff3dcf94ac1f972450b66"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-- 
2.25.1

