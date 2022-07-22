Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7AA2C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 10:16:39 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.18118.1658916995458283903
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 03:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZL1/ih2t;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658916993; i=@fujitsu.com;
	bh=yuCO4RctcaZBcbNlUK9y++Nl2uNDMeagCc2kXGXFx18=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ZL1/ih2t4PdgVXGLU8MOunq6NNuBgsBh8zuD9/CE5msHbq8l+GF4cClo70xWf7YgI
	 PXrh7Uw9Yzgb6sqOuSiQCDVcSDHDoEJ4AeiGLu3T80a9S6vlQB1CQMalpJMjd/PSqa
	 sY2GgZgvHX3etoYpnTUlRDKSt4K8jYX5PiRUVjQpxkI82uxXKO7MlfmONWcxrsmLUo
	 lmk4wvlxCWcNs1t6JSp8VXE4fYv0ZNbje1k3mXdXQjhMcqDrikiWaSW/xWJaRdKQRM
	 q6YALgJkgZLRS77bKQCSD3TBrAyr2SXPGmiYXsXYStemwVTbyMKqG26fsfPPAzEvho
	 Db+6k+fNOD2iQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8OxWbdB4GG
  SwdFP0hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0Z/0wWmgk7Oik+nu1gbGFdwdDFycQgJPGSU
  eDzjBhuEc5lJ4vL+TlYI5wCjRPvzDqAMJwebgK7Eix+LWUBsEQF9iaWz9zCD2MICHhI9q5oYQ
  WwWAVWJLZ96wGp4geKrW7eAxSUEFCSmPHzPDBEXlDg58wlYDbOAhMTBFy+A4hxANYoSs6fLQ5
  RXSLw+fIkZwlaTuHpuE/MERr5ZSLpnIelewMi0itEmqSgzPaMkNzEzR9fQwEDX0NBU19Jc19D
  YUi+xSjdRL7VUNy+/qCRD11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwAFOKE7t3MK7e90vvEKMk
  B5OSKK/72wdJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR493I8TBISLEpNT61Iy8wBRgNMWoKDR
  0mEN5kXKM1bXJCYW5yZDpE6xWjMcXfh3r3MHDO/th1gFmLJy89LlRLnjeEDKhUAKc0ozYMbBI
  vSS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeWfzA03hycwrgdv3CugUJqBTtig8ADmlJBE
  hJdXAxOy6oLalZGte/I/HWlWs1m0GdV8WcvPvvG635LjRl5i8vQxhPVv8T22QuJt0j138n37k
  qh+GTD+f/G+78IRLtjE62L7h9b8Jnrl/3NfN/u3iV1v1XHzJvtblWTYPbjAqMu1f8uX9+oq/O
  jnfZFb4//szc/2jPC3rai0d5yWpptK89s23noj5fHHy3ctvG6yY8Gr6oa9Z12oeSwWX3bllL8
  gb+HfB5oP7OY+3f7n9+cCD398m3vI4YxKjNjf0XWVE2ZO6hQqX30gVbxFJvvi/5ajZwvOy95k
  i9I6tufO78lNTjcLWpXszhTL1eTbI9VqVf1Xo/ji5hm/aYdZVQq/VFN/yTHihcuU9/4/Ki62r
  85RYijMSDbWYi4oTAeHL7rhNAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-732.messagelabs.com!1658916992!230176!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18334 invoked from network); 27 Jul 2022 10:16:32 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-20.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jul 2022 10:16:32 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id D62BA151
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:16:31 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id C9FC575
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:16:31 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 27 Jul 2022 11:16:30 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-absl: upgrade 1.1.0 -> 1.2.0
Date: Fri, 22 Jul 2022 12:02:53 +0800
Message-ID: <1658462573-26038-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Jul 2022 10:16:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98008

Fixed a crash in Python 3.11 when TempFileCleanup.SUCCESS is used.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-absl_1.1.0.bb => python3-absl_1.2.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-absl_1.1.0.bb => python3-absl_1.2.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-absl_1.1.0.bb b/meta-python/recipes-devtools/python/python3-absl_1.2.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-absl_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-absl_1.2.0.bb
index e3f7c4c6ae..42b3ddc93a 100644
--- a/meta-python/recipes-devtools/python/python3-absl_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-absl_1.2.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "3aa39f898329c2156ff525dfa69ce709e42d77aab18bf4917719d6f260aa6a08"
+SRC_URI[sha256sum] = "f568809938c49abbda89826223c992b630afd23c638160ad7840cfe347710d97"
 
 PYPI_PACKAGE = "absl-py"
 
-- 
2.25.1


