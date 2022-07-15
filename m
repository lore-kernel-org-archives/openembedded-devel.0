Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD5FC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 04:28:13 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.2925.1657859287543919285
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jul 2022 21:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=r7sIORDi;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657859285; i=@fujitsu.com;
	bh=a1wSFveNqRNkFyMWBA6/W2bFUR0EeU0vsjHdPwIH9UI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=r7sIORDiwGzfv8OjKT1LDLjTTz0+He2osI1SCkzVaO7EFxDu8kjPgVMbY01SUiPiw
	 wO/wD/5AFkrALCdWvZ+zoK1XceOaheo092s0pPECICa88X8iQGiCAAvea+fcEzKJEy
	 KqeYA/aOpEN2ywXXNcWB1Wms+Um1jeYyH+NC5FpPneIf3zqL+GmnLSi/4F5Pp8K7OH
	 X/J59HPyGhMILm451TLJPzQI6BFniq089oT7SYmPOe1wsHjw5NALDiFzQkM+POCsAW
	 SrjLV4fRuZ+13Ck08bgVVeq45n2Bc1qCqkBEq+vQiH4mAvMKcYJgc/IuFWVUpoWX0B
	 xGRT8FS4ggXVg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8ORpHv1zYU
  kg3/TFCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ow791tZCmZxVXRcP8zSwDifs4uRi0NI4CGj
  RM/W3UwQzmUmiVuH25m7GDmBnAOMEmcmsYHYbAK6Ei9+LGYBsUUE9CWWzt4DViMsECjx5GAfm
  M0ioCoxqe8qI4jNK+Ah8Xj3XlYQW0JAQWLKw/fMEHFBiZMzn4DNYRaQkDj44gVQnAOoRlFi9n
  R5iPIKideHLzFD2GoSV89tYp7AyDcLSfcsJN0LGJlWMVolFWWmZ5TkJmbm6BoaGOgaGprqmug
  aGVvqJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEhl5KMcv7HYxNfT/1DjFK
  cjApifIeyr+QJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCV/0lUE6wKDU9tSItMwcYBzBpCQ4eJ
  RHeFa+A0rzFBYm5xZnpEKlTjIpS4rwlD4ESAiCJjNI8uDZY7F1ilJUS5mVkYGAQ4ilILcrNLE
  GVf8UozsGoJMyb+hpoCk9mXgnc9FdAi5mAFj/0BVtckoiQkmpg6sicvICPNXHN4d2HmNav2rP
  fp+XdVxGRcK3LFRd/BYpf7NdtOil+p2bW94iXDCmrYq0ePLi1yv68h7fTwjXS3Zu/ZK2b1clw
  efEu2TmBclOiF1R//RbFuCrt+k77w0vENPrfuKgamIVcb6vcKio65UwslxTH86KjzQf3JF0/8
  o1zmfbp/Ru+pV6awsmrmSq4lG9CdF3o/rs8XI81uX2+ycfJ9zn63Nlh5jx149LEh/n/r0hocp
  5p07WZI2ceKdWxwFgl+9t8y0Unr+xIDdx7ZtHlEAlZnXgTo1ymMjbOHK4/fRHzL8tprft1MXb
  B3Hkfmzedcszq/fLVbb7Ol6l77J7bvHkcXmT0Un564J+yN0osxRmJhlrMRcWJAE+E5So4AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-591.messagelabs.com!1657859285!336912!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31324 invoked from network); 15 Jul 2022 04:28:05 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-11.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Jul 2022 04:28:05 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 28D371AD
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 05:28:05 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 1DC427C
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 05:28:05 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 15 Jul 2022 05:28:03 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] [oe] [meta-python] [PATCH] python3-redis: upgrade 4.3.3 ->
 4.3.4
Date: Fri, 15 Jul 2022 12:27:58 +0800
Message-ID: <1657859278-15185-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Jul 2022 04:28:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97837

Add dependence asyncio

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-redis_4.3.3.bb => python3-redis_4.3.4.bb}  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_4.3.3.bb => python3-redis_4.3.4.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_4.3.3.bb b/meta-python/recipes-devtools/python/python3-redis_4.3.4.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-redis_4.3.3.bb
rename to meta-python/recipes-devtools/python/python3-redis_4.3.4.bb
index 66051d420..e0f953ca4 100644
--- a/meta-python/recipes-devtools/python/python3-redis_4.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_4.3.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51d9ad56299ab60ba7be65a621004f27"
 
-SRC_URI[sha256sum] = "2f7a57cf4af15cd543c4394bcbe2b9148db2606a37edba755368836e3a1d053e"
+SRC_URI[sha256sum] = "ddf27071df4adf3821c4f2ca59d67525c3a82e5f268bed97b813cb4fabf87880"
 
 inherit pypi setuptools3
 
@@ -12,4 +12,5 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-cryptography \
     ${PYTHON_PN}-packaging \
+    ${PYTHON_PN}-asyncio \
 "
-- 
2.25.1


