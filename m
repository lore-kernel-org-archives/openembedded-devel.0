Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B15C433F5
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 02:45:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.7493.1637808309928347333
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Nov 2021 18:45:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=bdA/fifz;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6963faa46c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AP2iirj012422
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Nov 2021 18:45:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=HkpwtJjYwyyOfvIbngurLPrIovQ+qPz1apRxQ5uFVVw=;
 b=bdA/fifz4Mvu8U9KJgpXV3qzWfvjTCnwM+Rlc/SxYbKi7xGEz1CNgtJxmV3HDjZ7rBl5
 CHV0qy8OIdkPFQBb+Hqpg9NoWuAjWRJmXrZI1bI8jV6/WaCV2Ebd5tbtrKj7VQ0drIEd
 +zsLZf9NixegVdS6iSnS7fEYtl/24TzaCtwg5pF5JzxqpcQ9QLPvgXGFdeDz9x8hBd0d
 gsoA1aINSMUJ3LuJ3Wk9c99YkLfZ+uL3AF1WY52mhKpraUEAFu0KlMTY9Ma3vaoETnNj
 j2w0iwWApFO8j4iPBfx0AvR9FECFfp0IdcXVs4ex/i9hb8KR9iLx/qFcecfZ+xnDIRCd Hw==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3chbbv1094-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Nov 2021 18:45:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EN2+obBBwG9K/uaN06DYpv7pZoLoGnuH1phtxcqFe6V55ZIMO58ugcp5IFGOLuT/C2NjB9xjkIctLzdFg5PMcLEXEIjeKCXRzqkFs1l8FLbYldAAJ49Uewet+2XNX+liPcdvd09aIch/nVQNJ8z6bH2sdhO4rV18a2I8JOgheIu9kU/RyWkQ5pxCNd94SE3/9AIvzny7VCcYz5GQNxEr7b9pFAxPwdJYOHlMJsKJTXKWwWyTqCiB+C+AgioTOaAexhezUeS4qZx6o1ZeCTrkhQXT5NW8wMoj7tTHEKCx8MgOXuYHthNU9rQqgIB8N02HJlu3cVFaytws7iUWLR8sQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkpwtJjYwyyOfvIbngurLPrIovQ+qPz1apRxQ5uFVVw=;
 b=WN2enEQcESHRq8hJixqmX1RpPAUjAsgFwfG+KII6bG5GZqshN4z3WPi9qYuuuJtz2joLOoCGM0xmX49MUy6coCCm0Oc29OsyxwtOdza99ZrFc51Qys0NZ/GEX+aZUReZPrYfA0DTWZU5Nbor4v0h2r8kq1++GOJO3BpIE1gtk8QANjbWhLTjuG58VlD0LZYpbjVmRse3rPTWiAvQ0lTUfr4VMOPBCdo9N4AWQDs/25Tgiv6JNfiUwf7e1Vz/fISkDC6OBdO+o+b+2UC92gBcQCfld4lNYtYKdwfx/ulNsKHsi7SB/PS3n8yHbOfyxj00FdYjMOTmCwPTfMJ/vLEvWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2189.namprd11.prod.outlook.com (2603:10b6:301:51::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 25 Nov
 2021 02:45:04 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4713.022; Thu, 25 Nov 2021
 02:45:04 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 4/7] libldb: fix pyext_PATTERN for cross
 compilation
