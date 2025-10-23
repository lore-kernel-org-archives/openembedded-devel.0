Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE12CCF9E7
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 09:47:11 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.108])
 by mx.groups.io with SMTP id smtpd.web11.16443.1761212821437435179
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 02:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=vGkGKR5v;
 spf=pass (domain: phytec.de, ip: 52.101.72.108, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ow06vz4Y5Nn2kWdZlv7pTdbxGZSihqjQN8T204OUpeMT7vc5R+ji1v7ri/f1PKL3HmwZVzt2Xfvq9ezcrWQBctG/AZqCOJe4qNjXkN2hw59DHFezLokhHQDDB9pL6G2qF5HhB2M+n3NUHB6Dt1wm4qj61s6FzEc9wbgXpbMA/mSC1b3v0cge2sTngJSk+jTL7nSQTK1sre5xSYJbjIJnqBOWx6D0ngGtcmBHBKcXe1b/uhZ58GiufJLK5bwYBqKj+fNcsdRlNPbWwKNSRGwJyjZz5KXLmnQosW1KdX6I7xAB+nnqDsSQnlGuh5qJdb2ZlprbCOWznRdNyaSaZ7NgJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCn8xCHqflCLkVA59wG7SMZgXSQgllY2+aRFDH22Rps=;
 b=SJV0naaJwNzgk7nDs+ZyYq1ISE1zTBv2sc0dI+T4Cy3KESNar9xYoUirw7/W2RjMnUaiYotx4BSCDOorxHgOotnWM8gVYRTwi9/aIwu25S/YSuMGc9gZdK5ynyVJcOF3pF/LWbdI5i0VR9SXt7Gn43NI8MyPhSHuEC/n7CUgfnXEC8VyOehuc/bbcQ88DF/qHZzpDYmKSJ4Y3OfvU4oegOdP0XXzoWTVtqIPtkEOXt6MOrwXHYNTvi5bOj6kq9nxolNwffptt4sVTAI+c9xfvCqMMa67gccKZIPYgg3xEQglzr+bQHkLu5p3pEIz01hLzEJJnHVJvfeGpDZKlMyNXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCn8xCHqflCLkVA59wG7SMZgXSQgllY2+aRFDH22Rps=;
 b=vGkGKR5vxRu8WU1yhq1AC9MGBTj8QsFFTs1DJZqvZiQHEFBJxsHn6UVz+4aOrGVaYsVOmSXE+iWdUuVXye2eeRB2ybp0I4UqMSR8jgkrGIaRfWP9jQR9rq2hJ+A3bFsIKwDpEm72cm1w01q5NuslxBX6lpsUAidMQFa95KRvAwLvfPNM9d+vlJHwnaYDO7P7aWKE+IurA/zJH6jCIPTo1A5doO+m2PqbjiZhX189lxZUp8vCcPVaRdRKygegm81UxttJzBkFojh/hJjDl7NWwbDLoyUJVxR26iMseHrGZgXTc5+mX0Wq0YPQAwpUPOJLEPSD7ZwSDeSmu8fZv/E7EA==
Received: from DUZPR01CA0050.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::20) by AS8P195MB2316.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5a4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 09:46:58 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::9c) by DUZPR01CA0050.outlook.office365.com
 (2603:10a6:10:469::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 09:47:40 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 09:46:57 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 23 Oct
 2025 11:46:55 +0200
From: Martin Schwan <m.schwan@phytec.de>
Date: Thu, 23 Oct 2025 11:46:34 +0200
Subject: [PATCH 6/8] thingsboard-gateway: Add missing dependencies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251023-wip-thingsboard-gateway-master-v1-6-570de0ecafb2@phytec.de>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|AS8P195MB2316:EE_
X-MS-Office365-Filtering-Correlation-Id: 23dbad7a-5d37-48dd-ff56-08de12191b98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Vkx6QXRxRGU2RysxMXdobmpRSWUreUlNTVVQUFJnVHFJSFg4elFHcFF5Z0FC?=
 =?utf-8?B?R2FrQmh1Rm5CM1lmVlB6SjFPZkFuMERMSnp1QnpSdEVSK1hkYTFLNVlYRzhW?=
 =?utf-8?B?cmVtcUpSZW1jcXJvY3BPM05TRGR1ZXhYV2ZuWWxDSWN1bFQ2M2UzcytuSTR3?=
 =?utf-8?B?REhDZ3BxUTlROVA0OUZQdktoSlNNQ2w3b1kzazdFbDcvc0EvcGdBTm1lT2ll?=
 =?utf-8?B?S0diY3AzNSthdXFCUUhGSmp2V0Z1L3EybVNYSjByQnYrRG5QV2VEOFVTM1B2?=
 =?utf-8?B?cTMrYS9ZbHJ6Y3N5TUUvemM3WU5Ya1Y3MEJMd1dQVTJDT1JGSWtmaGxqdlNP?=
 =?utf-8?B?Tk1aK1AveHMvby9VMGNpNEdBY2FOSE9ia1hBaHZEVjdCajM0a1F2czBXM0cy?=
 =?utf-8?B?THFCYTJ4OVBXcWZReFY2YzlBYVprTjNZeGhpYlZJSWMvV2V3alNzM1JKaWFk?=
 =?utf-8?B?cmNmK2hocnRZeUxyaDQ4aFRzc01pWlAyR2xjQzc0R1ZaTVJBTjVVOWhXeHNz?=
 =?utf-8?B?eDhoQzFXV2kzTkpUTXIzZlFKUyttbk9iMmJVUTJDVXVsSjVnWk5weTYxY1I2?=
 =?utf-8?B?ZFlvTFhOSVhJb0RYWEJzbTlCbVZmM2d3WFdEREtJMWRMNm5YaWRBU2NMbS96?=
 =?utf-8?B?NFdsRnhURmg5T2Z2Uy9mQ1ZEOXcreGdJcmgvZzB2RU50WW1jQUV2WS9UM1Rh?=
 =?utf-8?B?ckNyR3AvQkZwMGhLN2dCcmN1ZkZLSHN0dEs2NEdvVHVpaTF4K05jNTkzMWJC?=
 =?utf-8?B?U0oyc25XT3R2cFJuQk15RDBkM0txQ0FqMk0vU2pWMFIwb29rVlYwTTlYNS82?=
 =?utf-8?B?MldiV1J2V1QwN2t6Nm8yQW1CTWtmanBaTU9RR3Buc3cvcDhHL2hGekNBUUNN?=
 =?utf-8?B?RG1PTUhvOGo0VWZtSUFDeFJCTzh4aTh5ODhLZHE1eFBCaVFzZjkwU0d6TDdL?=
 =?utf-8?B?OVdHKzBpUU1yK0NIQUFvTmc5Z3g0SFZUQ0lDSEVRTDlUdnpGV0tjT3VVNnFM?=
 =?utf-8?B?QW5ONE5iSHVjbmNqYWp5R0I1TGlzSVltSFlTSHFFRExmbFBaL3AzY2Ewb0hU?=
 =?utf-8?B?OGZmaXVZbXNGdnkrMGUyV0FLMFFPTDBwYXZwVFZHb0ZPQ1RtTTlReW5OQUxa?=
 =?utf-8?B?emo1Mk16a2RHWDk5UTYvRmxBZUFnVVNmTVorYy9VUXBrVU9zdUJlMVQ5cnlw?=
 =?utf-8?B?WkhLa2FlYWFjQ2FkM2NwUml4TTgvdXNsWDF4MGFQRXVocjRNK1NDanZPM3Rj?=
 =?utf-8?B?NiszcWp5SWxnd25CbEdNdk5BeUE1a1U2TkZrTVlVYVlqbmVxQmNSWE0xdW50?=
 =?utf-8?B?a1U3WEJzeklvR0luSXNQNE9mL0NHbWl1SGJOR1hQRWt5a1JmWnk4cU40V1FC?=
 =?utf-8?B?bkcvZDZoQk5tSW1mbURVdm5DcG55VXRLWVV4MTY4RE1iZmtZWVVVSzlpTUMy?=
 =?utf-8?B?Vy82QUJCbjlLRXBHbHN2TnlCMUUyT0RvQU5vRDFuYzcrY3poYmFPdnBTMEpC?=
 =?utf-8?B?cysvQTFaUlJBaEpSUmVucHhQdExaQzVJTnZYbVJHN1IrUU9zdDhBZ3ZOVW96?=
 =?utf-8?B?WndLaVNBVVZyYkkxNW1VMUh6aFNHdXphaXpOekVVcW5kcGFyaDlkbjhlRE9B?=
 =?utf-8?B?N2xGSzJyN3hmMWVSNm05dTZCUzBhUlNDQklLc1E0VjRQNW1NMS82ajkrSi9l?=
 =?utf-8?B?alA0cDB6UFNKZW9EaHNVM3JuSjNjZERQcWdzZDRZTlc4c0NMNVI1V1Axb1dK?=
 =?utf-8?B?TWFxdGNQZ2hxTEc5UlZLVUdaV2JvaWxjc0J1clFEQVRROUxVSUtXQ0pNY1FJ?=
 =?utf-8?B?MHJRUGNuUXJqREhqUi96bWNVSzJxM0NMNHFuaHRNdmhSbWo1SU51ZEp4Qkg3?=
 =?utf-8?B?bkFVd05hcVQyRGQ1d3U1VUVNT3FNS1JCVHd6Q3Bndzh0UEx2ZDBSbkRyR2w1?=
 =?utf-8?B?SUUxYThtMVNQWTVXdjdtZjVNVkgwa1dRaEowd1Q2bGxML0E2eWRtUjUwTGcy?=
 =?utf-8?B?aXR1N0puQ3NTalJlTUZkVTlrM1h2Y0I1VThXUFlXbHFmN3NkOVFzZm5XU3V5?=
 =?utf-8?B?U2sxRmh4OGhCUk1nSHJwZFN3aE9NYVFFKzltRzZCNklhZVlFaGo4T3NvTmEw?=
 =?utf-8?Q?nG40=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 09:46:57.8961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23dbad7a-5d37-48dd-ff56-08de12191b98
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB2316
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 09:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120923

Add all missing runtime dependencies that are required by
thingsboard-gateway. Since thingsboard-gateway tries to install missing
dependencies via pip and fails to do so, install the dependencies
system-wide beforehand.

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
 .../thingsboard-gateway/thingsboard-gateway_3.7.4.bb   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.7.4.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.7.4.bb
index 57e162cabdd73125f53d01c5294fe0f23e34bd47..83baffdc054a4530adca2fbebe97b04c7064010c 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.7.4.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.7.4.bb
@@ -21,6 +21,24 @@ RDEPENDS:${PN} += " python3-jsonpath-rw \
                     python3-requests \
                     python3-pip \
                     python3-pyrsistent \
+                    python3-cachetools \
+                    python3-orjson \
+                    python3-psutil \
+                    python3-pybase64 \
+                    python3-grpcio \
+                    python3-packaging \
+                    python3-protobuf \
+                    python3-service-identity \
+                    python3-termcolor \
+                    python3-charset-normalizer \
+                    python3-mmh3 \
+                    python3-dateutil \
+                    python3-setuptools \
+                    python3-urllib3 \
+                    python3-questionary \
+                    python3-pyfiglet \
+                    python3-cryptography \
+                    python3-pysocks \
 "
 
 SRC_URI += "file://bacnet.json \

-- 
2.25.1


