Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44217C636D7
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 13:33:55 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.9086.1676122430760416416
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Feb 2023 05:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=igeegDst;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676122429; i=@fujitsu.com;
	bh=9zpmUghGylCc4nxZVLoHl2ha3b4kTF4vehJq2hI3LFM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=igeegDstaUkdzMiPofxukQHV4imdnvMUdmP1THUDz8nBbCqT4lEE+JZ7dPamhqzk4
	 iYN0CaT+XjfXa7zGU++6Vd405C+F64DYn4yI3Pafh1ulY8T8/eGFM0EMP7lqI8xuXn
	 ZbphC2ZZ3DQTettTIIWamyv5TQSZLlaiOJ5DysftCcU2AzJ42T5C8PIqCBvf92w/yw
	 srEKYjV7dgr8u4rpkPbGer/h+T9L2sBS+UXwvU2gg1uD6sI/pibjKdlxvumikp9ftt
	 jZP9GVqLq1Sc48qZIi+1dNuO+bzS2qm1douUXqZDBbOa95KaKOKuYEcQaGQp+UveuZ
	 fuDx1W/QzNuVA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8MxSddm5vN
  kg98reCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oz/F2YxFVwUqTg46w5bA+M3wS5GLg4hgSeM
  En/nt7N1MXICOTeYJI6cKYZI7GWUeLBhNQtIgk1ASuLG/f9gRSIC+hJLZ+9hBrGZBVQkXvzuY
  QexhQV8JD59bWUEsVkEVCUObW9mArF5BRwl3uxdDBaXEFCQmPLwPVAvBwengJNE6wlNiL2OEt
  uPPmKDKBeUODnzCQvEeAmJgy9eMEO0KkrMvtzMAmFXSrR++AVlq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaFqcWlSWWqRrpJdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcApRJLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM3JRi1f4djGt7/+odYpTkYFIS5V22+WmyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneZ
  ROfJwsJFqWmp1akZeYAowgmLcHBoyTC2z0dKM1bXJCYW5yZDpE6xagoJc57EaRPACSRUZoH1w
  aL3EuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmnTgGawpOZVwI3/RXQYiagxQxST0EWlyQ
  ipKQamNbld7REf2/R3PTe1+L6YWPdSzMnOR2zteI4eXjSgVs1oSJOq29f+pPm278w4t1JqykW
  T+X3q4jNsNv0uuu49FMT7/6ynH1VracXRPrq/WLe6NdjkKR/u6/9yDP+f2GPvgcGJ6btX8d18
  Z9j/k9OexGOl8lTA5W3hByM/HSRlXXPRsdG5s7F3OqNJ9NM+V9HzKl1mdClJJx1s0vQiHvhAy
  +l2FldgurzknRCtkaK9JrOaPvJ03DaPiqv28B8abT5xfenWm7PX/8/P5i1sWxZqnhdS5hZRNW
  R4Onnz9w+PJ9r3rUFGaZMq0yW+utNY23NvxymESS1nnk6U8uJjk98D2un5KnNVzH7FMWw32K5
  EktxRqKhFnNRcSIAha12O1cDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-548.messagelabs.com!1676122428!214388!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10713 invoked from network); 11 Feb 2023 13:33:48 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Feb 2023 13:33:48 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E20A81000D7
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 13:33:47 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D64C81000D2
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 13:33:47 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 11 Feb 2023 13:33:46 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymodbus: upgrade 3.1.0 -> 3.1.3
Date: Sat, 11 Feb 2023 21:33:25 +0800
Message-ID: <1676122405-5945-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676122405-5945-1-git-send-email-wangmy@fujitsu.com>
References: <1676122405-5945-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 13:33:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101026

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
  Solve log problem in payload.
  Fix register type check for size bigger than 3 registers (6 bytes) (#1323)
  Re-add SQL tests. (#1329)
  Central logging. (#1324)
  Skip sqlAlchemy test. (#1325)
  Solve 1319 (#1320)
  Update README.rst
  Correct README link. (#1316)
  More direct readme links for REPL (#1314)
  Add classifier for 3.11 (#1312)
  Update README.rst (#1313)
  Delete ModbusCommonBlock.png (#1311)
  Add modbus standard to README. (#1308)
  fix no auto reconnect after close/connect in TCPclient (#1298)
  Update examples.rst (#1307)
  var name clarification (#1304)
  Bump external libraries. (#1302)
  Reorganize documentation to make it easier accessible (#1299)
  Simulator documentation (first version). (#1296)
  Updated datastore Simulator. (#1255)
  Update links to pydmodbus-dev (#1291)
  Change riptideio to pymodbus-dev. (#1292)
  #1258 Avoid showing unit as a seperate command line argument (#1288)
  Solve docker cache problem. (#1287)
  add missing server.start() (#1282)
  small performance improvement on debug log (#1279)
  Fix Unix sockets parsing (#1281)
  client: Allow unix domain socket. (#1274)
  transfer timeout to protocol object. (#1275)
  Add ModbusUnixServer / StartAsyncUnixServer. (#1273)
  Added return in AsyncModbusSerialClient.connect (#1271)
  add connect() to the very first example (#1270)
  Solve docker problem. (#1268)
  Test stop of server task. (#1256)

Thanks to:

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.1.0.bb => python3-pymodbus_3.1.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.1.0.bb => python3-pymodbus_3.1.3.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.1.0.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.1.3.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.1.3.bb
index b58c62218..3750f5781 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.1.3.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c2223d66c7e674b40527b5a4c35bd76"
 DEPENDS += "python3-six-native"
 
-SRC_URI[sha256sum] = "eeba02c86b13b1f885c0acc50adf4611df24ab85066ff54daa37c2d883c32525"
+SRC_URI[sha256sum] = "714e5d6b7e28c4016a94346e73033aff276b6ce8bd22e470ba4fd8b982e08a98"
 S = "${WORKDIR}/pymodbus-${PV}"
 
 inherit pypi setuptools3
-- 
2.34.1


