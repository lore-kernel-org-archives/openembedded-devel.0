Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.68])
 by mx.groups.io with SMTP id smtpd.web10.3420.1618537528629237655
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Apr 2021 18:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aTjtnwE6;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.68, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618537526; i=@fujitsu.com;
	bh=HgE/2goWKjyM1Syjk9L+28dM1ydtFf1Z5UWJ6HYzt18=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=aTjtnwE6xytHdCjTG/tbM0pNnKpGvqoYeI/2LSplRUUXHWU3tlzYJHjpAwGA5Pgqn
	 BW6NMJOOE1mxmKbDg3HN0mw4y59fgnYUMvmH9Q7c8UbmRNFWVvg8aVcdpRSOpz2oTA
	 hbFJtlP02RqLnjYNRVoGB/jCui5ewTCd+7d16aatlDeUMu95qyCo5J18+yAaq9iby0
	 n81bGh7P9EITABL1Bs+BkaoJu6Lo/z8m4GdzZOF9WD20y6pCmGoeNVjySza0L8M9MJ
	 mN0Bh77mcbw7x3qK7SineeSJEhzGYuBJT9unVDFDRMBFqHpF5AvLIozqq67ZB2tNQd
	 gUq20irkWA3CA==
Received: from [100.112.198.228] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id DB/38-64503-63CE8706; Fri, 16 Apr 2021 01:45:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYqmv6piL
  BYMYxc4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePw4/nsBa0cFe+3rWNtYFzG3sXIxSEkMJtJ
  om/PSTYI5zijxIv1U1m6GDk52AR0JDpedIPZIgL6Ektn72EGsYUF3CXeNB1lArFZBFQlbt08x
  A5i8wq4SXx58QWsRkJAQWLKw/fMEHFBiZMzn4DNYRaQkDj44gVUjaLE9p1nWCDsSont084yTm
  DkmYWkZRaSlgWMTKsYLZKKMtMzSnITM3N0DQ0MdA0NjXQNLS10DY0N9BKrdJP0Ukt1y1OLS3Q
  N9RLLi/WKK3OTc1L08lJLNjECAyml4FjTDsaTrz/oHWKU5GBSEuU9tKIsQYgvKT+lMiOxOCO+
  qDQntfgQowwHh5IE74VXFQlCgkWp6akVaZk5wKCGSUtw8CiJ8H54CZTmLS5IzC3OTIdInWJUl
  BLnfQnSJwCSyCjNg2uDRdIlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8x0Cm8GTmlcBNfw
  W0mAloccWqUpDFJYkIKakGJr24vihzyxuG19JVcxvM/4SG3pva8tC1tNv1ebuW1sRzNQEekcu
  eP1PWzD8v+mHlNS5+1z0bD7T++331VqPplk3VajFKUUHCPMLZMf5HD/b0Xd9Z85DNLqjgSe7a
  nU8f/hQ/fUorwsU/cdLtn7PEvq2+//66/Itp+w/eT3lrwJPpJDzL2n9/o5u2ucT6Nzm8ewyya
  s2ye+tn/2i9fGFn5OZr5/iNNxXxl9nmv96oW+V+M3D3caXE/7nBL65PvhockPHoI8+VXebWt7
  l31FV/+FH1Ouilf6JJtpex+bzfXa2n3nM6Ws3cLez76N6ViQ+mWS4MF3hUbvl1Ta/Y/92Hcvl
  YElnzftUt9ykSKF8XpcRSnJFoqMVcVJwIAJ9SI2IfAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-287.messagelabs.com!1618537525!1185526!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14828 invoked from network); 16 Apr 2021 01:45:25 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-6.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Apr 2021 01:45:25 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13G1jPh8014681
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Apr 2021 02:45:25 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 16 Apr 2021 02:45:23 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] wolfssl: upgrade 4.7.0 -> 4.7.1
Date: Fri, 16 Apr 2021 09:45:17 +0800
Message-ID: <1618537517-7572-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../wolfssl/{wolfssl_4.7.0.bb => wolfssl_4.7.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_4.7.0.bb => wolfssl_4.7.1.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.7.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.7.1.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_4.7.0.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_4.7.1.bb
index 83406f507..76a5fd75c 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.7.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.7.1.bb
@@ -14,7 +14,7 @@ RPROVIDES_${PN} = "cyassl"
 
 SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https \
 "
-SRCREV = "830de9a9fb99e30f9ac9caa0a7f7bba29c3b4863"
+SRCREV = "95b91d89133a712a3d0f389442924612c103da24"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.25.1

