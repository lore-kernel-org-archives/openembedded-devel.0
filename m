Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB69C46467
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:44:55 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.152439.1672123493670259870
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:44:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=q96OPlj6;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672123491; i=@fujitsu.com;
	bh=bTClOUS2mWJyuYXxRXjOyYI7YMIhRhRAz6iEsDttCVs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=q96OPlj6/HS6V32ubpzLVsu/jit9uPaiCPv+y32CN96vrKdPCZ13xonHGdqYeM1kH
	 CQ1c3Hyh76BCouE1ByZprGC/CP9av86erjjsbZKubuUbbpH0NIrWITr6z40hkZw49W
	 JH05c1MRdY8nJHhLVbcA5wuvOpyDkLaz2UmGcPnPcYXVPjPd0PGC2nPfqxbMeZeatt
	 C9ljc9C5nUrXoXoyxDvAhuIQAFwazP+azeDSw5IWjj/g+QuFO/iq6lK6O3vpwdN18Y
	 R0B1iRA5G2QW2BbCN4luSVOEsxelbOZaQ+mYFJ/a+3IY3fkNHpV4gKI1syVYNKrvte
	 8QsD2dGlzNS4A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8OxWTdpyqp
  kg60XNS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozdHz6xFpzmqliydRJ7A+NNzi5GLg4hgQeM
  El1LD7BDOJeZJDo/PGSGcPYwSmw+MYm1i5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBH4kphx8wgtgsAqoSZ3oug9m8Ak4STStXMoHYEgIKElMevgfr5RRwlji+5T5YrxBQza
  mmNiaIekGJkzOfsEDMl5A4+OIFM0SvosTsy80sEHaFxKxZbVAz1SSuntvEPIFRcBaS9llI2hc
  wMq1iNC9OLSpLLdI1NNBLKspMzyjJTczM0Uus0k3USy3VzcsvKsnQNdRLLC/WSy0u1iuuzE3O
  SdHLSy3ZxAgM4JTilIs7GJ8s+6N3iFGSg0lJlFeqe1WyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJ
  Qne0klAOcGi1PTUirTMHGA0waQlOHiURCBaeYsLEnOLM9MhUqcYFaXEeb+C9AmAJDJK8+DaYB
  F8iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwrzrIeJ7MvBK46a+AFjMBLf5waCXI4pJEhJR
  UA1OUXExvj6KoWtIm7kuujxyXMqkpJz7+PvdbksSceWyurz28VOfXv0tJOu+zasPJvQ/dVsbO
  22B1ZOGO5vruZtW6R6IBOqvCFvx/L31Pjf3NnntqZ8LFP69qd1/bZZp4VKH1appTcPDLxeHxf
  13uaklJZR3jyFypqL5vVtsM9m8SVfLPP8Wf2vro0OXD6Y87Bf53is4Ist/75YpCv5q0h63chN
  V7vv7j5f6bx7VvWzpjq8WpFU/drA7n+zTIvKrtsHo4kdO3WWZTbWzr7ctezVO2nDmbobT928/
  TFg9vudU/LDlb+e2k7GZFpplrPS5o6plnFFROSLtvtL7vD0v7kovzReSn2es9fml6P/y8hLoS
  S3FGoqEWc1FxIgBmqRpfWwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-732.messagelabs.com!1672123490!457365!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28269 invoked from network); 27 Dec 2022 06:44:50 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-12.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:44:50 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 236B77B
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:44:50 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 1711573
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:44:50 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:44:48 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-bitarray: upgrade 2.6.0 -> 2.6.1
Date: Tue, 27 Dec 2022 14:44:10 +0800
Message-ID: <1672123453-31906-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672123453-31906-1-git-send-email-wangmy@fujitsu.com>
References: <1672123453-31906-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100266

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 * add documentation on shift operators, #181
 * fix typo in iterable initializer description, #179
 * optimize 'richcompare()'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_2.6.0.bb => python3-bitarray_2.6.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.6.0.bb => python3-bitarray_2.6.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.6.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.6.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.6.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.6.1.bb
index 507c0bc51..1138ef44f 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.6.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "56d3f16dd807b1c56732a244ce071c135ee973d3edc9929418c1b24c5439a0fd"
+SRC_URI[sha256sum] = "8440a5493221f6ed6c4e0d9cb2ba6e4e600a5fb639f66003eaf15b7150a49230"
 
 inherit setuptools3 pypi
 
-- 
2.25.1


