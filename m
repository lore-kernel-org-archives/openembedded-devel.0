Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED4BC7EE2E
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:25:38 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.103914.1683541533899194181
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Sq3QtsJ1;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541532; i=@fujitsu.com;
	bh=1s1xX+BSkb6/5Sua3q41KWxm8MXztWVvhQjLvSv+mMA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=Sq3QtsJ1zJR0PTSjKH8FK2kRG8VjPBfgjbAQAo2/RdcsDa8xic+Fum1BlJlcf0v5h
	 XRKz/c3fR1iY7p+MludOtgRjOWwxYUo3xmRSs/qdoTtt33QjyUqGEWqIw1eSrLTkTO
	 pThrNV3AwGYiW7j3rG+TlQJDxa2+tK8oWze+/Kx/Bon9SLtmESVRajdOOZhFyTwR6z
	 cYE98UJvv06K/Qkwn8eFM8Rs/sufEzUI4eAAg/LtF1xZmmlFOvSJGr+T0p+DobXU0V
	 sop/D58iWqrxUFK/ESqbsW0BM76P2VhglISU65FP1EDaYxFYUKpZFKNJSSu9RPlPY7
	 mCgZjSdG+nhSg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRWlGSWpSXmKPExsViZ8ORpCtzLiL
  FYNp5NouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePkvamMBes4K/Y272ZvYDzD0cXIxSEksJFR
  4vSvDcwQzjQmiYlLfzJ1MXJysAlISEzfe5IdxBYR0JX4+GEuI4jNLKAiMWPyEaAaDg5hAW+JD
  /PUQcIsAqoSJya9YgOxeQWcJNpW3QWzJQQUJKY8fM8MYnMKOEtMOrqeBaRVCKhm4/loiBI1ia
  vnNjFPYORZwMiwitGsOLWoLLVI19BcL6koMz2jJDcxM0cvsUo3US+1VLc8tbhE10gvsbxYL7W
  4WK+4Mjc5J0UvL7VkEyMwIFKKla/sYOzf9VfvEKMkB5OSKK/pwbAUIb6k/JTKjMTijPii0pzU
  4kOMMhwcShK8LqcjUoQEi1LTUyvSMnOAwQmTluDgURLhlT0ClOYtLkjMLc5Mh0idYlSUEufde
  gYoIQCSyCjNg2uDRcQlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8aWeBpvBk5pXATX8FtJ
  gJaLH/5XCQxSWJCCmpBqZ6zQc3t9YuPthdef3stav6a9d2CJo6P3KOOcSnGlmwZxWr6XeT+xL
  veWKb5m5Sk4mfPnGm3640I/Ya3QUq7fvXOrgXnth4KSfq2yPPCP+3IdUF21o/XxA+mb6nRevA
  lra7UT/C7VjnFeT98fjWuyM8Yvv+iwKepim9E331F7uZz/TY1KJ1Q/2FXf4b1naliRGJaf1NI
  tH75+1fvKji7erbNwz6/4kevj+Bm8eZRf7snyNabC4Pw090fJlQzMV7Vvj+Z37Z4+rrp/n/fm
  32OKHFNiprHc8k7iK33EPWvvqLnN2dfDNPyYlJTqgSCPK5y5DyZ/ucNqcOkQcuy02b9CI4/a5
  LcsXN+JRz5qeQtBJLcUaioRZzUXEiAPoQqcwDAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-548.messagelabs.com!1683541531!225692!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16614 invoked from network); 8 May 2023 10:25:32 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:25:32 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id D2FE21D4;
	Mon,  8 May 2023 11:25:31 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 03C931D2;
	Mon,  8 May 2023 11:25:30 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xstatic: upgrade 1.0.2 -> 1.0.3
Date: Mon,  8 May 2023 18:25:19 +0800
Message-Id: <1683541521-25835-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683541521-25835-1-git-send-email-wangmy@fujitsu.com>
References: <1683541521-25835-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102433

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-xstatic_1.0.2.bb => python3-xstatic_1.0.3.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xstatic_1.0.2.bb => python3-xstatic_1.0.3.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-xstatic_1.0.2.bb b/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-xstatic_1.0.2.bb
rename to meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb
index 8de3959450..df4b7c8885 100644
--- a/meta-python/recipes-devtools/python/python3-xstatic_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-xstatic_1.0.3.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://README.txt;md5=1418684272f85f400cebf1b1a255c5cd"
 
 PYPI_PACKAGE = "XStatic"
 
-SRC_URI[md5sum] = "dea172b7b14b0dbcd5ed63075221af4b"
-SRC_URI[sha256sum] = "80b78dfe37bce6dee4343d64c65375a80bcf399b46dd47c0c7d56161568a23a8"
+SRC_URI[sha256sum] = "402544cc9e179489441054f09c807804e115ea246907de87c0355fb4f5a31268"
 
 DEPENDS += " \
     ${PYTHON_PN}-pip \
-- 
2.34.1


