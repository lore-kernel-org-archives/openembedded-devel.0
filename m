Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EA2C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 10:46:00 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.28782.1647859559127501373
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 03:45:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jlZNFryj;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647859557; i=@fujitsu.com;
	bh=U3cIp0FOyQeh3Sb2vPBkOHg2mgWfa8c9mt8SKLZR3+o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=jlZNFryjAdMpzHvCphVOrWE85RYTClC3wZvXpJhacUhIkbX9HkUmMsWGKnnW1m0at
	 ryULMEKX/+I1ZHyNqUrjpzrfCOayu/2iRZPzPBKqciXhlUzl398niqgjtQeOxBkqsv
	 6ktkDYFVB2BQHazJm3qAj+Zw72sWteYXuj9Mu3elsvbki5YVj3+GpLgVnQhkCBcttI
	 RSWlPa7cduPNdqOosqy3ucgc1gxHQmWaiypU2qF8oAypwpYbSnp415Hbf1EP2IqPWD
	 ylzUqzSDsWPvrmaji+ntC9OY3f/jCfzBNqsuwnb2mA9woXPvUn0MwwKpn+WxREhkjh
	 AWRs8msQUJWKg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRWlGSWpSXmKPExsViZ8MRopsabpF
  kcK+Bw+Li4aXMDowe5zauYAxgjGLNzEvKr0hgzXjf3cdasEGk4v/OJuYGxg6hLkZODiGBmUwS
  Uw9FdjFyAdl7GCV+/jnADpJgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8esBphAXeJlX/Os
  XUxcnCwCKhKHH5nCRLmFXCSWP16DxOILSGgIDHl4XtmiLigxMmZT1ggxkhIHHzxghmiRlFi9u
  VmFgi7QmLWrDamCYy8s5C0zELSsoCRaRWjdVJRZnpGSW5iZo6uoYGBrqGhqa6xqa6hhYleYpV
  uol5qqW55anGJrpFeYnmxXmpxsV5xZW5yTopeXmrJJkZgiKUUK+/Ywdi26qfeIUZJDiYlUd46
  I4skIb6k/JTKjMTijPii0pzU4kOMMhwcShK8eUFAOcGi1PTUirTMHGC4w6QlOHiURHh9QFp5i
  wsSc4sz0yFSpxgVpcR5j4UCJQRAEhmleXBtsBi7xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUU
  mYVyAMaApPZl4J3PRXQIuZgBbrs5qBLC5JREhJNTAl6iZdZ7LmPzrd9tPvv/7Vf6UzF9UUxcX
  a/VKXZTPt/SGv9k/qk39m1LsEHxHVgJibXPuKcnpbUxLqOY59kQi0X7Wr/AefRM1Xiys3Xn5u
  vtujEH64UVq1N+NDj55877648lgJrc6tk+fq/mYx+MGdlPphh3C0WlBbNHOq4K6VSz5H2u/98
  mPty8y+70/ZXZ94/t3yqMCD7+bCaad3r5p//17qBae6HSYdj39nrnsi+fGp3ge+5xbrNDT+mW
  078+LBpUmdG/auKJ9+fNWft5aFF1svfVH6+jl9qbzizdCaV1PvZi8+kKLyxU3lSWAt0xun9V7
  pp29s4GRREz55uOmm33Ze55XGecpXek/6V31QYinOSDTUYi4qTgQARZdODywDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-548.messagelabs.com!1647859556!168468!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15259 invoked from network); 21 Mar 2022 10:45:57 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-5.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Mar 2022 10:45:57 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22LAjnkZ006943
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 10:45:56 GMT
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 21 Mar 2022 10:45:48 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] openvpn: upgrade 2.5.5 -> 2.5.6
Date: Mon, 21 Mar 2022 18:45:36 +0800
Message-ID: <1647859537-30207-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Mar 2022 10:46:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96102

Liense-Update : year updated to 2022.

Changelog:
=========
 GitHub Actions: update script to same version as master
 update copyright year to 2022
 keyingmaterialexporter.c: include strings.h
 remove unused sitnl.h file
 sample-plugin: New plugin for testing multiple auth plugins
 plug-ins: Disallow multiple deferred authentication plug-ins
 doc/Makefile: rebuild rst docs if input files change
 doc/options: clean up documentation for --proto and related options
 fix Changes.rst errors in 2.5.3 and 2.5.5 announcement
 Repair --inactive with 'bytes' argument larger 2Gbytes.
 Fix --mtu-disc maybe|yes on Linux.
 Preparing release 2.5.6
 CI: github actions: keep "pdb" in artifacts
 auth_token.c: add NULL initialization
 vcpkg-ports/pkcs11-helper: bump to release 1.28
 vcpkg-ports/pkcs11-helper: indicate OpenSSL EC support
 msvc: cleanup
 vcpkg: link lzo statically
 vcpkg-ports/pkcs11-helper: adapt to new upstream URL
 vcpkg-ports: add openssl 1.1.1n

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openvpn/{openvpn_2.5.5.bb => openvpn_2.5.6.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.5.5.bb => openvpn_2.5.6.bb} (95%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.5.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb
similarity index 95%
rename from meta-networking/recipes-support/openvpn/openvpn_2.5.5.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb
index 3e725ec418..218e72b7a8 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.5.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb
@@ -2,7 +2,7 @@ SUMMARY = "A full-featured SSL VPN solution via tun device."
 HOMEPAGE = "https://openvpn.net/"
 SECTION = "net"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=377a495e6f12b2a3adcee797e59540b8"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b76abd82c14ee01cc34c4ff5e3627b89"
 DEPENDS = "lzo openssl iproute2 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 inherit autotools systemd update-rc.d
@@ -14,7 +14,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "7500df4734173bce2e95b5039079119dacaff121650b2b6ca76d2dc68bdac1c5"
+SRC_URI[sha256sum] = "333a7ef3d5b317968aca2c77bdc29aa7c6d6bb3316eb3f79743b59c53242ad3d"
 
 # CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not for openvpn.
 CVE_CHECK_IGNORE += "CVE-2020-7224 CVE-2020-27569"
-- 
2.25.1


