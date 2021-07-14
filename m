Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.102])
 by mx.groups.io with SMTP id smtpd.web11.9282.1626280040402419934
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jul 2021 09:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=IxieXtou;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.6.102, mailfrom: massimo.toscanelli@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqEVvUHA6UJThzkNIq7QyN/e1kP5Q9lYHX8XvD1rMsADPCa9VJC3X6K2qF4pIyFF8h1iOqZqqsoOkCrqpUuJMs9lrSaCyM/nAZhhe21LMwNEv8i++lHpSPqtGcY1OIEguM2v9wdMwTnZmuNt1P/N1WZvr6pOEv6kRDS8+8KiALScmM7+VDW0nL38Fw/jmG4z9Etm8tz/bd/zEqug4Iew5aI5utmZDuTapC1i2A5WJl6rO88qbwI434s04RGp9mThGYI9yGUsz7r4xLND+F6vWqvqV5YxwHsB1OliKtFd8hT7P1o2SwaJPtBiTQl5Zw35Zt7f4TrRuvFwAzYsz1NTzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxV81mVS6kwscBz/CP2mt5JO9/cDrHTROtxydKkdexw=;
 b=bTS3pzO9zoL+mRjeQV9EP488nOcIo3QHHjgo4D71n2Zr4nbVmnNGFv2KfPsf8o271NyAaEn1xQnMEm2AK/6J8taQrclfxyhvL6jsbvwWOtkElTlXupEaSTBFIVA5N8Gtdzq89jPShlPxb/3Pxo9ZkHAnnivL0xx2l3ZRO3l2QI2doOpJnFzc452V8uO8I6V6LnkzcwPKuaA3kJNS/cuX5wwKmfpigfd5EF3j2uNyxZzygZBGQgajaW2ctP2tQikSqtjPfGzCFI2AOkQhnJrtIE8M/RbufdZNJMVUsrFcCAwIOCu9BRbvrZi1M9hzi++3mhUOv47t6cFVRbRJC0lBBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=quarantine sp=quarantine
 pct=100) action=none header.from=leica-geosystems.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxV81mVS6kwscBz/CP2mt5JO9/cDrHTROtxydKkdexw=;
 b=IxieXtouYbptMDhVWgyQJhnjfm+XHLbqWp+kx4wTk7idxZcfW1dorrLgIf/FCeP3O0EtpnHvpvQwdY7sD/OZW1h6b1z96K6zy4M+tZIDUKtYKe43gBVTD8vnkNUHtqchIa7QtwaDIE8h9iRIgv8WpQb9RhD1CXMbCq3XBYXfYxo=
Received: from PR0P264CA0136.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::28)
 by AM0PR06MB6467.eurprd06.prod.outlook.com (2603:10a6:208:19f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 14 Jul
 2021 16:27:17 +0000
Received: from HE1EUR02FT042.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:100:1a:cafe::7d) by PR0P264CA0136.outlook.office365.com
 (2603:10a6:100:1a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Wed, 14 Jul 2021 16:27:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; lists.openembedded.org; dkim=none
 (message not signed) header.d=none;lists.openembedded.org; dmarc=pass
 action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com;
Received: from hexagon.com (193.8.40.94) by
 HE1EUR02FT042.mail.protection.outlook.com (10.152.11.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Wed, 14 Jul 2021 16:27:17 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.56]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 14 Jul 2021 18:27:16 +0200
From: "massimo toscanelli" <massimo.toscanelli@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
Cc: massimo toscanelli <massimo.toscanelli@leica-geosystems.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe,dunfell][PATCH] sysbench: fix memory test
Date: Wed, 14 Jul 2021 16:26:56 +0000
Message-Id: <20210714162656.20938-1-massimo.toscanelli@leica-geosystems.com>
X-Mailer: git-send-email 2.17.1
Return-Path: massimo.toscanelli@leica-geosystems.com
X-OriginalArrivalTime: 14 Jul 2021 16:27:16.0143 (UTC) FILETIME=[1BD71BF0:01D778CD]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 207743c3-2a83-4269-7255-08d946e43ee3
X-MS-TrafficTypeDiagnostic: AM0PR06MB6467:
X-Microsoft-Antispam-PRVS: 
	<AM0PR06MB6467EC89081D5A462830E7A5A0139@AM0PR06MB6467.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9Qb6RZPBka+ZEdILzJFJXJhgSRNrhqYGW/u5I0bX9qFUkiTpDnui2WXMaoxjwCqpiExbfE+0kxQqt41+TzDPssRPoN5y3P2SgnALw6qoOE7zOoMQgXUjJQjS44PqHO4D4ygMi2ddvsd/3UDPwVL/7PbwJZ1u96otKxw7LYSoDKEFazBhDt+hJS7VToklW56khLEscuNzVI6y/npbwiIJoxgtdQmyaiMKXKFktBa+LtP60lEKTn7bkCKQn3gm7J4+qg/+0UhP3huAwchzCURAX5ZjYdDGISVQqdclTMvIcrrDcZDZPglptQyjgC0t2+ScS5RcWdnR36kgA2aSOJibz9X4hbBnFiLuhlWBP9vFVwGrHB0rPDqVHWq9UrWTklVvS9wnGmagh+AZLDMgftNMS5Dh3ujJZ5/XZIej4yYH+xl1ziUa3wh7eWF3+6SVoCeWuaWfe+TxG6HrXPSpCibVfFHAnPHFN7t2jkrz3guyPX8qrwsSUf+HYm29w/JniPSzRxACs0HcWzy3wFNK92z61Yg2cMcV3st4nqvFC3uBaK+HV/KbKePTJPiaA/nq04OBOVu/VgW0YF13b/5K9DZdrgPy/PNNDsTNiBG/V85vZMpwlzFYUXEYrsmH+FPOnufkKYN42i+0ayendcDTKFSo2foCq3lI6xWqpQbbA7n9heyWnyNByuB/t379NUhtU8ME0OYXAn1yjqQHx0a3B+eti6FbUryim38K7yQzrSb79HF8SJNrIKDgIqkWXMtBwdWBgs0ecfAunNTzcuBdeqZD5Juv0xCeBBfE7QgkEywsbjI=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(36840700001)(46966006)(8676002)(6916009)(186003)(478600001)(316002)(2616005)(54906003)(70206006)(47076005)(36860700001)(4326008)(107886003)(26005)(36756003)(83380400001)(5660300002)(86362001)(70586007)(966005)(82310400003)(336012)(1076003)(6666004)(356005)(82740400003)(81166007)(8936002)(2906002);DIR:OUT;SFP:1102;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 16:27:17.0507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 207743c3-2a83-4269-7255-08d946e43ee3
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR02FT042.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB6467
Content-Type: text/plain

