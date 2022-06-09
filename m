Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C54CCCA47D
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 07:18:41 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.7735.1654759117746640847
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 00:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=scb7HKTP;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654759115; i=@fujitsu.com;
	bh=BoC4XQ2JcAcg8r1uaZg4bpxNbvT/WcjS+JB59QorazI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=scb7HKTPWD3Us8PRGa5My5UktyF4tPuMzsePS7pC9tsp7zQSdam9MuJ3u3AfVOo1b
	 DnZ9Z6uPemwfEH3ch8c9LNuHy/JwXfsT5z8Le9FaTinO/iGiEzzvEZkY6CJQVFZRfK
	 qR7GN+3NP+Ryl7RVcd6rBM1pg0ZEC74GnSxhVBThdSR3Wjg8GVmB5R9lKmxQOj6Ym6
	 apakoqfy3fHOccYeiOkEAlNIWD/PlYMV6A2g/K3sJbbeLmPvQFKSm76spApK22bcqH
	 gE4T3ZCRDeJz6qJp97gIj8w8/e4vp5HvbR7LlbwrJmVuQCwBh78JbQU3r456FMuMUq
	 eQOPYYLS+EBxA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORqHt63sI
  kg2VbuC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oz2U9MYC1ZwVWzraWRrYFzD2cXIxSEk8IRR
  YlbXLyYI5wKTRM/fDewQzn5GiekrFrN1MXJysAnoSrz4sZgFxBYR0JdYOnsPM4gtLOAh0Td5L
  juIzSKgIrHz8zxWEJsXKL7oxDOwegkBBYkpD98zQ8QFJU7OfAIWZxaQkDj44gVQnAOoRlFi9n
  R5iPIKideHLzFD2GoSV89tYp7AyDcLSfcsJN0LGJlWMVonFWWmZ5TkJmbm6BoaGOgaGprqWpr
  pGprpJVbpJuqllurm5ReVZOga6iWWF+ulFhfrFVfmJuek6OWllmxiBIZfSnGCwA7Gvft+6R1i
  lORgUhLlPZe6MEmILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO/eWUA5waLU9NSKtMwcYCzApCU4e
  JREeK/OAUrzFhck5hZnpkOkTjHqcsz82naAWYglLz8vVUqcd91coCIBkKKM0jy4EbC4vMQoKy
  XMy8jAwCDEU5BalJtZgir/ilGcg1FJmHcpyBSezLwSuE2vgI5gAjri15UFIEeUJCKkpBqYsqR
  b1ik8EV/xzCHnwSpnrw9fNn9SqbspXn1X+K+tRp311fufOj6UBHycG8y/k3fBs8qLIkFv/Z83
  VZ3/UybVzx+W5BC1rFDa6+4hfvVX7foxrz5IHNmtk25UZrBzc4bspcZ/Mboycyby+hUHsXz+t
  +LAvpa4j/FiohuffHuy5V2u8ilDL/NFcannw3ROySoW7Kh7NPut9GYT206Dt66Tt64rv6Numn
  J40amK3+92SSUlXM7UbjUsDJ9ZrGPOMJ25/HhhXGHoOR+x+sDWiunrkltX/Fn24euV5AY27xX
  ygjmcfS4VT9Z1ssq6yS5LN8lhuTx1JfvanPvru+bxJPVztQXIanzeExXlPftPg6MSS3FGoqEW
  c1FxIgBYuNoYRgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-745.messagelabs.com!1654759114!73300!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25416 invoked from network); 9 Jun 2022 07:18:35 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Jun 2022 07:18:35 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 8D23B100198
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:18:34 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 7F82C10018E
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:18:34 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 9 Jun 2022 08:18:18 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-absl: upgrade 1.0.0 -> 1.1.0
Date: Thu, 9 Jun 2022 15:18:10 +0800
Message-ID: <1654759090-10980-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jun 2022 07:18:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97453

Changelog:
==========
*Flag instances now raise an error if used in a bool context.
 This prevents the occasional mistake of testing an instance for truthiness
 rather than testing flag.value.
*absl-py no longer depends on six.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-absl_1.0.0.bb => python3-absl_1.1.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-absl_1.0.0.bb => python3-absl_1.1.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-absl_1.0.0.bb b/meta-python/recipes-devtools/python/python3-absl_1.1.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-absl_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-absl_1.1.0.bb
index 736e6a944..e3f7c4c6a 100644
--- a/meta-python/recipes-devtools/python/python3-absl_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-absl_1.1.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "ac511215c01ee9ae47b19716599e8ccfa746f2e18de72bdf641b79b22afa27ea"
+SRC_URI[sha256sum] = "3aa39f898329c2156ff525dfa69ce709e42d77aab18bf4917719d6f260aa6a08"
 
 PYPI_PACKAGE = "absl-py"
 
-- 
2.25.1


