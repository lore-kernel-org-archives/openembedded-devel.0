Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C769BC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 00:25:28 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.4700.1644279926743052916
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 16:25:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eO7Gw2eU;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644279924; i=@fujitsu.com;
	bh=gfzkqgXGf7K04b+YUnlErBzU22lF3UtrtwmMyCSF0EQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=eO7Gw2eUJIB/Zmfopr2iSBoTlVAy5Xwi/SlvVCP00ly2VnXhLSAhMPp0AgFvNGxAl
	 JTw8t4xRUl6BJvdSHsgMhftb6/RXl7taL/H97Gy8lacBIdUihbAwy16IppkWogsP1j
	 suGTdlAbYEK6RGVTFVuz6yob0r2cVqFV+VOSq//7iNO17hFvYT9UIOw4ma6MFcW12k
	 00wyZDQHXqFTSK3xbE8BtQUOeolEcYQHg41SGZx+Vi3hOln+VaLRFzqVRjHgOkpX8y
	 qMXA5ar0872jj97Qyqk8q6HDuZQf5ffBWmuJRzDIFxV9P6amciuAKU8kNGSYMBczAw
	 7WeEddan+h8dQ==
Received: from [100.115.69.41] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 83/EE-23802-478B1026; Tue, 08 Feb 2022 00:25:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRWlGSWpSXmKPExsViZ8MxRbd4B2O
  SwcZdlhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bGk32sBa91K/bv7WdqYHyt3sXIxSEkMINJ
  4n77U3YI5zijxMbbs9i6GDk52ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7hx3EFhZwkHgy9
  R2YzQIUb3rUzghi8wo4Slw4OwnMlhBQkJjy8D1YL6eAk8Tir0fAZgoB1extPcgMUS8ocXLmEx
  aI+RISB1+8YIboVZSYfbmZBcKukJg1q41pAiP/LCQts5C0LGBkWsVol1SUmZ5RkpuYmaNraGC
  ga2hoqmtmpmtoaqqXWKWbqJdaqpucmldSlAiU1kssL9ZLLS7WK67MTc5J0ctLLdnECAzOlGKn
  2TsYd/T91DvEKMnBpCTKm5nOmCTEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgvfsdqCcYFFqempFW
  mYOMFJg0hIcPEoivNogad7igsTc4sx0iNQpRl2O5knLtzMLseTl56VKifOaghQJgBRllObBjY
  BF7SVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrwNIFN4MvNK4Da9AjqCCeiIr4v+JQIdUZK
  IkJJqYAr8tDT65OPiixnVElGTuniYd1k++5G2UPHTnfiKm1yvA3/6eCYf4Hj7Z5NxU1nyj7yg
  VZ+Cij5er14nffJ96G2Fw0kzr5jFz//KUD5/0reEYMk3/IVhGnZMDyL33Hm7/FXsZFsBkYdcX
  N157xa3/Z0VZTu5/ZvuE8/3nb4rWvyvHYj2UPBq5k0orBGL8/D4Ui8sVbNCvO/l7KxjO/7NM+
  LVlr7OeriSxUa/OPiM/xnXzbWs8xc0qm1h3TeFPWfunDmWAnn+Tw242Ksl79hYCyYw7nEz5xP
  Pm5HgoCRVdOtof1R7D+NNqbQ/b2Qqz21vuvuwaPrkyqUpdZo/P0ZrFFfZdTZUmvDa/J3p9VhK
  iaU4I9FQi7moOBEAR7Mhy1UDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-528.messagelabs.com!1644279923!55825!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30211 invoked from network); 8 Feb 2022 00:25:23 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-11.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Feb 2022 00:25:23 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2180PHpI021762
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 8 Feb 2022 00:25:23 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Feb 2022 00:25:19 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] ndpi: upgrade 4.0 -> 4.2
Date: Tue, 8 Feb 2022 08:25:06 +0800
Message-ID: <1644279908-4266-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644279908-4266-1-git-send-email-wangmy@fujitsu.com>
References: <1644279908-4266-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Feb 2022 00:25:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95252

refresh 0001-autogen.sh-not-generate-configure.patch

Changelog:
=========
New Features
-----------
Add a "confidence" field indicating the reliability of the classification
Add risk exceptions for services and domain names via ndpi_add_domain_risk_exceptions()
Add ability to report whether a protocol is encrypted

New Supported Protocols and Services
-----------------------------------
Add protocol detection for:
Badoo
Cassandra
EthernetIP

Improvements
------------
Significantly reduced memory footprint from 2.94 KB to 688 B per flow
Improve protocol detection for:
BitTorrent
ICloud Private Relay
IMAP, POP3, SMTP
Log4J/Log4Shell
Microsoft Azure
Pandora TV
RTP
RTSP
Salesforce
STUN
Whatsapp
QUICv2
Zoom
Add flow risk:
NDPI_CLEAR_TEXT_CREDENTIALS
NDPI_POSSIBLE_EXPLOIT (Log4J)
NDPI_TLS_FATAL_ALERT
NDPI_TLS_CERTIFICATE_ABOUT_TO_EXPIRE
Update WhatsAPP and Instagram addresses
Update the list of default ports for QUIC
Update WindowsUpdate URLs
Add support for the .goog Google TLD
Add googletagmanager.com
Add bitmaps and API for handling compressed bitmaps
Add JA3 in risk exceptions
Add entropy calculation to check for suspicious (encrypted) payload
Add extraction of hostname in SMTP
Add RDP over UDP dissection
Add support for TLS over IPV6 in Subject Alt Names field
Improve JSON and CSV serialization
Improve IPv6 support for almost all dissectors
Improve CI and unit tests, add arm64, armhf and s390x as part of CI
Improve WHOIS detection, reduce false positives
Improve DGA detection for skipping potential DGAs of known/popular domain names
Improve user agent analysis
Reworked HTTP protocol dissection including HTTP proxy and HTTP connect

