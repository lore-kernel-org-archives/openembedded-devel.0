Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881C3C433FE
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 09:47:16 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.47428.1653990435744017962
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 02:47:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CRKHwQhr;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653990434; i=@fujitsu.com;
	bh=Asv3hVFSads8i1LjxPL/9GW0TKWvBhZxu42LFxB0ZJI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CRKHwQhrOfIFCzDo9Gjn5N5Wkfr6R/jd6wbuEYiRjFpwrrx15QOuYBT4KmN/cHiQA
	 c3JrH/zj2yVkbo59P+oFseKTHSHMYr8WW1bq8z4iwPa75aVzrBMZcmsaOHnerhOQ+v
	 saMUVW9pXS2lCCfKx5VU2xRPPyxxsWoL+vbCGK4PG1exqredgvIRU7dRhq2GiJievD
	 dOMq7y++vE1M6uLTrOBIEzmgNk/W7cgLwPAWwaFNlrrHTad1e/m8NrEw8cY7i0Lezh
	 X0PBs6ZJbUwmQMnYeTr1P6jDybwvHmQ68cIrNsOKcdnz6EqlOs2qqjKgKw/Yp1L9O1
	 IibJCgL+pu5Qg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8ORqCv/ZGq
  SQetXRYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePqHOeC+5wVB47+YWxgPMDRxcjJISTwhFFi
  /mr5LkYuIPsCk8Tc/euYIJw9jBLb3jayglSxCahJTL91A8wWEdCXWDp7DzOIzSygIvHidw97F
  yMHh7CAvcTcTzwgYRYBVYntc3oYQWxeASeJlksP2UBsCQEFiSkP3zNDxAUlTs58wgIxRkLi4I
  sXzBA1ihKzLzezQNgVEjNmbIPqVZO4em4T8wRG/llI2mchaV/AyLSK0TqpKDM9oyQ3MTNH19D
  AQNfQ0FTX2FTX0MJEL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3OSdFLy+1ZBMjMCRTipV3
  7GBsW/VT7xCjJAeTkihv8OWpSUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeJc8BsoJFqWmp1akZ
  eYA4wMmLcHBoyTC6/4QKM1bXJCYW5yZDpE6xWjMcfXKlb3MHDdApBBLXn5eqpQ47+RrQKUCIK
  UZpXlwg2Bxe4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG8vyEKezLwSuH2vgE5hAjrl2rc
  pIKeUJCKkpBqYOBM3vsjwMnpWx3/jUt/m2bw7Gzb8u3B2lfvPPR//tii8nX0g5qexqEvJqYBC
  Az1JseQXnNdPe098F9zVHSocc//itFPPfp6pdfC0DzzHbGEeK7Tx0Koq2elzVmndFrWcPOFS7
  8J117h2Tj1g2nbCaJFgQuTSbvZZoRzW926z2/N2K+kr/Kj3u2mWwJZtv+iM+vJ7YmviFAuWvt
  f463KljaP23ptNYvrZ296a9fLJBW9QeVzCsMFQrTRh/uRjZ5dVVotY9XC8fDbb6hT/kqmnj7+
  uC1s6c37f1dl/lW/6LbarXab67V9TS/ksrQsPhXsz9I627J1kyuL+0eLa7l/vS964xHDwsi6c
  rXH8MlvzDyWW4oxEQy3mouJEAG7U5TdWAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-548.messagelabs.com!1653990431!3546!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3650 invoked from network); 31 May 2022 09:47:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 31 May 2022 09:47:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 13341100190
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 10:47:11 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DE5CC10004E
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 10:47:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 31 May 2022 10:46:49 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libxmlb: upgrade 0.3.8 -> 0.3.9
Date: Tue, 31 May 2022 17:46:38 +0800
Message-ID: <1653990400-31527-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 May 2022 09:47:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97349

Released: 2022-05-24

Bugfixes:
 - Fix the crash for when the root tree has no children
 - Fix the crash when getting the element for the [empty] root
 - Install xb-tool into bindir

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libxmlb/{libxmlb_0.3.8.bb => libxmlb_0.3.9.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libxmlb/{libxmlb_0.3.8.bb => libxmlb_0.3.9.bb} (91%)

diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.8.bb b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.9.bb
similarity index 91%
rename from meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.8.bb
rename to meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.9.bb
index 38704f8b9..4c5f0cfa3 100644
--- a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.8.bb
+++ b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.9.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
 SRC_URI = "git://github.com/hughsie/libxmlb.git;branch=main;protocol=https \
            file://run-ptest \
            "
-SRCREV = "4782df2cec808f71762aa9f69c11759b4e127b61"
+SRCREV = "c308e39ccad6673e216f92d08b3782a4ffcb23ad"
 S = "${WORKDIR}/git"
 
 inherit gobject-introspection gtk-doc meson ptest-gnome lib_package
-- 
2.25.1


