Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D63C7115F
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:12 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web09.19143.1650531615789100724
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Apr 2022 02:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cjqMlJya;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650531613; i=@fujitsu.com;
	bh=RVxLjVQT/OtmBADT+HyZwbX7xH/dwGgDjv48kW+WqFg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=cjqMlJyaCiqDnfFU5qjfU+pvtcdg8nzmAoSLSWVEjPgAEBIMWF+OfLtGwUBZuG+oD
	 WSeXBJwKwoYbxnuleGL0WcLJB1AXI3CW8yFAo/AdSF8r6ZmGEqXLNNei4e3zj+GeDG
	 u9pk5xDSuNzD2Jj0sR1yw420e02dxEJl08QMEQwM8iOJ5Pp2f4+cQU1MOdQk+6Bl2U
	 YYMW0vxK41b/aX23IVhI45+82dfoCAPCB5PHr0HfiKWywyfI/PM+B16D9eBjHKhCXD
	 8AXFmp3yMZx9J3b1kd4ctDu+vDO6O7nZAEoZE4AiID07D12+DvyEVDVlFnWuRUkys0
	 KxUQH2j1OvIIw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8MxSVdWNjH
  JYPtOaYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNq33aWgqXcFY333BsYN3B1MXJyCAk8YZRo
  vOvdxcgFZF9gkli77jgjhHOSUeLC3L8sIFVsAuoSj2++ZgSxRQT0JZbO3sMMYjMLqEp0X1zDD
  mILCyRKdB58yARiswDFXz2dB1bDK+Au0XLkP1hcQkBBYsrD90BxDg5OAQ+JdS99II5wlzj9p4
  sNolxQ4uTMJywQ4yUkDr54wQzRqiRxYsVHqDEVEq8PX4KKq0lcPbeJeQKj4Cwk7bOQtC9gZFr
  FaJVUlJmeUZKbmJmja2hgoGtoaKoLJI2M9RKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1iitzk3NS
  9PJSSzYxAgM4pZihegfj/96feocYJTmYlER58yUSk4T4kvJTKjMSizPii0pzUosPMcpwcChJ8
  M6VAsoJFqWmp1akZeYAowkmLcHBoyTCWy8NlOYtLkjMLc5Mh0idYlSUEudVFwdKCIAkMkrz4N
  pgEXyJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvIhmgKTyZeSVw018BLWYCWlw9JRZkcUk
  iQkqqgWk9s5LQqQ/tRjmlv/cJmJofevF9/mzrOUbH9kaGSWxfMt+w7vj7lM8xDxKWLjc9M9X+
  geXS23zq/QfjnB/wxU5dKbf847ErOdklMW7Pn7l17uqdkyrfO2XSqTW8hzRvK3v9P+jcc/RGk
  MCja5bKv4x5jURCBAO1Nmd+9d6tumuxo7HBtQ9LJBOeuny0DwgrXrLrO2fBlJnb69yXl1xpOj
  6j3Xrzrkrl9/kqfMxMgY6/d8zubPv4o//G4T72iAXHJ6cGczbuEqhbcnxdmsrMq08PyN5cue/
  ch4Z+zZiTzF4LfHJ4J06sjZ/VtvPAhyb2xC+fJqhteZtpVx00fa3B8/3vTS+V7Uo+ucN4n4wL
  WzKTEktxRqKhFnNRcSIAIIQ7dVsDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-591.messagelabs.com!1650531613!453978!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15629 invoked from network); 21 Apr 2022 09:00:13 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Apr 2022 09:00:13 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E82241009A6
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Apr 2022 10:00:12 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id DACA11009A0
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Apr 2022 10:00:12 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 21 Apr 2022 09:59:42 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 2/5] python3-aws-iot-device-sdk-python:
 upgrade 1.5.1 -> 1.5.2
Date: Thu, 21 Apr 2022 16:59:21 +0800
Message-ID: <1650531564-26234-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650531564-26234-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1650531564-26234-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96722

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...thon_1.5.1.bb => python3-aws-iot-device-sdk-python_1.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aws-iot-device-sdk-python_1.5.1.bb => python3-aws-iot-device-sdk-python_1.5.2.bb} (96%)

diff --git a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.1.bb b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.2.bb
similarity index 96%
rename from meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.2.bb
index 0b2181e4fe..35d061f5e6 100644
--- a/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.5.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENSE.txt;md5=9ac49901b833e769c7d6f21e8dbd7b30 \
     file://AWSIoTPythonSDK/core/protocol/paho/client.py;endline=14;md5=5a3c8a1a4bb71bd934f450ecff972ad9 \
 "
-SRCREV = "6ca6c73775c953114f83240a850a0d1ab49b68ac"
+SRCREV = "0ea1a2d013529839fc1e7448d19dadff25d581b4"
 SRC_URI = "git://github.com/aws/aws-iot-device-sdk-python;branch=master;protocol=https \
            file://0001-setup.py-Use-setuptools-instead-of-distutils.patch \
            "
-- 
2.25.1


