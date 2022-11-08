Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE03DC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 03:12:06 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.3914.1667877123732529165
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 19:12:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VrLWusLj;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667877122; i=@fujitsu.com;
	bh=9kvsvH+lQNXBueDfP8hwfOlWfJHXwmx0MfkEbRQMYc0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=VrLWusLjJ3LfqZ4EtQSUZPtuyihhtIoKM5iQyvbvkxBb/r5P4kXWCyCQnUymYTdBv
	 VbxGBI+1Kkg8xIBiEXSyxwt9bb7/7UxpLQ0fny78zhnsC7ZqIpCawY96sLR6U/yrgm
	 FvWmPlxMDTfMqC/QvWSDbMYOPC6AALYOn9HY870IGYHbh6DM85x2Xq3+u+ZpnM96vw
	 aLXAv4jcxTnm6OjQd/bIekwP3VcUYiDWUQJRph1SIBDvFUnM6ZJFIy2tvfWw5idVlH
	 CXEZGV4Nw2vSPZcsTT08H09HJDHPCx9i4/iRJhLIxwA/wHeoCHjTl9Iba1D3VpaWDv
	 IQCcG7N2GDNZg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8ORpMt4MjP
  ZYO0fQYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPntmlsBfc5KyZP/c3awNjE2cXIxSEk8JBR
  Yt6y82wQzmUmiWP7rjN1MXICOfsZJR6dKwax2QQUJBZuPcMKYosI6Essnb2HGcQWFgiU+HTjC
  juIzSKgIrH4SwNYnFfAQ2LvwjYWEFsCqHfKw/dQcUGJkzOfgMWZBSQkDr54ARTnAKpRlJg9XR
  6ivEJi1qw2JghbTeLquU3MExj5ZiHpnoWkewEj0ypGs+LUorLUIl1DY72kosz0jJLcxMwcvcQ
  q3US91FLd8tTiEl0jvcTyYr3U4mK94src5JwUvbzUkk2MwJBLKVacsYPx37I/eocYJTmYlER5
  s2wzk4X4kvJTKjMSizPii0pzUosPMcpwcChJ8GofA8oJFqWmp1akZeYAwx8mLcHBoyTC+/44U
  Jq3uCAxtzgzHSJ1ilGXY+bXtgPMQix5+XmpUuK8h0BmCIAUZZTmwY2AxeIlRlkpYV5GBgYGIZ
  6C1KLczBJU+VeM4hyMSsK8h0BW8WTmlcBtegV0BBPQEdUFaSBHlCQipKQamDw2s32095eO9Z+
  0r9Gjp0phS9feW+7rbwfy/c0ou9EZ92/tou2Ht08Ju9UV2dEydcPO63cmy5xaVHzk824nt9qy
  2nX/Yv5X/bpTmMAmpVHMynqkaMlFTm7lbZX72ZMFnrs2HzxgrelZJ3eokevYL6eGtkPyIp+Ob
  os8FGT9uyr318QtvlUKH3lTHW6Laa+K8eu4Hn1wc9cb7yPyCmq37DYFf04w56uLSQ7eN3/lO9
  3S6crzFM7eKjDynrYxOuUrm/D01klKxgF3lyYvnyqpHtLEUF2kvf1XF48Yi5fuoku3zje0LXq
  0bvf1jyZtD9ydrKe9rO/TMLOqjCquinrY/tB0EvftNrPah7/ENupsUWIpzkg01GIuKk4EAOT8
  dlJAAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-571.messagelabs.com!1667877121!380472!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29701 invoked from network); 8 Nov 2022 03:12:01 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-12.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Nov 2022 03:12:01 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 093991AC
	for <openembedded-devel@lists.openembedded.org>; Tue,  8 Nov 2022 03:12:01 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id F25AB7B
	for <openembedded-devel@lists.openembedded.org>; Tue,  8 Nov 2022 03:12:00 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 8 Nov 2022 03:11:59 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-zopeinterface: upgrade 5.5.0 -> 5.5.1
Date: Tue, 8 Nov 2022 11:11:53 +0800
Message-ID: <1667877113-29172-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Nov 2022 03:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99486

Changelog:
==========
Add support for final Python 3.11 release.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...n3-zopeinterface_5.5.0.bb => python3-zopeinterface_5.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zopeinterface_5.5.0.bb => python3-zopeinterface_5.5.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_5.5.0.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_5.5.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-zopeinterface_5.5.0.bb
rename to meta-python/recipes-devtools/python/python3-zopeinterface_5.5.1.bb
index 015ec0e3e..00c2eaf28 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_5.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_5.5.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423
 PYPI_PACKAGE = "zope.interface"
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "700ebf9662cf8df70e2f0cb4988e078c53f65ee3eefd5c9d80cf988c4175c8e3"
+SRC_URI[sha256sum] = "6d678475fdeb11394dc9aaa5c564213a1567cc663082e0ee85d52f78d1fbaab2"
 
 PACKAGES =. "${PN}-test "
 
-- 
2.25.1


