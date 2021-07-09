Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web12.5326.1625794683052680215
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jul 2021 18:38:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XAKUikce;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625794681; i=@fujitsu.com;
	bh=hBXU2QFidu4xaR0dkbnoFYrvSIgt5g1Al4bjdK3Z/6c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=XAKUikceI6S388ebGHrrgQ943jstgKBO0XMEJgj7uiLxAklkUGNyU1ciwt9XVqrGb
	 tcywEREqjrba1koXmogKcbwtJUpS912cjbFcmBW5BPQjHpNKIzqvMsZOftdxljxOYF
	 I9cb2vKGV3Xz33st0D/0nf/PfcY4QLn6jmTJDNAC7IprsLptg0vdUXwdI/mrjWG+Wg
	 IlOPcegP5qeHBRkLmSoyd0eZ0LbV/KlvVwbKyICxVlEYChs+ZX20c9em8Bp8Smdewz
	 LVJZIDBMUKvkh4okx7zHtR9T2wvw3z/hyYuosQmtiVK3r705hJ/WiIMHnfvLoCiAhB
	 l/RhVEj+JHFnA==
Received: from [100.113.1.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id DC/F2-07211-878A7E06; Fri, 09 Jul 2021 01:38:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+EI1a1Y8Tz
  BYNIVDouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP1m42MBevYKv7ebmVsYHzG2sXIxSEkMItJ
  ou34QijnOKPE0eOr2bsYOTnYBHQkOl50s4DYIgL6Ektn72EGsYUF3CRerjrNBGKzCKhInD19n
  BHE5hVwlzje+Q6sXkJAQWLKw/fMEHFBiZMzn4DFmQUkJA6+eMEMUaMosX3nGaj6CokZM7axTW
  DkmYWkZRaSlgWMTKsYLZOKMtMzSnITM3N0DQ0MdA0NjXWNdQ3NDPUSq3QT9VJLdZNT80qKEoG
  yeonlxXrFlbnJOSl6eaklmxiBoZRSyLxwB+OP1x/0DjFKcjApifJqzXieIMSXlJ9SmZFYnBFf
  VJqTWnyIUYaDQ0mC98gSoJxgUWp6akVaZg4wrGHSEhw8SiK8nIuA0rzFBYm5xZnpEKlTjIpS4
  rzBy4ASAiCJjNI8uDZYLF1ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMyrsxxoCk9mXgnc9F
  dAi5mAFjMcfgqyuCQRISXVwBRk9ZFH4UFju7Oftemh886mF4LXftiTulbN66zCRatFu+6vmzZ
  xZ3rL5dA5gb6Zxox3Lmy7FNHJN6kmOHDNxjTdm1/5yjjTdr2S6Wi4tv49h6Ld/s1vWznsHLjj
  uxaw3+pvNm0OuG4iUdE3ddvJuV7x0rsaGlfzPMoJUxSd9bFU716iwKacGVyCB2T4dsycYLn+s
  1zj5R8yZVvteUwv608S73vp+zZ/SVZh4GPmL4LbAnXlvI+aRphefbCx3oGzJi3Mk12kcILkNv
  Z3odPPFE98wet+bF/FKa6Z76WC7GqD3Cbr7ZivqW5qFPvOlnnSQx6O51ekZ3CenOuX8MRnz7q
  LP0q0M17mmknxhTYuVGIpzkg01GIuKk4EABstMJUgAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-226.messagelabs.com!1625794679!45945!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21947 invoked from network); 9 Jul 2021 01:38:00 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-16.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Jul 2021 01:38:00 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1691bx9F007042
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 9 Jul 2021 02:37:59 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 9 Jul 2021 02:37:57 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] opencl-clhpp: upgrade 2.0.14 -> 2.0.15
Date: Fri, 9 Jul 2021 09:37:51 +0800
Message-ID: <1625794671-29640-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 meta-oe/recipes-core/opencl/opencl-clhpp_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb b/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
index 5f2618dcb2..4ecfb3d44e 100644
--- a/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
+++ b/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
@@ -6,8 +6,8 @@ SRC_URI = "git://github.com/KhronosGroup/OpenCL-CLHPP.git;protocol=https"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-PV = "2.0.14+git${SRCPV}"
-SRCREV = "89d843beba559f65e4a77833fcf8604e874a3371"
+PV = "2.0.15+git${SRCPV}"
+SRCREV = "f7237f3799009d856935e1eecfd7c9301fe522b4"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

