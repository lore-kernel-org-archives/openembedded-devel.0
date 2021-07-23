Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.84])
 by mx.groups.io with SMTP id smtpd.web12.3195.1627007090916633104
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jul 2021 19:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=S+mTGqnq;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.84, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627007089; i=@fujitsu.com;
	bh=nCo2enGOrpsCalzOjJwQdMazZFDmCGRo98Y9Xew1fPk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=S+mTGqnq74Cw0nyJE6q9Z8GxoYIYCSgCcwhmVc7xZhQI7k9woDQk5pKp8FmPORBT9
	 ZIyDaTYqhvZMTN67EgAvjKywrynTXvIkhmdjxT86Z7ChozwaJAbFlFN7yDZ+Fbm4tY
	 kz+0DWISbNDadYKUcmqyktGuV+l8gv8vOWn34Z2WXiAWOymfEj31Sgc78vOxkZ8CQO
	 gSQXOr3N9fwdFUTZZRyiN4SouZ341IfoGcohaa+miK9vCfwKqHTEhAjBh36QkFCWiL
	 v3XK77MLaPbTWsyMqcvBJTC1IBX7/zyItbCJFrjuKukqAmTJSN4ko/anDCXkjKyoCU
	 mXe1vDi4c2lEg==
Received: from [100.112.199.200] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id CD/EC-07373-0782AF06; Fri, 23 Jul 2021 02:24:48 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI1S3Q+JV
  g8PqZrMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjH/sF9BE1fF9aM9TA2MnZxdjFwcQgKzmSSu
  T9zHCuGcYJSYNfs8WxcjJwebgI5Ex4tuFhBbREBfYunsPcwgtrCAm8Shw58Yuxg5OFgEVCV+H
  q8GCfMChV9PbmYFsSUEFCSmPHzPDBEXlDg58wnYGGYBCYmDL14wQ9QoSmzfeYYFwq6QmDFjG9
  sERp5ZSFpmIWlZwMi0itEiqSgzPaMkNzEzR9fQwEDX0NBI19DSXNfQ2FwvsUo3SS+1VLc8tbh
  E11AvsbxYr7gyNzknRS8vtWQTIzCIUgqOdu5g/PXqg94hRkkOJiVRXqnDPxOE+JLyUyozEosz
  4otKc1KLDzHKcHAoSfCukPmVICRYlJqeWpGWmQMMaJi0BAePkghvqQRQmre4IDG3ODMdInWKU
  VFKnPeoGlBCACSRUZoH1waLokuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHkrVICm8GTmlc
  BNfwW0mAlo8amunyCLSxIRUlINTHvL7K5mza1MLTyhvIN1RmiCYwpbnbeoBjOTr+t93v2yr99
  q9nx6Pf1NhIiTS9y9ZZw2dVPXbjpx9bLmtjN/8k+5HF7xMrhj0rl/PZofIl7XNUZ4LHTrTPh8
  cQrvqV/bvObxHXBOF4ucuv1/P3vIg8YH3yRPS04JXxyxqk3mi+mdxduCvhmdl50jecvszt2fI
  seZdeoYz6k/OzrtsteZ9wt/utzcWOee9XYep32yo8RT8z2mh6K//+fRqjeTXRrbwLaIawHr0j
  PvymaoXF8q3C25z37r1amJNQzTF9oK1LZ/kuK9nHm8yFrl0PPswHwnD/VTnHpnMpfqCZfrv3N
  k8u2bFpWg80frJ7u6ss/lq0osxRmJhlrMRcWJAKtvFpsdAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-285.messagelabs.com!1627007088!96643!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22180 invoked from network); 23 Jul 2021 02:24:48 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-3.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Jul 2021 02:24:48 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16N2Om0q028909
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jul 2021 03:24:48 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 23 Jul 2021 03:24:46 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-qrcode: upgrade 7.1 -> 7.2
Date: Fri, 23 Jul 2021 22:24:39 +0800
Message-ID: <1627050279-7254-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

7.2 (19 July 2021)
==================

- Add Styled PIL image factory, allowing different color masks and shapes in QR codes

- Small performance inprovement

- Add check for border size parameter

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-qrcode_7.1.bb => python3-qrcode_7.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-qrcode_7.1.bb => python3-qrcode_7.2.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-qrcode_7.1.bb b/meta-python/recipes-devtools/python/python3-qrcode_7.2.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-qrcode_7.1.bb
rename to meta-python/recipes-devtools/python/python3-qrcode_7.2.bb
index 329bf3e4fa..d5f54e60a0 100644
--- a/meta-python/recipes-devtools/python/python3-qrcode_7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-qrcode_7.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4b802d2a65df4626623c79757f486af9"
 
 PYPI_PACKAGE = "qrcode"
-SRC_URI[sha256sum] = "59ba630fa2adb637b06571e6ceec1bb0ecf372c458c4447ceba763061bd3af72"
+SRC_URI[sha256sum] = "153ad96f5892e6fe2f3699296240976ac3a6d068e2eb48bbfc64b4c4c4d675ea"
 
 inherit pypi setuptools3
 
-- 
2.25.1

