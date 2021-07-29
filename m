Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.6617.1627545243086956786
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 00:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uleyjjTA;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627545240; i=@fujitsu.com;
	bh=yo8+TI8fur4WoGLNMvPYyuLwqpQRtQ2SllQ5LEG1IMg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=uleyjjTAZfAX1w/16kHJoNlSeg0JDwIlJVVkipylybR8Sa4UjeA2j9OwcctKwlj4l
	 Bx1PxhedhdP26lYyLw6dwtu0u4WvZVbx1N9KBh1sUFzyRj4YgLuPRK1HrgyRxEKacm
	 snXaklTU8HtNx3gOgrYMEAZedzu6OgwYFsji/usJXKYzIs7npvnRyk2Jkw6iFtPcVa
	 xumZJjnFLUViEtsYo7JBgFxz2xZw2vpAsqs4b8F5/O3iIpsLvMmMYDmrn1O5jAqU0n
	 o5EVaxyuuE7cHXzreUJRE2uASaOfvcK4rrX4Cfi3qGaalrSzi6mSyOKZPE7LlHMjuV
	 v9RSGSz0vU1eQ==
Received: from [100.113.6.138] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 3E/12-25437-89E52016; Thu, 29 Jul 2021 07:54:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+EI0Z0Rx5R
  oMOuiiMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrF9/iqWgvecFe8+bWdqYJzA2cXIxSEkMJtJ
  onXHd5YuRk4gZw+jxN6dPiA2m4CuxLnHa9lBbBEBfYmls/cwg9jCAm4SHybeB7I5OFgEVCXWb
  9cHMXkFPCR2fUgDqZAQUJCY8vA9WDWvgKDEyZlPwKYzC0hIHHzxAqxTQkBRYvZ0eYjyConXhy
  8xT2DkmYWkYxaSjgWMTKsYLZOKMtMzSnITM3N0DQ0MdA0NjXXNdY1MjfQSq3ST9FJLdZNT80q
  KEoGyeonlxXrFlbnJOSl6eaklmxiBIZRSyP5nB+P11x/0DjFKcjApifL+smNKFOJLyk+pzEgs
  zogvKs1JLT7EKMPBoSTBGxgLlBMsSk1PrUjLzAGGM0xagoNHSYT3eTRQmre4IDG3ODMdInWKU
  VFKnPdhDFBCACSRUZoH1waLoUuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHm9QLbzZOaVwE
  1/BbSYCWhxbQkjyOKSRISUVAPTWj0Z35TDP+78CZn3Q9z0sdcLvskKMx5OvpN46EXFbNcVTHG
  +yTOvnou76zp1GsPGx0ZFPw4U6tXKc7VqPv9WunoWb9PFk7fnirjcU45trmmeov30jex627TX
  Oiv/5Am8/FO94NS9qsbCgi8rfx7R739lLh2Q2GIdoHbtzbIt62c13wkx/L0t8+X5kpzT9QXvv
  nwu1JP58nRW3SuLp0fi9z+a8vy+6g/f3vr3+44yfXm99vdhpo08E75cbru2UHNpTOXliRd892
  1+U8R9KC/HRi8p5OtCuSCOcy9t9zlV7H9+b3tBiGV79NOLx62upzQ5ZQv4rn99bZ+BRIG9pUH
  Krlfv2cvc8romhXQs+pdSVqzEUpyRaKjFXFScCACj4upUHAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-238.messagelabs.com!1627545239!148307!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24364 invoked from network); 29 Jul 2021 07:54:00 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-11.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Jul 2021 07:54:00 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16T7rxLA029378
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jul 2021 08:53:59 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 29 Jul 2021 08:53:58 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] libencode-perl: upgrade 3.10 -> 3.11
Date: Thu, 29 Jul 2021 15:53:49 +0800
Message-ID: <1627545229-24403-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{libencode-perl_3.10.bb => libencode-perl_3.11.bb}         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libencode/{libencode-perl_3.10.bb => libencode-perl_3.11.bb} (95%)

diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_3.10.bb b/meta-perl/recipes-perl/libencode/libencode-perl_3.11.bb
similarity index 95%
rename from meta-perl/recipes-perl/libencode/libencode-perl_3.10.bb
rename to meta-perl/recipes-perl/libencode/libencode-perl_3.11.bb
index 94f5a08259..7c213f6592 100644
--- a/meta-perl/recipes-perl/libencode/libencode-perl_3.10.bb
+++ b/meta-perl/recipes-perl/libencode/libencode-perl_3.11.bb
@@ -15,8 +15,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://META.json;beginline=8;endline=10;md5=b12e3be1e17a7e99ca4f429ff32c28b5"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DANKOGAI/Encode-${PV}.tar.gz"
-SRC_URI[md5sum] = "7377c8694a7afeeaa46ee035d0d7335c"
-SRC_URI[sha256sum] = "c2d7906af17664d6b6f16bf76572c95c16c30ad096b7dd980c08c3de33e319a9"
+SRC_URI[sha256sum] = "47e05cefb550ef039808564e6181a22dbf2e50d0475f8eb9de63f9d9f4912e7c"
 
 UPSTREAM_CHECK_REGEX = "Encode\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.25.1

