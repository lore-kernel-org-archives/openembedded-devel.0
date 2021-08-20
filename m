Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web09.82061.1629452317707037711
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Aug 2021 02:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aVPpMXgX;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629452315; i=@fujitsu.com;
	bh=hQp+Kcv/uXdgL+exRO//Lf4K7jFosCf44HcGVGCNaFI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=aVPpMXgXc/aLlsT4u6GDENR0lfvlAG27htPsDKYdqWq8WanaaltvlRd84n94huguE
	 UHlDvVnBtMdK2f4k1GPlOwE01EMaKklSLqxozB0NHvIQuvLbOKUDu8Y6Y4okjFSRn+
	 UQdRzZKmRWFy2JDLX2+Q0DM8xtcBG6b8Fs8aKBEjDHdyWYDx+/Wnb7uko9iAq/5lBV
	 EQWQMVfJ9U/T23hvQd7pb7OR8/2EH27BEc132j/lUT03w3qMUOxxyYfDbMk+ZxNJQh
	 JsqAkfi6tVHt7O2aE9i2HPs6pegbiK/i0ZvFed/VOwG+KfwhlVH0kuxFJw19Fwjjas
	 bYgsfd97TpKQg==
Received: from [100.113.7.180] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 5E/62-12437-B187F116; Fri, 20 Aug 2021 09:38:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+EI1ZWqkE8
  0eLlO3+Li4aXMDowe5zauYAxgjGLNzEvKr0hgzXj0YiJjwXreipvHF7A3MC7m6WLk4hASmM0k
  8fXQK1YI5wSjxLUzN9i7GDk52AR0JDpedLOA2CIC+hJLZ+9hBrGFBeIk1lw6AlbDIqAq8ebRZ
  7A4r4C7xIaTh8HqJQQUJKY8fA8VF5Q4OfMJWJxZQELi4IsXzBA1ihLbd56Bqq+QeH34EvMERp
  5ZSFpmIWlZwMi0itEyqSgzPaMkNzEzR9fQwEDX0NBY11zXyNRIL7FKN0kvtVQ3OTWvpCgRKKu
  XWF6sV1yZm5yTopeXWrKJERhKKYXsf3YwXn/9Qe8QoyQHk5Ior6qZfKIQX1J+SmVGYnFGfFFp
  TmrxIUYZDg4lCd5LZUA5waLU9NSKtMwcYFjDpCU4eJREeIuLgNK8xQWJucWZ6RCpU4yKUuK83
  uVACQGQREZpHlwbLJYuMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmnQWynSczrwRu+iugxU
  xAi4VUZUEWlyQipKQamPjZP1yJXMO902flkrmytpfW2WU7v3pxbPLsf1Zm/yvqWKbUngldLet
  wjWuW8uL1T17NPbMlIPzChzO2TCx8ZfdeNux/W9sWd+S24ZkTMzg8Go8/f7dbkm3hjUiVnOeH
  NwV2zD9zJNkvNpb9lfn8Ow0b76be1DP42L8seN7uHUc//tBzdPgfm/dfzPDGogUNe5/yvmVLn
  dietl+uQLrukvXN93Fve9OD3v3ruhzjaLVu+rE5cu7bdA0VPn3iyixfnSvr0pY1W2See8/Pyw
  tnb3sp3hj3nbPzV55Z10p/zxtWG/ey7vC563H6G8fzXbMtfVdPbPJ8e+5hpxB30C/NhREssev
  3v36y+YPeZNf8pwUblFiKMxINtZiLihMBz+HXnCADAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-238.messagelabs.com!1629452314!136031!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7051 invoked from network); 20 Aug 2021 09:38:34 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-3.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Aug 2021 09:38:34 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17K9cYLO005171
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Aug 2021 10:38:34 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 20 Aug 2021 10:38:32 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.15.0 -> 2.17.0
Date: Fri, 20 Aug 2021 17:38:24 +0800
Message-ID: <1629452304-16504-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Features
apigee: update the api
bigqueryreservation: update the api
chat: update the api
cloudbuild: update the api
cloudscheduler: update the api
contactcenterinsights: update the api
dialogflow: update the api
displayvideo: update the api
monitoring: update the api
networkconnectivity: update the api
notebooks: update the api
retail: update the api
servicenetworking: update the api
sts: update the api

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...ent_2.15.0.bb => python3-google-api-python-client_2.17.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.15.0.bb => python3-google-api-python-client_2.17.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.15.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.17.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.15.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.17.0.bb
index 6172cd28f5..4975b2a5e1 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.17.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "8375489232823f44c601196a960505e03ec58c95ddb6415c6b1d1d76b468f8ba"
+SRC_URI[sha256sum] = "20bc8f711883f9f8f96d96bc44b40ad0e2b0a9ef7df53e7c738948584fddd1c2"
 
 inherit pypi setuptools3
 
-- 
2.25.1

