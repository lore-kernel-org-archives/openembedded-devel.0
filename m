Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48584C433FE
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 09:18:52 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.2076.1652347123074495078
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 02:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=q2B3HKHp;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652347121; i=@fujitsu.com;
	bh=lv4a8U4AGEtMuxDiMAIZZOyO1DPETuh2cZhZzvk+xQo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=q2B3HKHpF+Jq0Bq0qnbgtSlKUAcApXVuw+1kWyJnpSf28fQh1S71zI1b8gp5z962A
	 p+OOfNisyxIud3CZM5m0/XC307qjTNVTDsiUEH4UDwmtWbqPlyxR+2UCgd/9K7IrOG
	 WtcHT02GrO1+t2Uo3YbLJgts0aJG4CeYgsN5Wzg6lXb+Qe0E8yxhmNP6IWxLzqfZIh
	 UhYUa871xucb/RLKhn0LOgzLtQ/6ClGFWiByHRVIXr/EwtE8bbqzYn4bKqyvu8R3cP
	 kSbxCpokotfTNEXvi8hmKYQTTm0NO7QUQeDnGFRw3RbRtAmS2dRbLoyT6YvlFz95VI
	 +rgNefz1i40+A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8ORqPvhQk2
  SwfTDKhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bDDbfZCiZyVTTtW8fUwLias4uRi0NI4Amj
  xPxpaxghnAtMErf2/GWCcA4wSpxY2QLkcHKwCehKvPixmAXEFhHQl1g6ew8ziC0s4CFx8tFid
  hCbRUBVomPhe0YQmxco/urTEjYQW0JAQWLKw/fMEHFBiZMzn4DNYRbQlGjd/psdwpaXaN46G6
  iGA6heUWL2dHmI1gqJ14cvMUPYahJXz21insDIPwvJpFlIJs1CMmkBI/MqRoukosz0jJLcxMw
  cXUMDA11DQ1NdQ10jvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwUvbzUkk2MwEBNKWZk
  2sG4rO+n3iFGSQ4mJVHec+drkoT4kvJTKjMSizPii0pzUosPMcpwcChJ8O48B5QTLEpNT61Iy
  8wBRg1MWoKDR0mEtxgkzVtckJhbnJkOkTrFqCglzvthH1BCACSRUZoH1waL1EuMslLCvIwMDA
  xCPAWpRbmZJajyrxjFORiVhHlPg1zGk5lXAjf9FdBiJqDF+10rQRaXJCKkpBqYphwLuiOy89D
  /au+dx02O7c8JjFmzIONvdI6y9cTZXUZTJQ9PPLM+eonX8uSP1sX9193mt99V3uWXy3P+RViG
  SLXw3a8KD6S21kru/2NYOtV+nvOmN88OT7G7WysZ1XdA4H2IydO8jhtGl6t835cn2W1pj5XOs
  Fj5/uLhuVU9IivfbONoKdhhbelb/WWBivgup7O1cUnxsanbL+z2nnqk3tH0R8eUx0L8R9fMC6
  j8NP37222nzm6W2sMx37m7V+FEu8Ssis4dlfuPPrq5fZuevEBB5IsPS+MCZT1C7EuXTXJeUfH
  3fchHHyM/8QnrPvydk6Ev+Sd6yrw7QfxVIoqfp2+4cl9EZVPHxMlGj+9s7FZiKc5INNRiLipO
  BACGAYEnTwMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-21.tower-591.messagelabs.com!1652347120!248886!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17299 invoked from network); 12 May 2022 09:18:40 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-21.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 May 2022 09:18:40 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 06B571001A8
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 10:18:40 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id CAD9A1001A1
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 10:18:39 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 12 May 2022 10:18:29 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pika: upgrade 1.2.0 -> 1.2.1
Date: Thu, 12 May 2022 17:18:17 +0800
Message-ID: <1652347097-16622-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 09:18:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97068

License-Update: Copyright year updated to 2021

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-pika_1.2.0.bb =3D> python3-pika_1.2.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pika_1.2.0.bb =3D> python3-pika_1.2.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-pika_1.2.0.bb b/meta-python/recipes-devtools/python/python3-pika_1.2.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-pika_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pika_1.2.1.bb
index aa3179f2a..38f84cf1b 100644
--- a/meta-python/recipes-devtools/python/python3-pika_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pika_1.2.1.bb
@@ -6,9 +6,9 @@ including RabbitMQ=E2=80=99s extensions. \
 SECTION =3D "devel/python"
 HOMEPAGE =3D "https://pika.readthedocs.io"
 LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D278bdfee5b51616941c1f6b2f1cfcb99"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D678ec81495ba50edf81e84e4f1aa69f3"
 
-SRC_URI[sha256sum] =3D "f023d6ac581086b124190cb3dc81dd581a149d216fa4540ac34f9be1e3970b89"
+SRC_URI[sha256sum] =3D "e5fbf3a0a3599f4e114f6e4a7af096f9413a8f24f975c2657ba2fac3c931434f"
 
 inherit pypi setuptools3
 
-- 
2.25.1


