Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44DCC433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 07:23:03 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web11.6302.1634196182089212543
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 00:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VpGIYJv4;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634196179; i=@fujitsu.com;
	bh=6Wq2i0xyXnwtFBGrQRALFPlj4x64hTBda/7BW+Iui0g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=VpGIYJv4+wORd8U+nvyeStQnQts8Aj9R+qjfZc8FhOpchkNh5tboVKhTPlNIz0frF
	 3mng7xboLyqcYh2Y1nhyF57jbBq8fUwFFc3mTfWHgPPyPUmYa5DJdQAKnOIT5khNpM
	 JrIP9ZN31/auB7lG1EguPCdPhomJLoRoFWIlYqKxvhf2iItvovLoI7ILcbvwl5eUFC
	 Dzfh+gnt3z9cSk2Z3zt+qNQMkKM/g0ouM+vXSKYf27uSYxBxfRX3sU/ksnPTmgVVaO
	 fjEWOo03ehVeWv8S/bAoMW8vqPWaKNfOgzp0P+2GoRVSzicGtdK03sRtIzID6wFoGY
	 Ad36rYPK5JUAA==
Received: from [100.113.6.246] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id A0/22-09058-3DAD7616;
 Thu, 14 Oct 2021 07:22:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+EI1b18Kz3
  RYPF/FouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNTO1vBXt6KwzuDGxgn8XQxcnEICcxmkug4
  9Yuli5ETyNnDKDH3gSeIzSagK3Hu8Vp2EFtEQF9i6ew9zCC2sICnxI/OWWwgNouAqsSpnx1gv
  bwCHhI9Lx6C1UsIKEhMefieGSIuKHFy5hOwGmYBCYmDL14AxTmAahQlZk+XhyivkHh9+BLzBE
  aeWUg6ZiHpWMDItIrRMqkoMz2jJDcxM0fX0MBA19DQWNdU18jAUC+xSjdJL7VUNzk1r6QoESi
  rl1herFdcmZuck6KXl1qyiREYQimFrCd3ME5680HvEKMkB5OSKO++c+mJQnxJ+SmVGYnFGfFF
  pTmpxYcYZTg4lCR4K28A5QSLUtNTK9Iyc4DhDJOW4OBREuFVuAmU5i0uSMwtzkyHSJ1iVJQS5
  90KkhAASWSU5sG1wWLoEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3tUgU3gy80rgpr8CWs
  wEtDgwKgVkcUkiQkqqgSnyumedZNdGq9ur63d5dJ+8JtN05vKdnXsnaovNXlnwZ9oZo5J1QZk
  TN5iuuTyluebcIhsvwY3NF/ysQ8wy182cY7Mr7GjD2uToJZtF2b+uXdRzet59y/PlHfbH2958
  F3i1OejipU+Tvxr9f3J+87WqFv2P/DM3xZtuKxM5xpmQuYTnTIvQU9UZ304/zj6bMV+vrtKjW
  2eD1+YtARn8v4oUVTq7bHgnCJclFDzJbbryvPPLB5WFWYXHLlfwrS/9lKJiybhort7HazPDp8
  Yw9fg4b3y6tGOlyPmk1t/p37/mNJz2aTp/4UNxXkezBPturQ9L+KXefn6YltTBcplNxW3tZr/
  e5AX6WufnZRcUVb9WYinOSDTUYi4qTgQAZ+FigRwDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-245.messagelabs.com!1634196178!133283!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20398 invoked from network); 14 Oct 2021 07:22:59 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-9.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Oct 2021 07:22:59 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19E7MtTU012252
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 08:22:58 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 14 Oct 2021 08:22:54 +0100
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-ujson: upgrade 4.1.0 -> 4.2.0
Date: Fri, 15 Oct 2021 00:22:39 +0800
Message-ID: <1634228559-12446-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 07:23:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93287

Added
Add a default keyword argument to dumps (#470) @garenchan
Add support for Python 3.10 (#472) @hugovk
Build 32-bit wheels for Windows (#481) @hugovk
Build PyPy3 wheels for manylinux (#475) @hugovk
Build wheels for musl aarch64 (aka ARM) Linux (musllinux_1_1_aarch64) (#478) @bwoodsend
Build wheels for musl Linux (musllinux_1_1_x86_64) (#476) @bwoodsend
Changed
Use declarative setup metadata (#477) @hugovk
Wheel building updates (#473) @hugovk
Rename master to main (#471) @hugovk
Replace README.rst with Markdown (#479) @hugovk

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-ujson_4.1.0.bb => python3-ujson_4.2.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_4.1.0.bb => python3-ujson_4.2.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_4.1.0.bb b/meta-python/recipes-devtools/python/python3-ujson_4.2.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ujson_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_4.2.0.bb
index d8e83c58a1..3dbfe44faa 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_4.2.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe"
 
-SRC_URI[sha256sum] = "22b63ec4409f0d2f2c4c9d5aa331997e02470b7a15a3233f3cc32f2f9b92d58c"
+SRC_URI[sha256sum] = "fffe509f556861c7343c6cba57ed05fe7bcf4b48a934a5b946ccb45428cf8883"
 
 inherit pypi ptest setuptools3
 
-- 
2.25.1


