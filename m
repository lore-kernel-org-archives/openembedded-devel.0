Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.3982.1617859737399662871
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 22:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dw2MNTzM;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617859735; i=@fujitsu.com;
	bh=BAE1i5zCDcByecpCmZOdhrnQTynmpo3+TKiL2rTs/yE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dw2MNTzM6HaPuAdEnvLZvGLq/hBubMXMbFYab3SNaYRpLTkjE91uMk4dR+eXnz2Iq
	 XlaqXTFcBIRoR3Ypvz02C7887fEiV0fUIMWDIhWm9eIeKrP6mgASto0Gy7FFPMvhHW
	 sKOPPBrtPgYsnAQg6GDtWmDYlUAWuYmjXX9pRj3Hh12ZnI1kudpFXYQYxYwgn5F/Y8
	 9qux2RT2+upcwOEK0aoPKP8zeQifeNAmNxktC308S+sfOQLWUNRQvlqO3qJ2Kx+s5p
	 5rNiJ+gJ4NmVWUL9qq+qSd/mkJsvI8T8wPDcg5UPeAUA6LG2VVrk0ar04OiAC1pqYB
	 sc70zriM627uQ==
Received: from [100.113.6.193] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id CC/9E-14281-7949E606; Thu, 08 Apr 2021 05:28:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRWlGSWpSXmKPExsViZ8MRqjt9Sl6
  CwYf/jBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8budx8YC85wVhw9u5apgfEFRxcjF4eQwFYm
  iecdd9khnOOMEotWPGbqYuTkYBPQkeh40c0CYosI6Essnb2HGcQWFnCV2LTpBjuIzSKgIrFo4
  n1GEJtXwE3i2aojYDUSAgoSUx6+Z4aIC0qcnPkEbA6zgITEwRcvoGoUJbbvPMMCYVdJnJ39hW
  kCI88sJC2zkLQsYGRaxWiZVJSZnlGSm5iZo2toYKBraGisa6JraGygl1ilm6SXWqqbnJpXUpQ
  IlNVLLC/WK67MTc5J0ctLLdnECAyllEKWph2Mv1990DvEKMnBpCTKmzUpL0GILyk/pTIjsTgj
  vqg0J7X4EKMMB4eSBO+FNqCcYFFqempFWmYOMKxh0hIcPEoivGkgrbzFBYm5xZnpEKlTjLocX
  1YtWcQsxJKXn5cqJc6bOhmoSACkKKM0D24ELMYuMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVB
  LmnQyyiiczrwRu0yugI5iAjig5mAtyREkiQkqqganwiGNfyuR/gaUHefpz12U8/mItvv7oU3d
  tA4OXt8ssNrVVqFz2cSqL1v277OfH/Gs2l200Sv6b5SntsX8+95/hRfs99/cV5MikTXVxb8hd
  WPBhs92uD7P3dfPZrORnTrNYenHtTpGZ6jc4pljxMfIHlB9o4eKf9nna0+/Oh0/U2jB8PHP69
  72f+4+VrJnpEezza0fpxl3L5/RWqJV/8uGfyr7HWu64hhlruenykHucav83fzZ7XqCcqST8xb
  1u6tOQex27L7Zm1vksWrazXWXf7p7vRY/rt5+6+VFsi7r8xqSQ67t3v1hv1n3N0m3PkYnMR45
  eDHKabPNJMqFVITWgoERA7NK/E3X6Ktx+05YpsRRnJBpqMRcVJwIACR5awSwDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-238.messagelabs.com!1617859734!1492446!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29623 invoked from network); 8 Apr 2021 05:28:54 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-18.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Apr 2021 05:28:54 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1385Sste025944
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 8 Apr 2021 06:28:54 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 8 Apr 2021 06:28:53 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] live555: upgrade 20210322 -> 20210406
Date: Fri, 9 Apr 2021 01:28:47 +0800
Message-ID: <1617902927-5429-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../live555/{live555_20210322.bb => live555_20210406.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/live555/{live555_20210322.bb => live555_20210406.bb} (97%)

diff --git a/meta-oe/recipes-multimedia/live555/live555_20210322.bb b/meta-oe/recipes-multimedia/live555/live555_20210406.bb
similarity index 97%
rename from meta-oe/recipes-multimedia/live555/live555_20210322.bb
rename to meta-oe/recipes-multimedia/live555/live555_20210406.bb
index 891338548..cc138adb6 100644
--- a/meta-oe/recipes-multimedia/live555/live555_20210322.bb
+++ b/meta-oe/recipes-multimedia/live555/live555_20210406.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.videolan.org/pub/contrib/live555/live.${URLV}.tar.gz
 # only latest live version stays on http://www.live555.com/liveMedia/public/, add mirror for older
 MIRRORS += "http://www.live555.com/liveMedia/public/ http://download.videolan.org/contrib/live555/ \n"
 
-SRC_URI[sha256sum] = "b451c7ded8becbfa239e8f4fbe69784413270fb4c5e9b2e74269247dc3dd2e59"
+SRC_URI[sha256sum] = "0bd182fac7d6297d924af4405ce840515a38fa5438cb1a4b90fcb6bc737b36d6"
 
 S = "${WORKDIR}/live"
 
-- 
2.25.1

