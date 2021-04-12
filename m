Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web10.28302.1618204764389068046
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Apr 2021 22:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OnfiGIxa;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618204762; i=@fujitsu.com;
	bh=U9b6zZiCp7//VVm/27JZzayl0sSUP1z0o46TOOZsiEg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=OnfiGIxaAKcN0xgV/gDqNju96DBJmfiu2HSEV0+mJezcZrB9qU8pDBCnBC+BExZ6r
	 c41lfdgtA4oXjyPa3WuomJCBVbF5vnIt8RZYearEPOp02YczxlfUC0n2qZTt+U5acn
	 M3QFlKP9GvCCHEAahFPGyVBwdHHx1oIFA3GB0U1vy/e/GETzg2OOp1jEjRFstd++vS
	 rZJofZyNK4UTwWCtJaRbOL/AcUQ3hHZIh54lOujgI7caiWZIyYH8ZSDmlwywn1tuyB
	 CR5rfdSvu5a/lVblKcqOn/PwPJClouzHey49whM0AgzKpTTB0U7hI0y9qsS/Y/HhJy
	 Y+bfgCvQC3z0w==
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id B5/21-01834-A58D3706; Mon, 12 Apr 2021 05:19:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYqht1ozj
  B4NsSCYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeN221v2gh88FV8v7mBsYLzA3cXIxSEkMJtJ
  4sDkSYwQzm5Gid1znrN3MXJysAnoSpx7vBbMFhHQl1g6ew9zFyMHh7CAt8Se57UgYRYBVYlpF
  76ClfAKeEp8PNzGCmJLCChITHn4nhkiLihxcuYTFhCbWUBC4uCLF2BjJAQUJWZPl4cor5TYPu
  0s4wRGnllIOmYh6VjAyLSK0SKpKDM9oyQ3MTNH19DAQNfQ0EjX0NJI18jARC+xSjdRL7VUtzy
  1uETXUC+xvFivuDI3OSdFLy+1ZBMjMIhSCg6c2cF46vUHvUOMkhxMSqK835yKE4T4kvJTKjMS
  izPii0pzUosPMcpwcChJ8KZcA8oJFqWmp1akZeYAAxomLcHBoyTCy3cFKM1bXJCYW5yZDpE6x
  agoJc77CqRPACSRUZoH1waLokuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHm/gEzhycwrgZ
  v+CmgxE9Dii1sLQRaXJCKkpBqYHH3qqu84uGklH1x49tHq2xZMsbv4bT+w73r7Xk1Cb+rkpGw
  Vh6VVswtOdFz/cekUTybngrDr80r+tCRPWyM7+9bW+zvDT2Tu+dQxxbGfY5utRHDTmWsK+0uu
  cQeqXjjU5ZtTu/TCUYtTv8TT1zbEvMvLm7NM6PsRsxDjPbohvdKh4g9+rUlfNzNtneVbllLm1
  7pHnQ1UbJdH/F32PltN/u6WuvMvDzueNr/bf/13QqFrWZ4np+cXcbt+10ePql4JGh+/u9yjSu
  zdx/R8259PpKs1sn2tExX/3EjexHfVYnfmzGU3WFzYtr80OB/C7XRphv/b6I0WGQZ8Ren7//B
  fsX/RG/l5wsT7k9YsXCu1VImlOCPRUIu5qDgRAIZpLCkdAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-271.messagelabs.com!1618204762!1165412!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6704 invoked from network); 12 Apr 2021 05:19:22 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-16.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Apr 2021 05:19:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13C5JL7t016231
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Apr 2021 06:19:22 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 12 Apr 2021 06:19:20 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-astroid: upgrade 2.5.2 -> 2.5.3
Date: Mon, 12 Apr 2021 21:51:07 +0800
Message-ID: <1618235467-127005-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

What's New in astroid 2.5.3?
============================
Release Date: 2021-04-10

* Takes into account the fact that subscript inferring for a ClassDef may involve __class_getitem__ method

* Reworks the `collections` and `typing` brain so that `pylint`s acceptance tests are fine.

  Closes PyCQA/pylint#4206

* Use ``inference_tip`` for ``typing.TypedDict`` brain.

* Fix mro for classes that inherit from typing.Generic

* Add inference tip for typing.Generic and typing.Annotated with ``__class_getitem__``

  Closes PyCQA/pylint#2822


Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-astroid_2.5.2.bb => python3-astroid_2.5.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.5.2.bb => python3-astroid_2.5.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.5.2.bb b/meta-python/recipes-devtools/python/python3-astroid_2.5.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.5.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.5.3.bb
index 93027754b..f1d9c66af 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.5.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI[sha256sum] = "6b0ed1af831570e500e2437625979eaa3b36011f66ddfc4ce930128610258ca9"
+SRC_URI[sha256sum] = "ad63b8552c70939568966811a088ef0bc880f99a24a00834abd0e3681b514f91"
 
 inherit pypi setuptools3
 
-- 
2.25.1

