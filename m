Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F3DC48BCB
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:13 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.26551.1650872194667601716
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 00:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IK9qMPqb;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650872193; i=@fujitsu.com;
	bh=vZ1mdHqoNjpBjLOttqw8+w2/vUeZ7M5D8juiIlJsyAQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=IK9qMPqbU8UihovziAgz1ChMcvZ2LApqNJXH9IbsZg3lROddtLl4+9ivs3Vxy+9EH
	 lQy/5fEzLsTBcY0SG9bifS9St0hJG8bRvR2X49OBF13L4K3rUf+3U8L+BrzuVZnkIG
	 aNBKy6HkEUr09s5haOedweRmcq8/WjHQ21zGTMe8ze2MtcBkqP9V9y8Z/zYqt4Wict
	 10FY61QCqpd7tS+FK8ifws1JsJllLNbPah19kPt9FvRnxQkP2usfKw9bOoPgMMoVrm
	 VHI8NM5eZKjg84rtdbVHL5DSduJJetUortx4CbqyBGkd10pPXBu557DiSN959pmRr/
	 I4gI6w8oJ2j6g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNIsWRWlGSWpSXmKPExsViZ8MxRbfBPy3
  JoLVB2+Li4aXMDowe5zauYAxgjGLNzEvKr0hgzbhzv4+p4CF3RUfXZ/YGxg9cXYxcHEICs5kk
  plyezgTh7GGU2HjnN2sXIycHm4CaxPRbN8BsEQF9iaWz9zCD2MwCKhIvfvewg9jCAoESz6fNB
  bNZBFQlOtf1sIHYvAJOEj9aDzGC2BICChJTHr5nhogLSpyc+YQFYo6ExMEXL5ghahQlZl9uZo
  GwKyRmzWpjmsDIOwtJyywkLQsYmVYxWicVZaZnlOQmZuboGhoY6Boamuoam+gaGVroJVbpJuq
  lluqWpxaX6BrpJZYX66UWF+sVV+Ym56To5aWWbGIEhllKsdKtHYwbVv3UO8QoycGkJMp7zyQt
  SYgvKT+lMiOxOCO+qDQntfgQowwHh5IE725foJxgUWp6akVaZg4w5GHSEhw8SiK86d5Aad7ig
  sTc4sx0iNQpRkUpcd67fkAJAZBERmkeXBsszi4xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEu
  ZN9wGawpOZVwI3/RXQYiagxZ9qU0EWlyQipKQamBqzD67XXte+/aiU0tL3xY8ORUoZ2cUb6jg
  9Cdth+M5ngY7pQsXareXtd94FCdks+tzjtI1FicP4/Iqu9YwLJ7bLFV/xL/vw90ufV4fZslls
  HQkzhXg6zI79t9kXJCncXCI0VeFowOvFR0Pboho03e2NJ6+99slrvbzeqZ6yC4UbG5n/p2U61
  M399PxLdMLWVi+NM587rl/j8IrimhLNEOa7WGxB/d4vpat+ONt7SAUYr3AsOKRwUfTbu5zSd3
  ObVoUstyrl9z18vOLPicuJnm477844kL0qWld/b6NLbxpbmmhrj8e07xpeU1eKtef+t7swY8p
  3x/KlgWd93pS+cDYM0q40uzjXPF1B0XKnEktxRqKhFnNRcSIAUQwqUi4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-548.messagelabs.com!1650872192!64843!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25612 invoked from network); 25 Apr 2022 07:36:32 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-4.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Apr 2022 07:36:32 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23P7aNcH007665
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:36:32 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 25 Apr 2022 08:36:22 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libextutils-cppguess-perl: upgrade 0.23 ->
 0.26
Date: Mon, 25 Apr 2022 15:36:12 +0800
Message-ID: <1650872176-31497-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96771

Changelog from 0.23 to 0.26
=============================
- fix test-failure caused if CXX is set
- ignore environment variables CXXFLAGS, CXXLDFLAGS (#26)
- support environment variables CXX, CXXFLAGS, CXXLDFLAGS

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-cppguess-perl_0.23.bb => libextutils-cppguess-perl_0.26.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libextutils/{libextutils-cppguess-perl_0.23.bb => libextutils-cppguess-perl_0.26.bb} (92%)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.23.bb b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.26.bb
similarity index 92%
rename from meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.23.bb
rename to meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.26.bb
index fd6347b3d0..04a29fdc21 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.23.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-cppguess-perl_0.26.bb
@@ -12,7 +12,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=81;endline=84;md5=84c0390b90ea8c6702ce659b67bed699"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETJ/ExtUtils-CppGuess-${PV}.tar.gz"
-SRC_URI[sha256sum] = "f96c48984eb6d8efb7d933b34f361d0c8b38335e3e5382e9aeccc0aa519a002c"
+SRC_URI[sha256sum] = "c8b362b860172a4076acee00438f52b86464f2c500702cfcf7527811ff9a683e"
 
 S = "${WORKDIR}/ExtUtils-CppGuess-${PV}"
 
-- 
2.25.1


