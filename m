Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web12.3643.1621560896271897607
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 May 2021 18:34:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IrEo6/FK;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621560894; i=@fujitsu.com;
	bh=jdbBVYaewbu5Wy85psitDRFLoNb7ME4j/auok9pFmUU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=IrEo6/FKiwnaGjnAOewuximREurtb5rG55IKuU0jmgDyq/lGj0ELPAa7Ed66Ijnwr
	 KfAsm7Zi0oEqG1FfzYjW+CuEQOT7xN+VjlJx/9MsE8xvs1NgyKgLr+YO7XBF8w9jRP
	 OCjUFVRDJefvErr8kzwW/AuhxUmzTk4nlCFp5ac2aiVW+ipWSoewtmEg4q0fgihDiA
	 QMdkXMqvBaq6FW1ZqAWQLCQgcvbGVDhDT6g2GvAyRKmjOMcCyJEVSWo8NxJwzE2VwP
	 jhzx4ahpmAF77d8ajQjFEhA87y4dKnm+VbtdTuxy3eTjhBeEZai05UUPsiuWWZ4hJO
	 iK2zdm8ZlQMUg==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 4D/A2-38619-D3E07A06; Fri, 21 May 2021 01:34:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+GYomvLtzz
  B4MEbUYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePUwrdMBVO5K/7dnsPUwDiLq4uRi0NIYDaT
  xIHG+UwQzglGidaVW1i7GDk52AR0JDpedLOA2CIC+hJLZ+9hBrGFBYIkjv1cBBZnEVCV+DhhM
  iOIzSvgJvFi+xuwGgkBBYkpD98zQ8QFJU7OfAJWzywgIXHwxQuoGkWJ7TvPsEDYFRIzZmxjm8
  DIMwtJyywkLQsYmVYxWiYVZaZnlOQmZuboGhoY6BoaGuua6hqZGOolVukm6aWW6ian5pUUJQJ
  l9RLLi/WKK3OTc1L08lJLNjECQymlkPXjDsZDrz/oHWKU5GBSEuVlurwsQYgvKT+lMiOxOCO+
  qDQntfgQowwHh5IErz3n8gQhwaLU9NSKtMwcYFjDpCU4eJREeJk5gNK8xQWJucWZ6RCpU4yKU
  uK8pTxACQGQREZpHlwbLJYuMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmPQYyhSczrwRu+i
  ugxUxAi93Ll4EsLklESEk1MLG1btti/MWX02P9t1zeV74z1b2dd303Ctl2K7xyLsM5vvJ1ijc
  WOs2VapWRabpx61UY8/75c3ZrMp7cvWTK+RU7tBkW9Dqo71zk56D81qPbZ5VzXj1HzG6z+feb
  5jU9eN+jdlhsrvLj/14v07hb055o6HzsXzN79knT+M2prNsu2RosPH7AYtNaszlvcs/xCBfyG
  h3TqnKwyCxJ0nplzcP7njFhurXJ5VQu3/oLhwSmbfW7+LX+gN7peMZ0d7a0kHXH7XlncB731N
  n7Yr1m+dzT6p82vpXNL7sx589iTZVrGfa7lqxdv7uIwe1UoXKGxbWCtvvs854ePvuQ7W+z8aI
  EmZN2QnabFp4N3lXqPVmJpTgj0VCLuag4EQB7xz4kIAMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-248.messagelabs.com!1621560892!744789!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9742 invoked from network); 21 May 2021 01:34:53 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-6.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 May 2021 01:34:53 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14L1Yk8h029601
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 May 2021 02:34:52 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 21 May 2021 02:34:45 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH v2] python3-pulsectl: upgrade 21.3.4 -> 21.5.17
Date: Fri, 21 May 2021 21:34:36 +0800
Message-ID: <1621604076-6959-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

pulseaudio is an empty package. It needs libpulse.so to run, which is provided by libpulse package.

When running python3-pulsectl, It needs the modules in python3-ctypes.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...hon3-pulsectl_21.3.4.bb => python3-pulsectl_21.5.17.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pulsectl_21.3.4.bb => python3-pulsectl_21.5.17.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_21.3.4.bb b/meta-python/recipes-devtools/python/python3-pulsectl_21.5.17.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-pulsectl_21.3.4.bb
rename to meta-python/recipes-devtools/python/python3-pulsectl_21.5.17.bb
index a4455eeb1c..3c0a9c0e5b 100644
--- a/meta-python/recipes-devtools/python/python3-pulsectl_21.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pulsectl_21.5.17.bb
@@ -3,8 +3,11 @@ HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
 
-SRC_URI[sha256sum] = "faa8b9336237565990298f20870e13dd1678a4586847ca5a7ff2abf10752f356"
+SRC_URI[sha256sum] = "3f782b3adf6d91b2398504002d248b36aa047bd04d5acd0ae5d4e2d3c8e746a0"
 
-RDEPENDS_${PN} += "pulseaudio"
+RDEPENDS_${PN} += " \
+	libpulse \
+	python3-ctypes \
+"
 
 inherit pypi setuptools3
-- 
2.25.1

