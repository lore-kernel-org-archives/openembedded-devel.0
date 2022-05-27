Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9948DC433EF
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 01:38:25 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web10.2741.1653615498580352628
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 18:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WBisaGPn;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653615496; i=@fujitsu.com;
	bh=5yZIRvWY/5234V7oBeNgExtq4RZW8FGlwgtsenPY/tI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=WBisaGPnStdiRg/Dtyrd6kp4FRD27tTDgrgqdl5qDlvXj+1pwwAo5XDzBVf2jWWLc
	 Pm1wbQz+oAwjYynd7Jm8Rxfx1xbol/iQPgxoQ1r3wHjgXvzgYfzK0gtcP8KBVGbv2i
	 0mU7FtmMhmXzqqqbW2g7644rBoKnogRfodTbcq0RR7/QYEWYNistALhWUbnYmfNFkG
	 dldGus+EpG2ol7gclLdrI3z8a0saSRRERmfkZuKsA9v+bcL/umQruxYU7YRBEBKef/
	 JOmqq7tQGy28ADzvTxBnH+dd8YHM1F3Z61V3vK1cJVXKg3XA8BKMnl21LcuDpCynlU
	 Lh10WbE58v6zQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MxSbdde0K
  SwZQefYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP2rn/MBR84KmZev8HSwDiHo4uRk0NI4Amj
  xMzjJl2MXED2BSaJj1ubGCGcA4wSp+5PZQOpYhPQlXjxYzELiC0ioC+xdPYeZhBbWMBX4vWzy
  WA2i4CqxKHr+4FsDg5eAXeJF8djQcISAgoSUx6+ByvhFRCUODnzCdgYZgEJiYMvXoCVSwgoSs
  yeLg9RXiHx+vAlZghbTeLquU3MExj5ZiHpnoWkewEj0ypGy6SizPSMktzEzBxdQwMDXUNDU11
  jXQszvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwUvbzUkk2MwLBLKWYO28H4p/en3iFG
  SQ4mJVHezHv9SUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeLdoTUgSEixKTU+tSMvMAcYATFqCg
  0dJhFdJBijNW1yQmFucmQ6ROsWoKCXO6wPSJwCSyCjNg2uDxd0lRlkpYV5GBgYGIZ6C1KLczB
  JU+VeM4hyMSsK8TzWBpvBk5pXATX8FtJgJaHE+by/I4pJEhJRUA9OqEOVLR6Xf7TfSNpi10cr
  vtXgfj7qIvWRNr9rUzqO1qsWZgU+PCeT8+9EQr1P0l/enaJqMZ/WZamVF7n9xmY9XSN6alvH1
  0lThrTPeLnh01VuxxFltd9TeGfc3bv3GfDSO+ZD6oXl6k+fs1d4/oWPqJT8Px1N/XzasXXGn/
  u6BOXY7FL+X2zx0agmZlSKRnR524kPfnuj7e9e16UwJqi405RJd6LWivnXnjM05JobnC42XuP
  buNP4v1BahMGXL14MTOawj/dKlgpdf+rxb/PwLNtYzfvutyzJO2J+QmdrcIHQl5IiYWmNHi8T
  q75V7F2d+F8vy1nRNznsd0HxOei/L61z26UH7F/XclopmblViKc5INNRiLipOBAAc1diVNgMA
  AA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-585.messagelabs.com!1653615495!34439!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15664 invoked from network); 27 May 2022 01:38:15 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 May 2022 01:38:15 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 43023100457
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:38:15 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 26D8B100440
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:38:15 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 27 May 2022 02:37:53 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-openpyxl: upgrade 3.0.9 -> 3.0.10
Date: Fri, 27 May 2022 09:37:35 +0800
Message-ID: <1653615455-2439-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 01:38:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97298

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-openpyxl_3.0.9.bb => python3-openpyxl_3.0.10.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-openpyxl_3.0.9.bb => python3-openpyxl_3.0.10.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.9.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.10.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-openpyxl_3.0.9.bb
rename to meta-python/recipes-devtools/python/python3-openpyxl_3.0.10.bb
index 4dfd4490a..447c86ddb 100644
--- a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.9.bb
+++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.10.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "40f568b9829bf9e446acfffce30250ac1fa39035124d55fc024025c41481c90f"
+SRC_URI[sha256sum] = "e47805627aebcf860edb4edf7987b1309c1b3632f3750538ed962bbcc3bd7449"
 
 RDEPENDS:${PN} += "\
 	${PYTHON_PN}-compression \
-- 
2.25.1


