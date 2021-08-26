Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.83])
 by mx.groups.io with SMTP id smtpd.web10.4368.1630043269752436576
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Aug 2021 22:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NvuoR6kc;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.83, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630043267; i=@fujitsu.com;
	bh=V0i3YblqsJUZ+3x0q6IuttGhSO4A8lLE5mv4gDmuXsA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NvuoR6kcPYwr/j3FV2ff5GfY2fszPZ6kXphDW3Al9kH9P36hHM9TNw3b4AX+AkMKi
	 5LI7a2OfBsmTyXHawwYPtefC+PKc7x+QTJLq8PyzctqIszYGMGDHVr1H5uWwXV33Ws
	 6+3x/9BqvnKOSXJAyVWas/8F+dp6YH4CsuXgrt4LRV63RoorcyaNIXBRMuDWJzOL4z
	 nsPLrt2QOC3+UURp5sYC9IATEq6/D52BZBa2HvwmI0jgWQLb0ValJqCnvDAIQcTtZ1
	 hJL2+SSP4yUUjVvTOglidWzHVFT6U/Q4RpevcNsHgwTe9sC41ibzeVgWwhEVPjMayC
	 PPYSQF9qE809g==
Received: from [100.112.197.4] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 93/83-28459-38C78216; Fri, 27 Aug 2021 05:47:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeJIrShJLcpLzFFi42Kxs+GYqttUo5F
  osHuSgcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnF2TlTBAs6K87+WMzcwnuHoYuTiEBKYzSTR
  t/ggE4Szh1Fifstbti5GTg42AV2Jc4/XsoPYIgL6Ektn72EGsYUFAiSefdvC0sXIwcEioCpxt
  s0WxOQVcJf4dNgdpEJCQEFiysP3YNW8AoISJ2c+YQGxmQUkJA6+eMEMUi4hoCgxe7o8RHmFxO
  vDl5gnMPLMQtIxC0nHAkamVYwWSUWZ6RkluYmZObqGBga6hoZGuoaW5rqGxuZ6iVW6SXqppbr
  lqcUluoZ6ieXFesWVuck5KXp5qSWbGIEBlFJwtHMH469XH/QOMUpyMCmJ8u5I10gU4kvKT6nM
  SCzOiC8qzUktPsQow8GhJMGbXA2UEyxKTU+tSMvMAQYzTFqCg0dJhPcpSJq3uCAxtzgzHSJ1i
  lFRSpz3CUhCACSRUZoH1waLoEuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnfgEzhycwrgZ
  v+CmgxE9DiAj5VkMUliQgpqQamQJXeQuuvDyTM/gascThccKe5VFBgfomM2EWH1Cd+vlfaDVO
  M6+Q1bH99sdl+wNsp593Wr/d3FFu/VT2r2XA3bf6pzv4NCbOKVvrdf/WgtPLLM+bLl3atX9ux
  vXrK6+2fr53YISa2J+JM+/bPf0xVL/bcu3v1g/j5ZWsdKzLfuk5ceOVXF/ML6b5yFxX9hVP0R
  a4GyswrW5gU57PbberMHwEB5s8LZYRq13Qy/7wvqXhy+b3zD9Oe/bg16+CFuKpXL7Mjtv7ctt
  QoNnPfqqPJr1Mvv/x2VmTLDAuDTO/pt10e9yQefMf0sfHd1xTRPz31teYbun7IPtf/rBB8Ll7
  53J/tR0NlM7d83Zsfqeux2UuJpTgj0VCLuag4EQCHwYsmGwMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-19.tower-285.messagelabs.com!1630043266!99026!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9203 invoked from network); 27 Aug 2021 05:47:46 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-19.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Aug 2021 05:47:46 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17R5lkp8028966
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Aug 2021 06:47:46 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 27 Aug 2021 06:47:44 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 1.4.22 -> 1.4.23
Date: Thu, 26 Aug 2021 10:58:07 +0800
Message-ID: <1629946687-7353-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ython3-sqlalchemy_1.4.22.bb => python3-sqlalchemy_1.4.23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.22.bb => python3-sqlalchemy_1.4.23.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.22.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.23.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.22.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.23.bb
index bdc48cf46c..1b8af825a6 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.22.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.23.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595"
 
-SRC_URI[sha256sum] = "ec1be26cdccd60d180359a527d5980d959a26269a2c7b1b327a1eea0cab37ed8"
+SRC_URI[sha256sum] = "76ff246881f528089bf19385131b966197bb494653990396d2ce138e2a447583"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.25.1

