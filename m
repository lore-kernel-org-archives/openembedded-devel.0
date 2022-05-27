Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A49C4332F
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 01:16:15 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.2555.1653614169076819637
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 18:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wW2Vbhol;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653614167; i=@fujitsu.com;
	bh=GLbigumZguq1TyiUZa6aDcNmCmvoSR1dup2eyB7mhr0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wW2VbholW5kQP06vtIUUU3Jt0daPAH7ZpvD1C+Y23jVcjqO9WvvMTA4D/Vs+SZv/U
	 LLAmw3RsV7q2/vl0gkoxoPhA49U83Hw5DoVG6IrsDfmpdHECl9lIyJe/Rohe0Hy0VT
	 XXBEhPQdNyvsRtuBUFWvOIX98ZHa7/JJ8gut0o99/YSMSrvOTDi+S9ykrlMn11SpKp
	 yKzZdGL0oOFTufSutow9royG2bOUTIZcIIJKRBU9d8EX8EQNylkTB33EpF5KTTmCzU
	 2cEtepIcIOAHU2n8HMNuZMojsM5TRpT65yJAZg3YK0WP079qeextVqpOZS4a1BcmOD
	 ymc0Jjgbk/rww==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqBumNiH
  J4N0sNYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNtt3rBD86KrpX3mRsYWzi7GLk4hASeMErs
  PHWIGcK5wCRxZPNyVgjnJKNEx5W7bF2MnBxsAuoSj2++ZgSxRQT0JZbO3sMMYjMLqEp0X1zDD
  mILC/hKbH99ggXEZgGK/+raywpi8wq4S+z/vB4sLiGgIDHl4XuwXk4BD4kzd66AzRQCqllzZh
  ILRL2gxMmZT1gg5ktIHHzxghmiV0nixIqPTBB2hcTrw5eg4moSV89tYp7AKDgLSfssJO0LGJl
  WMVolFWWmZ5TkJmbm6BoaGOgaGprqGlvqWhjpJVbpJuqlluqWpxaX6AK55cV6qcXFesWVuck5
  KXp5qSWbGIFBnFKsHrSD8duKn3qHGCU5mJREeTPv9ScJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uCdpTQhSUiwKDU9tSItMwcYUTBpCQ4eJRFeJRmgNG9xQWJucWY6ROoUo6KUOO8TFaCEAEgioz
  QPrg0WxZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfP2KgNN4cnMK4Gb/gpoMRPQ4nzeXpD
  FJYkIKakGpuqpjRd3GazMrud8ciiJ89DKT9Zxvd+XLgni4Vr6yeberFnrWGY/uWSu+SoyaaGQ
  ft6jgP2huREaK1Ps7cxSbGbbfb9weMmJSx8S6/n8BBOagk5Uz9XTXcaXOWHy3fWbZbZt8vb/5
  1kWPmvW8ysM8+stY7xZinwSgjMOiEz4snfN90VxHbOnFWwwlGaWv+dc03LX+CDz9MRMg1Dl48
  t+hec6L7cOEIvjNXy5k693Ss7NzfUrPXhiJD9vs9xgksY70adGcbmMDc/qbTPeWjiLiGvv9Th
  8ZXeh03+Xk4mZTy+vYNgjvu/wrLb4Z2dePE27v7QmI/f+BjmzLaKPdswyYj8U6Prv47FTQjIX
  fI/mdCuxFGckGmoxFxUnAgBW+Qg5XQMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-548.messagelabs.com!1653614166!11006!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21005 invoked from network); 27 May 2022 01:16:06 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 May 2022 01:16:06 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 363DE10019F
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:16:06 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 29B6610018E
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:16:06 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 27 May 2022 02:15:47 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.19.1 -> 2.19.2
Date: Fri, 27 May 2022 09:15:28 +0800
Message-ID: <1653614132-27735-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653614132-27735-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1653614132-27735-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 01:16:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97285

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
==========
Fix
    Don't treat im_mode ? as im_mode V

Other
    Add stacklevel=2 to some warnings.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-imageio_2.19.1.bb => python3-imageio_2.19.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.19.1.bb => python3-imageio_2.19.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.19.1.bb b/meta-python/recipes-devtools/python/python3-imageio_2.19.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.19.1.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.19.2.bb
index 1a6c078cd..b792b9885 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.19.2.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "d63600626b80ebe1ec9614c33434879c754dea328717f4e2cebe88f156fa1a9c"
+SRC_URI[sha256sum] = "46e1e74128837d2a1ebc87476b7f73978b69a128fa238bc989b625a9819bd9b3"
 
 inherit pypi setuptools3
 
-- 
2.25.1


