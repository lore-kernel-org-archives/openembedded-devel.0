Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.6228.1619699995301558753
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Apr 2021 05:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=e/+e8TcT;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619699993; i=@fujitsu.com;
	bh=hSlFZ0VTEGP6lo6WMQFitRMfwb+yCaLAPdVmOE1dP30=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=e/+e8TcTjhK0iVHqKsOh4cwF/KZTl5nK9csAB+lSbdHeCXvkTvMjoFyociIRqj50o
	 BkAcETtrShv/7I8j4eXUqm8hb+cm8yJhbk2FVIvZy4LVZGweJT55e4VhC2cypPKStG
	 GscOONM2sy6V7OfMJCkVcu0Kc4+kl1DcgN+0niKmffdSETq28UZWeNmGCeq82I4hnA
	 oPWrE7YFRezlzVTIVACBRx5itHy1cQb0ngUl19V874HGlGXfPNE3DONmrkDZVEPgfl
	 k3YDXyUmLt6ozXNC6kf+OkrWxslNW1thf3ywPYAk7QAuTaF26smOOSWLBCUmYJOBNJ
	 JpQ8t5OKJoqUw==
Received: from [100.113.2.232] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id BE/43-55623-819AA806; Thu, 29 Apr 2021 12:39:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI1ZVY2ZV
  gMHeKtsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvH7TA9bwTWOihVvPzA2MP5j72Lk4hASmM0k
  cf/AXjYIZzejxK7j71i7GDk52AR0Jc49XssOYosI6Essnb2HGcQWFrCROPv2GyOIzSKgKvHv2
  wKwGl4Bd4mzz5+AxSUEFCSmPHzPDBEXlDg58wkLiM0sICFx8MULoDgHUI2ixOzp8hDllRLbp5
  1lnMDIMwtJxywkHQsYmVYxWiYVZaZnlOQmZuboGhoY6BoaGusaAklzvcQq3US91FLd5NS8kqJ
  EoKxeYnmxXnFlbnJOil5easkmRmAgpRQylu5gnPbmg94hRkkOJiVR3i2dnQlCfEn5KZUZicUZ
  8UWlOanFhxhlODiUJHj5lnclCAkWpaanVqRl5gCDGiYtwcGjJMKrMx8ozVtckJhbnJkOkTrFq
  CglzusG0icAksgozYNrg0XSJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvPYgU3gy80rgpr
  8CWswEtHjZ+TaQxSWJCCmpBqYyddteL62UY9NF0lOvv7yYqMA1k/9ubfnctaKv1fIzk5teVvA
  /7dIKfsu+c+4G6UNrLS/c5290MfBY+eah3dUfF11vbzm/mKWd/VCNzWS+zsL1irKl9/onLjp7
  pDPzW4fZ1YNPgvgXzs6O/Ol3av48j7WvdZ4FsCpNYBLIXu7EMdH1lfyyd26Ouhf5C/ftP5ngf
  N5G9/NTg8Ag76OH0lkjq1ffjGUIP62X5dz120Y+NjDzdbrwL+4n2+6waCyo/9k7Y+1fDo0zs2
  zsJVy+7fDiPvD33ZyaOes6PG7W3c/8pmhrPGd3tOP8mTeuL24oPsXcxn2XQ0WmLFC+fpX+JD2
  nY5+To9++nBR19Pmi/i4lluKMREMt5qLiRABQe1TAHwMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-232.messagelabs.com!1619699992!7618!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18015 invoked from network); 29 Apr 2021 12:39:52 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-5.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Apr 2021 12:39:52 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13TCdk8n023183
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Apr 2021 13:39:52 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 29 Apr 2021 13:39:45 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] sdparm: upgrade 1.11 -> 1.12
Date: Thu, 29 Apr 2021 20:39:37 +0800
Message-ID: <1619699977-5307-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../recipes-support/sdparm/{sdparm_1.11.bb => sdparm_1.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/sdparm/{sdparm_1.11.bb => sdparm_1.12.bb} (86%)

diff --git a/meta-oe/recipes-support/sdparm/sdparm_1.11.bb b/meta-oe/recipes-support/sdparm/sdparm_1.12.bb
similarity index 86%
rename from meta-oe/recipes-support/sdparm/sdparm_1.11.bb
rename to meta-oe/recipes-support/sdparm/sdparm_1.12.bb
index 7fc87db2b..d0a4a0467 100644
--- a/meta-oe/recipes-support/sdparm/sdparm_1.11.bb
+++ b/meta-oe/recipes-support/sdparm/sdparm_1.12.bb
@@ -17,8 +17,8 @@ UPSTREAM_CHECK_REGEX = "sdparm-(?P<pver>\d+(\.\d+)+)\.tgz"
 PACKAGES =+ "${PN}-scripts"
 RDEPENDS_${PN}-scripts += "bash ${PN}"
 
-SRC_URI[md5sum] = "cd998d1c12a4ec11652d0af580f06b4d"
-SRC_URI[sha256sum] = "432fdbfe90f0c51640291faf7602489b0ae56dfb96d0c02ed02308792adc7fb0"
+SRC_URI[md5sum] = "2902fd29e6834fd62c16bb5d1ac53c7e"
+SRC_URI[sha256sum] = "e7f84247069da9a0c293963948d8aba8e5897a13e35e5476c8258acb7ca3a124"
 
 inherit autotools
 
-- 
2.25.1

