Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B0BC433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 04:32:40 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.3034.1669782754051079820
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Nov 2022 20:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bSRzys9d;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669782752; i=@fujitsu.com;
	bh=nISFiek25zo4ZVorpHZtQETBP5wIZDsXZoO5iJw4J4E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bSRzys9dcXopJ2Xp451q/kdJS0JDYl1pvScUH7T3FRtRQNek3YZ8o7K+tFX6b1a9v
	 E33z0jXTHjVks5gsvm/ncIYpOdPpL3IrL6/X901dLN6Gr42uMiWcxM6SMlu3JYD5Ai
	 WbOwWshtF4cPKFs+NrBc7tjw3yxdv1Ys/0JxOAmiFU4QQxCUbF/3/AYda7mF4RR9N/
	 2B4dIN9VhcmBMYpvfdAfGSni1W9wZO2jgr6X1RIxFsCJAyZUCN+9IcBaYkSVk5siLf
	 bOBtiCdEMEu4KqWjnb8U+t4+1hb5iDDtqGC4Wu6Ke/jvWWJYgror2pNRY+0NhOC6oM
	 4UKRzAjpC/AVA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8OxWff+nbZ
  kg/2PtC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ow3E14xFhzhrJi/eTF7A+MTji5GLg4hgYeM
  EtOenGaDcC4zSbyffQ3KOcAo0bilhbGLkZODTUBBYuHWM6wgtoiAvsTS2XuYQWxhAV+J9mfTm
  UBsFgFViScP9rCA2LwCHhK3Pu5hB7ElgHqnPHzPDBEXlDg58wlYDbOAhMTBFy+A4hxANYoSs6
  fLQ5RXSMya1cYEYatJXD23iXkCI98sJN2zkHQvYGRaxWhenFpUllqka2iol1SUmZ5RkpuYmaO
  XWKWbqJdaqpuXX1SSoWuol1herJdaXKxXXJmbnJOil5dasokRGHYpxanmOxi/L/ujd4hRkoNJ
  SZT36tG2ZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvOI3gHKCRanpqRVpmTnAGIBJS3DwKInwb
  gVp5S0uSMwtzkyHSJ1i1OWY+bXtALMQS15+XqqUOG/GLaAiAZCijNI8uBGweLzEKCslzMvIwM
  AgxFOQWpSbWYIq/4pRnINRSZh3GsglPJl5JXCbXgEdwQR0RKQY2BEliQgpqQYmTY8Vfo82ROk
  8P8z768mpRUlau6/E5S2sspjy3O1CPMflzW7HTDhdX5nufLr/rMOH+I4Ji6JvrleserOO8X/P
  t4Zbi+V16rOutMhw7f99yXZho9qh1/rJ/XzPpSbtYp0T+98078ThBV6PdnIyHHSznfBZONgi5
  BF7Wnbdi8KLt9NiZ+5938W07mS1muy2VqajnUtF+Y2NPQK/fLh390vzRvcv3vd95l/p6Oi5aN
  z1/9PBHb/Kkxe3cVpa/vvEuPv4TceZ2p1n9qfUhqU/ySt+Z7tLe262hlBGReLei9siDnNpNN2
  9Nvl/7NEHUVsWTLWofagj8G0l78cd6WHuJdWW7E+WrD23ct6yded8RLcaOCqxFGckGmoxFxUn
  AgAyKXBnQgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-23.tower-745.messagelabs.com!1669782751!126227!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31053 invoked from network); 30 Nov 2022 04:32:31 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-23.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 30 Nov 2022 04:32:31 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 33434153
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 04:32:31 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 25C0973
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 04:32:31 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 30 Nov 2022 04:32:29 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-termcolor: upgrade 2.1.0 -> 2.1.1
Date: Wed, 30 Nov 2022 12:32:28 +0800
Message-ID: <1669782748-12060-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 04:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99856

Changelog:
Add __main__ to re-enable demo via python -m termcolor (#27)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-termcolor_2.1.0.bb => python3-termcolor_2.1.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-termcolor_2.1.0.bb => python3-termcolor_2.1.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-termcolor_2.1.0.bb b/meta-python/recipes-devtools/python/python3-termcolor_2.1.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-termcolor_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-termcolor_2.1.1.bb
index 4794fc084..4f48f5e5c 100644
--- a/meta-python/recipes-devtools/python/python3-termcolor_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-termcolor_2.1.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=e5f5f7c9b280511f124dba5dda3d180e"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "b80df54667ce4f48c03fe35df194f052dc27a541ebbf2544e4d6b47b5d6949c4"
+SRC_URI[sha256sum] = "67cee2009adc6449c650f6bcf3bdeed00c8ba53a8cda5362733c53e0a39fb70b"
 
 DEPENDS += " \
 	${PYTHON_PN}-toml-native \
-- 
2.25.1


