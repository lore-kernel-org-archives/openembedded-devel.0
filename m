Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.4396.1626255264748358098
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jul 2021 02:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bGObPryf;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626255258; i=@fujitsu.com;
	bh=AYhTrGpTwEPAZ+XwL/98FQW655YhdkaHvUl6TuA8nbg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bGObPryfH5dxOJPj6jjfnA4oWndUywp/ofJH3JYsPk8RYR6MUqVWXQP4I0YbbINlR
	 xg7sXr7Xn7w3s7mP5vOS4P3vxdUgevlrau0IuBZPXaCGejGYp3/dYLAXu9zaxswsVs
	 4BvNcyKz464Dja4RIgNI7gsioEVsME64Hj+0Td0s8LvX9r2GRVjqOO6rz8E9Nn5EZj
	 ZNNAZrlGuEIIf34vy3KaTb1VmrIhwsEWCsFgJj5JioSSWI5E/q3pkN3vhV1NS+3jZ8
	 umy8j3zFw75ia0La87zmImhM112+IGRF5WV3YgmiD9YciWiyOEbUzr5rYD/ocZ1bA2
	 qOZfS9x02QRCg==
Received: from [100.112.199.200] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id E9/07-27654-A9FAEE06; Wed, 14 Jul 2021 09:34:18 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYojtt/bs
  Eg8bphhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bhCffYClZyVey93cTWwHiCs4uRi0NIYBuT
  xPGNr9kgnJOMEs3LdjJ1MXJysAnoSHS86GYBsUUE9CWWzt7D3MXIwSEsECFx6YoqSJhFQFWie
  dF9sHJeATeJxsnvGUFsCQEFiSkP3zNDxAUlTs58AjaGWUBC4uCLF8wQNYoS23eeYYGwKyX2zO
  pnmsDIMwtJyywkLQsYmVYxWiQVZaZnlOQmZuboGhoY6BoaGukaWlroGpob6yVW6SbppZbqlqc
  Wl+ga6iWWF+sVV+Ym56To5aWWbGIEhlFKwbG1Oxh73nzQO8QoycGkJMp7w+dtghBfUn5KZUZi
  cUZ8UWlOavEhRhkODiUJXsa17xKEBItS01Mr0jJzgCENk5bg4FES4XUHSfMWFyTmFmemQ6ROM
  SpKifN6rwNKCIAkMkrz4NpgcXSJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvWZDxPJl5JX
  DTXwEtZgJarL3mLcjikkSElFQD08omjc7q6t7pHz4Kyh6bb6X/MN3j3TVT3mT/3fZbzq4P5Zk
  uuM1MXGDCk3MCxbL66197ufP/4NU+zTljkcXf6uuKC5LFt/Dp7ZPKE3ObL64T3RfqJL3wcMYf
  91uNNv+rzsuULO0O/vRucschqYfMz9c88v4bV3HrlI7SDaeuQ1/LK2r0Sq/6q07QfrDr3gOvU
  yuOmMQXrdIOM7XYorpoy/N5GU4PRfqOxj1eczzwlVbJ1mVHbmfvZBSeeHfp0WnvQ6JnhP6313
  y6/LJXmNPtqKOvvBVfLS1boMDNGS7pIjF1dzHf0dbQe3mJGb23/7zTf/9j4bPfZYKr558JyPz
  EerCn0al/3t0dF6/nJvAe2KPEUpyRaKjFXFScCACjmXOaHgMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-287.messagelabs.com!1626255254!79796!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7723 invoked from network); 14 Jul 2021 09:34:14 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-8.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Jul 2021 09:34:14 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16E9YE9x030849
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jul 2021 10:34:14 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 14 Jul 2021 10:34:12 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-cryptography-vectors: upgrade 3.4.6 -> 3.4.7
Date: Thu, 15 Jul 2021 05:34:06 +0800
Message-ID: <1626298446-4540-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Updated Windows, macOS, and manylinux wheels to be compiled with OpenSSL 1.1.1k.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...y-vectors_3.4.6.bb => python3-cryptography-vectors_3.4.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_3.4.6.bb => python3-cryptography-vectors_3.4.7.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.6.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.7.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.6.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.7.bb
index b5f34daefe..565e223bfc 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.6.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.7.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0 | BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
 
-SRC_URI[sha256sum] = "e5f88a5fb03d60b4f20eed4920638b6a3ed32a363523a77086528d557a2c2da8"
+SRC_URI[sha256sum] = "a7ac3aaa57514687696ad65f833e5e39b6fa3c5d41de2b8c938346ee119204c2"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.25.1

