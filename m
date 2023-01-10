Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51CE0C61DB3
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 05:40:43 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.96896.1673329242039847414
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 21:40:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PkT2MkW7;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673329240; i=@fujitsu.com;
	bh=zgh4fWwPAaIKdfqWeqBgoCQY4jCT/6WrbC9d/gZL1zc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=PkT2MkW77RZtzdSfTKawDOam/gA1Rj3bV7RJl4CtenxZge4PE4YSQocyaZt8Xg/vo
	 LKW7U/7m/MdP0YiLcOnF10zt/CFzhOMMKRWpcTY8xcGlhZ+5c4/o9sPRRe5zPAQCXp
	 RIklaNG/nxFIQ7t6ZWkvjDcz1ODBbVHle8P+wgc40578UplIkipQv30IzzCS8gxWbW
	 OCpoz+1BA1gnx1Bt6yFNUoYJFQoPfX98cocHX9O/UM3smX4iLu0bQKHDKoQVnOXApp
	 gx5ei0xiQypUwDQl1r6LaLc8zhUoCVh4YyJXiWuDRi1zUQpZGCEgO1CehAa3vsYqpw
	 GLe5bArtTOUvw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWTf8155
  kg6mXNS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oznvw4xFkzjqejZfYGtgbGfu4uRi0NI4AGj
  xKXDM9khnCtMEjd+NLJBOHsZJf6fX8jaxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAt8S8P/uZQGwWAVWJnzeng9XzCjhKLDq3CsyWEFCQmPLwPVgvp4CTRPeEqywgthBQzd
  dPXxgh6gUlTs58wgIxX0Li4IsXzBC9ihKzLzezQNiVEq0ffkHZahJXz21insAoOAtJ+ywk7Qs
  YmVYxmhanFpWlFuka6SUVZaZnlOQmZuboJVbpJuqlluqWpxaXAGUSy4v1UouL9Yorc5NzUvTy
  Uks2MQKDN6VY4fsOxu6lf/QOMUpyMCmJ8hZ92pMsxJeUn1KZkVicEV9UmpNafIhRhoNDSYJX5
  wdQTrAoNT21Ii0zBxhJMGkJDh4lEd5514HSvMUFibnFmekQqVOMilLivJN+AiUEQBIZpXlwbb
  DovcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmNf6K9AUnsy8Erjpr4AWMwEt/jF1J8jikkS
  ElFQDU/3v9pjvX77+2uq3+0/tFHnfD6yTY9/P5TtQGj7n27zufOFah3N26dqVH67VfHv+e8f0
  56wpV329K9oONPX5Xro9l3vJbdsTi1Yo79k593XnzayXMyaov1zgoL70x+otLozcy9KuzrZ0W
  Mb4iy2x+dkDjoaQpp0TPNeumH/XvSbjdf/iDZ1OGZ93nZ9cu+eh6aOzHdc6C38pa9vsttp6Xq
  L2fObEGHGbfKN5NxYmLP63KWYv39Z7ESunqx6PUmfd2qUQWpS8QOTdmzPF8yRW75fbXcD4XWS
  BR45QguPkMvM2R9FVYdKt7pP+dkf90tI6t3CDUeKLo7IhSYJSdUbh4ZsyAvoWmj/8lnNwytKf
  Fw8osRRnJBpqMRcVJwIAkPAprVkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-565.messagelabs.com!1673329239!4652!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32532 invoked from network); 10 Jan 2023 05:40:39 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-15.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jan 2023 05:40:39 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 5F70D7C
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:40:39 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 53B317B
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:40:39 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 10 Jan 2023 05:40:37 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libmoo-perl: upgrade 2.005004 -> 2.005005
Date: Tue, 10 Jan 2023 13:40:20 +0800
Message-ID: <1673329220-5227-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673329220-5227-1-git-send-email-wangmy@fujitsu.com>
References: <1673329220-5227-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100508

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- drop dependency on Test::Fatal

License-Update: 
- Add "Required on perl versions prior to 5.10.0." to MRO::Compat
- Remove "bluefeet - Aran Deltac (cpan:BLUEFEET) <bluefeet@gmail.com>"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libmoo-perl_2.005004.bb => libmoo-perl_2.005005.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libmoo/{libmoo-perl_2.005004.bb => libmoo-perl_2.005005.bb} (92%)

diff --git a/meta-perl/recipes-perl/libmoo/libmoo-perl_2.005004.bb b/meta-perl/recipes-perl/libmoo/libmoo-perl_2.005005.bb
similarity index 92%
rename from meta-perl/recipes-perl/libmoo/libmoo-perl_2.005004.bb
rename to meta-perl/recipes-perl/libmoo/libmoo-perl_2.005005.bb
index 5480b9069f..e92d793d9c 100644
--- a/meta-perl/recipes-perl/libmoo/libmoo-perl_2.005004.bb
+++ b/meta-perl/recipes-perl/libmoo/libmoo-perl_2.005005.bb
@@ -7,10 +7,10 @@ SECTION = "libs"
 HOMEPAGE = "http://metapan.org/release/Moo/"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://README;beginline=742;endline=787;md5=0e7ee44f5ce5e9b84619cd198caad1d6"
+LIC_FILES_CHKSUM = "file://README;beginline=742;endline=787;md5=74f4de483dce5aa45ed6da875f11258a"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/Moo-${PV}.tar.gz"
-SRC_URI[sha256sum] = "e3030b80bd554a66f6b3c27fd53b1b5909d12af05c4c11ece9a58f8d1e478928"
+SRC_URI[sha256sum] = "fb5a2952649faed07373f220b78004a9c6aba387739133740c1770e9b1f4b108"
 
 S = "${WORKDIR}/Moo-${PV}"
 
-- 
2.25.1


