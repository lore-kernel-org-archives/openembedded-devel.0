Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web12.15504.1627875482837350123
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Aug 2021 20:38:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OpaB2azJ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627875481; i=@fujitsu.com;
	bh=lo0P+hUJwjkoMSjMo4j5j7y6LJnbb3WZyc1/1H3jmjc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=OpaB2azJ3MqhMEEex/pgbWse6IeqKJP2//6dBUqVjd9I8Re+DLXRch5yoVqL5fGxD
	 6ypgzm3e5SvMJQXphP9otSPjfuwUi6BhOegjSw0rK3v2cY0gjhC1+0r3cRrtl3C3vu
	 lHhjYAZx+J6BPzsvMYSwjjVvZ9Q35tEpmTFMfzzGdgOmHMY31/aFOGySfsnWqF01b9
	 7ijGhsyhOqx0c1/mZgBtyqDcii/NBReY2KEZYrjwnX8FgDyd4v0Idm45TFYZJJv4cp
	 XL0wk3A0ZOZFvO6WwrKYGaYx6ccvtBJZOGVIbEP/50OmBOP/tVoV9Qn1KBcZFCFj6r
	 sU1Lmb3vcBmSw==
Received: from [100.112.192.148] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 38/7D-07317-89867016; Mon, 02 Aug 2021 03:38:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI0Z2ewZ5
  o8GyxpcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHg4AWmgg+cFSfXr2RpYGzj7GLk4hASmMUk
  sfHQbjYI5zijxNKVV1i6GDk52AR0JDpedIPZIgL6Ektn72EGsYUFvCSOnH0MFmcRUJG4tqCBF
  cTmFXCXuPirnxHElhBQkJjy8D0zRFxQ4uTMJ2D1zAISEgdfvGCGqFGU2L7zDAuEXSHx+vAl5g
  mMPLOQtMxC0rKAkWkVo0VSUWZ6RkluYmaOrqGBga6hoZGuoSUQG5npJVbpJuqlluqWpxaX6Br
  qJZYX6xVX5ibnpOjlpZZsYgQGUkrBgbodjA9ef9A7xCjJwaQkyhvSxpIoxJeUn1KZkVicEV9U
  mpNafIhRhoNDSYLXPJ09UUiwKDU9tSItMwcY1DBpCQ4eJRHemWlAad7igsTc4sx0iNQpRkUpc
  d6pIH0CIImM0jy4NlgkXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzDsfZDxPZl4J3PRXQI
  uZgBZPzWAFWVySiJCSamCa0rJffOkBCd/4Yrd0t8CI1dorK+Y7HxSOnnb4Fu9+V/O3O36kR0Y
  k3WxQ0fnsqPBX6XTZtNxIydUrNnZ87mC80qfeUPDjAduc+5XR4ddyJvDyvlRUnNXXm5GVr/H2
  7IGIh4FfPjsczZZu1Nmdt/3jt6NRTFO/vHMVvrK84/fk/o4Lx+2anrSxb9zetHHnY8aHbi8nr
  imW1UqamR9y2ens5/McxbJb5t1RTFAVKOJ03M9c3/PR1FHEsJb1o6Hi27sn7SyWSC878eDaqn
  ymwwp/zgQ9/Pfy7p3vC8zWs1Q+nLlKeOcc+x/rP9/i87Q7o/NUwikj9UmU9pNyo/Q9s5exhuw
  vPCSgzH5cutlUpeG1EktxRqKhFnNRcSIAxEMDbh8DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-265.messagelabs.com!1627875479!285067!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26017 invoked from network); 2 Aug 2021 03:37:59 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-16.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Aug 2021 03:37:59 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1723bxd1011681
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Aug 2021 04:37:59 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 2 Aug 2021 04:37:58 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-gmqtt: upgrade 0.6.9 -> 0.6.10
Date: Mon, 2 Aug 2021 11:37:50 +0800
Message-ID: <1627875470-34203-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Fix unsubscribe and heap storage behavior
Fair waiting for the heap based storage is empty
Fix unsubscribe cleans subscriptions storage
Fix tests

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-gmqtt_0.6.9.bb => python3-gmqtt_0.6.10.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.9.bb => python3-gmqtt_0.6.10.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.9.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.10.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-gmqtt_0.6.9.bb
rename to meta-python/recipes-devtools/python/python3-gmqtt_0.6.10.bb
index 73c0ae0acf..8ecb691f82 100644
--- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.9.bb
+++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/wialon/gmqtt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=903f1792621a3b35ee546da75d139177"
 
-SRC_URI[sha256sum] = "0e98a964393834e724c93b5dce9524c9f1255c338c0d972188794f54c6559f04"
+SRC_URI[sha256sum] = "7ab7a226ab13d75f7bc34a1422da73658ce4cac86708bf55f92daf7c5f44165a"
 
 inherit pypi setuptools3
 
-- 
2.25.1

