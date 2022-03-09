Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4721C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 10:45:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.4254.1646822727623442811
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 02:45:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=e2T7znYK;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646822726; i=@fujitsu.com;
	bh=CcKMB1nXgHq7+qV5c9eVA76X6ZVmN024oZSaDw6fAwY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=e2T7znYKCAFzujsRXv/s1b6urWTHfWcJ1apbfHIe1dSuxJSQljDyVL45NuGcLXC5C
	 bBlXcqb25lpJ49hf8Ovwo/8HkobzO9lc5phHhSva9+3i1NJDUCTuMKLB1d+JksxUTz
	 xbzd0R+2LJlyIJirWX1As2dIDI/Fks11SOGJvfH7vXppqAlw2gljMuFLamNlpzKXYV
	 5ZHQxuW1LnDeYlMkWZFYdL+XE4gWI+UuZjpk7uk4o0ael0tH+pBNMnK5BUbPSWxDns
	 Xtf6ESPL5SpYZRva6GIXcYi8Emu5HKxSGBhi8qSqU0I6sbIQwkgAQd51WaDipBfvOi
	 LxqKevHKeug9A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORqOvaqpF
  kcLuN2+Li4aXMDowe5zauYAxgjGLNzEvKr0hgzVi+YBJ7wWLOiu0vfjI2MF7m6GLk4hASeMIo
  cX/iLiYI5wKTxNNVW5i7GDmBnOOMEsfaUkFsNgE1iem3brCC2CIC+hJLZ+8Bq2EWUJF48buHH
  cQWFgiTmLdpDguIzQIU//zlN5jNK+Ak8XR7HxuILSGgIDHl4XtmiLigxMmZT1gg5khIHHzxgh
  miRlFi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGPlnIWmfhaR9ASPTKkarpKLM9IyS3MTMHF1DAwN
  dQ0NTXWNLXQsjvcQq3US91FLd8tTiEl0gt7xYL7W4WK+4Mjc5J0UvL7VkEyMwKFOK1YN2MH5b
  8VPvEKMkB5OSKK9MsEaSEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneziagnGBRanpqRVpmDjBCY
  NISHDxKIryfa4DSvMUFibnFmekQqVOMilLivG+agRICIImM0jy4NlhUXmKUlRLmZWRgYBDiKU
  gtys0sQZV/xSjOwagkzMvXAjSFJzOvBG76K6DFTECL7YzUQBaXJCKkpBqYZlxUSBE85ndx0x3
  u9J3/O7hMFm4w/Z7VOIV55+9JyrO3K87os8hbuVziz2aWTx/UVnIFSkr+8wtRvqZ89vORdzNs
  AlgMUxNu7UzNiox+dEk4zIVP4luOrrpN7lvmrMMsOVW3d+cse5wRrxvyLHCN7IJXMuyzO2NmM
  eYcKlv1r+dBldF1Jc4Cy6zfMrFOi3l0DsvtrWfZd11mWYbOIQ7zp7/Z1Rl5L2o1zLDxOH76zx
  1Ff3dRhfqJBnX+7bEvFXTt++o6PHZ8fyTF2qrwePctQ7Ubv96nnOzTrHzk8qJ6q3JzDuNDeXb
  Fl5cEgg8XhJ/l78r6/T+Na/7kwLl6KtnzrEXOHtJxje/5oe3w75ESS3FGoqEWc1FxIgCum7kl
  RQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-565.messagelabs.com!1646822724!2896!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6656 invoked from network); 9 Mar 2022 10:45:25 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Mar 2022 10:45:25 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BD752100191
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  9 Mar 2022 10:45:24 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9096310019B
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  9 Mar 2022 10:45:24 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 9 Mar 2022 10:45:15 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-python-vlc: upgrade 3.0.12118 ->
 3.0.16120
Date: Wed, 9 Mar 2022 18:45:02 +0800
Message-ID: <1646822705-61973-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 10:45:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95904

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-python-vlc_3.0.12118.bb => python3-python-vlc_3.0.16120.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-python-vlc_3.0.12118.bb => python3-python-vlc_3.0.16120.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.12118.bb b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.16120.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-python-vlc_3.0.12118.bb
rename to meta-python/recipes-devtools/python/python3-python-vlc_3.0.16120.bb
index 147e3bf6aa..a4d21a50e8 100644
--- a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.12118.bb
+++ b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.16120.bb
@@ -3,6 +3,6 @@ HOMEPAGE = "wiki.videolan.org/PythonBinding"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "566f2f7c303f6800851cacc016df1c6eeec094ad63e0a49d87db9d698094f1fb"
+SRC_URI[sha256sum] = "92f98fee088f72bd6d063b3b3312d0bd29b37e7ad65ddeb3a7303320300c2807"
 
 inherit pypi setuptools3
-- 
2.25.1


