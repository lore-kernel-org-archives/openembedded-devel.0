Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.118])
 by mx.groups.io with SMTP id smtpd.web10.11505.1625749149975586476
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jul 2021 05:59:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=drd4OxZT;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.6.118, mailfrom: massimo.toscanelli@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzeH05IFjkI2J82uR1krv+neVk5NZLToBJnrKlCV58CKCoKJT7R+rSW5ZtdBJIJxw8KefUg0pQrjEl1o3TQCNAp8SiM/1DR/Jh9B1bk6mCgizNV8yxANXjlfYk1gBTylotQ5xyBecY123cs6dUNJGUMhnFXvwvhJTL1MouP2ZVVrT0tWzzbIomVDyHxA/t78UaTXdnI4ZHG3ZhICzPDbMWiD6QwTAl78VSRDgXTPZn2/Boa0zyp6LffhnqOaQe7naOhtlUTFcVQvwf6il0Q4QW+esq4JwyemWPoi4PCbl9S3d8E/0u2+4+/2/ikVKj6faiqZS7aFvBqBSDkvy3RsAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCfhsGaI0jmm6kY/XHHS6nhStjNOXHiJiBohIyEbIEE=;
 b=Ntv+piNMb1y9gq8imMRafdUkqEpmHVK1/UHRlyg+nQTdOH/xWNdrrFvJyy8CXtx6aeyx1qFTwyfsJrRx05qVzb+/+sD/AirAluzjvMDfjCUkRL28Nh+fsTK+9kFLLLjKaPxa6YWxhxdVD8eXHtfslvVbE2TFlM6MT1RilLafb/SqnoxMbogNqAzQAr0OP5cTC6eXrtt5DmwQdBjSP2l4MO8pV8DT8zUbnfAGN7wX+0YsURbHVfEdLSJv8S8K6plk3iHyVFdgkzlTE3KCLnJxc+kCKL1OuKu01fP5EiEUGcMVQ0Prr6w2AsZJAMLTb1h0MrOWWcJ4aoG7KhbzdjFxiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=quarantine sp=quarantine
 pct=100) action=none header.from=leica-geosystems.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCfhsGaI0jmm6kY/XHHS6nhStjNOXHiJiBohIyEbIEE=;
 b=drd4OxZTtL6JZcd/MNiWr+VE2Gf+T2qyLqAChrNNBu3v5WAfTGB+2ADcea9NKQAjDOeG4zT9Ln1wJXFLZ5d+nc1UQvmzwCJrWjWxT7SL719we39voCbnSX9m2j+obmxYRPLP+smJJEob6jNk+S+Q6/YqOhFazsIZDmps2k66Q74=
Received: from PR0P264CA0251.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::23) by
 VI1PR06MB6590.eurprd06.prod.outlook.com (2603:10a6:800:122::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Thu, 8 Jul
 2021 12:59:07 +0000
Received: from HE1EUR02FT029.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:100:0:cafe::b8) by PR0P264CA0251.outlook.office365.com
 (2603:10a6:100::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Thu, 8 Jul 2021 12:59:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; lists.openembedded.org; dkim=none
 (message not signed) header.d=none;lists.openembedded.org; dmarc=pass
 action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com;
Received: from hexagon.com (193.8.40.94) by
 HE1EUR02FT029.mail.protection.outlook.com (10.152.10.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Thu, 8 Jul 2021 12:59:06 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.56]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 8 Jul 2021 14:59:06 +0200
From: "massimo toscanelli" <massimo.toscanelli@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
Cc: massimo toscanelli <massimo.toscanelli@leica-geosystems.com>
Subject: [meta-oe][PATCH] sysbench: fix memory test
Date: Thu,  8 Jul 2021 12:58:51 +0000
Message-Id: <20210708125851.27089-1-massimo.toscanelli@leica-geosystems.com>
X-Mailer: git-send-email 2.17.1
Return-Path: massimo.toscanelli@leica-geosystems.com
X-OriginalArrivalTime: 08 Jul 2021 12:59:06.0211 (UTC) FILETIME=[08C83B30:01D773F9]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: fbd91d53-4c5b-454c-c9a2-08d942102bc2
X-MS-TrafficTypeDiagnostic: VI1PR06MB6590:
X-Microsoft-Antispam-PRVS: 
	<VI1PR06MB6590EBC7D756EFEDA6F37339A0199@VI1PR06MB6590.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9Z68WJ63LCvqhJm3FQpiyAI4noV+biQ4PSeN2OulysCj0SZNhV6wi/dPhMQc4KhwI9i9/USgc0GK7+Qm23FZiaCg5ZKxC9e4+zg+A2a1+Q0EXQH/0l63Dk58yFdm0DS0Z+VSTPti020D7biOCu4cIE/MvzafWTRPhe4gG2vbBP2XdjTzS636Tm06PZxRVZcP3rsbeFK7/tehMRlAVnwVyBb7iYLdqbrNbSnPVsVisTcUxD0gRkx4mQOOlvbEw0G9vXcq7RHEB8OoAg1P8z7QB/Drs+bSm/sTOyOXEXr8SqxDqN//3CNfFUsDJypP06zSbeZygRg1h/m0/5q3M+P5p4vPYXlwtnMNkcVPSABAw3HcU0SD3sJh+OMR/WXkPekUZ8SDe8jt3hzPYxueXg2AwtSHmrkyd831r9w82XElJSw9efYnsgzSdBqgDW6s3qEmEXz0oZAz8CwBJOwmahJCmUT2HAix208K26RJUT3hC2X+vO4r/t0RLTjR4w5cA4Ww6FuSydQiuDi29hPtwjsv22wZLRuVL7WJefKF0PZQ/3sexfL8knxBMTlIJIP7LPskhLPT0CqWhFDK0zaTXd7YVVe2k6/ajaOXj2cwWjMMhTM60eqbdsb4fQUSZHJuKYCfZR0fWg5Q4YSQzuow/g8hBEHl23n9ESE/mSIQabVNmeK5B5z1PKjnSr4FaATL7YGXL3DcybMPbDRsdYgIOUd8XBvjkw9kjn18mchbs8QK1Tn8f43L6BnzoQFl1leeDmP7H+bK6v7J9hEVeoTTOD8sD1mCvBrPA4ckwOrBDvXw4UM=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39850400004)(346002)(46966006)(36840700001)(478600001)(107886003)(2906002)(1076003)(6666004)(966005)(316002)(8936002)(336012)(8676002)(70586007)(70206006)(6916009)(47076005)(5660300002)(36756003)(83380400001)(36860700001)(4326008)(82310400003)(82740400003)(26005)(2616005)(86362001)(81166007)(186003)(356005);DIR:OUT;SFP:1102;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 12:59:06.9892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd91d53-4c5b-454c-c9a2-08d942102bc2
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR02FT029.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB6590
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

