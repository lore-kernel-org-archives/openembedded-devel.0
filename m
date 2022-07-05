Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BE8C433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 06:39:16 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.81441.1657003138080474043
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 23:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Uq6WHQW6;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657003136; i=@fujitsu.com;
	bh=BtvpOABiSrKYHM0ZKjPvBbkfoSm0Ch28xjfRvza1yXY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Uq6WHQW6c1qpugM1AdHQWdt7u/T+vGV3uSQFdUK43TqmMT/LhtyzvmOkT1K/+vM11
	 WhDEQSLOo3ERdQW4xayP4Z7YtpDSB9Vrh1rcsES4F2YMwegZjSpo0/MO25SeIapxyG
	 Q5rgP4Hvr/t4js24Mlnu1eyCRlLGGsIM3zPgw85+bxgYW04ccl9kxDKqHUXcSECUfR
	 jbQJbwotaLxdUf0MFzA1KZP1NZ3NUR01W5bkuX9IWzX80HFsgnFgFWzBjHcySKgEPE
	 OxEsi8yDTx+XD0zNj5xvElFqqasohivIIL7U02pJA0eg62ht/Q879xs+U0Tk8gRh1n
	 jvdraHQS4F9PQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8ORqFt/53C
  SwawZ1hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aG58uYCtazV5xuusfUwHiNrYuRi0NI4Amj
  xKp9b5ggnOtMEk8nrGKFcHYzSsy8PY2xi5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9i7GDk4hAVcJFY1GIGEWYDCCx/2g5XzCjhJ3N4+nR3ElhBQkJjy8D0zRFxQ4uTMJywQYyQkDr
  54wQxRoygx+3IzC4RdITFjxjY2CFtN4uq5TcwTGPlnIWmfhaR9ASPTKkarpKLM9IyS3MTMHF1
  DAwNdQ0NTXSBpaqKXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuck6KXl1qyiREYlCnFDLN2
  MM7q+6l3iFGSg0lJlDfu6uEkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8zFeAcoJFqempFWmZO
  cAIgUlLcPAoifCuOA2U5i0uSMwtzkyHSJ1i1OW4euXKXmYhlrz8vFQpcd7dt4CKBECKMkrz4E
  bAovUSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeX7eBpvBk5pXAbXoFdAQT0BE3qg6AHFG
  SiJCSamCaqdH42viYzJ4jq+03hf5rOtW7+JgP5/wzsaUTS24dKggTYXIIE37qJRomv/U7Z4Dm
  6uj/Ua2K8ktkKu58DgqYIe7JfKvu1fsjGd/WOsx33rz6qLDT31WPuqN/63KlbfhiZls73+TGl
  bym6Y+d9PxCZ9+uu3fCoaZ8peicNwxNbekaBa+nXEzLTl/tosjj4ptkN4dVnfM6V8X7Fz+0kx
  +ESCru7Xi98/6NGQsn1LcmbFN6FW4x1T/CL2HFhua7Rm6GUwocxf69mnlKe89mob+fX18//fi
  MxhW2fa+llWfsUVi+qed6e8IkbbaTjNe1nBTrHzgsy/589QTv06j7ZgLpTexztpcKxjJaTJtV
  ++eVEktxRqKhFnNRcSIAcFXRelEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-585.messagelabs.com!1657003135!249282!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22607 invoked from network); 5 Jul 2022 06:38:55 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Jul 2022 06:38:55 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 94E26100190
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Jul 2022 07:38:55 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8874810018D
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Jul 2022 07:38:55 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Jul 2022 07:38:53 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] googletest: upgrade 1.12.0 -> 1.12.1
Date: Tue, 5 Jul 2022 14:38:33 +0800
Message-ID: <1657003117-14465-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Jul 2022 06:39:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97708

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-test/googletest/googletest_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-test/googletest/googletest_git.bb b/meta-oe/recipes-test/googletest/googletest_git.bb
index b8088a31a..edca0bc46 100644
--- a/meta-oe/recipes-test/googletest/googletest_git.bb
+++ b/meta-oe/recipes-test/googletest/googletest_git.bb
@@ -4,13 +4,13 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
 
-PV = "1.12.0"
+PV = "1.12.1"
 
 PROVIDES += "gmock gtest"
 
 S = "${WORKDIR}/git"
-SRCREV = "15460959cbbfa20e66ef0b5ab497367e47fc0a04"
-SRC_URI = "git://github.com/google/googletest.git;branch=main;protocol=https"
+SRCREV = "58d77fa8070e8cec2dc1ed015d66b454c8d78850"
+SRC_URI = "git://github.com/google/googletest.git;branch=v1.12.x;protocol=https"
 
 inherit cmake
 
-- 
2.25.1


