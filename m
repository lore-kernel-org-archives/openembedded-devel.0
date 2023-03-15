Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB09DC6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:05:10 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.8881.1678889100551173454
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZPRBqJih;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678889098; i=@fujitsu.com;
	bh=xdjVQ8PgkAWXE+nPpO88lLa19JLf4NSLG4uZABJPvw0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ZPRBqJihLsWpID5GnAi4mVnkw2pBh+BXJU0KBiar3QYX75eelcWx4WzzKgVG1aToc
	 6KPSWdsiAr0zsAVUBZRqS1J4ZB8AQ32NyYnfBuyJcsTgSW/zJw848s9EVIiCLIqAAr
	 2/fqbwtu+5qTRRLrIpRylFHg6o03Sd9HiWyNGITpFJxd8O6Cy0DQKaK5nww6bLNdts
	 hHKySNe5fOuHi6v0xLGlDkXU1JxBa3K7/ihhA5TDyVZea1mvNES21FcZah5LNvnF4/
	 +8jrpNYSz8knR34HrSOa7SVb6gqBwQCWt/SVUGGcpeilRHpzH/ppM1Kw5DOr/6ZwWh
	 iypdCMolbFfiQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8MxSbfrgmC
  KwZxLIhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aps4cYC/YpVSzb/5itgXGNXBcjF4eQwBNG
  iVf99xm7GDmBnOtMElv/ykAk9jBK7D+5jAkkwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrBApMTpWVtZQWwWAVWJ5w9+gdXwCjhJzDi5BsyWEFCQmPLwPVRcUOLkzCcsEHMkJA6+eA
  FVoygx+3IzC4RdIdE4/RAThK0mcfXcJuYJjPyzkLTPQtK+gJFpFaNpcWpRWWqRrrleUlFmekZ
  JbmJmjl5ilW6iXmqpbnlqcYmukV5iebFeanGxXnFlbnJOil5easkmRmAophQrz9zBuKzvr94h
  RkkOJiVR3j9rBFKE+JLyUyozEosz4otKc1KLDzHKcHAoSfD+OyOYIiRYlJqeWpGWmQOMC5i0B
  AePkghv6nmgNG9xQWJucWY6ROoUoy7Hpn1dB5iFWPLy81KlxHn/ghQJgBRllObBjYDF6CVGWS
  lhXkYGBgYhnoLUotzMElT5V4ziHIxKwrzLQC7hycwrgdv0CugIJqAjeOcJgBxRkoiQkmpgMtu
  R+9ltRYrHtu6yxFThiDNlizf9Fbj9QKVPnLOis2zXFes/h/YJpp1I6bPTe32op36F+wqG6OwD
  CovFpI4cZLtz6BLD76Qf3SeOBLrMbZypvyH2W/icqzda7oixf9b+8enwDJumC5ZtJZMMz4tab
  zE4+jSiU/fWerWK+baHrPxytgqxVs+8+ayt5fyrgBe3bI4J5K5a9FBP4u+1N3I13epru3s28E
  ivYF011d6V57G++SIbb2UZw2N/nW0vpRbHbvK83r3T7Wb27Gl37ykcf2QwkcmPcf2io1denwv
  iE5N1LK6eOP3p7RsFwl3abZt8w1dbeqrfqsoqmv95RazEyvLC6gPzshkjVOw8cqefUmIpzkg0
  1GIuKk4EAB0D/LVMAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-571.messagelabs.com!1678889098!164901!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24647 invoked from network); 15 Mar 2023 14:04:58 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 14:04:58 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 0BCE01000D2
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:04:58 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id F310B1000C1
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:04:57 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 14:04:56 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [oe] [meta-networking] [PATCH] networkmanager: upgrade  1.42.0 -> 1.42.4
Date: Wed, 15 Mar 2023 22:04:38 +0800
Message-ID: <1678889082-20604-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:05:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101538

From: Wang Mingyu <wangmy@fujitsu.com>

0001-libnm-std-aux-Adjust-signature-of-_nm_assert_fail_in.patch
removed since it's not available in 1.42.4

Changelog:
==========
* Fix a possible crash when [global-dns] is used and improve the
  documentation.
* Documentation improvements.
* Add build option to set the mobile-broadband-provider-info database
  path.
* Add new "ipv[46].replace-local-rule" setting to control whether to
  remove the local route rule that is automatically generated.
* Add the DHCPv6 IAID to the lease information exposed in /run and on
  D-Bus.
* Fix assuming team connections at boot.
* Fix race condition when setting the MAC address of an OVS interface.
* Fix constructing the IPv4 name servers variable passed to dispatcher
  scripts.
* Don't use tentative IPv6 address to resolve the system hostname via DNS.
* Deprecate the "Master" property of the NMActiveConnection D-Bus object
  in favor of the new "Controller" property.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...just-signature-of-_nm_assert_fail_in.patch | 37 -------------------
 ...ger_1.42.0.bb => networkmanager_1.42.4.bb} |  3 +-
 2 files changed, 1 insertion(+), 39 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-std-aux-Adjust-signature-of-_nm_assert_fail_in.patch
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.42.0.bb => networkmanager_1.42.4.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-std-aux-Adjust-signature-of-_nm_assert_fail_in.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-std-aux-Adjust-signature-of-_nm_assert_fail_in.patch
deleted file mode 100644
index 6640bce17..000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-std-aux-Adjust-signature-of-_nm_assert_fail_in.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 8c8b13768d22f39edfce38e123b740c43d7e31c4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 18 Feb 2023 17:29:10 -0800
-Subject: [PATCH] libnm-std-aux: Adjust signature of _nm_assert_fail_internal
-
-the LSB states __assert_fail is:
-const char*, const char*, unsigned int, const char*
-https://refspecs.linuxbase.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/baselib---assert-fail-1.html
-
-musl uses a signed int instead. however, this is ok:
-https://www.openwall.com/lists/musl/2019/03/04/6
-
-nevertheless, since the application redefines __assert_fail, we have to make
-the types match. (not upstreamable as the opposite breaks glibc)
-
-Upstream-Status: Inappropriate [musl specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/libnm-std-aux/nm-std-aux.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libnm-std-aux/nm-std-aux.h b/src/libnm-std-aux/nm-std-aux.h
-index e556aa4..0756a7c 100644
---- a/src/libnm-std-aux/nm-std-aux.h
-+++ b/src/libnm-std-aux/nm-std-aux.h
-@@ -230,7 +230,7 @@ typedef uint64_t _nm_bitwise nm_be64_t;
- _nm_noreturn static inline void
- _nm_assert_fail_internal(const char  *assertion,
-                          const char  *file,
--                         unsigned int line,
-+                         int line,
-                          const char  *function)
- {
-     __assert_fail("<dropped>", file, line, "<unknown-fcn>");
--- 
-2.39.2
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.4.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.0.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.4.bb
index dabf9a1d3..5ff90be22 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.42.4.bb
@@ -30,9 +30,8 @@ SRC_URI = " \
     file://enable-dhcpcd.conf \
     file://enable-iwd.conf \
 "
-SRC_URI:append:libc-musl = " file://0001-libnm-std-aux-Adjust-signature-of-_nm_assert_fail_in.patch"
 
-SRC_URI[sha256sum] = "2f6756d507bb6b46716594b67e6fe7491891e1b5b167bbafc5157dfa7753d5b4"
+SRC_URI[sha256sum] = "86ee16a2f7f525629133fa0c3dc060caf96ae4f34084eda1c24551951abe5a3c"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.34.1


