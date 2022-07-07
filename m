Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E227CCCA479
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 07:01:32 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.2748.1657177286281781853
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 00:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xwgOaNtS;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657177284; i=@fujitsu.com;
	bh=K3+r2DfOG2Ryfpjvtdc5inlKrm37zCmuwIsY73oqqsg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xwgOaNtS4nHKzEI9F+WdvaezSBPqllZEYQKyv4S5rUVd14Z44h3qMMv2crqbZquvI
	 ByS+6H5rfk1vVg6iLOBJbkwyqagBRBpY4HchHoxVyB6w7+8kap7479lKDDoJsXxsPM
	 tKUMpMuRTkxewAGr7X2z35fYn9Z9Md8MFfH/NJTgmgst5QH4WwH9FkRzxlL23Ob6fu
	 HHaQHkFGtNGwJradHlDUToSKYZIrBb1Hi1kK4x9UeoyznjJMu9hjPpG6e9sI87I+FK
	 4zVB2Fnf7DXeYLzzZQ2QvM1LS8ifosugLA4pz6F3nUOEv+KvKd6g/b9gV07mOlBeNI
	 GaPhoPPvZ8Ucw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsViZ8ORpHu45Vi
  Swc8FRhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bErx9YCs5xVby88YelgfEEZxcjF4eQwENG
  ibO979i7GDmBnCtMEtN7WCDs3YwSL37LgNhsAmoS02/dYAWxRQT0JZbO3sMMYjMLqACV9ID1C
  gvYSsw8foANxGYBij88cRasnlfASeJuw18mEFtCQEFiysP3YL2cAs4SCw5dZYTY5SQx9+AqFo
  h6QYmTM5+wQMyXkDj44gUzRK+ixOzLzSwQdoXEjBnb2CBsNYmr5zYxT2AUnIWkfRaS9gWMTKs
  YbZKKMtMzSnITM3N0DQ0MdA0NTXUtzXQNTSz0Eqt0E/VSS3Xz8otKMnQN9RLLi/VSi4v1iitz
  k3NS9PJSSzYxAsM4pThhyg7Gw/t+6R1ilORgUhLl9ao/liTEl5SfUpmRWJwRX1Sak1p8iFGGg
  0NJgpe/CSgnWJSanlqRlpkDjCmYtAQHj5IIL2MzUJq3uCAxtzgzHSJ1itGSY+rsf/uZOZaDyZ
  lf2w4wC7Hk5eelSonz3gNpEABpyCjNgxsHi/tLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR
  5O0Gm8GTmlcBtfQV0EBPQQcvyj4AcVJKIkJJqYJpkbPFnS5jjDs5YHQN/0+tNu5rmXplm7H+7
  p++6Yqk8f9+XZ44vmjdfSVZaNnX2LaYfjZ0cK1Rz878kc5Y+Dr59RlBS6IiN5mXZr8ua1io67
  Jy2QDWnwK8okFHr9yE3DwV9xsXWLOuiSv6WLmHZuOMlv1Hwnl0/V9hKn/7yzlb4mNslnr6lIe
  fSTzpkbQnPX/kx4bryy/3hu/1P9O3mrVv33CTUOdEq11nQi+9LxKoFiyxqNJ9JcQl+WeHfz/9
  SdKEGi2Nq+IHtooXOpxZ9X5/55XIsi+vi3Z+uZGtOj/3BfLnHi4dll3iD2Hp3Ddau43stXBc1
  P/j5Tn1x6u6ts6YLlrhsFHxe1nPu3hWZLiWW4oxEQy3mouJEAGDbitx2AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-728.messagelabs.com!1657177283!82938!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32608 invoked from network); 7 Jul 2022 07:01:23 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-19.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jul 2022 07:01:23 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 2FF251B1
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 08:01:23 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 239F61B2
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 08:01:23 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Jul 2022 08:01:21 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] pegtl: upgrade 3.2.5 -> 3.2.6
Date: Thu, 7 Jul 2022 15:00:46 +0800
Message-ID: <1657177246-28404-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657177246-28404-1-git-send-email-wangmy@fujitsu.com>
References: <1657177246-28404-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 07:01:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97745

License-Update: Copyright year updated to 2022.

Changelog:
=========
    Made unwind() optional for parse tree nodes.
    Fixed demangle() for MSVC, again.
    Fixed demangle() for GCC 12.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/pegtl/{pegtl_3.2.5.bb => pegtl_3.2.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/pegtl/{pegtl_3.2.5.bb => pegtl_3.2.6.bb} (70%)

diff --git a/meta-oe/recipes-extended/pegtl/pegtl_3.2.5.bb b/meta-oe/recipes-extended/pegtl/pegtl_3.2.6.bb
similarity index 70%
rename from meta-oe/recipes-extended/pegtl/pegtl_3.2.5.bb
rename to meta-oe/recipes-extended/pegtl/pegtl_3.2.6.bb
index b4e0d17b3..7fb685013 100644
--- a/meta-oe/recipes-extended/pegtl/pegtl_3.2.5.bb
+++ b/meta-oe/recipes-extended/pegtl/pegtl_3.2.6.bb
@@ -1,10 +1,10 @@
 DESCRIPTION="header-only library for creating parsers according to Parsing Expression Grammar"
 HOMEPAGE="https://github.com/taocpp/PEGTL"
 LICENSE="MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5b6701671289d12b7ffa69138832c006"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dccf35ef30bf912bb07b01d469965293"
 
 SRC_URI = "git://github.com/taocpp/PEGTL.git;protocol=https;branch=3.x"
-SRCREV = "eeba7fa1180655bd683be620cc31be35607442ca"
+SRCREV = "464d866d8bbf4c8ddc5b67422d09b60ad3b918fc"
 
 inherit cmake
 
-- 
2.25.1


