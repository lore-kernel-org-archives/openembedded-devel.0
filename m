Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B97C7EE2C
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:19:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.103820.1683541182329369640
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oqGR00+a;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541180; i=@fujitsu.com;
	bh=vXfOeAoprBbn61UTnS8eOYtc2MdBTk6OdwDKH2rElkQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=oqGR00+anA5mOdBwH+c/YR992FGa+/FAzJajJcDk/64irBVx4REtfLWVDRsXQkgKP
	 BYTARSWTbrpFD3g9f73JCN6KuOWrcZ/TRQyCdJ8Gt3ceRVd9cACeVB6Quc1zJPdbp5
	 PCw2pHl3cApHCVukULDY4bQsS0VbsTXoKeWfnEjmNRX4l5eBj//1MrFnr/DUo+fbfT
	 4raDz3lBLLT7nBfiMqgfsP6g7/KoqJWC/SvyMSy7iGkNrRxrJPWrSh8bQezbQIyDFk
	 HOQ3rHxi3yroI2FuQfMe64FrEkZR5Qz15gfZJVmJiu7RsoOqP3b7yKSgtTuuYfoYbZ
	 VxmjjdEs//4IA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRWlGSWpSXmKPExsViZ8ORpLv7TES
  KwfOvVhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aGbRwF97gqljfOZG5gfMnZxcjFISSwkVHi
  8/oWNghnGpPElbOtLF2MnBxsAhIS0/eeZAexRQR0JT5+mMsIYjMLqEjMmHyECcQWFgiS6J/zH
  qyGRUBV4uHrS2A2r4CTxOXlT8FsCQEFiSkP3zOD2JwCzhI9f26C2UJANZ3fnjNC1KhJXD23iX
  kCI88CRoZVjGbFqUVlqUW6pnpJRZnpGSW5iZk5eolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesW
  Vuck5KXp5qSWbGIEhkVKcPHUH49Odf/UOMUpyMCmJ8poeDEsR4kvKT6nMSCzOiC8qzUktPsQo
  w8GhJMHrcjoiRUiwKDU9tSItMwcYnjBpCQ4eJRFe2SNAad7igsTc4sx0iNQpRkUpcd6ZIH0CI
  ImM0jy4NlhMXGKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzMsAjDAhnsy8Erjpr4AWMwEt9r
  8cDrK4JBEhJdXANL/MbPnqHfOWWHC8CD6817uDd6um9pK+0KXHjybfyzTXcXbu5lezSUk7n/7
  9jMNHmSnXC3Lbs9YJmj7Z+Vrz9H+WrIqYkBUzsrL/KSxIymz8mnnOanNp2eTnx/NfbSq3WOYv
  8/6ht6HrlZuzCnqXZqb7Rno+3Xf+wey9VTvf320Xey+Xf0x2o+/J78z3ld9c5zi9cB//PoP57
  /QCD5cmn/muka1zU3GR8m9Dw339LiaT88zSLhuLVG9WU06zP/BY3+6tDsfPMN9z83cLBn42OH
  xTUk/mWY98/d2SH59e5D88rqcelHjyg+e2K357tl4Q/Ra86W7DxmLe/Pervk6w+bzucFTFyfW
  fLGQDMm+43FFiKc5INNRiLipOBAAP6T79BAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-728.messagelabs.com!1683541179!496375!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17191 invoked from network); 8 May 2023 10:19:39 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-12.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:19:39 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 68CD21D2;
	Mon,  8 May 2023 11:19:39 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 8E2551C2;
	Mon,  8 May 2023 11:19:38 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flask-socketio: upgrade 5.3.3 -> 5.3.4
Date: Mon,  8 May 2023 18:19:26 +0800
Message-Id: <1683541169-25445-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683541169-25445-1-git-send-email-wangmy@fujitsu.com>
References: <1683541169-25445-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102412

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
Fixed cookie handling in Test Client for Flask >= 2.3 #1982
Correctly handle ConnectionRefusedError in connect handler #1959
More secure nginx configuration examples #1966

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-flask-socketio_5.3.3.bb => python3-flask-socketio_5.3.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-socketio_5.3.3.bb => python3-flask-socketio_5.3.4.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.3.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.4.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-flask-socketio_5.3.3.bb
rename to meta-python/recipes-devtools/python/python3-flask-socketio_5.3.4.bb
index 0327d0d8c7..4dae0d14ba 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.4.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "Flask-SocketIO"
 
-SRC_URI[sha256sum] = "8f47762dd1b76916cbc01f4f8661dd4670dbeb418ca0e1aaedab909b85efee5d"
+SRC_URI[sha256sum] = "1cbd379c9bf68ac37bcc4750d01708922fa6365d13a5447d3f8893792879410c"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-flask \
-- 
2.34.1


