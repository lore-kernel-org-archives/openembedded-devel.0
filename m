Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.1449.1615507938704094829
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Mar 2021 16:12:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.112.198.228] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id 8A/3C-49021-0E1BA406; Fri, 12 Mar 2021 00:12:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRWlGSWpSXmKPExsViZ8MRqvtgo1e
  CQdM8UYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePzje9sBY1sFVvXRzcw7mDtYuTkEBKYySRx
  +VlcFyMXkH2cUaJxyQ0mkASbgKZE75YtjCC2iIC+xNLZe5hBbGYBdYlL61pYQGxhAUuJb9d72
  UBsFgFVibmXPgLVc3DwCrhInP4ZCxKWEFCQmPLwPVgrr4CgxMmZT1ggxkhIHHzxghmiRlFi9u
  VmFgi7UmLP5oesExh5ZyFpmYWkZQEj0ypGi6SizPSMktzEzBxdQwMDXUNDI11DSwtdQ2MDvcQ
  q3SS91FLd8tTiEl1DvcTyYr3iytzknBS9vNSSTYzA0EopONa0g/Hk6w96hxglOZiURHmlVnol
  CPEl5adUZiQWZ8QXleakFh9ilOHgUJLgnbIBKCdYlJqeWpGWmQMMc5i0BAePkgiv01qgNG9xQ
  WJucWY6ROoUo6KUOK8GMDqEBEASGaV5cG2w2LrEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZ
  g3H2Q7T2ZeCdz0V0CLmYAWe6mCLS5JREhJNTCt6Xu3sme/Xsx/7oClT04c1PZ6ObnLdIqE8XL
  ZzOqDnhciHmttr5ju1KGwrOsqi/qf9Se+zj4td0ne7ftBR5aLWnr66t4VU6384zJfy7XPdjz9
  pD36eanDx0cfyiUDku9NP+lpNNeEof32uu/sXkz5F0v+L/ydYvuLLf+f+8Xma/ayCd93rFs+I
  X2SyW92rkvfw7tznk7dmOvzax//pgfPgk0Ov91ttdZE8uzVqUqJ70t4mUqe7nm7oznj4iSrph
  7fJycmskzjN09W7BIOFHU0Wlqzg0Um/XLhMtOJmc2C2vYXmTe4dCaFuC9/8vVC8uMrZvmCc5V
  MjTKZN8UHrzt5VvlTXXm1VLCn8W8XuT1KLMUZiYZazEXFiQAnq9XYKAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-287.messagelabs.com!1615507935!558030!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13154 invoked from network); 12 Mar 2021 00:12:16 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-13.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Mar 2021 00:12:16 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12C0CFu6013946
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Mar 2021 00:12:15 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 12 Mar 2021 00:12:13 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [PATCH] czmq: use update-alternatives for sha1.h
Date: Fri, 12 Mar 2021 08:12:06 +0800
Message-ID: <1615507926-7525-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

libmd also uses the doc 'sha1.h'.

libmd has a priority of 100.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
index e742d2a1c4..bd40fb92f7 100644
--- a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
+++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
@@ -30,3 +30,8 @@ PACKAGECONFIG[systemd] = ",-DCMAKE_DISABLE_FIND_PACKAGE_systemd=TRUE,systemd"
 
 BBCLASSEXTEND = "nativesdk"
 
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "60"
+ALTERNATIVE_${PN}-doc = "sha1.h"
+ALTERNATIVE_LINK_NAME[sha1.h] = "${includedir}/sha1.h"
-- 
2.25.1

