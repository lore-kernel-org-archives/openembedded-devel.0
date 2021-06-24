Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.1665.1624500425378855287
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jun 2021 19:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pftP6jje;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624500423; i=@fujitsu.com;
	bh=Z2EGT45jxa4GDYmhTXqVsD2fyW9ohv09xN6vKIq93IE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=pftP6jjegSzCFtrOol8XPR7b0EzyAMc9Ou/xy6MSmSTEnRDY/ZlrhnEvrZVG8Amx8
	 c/NqwVpkBK/dxhuDvsen9zcd9F1Kw30VKB6KitmwIbJVc7ZKaPq+6nTruHmCowlUKm
	 +hHugfMErvw8phis6m69dzh0/QVLUlRqkOoVTjbrMfF7Bk9U/Fq8gv65EUvOMPVbze
	 KTRYRleEErkb+xG3O5UjksNGPGf6lLdPnlIHka4a9oreCl0H7I/wVHm07Qs3mNX7nR
	 enXnZJ/ovMOMFiAea6Ul9PD1ImeFjNUZ8oJyyHDnM90wp2VJo1Qr4OKVEaVsqJql2B
	 MULsiA15uzeBw==
Received: from [100.112.192.137] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id B5/B9-27560-6C8E3D06; Thu, 24 Jun 2021 02:07:02 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYqnvsxeU
  Eg66d/BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bXk0bWguPcFdOm/mBtYDzI1cXIxSEkMJtJ
  4vifGWwQzglGieVLuhm7GDk52AR0JDpedLOA2CIC+hJLZ+9hBrGFBQIk2h5NZQKxWQRUJTo3r
  GIDsXkF3CUmXj8MFpcQUJCY8vA9M0RcUOLkzCdgc5gFJCQOvnjBDFGjKLF95xkWCLtCYsaMbW
  wTGHlmIWmZhaRlASPTKkaLpKLM9IyS3MTMHF1DAwNdQ0MjXUNLIDYx0Uus0k3USy3VLU8tLtE
  11EssL9YrrsxNzknRy0st2cQIDKSUggMTdjDuf/1B7xCjJAeTkihvafvlBCG+pPyUyozE4oz4
  otKc1OJDjDIcHEoSvMbPgXKCRanpqRVpmTnAoIZJS3DwKInwWj4BSvMWFyTmFmemQ6ROMSpKi
  fPqgPQJgCQySvPg2mCRdIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO/ZZ0BTeDLzSuCmvw
  JazAS0WOH3RZDFJYkIKakGJnvzek4psVb2elbJvVWmVxZtql/8jnkly7cXuXeXS8/mV/ecOWn
  71PvFDUEFTzt+VXutz2ayvVlW+MVbxb3zRKn+vxk3JC6cYtw+zWZu+ZksgfdpncytrOFlsjs9
  mj8Flv3bftnULHGGh8b332vOiAXsYhCodVY07rnmwZnPstdXvlPyepmVzsvN+oxzVfqesQQe9
  GXY0Ld9cpLBHHbOtCNn4rb5O7B37kpqzNzPmTPbbunFqIchN+WrQnR2z1wT11MuILDwcOMyvt
  nvHmjcvvvyStgG7d+zXLY8ytsWdKhYy6RmzYuj+/6na97yaeGNPhWdfXejtnYpxwKbJacYX+1
  jXaNoInA2rstpl9gzJZbijERDLeai4kQAgYI6hh8DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-271.messagelabs.com!1624500421!94557!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30176 invoked from network); 24 Jun 2021 02:07:02 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-2.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Jun 2021 02:07:02 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15O271mD030393
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 03:07:01 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 24 Jun 2021 03:07:00 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-configargparse: upgrade 1.4.1 -> 1.5
Date: Thu, 24 Jun 2021 10:06:54 +0800
Message-ID: <1624500414-11020-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Add runtime dependency to resolve errors that occurred when import configargparse.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...3-configargparse_1.4.1.bb => python3-configargparse_1.5.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-configargparse_1.4.1.bb => python3-configargparse_1.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1.4.1.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-configargparse_1.4.1.bb
rename to meta-python/recipes-devtools/python/python3-configargparse_1.5.bb
index 0c851fef30..4da5288815 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_1.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bw2/ConfigArgParse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
 
-SRC_URI[sha256sum] = "6df537158f28c5ef2e8a8146781833abbc6cb7fca81b1b55d18808ce3439235e"
+SRC_URI[sha256sum] = "dded3590373b7dae6ce6d0afeb4ae3def74761fdd78730952863914d4cb4bdb5"
 
 PYPI_PACKAGE = "ConfigArgParse"
 
@@ -15,6 +15,7 @@ PACKAGECONFIG[yaml] = ",,,${PYTHON_PN}-pyyaml"
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-core \
     ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-json \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

