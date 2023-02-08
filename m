Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EEE8C05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:10:25 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.3757.1675843817786952385
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:10:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=lhLZb21G;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675843815; i=@fujitsu.com;
	bh=kYRMmmN2fiyJI/vdf20HhgbnsQ27Xji95wcsgXMBjxQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=lhLZb21GI1McaeSy80X7LOLUsL8rxu/fKZX4pi/Rt/UTkgGutY9QqytCuAoO/GWwF
	 kufW/fIB/dnkycP5STaylm+IKAyQt2JbZ9UyVHEcZWoBlBfKZ5qVALhymrwstohnas
	 NGjegIVZRpVWA89D4ctUvvexGMhHQ7j55uJDBcknhwIuPNcCNBU7ZcxNgqflT3MHfB
	 fE0/RU5gGJzS3OZvIcSNPLVh/0UGwM8GpeeUMHeAzca1yYiuyHI4O8Zz0X+A4pu77x
	 4qR7HgPyXiKodC4ImSQ2NLW2tfGYDcQ/1PN9/gs8/JXjPVD1oVur1vzt4kiYi6NG3P
	 oGkmRTV8FOEPA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRWlGSWpSXmKPExsViZ8ORpPs84nG
  yQV+XosXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjH5m2DBda6KjlPlDYzPObsYOTmEBB4ySrx8
  rdfFyAVkX2WS2PfoNROEs4dR4s3yP+wgVWwCUhI37v9nA7FFBPQlls7ewwxiMwuoSLz43QNWI
  yzgJ/H4yTZWEJsFKL5r8gqwel4BJ4kJU6aAxSUEFCSmPHwP1ssp4Czx6s0UNogrnCRaP59ihq
  gXlDg58wkLxHxNidbtv9khbHmJ5q2zmSHmKErMvtzMAmFXSrR++AVlq0lcPbeJeQKj0Cwko2Y
  hGTULyagFjMyrGM2KU4vKUot0jfSSijLTM0pyEzNz9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL
  9Yorc5NzUvTyUks2MQIDPaU4+dMOxnW9f/UOMUpyMCmJ8nqKPU4W4kvKT6nMSCzOiC8qzUktP
  sQow8GhJMEbEQ6UEyxKTU+tSMvMAUYdTFqCg0dJhDcyFCjNW1yQmFucmQ6ROsWoKCXOexWkTw
  AkkVGaB9cGi/RLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5A8KApvBk5pXATX8FtJgJaHG
  I6kOQxSWJCCmpBqYlMR21axZIiMQ5FD9eka/6aFXRPzmv/X0vLRMtF6y4+09wQhnbHTl+l6/b
  llgJzPwTfolhyp11d9M00pbn2j9qjimYItAiK7wq5cdcjT0+ywv/xH2/N6dcbGa9Q+Lh6eXBz
  Y7ZrSfyru1aszHrqryUzXSLpXr8FqXsAVP2vhZYfrbkt2rIgRr36ibXr1rJP3M4g1QnOa5k5n
  TqMt/x4UNZydHWmNOsXJ3f128uMb+1YuMEVVtHV5kHCzadqmVesXhqPb9kjM9MmcldJ18GLUq
  8LR/08uu0FK3plgfjc7yaLp3evuvTzGkKBfcNGyzO/w3u/vd367q/1TOvTDa+FPy5QLf+27m7
  WkkLmvolK6qUWIozEg21mIuKEwEoPFe6bwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-745.messagelabs.com!1675843815!176106!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21411 invoked from network); 8 Feb 2023 08:10:15 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-4.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:10:15 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id F21B91AF
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:10:14 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id E60121AD
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:10:14 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:10:13 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-dateparser: upgrade 1.1.6 -> 1.1.7
Date: Wed, 8 Feb 2023 16:09:53 +0800
Message-ID: <1675843794-11226-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675843794-11226-1-git-send-email-wangmy@fujitsu.com>
References: <1675843794-11226-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:10:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100976

From: Wang Mingyu <wangmy@fujitsu.com>

Improvements:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 Add an =E2=80=9Cago=E2=80=9D synonym for Arabic (#1128)
 Improved date parsing for Czech (#1131)
 Improved date parsing for Indonesian (#1134)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dateparser_1.1.6.bb =3D> python3-dateparser_1.1.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dateparser_1.1.6.bb =3D> python3-dateparser_1.1.7.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-dateparser_1.1.6.bb b/meta-python/recipes-devtools/python/python3-dateparser_1.1.7.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-dateparser_1.1.6.bb
rename to meta-python/recipes-devtools/python/python3-dateparser_1.1.7.bb
index 80869d016..4d592308a 100644
--- a/meta-python/recipes-devtools/python/python3-dateparser_1.1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-dateparser_1.1.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/scrapinghub/dateparser"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3d3ed25571191e7aa3f55d0a6efe0051"
 
-SRC_URI[sha256sum] =3D "e703db1815270c020552f4b3e3a981937b48b2cbcfcef5347071b74788dd9214"
+SRC_URI[sha256sum] =3D "ff047d9cffad4d3113ead8ec0faf8a7fc43bab7d853ac8715e071312b53c465a"
 
 PYPI_PACKAGE =3D "dateparser"
 
-- 
2.34.1


