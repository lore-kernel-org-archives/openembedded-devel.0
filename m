Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85655C53210
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 03:30:38 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.56108.1672716631272229943
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jan 2023 19:30:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ubfpz29B;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672716629; i=@fujitsu.com;
	bh=k06idP5VvyDO3IkerVgkaQmMPycwxEjpGEOXhnuMA9s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ubfpz29BNn93zK/XEO0aOUoz7m0gE5xtYubc+6usBOdn3GwuAOSzxhrDVTGP2+lqX
	 7ubIeXLkTz5jhsjVsjJLPv5HSGJo2g+YkNVbMKyigIkzajOkWoV84Nt5ZMAZRnBq7u
	 n4HVfeX8baBeJIp+44c4lP8cWXJv+5vIe7geIGx0g4t+tW/wc+IlX1qkk/QXJ0Uqp6
	 vp5dcCPtMZXoj/wLMtO5ku/uAMSPk75oAnR6etKfozzerOKKZT7ZHmq1SfCCvYPcq2
	 hUv2LG6kOx3RGrLCgAQhpxk1kxfY2yw+oiDAwYqk8qOBccDkECLQUIcA8SO8VMmhAC
	 CNsDn+QwpOc9Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8MxSTd04eZ
  kg2/7uS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owFu4+xFRznqrjTNou9gfEiZxcjF4eQwBNG
  iRf/l7NCONeZJNb/OAbl7GaUOLf2JHMXIycHm4CUxI37/9lAbBEBfYmls/eAxZkFVCRe/O5h7
  2Lk4BAWcJe4sc0LJMwioCrxc/N8RhCbV8BJ4sjUt+wgtoSAgsSUh+/BWjkFnCWmvl4BViMEVP
  Nh4iaoekGJkzOfsECMl5A4+OIFM0SvosTsy80sEHaFxKxZbUwQtprE1XObmCcwCs5C0j4LSfs
  CRqZVjGbFqUVlqUW6hiZ6SUWZ6RkluYmZOXqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIHBm1Ks0r6D8dOyP3qHGCU5mJREecv3bkoW4kvKT6nMSCzOiC8qzUktPsQow8GhJ
  MHLM39zspBgUWp6akVaZg4wkmDSEhw8SiK8h+YBpXmLCxJzizPTIVKnGHU57i7cu5dZiCUvPy
  9VSpxXZC5QkQBIUUZpHtwIWFRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMOx/kEp7MvBK
  4Ta+AjmACOiJpzUaQI0oSEVJSDUydcVycEyOyBGOyKz6y6/48bhYmdcPS63uCwOnFAbOPWG1c
  5vqW/4N1iYrWkZMTlmyz+rn9/JuHVWv3Tflj2bcolvvU5MosV8uvD1Ws1h9WZA6L1Fu5peN2J
  O/hrtxjiyQuxCXe3n0txlgi5IGs+c9JPTYll3cZPc7/9M7lcfCJPW11+YmZDO4iuhqy3DrMPJ
  eY0/bLcx58FqRZfKxt2mvtnNQt4R7px9qs2Rh370iW38v2/t2V/cU1Plkh39ZHXVcz26zIx7w
  nu7ZQ58MeuS/Gfa7HwxR/XvKr3RiV+UIsN6/75qmSrUtZLASsVnLM0eK8VDMno0SeyS9cuPkl
  k5phLiPD19y1F1oZ5XZqKLEUZyQaajEXFScCAOZahCJlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-565.messagelabs.com!1672716629!294439!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 779 invoked from network); 3 Jan 2023 03:30:29 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jan 2023 03:30:29 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E08EA1000DB
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Jan 2023 03:30:28 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D41261000D5
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Jan 2023 03:30:28 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 3 Jan 2023 03:30:27 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libnet-dns-perl: upgrade 1.35 -> 1.36
Date: Thu, 29 Dec 2022 12:46:54 +0800
Message-ID: <1672289215-16118-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672289215-16118-1-git-send-email-wangmy@fujitsu.com>
References: <1672289215-16118-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 03:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100352

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Adopt JSON as presentation notation for EDNS options.
 Zero packet->id not allowed in outbound packet.
 Remove deprecated 2-argument TSIG->create() method.
 Revise TSIG test scripts and documentation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnet/{libnet-dns-perl_1.35.bb => libnet-dns-perl_1.36.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.35.bb => libnet-dns-perl_1.36.bb} (95%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.35.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.36.bb
similarity index 95%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.35.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.36.bb
index 5df586da1..2c9b47a4c 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.35.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.36.bb
@@ -9,7 +9,7 @@ DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "f1a1478e4acbdb6b96de63070b35050dec9b9fce6c95bb2215bfc64a2d98e167"
+SRC_URI[sha256sum] = "143ba0e530f8b727be61ec052974cbf52df5b0afc0582d75b04809e0b2a95ebe"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.25.1


