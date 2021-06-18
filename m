Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.2621.1623982673765235421
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jun 2021 19:17:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rCy9u/as;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623982672; i=@fujitsu.com;
	bh=wshdKx9j9hgFmlxYSPBRdZYegSdq4i6IQbRq2qwK75w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rCy9u/aso1raJJZFhLwhKxxlsPWkppiDsKFPpPcfPDElH4ug9RZQe0/4InHVyhGRN
	 Jtpg9CoYF/y0brR8UKdTRvvKfdOZVMr3dwbn2d4egWEZvroz5Xd98QBRRBf429lIZK
	 uM/m42rPsRRCVUMcXHud4m31LjxsGibosG6szgjSOO3n1oLHFuStFF4iZB2Jo2pcvZ
	 mi/p52IP7F/PHC30Xjur+AHaRDAMXa9pU5Jym8BM2HU8EduTPo2wXkNCmeoqiHxzQl
	 oGzG1g+hKux99leoPT4oByINGndKzY3UaTYe2tGQZHqXWhLi5ubBOrtLnU03+grN2/
	 CTY7GFnoZYu3g==
Received: from [100.112.199.57] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id 94/B9-00056-F420CC06; Fri, 18 Jun 2021 02:17:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0fVnOpN
  gcGuPrMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHryQ2WgpNsFdPmzWVpYLzC2sXIxSEkMJtJ
  4tSjRUwQzh5GiYsrb7N1MXJysAnoSpx7vJYdxBYR0JdYOnsPM4gtLOAoceLQbTCbRUBVYs/LX
  2A2r4CHxNNlM1lBbAkBBYkpD99DxQUlTs58wgJiMwtISBx88QIozgFUoygxe7o8RHmFxIwZ29
  gmMPLMQtIxC0nHAkamVYwWSUWZ6RkluYmZObqGBga6hoZGuoaW5rqGxuZ6iVW6SXqppbrlqcU
  luoZ6ieXFesWVuck5KXp5qSWbGIFhlFJwtHMH469XH/QOMUpyMCmJ8lq9PJ0gxJeUn1KZkVic
  EV9UmpNafIhRhoNDSYJX5T9QTrAoNT21Ii0zBxjSMGkJDh4lEd43DGcShHiLCxJzizPTIVKnG
  BWlxHk/giQEQBIZpXlwbbA4usQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmDcNZApPZl4J3P
  RXQIuZgBa3CZ0CWVySiJCSamAy8YwR+iYrE38s5J6czQSTu5rT4qo1j6452feDc53Aki/udTy
  +c4ur+SfN+FKrqpYyofRB3n3ZOYqfG2eJC0ZlVKzcJCE2bZKHcZBDOavl/AXrGxv29l6YJ1LC
  ss17Ms+++oqJ85U//XFYxyj2/JLvzc8fQgvnKD2YMLeBfe5l3k9OGWaML9Xnbvq+WUdj/qw0l
  8CJRgJR0SZ85RusVu71j6l07rRdH/d5lczhdacuHpUTmGbM7mBU0FpkJ83V1LpyH8uS1sCubw
  xnPjw8PeOFdKTspTnV8UsMF+jqNEyflRY9u6Nzk8y8u1Uf03bG5pcIzy1bs5FTzWzxF6+7CkX
  nrD7OP743o+uQ/oSn634psRRnJBpqMRcVJwIAE9swWR4DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-291.messagelabs.com!1623982671!87503!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2628 invoked from network); 18 Jun 2021 02:17:51 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-13.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Jun 2021 02:17:51 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15I2HpCH005215
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jun 2021 03:17:51 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 18 Jun 2021 03:17:49 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] rsnapshot: upgrade 1.4.3 -> 1.4.4
Date: Fri, 18 Jun 2021 19:17:38 +0800
Message-ID: <1624015058-18468-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
index 33f5dccca2..a81d8d6cad 100644
--- a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
+++ b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
@@ -22,8 +22,8 @@ RDEPENDS_${PN} = "rsync \
                   perl-module-ipc-open3 \
                  "
 
-SRCREV = "a9e29850fc33c503c289e245c7bad350eed746d9"
-PV = "1.4.3+git${SRCPV}"
+SRCREV = "4dc82bfe6be3f83fcfa94946dcf6accfd6a18031"
+PV = "1.4.4+git${SRCPV}"
 
 SRC_URI = "git://github.com/DrHyde/${BPN};branch=master;protocol=git \
            file://configure-fix-cmd_rsync.patch \
-- 
2.25.1