Date: Thu, 25 Nov 2021 10:44:47 +0800
Message-Id: <20211125024450.143364-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125024450.143364-1-yi.zhao@windriver.com>
References: <20211125024450.143364-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0062.apcprd04.prod.outlook.com
 (2603:1096:202:14::30) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HK2PR04CA0062.apcprd04.prod.outlook.com (2603:1096:202:14::30) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Thu, 25 Nov 2021 02:45:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 540ab603-d5e4-4958-9cc1-08d9afbd954a
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2189:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB21895A1FEDF4B2E0477289CEF9629@MWHPR1101MB2189.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d2qfvzq02j+Qt1IycFdIkdasuACUJrmZNBaZZ2k5CEYKHGC7EiHLACQoFzCYeqxF6m3ZDUW5xVvq2FHXowEaLX2W+LUiXfXtaH8HmIjto+jUJyGlyv/olh2E/8UlB20SDwi6SPNfH89a7H8n4KBWP/BtPYXwg8xUrQ/BUoLo9ob7wayd6pfW7IcGpLz/IT46YR9NxovMGM4swFLtvk1ou2l5lmELUOYSNCQMsH5rfWPuAXqt+8Q9G/AKt7MvVjrfmsK3cBBEpxZsuHhhlPIj9Z7S2HCqX5M81kQ+VTqrzRvBMixtBd5EC4J3p411iRzH+t6pCjBay0oat+291xRjP5pmWnN5NqGKchc4ksZYV+fuUDIqxA4Jw7W7TIaPCJUK9JuWYc3zRQzdr2gXXrlnK8mlCZ3N6v82GvJ82DW8Q2vLbMfF0D+cawqJGrPuqO/3mH8nG8UORDdV7IYawfXtGOZJylWJIlQweRXYaMnRwF6XLt0PcbO7awZSUK7YY+Tu7RJEzPbps1UW5f4iUMOn4io75DjSHs+d3g7SVZnnf8SUVcqwWuJDHnr+O4T9bc9NBR4j+gSOc3q/S+G52Eq7/Fv/l973TMpu/Fwm/YDAyp0V10c+tNToJ5E3ir9SE/tpGut5vfCnnWhIrH6gcLASGjFDJmXOGWN9uaHZ8W3V/y5qKW8jWgIYCiWLR6w/sUY9ZKPnzHLJRokdR8A6K1LE376OQwp292YFJYbuuGnYiji+aQjvKUN8QqOkop9PC+PtlMxK3vl2VWY3u0A50uwLhyr/GFKR1guef5G6c6mwSqM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(316002)(38350700002)(66476007)(8936002)(66556008)(38100700002)(52116002)(2616005)(1076003)(6506007)(186003)(66946007)(44832011)(508600001)(6916009)(2906002)(6486002)(36756003)(8676002)(5660300002)(26005)(83380400001)(6512007)(6666004)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qZlXAW8+yLA+KdQdPu4PUc0WaXKv8xXZDOisD6RGzAE4YzDd3qLdG130ZM5t?=
 =?us-ascii?Q?rfZEJD1ubNw8jSnb/2/zVL/vnf+vGdCCXjYhxN++ceQf1KNZ7Xzn1xPzHiro?=
 =?us-ascii?Q?Ej5ZQjdzjfInvjvUkKDsrHyG/ZQGZXut36gEGkJVt39UVlfOVFWHuMPSjjRN?=
 =?us-ascii?Q?o9ZL56KE6r7blsJ/4/loDDXV+DGEOfUIKnoyAPU79qy0VAO3J5BwbaIg4oc4?=
 =?us-ascii?Q?UqB40h+9o0maHzO7g8yClkRGa3nDfK7DlymvtszgKlU1c0RW/Ta+M+cV0/AJ?=
 =?us-ascii?Q?z13JV6m4KLlF09xWgNz326BhhyWaEUVAUp/ygmaePUeO/Vnft/Kqj0QQu4bT?=
 =?us-ascii?Q?VY/pnf3QEUQBRpnXyLh3pwtad74M3edILdoBHs8XNL0tQVaEtTzF9ne7JW4J?=
 =?us-ascii?Q?OLCF1pNEijDHXoG3mxkPcMZ1B0Xv2AmUch7xfSzHfDewIHSelSHeDAd7AoL8?=
 =?us-ascii?Q?KeFms1tkoUqrUlsqvtCaFtQTCDGIKu87LkR8PsI+gPT9/nrQQB3L7bKWgMQt?=
 =?us-ascii?Q?wx125RrXX3ztl+CRqB8GHwc2Fu8EIPhBns3mB2Ft45lXmIL/sGzv7u35gjgy?=
 =?us-ascii?Q?WqGzN3YK+oKfKnzIvcrAjEkzotlMHNLS09JUd7scoUyfxfy+7pj9O4gDGZST?=
 =?us-ascii?Q?hBuNxRhcKPR5lrSqa1c5096iTLfYxpyqLAQOMWj0Vzj+VY9svZ9yOxJZuQgx?=
 =?us-ascii?Q?+PRGGuQKENUAOs9NLauCS7PGfbSSmUQ+UKMUwBmKX5+UbovUaGr5mvtwEMDa?=
 =?us-ascii?Q?REm6mTfRy+6iwmt/dB25aejxC/R71+vWAWFuAtKTDS5Ta3FDxd2iztUK7jHy?=
 =?us-ascii?Q?qKoQq5yPiVLw+vEyixGdhQy2S1qs/QnI6kgLzo3XzPygDdTaca/5S+0zbdKV?=
 =?us-ascii?Q?QazAd41AXVTvmseH6JRwHziXkHyYHwyFMKsj4Zw1pVTBqgwVo55BIEmNvOSv?=
 =?us-ascii?Q?UdZHt2ta96uPTdjm8uIktJNmBwF2GdvNXXBOncwXu3IrrqEebItixtYqaj/Z?=
 =?us-ascii?Q?w6o+fx+Fz/cKdR5/pzGgXAjPoP3nvammKFQuNVBgO2n+jBVFcvZcfagQGw9/?=
 =?us-ascii?Q?aTQViyNZQA4EBztDOdpgR8uKonhlOM/uH8Pb8RNkWGoGmsWOI8WsL40XCV1X?=
 =?us-ascii?Q?WX8F2th7kqdjLNCSXKiK5+LPiP/KFNJG4Ty7Hi+3MOoqzswfB1gSaqY7H3ar?=
 =?us-ascii?Q?koLTpcNv4g8+vNCCGw6fpe7hwV+wiCQ/WXQ6OeYCQg/YR0RK/00EaStchHdx?=
 =?us-ascii?Q?kkaxzwEKsnj/E/va/YjGOLo4t7wEANWMxHl8HwrSM9vskdPepT92in0ae+nl?=
 =?us-ascii?Q?tZzn84N/8/XngvF8V2mCULGZur3gbWybssEtzb7SgGdsqM0am593a9150gQY?=
 =?us-ascii?Q?b8BArW9g+vIjL6n5YpMGuniKi+B3lTe94j4EPueXDLJRPzJNhVO8/jYb9gd2?=
 =?us-ascii?Q?eM7EoOg4ehw1E7lOnES7GdtcONH6V2IpxvvIH82A7LPBRsPtD7m3z27JXfJU?=
 =?us-ascii?Q?VNRX3MRoNUGUEfTqD679K+bCt8zh7rv/pSuhElc0YS3YE6NRAohDDciS9sPq?=
 =?us-ascii?Q?jqEPPNe1F1V6APIcBJkpd0o0CtTxwU8T8cF4MqWEed44E/Wze3roEUPe6GJ8?=
 =?us-ascii?Q?+NOYRzSFV8yyzyCfDJUq3HY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 540ab603-d5e4-4958-9cc1-08d9afbd954a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 02:45:03.9772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OniS3nkV2DgSigk4rrBWT7TgkBKJK3c2bpqgNB2dZZd92mqzFuJoPtaQFEkt/drPbKAsbn5CI/8255zHyJCnxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2189
