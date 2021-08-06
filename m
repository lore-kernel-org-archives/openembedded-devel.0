Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web11.1758.1628233200157984339
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Aug 2021 00:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cJSMXv+u;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1628233197; i=@fujitsu.com;
	bh=zoNIO3LeaXBP4Kdei7uBCKlp3TBkT5W6oIWeSc8o4Ho=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=cJSMXv+uEX7LesFraRl8tjDCIIrm3f7IEAtIDtM6Fwt0/qvFDxkY8hqXqQtZ/BN8r
	 wbJ2CidK9sow2QOITisVls0whlf6tmrvR557pW2jCEwK+yKoj4NkPE3PKTwcjYfPd+
	 ladGQmyH7yifNDEcUlk3seQIHXuoXE3pJMxQ8qXDEe1826iRwbdL0u69DR3dssa4X9
	 fWAKhN6teGCo+0tLUAMmSOWTKxWIt//HHCXaGC8+XPrUcfQgS+FI/QKWqHhviwJzSu
	 /TvbZ4DBl6vZGXMWThSJ5uQAOXVI+aSLlYducAPpUxnToNqhAnGhII0+zKMoW88kOz
	 0Mpe23KTEaKmw==
Received: from [100.112.192.148] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id FC/39-07317-DEDDC016; Fri, 06 Aug 2021 06:59:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MxVfftXZ5
  Eg59v+SwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owTx9eyFkzhqbi/ezV7A2MDdxcjJ4eQwCwm
  iY/bhbsYuYDs3YwSv49PZARJsAnoSpx7vJYdxBYR0JdYOnsPM4gtLOAp8efYIjYQm0VARWLr3
  c1MIDavgIfE98m9YHEJAQWJKQ/fM0PEBSVOznzCAmIzC0hIHHzxAijOAVSjKDF7ujxEeYXE68
  OXmCcw8sxC0jELSccCRqZVjBZJRZnpGSW5iZk5uoYGBrqGhka6hpZAbGKil1ilm6iXWqpbnlp
  comuol1herFdcmZuck6KXl1qyiREYRCkFBybsYNz/+oPeIUZJDiYlUd7mczyJQnxJ+SmVGYnF
  GfFFpTmpxYcYZTg4lCR44+4A5QSLUtNTK9Iyc4ABDZOW4OBREuHtugWU5i0uSMwtzkyHSJ1i1
  OXYPHfpImYhlrz8vFQpcV5OkBkCIEUZpXlwI2DRdYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6
  OSMO8EkFU8mXklcJteAR3BBHTEhVhOkCNKEhFSUg1Ms66s0eqXYH09ySrm08KEJ7Irplmv/3i
  +uUXdaKJBiojEirrAt8UWnqyfzH2Yd6Vsjjn87Hixv+GPN39sl+bXvb76ICSi6LbYVib25VfE
  GPl3VAftWjznM9sxJr79rY4ev5NVPhosExX+cJcvUmfDTkXdN5OP7dKR2LNpj/kMDh/3c/Xfb
  j15VLbP89OmWpEdW9cpq/42POe6U2e+R3xm5Ma7nE6NJ2T3yc9nKLKwcgkrvjBjQfBlUR3hH7
  ciXhcv5hE+O1860yesLCPGvTw5LmjyTHbzEvvCo+Jq23osNnNr/r4k2a18L7YxjVOkXKNv+8R
  f/u6FaUun7JLsMJzx+OIiRQP///K19yQNij2VWIozEg21mIuKEwFKpYIpKQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-271.messagelabs.com!1628233196!116041!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23131 invoked from network); 6 Aug 2021 06:59:57 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-10.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Aug 2021 06:59:57 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1766xupm029202
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 6 Aug 2021 07:59:56 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 6 Aug 2021 07:59:55 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-isort: upgrade 5.9.2 -> 5.9.3
Date: Fri, 6 Aug 2021 14:59:48 +0800
Message-ID: <1628233188-40301-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

5.9.3 July 28 2021
Improved text of skipped file message to mention gitignore feature.
Made all exceptions pickleable.
Fixed #1779: Pylama integration ignores pylama specific isort config overrides.
Fixed #1781: --from-first CLI flag shouldn't take any arguments.
Fixed #1792: Sorting literals sometimes ignored when placed on first few lines of file.
Fixed #1777: extend_skip is not honored wit a git submodule when skip_gitignore=true.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-isort_5.9.2.bb => python3-isort_5.9.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.9.2.bb => python3-isort_5.9.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.9.2.bb b/meta-python/recipes-devtools/python/python3-isort_5.9.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-isort_5.9.2.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.9.3.bb
index a459423839..44a51db28f 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.9.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "f65ce5bd4cbc6abdfbe29afc2f0245538ab358c14590912df638033f157d555e"
+SRC_URI[sha256sum] = "9c2ea1e62d871267b78307fe511c0838ba0da28698c5732d54e2790bf3ba9899"
 
 inherit pypi setuptools3
 
-- 
2.25.1

