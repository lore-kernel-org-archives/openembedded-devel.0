Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.6765.1628157069966602710
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Aug 2021 02:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SR1UQC3C;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1628157067; i=@fujitsu.com;
	bh=XEFus6JG+yHXDL6DEB9/vSAQkZQSvgFRQkjpjUkl0C8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SR1UQC3CjCUfaMOxc1vjdfPfmUrNJsv2t5LnydAlsu3pMhXKXZ8f9Yis+OtkXunaA
	 fCEOJXM1PL4S64k3d/9VSA9i51sjI6f7c2+CVbAo1BG/hs+A7pa5xwDU4ohjgmBaw6
	 mt/3fZNT5o1Ao95g6SHKpyBdvc/skRt/jRIuHMBCJ+rgT250kUKvCGWtkgn6AEb1h8
	 ueignW8m1+4CgOKtypb28/lCZzS0ITDfU9DM3XXtLQwapKJQ/wiB7aqL5USdqDNBZm
	 Y5xNiWoj030Gfrgu5CxBe9B4TPNdIxOmUCOFuJ/zQmD5AOS3A5my2N2HfkWLBE3UAZ
	 fFWKhCZfOjSKg==
Received: from [100.113.4.199] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id AE/95-06992-B84BB016; Thu, 05 Aug 2021 09:51:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+GYqtu9hTv
  R4ONafouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPugoPsBVt4KmavaGJvYFzA3cXIxSEkMItJ
  YtbFQ+wQznFGiYNPrzN2MXJysAnoSHS86GYBsUUE9CWWzt7DDGILC/hIHL/QzgpiswioSMw4t
  gzM5hVwk7jy/AZYr4SAgsSUh++ZIeKCEidnPgGbwywgIXHwxQtmiBpFie07z7BA2BUSrw9fYp
  7AyDMLScssJC0LGJlWMVomFWWmZ5TkJmbm6BoaGOgaGhrrmusaGhnqJVbpJumlluomp+aVFCU
  CZfUSy4v1iitzk3NS9PJSSzYxAkMppZC9cgfj2jcf9A4xSnIwKYny6vdyJwrxJeWnVGYkFmfE
  F5XmpBYfYpTh4FCS4FXZDJQTLEpNT61Iy8wBhjVMWoKDR0mEd/EmoDRvcUFibnFmOkTqFKOil
  DhvK0hCACSRUZoH1waLpUuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHkLQabwZOaVwE1/Bb
  SYCWjxhVhOkMUliQgpqQamKQqTCh9ZXspsVnB4tkHr2TeNri6PJ+Fmck1dPCna747KTFGNUcp
  S/rLlmLWa+jujUB21Wrlf5rXvrmfeX/mmefYlnoy97FyxhZIFkSKcSl5fPDdfNb/IPmPp8iA3
  O4F3bayP/tZPuP2ky+i90aswh6qGJeoZ944lq6hLV5bvYGOQX372pQHz2sTKJ32ls/Pr9Nq2T
  YwT36DcUhIabzYlr+lUWXHf+7QnWR1fcld8e1mcp7BKa2+vf4aWf9Dnlbaed0/8ctYu0F2uJt
  OjOHmFSLDEX5trFhN/MO1psy5wu8p6Rcr+ANPEifHPC8/Ir/rIW+X69+6VFTl2zvaVHOEr273
  t+Cuua92bfeD+ZSWW4oxEQy3mouJEAL3JhpcgAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-238.messagelabs.com!1628157066!323371!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12255 invoked from network); 5 Aug 2021 09:51:07 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-8.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Aug 2021 09:51:07 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1759p6Ct021003
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Aug 2021 10:51:06 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 5 Aug 2021 10:51:04 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-socketio: upgrade 5.3.0 -> 5.4.0
Date: Fri, 6 Aug 2021 05:50:58 +0800
Message-ID: <1628200258-4626-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Release 5.4.0 - 2021-08-02

Support msgpack and custom packet serializers #749 (commit)
Return error packet if client connects to an already connected namespace (commit)
Handle CancelledError in async pubsub managers #750 (commit)
More robust handling of emit's "to" argument #689 (commit)
Remove executable permissions from setup.py, which has no shebang #748 (commit) (thanks Ben Beasley!)
Improved project structure (commit)

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-socketio_5.3.0.bb => python3-socketio_5.4.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.3.0.bb => python3-socketio_5.4.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.3.0.bb b/meta-python/recipes-devtools/python/python3-socketio_5.4.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-socketio_5.3.0.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.4.0.bb
index 18a1753bb7..cd2c436a5c 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.4.0.bb
@@ -9,7 +9,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[sha256sum] = "3dcc9785aaeef3a9eeb36c3818095662342744bdcdabd050fe697cdb826a1c2b"
+SRC_URI[sha256sum] = "ca807c9e1f168e96dea412d64dd834fb47c470d27fd83da0504aa4b248ba2544"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
-- 
2.25.1

