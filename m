Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A5CC25B0E
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:29:29 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web12.13690.1660544959766748654
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ekhuMsMj;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660544957; i=@fujitsu.com;
	bh=yHfWIZfRjD2GtC2pqg5VTTa62IQ3YJt08/NEsNl+Y1c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ekhuMsMjXUIFhn9Ugb4GZ8Z3JncmOidzDVDLjXEuOCivmSXaABrNFS3c32o+6Xe37
	 i8p4WAbjfoaiAiDhNJz5m4FuCY5SNoRL5W/rxiR8+4Nm9ceCzGScSqRJxbjq3Ml/CZ
	 DKLi7q2NFfKRDpw24l7GVgS/6XLZobw0Uj7xxs/qb1Oz0nmqA3sI8Fd3/FR4k55Cty
	 2uGHCvCo7x7GFQnPARxrEY3Rw+PacpFK/erSD8SCJZrOV6ej/lNI51gcVQda5eKSVM
	 a7ZObVlE9wVojV4j71Ogt9apJ3MnUwaFx20UQpFLNrsybfIroxJt8Se21B6pA1VdtK
	 wtCEuZkfoJanQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRWlGSWpSXmKPExsViZ8OxWXfv859
  JBo03uCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owtDQsYC+7yVqx8G9XAOJmni5GLQ0jgAaPE
  rabDzBDOZSaJpYc6gBxOIGcPo8TrazwgNpuAmsT0WzdYQWwRAX2JpbP3gNUwC6hIvPjdww5iC
  wvYSDz7txrMZhFQlVhypZuti5GDg1fAUWLCdSuQsISAgsSUh+/BWjkFnCReP2hhASkRAiq52l
  AGEuYVEJQ4OfMJC8R0CYmDL14wQ7QqSsy+3MwCYVdIzJixjQ3CVpO4em4T8wRGwVlI2mchaV/
  AyLSK0SqpKDM9oyQ3MTNH19DAQNfQ0FTXTNfQzFIvsUo3US+1VLc8tbhE11AvsbxYL7W4WK+4
  Mjc5J0UvL7VkEyMwfFOK2VbuYFzZ91PvEKMkB5OSKO+1iz+ThPiS8lMqMxKLM+KLSnNSiw8xy
  nBwKEnwmj0GygkWpaanVqRl5gBjCSYtwcGjJMK74DZQmre4IDG3ODMdInWK0ZJj6ux/+5k5lo
  PJmV/bDjALseTl56VKifPWPQNqEABpyCjNgxsHi/dLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTk
  YlYR5eUGm8GTmlcBtfQV0EBPQQXp3v4McVJKIkJJqYPLjUjn/9vaXGzOLzkyuXGrvdOhKhtav
  RS+zStiOz7ax2HUjwmHZi0nRuTMUZjqIBKy7rnBV+NIlMbbEO8pXmg/OUMpaarTrncRD5v2SW
  r/lpvS8OBDx9dWOxdHs19JOnm7Ruf3BaonN18fHTQxjL8R5xU66eK9QcqrAn88uq+UWt7xfcM
  1DeOfh/3911cvmxTX5d620KPxU4K+z+Vv4B1+BXaskdFtU1pr0WWUVReR9qkrwCKm5bqj4cuK
  NQ7zhfZuLNu9+Y7t35rbdyzyWsMjZbjwmGK8bcN4gI6F3iaFE3dJKh+enG2cVn9prxWZXf3Lz
  pe1/PQROXdZOuPL3V/HqNBbrJV5ajeusHusk1AsosRRnJBpqMRcVJwIAwg/jynIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-585.messagelabs.com!1660544956!876734!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22478 invoked from network); 15 Aug 2022 06:29:17 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-10.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:29:17 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id C8BEE7C
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:29:16 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id BC2F873
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:29:16 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:29:15 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ldns: upgrade 1.8.1 -> 1.8.2
Date: Mon, 15 Aug 2022 14:28:55 +0800
Message-ID: <1660544937-1453-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660544937-1453-1-git-send-email-wangmy@fujitsu.com>
References: <1660544937-1453-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 06:29:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98241

Changelog:
===========
* bugfix #147: Allow for tabs in whitespace before quoted rdata fields.
* bugfix #149: Add some missing [out] annotations to doxygen parameters.
* Fix build error on Solaris 10 with inet_ntop redeclaration error.
* Fix -U flag with ldns-signzone.
* Enable compile of SVCB and HTTPS support by default.
* bugfix #179: Free line memory even if zone file parsing fails
* bugfix #166: Grow buffer when writing chars and fixed size
  strings when converting to presentation format, preventing
  potential assersion errors.
* bugfix #46: Print network errors when secure tracing.
* EDNS0 Option handling and conversion into presentation format.
* bugfix #145: ldns-verify-zone should not call occluded records
  glue.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/ldns/{ldns_1.8.1.bb => ldns_1.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ldns/{ldns_1.8.1.bb => ldns_1.8.2.bb} (88%)

diff --git a/meta-oe/recipes-devtools/ldns/ldns_1.8.1.bb b/meta-oe/recipes-devtools/ldns/ldns_1.8.2.bb
similarity index 88%
rename from meta-oe/recipes-devtools/ldns/ldns_1.8.1.bb
rename to meta-oe/recipes-devtools/ldns/ldns_1.8.2.bb
index 81e1c62a07..90c369e651 100644
--- a/meta-oe/recipes-devtools/ldns/ldns_1.8.1.bb
+++ b/meta-oe/recipes-devtools/ldns/ldns_1.8.2.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34330f15b2b4abbbaaa7623f79a6a019"
 
 SRC_URI = "https://www.nlnetlabs.nl/downloads/ldns/ldns-${PV}.tar.gz"
-SRC_URI[sha256sum] = "958229abce4d3aaa19a75c0d127666564b17216902186e952ca4aef47c6d7fa3"
+SRC_URI[sha256sum] = "b92b001cdd382de653620a05445e42e17a827eec93d64ee587ad291a533cc1e9"
 
 DEPENDS = "openssl"
 
-- 
2.25.1


