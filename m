Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8079C77B7F
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 13:05:35 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.66054.1684069533943198696
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 06:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=anEY67zT;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1684069532; i=@fujitsu.com;
	bh=qWLeIlFuvqqaUNpq9jt3O1pGCeC63DXCpTuzs1uSmTw=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=anEY67zTy91JAc1AXxRTZn8kI1S5CNS1XQmbGTWICC6z7QIxbJOaZu2AnmV3wH5wQ
	 Foqjoz2L7lPNpEPT6vzoLBPa0hICfaE1MEELk4QgjGU6MKPsdlxG0CXQ39nLctAwr1
	 yIlRqU9WRRAn7OVqTfZ5aRP9j0o/0z4UbWo3Sy3BcUPqJy1/F5Zfz9OmebA7LiZAx2
	 RCtU10LhJddfrpJb6PAJ0gTpRlHj+VDFsxOFbqNtU/9+CArJkJxDPHl/fSMjrrVXNO
	 V6K1o/qdJk3DVLv8Yl4JXxgInAkvYDQ6kVrsS3GXnQLPnFynYFq+woTp8OxTI2BxQs
	 soWmWY80gr+cA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJLMWRWlGSWpSXmKPExsViZ8ORpDv7TkK
  KQc9zHouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPOlO/sBX+5Knp2X2BrYJzA1cXIxSEksJFR
  4u6eqewQzjQmiVnPbzJ2MXJysAlISEzfe5IdxBYR0JX4+GEuWJxZQEVixuQjTCC2sICnxLF/i
  8DiLAKqEs8//WQFsXkFnCTOXr0PZksIKEhMefieGcJWk7h6bhPzBEauBYwMqxhNi1OLylKLdI
  30kooy0zNKchMzc/QSq3QT9VJLdctTi0uAMonlxXqpxcV6xZW5yTkpenmpJZsYgT5OKVZi2MF
  4YOdfvUOMkhxMSqK810riUoT4kvJTKjMSizPii0pzUosPMcpwcChJ8OrcTEgREixKTU+tSMvM
  AYYbTFqCg0dJhDfuKlCat7ggMbc4Mx0idYpRUUqc9wBInwBIIqM0D64NFuKXGGWlhHkZGRgYh
  HgKUotyM0tQ5V8xinMwKgnz8twAmsKTmVcCN/0V0GImoMW39sSDLC5JREhJNTDZlYp6F29azO
  sv9bmJTepvb3pZ7H3Tya4yf4vdF7IYnbafKd/JM5vTU/7Hne8XXW1fT89cHj8nacaJmQ+S0k6
  mOdx0Yzx35vbdtJV8H8/0T/FSWXps3pzmzdPltviX7zNvuhGzM3fBJtMirrCpe0ueLX5TP/NY
  wZwZfl1xj3UtZ7yaayPRKcWV8rr87uI7KT/ezVtf13Q0LaLx18scKwGXIjlJ96ZSh+nVpp9OL
  OsWPlz0y67zTpmtv2Pq/ekc7JNc7DYqJc6W4/ovPYnFel0eF+tLdpvwiszJC+YJNC0o/u3QPr
  eNdYY1z4Yz2jlror+GSsX+2XuvjX2ZdNqDZk+Z4m13nyyd9PfuZ7tIz3tKLMUZiYZazEXFiQD
  oohhf7AIAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-565.messagelabs.com!1684069531!256170!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7899 invoked from network); 14 May 2023 13:05:31 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2023 13:05:31 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E80F31AE;
	Sun, 14 May 2023 14:05:30 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 1A97B1AC;
	Sun, 14 May 2023 14:05:29 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sympy: upgrade 1.11.1 -> 1.12
Date: Sun, 14 May 2023 21:05:16 +0800
Message-Id: <1684069520-12282-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 13:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102571

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023

Changelog:
https://github.com/sympy/sympy/wiki/release-notes-for-1.12

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-sympy_1.11.1.bb => python3-sympy_1.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sympy_1.11.1.bb => python3-sympy_1.12.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.11.1.bb b/meta-python/recipes-devtools/python/python3-sympy_1.12.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python3-sympy_1.11.1.bb
rename to meta-python/recipes-devtools/python/python3-sympy_1.12.bb
index 4e32936384..bfb0985ef6 100644
--- a/meta-python/recipes-devtools/python/python3-sympy_1.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sympy_1.12.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Computer algebra system (CAS) in Python"
 HOMEPAGE = "https://pypi.org/project/sympy/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9f6c7fdc2d69e31ad7abaea029c8ac16"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ea48085d7dff75b49271b25447e8cdca"
 
-SRC_URI[sha256sum] = "e32380dce63cb7c0108ed525570092fd45168bdae2faa17e528221ef72e88658"
+SRC_URI[sha256sum] = "ebf595c8dac3e0fdc4152c51878b498396ec7f30e7a914d6071e674d49420fb8"
 
 inherit pypi setuptools3
 
-- 
2.34.1


