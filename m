Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web09.1608.1624500457444812393
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jun 2021 19:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XTSqLwDR;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624500455; i=@fujitsu.com;
	bh=1jZb4uksBrU2SMe/tkuAjfODVlekQw6ij3gyVnachgw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=XTSqLwDRB1pwlwxk6p+1bBGdgcA0f9nLDB2BvVO4Ib2dbhrw2i6/6Qes/jh5NGv67
	 0sEr7RFCjmyfiVyvL/6WMjJLYxOjDdahUXCbyzBY+7aTK5UtKXFg8Ozt0Ql0MP3Od8
	 coZDlDv1FLh3Airr0Wdm5MYCWpM0xx90SpWE2TkPWFKARldVgQsSbSfyTpJ13i9H3C
	 zj+Ki9Wivlg6tdHJmOzttv9I5iHsigGVrfGkVidlFwaOfBPxqkgb0r5x4QPu7zvEal
	 DlMuIkFljnEcX/vziGUvQl/zG2Bj0nsYAWc7hbGkkJLWQknQLToBh9idBbO4EH2rhA
	 qCwFwISNl+Ztg==
Received: from [100.113.7.10] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id F9/B8-38619-6E8E3D06; Thu, 24 Jun 2021 02:07:34 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI0X324nK
  CwdTrQhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aWY5YFEzkrHkz4yt7AeJCji5GLQ0hgNpPE
  2VN/WSGcE4wSLbP+M3YxcnKwCehIdLzoZgGxRQT0JZbO3sMMYgsLBEnc/HqAFcRmEVCVeLGxE
  6yeV8BdYuOKmUwgtoSAgsSUh++ZIeKCEidnPgGbwywgIXHwxQtmiBpFie07z7BA2BUSM2ZsY5
  vAyDMLScssJC0LGJlWMVomFWWmZ5TkJmbm6BoaGOgaGhrrmusaGRvqJVbpJumlluomp+aVFCU
  CZfUSy4v1iitzk3NS9PJSSzYxAgMppZD9+Q7GVW8+6B1ilORgUhLlLW2/nCDEl5SfUpmRWJwR
  X1Sak1p8iFGGg0NJgjccGJpCgkWp6akVaZk5wKCGSUtw8CiJ8Fo+AUrzFhck5hZnpkOkTjEqS
  onzdoL0CYAkMkrz4NpgkXSJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDv2WdAU3gy80rgpr
  8CWswEtFjh90WQxSWJCCmpBqbiwGX7nqulFa8+o8m8rlA5scjIM1lc78XWqe8vqp8zFU/es97
  rxvcsJn2XxGU1jHIzDXX1k8VWfMjT3PNq+UbT73HvXW69bv649OG3XzdieB4HqGrP2cf3aFOb
  RMilfSX6Mq6fn60NSzT+Np/Vo0UqpnDJ3i+zJc9eb3DdW3hbZmOM6lTX4JOCT9x4JCXWXboZ3
  vSik8/Wqa/AKW5Syl41IecbJVFnFZk+vHnRnFXgbCbqMyFEQmijcX+P/M7oguvFj7LPNYQt0v
  W7eSy06PCS20lSnCY31y6JMLy3N3jq3znBgiE9jxjcra9dLvfMX+e6Z3LkjAURH+7nnZPUbzR
  1/8NUk8zX33ZlQ7lNihJLcUaioRZzUXEiALvAjYYfAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-238.messagelabs.com!1624500453!196982!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26269 invoked from network); 24 Jun 2021 02:07:34 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-18.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Jun 2021 02:07:34 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15O27Xmr022516
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 03:07:33 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 24 Jun 2021 03:07:32 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-grpcio-tools: upgrade 1.37.0 -> 1.38.1
Date: Thu, 24 Jun 2021 10:07:26 +0800
Message-ID: <1624500446-11090-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...n3-grpcio-tools_1.37.0.bb => python3-grpcio-tools_1.38.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.37.0.bb => python3-grpcio-tools_1.38.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.37.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.38.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.37.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.38.1.bb
index d1b934bd0a..e6680e84b9 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.37.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.38.1.bb
@@ -11,7 +11,7 @@ DEPENDS += "${PYTHON_PN}-grpcio"
 
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
 
-SRC_URI[sha256sum] = "3ec510c1b6bfc32effc639acf9a055e72dab7a7b6757bf72f2132790d6a7cf1c"
+SRC_URI[sha256sum] = "cd85f58038b92e1961f8127d79691e84e151390d35cae73c4c0cbe2042f76b77"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-grpcio"
 
-- 
2.25.1

