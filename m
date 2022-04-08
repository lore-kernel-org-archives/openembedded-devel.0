Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0762EC54EC4
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.26319.1649663183041062313
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 00:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=C1pd7uAF;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649663181; i=@fujitsu.com;
	bh=fnh5GzqnC6Qi7s16cDJgGb19kgebpWMNu5w63NFtpWQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=C1pd7uAF12D+GMxJ8cizm1gHIc41BtOmyPpydp0/gS2exMFCZyBl53h3c0hEfl6kn
	 nNuVuRGoCcACpwuJXTGgz/8PvrWXvS+yvQkbjS0DVLcGRI831lVobZyzVnxYYwRs0H
	 +KQcKweXzgkUeiiOOk/MDlUwYoanKp538UNBgrsDOuCDXuYIZw0LpFAIXMOIUKmzgF
	 3R6cJriAl4jsOBZdd4+Idu36u+0riHlUkZyDoid8QO8FXR1acIC4VR4R860+gzdOYj
	 KA9nvDR2576rYhX5bOpIXMzqwt8luYjhD9KA+PXTDBqDvNHyNoCwBJv8H+VCMi1Inj
	 jvpb/YEd6c50w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8ORqHvmTnC
  Swf1ZyhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bEk0/ZCjZwVLR9SGlgvMPexcjFISTwhFHi
  1ttdzBDOBSaJ3Q/WMHUxcgI5exgl/pzOBLHZBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHH
  cQWFvCXuDjlEVAvBwcLUPzeMm2QMK+Ak8TcNd/ARkoIKEhMefieGSIuKHFy5hMWiDESEgdfvG
  CGqFGUmH25mQXCrpCYNasNqldN4uq5TcwTGPlnIWmfhaR9ASPTKkbrpKLM9IyS3MTMHF1DAwN
  dQ0NTXWNTXUMLE73EKt1EvdRS3fLU4hJdI73E8mK91OJiveLK3OScFL281JJNjMCQTClW3rGD
  sW3VT71DjJIcTEqivOsvBScJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuD9cBsoJ1iUmp5akZaZA
  4wPmLQEB4+SCC8HSJq3uCAxtzgzHSJ1itGY4+qVK3uZOW6ASCGWvPy8VClx3s0gpQIgpRmleX
  CDYHF7iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwbw/IFJ7MvBK4fa+ATmECOiV0WyDIKSW
  JCCmpBiaBU/Vvr8z5bsh2U7LiyKoozlUNt5nzVRXvL5ixcNvdNTs+3VnoxG5rm6DyKET9UUrf
  rbW11xjrCzo99OdtXrSmgGuy8E8l/dx7Ttd4F/odf714jgwX+50N8ot/8mgs/FahtWxLRWOt8
  k6vJokooUvZaTmZG0KDSlsvv2lxm3fQLmzPaY272q3f4n3nvTm6cX+tg3l+QILj8w+98irzgj
  ++etUm7vPP3Xe1wxbt1co7pjos6Pq8c8M+x7SvXQW2h1WP32G4pKik/INj2cwysQ36axebNZ5
  VCpw74aSrY8nRRxOusba/Pe9m+FFoeoHezRleol7/+b9ciXn3TcDqkC2Lq3gx86now8yekZF/
  Fl9UYinOSDTUYi4qTgQANRhOIlYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-548.messagelabs.com!1649663180!277211!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8642 invoked from network); 11 Apr 2022 07:46:20 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Apr 2022 07:46:20 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 018E910018D
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 08:46:20 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B3EB31001B4
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 08:46:19 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 11 Apr 2022 08:46:08 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20211114.0 ->
 5.9.20220410.0
Date: Fri, 8 Apr 2022 22:42:43 +0800
Message-ID: <1649428965-30248-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96547

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20211114.0.bb => ctags_5.9.20220410.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20211114.0.bb => ctags_5.9.20220410.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20211114.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220410.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20211114.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20220410.0.bb
index 504cc24325..96be4e3ffd 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20211114.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220410.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "a668cb155609d5a322963e1ed9a0c0147c8be597"
+SRCREV = "c4e384715bfa95c7eaf0de99ce2498d54bed182e"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


