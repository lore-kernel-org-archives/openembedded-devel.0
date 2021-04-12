Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web12.28386.1618204803571164192
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Apr 2021 22:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=l1VdDfK4;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618204801; i=@fujitsu.com;
	bh=kvt4pYAuq1BksASurqDeIhINHeRRjQAHNJZ2IFfK0FU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=l1VdDfK4+BKr16B5jPM+5TVd8zPCfkssjq4RtjbYDZ91V2LUdhuf9pmvX/yPgVhJl
	 4MGKOmkgkQT7zEyALNoeym0DiVhPOAgPv7nhZUbDXat6s2HNVyQn4cMxYUY/ksUMUY
	 PUXvIgoNBL2zch7dWYy3EibC6qZ8iK22vSWI5WoghFfv0z1ws57gnES82ApBUR/e8h
	 VUD3LzL2DTYX7u00GduyEbWhhhSeec5jHDFmsODIyKzTZxiXhy1nABmT+iSFuwWQ7S
	 NLWx3QlrXzpClaO/DV83Ocwo45wjQ0W8ere3krJLoRy+T4klHXk4Tcdd3MyYTuCSJ4
	 ZGK+HIqmVTQ9g==
Received: from [100.113.6.193] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id EE/DF-44603-188D3706; Mon, 12 Apr 2021 05:20:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI0W24UZx
  g0PPMyuLi4aXMDowe5zauYAxgjGLNzEvKr0hgzTh/YSNbQT9nxadTjxkbGHdxdDFycQgJzGaS
  +Lz+DTOEs5tR4kXvRrYuRk4ONgFdiXOP17KD2CIC+hJLZ+9hBrGFBXwkDr9pYgSxWQRUJaZ9v
  MUKYvMKeEp0Xp3FAmJLCChITHn4nhkiLihxcuYTsDizgITEwRcvgOIcQDWKErOny0OUV0psn3
  aWcQIjzywkHbOQdCxgZFrFaJlUlJmeUZKbmJmja2hgoGtoaKxromtobKCXWKWbpJdaqpucmld
  SlAiU1UssL9YrrsxNzknRy0st2cQIDKSUQpamHYy/X33QO8QoycGkJMr7zak4QYgvKT+lMiOx
  OCO+qDQntfgQowwHh5IEb8o1oJxgUWp6akVaZg4wqGHSEhw8SiK8fFeA0rzFBYm5xZnpEKlTj
  IpS4ryvQPoEQBIZpXlwbbBIusQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmPcLyBSezLwSuO
  mvgBYzAS2+uLUQZHFJIkJKqoGp3r+jvde/9jH7rSXSmwVmvd3h8ez1peZpaay8n+u2VjJNXGi
  oUeT+N72OwSQqYa9i7gH72UmZufOmCbx5MdWg80Z8D7t4a9zckvOsVs/tt76+wbmTXVm/QLlv
  0o05RRyvBTnjmuzk06cWfJ1kIve91lecc+bOxKlrPZItJy+zv8di7S803TJqwtF9W7esW8Dae
  YGp/4L+9jeyD9lPl8w8fjqkY5fv5eOxDWlnDKdv27zy84HV63dYHP19sXXmm6xfVxJ/pausrr
  iwcKLy2auh1X0V1xsWFjNzFRmvs1nc/K6LfcnPvwyphp2h5RG2Jtbn391RjojacjFJeuGkZW1
  SM5Z1av2ZduOiJPfkaLkKJZbijERDLeai4kQAlX5lmR8DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-29.tower-248.messagelabs.com!1618204800!764438!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23667 invoked from network); 12 Apr 2021 05:20:00 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-29.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Apr 2021 05:20:00 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13C5K0hh006148
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Apr 2021 06:20:00 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 12 Apr 2021 06:19:59 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-bitarray: upgrade 1.9.1 -> 1.9.2
Date: Mon, 12 Apr 2021 21:51:27 +0800
Message-ID: <1618235487-127044-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-bitarray_1.9.1.bb => python3-bitarray_1.9.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.9.1.bb => python3-bitarray_1.9.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.9.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.9.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.9.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.9.2.bb
index e6bfb25c4..0716e8e1d 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.9.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "ec99acc1b18f99b7e9d0b77766b99f80b3c42d4e83306334deef9745b41a2079"
+SRC_URI[sha256sum] = "d7a49d21ae04c5af195023b140800186ebf208e3a4fc5b21a1389531cb7a7170"
 
 inherit setuptools3 pypi
 
-- 
2.25.1

