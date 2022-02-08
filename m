Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B373DC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 15:12:42 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web12.12358.1644333161630949294
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Feb 2022 07:12:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hRh3lyzw;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644333159; i=@fujitsu.com;
	bh=gfzkqgXGf7K04b+YUnlErBzU22lF3UtrtwmMyCSF0EQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=hRh3lyzw2yYCZFUm1/SgXlDiJ5yE4uOfhO3lfCp0k9kwQIwPRZv7O8ojNQd1QHClb
	 GQOXCgQiLbNEQP4Dm+NyDagrAOHSr20taspBl3Qm+Is9ZZP58StIp8JEG8LI6LWtgi
	 OeQ9dPNM7T8DJpUb1hf8kUGDVmcbf3jnmWNUewL5VQvoisA7T0psQSWDNiUhvoWoNt
	 dCjAPhkJXEVJd5Gim2qwg4HTAOMU3uWLrNKGR/82LigD0ezqv4w4z0Oh0OHA5QW3S8
	 kk8pkTa8TCg34FzX9FhEo3At+0efPjOdV2kC8MR2HFI8wIZuW24ovIkRig+yyNiz9n
	 ChAu5wxnqCapg==
Received: from [100.115.35.13] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id 5D/B0-22205-76882026;
 Tue, 08 Feb 2022 15:12:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8MxSTe1gyn
  J4OFPAYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPjyT7Wgte6Ffv39jM1ML5W72Lk4hASeMIo
  MWVFEzOEc4FJYu3kTUwQznFGiWk3tjB2MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgIrGo8xcTiM0CFJ/64TyYzSvgKPHw42OwegkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF1
  A1ihKzLzezQNgVErNmtTFB2GoSV89tYp7AyD8LSfssJO0LGJlWMVonFWWmZ5TkJmbm6BoaGOg
  aGprqGpvoGhla6CVW6SbqpZbqlqcWl+ga6SWWF+ulFhfrFVfmJuek6OWllmxiBAZmSrHSrR2M
  G1b91DvEKMnBpCTKe7mUKUmILyk/pTIjsTgjvqg0J7X4EKMMB4eSBK9hG1BOsCg1PbUiLTMHG
  CUwaQkOHiUR3uUgad7igsTc4sx0iNQpRl2O5knLtzMLseTl56VKifOWVQEVCYAUZZTmwY2ARe
  wlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8pe1AU3gy80rgNr0COoIJ6Iivi/4lAh1Rkoi
  QkmpgWhH/vHDqb63KG+YBkn/MNM9/NVCZsb+lbu8LFm4bSe+2Gxrhc5yjSkzdtXza355mqd6/
  4MKRgCvBBoFuZxfbnNgelrKX5eAmRc5FfFVTl9V43TFRLbh6NuX9s+Lnvqx8ws7cVqe4m++4B
  zaeNuGLTUrxKb9tKZ7OdLkl3Sb41ArfT+zpN+dKnJNSOP25qfO4Ju/UDi5Rr5UPN6V+4Fhh3W
  mofnXWPTnhOp1v01bNu9vwqFmuMuUe1+Oug/Mnf5v+YsefDOeAqP+vvj1+0h4Z5NG1IHHBUic
  G7S+rteKPFWj4bk9NibL8b/m4yO4tW4HIRAODY/YZ/tfrDq/fs+2AUMelgOchgvv+XtFeJfZQ
  iaU4I9FQi7moOBEAe+OouVMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-548.messagelabs.com!1644333157!18444!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18182 invoked from network); 8 Feb 2022 15:12:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Feb 2022 15:12:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E340610044D
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  8 Feb 2022 15:12:36 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D69E310033B
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  8 Feb 2022 15:12:36 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Feb 2022 15:12:16 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 1/2] ndpi: upgrade 4.0 -> 4.2
Date: Tue, 8 Feb 2022 23:12:06 +0800
Message-ID: <1644333127-6545-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Feb 2022 15:12:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95263

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


