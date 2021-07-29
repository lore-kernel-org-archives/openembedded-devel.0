Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.85])
 by mx.groups.io with SMTP id smtpd.web12.6689.1627545231349033489
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 00:53:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IMYLUbwC;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.85, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627545229; i=@fujitsu.com;
	bh=CBHzJ5Dna6F0d6cAviKiuaPrP+u1/h02adtUxlozg+c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=IMYLUbwCi5lDQzDfIfEiYcYfD4gH0q67wd2vvthhp6wH2eutFnBcK6dShoNHXW1uA
	 f1Jf3TJydigp4gU0RJNjoR7XD3oOEDZsWfB8Yhz1jXzwJmy/YvpX7mmFMZ8PkZuIZW
	 tQTRQiFwewdkQhRxB5T8LydZaAES8Oycd7YtKHXB1oQcEzjEd+QEOevkUwYqT6V0z6
	 manqQo0pd3rmIwXNCZsgPwrWi039zVsmhWoz4zIuZUJwZ7WxMfC9eBHW+R4DtdLIEh
	 nYyfFwrIaMA3OMaWjfb3nmkNQO6hTwgXECOV/vH1JQ86jF2gwpoNAuQXQTMzTeJ09u
	 mfX+citsLsvmA==
Received: from [100.112.199.201] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id A2/AD-07336-D8E52016; Thu, 29 Jul 2021 07:53:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+GYotsTx5R
  o0LLHwuLi4aXMDowe5zauYAxgjGLNzEvKr0hgzXj7/C5rwTOOimnzjrA1MHZydDFycggJzGaS
  ONHC2MXIBWTvYZSYvKSfESTBJqArce7xWnYQW0RAX2Lp7D3MILawgJvEzEsvWUFsFgFViVl3f
  7OB2LwCHhIHZm0G65UQUJCY8vA9M0RcUOLkzCcsIDazgITEwRcvgOIcQDWKErOny0OUV0i8Pn
  yJeQIjzywkHbOQdCxgZFrFaJ5UlJmeUZKbmJmja2hgoGtoaKRraGmha2ygl1ilm6SXWqpbnlp
  comuol1herFdcmZuck6KXl1qyiREYQikFx+R2MPa++aB3iFGSg0lJlPeXHVOiEF9SfkplRmJx
  RnxRaU5q8SFGGQ4OJQnewFignGBRanpqRVpmDjCcYdISHDxKIrzPo4HSvMUFibnFmekQqVOMi
  lLivA9jgBICIImM0jy4NlgMXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzOsFsp0nM68Ebv
  oroMVMQItrSxhBFpckIqSkGphm9Csn9sgXK/1VerbouLjAybfSbn82te/SeF0uYHdvf2/sndV
  TH9qn5V9TPXlUu15/YmDm1sf88/1UNerdC4s+u3X9f+rWrf+lL9jUV1TvVqrTIUdOyyfvHwsE
  hyY8bl6mttRz7jtr/4imiyplB+/vfxTzd37e+4K/vl0nj8hmLZwl4n+MlfX2Bq72rM0ZTcru/
  881hNSuSPX79VTi0qq449G3ync94/s49xB7lNg9odDceNWLysrfrfhXdL7gfOw7+y7X651+7+
  TMCi+Fbk2tLDr0sNZgSqxxlPP8g//PeHZpmzseu/9x5w2OnhtfwmZcTjX8tCJcis80eYvT76m
  bpsftN7CVksoPV/i8nFuJpTgj0VCLuag4EQAJNH6IHAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-285.messagelabs.com!1627545228!148082!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28959 invoked from network); 29 Jul 2021 07:53:48 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-3.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Jul 2021 07:53:48 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16T7rjYS027629
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jul 2021 08:53:48 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 29 Jul 2021 08:53:44 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] libcurses-perl: upgrade 1.37 -> 1.38
Date: Thu, 29 Jul 2021 15:53:30 +0800
Message-ID: <1627545210-24357-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{libcurses-perl_1.37.bb => libcurses-perl_1.38.bb}         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcurses/{libcurses-perl_1.37.bb => libcurses-perl_1.38.bb} (80%)

diff --git a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.37.bb b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.38.bb
similarity index 80%
rename from meta-perl/recipes-perl/libcurses/libcurses-perl_1.37.bb
rename to meta-perl/recipes-perl/libcurses/libcurses-perl_1.38.bb
index 17fbbae25b..a398382c66 100644
--- a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.37.bb
+++ b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.38.bb
@@ -10,8 +10,7 @@ DEPENDS += "perl ncurses "
 
 SRC_URI = "http://www.cpan.org/authors/id/G/GI/GIRAFFED/Curses-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "aede9d1ed9856eff89f4ce208ee59de0"
-SRC_URI[sha256sum] = "74707ae3ad19b35bbefda2b1d6bd31f57b40cdac8ab872171c8714c88954db20"
+SRC_URI[sha256sum] = "d521408298eb6413b209ef29d4ffcba6f5f58ee1abc60160739a17aafcb8f2f2"
 
 S = "${WORKDIR}/Curses-${PV}"
 
-- 
2.25.1

