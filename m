Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web08.3033.1619678243980326302
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Apr 2021 23:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hbkUgmy4;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619678242; i=@fujitsu.com;
	bh=Hy2gXCaD0IF9WAG/mbDU4Gv1e8nxYEYrgtnfSi5vnd4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=hbkUgmy4adB9FkgRGXb6nDXWQfREFDmnC0Xg+R+zZ5AI4MD3RmVLHtkvuK7vPzJoO
	 z1EycU7qkqJOyui+sJIxGRmWXdfB2FjHJX2W6qm1rCuyZ7JgL4rpXD1RzXe8jHauIW
	 GrKnwStNSdXQBmyduzKF5mj8eN/WteIsYl34KziYxTEafcrPxCZUytlhl+rgb88h2p
	 sxRAQWXdgNjRz8AOkEWRNtgmlLSHklX0VR4HXniOQOmXy4w36xKNE2eXQRdX+ojniV
	 UHPLezMmkolZqoJqY0dkjOaNUAagfMlLMohmGed6nZWBS6a036/O/FAIskL2uf3yzI
	 QXKEpOFGqsUXA==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 47/4D-23163-2245A806; Thu, 29 Apr 2021 06:37:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYoqsY0pV
  g8H+/ucXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFrp0PBDI6K999fMDYwHmDvYuTiEBKYzSTR
  OrGdGcI5zijxZPZ2pi5GTg42AR2JjhfdLCC2iIC+xNLZe5hBbGEBT4klk0+ygtgsAqoSSw/cZ
  AOxeQXcJPa2/wWLSwgoSEx5+J4ZIi4ocXLmE7A5zAISEgdfvGCGqFGU2L7zDAuEXSmxfdpZxg
  mMPLOQtMxC0rKAkWkVo2VSUWZ6RkluYmaOrqGBga6hobGuua6hkaFeYpVukl5qqW5yal5JUSJ
  QVi+xvFivuDI3OSdFLy+1ZBMjMJBSCtkrdzCuffNB7xCjJAeTkijvls7OBCG+pPyUyozE4oz4
  otKc1OJDjDIcHEoSvKXBXQlCgkWp6akVaZk5wKCGSUtw8CiJ8MYGAKV5iwsSc4sz0yFSpxgVp
  cR5BUH6BEASGaV5cG2wSLrEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZg3AGQKT2ZeCdz0V0
  CLmYAWLzvfBrK4JBEhJdXAZMa3dJLwDc/gSpmOi7bpPW8/njLMvivcd1OLm3utyMallxftKwz
  YUnN1Y/7kerHZzlJa6e+bXtvW/met/LbhwaFPy/IsbXuUnDMMsxxbri0OKuqyPlcS2Gt5ULJW
  s6dLeP0twQqWbfLh8nade9u3uyw8/PbzH6ffZof/q67pr5VyK/Ha2FtotG6ClqhZD98PjdCmD
  0mrb2+5uDS/xaCYj/VwjdynnfGGU4xuBn8MbFwXtSsr+dLso5Xpe9b3fj9SXfwmp5N39+uqI+
  fb53dN6llz6pX/1vn/brZ5brB6/CL67Zzt+xQvypttYFgl+lQ6M2iypZr4wRShFO2MyVp9864
  wViXN6PVo/j71/SxLJZbijERDLeai4kQADzHQjh8DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-24.tower-238.messagelabs.com!1619678241!211505!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10251 invoked from network); 29 Apr 2021 06:37:21 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-24.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Apr 2021 06:37:21 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13T6bLCU015661
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Apr 2021 07:37:21 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 29 Apr 2021 07:37:19 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] wireshark: upgrade 3.4.4 -> 3.4.5
Date: Fri, 30 Apr 2021 02:37:14 +0800
Message-ID: <1619721434-4737-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../wireshark/{wireshark_3.4.4.bb => wireshark_3.4.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.4.bb => wireshark_3.4.5.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.4.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.5.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_3.4.4.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.4.5.bb
index b75f41835b..f440328027 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.4.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.5.bb
@@ -19,7 +19,7 @@ SRC_URI += " \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "729cd11e9715c600e5ad74ca472bacf8af32c20902192d5f2b271268511d4d29"
+SRC_URI[sha256sum] = "de1aafd100a1e1207c850d180e97dd91ab8da0f5eb6beec545f725cdb145d333"
 
 PE = "1"
 
-- 
2.25.1

