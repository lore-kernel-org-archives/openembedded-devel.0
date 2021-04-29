Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web08.3035.1619678286422513749
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Apr 2021 23:38:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JD2TgM7q;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619678284; i=@fujitsu.com;
	bh=5iciVcIRH3GSK9PwSSHniWwj4t/cd5MFNLadLa7XoHc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JD2TgM7q/C2UBahXGXIqIF0iO9CazMI8egTYCHEN9Ypzq0f3LqmtYuXJEb6A2vG6a
	 O+0ftRQQEvLgYVRgmrh/Mk6pEmHg0uxwAnYYQkLO7KKUUhhSRWtCBOeacvWCNKC+/U
	 woPTZrvkWj+Q2cPBG7NU05cRF6dLMho8fh5tGqAYJj1FBwBio1Chh/JwPET4T1FS0p
	 WJPhnta+ASTPnY/7TjYm+a0XXKIbSFYZuUTsb0wV+fzcZo1KfjM1ReJ3SX3xP3yDSC
	 OGuTH3ydK/XbBHZsJP1mRt7agdnS/Vzgvi5aSPRyHrdCKHw6QqEGMs5kFuJqFbR9Bm
	 ZYivwF1zWrrbQ==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id A8/CD-44603-C445A806; Thu, 29 Apr 2021 06:38:04 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYousT0pV
  g8PqqtMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjHj5Ba2gjbOis3vbjE3MK7g6GLk4hASmM0k
  8fbSfxYI5zijxNnlP9i7GDk52AR0JDpedLOA2CIC+hJLZ+9hBrGFBRwl9i8+DxZnEVCVOHP4L
  yuIzSvgJvGl7TFYXEJAQWLKw/fMEHFBiZMzn4DFmQUkJA6+eMEMUaMosX3nGaj6Sont084yTm
  DkmYWkZRaSlgWMTKsYLZKKMtMzSnITM3N0DQ0MdA0NjXXNgCy9xCrdJL3UUt3k1LySokSgpF5
  iebFecWVuck6KXl5qySZGYCClFLJx7WB8+vqD3iFGSQ4mJVHeLZ2dCUJ8SfkplRmJxRnxRaU5
  qcWHGGU4OJQkeEuDuxKEBItS01Mr0jJzgEENk5bg4FES4Y0NAErzFhck5hZnpkOkTjEqSonzC
  oL0CYAkMkrz4NpgkXSJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvAMgUnsy8Erjpr4AWMw
  EtXna+DWRxSSJCSqqBacXivJvBlXy+shsVt3y9YMDn1xPy3Kyvbk/Hrx7dxKRpD3bXf+Bx3vd
  Vouq7MKfgyV4eTUbzfY8DDhdxMyk0ub9cv/tp8KGm59GnCqWvnd3JeHbfrJKuaJvSafz/fyuo
  TXq78UtfXaG+UI2C94ufsRqTjgfnPjTTqbYSOSqe8KrgjtuS+2mvJmp8vPSfwXrv5t17nVO29
  QjrzZvNsrnESiOx8SiLm9aZDqZZX1UL59k9kinJaEw68nKTp+UeLrNZ8Y3C2+fqHz6rs0aKrS
  EoMyzo6pV1KaWPN8fM7NCylW2adPRnw8poT1e9tO+hqxoPS1W9rhX9pnVfZo+B1Jy7P5YHaVu
  HTJ5wKlbA1vmWEktxRqKhFnNRcSIAEq4vmx8DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-26.tower-238.messagelabs.com!1619678283!212599!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22148 invoked from network); 29 Apr 2021 06:38:04 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-26.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Apr 2021 06:38:04 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13T6c3xU015901
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Apr 2021 07:38:03 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 29 Apr 2021 07:38:02 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] mailcap: upgrade 2.1.52 -> 2.1.53
Date: Fri, 30 Apr 2021 02:37:56 +0800
Message-ID: <1619721476-4869-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../mailcap/{mailcap_2.1.52.bb => mailcap_2.1.53.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/mailcap/{mailcap_2.1.52.bb => mailcap_2.1.53.bb} (89%)

diff --git a/meta-oe/recipes-support/mailcap/mailcap_2.1.52.bb b/meta-oe/recipes-support/mailcap/mailcap_2.1.53.bb
similarity index 89%
rename from meta-oe/recipes-support/mailcap/mailcap_2.1.52.bb
rename to meta-oe/recipes-support/mailcap/mailcap_2.1.53.bb
index 69e1788e9..c3cd57fb6 100644
--- a/meta-oe/recipes-support/mailcap/mailcap_2.1.52.bb
+++ b/meta-oe/recipes-support/mailcap/mailcap_2.1.53.bb
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8dce08227d135cfda1f19d4c0c6689de"
 
 SRC_URI = "https://releases.pagure.org/${BPN}/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "3d1a14a80bb85564c323562670f1c01f"
-SRC_URI[sha256sum] = "e6f615ec2ffe705522075d960744534c443ece66acfb34fada38d567d8823639"
+SRC_URI[md5sum] = "ee02da867389d290923cc138487176f9"
+SRC_URI[sha256sum] = "5eea2ef17b304977ba3ecb87afad4319fa0440f825e4f6fba6e8fa2ffeb88785"
 
 inherit update-alternatives
 
-- 
2.25.1

