Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.2615.1623982622168045367
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jun 2021 19:17:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JUm3bKlS;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623982619; i=@fujitsu.com;
	bh=/XEMDcXm9ZLeJWd/0dw6o3MkCRLvz8RDe7SDqQOt/Ro=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JUm3bKlSyWzwxZQDHIZmPuKI5jTiGgVmla+74vBQyzymMibDLurgmaSCAJpCGFSLk
	 ksUohE8tOrC5dE1OMMxHNzfPkwXfXE9OmsbLGjFDkaAl6sU7mF1hCOHTq9RbwHMVhH
	 SmdJVHjS0mjdZZn39c1BFLaIwFyr6DWELtiHNHWi+YAI0fyhh9BmyNkZD/zOfbnEcg
	 3CBznfSF9wA+vjCKJIYHT9OfyvrtOWvRxziPqDoD5/W4cVpDZfENpYlGsYMBkbuFoI
	 XkhKqyH61ohc0nCCyFld6GI2mcnr39BfAtyJ6j5ikULycgrI+pfy0D/iUb+SXNeznv
	 xt3AA6XOYMrGA==
Received: from [100.113.0.182] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id E8/88-37841-A120CC06; Fri, 18 Jun 2021 02:16:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+EI1ZViOpN
  gsLpV2OLi4aXMDowe5zauYAxgjGLNzEvKr0hgzdi68TpjwXmOiqurTrI3MH5g72Lk4hASmM0k
  Mbn7MiOEc4JRYuaW5axdjJwcbAI6Eh0vullAbBEBfYmls/cwg9jCAk4Sp/ccYgexWQRUJVZMP
  wxm8wq4Saw9fA3MlhBQkJjy8D0zRFxQ4uTMJ2BzmAUkJA6+eMEMUaMosX3nGRYIu0JixoxtbB
  MYeWYhaZmFpGUBI9MqRsukosz0jJLcxMwcXUMDA11DQ2NdY11DM0O9xCrdRL3UUt3k1LySokS
  grF5iebFecWVuck6KXl5qySZGYCilFDIv3MH44/UHvUOMkhxMSqK8Vi9PJwjxJeWnVGYkFmfE
  F5XmpBYfYpTh4FCS4FX5D5QTLEpNT61Iy8wBhjVMWoKDR0mE9w3DmQQh3uKCxNzizHSI1ClGR
  Slx3o8gCQGQREZpHlwbLJYuMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmTQOZwpOZVwI3/R
  XQYiagxW1Cp0AWlyQipKQamMr31z7eE7p1ve91t+1FKX9+rYmetvvQsm0ci7N/RTqxF+e+3Pl
  XJu7vmeWLHryfX3D+mvxCr0v//4qYr3m265XaV6EHawQ+epyp6Z97KjX8yoPtQU+fSMxItdFu
  3hg5g//k4/KDMvNumyys9dyx76f8y1LT3R+fyOw7zWS7v/vBq70y7ad4NO9OTzHff7X64Dl+B
  5NyZ9lbLAdcIjckuM9MfNPvcJHfT07p9YKtKQ/823N1fL6xc5+7JfjhzEkeYwXdt7e2fsh8LX
  BI/8bWSdufbRfZ+OHwgbiwCXwnunMOeOTUSuvNLc9Z7JU95ZrC2ckb1FV6X+d+115asuSY/sy
  SbZmec1YE17N1T91Tt0xfWYmlOCPRUIu5qDgRADYUDAsgAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-226.messagelabs.com!1623982617!2719!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3671 invoked from network); 18 Jun 2021 02:16:58 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-13.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Jun 2021 02:16:58 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15I2GvWa031539
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jun 2021 03:16:57 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 18 Jun 2021 03:16:56 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] fsverity-utils: upgrade 1.3 -> 1.4
Date: Fri, 18 Jun 2021 22:16:49 +0800
Message-ID: <1624025809-7494-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{fsverity-utils_1.3.bb => fsverity-utils_1.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/fsverity-utils/{fsverity-utils_1.3.bb => fsverity-utils_1.4.bb} (95%)

diff --git a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.3.bb b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.4.bb
similarity index 95%
rename from meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.3.bb
rename to meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.4.bb
index 9b1ba4f2ea..a39aeb617e 100644
--- a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.3.bb
+++ b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.4.bb
@@ -9,7 +9,7 @@ SECTION = "console"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bc974d217b525ea216a336adb73e1220"
 
-SRCREV = "a92b1a54b003879322c044adf0ae3ea3e95e7348"
+SRCREV = "9e082897d61a2449657651aa5a0931aca31428fd"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git"
 
 S = "${WORKDIR}/git"
-- 
2.25.1

