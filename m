Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3159BC4708D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 03:43:59 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.3776.1672803832049953415
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 19:43:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lM/5Qiq6;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672803833; i=@fujitsu.com;
	bh=jxF8wWEd86IgdZwjwH87/nOsM6sNb9CHiZYQWZts2rc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=lM/5Qiq6MePR9kaY/ThgSKYSyHPewJolj+jEtZv8tSO6R1Ou86f7jNUelxsPo9wiL
	 Q+Nrp96Tjs7zaw3u2jnlK2Gla7MHnt4+Y3c8krXaj+93KK2nx7pKIBE+aueHWLxuFa
	 5qeTChwpaMgjfGYk3VzbwtaGS+X0gC37++kpLhZAo848oCVGuzjU9EqPKS9nlboOuz
	 Us6ThgAuEbtA78Zg/QaY+RZqxnKp8f6+aqxVmD2b/ZI3C2XwgZ7p1NFFpKv3gzZ5JL
	 VE2PKvfx7GJq6AKNvkRVDmGXJj4ArlAQUvFp9mcHILhsKDjk1Ze0oChIwrUi2sm+mZ
	 i1W5GQRIDq9cg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORpPvj65Z
  kg2Wr9C0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyOZpGC65wVM5esZ2tg/MrRxcjFISTwkFFi
  y4Z5jBDOZSaJU9+WMkE4uxklZnd2snQxcnKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAnMffxfTCbRUBV4n1XD1g9r4CTxKGWZWBzJAQUJKY8fA/WyyngLDFpbRdYXAio5tX+Xc
  wQ9YISJ2c+YYGYLyFx8MULZoheRYnZl5uh5lRIzJrVxgRhq0lcPbeJeQKj4Cwk7bOQtC9gZFr
  FaFacWlSWWqRraKGXVJSZnlGSm5iZo5dYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZm5yTopeX
  WrKJERi8KcXqJ3cwblj2R+8QoyQHk5Iob8nnLclCfEn5KZUZicUZ8UWlOanFhxhlODiUJHjVP
  wHlBItS01Mr0jJzgJEEk5bg4FES4c0CaeUtLkjMLc5Mh0idYtTluLtw715mIZa8/LxUKXHeW1
  +AigRAijJK8+BGwKL6EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3tUgq3gy80rgNr0COoI
  J6IikNRtBjihJREhJNTBFfQo7ufs/U1ysr8IpSeHfi7duuZr77Wnp7b9TZdrdJ1zMZp2YcP+T
  0jUDzUsnM2T/b/nfyJeRdWNebiQnE8ujLWa1r/dsu3rQ8MjBf++CHi5WEZl9YKWJpGBBlS2H5
  YzC7PSj2rIvSvImT5grknf2Go91w+b2+tioT5oFBo6vJ+1Yuz2p8ck/kykKSWe7XT2+tpUHPV
  mV392uFrJm00t+dU7ZDUc/8F29bnbHqnmTX9C+BpXOaZku6g+iSqyf1pfumCnIc2DVmWOVV/d
  dKmwruHyLmVXPg3vDkZA13t3Tnjo93iO/de2XnYrWruv1Zjo5u/5bKHDrerH+9vsHbfR5/oee
  PynFYij4b4Ef+29XJZbijERDLeai4kQA8LmH1WUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-565.messagelabs.com!1672803832!383089!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12697 invoked from network); 4 Jan 2023 03:43:52 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-12.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Jan 2023 03:43:52 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 7D6CB1B2
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:43:52 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 727717B
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:43:52 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 4 Jan 2023 03:43:50 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pydantic: upgrade 1.10.2 -> 1.10.4
Date: Fri, 30 Dec 2022 13:00:21 +0800
Message-ID: <1672376423-25554-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672376423-25554-1-git-send-email-wangmy@fujitsu.com>
References: <1672376423-25554-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 03:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100382

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Change dependency to typing-extensions>=4.2.0, #4885

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pydantic_1.10.2.bb => python3-pydantic_1.10.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_1.10.2.bb => python3-pydantic_1.10.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_1.10.2.bb b/meta-python/recipes-devtools/python/python3-pydantic_1.10.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pydantic_1.10.2.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_1.10.4.bb
index 16bb1f6ae..c17f3024c 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_1.10.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_1.10.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c02ea30650b91528657db64baea1757"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "91b8e218852ef6007c2b98cd861601c6a09f1aa32bbbb74fab5b1c33d4a1e410"
+SRC_URI[sha256sum] = "b9a3859f24eb4e097502a3be1fb4b2abb79b6103dd9e2e0edb70613a4459a648"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-typing-extensions \
-- 
2.25.1


