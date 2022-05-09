Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6735EC4332F
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 09:01:53 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web08.29590.1652086906819965263
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 02:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=K7A4I2CE;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652086905; i=@fujitsu.com;
	bh=0x+B7GE/LAP44DJKN3vWsEozPelgFpQn/rSZH6KHJUE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=K7A4I2CE+05OkAotThPHz2pqGVKXgYXx2dHTtqr+licLspMrYUGs8xLEtRO+MgM0j
	 1/Wah6QU6+NvKslGIPz8BS3Ki+bF9rtoyq064yO8uEvQnTJ5eoZhrcy3EJXJqaAGIP
	 PmPxWcpmDE7vJUbPzBfJ8v+Y31efKlzJtCF5JtPI2P/uNib+lFxdXfJpru20eE0nGe
	 +/qpIUxCE5xAtXRrSleLG4N7KFNb9HDZnpF07tA6TBipg9IdY7yawzwAx3VF+tmTz4
	 9PRTKQ3MIQS98qYSvg1Bw5noIXDoWF8q10PwqVYbZw3oUKA0atoYcKK4gqTWwQZwPa
	 1DT4XTwa9UcAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8MxSbfiRkW
  SQf9SfYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPqjE6mgns8FXunL2duYHzC3cXIxSEk8IRR
  4nX/EkYI5wKTxORlfWxdjJxAzn5GibsnzEBsNgFdiRc/FrOA2CIC+hJLZ+9hBrGFBXwkLkzcC
  BZnEVCRaLq8lh3E5hVwl/jx6gBYjYSAgsSUh++ZIeKCEidnPgGrZxaQkDj44gVQnAOoRlFi9n
  R5iPIKideHL0G1qklcPbeJeQIj3ywk3bOQdC9gZFrFaJVUlJmeUZKbmJmja2hgoGtoaKoLJE1
  N9BKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1iitzk3NS9PJSSzYxAkMvpZhh1g7GWX0/9Q4xSnIw
  KYnyrr9akSTEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgvcjSE6wKDU9tSItMwcYBzBpCQ4eJRHeL
  pA0b3FBYm5xZjpE6hSjopQ4b+J1oIQASCKjNA+uDRZ7lxhlpYR5GRkYGIR4ClKLcjNLUOVfMY
  pzMCoJ84aDTOHJzCuBm/4KaDET0OKPAaUgi0sSEVJSDUz8kxpXqb345uudU/5mtU7xnMbix2c
  +BV68dozj8InNYgfieZ8ef932u+3R1MiVGbPt7uj9qT4yyULn1Or8iDIPsdsLX5ycMyd0jrlP
  yo9Jx376vWnN2/gk51J40+oNzpKFc9x5SpIYf1/Td9HS/mjv/VbNme+TpaKiQEWzQcw798jVQ
  rtDm84KfBNcvM5149btG6YplU15dDbnYoIZT/MTP9dTEtKpJrlb1kbUB3oI60lu5s8XX78/+J
  pqyOqGi3qPI4q8lhcF6LqdW8/AO3d+BvunqGMcR2c841bpZUqcmxnfnjGzv17pyW+W9sw6qaf
  7xLaLp4f83PDw/Jdtp3+k7jPYOH8G6+pq6TmZdb1KLMUZiYZazEXFiQBu+uw8OAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-591.messagelabs.com!1652086904!320880!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7262 invoked from network); 9 May 2022 09:01:44 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-20.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 09:01:44 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 4742E100441
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 10:01:44 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 393C310032A
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 10:01:44 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 10:01:24 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libconfig-general-perl: upgrade 2.63 -> 2.65
Date: Mon, 9 May 2022 17:01:09 +0800
Message-ID: <1652086869-2735-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 09:01:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97017

License-Update: updated to Artistic-2.0

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...general-perl_2.63.bb => libconfig-general-perl_2.65.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/perl/{libconfig-general-perl_2.63.bb => libconfig-general-perl_2.65.bb} (65%)

diff --git a/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.63.bb b/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.65.bb
similarity index 65%
rename from meta-oe/recipes-devtools/perl/libconfig-general-perl_2.63.bb
rename to meta-oe/recipes-devtools/perl/libconfig-general-perl_2.65.bb
index b12e2e4ba..ecc89d075 100644
--- a/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.63.bb
+++ b/meta-oe/recipes-devtools/perl/libconfig-general-perl_2.65.bb
@@ -1,15 +1,14 @@
 DESCRIPTION = "Config file parser module"
 HOMEPAGE = "http://search.cpan.org/dist/Config-General/"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LICENSE = "Artistic-2.0 | GPL-1.0-or-later"
 SECTION = "libs"
-LIC_FILES_CHKSUM = "file://README;beginline=90;endline=90;md5=3ba4bbac1e79a08332688196f637d2b2"
+LIC_FILES_CHKSUM = "file://README;beginline=90;endline=90;md5=53fe13727e61798809ec5c160dc93e6e"
 
 SRCNAME = "Config-General"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TL/TLINDEN/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "e3ea2a6dc76931cf638b5227aceabf60"
-SRC_URI[sha256sum] = "0a9bf977b8aabe76343e88095d2296c8a422410fd2a05a1901f2b20e2e1f6fad"
+SRC_URI[sha256sum] = "4d6d5754be3a9f30906836f0cc10e554c8832e14e7a1341efb15b05d706fc58f"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.25.1


