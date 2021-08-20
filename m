Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web09.82052.1629452248587195184
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Aug 2021 02:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TnSvXv5p;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629452246; i=@fujitsu.com;
	bh=oRjTXSo0BYvAjQ3D8vXRi1Vz8Mzwv9mhtKZo0tmnkns=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=TnSvXv5pdjcYZx61wDR4RoSgY0OT1B41lz/1Qo0NT4t0qvAnw5YwOmDGHqQBGRgL/
	 mwwG5prLDkXVCujOXfsV48qE858OwvEjr0SO7MxFdBTULjy459VTyQl4u1c6V4VJzw
	 bkCCNvmmaTwp3Ll1UvNztigV+O6SvN2dIdOd+ejVrM2ezM75Rfyn7E3TN9kcQNEFFV
	 a2PNlutYzD20+tpoYnGGwleqzHub2Rp424S/OSTsNCG05yL90b1eIMh2E/ZRmVUA5m
	 26YqOMByDhzuA+q829BGBpeK6HVDIPe4PoJNZW04vKBK7CiwfhRM45tFyfY6fRoEzt
	 e40da94JTOIcQ==
Received: from [100.113.1.232] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id D8/8A-17140-5D77F116; Fri, 20 Aug 2021 09:37:25 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+EI0b1aLp9
  o0LJW0+Li4aXMDowe5zauYAxgjGLNzEvKr0hgzTjauZOp4DBnxZylS9gbGF9xdDFycQgJzGaS
  +H9oOTOEc4JRYvnxj+xdjJwcbAI6Eh0vullAbBEBfYmls/cwg9jCAoESjdtmsYHYLAKqEg135
  rOC2LwC7hJ/O46DxSUEFCSmPHzPDBEXlDg58wnYHGYBCYmDL14wQ9QoSmzfeYYFwq6QeH34Ev
  MERp5ZSFpmIWlZwMi0itEyqSgzPaMkNzEzR9fQwEDX0NBY11DXyMhML7FKN1EvtVQ3OTWvpCg
  RKKuXWF6sV1yZm5yTopeXWrKJERhKKYWMj3Ywnn79Qe8QoyQHk5Ior6qZfKIQX1J+SmVGYnFG
  fFFpTmrxIUYZDg4lCd5LZUA5waLU9NSKtMwcYFjDpCU4eJREeIuLgNK8xQWJucWZ6RCpU4yKU
  uK8R0H6BEASGaV5cG2wWLrEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3FsgUnsy8Erjpr4
  AWMwEtFlKVBVlckoiQkmpgUvjLELFT8PURscd7GBrZFgmGhYWs+W6+5Uv9xX3PFfVOeR/gnXJ
  Kd1Xn0wtqsl91Yndk/7vI+zdu3ukPssYzS4NsWDnYdXalPI+c2vdDnTV3QtPXhrlqXTGaD0Nn
  KwkrS64UzJGc9+uGRICArPbBim3bvfU29teusvKPm7emedmirIqdXEtiAna/LSxR2jVf6dd8q
  UilOPagYytWTjLZ8sNG8dD7rqTbMlyz7z72ufzu5dqyA9xqZ/kOxTUnrp196tIzSbuvkwOZov
  oktj5uPXFKxfnSRNfN4u//Gj08cf/W3jS+Xd4VsVIz1N/meG3JVz+0ct9Fq7xzm36wZxieZLk
  lNdVz9YM/E1+tWfvelEmJpTgj0VCLuag4EQCY8LBjIAMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-232.messagelabs.com!1629452245!31851!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24038 invoked from network); 20 Aug 2021 09:37:25 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-15.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Aug 2021 09:37:25 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17K9bJ2L028065
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Aug 2021 10:37:25 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 20 Aug 2021 10:37:18 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-flask-migrate: upgrade 3.0.1 -> 3.1.0
Date: Fri, 20 Aug 2021 17:37:11 +0800
Message-ID: <1629452231-16372-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...n3-flask-migrate_3.0.1.bb => python3-flask-migrate_3.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-migrate_3.0.1.bb => python3-flask-migrate_3.1.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_3.0.1.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_3.1.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-flask-migrate_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-migrate_3.1.0.bb
index 04b71c6018..7a7c3fa3f3 100644
--- a/meta-python/recipes-devtools/python/python3-flask-migrate_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-migrate_3.1.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "SQLAlchemy database migrations for Flask applications using Alemb
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
 
-SRC_URI[sha256sum] = "4d42e8f861d78cb6e9319afcba5bf76062e5efd7784184dd2a1cccd9de34a702"
+SRC_URI[sha256sum] = "57d6060839e3a7f150eaab6fe4e726d9e3e7cffe2150fb223d73f92421c6d1d9"
 
 PYPI_PACKAGE = "Flask-Migrate"
 
-- 
2.25.1

