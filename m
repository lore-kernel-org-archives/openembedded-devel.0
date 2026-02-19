Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33438E9A03B
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 10:26:24 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.103.33.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10901.1771496318631038445
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Feb 2026 02:18:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hotmail.com header.s=selector1 header.b=LFi0J2AW;
 spf=pass (domain: hotmail.com, ip: 52.103.33.8, mailfrom: johanneskauffmann@hotmail.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPZdP77S3ADai/gW/VoQtIEgUvN+r37o2qD1weMGJrtvnqV4/ZmQxVo+IMA/kTl95pN7R0nPkvO7wyMb27UNJCrBE5yOdybO8wwg+4FDOG65t4V4B4ckFDrIvAe6zmIr8dHnURFScKDyvHulXitQ7mmORzayIU6p+6/ZUv24a7VJivpi4OCSjuHwb5UTUDW7Ow5Rns1LUMg4T1qkwJfNKAaViFWcKcYJox8MSLGkDgyuaUJCmXN48rDnFvMUdz//6Z3O19vQJxUGo49kpu7GEMvv946r20xf7KB1fyYckT7h+2gHwAIGCpmJJeM0bXXSn09KzNMXu4bGVEsnFJNRUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KM9wpAZBbkypZf3HwoVV4ojtrXnw4gqx4ipESQreb9A=;
 b=YEsX6NzOASRMekg/BJ8fecaxGPpWRC2E9MoI2TnexHZFhIRq2wCxwfzr/bKFHxGSMq0t8IEKIrvEc7CK4JeITH6D4u8pZlR18Mqp3lAhxLxwNRU96/9xmI8uG/Vz8fVKgQos6oq5JM7eICsiPoypLuFaQyzGij7bArxpzhmRXIjqJVIYGgEmsrQNpFoWyARkKkxWDIJ5oc7Vvl2lpjMETWbYAIoLBMasZx3V65bMb9CTu4TY8uj6+WZs/MI/Oa5YiZE6tu6+Rt373BBOLqtJVGpxkeKkpqpvToXTzKqIeWqzRqJTcJW+bF94VidI+Z+ny5Y6jxnR05STlcuKjDW1yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KM9wpAZBbkypZf3HwoVV4ojtrXnw4gqx4ipESQreb9A=;
 b=LFi0J2AWhLEQlr6iKFOeLT3Uc0oaw5fTpibCmUna9fg7qMA44O+wtzPY7chbW8BQPXioNyEjaTmk7swn48ODxk6/ZrceGdvwxmF0sFTQNxjFIPeu/ko8Ok4Q8QS2+EGVIwWgfb7QzbwjhJfdZNo26lKRgz3bbt8ioHi6Q7QOrDZdQgu7agmC13jUgtbSapLlswk3VbKOiNINoKhKIMLeoCQ+Jg4Zv3iN6tpHPk+q9+rrVQ5X1CdIPYIfLt/gYwzfOKSd1LYrqkyFnQJPrLTqpNjdCb+Y93yZ3bVTNPpebKaYE5hj45CxH1lCPgr6dSPXypezHbwf4CIEAnqLwPxPUw==
Received: from DU2PR02MB7805.eurprd02.prod.outlook.com (2603:10a6:10:2e5::10)
 by DU4PR02MB12227.eurprd02.prod.outlook.com (2603:10a6:10:631::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 10:18:35 +0000
Received: from DU2PR02MB7805.eurprd02.prod.outlook.com
 ([fe80::c843:bc28:efe3:e298]) by DU2PR02MB7805.eurprd02.prod.outlook.com
 ([fe80::c843:bc28:efe3:e298%5]) with mapi id 15.20.9632.015; Thu, 19 Feb 2026
 10:18:35 +0000
Message-ID: 
 <DU2PR02MB7805CD011989050AD3975D69A66BA@DU2PR02MB7805.eurprd02.prod.outlook.com>
Date: Thu, 19 Feb 2026 11:18:34 +0100
User-Agent: Mozilla Thunderbird
To: openembedded-devel@lists.openembedded.org
From: "Johannes Kauffmann" <johanneskauffmann@hotmail.com>
Subject: [meta-networking][PATCH] open62541: update to v1.4.16
X-ClientProxiedBy: AS4P189CA0053.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::17) To DU2PR02MB7805.eurprd02.prod.outlook.com
 (2603:10a6:10:2e5::10)
X-Microsoft-Original-Message-ID: 
 <e770708f-a651-4d1e-b32e-9b04b807c14f@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR02MB7805:EE_|DU4PR02MB12227:EE_
X-MS-Office365-Filtering-Correlation-Id: 9091cab4-8513-4b29-10cb-08de6fa03d61
X-MS-Exchange-SLBlob-MailProps: 
	9IecXKUgicB5Y5xtj3Bi4po1AHQXatGhAwNK89kQAKFfDOEgMEtwZeNiiZX51i85ere8T+wDep94bY56jxRz2pZnn8TRB4U2kHqdBFPFFzE3F8yqeW8CElUliRJxZiZJ+ls25WOUrl5gHYJZmicaYPdg+VOPp+ASJe/iGXA+i+NMkt+wxXN5+jUBHG81up9/RPrgnMvlR8ficYnC6MUyedr5PBDZ6xMf8Vj/Wib8EpZv+izS4jKNyF/U1wU/fXD5RebdTmD9PJym2spCgXJBl4k/aecUdl+EIRLDyca4ExiKqdzV7+T2dZt1o/tni7iwyG+RojWe0nDucbPefbRMbkoyS6fwQWlGVPD303jNanKMKyHdEvg/g7nanCmkF+lmWDWNc8vGt6K3doRH2BeGD5HZsGKJyOCCB/4QYYoVxgCfXycxNwwlxYEnIbhB2o3/XOByzPF2SXRSIEuYLq1wJji2FeLOeZnluc0w2X2+pb7b0zqmKbnHKsaZ+Ufz5dta6V0rC6LfubnyrlPaLtxSoKYKWzHgVek0ENp7A/SpSULFBLLj8OLNScCwcZBAQ+abzviIT76I868UVJRFpcmIH4Ye5nLzXFyRJfh697CYo0is/4YFGIyG0SWublstPwsvyfo9JCDHKJfkrTP0t4X6Nw2asr++keBN9OiZ+YfdyCBHnX85AT28P8edPeglvQX7HfO9UYgcCiHdGrUkbaHDvhWpt7l9ldgD0O9CRvvO8cufcz/fTs1bHw==
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|23021999003|461199028|12121999013|8060799015|21061999006|19110799012|15080799012|5072599009|6090799003|51005399006|5062599005|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S3lXVjBxMHpuRC9pVWwzWUU0anFDZFR3dytBQ0RUTXBZNWJoalJEQ2lVWVFt?=
 =?utf-8?B?UnkzYldMeHhOOWMyNW44VmJ0Q3NwZHJUVFplcGh5MHNZWkp1NjNRLzVhTzlV?=
 =?utf-8?B?amhGeXE0NGVzOE9MREVRNFpMQXUzMjVCaUp2Yzd3Q1Y4V2xxVWE0ZzNZY3k0?=
 =?utf-8?B?bk43b2JraFBSWmpoSXRJdUh4QWU5dUJWK2M2ZkgwdE4xa250TmswTlNGZVlP?=
 =?utf-8?B?VXR4YlhKQVJpUE9iakc3d1FPMVJON08xT0VVcmJPZThQVk51cFJVQ094bG5T?=
 =?utf-8?B?ZytpYnV3b1BuSUM4am9ickVEaEZISWQwQlFpSDFaTVdDcTkwTk10Vjd2KzhM?=
 =?utf-8?B?aE5MTEFISUJ1TktGcTNRaWZMeUFLbmJaOVZyb1NJdTlTRU9HZnJqYi9ENWpN?=
 =?utf-8?B?eVFER1BzL202bkl4UE9FTVBZdktVaGRCQ3pDMmdTbDRTNVdTTFdEWFJ5MEFh?=
 =?utf-8?B?Z1Y3eHd2dmJuWkdqelN4MUFPVGFWZ0xKYXY5WXJ3NmZESTJhSFU5WTdnRDdI?=
 =?utf-8?B?RDZzbE14d3N1WWRVRXFHTkJWcUloV0M3LzZkaVh1M2FraHFFanNYMGZCcHgv?=
 =?utf-8?B?UFJRM2FWbGwwUW9OYm9nU29iVWZMVTErdXdFY0l6QzdTdlc3MXlVV0xiTVBC?=
 =?utf-8?B?T3VrL0szd2hpUEVsQmNNdnpId3FFVlB2VENiS2hSMTUyOTkzS3ZQVWVueUxV?=
 =?utf-8?B?OUhtV1lJa3FyRmVVQjg4L0pXdlNtWkVaa05sdk9wT3JsdURseXBWcFpuQTdF?=
 =?utf-8?B?ZE1EREpEcHlxa0NlMm1aVFNBU3BjWFpueGV3TnhmK2I3NVg0U2hlRzNBNVcx?=
 =?utf-8?B?TVlzM2YwQ2Q5NFVqVUQyYzUyL29RMElacXlDWVFvVnlkdDhmWnM1TFplekcr?=
 =?utf-8?B?VXFLNk1mUERMWFljejU2NUJtTm04elJ5RWNJRG1kVlppU1dERWkvU0NBeDdX?=
 =?utf-8?B?emdzL0NrTGJyVU9JOTFSaXZUblVZZTdkc2pqNFF0TTBYMzU2YXo0UXJ6bGJz?=
 =?utf-8?B?TTNnc0hRWEZmRitYQU4rRHVMK0N5L0hjZCtxaklqdU96eUNqTnI2Q1YvZVN5?=
 =?utf-8?B?bWhQdENBZGJvRFRmZ3NCSkdhdDdNaTdLMEE3ZXpNVnBXOU9sdnpORTBaWXRV?=
 =?utf-8?B?dmt0MzdYZXpmTjROOXhMYlhxYk9vRXA1R1phZWk3YVV6NnRCWkNBQ3FoNmNU?=
 =?utf-8?B?U00vdWh4U0dOakw5MlhqdnYxSnpmeXVCUklXajNlcE1BQkxrbkhFMUxORmxu?=
 =?utf-8?B?bms2VFl2UGZqRm1FSncrRFZCeFdORDFwNDQyTTl4OEpGdXRRSXhQeEY5Q1FS?=
 =?utf-8?B?V1UrblErWXdhQkNseTBBNFNOcHVQM2NLenUxa1hVbG1FVHlPR2I2N2d2aHg5?=
 =?utf-8?B?alBEUHBJZVU5S1RKUTFxaXduQSt6emtJS1kxTUVyR1d1TmxuMkVXd3poUkFa?=
 =?utf-8?B?cGlraUgzN0xGUjVQOFN1cCtLV1RrODlnUXJGaVJ0SVdmSzdUUlNNTGYzY2Fa?=
 =?utf-8?B?UnEycU1mK0R0TXFxaWlyblFQekxOVFo4Mm15dDVTWWcxd3h2VGFRY04vQk5G?=
 =?utf-8?B?eXpuWTUzZmlUY3FVUUEzVmRPZHlvaGUwUXUwdWsxWGRyU2ZXeittODRLSEhL?=
 =?utf-8?B?cktWays1WnU2UWVJWDd6RHZzMVpBL3g2VDhDRHcyZHA5cjlFNmU3cDZJRTRH?=
 =?utf-8?B?QzR2QUw0eTN6VnFYdGw0bDUyZU4wYVRiYjM2emwwNExpWEdkMjVCa3ZvUXN1?=
 =?utf-8?Q?uwMjiULVnyj8VGKZQs=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QkZsTTR2Y05DMjI5ZWtrSWZZQ0UzNXhKSlJqNVNtYVBTaXU3RndWS0hzelk4?=
 =?utf-8?B?a0FDZlozSFFNYkpOdlVjeWJZdkNBNk9JK09IeTZ4VUJhZmgwTnVRNHFWcThp?=
 =?utf-8?B?ZUVDbHNFa21nOGZQa1lNaWwycHhPRjR4Q1A1eFlHQmZ2RHBvclovNEdBeGJs?=
 =?utf-8?B?SnlYV2ZZTFpINTB6c0tSQi96KzZGdlRMWjc2UzJxZTFwRmJMRHZLdkR1OW02?=
 =?utf-8?B?NjgvREY1b2FNT0xPcktxVGhUbU90aEQxS0Y1bU9SL0JqTFlsUUsvZ3dYVnZU?=
 =?utf-8?B?L3hwT3hTcHV3L2J0c2xsbm1pdHJWOHRSaVN2Y2hPWitkLzJ0N2xrZ1paMEY1?=
 =?utf-8?B?M1VVSDJNNlhDejNrNDh1dm1zRjZzWDZOQmcrODQ2WlF4dHdKN2UvUk5xbmQz?=
 =?utf-8?B?RU96Sy9PbEh1Qnh2SXgzYkRSa2RKTmJ6UGhGU0pHM3VzOEJXRmhDWlJwT3RT?=
 =?utf-8?B?OE1vN3FFcW5xeXdibWJNWGo2djErekppaENtVk1lWmplem5sR1BqT2k4dUY1?=
 =?utf-8?B?U0VzdElqUEoyRU5YeUZXMTl1N3BkdXRhMWpuYUhsUzVmQ2xlUlpYKzNqREVx?=
 =?utf-8?B?am5HYnUxWWRpWktvcXNBSWtVSjY2eGNRc1N4Q0l5blRZRDU4MTJuUnBrMFBo?=
 =?utf-8?B?cEpGcmZwZ3VDTVpWbkRNMmZ3SEticmRKRWNWVlVVdDNDWFM0dktLcUJsVUlN?=
 =?utf-8?B?TjJFZ1BlZDNrS0dNVzhpcG0wcGR4NEJoZWQ4Y2JaRHZNZXRSYnhJZFhFT1B5?=
 =?utf-8?B?a2tPaVhsUFlHQ244ZGM0cS9mYWMwT1plZDVYbFVpQkkzaTRoOHJLZWhDWm9X?=
 =?utf-8?B?S1NZN1lDQ3p0dGlYR0JSOGovdWpUOGJDdEZiSzg5UElBZFZBQWZ1aUZMSnRR?=
 =?utf-8?B?ZmFKZG9HSmRjRStkMjV1cXA4bmtaNlJZakw3UnRVQi9TWGFiWVBMTWc0S3gv?=
 =?utf-8?B?T3J0dUlLT0JhckdUNFZHNGlEZHNESDhEcnp0WW9KVmMxUEFlZlc2bjMrQTVR?=
 =?utf-8?B?VENvTlFwb0h4NHVrZ2cxdXcwT1lVUXJrZ0VkTUxUSWE0Wk1iV2d0ZXVaVm5t?=
 =?utf-8?B?R3JFVnFSMG9IZFVIbDNqUUNZZFBBaWRZckRQSW52VEx5dW1teTZSdFNMdVBQ?=
 =?utf-8?B?UmZ4WVdRbjFMaHFtRDJmcys0SXNRRlBPVWZGVDRWdWNldTQ3Ulc5YUE3UHQ5?=
 =?utf-8?B?TzBmaWlnYzZkbU43RFNSMmphK3JFRHo4amVuK1hDZGJPZnFUUVFiLzNEbUFv?=
 =?utf-8?B?Wmh2YzM1NzdYMVdkdzlBM2w4MzQyS1l2SG1nV3B2U09XTzZzRFFZUnNzUVMr?=
 =?utf-8?B?dlNYOVVnQW5iUFZzWVROWXNQSkQwMEQ4NFAxdVZYRTY2MDduTnMxaWhlZnd3?=
 =?utf-8?B?L043M2xrcVZZRWNyUDZiZlNYcFFnZ1E5REdPZW1tK2dwM3h0NUZPeTVzWXhs?=
 =?utf-8?B?ckM5cStOVUwvdjNCZWF1dG1xM0NuRWJ0bTVRaXBzcXNYeDkvK0RHWnQ3UkIx?=
 =?utf-8?B?SXV6TjVvc1FCMW52TW5nc0tqV3cxdXk2SVJBakN0S0JlbVFSVmlCYUNqUlRt?=
 =?utf-8?B?T2ZHT1REY0REbklXOU9jRXNsYnlvclhnVisxbXB3ZVZnY2xHeWVmc2FBUVMy?=
 =?utf-8?B?Q0FzRkliV25lWE5VMXphbGQrSnFyellIdWtQUmpoT1BHTjdCR00vUW9uVTdt?=
 =?utf-8?B?cEVRRHgrYWcrWUNmVUhvcytFWUZKbVVGTEROa3pWVmpmVVBFS0kzTHFyNmgr?=
 =?utf-8?B?ZStWRWRFQlZrS0poVEZrQWpGYm5EM2hzOHVPN01QU3RRcnQ5VXRDUnhKWURS?=
 =?utf-8?B?M0hQSlEwbXFTeGJHNlR6NkJHRmkzVXdxTDR3eVlqZmJ5Q1MrWnhYM2k5QkpF?=
 =?utf-8?B?c1F2eG0vc3JQVWw4elU4NW1ROSt1SnZyem9QY29KTWRtY3c9PQ==?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-c3f6e.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 9091cab4-8513-4b29-10cb-08de6fa03d61
X-MS-Exchange-CrossTenant-AuthSource: DU2PR02MB7805.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 10:18:35.3167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR02MB12227
Content-Language: nl-NL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 10:26:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124504

Important changes from the v1.4.16 patch release notes:

- server: Block transfer of subscriptions between anonymous users
- server: Track transferred subscriptions for correct diagnostics counter update
- client: Don't close the SecureChannel when the servers sends a late async response
- pubsub: Add null check after UA_Array_new in addDataSetReaderConfig
- pubsub: Prevent NULL dereference in UA_DataSetMessage_decodeBinary
- pubsub: Initialize value in UA_NetworkMessage_decodePayload to avoid undefined behavior

Signed-off-by: Johannes Kauffmann <johanneskauffmann@hotmail.com>
---
 .../opcua/{open62541_1.4.15.bb => open62541_1.4.16.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/opcua/{open62541_1.4.15.bb => open62541_1.4.16.bb} (98%)

diff --git a/meta-networking/recipes-protocols/opcua/open62541_1.4.15.bb b/meta-networking/recipes-protocols/opcua/open62541_1.4.16.bb
similarity index 98%
rename from meta-networking/recipes-protocols/opcua/open62541_1.4.15.bb
rename to meta-networking/recipes-protocols/opcua/open62541_1.4.16.bb
index 15dbd4b2dc..32f7148f4b 100644
--- a/meta-networking/recipes-protocols/opcua/open62541_1.4.15.bb
+++ b/meta-networking/recipes-protocols/opcua/open62541_1.4.16.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "\
 "

 SRCREV_FORMAT = "opcua_mdnsd_ua-nodeset_mqtt-c"
-SRCREV_opcua = "45e4cd3ef6c79a8e503d37c9f5c89fefe90d99db"
+SRCREV_opcua = "f63e2a819aff6e468242dc2e54ccbd5b75d63654"
 SRCREV_mdnsd = "488d24fb9d427aec77df180268f0291eeee7fb8b"
 SRCREV_ua-nodeset = "d1bb6a22125bd7cd986272b1ee98a18a91d76fff"
 SRCREV_mqtt-c = "0f4c34c8cc00b16cfee094745d68b8cdbaecd8e0"
-- 
2.43.0

