Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F7FECAAD4
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:56:03 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.32931.1661482561630702736
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:56:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=y5eYydDk;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661482559; i=@fujitsu.com;
	bh=WVPAi+LwVuhinCEus+2V3Pxa1Ho7AAR/1PabklmhefY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=y5eYydDk8YfP/W5rvGy/QHOfimXZCZOSxGKfK44bT8UbUHDoVvaZwnyUmc9Wkqde0
	 mJCnwoVm8/B9qs6oF7P5JrLZx6XWfs7SZRAUO8YO+1ld7NWatLa2qWpBKqHotf2zyI
	 P+Kuo8+1ORUcXMD9aQ8Lg78GPkzMtgJc/HSOjQtJSR9ogWB7Mv7oIyqtpkdfmllw2j
	 Hgfo4k1if6Gsn90qnqEvuHuDMJYGu07CJuOkUZtIdjr0hp5voTTbK9UWMeA0rRMM7Z
	 xuJ2yDt+UTiMmt48f8uIrO34NhtU6SnyJSTd08Kwp/6CiJW/KqqGKzZHECUvx9HGMk
	 mSBgo9HEwjNow==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRWlGSWpSXmKPExsViZ8ORqGtnxpF
  ssHcPt8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnF2bj9jwROuinMb3zM1ML7m7GLk5BASeMIo
  8e1oXBcjF5B9g0miY8I0RgjnFKPEtven2UGq2ATUJR7ffM0IYosI6Essnb2HGcRmFlCV6L64B
  qxGWCBQ4u6MH2BxFqD45HO9YHFeAXeJloWHwGwJAQWJKQ/fg9VwCnhIfNy/lQXiCneJZ+c2MU
  PUC0qcnPmEBWK+hMTBFy+YIXqVJE6s+MjUxcgBZFdK3HicChFWk7gK1DqBUXAWku5ZSLoXMDK
  tYrRNKspMzyjJTczM0TU0MNA1NDQF0sa6hiZGeolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesWV
  uck5KXp5qSWbGIGBnFKc3reDceO+X3qHGCU5mJREefWfsScL8SXlp1RmJBZnxBeV5qQWH2KU4
  eBQkuBVM+FIFhIsSk1PrUjLzAFGFUxagoNHSYRXWhQozVtckJhbnJkOkTrFaMkxdfa//cwcy8
  HkzK9tB5iFWPLy81KlxHl9TYEaBEAaMkrz4MbBIv8So6yUMC8jAwODEE9BalFuZgmq/CtGcQ5
  GJWHeVEOgKTyZeSVwW18BHcQEdJDUBnaQg0oSEVJSDUziSwJNNt8Ui+l16tA758Lm47vrvjWD
  30St7KqgU0mCDQ94jmlUTyxVMa6Ojb3a9nNTpudbH+nrH18rKFqvaA+dzLnIfdvviUr56eaTu
  nyuh30z1vt8h1Vvmomc1rOODwZXnrxuMZP5pX7GcVn/4rUC6xZG7hPQui64O5fj7dmiTTN+/j
  t/+0nfLAuPpAqlsKKoix4vZE5+4/xQ5LuO8fCbWqn+xkNp1v+dnmhNVZ4uU+7ye1/f73bDLf8
  T/cSjD5S5HXLzXPyDzVCtN/bI5fLp66f3RV67drc6vvSOb5/H6blPiqo8mTWWTel59jr9XmOH
  qfrGg4mPRN88bRJpEv20fdJ38UUu25+X3J0rX6PEUpyRaKjFXFScCAC+PpvbdwMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-745.messagelabs.com!1661482557!164414!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9766 invoked from network); 26 Aug 2022 02:55:58 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Aug 2022 02:55:58 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 97ED3100198
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:55:57 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8BA4D100197
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:55:57 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 26 Aug 2022 03:55:55 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.10.0 ->
 2.11.0
Date: Fri, 26 Aug 2022 10:57:04 +0800
Message-ID: <1661482626-30776-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661482626-30776-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1661482626-30776-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 02:56:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98458

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
=========
Features
---------
    add integration tests for configurable token lifespan (#1103) (124bae6)

Bug Fixes
--------
    Async certificate retrieving (#1101) (05f125d)

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...hon3-google-auth_2.10.0.bb => python3-google-auth_2.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.10.0.bb => python3-google-auth_2.11.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.10.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.11.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.10.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.11.0.bb
index 610a4d7dd8..d1698f5931 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.11.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "7904dbd44b745c7323fef29565adee2fe7ff48473e2d94443aced40b0404a395"
+SRC_URI[sha256sum] = "ed65ecf9f681832298e29328e1ef0a3676e3732b2e56f41532d45f70a22de0fb"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


