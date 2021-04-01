Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web09.2225.1617244164230705867
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 19:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QjDNhWHr;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617244162; i=@fujitsu.com;
	bh=+MGb2gG7DTyBtZYFaSEBWPaIZXD/nx6EbW5H2py/8do=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=QjDNhWHr8tQZhRVR5Geic6SE9zUX7cDZBkz+kThhZFhr4mOmEx46t2tPwOovWfUwi
	 3t0cMNKn3xvcs+gBkWPvaTwKusMkZs9YhY5ERmWrRAyLb+HBgTKMPh166cPUHjBoOG
	 0I8JknMhaincPeoi7oqWz/5Mcosbw+Tr+fadtWyEOhO/+slWJWbz7TBVLvypjCeby+
	 RJgXX6pYWrqq7ENhAmrQCIuVoo+zOmkeKwasX+FlAeH8+sDxlshwTJ+O7uDzX958ZT
	 2IladfuG8n01XE0W2fXl8dOiiDQ9WCWN7+Pdlzky4uzlrTSlhpLDGtHd/81dBBIoaC
	 9JP06K7PXn8fg==
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id A8/F8-24644-20035606; Thu, 01 Apr 2021 02:29:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MxVZfRIDX
  B4M0eM4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaNn3naWgpXsFcsbXrI0MB5i62Lk4hAS2Mok
  cfHMdVYI5zijRMuryUxdjJwcbAI6Eh0vullAbBEBfYmls/cwg9jCAg4St25/BKthEVCRePd+A
  5jNK+Au8WnFXrB6CQEFiSkP3zNDxAUlTs58AhZnFpCQOPjiBTNEjaLE9p1noOqrJM7O/sI0gZ
  FnFpKWWUhaFjAyrWK0SCrKTM8oyU3MzNE1NDDQNTQ00jW0BGIjM73EKt1EvdRS3fLU4hJdQ73
  E8mK94src5JwUvbzUkk2MwEBKKThQt4PxwesPeocYJTmYlER5p0xLSRDiS8pPqcxILM6ILyrN
  SS0+xCjDwaEkweuin5ogJFiUmp5akZaZAwxqmLQEB4+SCK+NBlCat7ggMbc4Mx0idYpRl+PKq
  iWLmIVY8vLzUqXEebn0gIoEQIoySvPgRsAi7BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV
  4ZkCk8mXklcJteAR3BBHTElUeJIEeUJCKkpBqYZu3P+FqkkcMhdkreyuipoFTjgb9uhhMuTbp
  hOuvc6VUvVq03UpFTmFPy6JWun9WeaXMuvtRvTjm6+5DI5fJo5msmZg/nsG+Kijzp0vXnq4Vy
  2MPOgnbe2e0BnyKtXqm96BZzflb4aIZJ4IGZBjyF5i33754x/GLNsTxnemLO+8w5nT+uqCruq
  F7vpjaHZ6Nzx8GPrwyLWDtyDzWLmrUyux2bd95tYdEsLc4qtxvzmBNmcJUVfmCw5dT4zSLpki
  bQtnRztVLLfbNF70KbAprjrVhuvD3E+q43z0BnqR/T9+Itzy6tN+EpuXep67HGm9yJNVctuB1
  L/h8M2e+b8b3q4N0iv7xfb1+r8q59cTJIiaU4I9FQi7moOBEAKzIOmCsDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-23.tower-267.messagelabs.com!1617244161!458858!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22178 invoked from network); 1 Apr 2021 02:29:21 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-23.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Apr 2021 02:29:21 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1312TL3k026675
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Apr 2021 03:29:21 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 1 Apr 2021 03:29:19 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] ostree: upgrade 2020.8 -> 2021.1
Date: Thu, 1 Apr 2021 10:29:13 +0800
Message-ID: <1617244153-91994-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../ostree/{ostree_2020.8.bb => ostree_2021.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2020.8.bb => ostree_2021.1.bb} (99%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2020.8.bb b/meta-oe/recipes-extended/ostree/ostree_2021.1.bb
similarity index 99%
rename from meta-oe/recipes-extended/ostree/ostree_2020.8.bb
rename to meta-oe/recipes-extended/ostree/ostree_2021.1.bb
index 4f0f719fb..c382ad87f 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2020.8.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2021.1.bb
@@ -25,7 +25,7 @@ SRC_URI = " \
     gitsm://github.com/ostreedev/ostree \
     file://run-ptest \
 "
-SRCREV = "3e289b19345e30d2da193cd208e109f7d7aaa2a1"
+SRCREV = "e9e4b9112083228b8c385ad26924b6c4623f4179"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
 
-- 
2.25.1

