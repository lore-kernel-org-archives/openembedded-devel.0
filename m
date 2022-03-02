Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69331C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 09:52:41 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.5714.1646214759496814162
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 01:52:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CwY6GKAZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646214757; i=@fujitsu.com;
	bh=WOxWDDoRp/Sdiic5aGrGDZbo9BlQFRjWsydOPRFGGnU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CwY6GKAZhU0AkXazLP5TGuvFiD7op8PuzDhfsoUPb7+mEyyJ22xaGwOKGfR1TguL1
	 KdfjNFkHs5M22dq1zgorJZK/rUybh1lC6rYiT+k/MbRc75juNe2EaFYO4jliEELvpa
	 KdBD9CkHmZ+s8ap9vMIIn8WVjuxegZt1Lec8HPD/yCcl1WAK9PeQM91ZXLWYThrpOV
	 eDVFOT7o/atnljBvBGM4bFn876cRaHMFxYRPU6c2T3H1ufkNlhOe0EkQgPD292Mf9Y
	 s+PpGJDvWlPRzgCk/UbCk+xNycfPr9qNUO12IKRQ7GPfk5GlCD4RZDJqe+YpUccWdL
	 AXlMn/gzPKcmw==
Received: from [100.115.35.140] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id 6B/73-02429-56E3F126;
 Wed, 02 Mar 2022 09:52:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8MxSTfVTj7
  JYMo2UYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPD1T1sBYc5Kq5cncPWwPiUvYuRi0NI4Amj
  xK27m5kgnAtMEsvaLkE5Jxgllk69ytLFyMnBJqAu8fjma0YQW0RAX2Lp7D3MIDazgKpE98U1Q
  KM4OIQFwiS63rqBhFkEVCQO3v7LBGLzCrhKTLzXB2ZLCChITHn4nhkiLihxcuYTFogxEhIHX7
  xghqhRkjix4iNUfYXE68OXoOJqElfPbWKewMg/C0n7LCTtCxiZVjFaJxVlpmeU5CZm5ugaGhj
  oGhqa6hqb6BoZWuglVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibnpOjlpZZsYgSGZUqx0q0d
  jBtW/dQ7xCjJwaQkyrtcTD5JiC8pP6UyI7E4I76oNCe1+BCjDAeHkgSvhjVQTrAoNT21Ii0zB
  xgjMGkJDh4lEd5VtkBp3uKCxNzizHSI1ClGXY7FV6/sZRZiycvPS5US511qA1QkAFKUUZoHNw
  IWr5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfM2g6ziycwrgdv0CugIJqAjtnrIgRxRkoi
  Qkmpgar3gGV++dOXpop3W35fM4HnF6OpnPO0wX7+XzP9985YbNHuYB6yO+80hU6+V+Pz9lZ+z
  BW7smWRyR+fh2vWJHTcPZIXdOhQRy653soSfY0HVjpUbGT4VLz1+1jEo6fxbRzXDHuPCf0tMz
  vxmaWJjeX3Uk2s+Y/uuTYc69Y+0KTNNCrAMzjup9+7QPRmNgsZJCx5fsLoZvkVQYd1cVhnVrt
  a2zdbSfkuOcPlM/7f3YILCgbWO1zcf1/HZUF+zp6FCZQ73/twLccbtks/qbA5df81rMUeq4UV
  epPenKIsTIpHGKg/cNuctbFO+efvUxl532/fqszkXHNGaXhll9O0Wzx2Tgpj8Ypcfv5pushxe
  pcRSnJFoqMVcVJwIAHUJDWVSAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-548.messagelabs.com!1646214757!3650!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14187 invoked from network); 2 Mar 2022 09:52:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Mar 2022 09:52:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E473B100451
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  2 Mar 2022 09:52:36 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D7EBD10044D
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  2 Mar 2022 09:52:36 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 2 Mar 2022 09:52:15 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 1/3] [oe] [meta-python] [PATCH] python3-pillow: upgrade 9.0.0
 -> 9.0.1
Date: Wed, 2 Mar 2022 17:52:50 +0800
Message-ID: <1646214772-692-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 09:52:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95683

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:

In show_file, use os.remove to remove temporary images. CVE-2022-24303
Restrict builtins within lambdas for ImageMath.eval. CVE-2022-22817

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-pillow_9.0.0.bb => python3-pillow_9.0.1.bb} | 2 ++
 1 file changed, 2 insertions(+)
 rename meta-python/recipes-devtools/python/{python3-pillow_9.0.0.bb => python3-pillow_9.0.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb b/meta-python/recipes-devtools/python/python3-pillow_9.0.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_9.0.1.bb
index 487e4b54c..fb86322f7 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.0.1.bb
@@ -38,3 +38,5 @@ S = "${WORKDIR}/git"
 RPROVIDES:${PN} += "python3-imaging"
 
 BBCLASSEXTEND = "native"
+
+SRCREV = "6deac9e3a23caffbfdd75c00d3f0a1cd36cdbd5d"
-- 
2.25.1


