Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B59C48BDF
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:49 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.2644.1649137134442040984
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 22:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=macy1PxH;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649137132; i=@fujitsu.com;
	bh=cIA5PoqZRWMpWcY4wtlfKMjFCEfaN7iVIJe9cSi+cAM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=macy1PxH/SxfTTI8ZOK9jR8XX8myVDWylj4PVzJPLPKrszYEVmpdUzckYfFz22bVe
	 Vlk26TpKjO08FT8dtJtQ1W3FJwYsRRG9h4xdqdD6NLVbYC53iMpWSVX/H38x0xDnax
	 5d4RKLDLp+wTO0CwASosNcEw8WVgiuRZtyznkq94SvS+nQgEjdbO1DK/UiigQbJfPF
	 sEvTZgKA/FYQatqN0AEBRlPDidkHz93qQq2l8TmKg4TWEdd0TyccNTlQmvxiyPO+a3
	 QVxP4zje3rCrxim700M4oSUd3ZALVeWrAbwbWJJHv/SLJLvOwcBzfiU4OuxHnofE7A
	 sZscLDGNJLl+A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MxSffNVe8
  kg58rxC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxJ06cxFXzkrNjyoYexgbGVs4uRi0NI4Amj
  xOFtL1khnAtMErMurmKBcHYzSiyfeYqxi5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBd4m+aRPYQGwWoHjL1uNgNbwCThIfX+4Fq5EQUJCY8vA9VFxQ4uTMJywQcyQkDr54wQ
  xRoygx+3IzC4RdITFrVhsThK0mcfXcJuYJjPyzkLTPQtK+gJFpFaNVUlFmekZJbmJmjq6hgYG
  uoaGproGukaGpXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6KXl5qySZGYFimFDNc38E4
  se+n3iFGSQ4mJVHeM67eSUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeE+eBcoJFqWmp1akZeYAY
  wQmLcHBoyTCe+QiUJq3uCAxtzgzHSJ1ilFRSpz35hWghABIIqM0D64NFpeXGGWlhHkZGRgYhH
  gKUotyM0tQ5V8xinMwKgnz8oBM4cnMK4Gb/gpoMRPQ4ndnPEEWlyQipKQamKoPfTyrtMT54LU
  pZmW6O+Z4fnvY57ThYVWY9czc0qumf2a+fGL859eJ21tlD1yyffYm+ucjvhM5krW/66Z0Ou82
  +mj39/3GaYmndA7sK5pp/bzMqvRZj25VjqzylXau+IXmvEvcU/0Zjy9qu3hbclV85dqKyu43s
  /r3H2BbWHl/55Y/Fz96lKk3XNpz+FvvvOPq31IO3twc5nU63fNutjLn2myOU0e/yHdOXMk4/1
  FR3Hkdgzy+B4KedjmOE89yt39JfxstWni04XXeNF2Vt8+Yta8LTuCZ5MrWnVnYuenED5ngJX9
  2X2zRunChTnrXL8vw/1WvJ6vcOFyiduT+jahL99tkFkak/1uj1Nbg2rxPiaU4I9FQi7moOBEA
  n/G6oEYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-587.messagelabs.com!1649137132!430499!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13459 invoked from network); 5 Apr 2022 05:38:52 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Apr 2022 05:38:52 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E86ED10044A
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:38:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id DB76F1000FF
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:38:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Apr 2022 06:38:30 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-tzlocal: upgrade 4.1 -> 4.2
Date: Sat, 2 Apr 2022 20:35:03 +0800
Message-ID: <1648902907-19815-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96403

Add dependency : python3-datetime

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tzlocal_4.1.bb => python3-tzlocal_4.2.bb}  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzlocal_4.1.bb => python3-tzlocal_4.2.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_4.1.bb b/meta-python/recipes-devtools/python/python3-tzlocal_4.2.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-tzlocal_4.1.bb
rename to meta-python/recipes-devtools/python/python3-tzlocal_4.2.bb
index 1c910920e0..b9307f100f 100644
--- a/meta-python/recipes-devtools/python/python3-tzlocal_4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tzlocal_4.2.bb
@@ -3,10 +3,11 @@ HOMEPAGE = "https://pypi.org/project/tzlocal/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=57e0bd61643d81d05683cdce65b11d10"
 
-SRC_URI[sha256sum] = "0f28015ac68a5c067210400a9197fc5d36ba9bc3f8eaf1da3cbd59acdfed9e09"
+SRC_URI[sha256sum] = "ee5842fa3a795f023514ac2d801c4a81d1743bbe642e3940143326b3a00addd7"
 
 inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "\
 	${PYTHON_PN}-pytz-deprecation-shim \
+        ${PYTHON_PN}-datetime \
 "
-- 
2.25.1


