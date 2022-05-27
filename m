Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B38FFC433F5
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 01:36:15 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.2717.1653615370560106217
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 18:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=L40vFnVJ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653615368; i=@fujitsu.com;
	bh=2gyD4MATrnKLuoo9RS4XGhnR9emgB+3AKv0fASfNF2g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=L40vFnVJ+aexWJYGzZmvpM2DHsqzjcCY0xBY2OEgbfJQwG7aVOfsELQlP8Hkj5mbg
	 9I+RuzDQQ0bL/BVNUXhWuUjMlLR5ufpMqb5ETEbgVk/2OBmctdRb3zuEs8s00UtCGO
	 a7xwmOiQfjWJXyH/iqXyrNCDJY27NfTl8EVQJT9ncenz+x8FR5sHQG8q+/TKCIUuoe
	 NlylmvflJxyKpXoe5kzCIct6HtxzGdDjDi26Ru03Vp5QUJgJWy3FYDg4aQ1Z6ggD7V
	 97gdzwnnughfPC4JGQCrDpERS4coKrTfSglqt91EEqmRIC+5nFYZn+tZciHCBjpn7x
	 0dkBabPbCKOGA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRWlGSWpSXmKPExsViZ8ORpMuuPSH
  J4N1ndYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaNh/kqmgj2cFT+X/GZrYHzM0cXIxSEk8JBR
  Yk3TK0YI5yyTxN62b+wQzh5GiamXN7B2MXJysAmoSUy/dQPMFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLBAgMfv2fDYQm0VAVeLz7+lgcV4BJ4l/W36CxSUEFCSmPHzPDBEXlDg58wkLxBwJiYMvXj
  BD1ChKzL7czAJhV0jMmLENqldN4uq5TcwTGPlnIWmfhaR9ASPTKkbbpKLM9IyS3MTMHF1DAwN
  dQ0NTIG2sa2hipJdYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdcmZuck6KXl1qyiREYnCnF6X07
  GDfu+6V3iFGSg0lJlDfzXn+SEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneO2oTkoQEi1LTUyvSM
  nOAkQKTluDgURLhVZIBSvMWFyTmFmemQ6ROMSpKifNe0QRKCIAkMkrz4Npg0XmJUVZKmJeRgY
  FBiKcgtSg3swRV/hWjOAejkjDvU5ApPJl5JXDTXwEtZgJanM/bC7K4JBEhJdXAZBNw2L60/tO
  hpZvjnnp9j3rctaJKvK3yLfOjzcoVNlaOvZ4b7tz9GrX+R7LEEktXRtO3Zz5zc+wQ5rV4ExCy
  e8V0vgdBpju+8y6cedzrgmDj+5fJSocK03aJbSv00co6VZKofnNTthOPsUJmY3NVwb0E9uc/7
  7+U/88m+evcGaGlFS5HRBdvnXenqFHhy/o5SyY66KSXBxRZ9rmeLlHZZPB7tt7VPY5Pm2zqdu
  qHJIc0fT89XVUkeo7rhPVBb85POLzb8+DrVytm+/jPk2Sy5NYI109YOEt2iYPg53+M0dHnd1t
  y70n9Ptel4mjpEZ8dU5esluEwaymdu3BtVWmJ/4ZdhiaTK3f65KesvbSnUImlOCPRUIu5qDgR
  ADrsydRJAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-728.messagelabs.com!1653615367!153622!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27939 invoked from network); 27 May 2022 01:36:07 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-13.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 May 2022 01:36:07 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 0F002D77
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:36:07 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id E878DB4D
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:36:06 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 27 May 2022 02:36:03 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-robotframework: upgrade 5.0 ->
 5.0.1
Date: Fri, 27 May 2022 09:35:40 +0800
Message-ID: <1653615344-24799-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 01:36:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97291

Changelog:
https://github.com/robotframework/robotframework/blob/master/doc/releasenotes/rf-5.0.1.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-robotframework_5.0.bb => python3-robotframework_5.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_5.0.bb => python3-robotframework_5.0.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_5.0.bb b/meta-python/recipes-devtools/python/python3-robotframework_5.0.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-robotframework_5.0.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_5.0.1.bb
index d66fd33e8..49c97ad10 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_5.0.1.bb
@@ -13,7 +13,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[sha256sum] = "bffecba8c43d4294936d921f0af4941079039edce88194769133719732c608bc"
+SRC_URI[sha256sum] = "cf5dc59777ed9d8c3e1e91fb4403454890242867735681f22f4f22dbb2a20fc8"
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-shell \
-- 
2.25.1