Changes
--------
TLS obsolete protocol is set when TLS < 1.2 (used to be 1.1)
Numeric IPs are not considered for DGA checks
Differentiate between standard Amazon stuff (i.e market) and AWS
Remove Playstation VUE protocol
Remove pandora.tv from Pandora protocol
Remove outdated SoulSeek dissector

Fixes
-----
Fix race conditions
Fix dissectors to be big-endian friendly
Fix heap overflow in realloc wrapper
Fix errors in Kerberos, TLS, H323, Netbios, CSGO, Bittorrent
Fix wrong tuple comparison
Fix ndpi_serialize_string_int64
Fix Grease values parsing
Fix certificate mismatch check
Fix null-dereference read for Zattoo with IPv6
Fix dissectors initialization for XBox, Diameter
Fix confidence for STUN classifications
Fix FreeBSD support
Fix old GQUIC versions on big-endian machines
Fix aho-corasick on big-endian machines
Fix DGA false positive
Fix integer overflow for QUIC
Fix HTTP false positives
Fix SonarCloud-CI support
Fix clashes setting the hostname on similar protocols (FTP, SMTP)
Fix some invalid TLS guesses
Fix crash on ARM (Raspberry)
Fix DNS (including fragmented DNS) dissection
Fix parsing of IPv6 packets with extension headers
Fix extraction of Realm attribute in STUN
Fix support for START-TLS sessions in FTP
Fix TCP retransmissions for multiple dissectors
Fix DES initialisation
Fix Git protocol dissection
Fix certificate mismatch for TLS flows with no client hello observed
Fix old versions of GQUIC on big-endian machines

Misc
----
Add tool for generating automatically the Azure IP list

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...001-autogen.sh-not-generate-configure.patch | 18 ++++++++----------
 .../ntopng/{ndpi_4.0.bb => ndpi_4.2.bb}        |  6 +++---
 2 files changed, 11 insertions(+), 13 deletions(-)
 rename meta-networking/recipes-support/ntopng/{ndpi_4.0.bb => ndpi_4.2.bb} (82%)

diff --git a/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-generate-configure.patch b/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-generate-configure.patch
index 1cbf059efd..d5c7f5f1cc 100644
--- a/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-generate-configure.patch
+++ b/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-generate-configure.patch
@@ -12,26 +12,24 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 refresh patch to 4.0
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- autogen.sh | 9 ---------
- 1 file changed, 9 deletions(-)
+ autogen.sh | 7 -------
+ 1 file changed, 7 deletions(-)
 
 diff --git a/autogen.sh b/autogen.sh
-index cf5d7057..cb73cf9d 100755
+index 0aa7507..36e0423 100755
 --- a/autogen.sh
 +++ b/autogen.sh
-@@ -52,12 +52,3 @@ cat configure.seed | sed \
-     -e "s/@NDPI_VERSION_SHORT@/$NDPI_VERSION_SHORT/g" \
-     -e "s/@FUZZY@/$FUZZY/g" \
-     > configure.ac
+@@ -33,10 +33,3 @@ if test -z $PKG_CONFIG; then
+     echo "pkg-config is missing: please install it (apt-get install pkg-config) and try again"
+     exit
+ fi
 -
 -autoreconf -ivf
--cat configure | sed "s/#define PACKAGE/#define NDPI_PACKAGE/g" | sed "s/#define VERSION/#define NDPI_VERSION/g"  > configure.tmp
--cat configure.tmp > configure
 -
 -echo "./configure $@"
 -chmod +x configure
 -./configure $@
 -
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-networking/recipes-support/ntopng/ndpi_4.0.bb b/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
similarity index 82%
rename from meta-networking/recipes-support/ntopng/ndpi_4.0.bb
rename to meta-networking/recipes-support/ntopng/ndpi_4.2.bb
index 960c4c2012..352d2d2426 100644
--- a/meta-networking/recipes-support/ntopng/ndpi_4.0.bb
+++ b/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
@@ -8,10 +8,10 @@ RDEPENDS:${PN} += " libpcap"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 
-SRCREV = "dabab0e9515c2e6a71a91bdc807453e416f831ca"
-SRC_URI = "git://github.com/ntop/nDPI.git;branch=4.0-stable;protocol=https \
+SRCREV = "8b5c6af71b562549f8416b31803daae223e09f46"
+SRC_URI = "git://github.com/ntop/nDPI.git;branch=4.2-stable;protocol=https \
            file://0001-autogen.sh-not-generate-configure.patch \
-"
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


