Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC39BC47094
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:40 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.7889.1649746983275312019
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 00:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PKC3zyf9;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649746981; i=@fujitsu.com;
	bh=Ulhbrs6Y2vOUI3cb6WcGgJwYg9CTo+aOoLOiB0pJ42g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=PKC3zyf9JIwSnQv+JOFWPK7t+6xDjJhQtD8sqDi/l/klwrWkDPKuhiX7RS2Fx2cho
	 EXxQE3gteyF2VBHQR5NRt4oxWSEW8EJlB8n/0qLqtpYV9JgfpO3x7qk1J6mzcGPXrZ
	 gfxaw8U4jRQzosVXoDpUDzPImDETdDET5jSMX7j/VJM7niRRoObfIvTBTBs7nmxm1i
	 vwiQt6+pf4cfYJHLHfoB1N25X5fPwihLBhRq4VBG6ab0tMDqdnLnEeLKihynQibbMQ
	 qgUlcEjoSo5U2wzkriv9bzGCVOx5a4eMYa+p6sEUhwqjK8Jo4nNFMWcb9a80BG8M/q
	 +lZJuNkQ2ze6w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNIsWRWlGSWpSXmKPExsViZ8MxRVdFJTT
  J4MgTa4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePO3AnMBT3cFc8+uzcw9nB1MXJyCAnMZpLY
  PEWmi5ELyN7DKPHs8FQWkASbgJrE9Fs3WEFsEQF9iaWz9zCD2MwCKhIvfvewg9jCAnYSm699Y
  gKxWUDi/66C2bwCjhL3G1+D9UoIKEhMefieGSIuKHFy5hMWiDkSEgdfvGCGqFGUmH25mQXCrp
  CYNauNaQIj7ywkLbOQtCxgZFrFaJtUlJmeUZKbmJmja2hgoGtoaKprZgGk9BKrdBP1Ukt1k1P
  zSooSgbJ6ieXFeqnFxXrFlbnJOSl6eaklmxiBYZZS7MK9g/FO30+9Q4ySHExKorwGPKFJQnxJ
  +SmVGYnFGfFFpTmpxYcYZTg4lCR4lZWBcoJFqempFWmZOcCQh0lLcPAoifB+VwBK8xYXJOYWZ
  6ZDpE4xKkqJ84aD9AmAJDJK8+DaYHF2iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwrx3IFJ
  7MvBK46a+AFjMBLQ7dFgiyuCQRISXVwOQn0nrrnn794R4to7z6F/OLI16/8OZK7uBM+rz93Lb
  m6BlffBddba3WnrIjXWpll0JLi/69vfyhCk0Xu5N2eX1POtglPEnhl9Jz0/gFXle705cfuDJb
  ZYpu75sWG735J7Y4V+k7X/ASbJly3q7haW14i7O0aXjVLzZ1u/9Xy62XagtN1LxTsnnBP4VfB
  WKfFFiiZcNnBKcqbrxSlP/6Q5SNjsqlL0U/Z0/ecz/l4JycZ4d955pWWdw5tye4pdnu5fluO/
  aIiDuLzJccf769rMrGkmvbxJznuqzO1WlbRA6XmdoY+h11kI98fu7BhlkpLbO9FfNDXBhlDd9
  f/Wu9rlalaWpVrOGq08lF/0Q+KLEUZyQaajEXFScCAMxGHXQuAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-528.messagelabs.com!1649746980!82342!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32591 invoked from network); 12 Apr 2022 07:03:00 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-11.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Apr 2022 07:03:00 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23C72vF3017796
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 08:03:00 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 12 Apr 2022 08:02:56 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] logwatch: upgrade 7.5.3 -> 7.6
Date: Sat, 9 Apr 2022 21:59:32 +0800
Message-ID: <1649512774-4814-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96579

License-Update: Copyright year updated to 2021.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../logwatch/{logwatch_7.5.3.bb => logwatch_7.6.bb}          | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/logwatch/{logwatch_7.5.3.bb => logwatch_7.6.bb} (92%)

diff --git a/meta-oe/recipes-extended/logwatch/logwatch_7.5.3.bb b/meta-oe/recipes-extended/logwatch/logwatch_7.6.bb
similarity index 92%
rename from meta-oe/recipes-extended/logwatch/logwatch_7.5.3.bb
rename to meta-oe/recipes-extended/logwatch/logwatch_7.6.bb
index b2fb7718e2..8cb88157db 100644
--- a/meta-oe/recipes-extended/logwatch/logwatch_7.5.3.bb
+++ b/meta-oe/recipes-extended/logwatch/logwatch_7.6.bb
@@ -8,12 +8,11 @@ the package on many systems.\
 SECTION = "devel"
 HOMEPAGE = "http://www.logwatch.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ad199c8aca74e70f296f731ad9a1521c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ba882fa9b4b6b217a51780be3f4db9c8"
 RDEPENDS:${PN} = "perl"
 
 SRC_URI = "http://jaist.dl.sourceforge.net/project/${BPN}/${BP}/${BP}.tar.gz"
-SRC_URI[md5sum] = "8bcf3edc5a4687c8aad1b9c01e2be54b"
-SRC_URI[sha256sum] = "1b2b96879dec01cd02754fe00f8989b11ff16158c3dc7c4aff0faa4b1d34974b"
+SRC_URI[sha256sum] = "689f3c68b99ef7af7d3c7007c3ff0a55d5674bdbf9c01f69a9f187726d6d4baf"
 
 do_install() {
     install -m 0755 -d ${D}${sysconfdir}/logwatch/scripts
-- 
2.25.1


