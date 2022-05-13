Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B01C433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 02:33:56 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.3723.1652409231536264417
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 19:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BSscvHxO;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652409229; i=@fujitsu.com;
	bh=qw/jfvvSwMGTX/x/hnTbdZNy3S6xNTMjS6ZLEqupZZw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BSscvHxOEpZ9jvodWYEWSDE0IPyHDZHWFVZ2BHxAxW4KKLLCmQduMVeg9gxxOZHDA
	 KpgZobCBnSyUy4OdNKVlhhlftj2c4mdWkdOaPM0hpbkFC5z9mVGdsdbDOZblbkGGGP
	 Q9bG4D0TEZ7HUsgSUEc7JBNy+1CEUQWgs5wHnli2v8j2m2KKKLxbTQscTPtZF9AG7T
	 siQ8Hd7iSaxzlu8lkEioUr24qe/rhL2aCkeado/979Fxl5uizWi3jVVRK4gnwk+QlZ
	 /KylTJkgLpRsOBg5npaCZvWTdzqRrU61YRcjUvjqab4O0G1GiVqdY+u1XWJaHnvAeX
	 LlEu8I3f7WlEQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8MxSbfncG2
  SwcFd2hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b1Ke/YCtZxVByZ9IStgfEqexcjF4eQwBNG
  ibU7e5ggnAtMEvdfL4bKnGSU2N6wFCjDycEmoC7x+OZrRhBbREBfYunsPcwgNrOAqkT3xTVAD
  RwcwgIeEg97skHCLEDhZXNug5XwCrhL/D/eDtYqIaAgMeXhe2aQck6g8uPb7UDCQkAls1cvZI
  UoF5Q4OfMJC8R0CYmDL14wQ7QqSZxY8ZEJwq6QeH34ElRcTeLquU3MExgFZyFpn4WkfQEj0yp
  Gu6SizPSMktzEzBxdQwMDXUNDU10zM11DCzO9xCrdRL3UUt3k1LySokSgtF5iebFeanGxXnFl
  bnJOil5easkmRmAopxQ77drBeLDvp94hRkkOJiVR3jfxtUlCfEn5KZUZicUZ8UWlOanFhxhlO
  DiUJHhbDwHlBItS01Mr0jJzgHEFk5bg4FES4d11ECjNW1yQmFucmQ6ROsWoKCXO67EZKCEAks
  gozYNrg8XyJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvBNBxvNk5pXATX8FtJgJaHG8Fdj
  ikkSElFQD0/IczhXv6hW9q/S3uTNMf9L6QNXNcXWgTXb7FW+2G3Lrt+xmd4n7vmnV7cWfvmkz
  HNbfIdXVHzfjoIvG1KjVmVoWerp/cnamH2lctmaxzzv9fV4BprNW+G5Ty+a6aXRD+eKOT1qKs
  xfKSEtzloRu3dYqcjr79fnZ9Sc/vYnQPaeYfrnmhJIB56v+nS+NBBkLT7FUtyR0Ch83KU9bZm
  x0y9Xg8df7ETcDveYv1rKIt35+jmP7tCU1zWJOMZYGXrw9wh8+3kqZIv4r7xXj6R0vokpy5ua
  3rvhWeSxmXtopt+NJnE/zTk7UDLt1doVcTdeb2hczF90Mn9zAWH3DV8uo1mKNQNekE3zTVFzm
  ScbOU2Ipzkg01GIuKk4EABpMpfFgAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-26.tower-532.messagelabs.com!1652409228!31521!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5835 invoked from network); 13 May 2022 02:33:48 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-26.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 May 2022 02:33:48 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3DD33100457
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 May 2022 03:33:48 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 30F9510033B
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 May 2022 03:33:48 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 13 May 2022 03:33:20 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-mypy: upgrade 0.942 -> 0.950
Date: Fri, 13 May 2022 10:33:00 +0800
Message-ID: <1652409184-13282-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1652409184-13282-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1652409184-13282-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 May 2022 02:33:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97087

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-mypy_0.942.bb => python3-mypy_0.950.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mypy_0.942.bb => python3-mypy_0.950.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy_0.942.bb b/meta-python/recipes-devtools/python/python3-mypy_0.950.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-mypy_0.942.bb
rename to meta-python/recipes-devtools/python/python3-mypy_0.950.bb
index 5b4b6d5ba..c268adebe 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_0.942.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_0.950.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "mypy"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "17e44649fec92e9f82102b48a3bf7b4a5510ad0cd22fa21a104826b5db4903e2"
+SRC_URI[sha256sum] = "1b333cfbca1762ff15808a0ef4f71b5d3eed8528b23ea1c3fb50543c867d68de"
 
 BBCLASSEXTEND = "native"
 
-- 
2.25.1


