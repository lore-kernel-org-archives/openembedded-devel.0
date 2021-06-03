Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web09.5615.1622714303304735104
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jun 2021 02:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Y4bhHwpo;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622714301; i=@fujitsu.com;
	bh=K1lOEGbJnzCWbNfu59B5mZuRdNfGzH8FLeTq/dDaeUQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Y4bhHwpo8IvoNMaEENSzXvVpgYhbdeFFfLCqd4dkwEbuKgBgCCrdZAUY7YpHO0U/9
	 M74W1bgogoPf/OWcJ59IKUm5wPKiGzB3kACdTaM+iCzUlOPepiawQQ4JSz6xzmiXVc
	 oPuB4KFhym3AVU9fwlZW/abNX+sCmAgaxSn7NXxpDB7Kha55iVh4X6ov48QD+ei5JL
	 0K3S8Z/euyutXBRsAYzMQj/vR3+xCR+Q18BuFcO3wOJ2SfDAH8+rOAboimPczaTWLY
	 Xr59T3W6b/3foeJOlCjOTkNMmiVgiOFsGNRybngOY06eA30oiEDUvgJE7aYuAXyDLH
	 hvpjavofh1fYg==
Received: from [100.113.1.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id A2/66-16595-DB7A8B06; Thu, 03 Jun 2021 09:58:21 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYortn+Y4
  Eg0dXbSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxji06xFUxgr3j6fBFjA+Neti5GLg4hgVlM
  EnfvzmTvYuQEcnYzSjzcoQJiswnoSpx7vBYsLiKgL7F09h5mEFtYwFLixayzjCA2i4CKxKaVx
  8BqeAXcJaa0zGMFsSUEFCSmPHzPDBEXlDg58wkLiM0sICFx8MULoDgHUI2ixOzp8hDlFRIzZm
  xjm8DIMwtJxywkHQsYmVYxWiYVZaZnlOQmZuboGhoY6BoaGusa6hqaGOklVukm6qWW6ian5pU
  UJQJl9RLLi/WKK3OTc1L08lJLNjECwyilkLFvB+PENx/0DjFKcjApifLead+RIMSXlJ9SmZFY
  nBFfVJqTWnyIUYaDQ0mC13IZUE6wKDU9tSItMwcY0jBpCQ4eJRHeKYuB0rzFBYm5xZnpEKlTj
  IpS4rxVIH0CIImM0jy4NlgcXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzOsFMoUnM68Ebv
  oroMVMQIsFvLaBLC5JREhJNTAJ8BfFznaf2MU06fD7mbO/Hv6zjVHJgemIXm2J+8vJD87t++g
  RuXkKj1X8mQKdZimmpSIfI9etNnZft+Xu1Sd9J2wXyRo5BP7lYzPTvvuooti+7GMQy5fDdzT/
  FzKllh306d09s/qb+claIRm14yExvVMWJx99uL7QtHoR+8LrOme/5fcwXWNR27Zvz5dVfitjT
  e+U3pGNcGMSYA+a0epj961mXe+Zc5NYtrPfbvVjiG+I+Weyp/HK6U63txuS/fWc5/mv+HU9pM
  LruGj1hr83/x9ckBuxx3vxtpa4Da/mJPguOP1q3Yf1B6O2/HpwXNGW4aDiuzDNiZMuMmfMSzT
  Uu3ixSe524u+ngpz/tv/iUmIpzkg01GIuKk4EAK1eyNceAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-228.messagelabs.com!1622714300!133944!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5398 invoked from network); 3 Jun 2021 09:58:20 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-15.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jun 2021 09:58:20 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1539wK3x029591
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Jun 2021 10:58:20 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 3 Jun 2021 10:58:18 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] fio: upgrade 3.26 -> 3.27
Date: Fri, 4 Jun 2021 02:58:11 +0800
Message-ID: <1622746691-4367-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-benchmark/fio/{fio_3.26.bb => fio_3.27.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/fio/{fio_3.26.bb => fio_3.27.bb} (96%)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.26.bb b/meta-oe/recipes-benchmark/fio/fio_3.27.bb
similarity index 96%
rename from meta-oe/recipes-benchmark/fio/fio_3.26.bb
rename to meta-oe/recipes-benchmark/fio/fio_3.27.bb
index 6f2464e5ef..d18649db0d 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.26.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.27.bb
@@ -22,7 +22,7 @@ PACKAGECONFIG_NUMA_armeb = ""
 PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
 PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
-SRCREV = "267b164c372d57145880f365bab8d8a52bf8baa7"
+SRCREV = "0313e938c9c8bb37d71dade239f1f5326677b079"
 SRC_URI = "git://git.kernel.dk/fio.git \
 "
 
-- 
2.25.1