X-Proofpoint-GUID: 0GzwsXIY_pOwLOUaALxp7LOk8X9ERLnW
X-Proofpoint-ORIG-GUID: 0GzwsXIY_pOwLOUaALxp7LOk8X9ERLnW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_06,2021-11-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111250012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Nov 2021 02:45:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94119

The pyext_PATTERN will add native arch as suffix when cross compiling.
For example, on qemuarm64, it is expanded to:
pyext_PATTERN ='%s.cpython-310-x86_64-linux-gnu.so'
which will result in the incorrect library name.

root@qemuarm64:~# find /usr/lib/ -name \*ldb\*
/usr/lib/pkgconfig/pyldb-util.cpython-310-x86_64-linux-gnu.pc
/usr/lib/pkgconfig/ldb.pc
/usr/lib/libpyldb-util.cpython-310-x86-64-linux-gnu.so.2.3.2
/usr/lib/libldb.so.2.3.2
/usr/lib/libpyldb-util.cpython-310-x86-64-linux-gnu.so.2
/usr/lib/libldb.so
/usr/lib/libldb.so.2
/usr/lib/python3.10/site-packages/_ldb_text.py
/usr/lib/python3.10/site-packages/ldb.cpython-310-x86_64-linux-gnu.so
/usr/lib/libpyldb-util.cpython-310-x86-64-linux-gnu.so

