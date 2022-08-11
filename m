Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09275C25B0E
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 02:31:42 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.24432.1660703501239814142
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 19:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EzzF7myZ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660703499; i=@fujitsu.com;
	bh=+hrrZPz7QlTCYHrEyZXQamVsTzNJexaesgfJ9jpF08g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=EzzF7myZDHM7lfXci1DgiCpcO1x3jUZYVT+ZbtBSZyrU3RVfDRNplpeJjX3VBX40B
	 8Z5+1dX5DefxknrNq5guBksMlpz3Ut3gLqTkkGDFzNdySRP/nOAvblym+bxX6MwxO5
	 aQTlcGNbtxo7mVFcde+z5Y80EK3HLr5mYj6Reh8fqv3sUfljf/pTQjS+ZJqWACfwpf
	 BrptliSUSklvVaS8XRsuSYWt+iJhSaJJGFuVJBthkG/Uxg7OWzoxkIInlBfihrbZNk
	 TnEcMaUrqEWWH/onICGd1LQ0KRhYS3NwOGXHVPJYpxnuq6U13G2ZhUAMyKBsAY7K8M
	 E171AtEtwvuag==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8ORpMsd/Cf
  JYMdfNouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNn/x6mgjVcFZ/uhTUw7ubsYuTiEBJ4yCgx
  +cxhVgjnCpPEzBufWCCcA4wSJ5f/A8pwcrAJ6Eq8+LGYBcQWEdCXWDp7D3MXIweHsECYxMp2C
  ZAwi4CqxOULzawgYV4BD4l58/1BwhICChJTHr5nBrF5BQQlTs58AjaFWUBC4uCLF2BTJAQUJW
  ZPl4cor5B4ffgSM4StJnH13CbmCYx8s5B0z0LSvYCRaRWjbVJRZnpGSW5iZo6uoYGBrqGhKYS
  2NNdLrNJN1Est1c3LLyrJ0DXUSywv1kstLtYrrsxNzknRy0st2cQIDL6U4pSjOxiP7fuld4hR
  koNJSZS3n+lPkhBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3nv+QDnBotT01Iq0zBxgJMCkJTh4l
  ER4ZQOA0rzFBYm5xZnpEKlTjMYcdxfu3cvMMfNr2wFmIZa8/LxUKXHetz5ApQIgpRmleXCDYB
  F6iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw7z5voCk8mXklcPteAZ3CBHTKsYu/QU4pSUR
  ISTUw6WS/XpFg+5dv6Y+rqSuuhTz6qLepaZJNBnfLOtkZaT9b6zsDouXufl2bJe3LIM1y2ik0
  Qilodn2paKL1e935aprWivt3soQr7TOM7RRQ9Z+/wD3yDvfLRYU95yKsPj6tarwpq/nnaH2Zi
  v2KqOALTryrgoMKbx/3OLNhtnrWyp+B/DN6Ux5UbJOfsD5q5pTWE0lLKgwuJbN0+AZNVdwhlj
  VD5fWv+MpIrSD27ZNvq+tEPiloZPY1ezCt7XflWsnD305bqfrG77OfG+9TaHs+dgazhPnhn4t
  /i4oJhizOs+nQm2yfvPEq++bYHNEjvNcrsgzTH+pbcrrfmRj88k2Mr57hb9VXDlGL+G5HWSux
  FGckGmoxFxUnAgB2/AbLSwMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-745.messagelabs.com!1660703498!307324!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24138 invoked from network); 17 Aug 2022 02:31:39 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Aug 2022 02:31:39 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 869841AE
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:31:38 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 7B7041AC
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:31:38 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 17 Aug 2022 03:31:37 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.38.7
 -> 0.39.0
Date: Fri, 12 Aug 2022 04:18:06 +0800
Message-ID: <1660249086-20341-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 02:31:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98276

Add dependence python3-async-timeout

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-zeroconf_0.38.7.bb => python3-zeroconf_0.39.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.38.7.bb => python3-zeroconf_0.39.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.38.7.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.39.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.38.7.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.39.0.bb
index 3f67f5fc81..9b1576372c 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.38.7.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.39.0.bb
@@ -3,11 +3,12 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bb705b228ea4a14ea2728215b780d80"
 
-SRC_URI[sha256sum] = "eaee2293e5f4e6d249f6155f9d3cca1668cb22b2545995ea72c6a03b4b7706d4"
+SRC_URI[sha256sum] = "7c0d8257b940ee43e637fb560c2f9bd79da0638f37af162eb4f506f7274ef8e4"
 
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-ifaddr \
     ${PYTHON_PN}-asyncio \
+    ${PYTHON_PN}-async-timeout \
 "
-- 
2.25.1


