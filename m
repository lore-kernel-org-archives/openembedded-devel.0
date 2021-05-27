Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web10.3555.1622098142350739210
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 23:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vgtBBvIG;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622098140; i=@fujitsu.com;
	bh=iRlbxs0muhfWfQWwo1YcMUgxCRu0IgyiOErbdDA4YWQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vgtBBvIGDqE81JN0s85/EqM0fnVIRvQr0zZaiMmwdn1Kzzv41dusx1WepWi1X8cLr
	 w1HmKg2LRN4mn68S8+IGFT24kiQo2SfYsx+xl+5oXqtVT6cTe07ZqaKP4X2qrHOsdm
	 9I9LldcKziC9q5SZVbUVknrK8Z+0FlvrsW5BcHAy56nYByyiRTXzWtqqNx8uoZEo6K
	 ajf487Vnc5I5HB8Nr5uALnabC5IqnR4JxsIjNgdHOn8gybt/6gVf2ul3yCTERKvgGr
	 uOtLsdMN2Rb1s8BpFTfOKw2KBZk5n1LhOo7h/51kkn28NNTVx5L1GsXnoIfVVfeqyk
	 adbS29XGRgqEA==
Received: from [100.113.5.216] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id AC/8F-38619-BD04FA06; Thu, 27 May 2021 06:48:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+GYqnvbYX2
  CwZutUhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a39m3sBce5K3Zvms3WwLidq4uRi0NIYDaT
  xJHTK5ghnBOMEts+zGHvYuTkYBPQkeh40c0CYosI6Essnb2HGcQWFnCXmLHrECOIzSKgKvHp8
  VpWEJsXKL7gTisTiC0hoCAx5eF7Zoi4oMTJmU/A5jALSEgcfPGCGaJGUWL7zjMsEHaFxIwZ29
  gmMPLMQtIyC0nLAkamVYyWSUWZ6RkluYmZObqGBga6hobGuua6RsaGeolVukl6qaW6yal5JUW
  JQFm9xPJiveLK3OScFL281JJNjMBQSilkf76DcdWbD3qHGCU5mJREeSforE8Q4kvKT6nMSCzO
  iC8qzUktPsQow8GhJMHLAwxOIcGi1PTUirTMHGBYw6QlOHiURHiz7IHSvMUFibnFmekQqVOMi
  lLivAYgCQGQREZpHlwbLJYuMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLm3QoyhSczrwRu+i
  ugxUxAi4US14EsLklESEk1MJlWzcpIKuqr27Wsaerpl9rixuU17b0vnvw9tFaynDm3/bKi2Z+
  aS/pGdhOD68rss79n3otu2v/HpWVBudkFeQ07ocLO33FCfXqueV2aj4LPXFth4pGyzf668hFX
  3918AYW3vlrqzlr9wvmUnRu/d7fN5I1pGbvqnI7I3twpO2+OnwT/xmjTZV1nhJpYzk7ap53iz
  131mF/YP3WeGkdHtWLIud/edkylYUYJi+9/23Ld19t0TVIPr3jk9Efd2pwVBTGuh/6dTud/cn
  W7u+3vKSpS0a+7RBffm3bg73odvzDtNQLbpq9elVh5YFG26YKizQtt36n/ZJnpqpvqsfPBPIs
  pa+tvPJymVDq9aONCJZbijERDLeai4kQAMjwr6CADAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-238.messagelabs.com!1622098138!75684!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5698 invoked from network); 27 May 2021 06:48:59 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-16.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 May 2021 06:48:59 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14R6mwCU001560
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 May 2021 07:48:58 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 27 May 2021 07:48:57 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-can: upgrade 3.3.3 -> 3.3.4
Date: Thu, 27 May 2021 14:48:50 +0800
Message-ID: <1622098130-10738-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Add runtime dependency to resolve errors that occurred when import can.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-can_3.3.3.bb => python3-can_3.3.4.bb}    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-can_3.3.3.bb => python3-can_3.3.4.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-can_3.3.3.bb b/meta-python/recipes-devtools/python/python3-can_3.3.4.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-can_3.3.3.bb
rename to meta-python/recipes-devtools/python/python3-can_3.3.4.bb
index 4da2339598..3ca303c72c 100644
--- a/meta-python/recipes-devtools/python/python3-can_3.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-can_3.3.4.bb
@@ -3,8 +3,8 @@ SECTION = "devel/python"
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[md5sum] = "1310da316799e4b12944a6c1dcb017a9"
-SRC_URI[sha256sum] = "ecd69cf6b2f0235345ebe607a15325cf1384c85b24ffbe1d68c3754357f87488"
+SRC_URI[md5sum] = "305075968c56bd85130b19d86e9e505d"
+SRC_URI[sha256sum] = "2d3c223b7adc4dd46ce258d4a33b7e0dbb6c339e002faa40ee4a69d5fdce9449"
 
 PYPI_PACKAGE="python-can"
 
@@ -21,6 +21,7 @@ RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-netserver \
     ${PYTHON_PN}-sqlite3 \
     ${PYTHON_PN}-wrapt \
+    ${PYTHON_PN}-pkg-resources \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

