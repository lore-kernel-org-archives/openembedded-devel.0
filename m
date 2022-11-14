Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A88C43217
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 03:21:06 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.1738.1668396057266830891
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Nov 2022 19:20:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WSET8Xjr;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668396055; i=@fujitsu.com;
	bh=5K+awNp3dp/63nMA4Pitc0eHylhTesHoY1GjuCXLr8c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=WSET8XjraJcPdkPn7E0E8pQHbKKFZiBcJnGugxqdQ3oOvgjaUNIndF+Px4q6b4NR3
	 KkmxhnYZlSE3SVtMeaDoxIOEyt9I/ZxOt4HptJGFEthpGVzIWBqLOQGstKeuzxKG1C
	 Ok7QV3kbSK1ojNM+rBlDV2oR4w2rgrK2d1PZCfzjvxtanMvPt7gYyZHl1TDFxeGh52
	 Hs/ioUzDTIPFT6q4Qbmo6+y5jBNun2efXRyfemUFS32nr/q1op20r50XFqUNDvPWHb
	 9M1tCKr5H8m1YqjdQC2gdjhoxTH7Ug3qiJOk01UTUXDKjI+31H3PyhxnqbdQ8Tf2AX
	 lMQuKRG6a4rNg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8OxWVd0S2G
  ywY87lhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a2lW9ZC74JVay9fYSxgXGmQBcjF4eQwENG
  idtLOti6GDmBnCtMEos/W0MkDjBKHJ23kQkkwSagILFw6xlWEFtEQF9i6ew9zCC2sICPxJ8vR
  9lBbBYBVYlD77azgNi8Ah4SjY9nM4LYEkC9Ux6+Z4aIC0qcnPkErIZZQELi4IsXQHEOoBpFid
  nT5SHKKyRmzWpjgrDVJK6e28Q8gZFvFpLuWUi6FzAyrWI0L04tKkst0jU010sqykzPKMlNzMz
  RS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J0ctLLdnECAy6lOLU1zsYjy37o3eIUZKD
  SUmUl399YbIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCV6hDUA5waLU9NSKtMwcYATApCU4eJREe
  Es3AaV5iwsSc4sz0yFSpxgtOabO/refmWM5mJz5te0AsxBLXn5eqpQ471qQBgGQhozSPLhxsC
  i9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY12wj0BSezLwSuK2vgA5iAjroe2QeyEEliQg
  pqQYmQ/HG40arn72cvPLwwQ/SoTsZTQ/2KiXOnLlBXrxMPufFZXWFw7aamg72oR+dMl+X1/s3
  7eXdMuf/1Si5GS8m/Hm3JeFTT2raksjtb1J+5L7K5pgzQ2z33fkBP2cVFnVNXh3Ssav69av3B
  5rSbDiFbmo/v6/0esXGTYYLThcEqkQUXn4y51Kb7xKdS2G/AjkK2iVaQiXOnQvTi8mO/F6pcb
  98rsM8ruTcR7Om3Twvwzlv6k7lLaVHVYvcOqwf8Ltk8PR9sVO2sl7R5tyzaulUV/HJn75c5dF
  f/r9FtPLFTDf5g4m/Z70uVZ8cFNL1timu6IHl+WP33PJWal9p3Knbsr/oTvxLseNBEhU2mcW8
  SizFGYmGWsxFxYkAQuA5X00DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-732.messagelabs.com!1668396053!835735!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7421 invoked from network); 14 Nov 2022 03:20:53 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-6.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Nov 2022 03:20:53 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 72A52151
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Nov 2022 03:20:53 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 65A7C142
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Nov 2022 03:20:53 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 14 Nov 2022 03:20:52 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pymodbus: upgrade 3.0.0 -> 3.0.2
Date: Mon, 14 Nov 2022 11:20:42 +0800
Message-ID: <1668396042-24375-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Nov 2022 03:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99579

Changelog:
==========
    Add pygments as requirement for repl
    Update datastore remote to handle write requests (#1166)
    Allow multiple servers. (#1164)
    Fix typo. (#1162)
    Transfer parms. to connected client. (#1161)
    Repl enhancements 2 (#1141)
    Server simulator with datastore with json data. (#1157)
    Avoid unwanted reconnects (#1154)
    Do not initialize framer twice. (#1153)
    Allow timeout as float. (#1152)
    Improve Docker Support (#1145)
    Fix unreachable code in AsyncModbusTcpClient (#1151)
    Fix type hints for port and timeout (#1147)
    Start/stop multiple servers. (#1138)
    Server/asyncio.py correct logging when disconnecting the socket (#1135)
    Add Docker and container registry support (#1132)
    Removes undue reported error when forwarding (#1134)
    Obey timeout parameter on connection (#1131)
    Readme typos (#1129)
    Clean noqa directive. (#1125)
    Add isort and activate CI fail for black/isort. (#1124)
    Update examples. (#1117)
    Move logging configuration behind function call (#1120)
    serial2TCP forwarding example (#1116)
    Make serial import dynamic. (#1114)
    Bugfix ModbusSerialServer setup so handler is called correctly. (#1113)
    Clean configurations. (#1111)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-pymodbus_3.0.0.bb => python3-pymodbus_3.0.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.0.0.bb => python3-pymodbus_3.0.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.0.0.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.0.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.0.2.bb
index 829241947..95cc3e351 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.0.2.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c2223d66c7e674b40527b5a4c35bd76"
 DEPENDS += "python3-six-native"
 
-SRC_URI[sha256sum] = "37c9b6f3e5c82f39ee42047ca48cbc9fd0c49a6731126789500191e9deea6cbc"
+SRC_URI[sha256sum] = "704cb7fb90631c45f9c3a70b89d0c990fe0e208ac56f14a5c449e21bebd1e201"
 S = "${WORKDIR}/pymodbus-${PV}"
 
 inherit pypi setuptools3
-- 
2.25.1


