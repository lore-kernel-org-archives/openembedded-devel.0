Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA37AC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 01:17:50 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.6191.1635211069030303472
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 18:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fzG0uXhn;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635211067; i=@fujitsu.com;
	bh=z5bBTHz9W4TfYkhB/yZSi92duorzpj5qVjLO+gsPup4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=fzG0uXhnnRHf0GHXWoI6G21IXtVZYJtNGzKKJQRAz2fiOhm3N6/pl07ExnDdbsl2L
	 W5TJyezBCL0JjcxlXxRxrMSiSTEnWBUtB0bvVF1GtiVcigmbtI04JOfmnQYfma4wXr
	 LZqKri8MmzjDsy0gVVBQ0fJucXtydQrKfco9nZVrMpJ9gzRKegMKOPA96XFKA6HpFJ
	 KBGpiiUq8j92ZBeTnoDBinQyKK1bGuDNcwbOmffK4z63Ugg02sFfMtEv2+tRpmRSxL
	 y5l5dvB0lEn0JFvV0bFcNTWl7LXiDvT6jATjwk9c0bTYoUtbRxW/1/QPY+7HNIFDaE
	 FLe+DyOdu8GYg==
Received: from [100.112.192.69] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 5D/65-23860-A3757716;
 Tue, 26 Oct 2021 01:17:46 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+EI1bUKL08
  0mPBcxuLi4aXMDowe5zauYAxgjGLNzEvKr0hgzXh97DZrQZdQxZKZL5kbGFsFuhi5OIQEZjNJ
  PHt3jbWLkRPI2cMo8X6iOojNJqArce7xWnYQW0RAX2Lp7D3MILawgK/E/44vYHEWAVWJo7O/M
  oLYvAIeEle697KA2BICChJTHr5nhogLSpyc+QQsziwgIXHwxQugOAdQjaLE7OnyEOUVEq8PX2
  KewMgzC0nHLCQdCxiZVjGaJxVlpmeU5CZm5ugaGhjoGhoa6RpaGumamOglVukm6qWW6panFpf
  oGuollhfrFVfmJuek6OWllmxiBIZQSsEBnR2MP1990DvEKMnBpCTKu/xsWaIQX1J+SmVGYnFG
  fFFpTmrxIUYZDg4lCV6usPJEIcGi1PTUirTMHGA4w6QlOHiURHg3hwCleYsLEnOLM9MhUqcYF
  aXEef1A+gRAEhmleXBtsBi6xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYNwRkCk9mXgnc9F
  dAi5mAFvvploAsLklESEk1MM1e3T7T645z2QflBv515t3LDG39NW9qbexzWCW+Y1XdpBKu/a5
  hGbEhtzQ7PFkPzF/cfPu+zp4lfZm/msULOB55GH/fFKmwY5n37eqged8PsXDbzSmblxC4pFzy
  1O425rn7P2da/uw4ySd+YcqHIp5e2/v817ZyS1qunl45S5D/U/PMu7cPaN2wUcp/urphk5j8g
  f3cH0zMW5LvGk+S4r5YL8xQc3+e5/dra5ymsIRMYawpitTLmRv0jjdR7Xb+dVa3HUoHGOx0dR
  faRgnY8SeJn2MSe/J8/vq3iyWzOg9PLOtMi9y8gidR0OWK04Pq83Nb3BafnivH9XrBt09Va96
  U/b643q2xqTiAf80MZSWW4oxEQy3mouJEAF6xcGwcAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-267.messagelabs.com!1635211066!1105240!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24746 invoked from network); 26 Oct 2021 01:17:46 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-7.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Oct 2021 01:17:46 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19Q1HeFJ004191
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 02:17:46 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 26 Oct 2021 02:17:39 +0100
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] [oe] [meta-networking] [PATCH] atftp: upgrade 0.7.4 -> 0.7.5
Date: Tue, 26 Oct 2021 09:17:31 +0800
Message-ID: <1635211051-45911-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 01:17:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93580

atftp-0.7.5
===========
README: update contributors list
text files: mark/convert all textfiles to UTF-8
fix some compiler warnings
fix buffer overflow in atftpd (CVE-2021-41054)
insert typos.patch
insert atftp-0.7-ack_heuristic.patch
insert atftp-0.7-server_receive_race.patch
insert patch atftp-0.7-sorcerers_apprentice.patch
test.sh: check for root no longer necessary

Merge commits from https://github.com/srett/atftp
=================================================
tftpd.c: Only drop privs if requested or running as root + check for failure
fix invalid read of 1 byte in tftp_send_request.
Check return value of fseek(), abort if != 0
options.c: Proper fix for the read-past-end-of-array
configure.ac: Add -std=gnu89 if gcc/clang is detected
tftpd.c: Fix memleak if thread spawning fails
atftp: Check return value of fgets, buffer might be uninitialized on NULL
Fix check for argz support (HAVE_ARGZ -> HAVE_ARGZ_H)

replace LICENSE with current version

License-Update:
1. Address changed
2. "the GNU Library General Public License" changed to
   "the GNU Lesser General Public License"
3. Format of LICENSE changed

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../recipes-daemons/atftp/{atftp_0.7.4.bb => atftp_0.7.5.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/atftp/{atftp_0.7.4.bb => atftp_0.7.5.bb} (91%)

diff --git a/meta-networking/recipes-daemons/atftp/atftp_0.7.4.bb b/meta-networking/recipes-daemons/atftp/atftp_0.7.5.bb
similarity index 91%
rename from meta-networking/recipes-daemons/atftp/atftp_0.7.4.bb
rename to meta-networking/recipes-daemons/atftp/atftp_0.7.5.bb
index 7661e9c48e..de283df837 100644
--- a/meta-networking/recipes-daemons/atftp/atftp_0.7.4.bb
+++ b/meta-networking/recipes-daemons/atftp/atftp_0.7.5.bb
@@ -2,9 +2,9 @@ SUMMARY = "Advanced TFTP server and client"
 SECTION = "net"
 HOMEPAGE = "http://packages.debian.org/atftp"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f65159f73e603f89d6867d43191900e5"
 
-SRCREV = "e56e8845f1070e89a4a6e509396b681688d03793"
+SRCREV = "00921e75728e3681b051c2e48c59e36c6cfa2e97"
 
 SRC_URI = "git://git.code.sf.net/p/atftp/code \
            file://atftpd.init \
-- 
2.25.1