In sysbench version 0.4, the tmp variable used by the memory test to
execute requests is optimized by the compiler. Caching mechanism reduces
the direct accesses to the memory increasing the transfer speed. This
leads to false timing estimations that considerably affect read and
also random write operations.

In sysbench version 1, this issue is fixed adding the volatile modifier
to the tmp variable. This prevents compiler optimizations forcing a direct
access to the memory.

The final result is a realistic transfer speed measurement.

Signed-off-by: massimo toscanelli <massimo.toscanelli@leica-geosystems.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

(cherry picked from commit 59cce5ad1603c2975684ae15b639e0e3cd688c40)
Signed-off-by: massimo toscanelli <massimo.toscanelli@leica-geosystems.com>
---
 ...modifier-to-tmp-variable-in-memory-t.patch | 40 +++++++++++++++++++
 .../sysbench/sysbench_0.4.12.bb               |  4 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/sysbench/sysbench/0001-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch

diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench/0001-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch b/meta-oe/recipes-benchmark/sysbench/sysbench/0001-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch
new file mode 100644
index 000000000..d628e81b5
--- /dev/null
+++ b/meta-oe/recipes-benchmark/sysbench/sysbench/0001-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch
@@ -0,0 +1,40 @@
+From c1ebf893e32a0a77e820484d48a903523fef7c1b Mon Sep 17 00:00:00 2001
+From: Vasily Tarasov <tarasov@vasily.name>
+Date: Fri, 10 Jun 2016 14:33:48 -0400
+Subject: [PATCH] Adding volatile modifier to tmp variable in memory test
+
+Issue explanation:
+
+./sysbench/sysbench --test=memory --num-threads=16 \
+		    --memory-block-size=268435456 \
+		    --memory-total-size=137438953472 \
+		    --memory-oper=read \
+		    --memory-access-mode=seq \
+		    --memory-scope=local run
+
+Without this commit the time to run the above command is 0.0004 seconds.
+With this commit the time is greater than 3 seconds.  Essentially,
+without the volatile modifier, the compiler optimizes read access so
+that no real access happens.
+
+Upstream-Status: Backport [part of v1.0.0 https://github.com/akopytov/sysbench/commit/8753cb93be4c0b81a20b704ced91e7a422da52b1]
+
+(cherry picked from commit 8753cb93be4c0b81a20b704ced91e7a422da52b1)
+Signed-off-by: massimo toscanelli <massimo.toscanelli@leica-geosystems.com>
+---
+ sysbench/tests/memory/sb_memory.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sysbench/tests/memory/sb_memory.c b/sysbench/tests/memory/sb_memory.c
+index 2e8998f..7d22bb9 100644
+--- a/sysbench/tests/memory/sb_memory.c
++++ b/sysbench/tests/memory/sb_memory.c
+@@ -244,7 +244,7 @@ sb_request_t memory_get_request(int tid)
+ int memory_execute_request(sb_request_t *sb_req, int thread_id)
+ {
+   sb_mem_request_t    *mem_req = &sb_req->u.mem_request;
+-  int                 tmp = 0;
++  volatile int        tmp = 0;
+   int                 idx; 
+   int                 *buf, *end;
+   log_msg_t           msg;
diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb b/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
index 708c71f4f..d1725dddd 100644
--- a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
+++ b/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
@@ -8,7 +8,9 @@ inherit autotools
 
 # The project has moved from Sourceforge to Launchpad, to Github. Use the source tarball from
 # Launchpad until the next release is available from Github.
-SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+files/${BPN}_${PV}.orig.tar.gz"
+SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+files/${BPN}_${PV}.orig.tar.gz \
+           file://0001-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch \
+           "
 
 SRC_URI[md5sum] = "3a6d54fdd3fe002328e4458206392b9d"
 SRC_URI[sha256sum] = "83fa7464193e012c91254e595a89894d8e35b4a38324b52a5974777e3823ea9e"
-- 
2.17.1

