Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559CDCCD193
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 09:47:11 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.87])
 by mx.groups.io with SMTP id smtpd.web10.16334.1761212821540068279
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 02:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=b51UUpJ/;
 spf=pass (domain: phytec.de, ip: 52.101.72.87, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q63Mp+b601zSWHb4z4rz00SLmI4PyXAElXPW0aVFZlKk/NyDUHjtcc8j2G+/rtmyIFRnYVY6VXG2QC5mE3dJlN/2GW1jBJf0GerGwyu0kh5niDgTWw5Lsh6+PQgFs5k5MKZHq8+JR8BdD9+BTZlKXPBWL6vxZIUybCC9/sGoyzr5gb1S7JCg+y9F4CyNbjimiGKG0H4q5sUExYbxaUm3+ybJV5y6QqTXe2DHX3e9tApR3k00fBzqVhn9YsWavFx7y65hH9vlBabzYySGvjwDE8gaQ2S73fN0A10GG9WwVVrKsL9g6nQ5gWjaYzu+TmL4ciBgiKrzRybM9V55+7RGNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYK1PKq9tz7jmNK+QZjyi+BzvnsA59j8JNQfaqTVRo8=;
 b=mZnp6u5UsIgp2xe/ExqK9P0fx8ocoCjUiftqHGd8XsYsw/rEhOaYU/ZlM4tu8dGS0yz/3FTjpDinXZbjEJ88yBaTlpOgU/qrAkjQX5JBjpGqEgw3wZoNbjDf3sPFGrZhVemwbtlSzoML1ca3AA1mg6B8PIOmFyvYrtsz2GMrTYWxaTsK1kjPlF44+mZkNB2r8XLQNQeWUJ+tkgCw6BAM3AvEFhDz96UyFmup+e7c5rwRCS7C+kVv5JlnQ4Wf9CPTsa3HgOzoute0vVvosOuDhOWULraTRVfWQxlESb0ylIhGVegSWGszYMdY2nXN11HEDvKfdmzsY/bdW5GvllmQpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYK1PKq9tz7jmNK+QZjyi+BzvnsA59j8JNQfaqTVRo8=;
 b=b51UUpJ/KajcY9Jbx1niFL/X1lIS8wClm5ndjh7grMvRjeCfzN0QJd/+0z3NSwVixB2E3m/m8JMf03/ee+fOsXHVBg5pro3xqUBf4InhsHSLrVIidMgUIgs//eNIwCVClhGuKF4FKWkq2cgaNoEjiqjnV/ShWagFDNECbqaeEqYA3hbFBSggDS4cbEui5Qv5Fa6vR25CVE0BLBIvAaLfSUC50uSC11Un0dn8fdcEWsuL25lS+0aMM45g56tMp4Coh18DDrAptXHDFptP5TW3I/pmm/HVSL3732ojgcrbJ3TmsVV6ypcztgE6+vPlgQhwwdW5SnRKrW78taxxFmscpw==
Received: from DUZPR01CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::15) by DU0P195MB1449.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:345::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 09:46:55 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::66) by DUZPR01CA0051.outlook.office365.com
 (2603:10a6:10:469::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 09:47:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 09:46:55 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 23 Oct
 2025 11:46:54 +0200
From: Martin Schwan <m.schwan@phytec.de>
Date: Thu, 23 Oct 2025 11:46:29 +0200
Subject: [PATCH 1/8] python3-mmh3: Add recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251023-wip-thingsboard-gateway-master-v1-1-570de0ecafb2@phytec.de>
References: <20251023-wip-thingsboard-gateway-master-v1-0-570de0ecafb2@phytec.de>
In-Reply-To: <20251023-wip-thingsboard-gateway-master-v1-0-570de0ecafb2@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>, Khem Raj <raj.khem@gmail.com>,
	<upstream@lists.phytec.de>, Martin Schwan <m.schwan@phytec.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|DU0P195MB1449:EE_
X-MS-Office365-Filtering-Correlation-Id: d481e45b-3141-4771-19a0-08de12191a5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L29MaThQZkloRVRDZTJydGphNXh2am5mUHJrYVp6US9wblJKa1Z6YlU3dU90?=
 =?utf-8?B?alBNRVFkM2puMFp4cVF4VVI0Um9wV01SMVR6WGNtc2JxNGU0QmNnRDJqY2dF?=
 =?utf-8?B?UmxVLzQybDdhNXJSbGQ2dFVYMmZKTHZ2NGVuVXl3eHdXZStET3I2YnFOSUFj?=
 =?utf-8?B?Y1I5RjBuS0RMSlJrWVE2Z3F3Z0FlSjZ4aFhOZUk1U3hHT01qNFBMcVN6TjFJ?=
 =?utf-8?B?MEE1OUI0THVuVGZaNkorbzlGM1lZNG1IZjM2NlQ1ZUo1T2I0S0wzeGVCU1hy?=
 =?utf-8?B?V2NpL3VKTXBENkp5RXJhL0JpcnVCSDBXNTBlUWgrZ1VNdGQ2WEpCRkdGT1NN?=
 =?utf-8?B?c0JzdmZQL29PNHdkMmE2NnJ4VnlxNWdDcEN3UVpkMVVXYWdIeU5tMHBWQk5r?=
 =?utf-8?B?c0VpZmp3MjYyczlTZU95RHMvSU9nYUZlODkxUzQ5ZURaSTAwbHVMZWxiMkRM?=
 =?utf-8?B?cEVYYkU5bTFwVFFlOWwrb0U0OWt6WnpQM0J3czRUMTRBRStDWktDeENoK0hB?=
 =?utf-8?B?TjRtNE82Tk9BSHBZVkFLVmR0MEJzR0kvZEFob2hWb2R1aHdwcWtFUHlGVVpJ?=
 =?utf-8?B?Tmx2T2ExSjBTWUVBNmNqUjBJb3VHc0YydCsvL3I1R1J4VGt3TUNEWjd5RlM1?=
 =?utf-8?B?M2F4SW1QRER6UUdKT0RZaHltYk9WNk1KQ3dPdnJRTE9QTzR5QVlxV29mbS82?=
 =?utf-8?B?Y1d2NWlIWXY1OXUxZG9SWS9IMjRSMXFHVDJrSWZqQkFHQkFpZGlXSkU4VVhx?=
 =?utf-8?B?SExtWnZ6NllQK3Vaa21KSDMxQ0ZtdEFUMlBlWVdJYmZFOWtid3U4amRPdE9V?=
 =?utf-8?B?V0xPUXd4c2dtd1NQdzVuc1dYakVPcFlOMWx4VWJ0WlVySUpyN0Y5VGhWbmpo?=
 =?utf-8?B?cDQrdzZsVlpKVXA3VXppSmNjT3I1M0tFSEdQL1RYTUs3ci93U3owcTJZc1JY?=
 =?utf-8?B?R1VqaHhWSUpVQVBpM2JxRmxsbnFKcHEyem1KLzdKbHZvT2pUaTdDWHF0TDlP?=
 =?utf-8?B?bjA3UDE1MW9BbGFTWjZFS2JSNjVnQUZNYk8rRkZvdVUrd3d5L3JqeTJxVDF2?=
 =?utf-8?B?cjBNSkQwalliaWNYNUhRUmRwNTZaMHBZN081M0M2U050M09rM0c3RVhaQTBo?=
 =?utf-8?B?RHhNb0IyM3pIbTh6bEVtZlZDNkxiTC82OHhwY05nTFkyVTVLVE9HSGVBY0ZQ?=
 =?utf-8?B?QjZTY05zQXZJb0FidnJrdTJtNzFkSE1kSE83aVAyVkgrR1VIVjJtSjVLbU1N?=
 =?utf-8?B?eDI4KzI1ZG9xeGVxQ2lzeUJwOWJnaVVENkpqMDRpdXJIaU9TY3J6QlZKV1Jm?=
 =?utf-8?B?ZUkxbWtWVzU1azg1R2QxVzVBczh6bUt6cW9BZ0JoRXFtcXUwRjVFVDRCYm05?=
 =?utf-8?B?STUvOGxZUlZiQmxNei9wbjNWenRuTUhzT0tGSTNLSEdNMURJSmh6VFhrTDI4?=
 =?utf-8?B?Y25uVFQ5M2VWVWt2em44S0xUeU5PSlV2aVdhajkxMDltaU45WjlqcGZlaDdl?=
 =?utf-8?B?cWpnUUtzWHJyMDh4ZENTbjJFMGZ6YnZxei9xWXlaYUIzYVdsL1ZHNzlYSFVY?=
 =?utf-8?B?OHRXbzljeTJZb3Yva2Z6YW51eURXNFo4djQ5VHdiRFlzYnk5M0NQSE1aeENy?=
 =?utf-8?B?dmkwK1RCWXI4WnJvbHA5V0RQUUFmTjUzQVZUT1dBbUhhWHNDUDRXZVJWNUNZ?=
 =?utf-8?B?cEx4MjZRUmsxQm9FZ2dUdFZzOWF1Zk1HTFB3NEhiQkZFTjVtNmc0Y3BxRDN0?=
 =?utf-8?B?c2FmT0NQYWJDUm1qVWx5aDVaYjhBVjVGbnk0WmRNeHk4NlZDV05pcUIwZjd4?=
 =?utf-8?B?T1FuNFNWNDA1aXBqZ3ZBNWRxdXpzZ2t1SlRxSDRocGtBT3MvcUtlNXBxYjl4?=
 =?utf-8?B?Q0p6M1NjbmltL25hZEdQdzhRWWVIckR5MnlIWGVibXFJUFlpcm9zcGZKdzFM?=
 =?utf-8?B?WkxuMTBlWjF2UG9ONGh5c3NYc3oyV25hQ2syU0wwdDg5VjJNUWduUFNCWFpY?=
 =?utf-8?B?bXlBS0l5ZkJwS29MbXRQdmovdkE1STNOdEphaC9iRU9JdlBKQnBtWGxsNWlx?=
 =?utf-8?B?d1FXOHhpczlkSFczYzNkQmxTOXhrcUFXcTRSenZCMUpNSUo5WkMzTU9nODlZ?=
 =?utf-8?Q?5qww=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 09:46:55.8309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d481e45b-3141-4771-19a0-08de12191a5e
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB1449
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 09:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120924

Python extension for MurmurHash (MurmurHash3), a set of fast and robust
hash functions.

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
 meta-python/recipes-devtools/python/python3-mmh3_5.2.0.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-mmh3_5.2.0.bb b/meta-python/recipes-devtools/python/python3-mmh3_5.2.0.bb
new file mode 100644
index 0000000000000000000000000000000000000000..c71976288591804ae282136d6cf7898ab4c4af5f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-mmh3_5.2.0.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Python extension for MurmurHash (MurmurHash3), a set of fast and \
+           robust hash functions"
+HOMEPAGE = "https://github.com/hajimes/mmh3"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2edf2352bb2cd3d7787f05247781b314"
+
+inherit pypi python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "1efc8fec8478e9243a78bb993422cf79f8ff85cb4cf6b79647480a31e0d950a8"
+
+BBCLASSEXTEND = "native nativesdk"

-- 
2.25.1