Set pyext_PATTERN to '%s.so' to remove the suffix.
After the patch:
root@qemuarm64:~# find /usr/lib/ -name \*ldb\*
/usr/lib/pkgconfig/pyldb-util.pc
/usr/lib/pkgconfig/ldb.pc
/usr/lib/libpyldb-util.so.2.3.2
/usr/lib/libldb.so.2.3.2
/usr/lib/libpyldb-util.so.2
/usr/lib/libldb.so
/usr/lib/libldb.so.2
/usr/lib/python3.10/site-packages/_ldb_text.py
/usr/lib/python3.10/site-packages/ldb.so
/usr/lib/libpyldb-util.so

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-pyext_PATTERN-for-cross-compilation.patch | 59 +++++++++++++++++++
 .../recipes-support/libldb/libldb_2.3.2.bb    |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta-networking/recipes-support/libldb/libldb/0001-Fix-pyext_PATTERN-for-cross-compilation.patch

diff --git a/meta-networking/recipes-support/libldb/libldb/0001-Fix-pyext_PATTERN-for-cross-compilation.patch b/meta-networking/recipes-support/libldb/libldb/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
new file mode 100644
index 000000000..382a19ced
--- /dev/null
+++ b/meta-networking/recipes-support/libldb/libldb/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
@@ -0,0 +1,59 @@
+From c67c7cee024150fcbdca18764a026aed8724d7ae Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 24 Nov 2021 13:33:35 +0800
+Subject: [PATCH] Fix pyext_PATTERN for cross compilation
+
+The pyext_PATTERN will add native arch as suffix when cross compiling.
+For example, on qemuarm64, it is expanded to:
+pyext_PATTERN ='%s.cpython-310-x86_64-linux-gnu.so'
+which will result in the incorrect library name.
+
+root@qemuarm64:~# find /usr/lib/ -name \*ldb\*
+/usr/lib/pkgconfig/pyldb-util.cpython-310-x86_64-linux-gnu.pc
+/usr/lib/pkgconfig/ldb.pc
+/usr/lib/libpyldb-util.cpython-310-x86-64-linux-gnu.so.2.3.2
+/usr/lib/libldb.so.2.3.2
+/usr/lib/libpyldb-util.cpython-310-x86-64-linux-gnu.so.2
+/usr/lib/libldb.so
+/usr/lib/libldb.so.2
+/usr/lib/python3.10/site-packages/_ldb_text.py
+/usr/lib/python3.10/site-packages/ldb.cpython-310-x86_64-linux-gnu.so
+/usr/lib/libpyldb-util.cpython-310-x86-64-linux-gnu.so
+
+Set pyext_PATTERN to '%s.so' to remove the suffix.
+After the patch:
+root@qemuarm64:~# find /usr/lib/ -name \*ldb\*
+/usr/lib/pkgconfig/pyldb-util.pc
+/usr/lib/pkgconfig/ldb.pc
+/usr/lib/libpyldb-util.so.2.3.2
+/usr/lib/libldb.so.2.3.2
+/usr/lib/libpyldb-util.so.2
+/usr/lib/libldb.so
+/usr/lib/libldb.so.2
+/usr/lib/python3.10/site-packages/_ldb_text.py
+/usr/lib/python3.10/site-packages/ldb.so
+/usr/lib/libpyldb-util.so
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ third_party/waf/waflib/Tools/python.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/third_party/waf/waflib/Tools/python.py b/third_party/waf/waflib/Tools/python.py
+index b1c8dd0..24faa31 100644
+--- a/third_party/waf/waflib/Tools/python.py
++++ b/third_party/waf/waflib/Tools/python.py
+@@ -328,7 +328,7 @@ def check_python_headers(conf, features='pyembed pyext'):
+ 	x = 'MACOSX_DEPLOYMENT_TARGET'
+ 	if dct[x]:
+ 		env[x] = conf.environ[x] = dct[x]
+-	env.pyext_PATTERN = '%s' + dct['SO'] # not a mistake
++	env.pyext_PATTERN = '%s.so'
+ 
+ 
+ 	# Try to get pythonX.Y-config
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/libldb/libldb_2.3.2.bb b/meta-networking/recipes-support/libldb/libldb_2.3.2.bb
index 3f7ed36d3..d26acea40 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.3.2.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.3.2.bb
@@ -9,6 +9,7 @@ RDEPENDS:pyldb += "python3"
 SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
            file://0001-do-not-import-target-module-while-cross-compile.patch \
            file://0002-ldb-Add-configure-options-for-packages.patch \
+           file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
            file://libldb-fix-musl-libc-conflict-type-error.patch \
           "
 
-- 
2.25.1


