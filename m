Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF062C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 09:09:47 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web12.24553.1640596186141102637
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 01:09:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vKKpCt4n;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640596183; i=@fujitsu.com;
	bh=okj4VnPCi0wViY36rA5tGbwXPFB5rqA6JmDBN8KjigQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vKKpCt4nvUHIHQy7B9NGJ0MuJDId/82WjmeKJpdmXc+8GViOK9E6ntPgsvxFjfm0j
	 IyImuv+yQTdgCfe+7ShxiHF+LR1Y+X0PvZPW+4nm0PnGa3SU2x2/3sw7UtsOyy0v3g
	 VzHq5sVoMa4wkQtJqUN946KOexWslcsnumcg3FV6ma4s/MD7/JA+oyuu8IfzFDamHR
	 5qltJ9gFi/3j9OZTPA3zMU/DXSKfk8dSfp8W95DG0SWdJgXBVoCMfmHLpbExD31lV7
	 Bggk3VhmbUj/Xmx3x2XS2Df38Y/JdfljW5epfeKp4bC7r+ShNQ6DfGr+H4Ol9JJDUc
	 iSnL2SsuZM2tQ==
Received: from [100.115.70.228] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 EA/AA-07141-7D289C16; Mon, 27 Dec 2021 09:09:43 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRWlGSWpSXmKPExsViZ8ORqHu96WS
  iwd9uYYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPGgz1MBY84Kh79XMjUwNjF0cXIxSEk8IRR
  4trT/+wQzgUmiVfHV7BCOCcYJR692c/WxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAr8TdI6eZQGwWAVWJE08Ogtm8Ak4SZ3pXMYLYEgIKElMevmeGiAtKnJz5hAVijoTEwR
  cvmCFqFCVmX25mgbArJGbNamOCsNUkrp7bxDyBkX8WkvZZSNoXMDKtYrRLKspMzyjJTczM0TU
  0MNA1NDTVNTPXNTQz00us0k3USy3VTU7NKylKBErrJZYX66UWF+sVV+Ym56To5aWWbGIEhmdK
  sfOyHYzv+n7qHWKU5GBSEuWNTj2ZKMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC90cjUE6wKDU9t
  SItMwcYKzBpCQ4eJRHe/yBp3uKCxNzizHSI1ClGRSlx3i0gCQGQREZpHlwbLD4vMcpKCfMyMj
  AwCPEUpBblZpagyr9iFOdgVBLm9QFGuxBPZl4J3PRXQIuZgBbPdDgOsrgkESEl1cBk+nhh8fO
  br7Yu/lrRu7f1VYtQTK72nfpq8d1e+szhUy7tuJS7TXRNYG/Zf7sU1v3r+17Gn91jv2J+r3oh
  Y4PK/kg+mTm//dLdur89fuiQ5PW/NP7gKZaGyKN1f165ai5Y2ZznG515Z5bGnNyiCe579JsZC
  2ri5C/F/FTnu+SRZbYzRHRaUhfXZKlVwk38ya56O3xO5Hiq//YvWcduWBvPeOpvx9TJAqdKs6
  c+ju7kflI50+it+GvvxMXn7hjsdllz3k76wOP2TYsu3Lt/aaHYqXUvgnYaWDdME5TfuGNahw3
  rq+KjrlslV+88/HZBVN2zXNcvRrNe//fetIU558/6yF0Rdbc2KBau0WBptnVQYinOSDTUYi4q
  TgQAY8bJFUoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-532.messagelabs.com!1640596183!204661!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13073 invoked from network); 27 Dec 2021 09:09:43 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Dec 2021 09:09:43 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C78301001A3
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 09:09:42 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BAA4C100188
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 09:09:42 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 27 Dec 2021 09:09:24 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ipython: upgrade 7.28.0 -> 7.30.1
Date: Mon, 27 Dec 2021 17:09:15 +0800
Message-ID: <1640596155-22239-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 09:09:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94506

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_7.28.0.bb => python3-ipython_7.30.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_7.28.0.bb => python3-ipython_7.30.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.28.0.bb b/meta-python/recipes-devtools/python/python3-ipython_7.30.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ipython_7.28.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_7.30.1.bb
index c5d05a8da..6b829811f 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_7.28.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_7.30.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "2097be5c814d1b974aea57673176a924c4c8c9583890e7a5f082f547b9975b11"
+SRC_URI[sha256sum] = "cb6aef731bf708a7727ab6cde8df87f0281b1427d41e65d62d4b68934fa54e97"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.25.1


