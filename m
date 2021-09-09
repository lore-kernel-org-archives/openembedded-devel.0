Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.83])
 by mx.groups.io with SMTP id smtpd.web08.5257.1631181407693437061
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Sep 2021 02:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Be3mpFke;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.83, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631181405; i=@fujitsu.com;
	bh=CsSEQJPr+Bc68NhDCq1V9UADz9CMP9twrGWg8z34HEc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Be3mpFkeaPRASu5oHb3ytxj2Ma7742q+aO20yViWyJ0aSaf5cfmQkZocJk6uQQhU5
	 0i+Gz5F3XtAfgjryvmWDE33701TnwaK/+BYXNskJsrgZllbbUM+nPuU+B5vy7cYBFI
	 ljJ8YSFyXEOe9f2zS/mNo2zlsmI+wdiNFjMLqGun+O0qYM0MDezk46m2sZgFdPpO3e
	 N3AVgVpU5SmjWLwN8bnWnm3Bz2yI7EaGitCN0dxk3Gwhv2LBAGehckj494UI41R/UW
	 ljYy+lM3XVAyg9Op9DEFkF3nz2iHom1dU9WkIi7LvlIxtmJZEXaYkYw6na7kUi/o4h
	 9VynFr609WXqg==
Received: from [100.112.199.201] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 6B/3A-25352-D5AD9316; Thu, 09 Sep 2021 09:56:45 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI1Y25ZZl
  osGi/lcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjHj0CeWguecFW23zzE1MDZwdjFycQgJzGKS
  +Nl3mxXCOc4o8WZVK3MXIycHm4CORMeLbhYQW0RAX2Lp7D1gcWEBH4mFG76B2SwCqhJ3T79mB
  LF5BdwkHq0+xQ5iSwgoSEx5+J4ZIi4ocXLmE7A5zAISEgdfvGCGqFGU2L7zDAuEXSHx+vAl5g
  mMPLOQtMxC0rKAkWkVo3lSUWZ6RkluYmaOrqGBga6hoZGuoaWZrpmJXmKVbpJeaqlueWpxia6
  hXmJ5sV5xZW5yTopeXmrJJkZgGKUUHHHYwXj/9Qe9Q4ySHExKorxmNy0ThfiS8lMqMxKLM+KL
  SnNSiw8xynBwKEnwJlwHygkWpaanVqRl5gBDGiYtwcGjJMKrBpLmLS5IzC3OTIdInWJUlBLn3
  XEDKCEAksgozYNrg8XRJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvLwgl/Fk5pXATX8FtJ
  gJaLHvNQuQxSWJCCmpBqa8h75+epbmyUKhi0Or2B6ueO/JH3xr1gF/xYSWusSTASvWb+37KjT
  Bxmbf3smhKre+/mzMPrDXPXbvIhdHpfUxQR9ncj6vqrCLDpUUTwsWXREY/1IlKq6+YqPrl7fp
  sd8M3mqWutVM15hd/d/iXWFjmqKrh4KA7/Z2v8jMfA2NzI1azz+pObQWiEu286WvuhpTufHc7
  /Zve962XVQqkN+bdmMpx4K5zqFF06wVX668/cPgXPTyFCdVebW5YtNLSh88KlrA9/361mUFN0
  /nLV09mXnHEcvkg8sC7KPd9wd8e/fsofZxgfonnxw/8ryJrzedPds/W/7Xgnezwpp0P/9Y9Fs
  qwqdb4pCJSLnqQiWW4oxEQy3mouJEAO9IWe4eAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-285.messagelabs.com!1631181404!76308!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19505 invoked from network); 9 Sep 2021 09:56:44 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-4.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Sep 2021 09:56:44 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1899ui65020448
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Sep 2021 10:56:44 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 9 Sep 2021 10:56:43 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-bitarray: upgrade 2.3.2 -> 2.3.3
Date: Fri, 10 Sep 2021 05:56:37 +0800
Message-ID: <1631224597-4529-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

2021-09-05   2.3.3:
-------------------
  * improve some error messages
  * add tests

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-bitarray_2.3.2.bb => python3-bitarray_2.3.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.3.2.bb => python3-bitarray_2.3.3.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.3.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.3.3.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.3.2.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.3.3.bb
index 8b473b543d..17b5d931ca 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.3.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "4bee3ba9164b66cef64f1099e9a3b88e99ddcd0c943807e99443613e184b48b4"
+SRC_URI[sha256sum] = "0edf630a4471a48627aec0b840cf3b8e10901191d328f6511560420459de282e"
 
 inherit setuptools3 pypi
 
-- 
2.25.1

