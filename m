Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web09.5340.1632471833643543110
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Sep 2021 01:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=V/H6nRgD;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632471830; i=@fujitsu.com;
	bh=WruKEQQH8ZUt71Gg0JsQQotLrmbgOTPBm3qpfmGrvzg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=V/H6nRgDIa25v35DLH4RsWh/eZEDVqj/fHddaoxtDA6fiMp0xIexUhigLSKsz/edC
	 8GxRM46L0ieS9fH4XImiOnLL6L2w6VUo3nIAjT7uOpMGu4DGDYM6oi7nyKo2WLYkDt
	 iO3f45bM1TMbg9VeSjs0ip7nGTvci2cMcZzpp63nyNowAWKUKZCCCAmwjUJz9BpGH/
	 H5P87JQheeMB8SUPh5Hwl2/lrxxkBTbFHdqHloQzlQygT3KO/X/YQlB3o1FozyBYD5
	 VYHnXnPtVZMNuRWpXhdlP/xxvRhii5LTHDh7WWxBJ5za8MLaIsP5LHOd5tXJZcBf0n
	 W8whteqHEzvXw==
Received: from [100.113.3.182] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id B9/1D-32481-61B8D416; Fri, 24 Sep 2021 08:23:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+EI1RXr9k0
  0OPuO0eLi4aXMDowe5zauYAxgjGLNzEvKr0hgzfi+6DJ7wUHOio5jixgbGG9wdDFycQgJzGaS
  2H9gMzOEc4JR4sfpd0AOJwebgI5Ex4tuFhBbREBfYunsPWBxYYEAiatv3zKB2CwCqhK9/3ezg
  ti8Am4SfROmMILYEgIKElMevmeGiAtKnJz5BGwOs4CExMEXL5ghahQltu88wwJhV0i8PnyJeQ
  IjzywkLbOQtCxgZFrFaJlUlJmeUZKbmJmja2hgoGtoaKxrrGtkaqiXWKWbqJdaqpucmldSlAi
  U1UssL9YrrsxNzknRy0st2cQIDKWUQubfOxgfv/6gd4hRkoNJSZRXv9M3UYgvKT+lMiOxOCO+
  qDQntfgQowwHh5IE74smoJxgUWp6akVaZg4wrGHSEhw8SiK8ySCtvMUFibnFmekQqVOMilLiv
  N9agRICIImM0jy4NlgsXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzLsbZDxPZl4J3PRXQI
  uZgBY/n+sDsrgkESEl1cB0aNt6i8sPp37Nq7glF266oZh7/ZJNHY17r/qsObIl2lyN4+TiSc0
  VwpvnlKQeFj3AWXOocubb7yIJJxYkbPq2fn6lFd/OX7tS0/w+5yxdtGnCfPVmNr3LJXkKgcsk
  qrNt9tx8Pf/kCd1ngfdS77zj/PtbwLfkkv3fgDPMsTum77e+f98yXkyS+0Ff7MYt67+/uLz4l
  +aXmTm/Qw7mdWmrJl5+WX/wXr/PvaSSLz+LPRgffgs7mR636P/mG6wHayJrL7w+6vLNy+G+6U
  0xzUBL596CU8bf/zY82S+Usj063mthxKqbS/fsqnaY6TlVQ/yCi/OuaR+PGKk0MOw5NktUzEH
  hRYVcr7/uEkHpmOmbCpVYijMSDbWYi4oTAVxQ9GQgAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-226.messagelabs.com!1632471829!64805!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11890 invoked from network); 24 Sep 2021 08:23:49 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-7.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Sep 2021 08:23:49 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18O8NnXH017647
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Sep 2021 09:23:49 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Fri, 24 Sep 2021 09:23:48 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-robotframework: upgrade 4.1 -> 4.1.1
Date: Sat, 25 Sep 2021 04:23:42 +0800
Message-ID: <1632515022-4728-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Robot Framework 4.1.1 is mostly a bug fix release, but it also adds official Python 3.10 support. 

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...n3-robotframework_4.1.bb => python3-robotframework_4.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_4.1.bb => python3-robotframework_4.1.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_4.1.bb b/meta-python/recipes-devtools/python/python3-robotframework_4.1.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-robotframework_4.1.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_4.1.1.bb
index 7c6c41af7c..d715f35135 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_4.1.1.bb
@@ -13,7 +13,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[sha256sum] = "567f2a21f0906635e21d45fe3cb84a4809a12980c9f2706a8a5f65f40f6b4ccd"
+SRC_URI[sha256sum] = "663f84c177b2fa9b3b782939e31637a057a33f3a4b29067812f1259b7f4bad35"
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-shell \
-- 
2.25.1

