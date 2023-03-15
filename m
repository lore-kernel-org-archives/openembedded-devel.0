Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94127C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:10:10 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.9043.1678889405586119390
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=A68zez6+;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678889404; i=@fujitsu.com;
	bh=sWw6JnzQ5jdEcbXh1z6EdgH2IoJcT0Cq7jaOVuk1JeU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=A68zez6+Deja/6oDSzyglTg1htPQLzxwFa9BeOcoAUaZGYb+W0ypzjteqqW2ndZsP
	 jTdzwJPe7TS+/O4fqfdGvwlfsBJnvKdXlchaKhXruFF+rUPDgJwpuro0ojZBMfNXxd
	 c+rc4pnKT8Z2lk//6NCilboRIW5jwWHSWM3aAlNPz1DVzdmCp8rAOIxXVJn6Rzh6Sa
	 TYPGVmhiQUlUYmLrkFzd51W9ZouKjMBn3RuKR1OJIQsT2c4Ur+VxDD6pZMdUzlyMHU
	 +4+PDAqypiyuNsulbrYPCiyB+RxUlLU7xabJGeGQbl3MWl0LtZZdI6niRwHxHPJ6Pv
	 s4CtEsi2ut4tQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpLv7omC
  KQfseFYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaN540aWgtMcFT1vl7E1MH5j72Lk4hASeMgo
  MalhJlMXIyeQc4VJ4tr8SojEHkaJM+/ns4Ek2ASkJG7c/w9miwjoSyydvYcZxGYWUJF48buHH
  cQWFvCTONH6lwXEZhFQlfj4cAWYzSvgJNG16BXYAgkBBYkpD9+D9XIKOEt0L57ICLHYSeLh20
  OsEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsConG6YegZqpJXD23iXkCo+AsJO2zkLQvYGR
  axWhWnFpUllqka2igl1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuck6KX
  l1qyiREYvCnFiqw7GC/1/dU7xCjJwaQkyvtnjUCKEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneo
  guCKUKCRanpqRVpmTnASIJJS3DwKInwpp4HSvMWFyTmFmemQ6ROMSpKifPmgvQJgCQySvPg2m
  DRe4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO8DkCk8mXklcNNfAS1mAlrMO08AZHFJIkJ
  KqoFpuajix1W18VyPPB+E35oZcoft35eOxcfct2pe//X/v1xbht6DPYuEu6KCX57gNb0rvMzg
  +76dnF5JDh8yWSWs5E9LWxjc9H3LODXEv+2AvZ2uG0NdhHnjkRkrogTWPFw5a+eKfVw5ixbfm
  zyH/Uu2zYd53M7Ln0z54fnZ+4jUpYoisQPSl219xQxOy0v//sew8GIU45tPFvWvFjzYt2ihUf
  GZqtpV9/bn7z39xe3/Cp/ki5a+Gy3fNLw+pXr706KOyY7z7WXvvVrmwu8mnVr/Na5afKlvbZ/
  XxOnLF4Zsmt4x+YGjQ1/tPM4VPxQ+vN6maMC9MnC14efNXMH1r5yN/vmbLVIXW/bX90Zy0v1v
  /5VYijMSDbWYi4oTAXVeb+9ZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-565.messagelabs.com!1678889403!117244!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26159 invoked from network); 15 Mar 2023 14:10:03 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 14:10:03 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 4E3981AE
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:10:03 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 42ACD1AC
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:10:03 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 14:10:01 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xlsxwriter: upgrade 3.0.8 -> 3.0.9
Date: Wed, 15 Mar 2023 22:09:48 +0800
Message-ID: <1678889389-20817-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678889389-20817-1-git-send-email-wangmy@fujitsu.com>
References: <1678889389-20817-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:10:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101559

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-xlsxwriter_3.0.8.bb => python3-xlsxwriter_3.0.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_3.0.8.bb => python3-xlsxwriter_3.0.9.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.8.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.9.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.8.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.9.bb
index 4b89ba68d..e4acf4159 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.9.bb
@@ -16,6 +16,6 @@ RDEPENDS:${PN} += " \
 	python3-io \
 "
 
-SRC_URI[sha256sum] = "ec77335fb118c36bc5ed1c89e33904d649e4989df2d7980f7d6a9dd95ee5874e"
+SRC_URI[sha256sum] = "7216d39a2075afac7a28cad81f6ac31b0b16d8976bf1b775577d157346f891dd"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


