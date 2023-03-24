Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59041C74A5B
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:28:13 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.89879.1679617690464496014
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:28:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=b/3Hb8V3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679617688; i=@fujitsu.com;
	bh=FJeBr93Ijoko3jBgAgKCG+WsUob2Y01xIs/o1/R/vgQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=b/3Hb8V3TLN3oi5ke2ksc4gAj9F2vVSBYQpKUXy+87IyXTMG2u88pnIJK4IwTg/Lr
	 C20HycQfNCUN1GiGSgh/wNR1BHPkXfTfI5h3XqCgxROfGZB93OJZ2E6c0+Aq1qaY4J
	 6Yn/mCi5aYMLMKKw+pRV632LOmL6+EArrQJLe0B5/zlHRkeVVs5RsngdKmYw5nm8GS
	 +QNxSQMizfDQcs55JD50gOZeWLQ9zfi5yslygTHmKQGZ6uTrHhWWtjuFvRBHOeLxQv
	 AttStL6iTs/CWcadfRmDfL68ZLzHTbTBgIIE9LjgNfD8Of0Mv4lQduok7Yc9QB1h3y
	 ogbksworgMrSQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSXf6O5k
  Ug32/5C0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozbj+YwFiwQrNh18ipzA+Mh/i5GLg4hgSeM
  ErsmNbNCONeZJKY1rmGCcPYwSjR8ngCU4eRgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBbov3WVrAaFgFViT23XzGC2LwCThKzp70BmyMhoCAx5eF7sF5OAWeJKZ/fM4HYQkA1T9
  ctZYaoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdINE4/xARhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaFacWlSWWqRrqZdUlJmeUZKbmJmjl1ilm6iXWqqbl19UkqFrqJdYXqyXWlysV1yZm5yT
  opeXWrKJERi+KcXJZ3cwHu37q3eIUZKDSUmUVyJUOkWILyk/pTIjsTgjvqg0J7X4EKMMB4eSB
  O/nNzIpQoJFqempFWmZOcBYgklLcPAoifAeOguU5i0uSMwtzkyHSJ1iVJQS5018C5QQAElklO
  bBtcHi9xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV5hYDIQ4snMK4Gb/gpoMRPQYucasMU
  liQgpqQam3CePC05kz7Pke8C75K/nvPIzF47dDurZ8Fbs8d6zXIvWBucy+6e8O7hn972kjyfu
  OK5/bC0VHn0+MnCir4Pr1413ymQO7intkVII2Pk2XZVhVeFXE+Xf5eGZSsz715xnjHnUfX7+r
  tK/tUZndP+zv3237/grlhenM+JyzK519X5VmTt1327FizeOnJ8n/mCGYE3Smye35Tc90nBlak
  17vMd754uGw1Irr/b9WO6wL2Ot3BtVETamqgoWL8l/hndEfVt7CkNeXdUqbebJrgmoF/jeYHn
  7zovHckovXkp9Wp0SEhemd9Vt94nsZ3L8b6ZuZfR4/Oehs1Zj5EvOjg8L4pfsVI/a7G/lu90s
  P+7qQyWW4oxEQy3mouJEAPq2wX9aAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-745.messagelabs.com!1679617687!653660!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22039 invoked from network); 24 Mar 2023 00:28:07 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-22.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:28:07 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E264410032D
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:28:06 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D5566100323
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:28:06 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:28:05 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libtest-deep-perl: upgrade 1.130 -> 1.204
Date: Fri, 24 Mar 2023 08:27:46 +0800
Message-ID: <1679617669-27228-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679617669-27228-1-git-send-email-wangmy@fujitsu.com>
References: <1679617669-27228-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:28:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101679

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
  dzilification cleanup: remove redundant pod

Changelog:
==========
- restore v5.12 compatibility (see commit 66b79eb for the amusing
  anecdote)
- try to avoid clobbering global error variables when loading test
  libraries (thanks, Felipe Gasper)
- hash_each now enumates keys in sort() order, to make errors more
  consistent
- no changes since trial releases
- Test::Deep now requires perl v5.12.
- correct Changes entry about which version version of perl is required
- converted to Dist::Zilla
- Test::Deep will now require v5.12, and this may go up.  This change
  allows simplification of the Makefile.PL, which was coping with a
  mistake made twelve years ago.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...libtest-deep-perl_1.130.bb => libtest-deep-perl_1.204.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libtest/{libtest-deep-perl_1.130.bb => libtest-deep-perl_1.204.bb} (91%)

diff --git a/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.130.bb b/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.204.bb
similarity index 91%
rename from meta-perl/recipes-perl/libtest/libtest-deep-perl_1.130.bb
rename to meta-perl/recipes-perl/libtest/libtest-deep-perl_1.204.bb
index 6252bc3351..d7f6166b4b 100644
--- a/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.130.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-deep-perl_1.204.bb
@@ -23,11 +23,10 @@ SECTION = "libs"
 HOMEPAGE = "http://github.com/rjbs/Test-Deep/"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://lib/Test/Deep.pm;beginline=1817;endline=1826;md5=a897a42bafc3422cab17c2eb94f87a7c"
+LIC_FILES_CHKSUM = "file://lib/Test/Deep.pm;beginline=1817;endline=1826;md5=d3ed382cc19bae8ead6076df35a43cbf"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/R/RJ/RJBS/Test-Deep-${PV}.tar.gz"
-SRC_URI[md5sum] = "d466e471108f7f7a5df3802cb13761ac"
-SRC_URI[sha256sum] = "4064f494f5f62587d0ae501ca439105821ee5846c687dc6503233f55300a7c56"
+SRC_URI[sha256sum] = "b6591f6ccdd853c7efc9ff3c5756370403211cffe46047f082b1cd1611a84e5f"
 
 UPSTREAM_CHECK_REGEX = "Test\-Deep\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.34.1


