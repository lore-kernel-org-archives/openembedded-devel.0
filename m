Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web08.9137.1616742770474929310
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Mar 2021 00:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=f4uV76Uk;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1616742768; i=@fujitsu.com;
	bh=+yy8OvYszbIfizWzRISSNUPmbWKkmxNfNSaELSuKUvk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=f4uV76Uk1OYX8+Fg3leWwIoYwW0BenD9Y3pHb6TaymDNYD4QHxKbGkTXTcScnxKHc
	 fM080oiiJWLq8ieK+HI57jR4M2iQ/r/DPLOS/0qgbvwPMa9VinoKX/QuCuq1AweaGh
	 mAf70/a8UWE18HuC5qXrbnpyLKQuYvYAwHZhww8wLng70dVPK7Es6vayuCFrrk2Z3V
	 DzqkW6MgV2/+gT60ErElh1nHDP4ompZWdxL0LE4f/RuCYK7Y1dv28VtIk9lRSNOHz8
	 Gy128L8kI9Z1gzqjEbTcMD/83Q9ENgMwnfUcge1FfdUpGLeyZGIPO+y5Vvao0NvUFE
	 sjKicNqg6Q5+A==
Received: from [100.113.1.157] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 36/3E-03420-F698D506; Fri, 26 Mar 2021 07:12:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI1c3vjE0
  weH5T0eLi4aXMDowe5zauYAxgjGLNzEvKr0hgzTh/SrfgFkfFzA1HmRsY/7N3MXJxCAlsYZJo
  794F5ZxglLgy5RaQw8nBJqAj0fGimwXEFhHQl1g6ew9zFyMHh7CAh0TXYgGQMIuAqsTbEzPZQ
  GxeAXeJhtXbGEFsCQEFiSkP3zNDxAUlTs58AjaGWUBC4uCLF8wQNYoS23eeYQEZKSFQJXFkpt
  oERp5ZSDpmIelYwMi0itEyqSgzPaMkNzEzR9fQwEDX0NBY10jXyNBML7FKN1EvtVQ3OTWvpCg
  RKKuXWF6sV1yZm5yTopeXWrKJERhEKYVMN3Ywfnv9Qe8QoyQHk5Io76ETMQlCfEn5KZUZicUZ
  8UWlOanFhxhlODiUJHi7O2IThASLUtNTK9Iyc4ABDZOW4OBREuH91wKU5i0uSMwtzkyHSJ1iV
  JQS540C6RMASWSU5sG1waLoEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3p/tQFN4MvNK4K
  a/AlrMBLR4449IkMUliQgpqQam9b+CLXkUvy734cufOceL+f2Ho3dPXPUvlf0xbcNTN9GZV+d
  HzMm7bMxZIXfvzV3j4t2bnjgX3raOFPvyyeCAU1NRt2Fg9kHNA/G1GeWJBqF9k0JEdSZpK363
  fPg4ZePH6z+fNdXK8dtlF+myyP1xkpfq/T9V786l9NVh0zqLbrd4y58+za/ePnP7gebj3x2e/
  po5+/OaaiWj3RvKbk//2PJh6dkZQW1vVsT8k1z4/Lqo21nelUf3rvGOUdxiEvuGt5z3cve3kP
  MZiee/de64v/l6ltmNdKEn8vq87L1KOVJvmxmDtL/7yjA+VVnuvMN11fHF2y9aG00p/srPfbR
  donuOBNMi1WDpmROY/DZvV2Ipzkg01GIuKk4EAN858YMdAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-23.tower-226.messagelabs.com!1616742766!80030!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26605 invoked from network); 26 Mar 2021 07:12:47 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-23.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Mar 2021 07:12:47 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12Q7CdLW009779
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Mar 2021 07:12:46 GMT
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 26 Mar 2021 07:12:38 +0000
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-lxml: upgrade 4.6.2 -> 4.6.3
Date: Fri, 26 Mar 2021 15:12:29 +0800
Message-ID: <1616742749-29830-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-lxml_4.6.2.bb => python3-lxml_4.6.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.6.2.bb => python3-lxml_4.6.3.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.6.2.bb b/meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-lxml_4.6.2.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb
index f7aed6d77..cefe1ba34 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "cd11c7e8d21af997ee8079037fff88f16fda188a9776eb4b81c7e4c9c0a7d7fc"
+SRC_URI[sha256sum] = "39b78571b3b30645ac77b95f7c69d1bffc4cf8c3b157c435a34da72e78c82468"
 
 inherit pypi setuptools3
 
-- 
2.25.1

