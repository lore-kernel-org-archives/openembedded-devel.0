Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 075E6C07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 09:08:33 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.8520.1664269702509812179
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 02:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TkQzdeXY;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664269700; i=@fujitsu.com;
	bh=vy7VwgtaadCYJvem6r8e217KjLPXFVOKPfdYWDlfMzk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=TkQzdeXYQV8Tq6ZHxFyP53ezB2E7EhfqwxgPxkf32yUQUci+uHPPUPrQgK2gopRaD
	 hiIfyZEXwtMuYKVEPfVLAdSSkd2iNF1CNZ2x/M3j7GKx2D+1YOcx+VJFLr2MfkWKEw
	 pGH4Ws9z8AvJb4K/Qs5QrH6XDcHWucbCiVqPCXkui5W3wByqU7CfkanbZ6OWs9M6Yw
	 z8vWZ8T5iWb6Rg9g5dTSNMhAAfpPN6phGNrR+ucFPVMJQ5CeflH5caiO2ZIiTCK76B
	 cpwOiZeCHrJtxFwqLnOy55izooySkJLnJABUb5WCt9IHFhDNTLKJCayruSn8tWo7ZA
	 RTmMQZL+3P5Nw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8ORqNuy1yj
  Z4O5MFouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPlyiTGgtNcFReeHGNvYLzN2cXIxSEk8IRR
  4t7nt8wQznUmiZ5jM9khnD2MEgfWfmfqYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAS+LZm/UsIDaLgKpE19bXYL28Ao4Sred62UBsCQEFiSkP3zNDxAUlTs58wgIxR0Li4I
  sXzBA1ihKzLzezQNgVEo3TDzFB2GoSV89tYp7AyD8LSfssJO0LGJlWMdokFWWmZ5TkJmbm6Bo
  aGOgaGprqWprpGhob6iVW6SbqpZbq5uUXlWToAvnlxXqpxcV6xZW5yTkpenmpJZsYgaGZUpzQ
  vIPx3r5feocYJTmYlER57RcZJQvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4JXcDZQTLEpNT61Iy
  8wBxglMWoKDR0mEd90SoDRvcUFibnFmOkTqFKMux8yvbQeYhVjy8vNSpcR5TbcAFQmAFGWU5s
  GNgMXsJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvKZ7gKbwZOaVwG16BXQEE9ARdnz6IEe
  UJCKkpBqYdKvWL9kt/0vioeSDLMb81SJHir90u85acz/2jtmRD1rKxYVOJSenCn/1TV5w5Jnl
  4qA5Che3PvPwl9f53hkle/WtbKxF+vK2Z26TF06T53rbydBywaykKnp7UFmDvVq6YI1aiCiLq
  sGdndV2l+okPWvXCuZ1PlxZp76LxX/uy6+/BM8YXSkU7+tuvXBDiUtk3bTTu4SdbUtN5udqNi
  9sZ9r7baYYg/V04Wa/yPWOE6vrIrXr0gvvz9u+j2XK+otWO/J1zux0COl2SMtplEq8ts39dVB
  rZNxp/Ra3kOTEdrPZFROmaa+prmBfbDh/Rl78nGYXsZx9U6OvKzb3ay481PfeTe7aiZv+Px7U
  L1ViKc5INNRiLipOBACbkNo3VAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-745.messagelabs.com!1664269699!5635!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26438 invoked from network); 27 Sep 2022 09:08:20 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 09:08:20 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 776F0100195
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:08:19 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6AD1D100043
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:08:19 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 10:08:17 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pandas: upgrade 1.4.4 -> 1.5.0
Date: Tue, 27 Sep 2022 17:08:01 +0800
Message-ID: <1664269685-2594-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 09:08:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98974

License-Update: copyright year updated to 2022.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pandas_1.4.4.bb => python3-pandas_1.5.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.4.4.bb => python3-pandas_1.5.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.4.4.bb b/meta-python/recipes-devtools/python/python3-pandas_1.5.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pandas_1.4.4.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.5.0.bb
index 60e908bf49..998aa123cd 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.5.0.bb
@@ -4,9 +4,9 @@ high-performance, easy-to-use data structures and data analysis tools for \
 the Python programming language."
 HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3f23c5c092b74d245d48eeef72bc3fd2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c1cc9ab35a8b2aabf933cd6d245b5db3"
 
-SRC_URI[sha256sum] = "ab6c0d738617b675183e5f28db32b5148b694ad9bba0a40c3ea26d96b431db67"
+SRC_URI[sha256sum] = "3ee61b881d2f64dd90c356eb4a4a4de75376586cd3c9341c6c0fcaae18d52977"
 
 inherit pypi setuptools3
 
-- 
2.25.1


