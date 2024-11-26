Return-Path: <benjamin.bouvier@ekinops.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16144D5A6EC
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 07:44:41 +0000 (UTC)
Received: from PA5P264CU001.outbound.protection.outlook.com (PA5P264CU001.outbound.protection.outlook.com [52.101.167.135])
 by mx.groups.io with SMTP id smtpd.web10.40641.1732607072648308584
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 23:44:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ekinops.com header.s=selector2 header.b=EAMtJZ9e;
 spf=pass (domain: ekinops.com, ip: 52.101.167.135, mailfrom: benjamin.bouvier@ekinops.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLPswGbqJX3heqJEkYwGFC1xPap9HM0GvK98pG4uX+J0LhoeLJOhfcA/7bFYFTwbogsXfMB6pemSq8j/N/Nuxl/pKs4bx+uR14FhUoxhGSulzHCnXcPNxP/EY1eEG24+8EfrBzed7dkuIvDOb2UCEKyj8RLlOrRpsVfkDoHTU0bLgkjuFt89dLRfaKxPBkOwKLpZ9r42B3/RAfLaIddh2ngt5UXzqGg+QkrVCJM66o1bNKdd4wnmF/cz8yFLtlpIJ9RyBIdid0KMSTyAnbntAUE8XH0S/h0Zc+vo15o209TKWUC1mGguFdzUxPUkMPlGUB9yYMuai5zmkF8+7l+21Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hX2uYMHNhuPJ4y0Yf2MqVSVVl8n+TbD7sE6Z/fzbv6s=;
 b=Zg5CBghSInmAiK4tZJnCT+fOjt6iVettlJskY1gv2H3NG+8w+uz54SWfe/h2tsenBRIaYJMREoptGKv8FLMY4GO8Mcj5o53i7InrSO3JZlYQ41Kqyc2EpWGOLViH4w/acJsOYVwOlRRol/1a/fXNsnmHePci/h6vUmmlw9KLKp+P39Tk1N9mur3dTuH5zDMDGchv3bxMlbSdnvV3+kScqxzak4fYZy/gH0K24OHAejj+vwEVl+P9cvqR7ie0uP+/gV4ViFZhgYg0pxFKNeMFHDRPZungjiuNhaOhMYn17iCAP5VugV2zaXG5+wEOa1VA6jd1hiQvtLoAzvRs4GDzyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ekinops.com; dmarc=pass action=none header.from=ekinops.com;
 dkim=pass header.d=ekinops.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ekinops.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hX2uYMHNhuPJ4y0Yf2MqVSVVl8n+TbD7sE6Z/fzbv6s=;
 b=EAMtJZ9eeQkVxUeC00xMAGfPRvJeUuGeNZ2kMuNaaELVAMEc7ysDncBKIhbYfp8FxW7ayjLx7llKHfVSNnaJeUwF3AuZh6PVL8INXiHdNM/yqGT/SE0NIZ4H4Hwn1L8iye9AkidhHy2D8sSWSDmO1kEWKreRnek1gzcLVXLIhpc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ekinops.com;
Received: from PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11c::11)
 by PARP264MB5710.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:4c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 07:44:28 +0000
Received: from PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cea:c378:fb53:82cc]) by PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cea:c378:fb53:82cc%4]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 07:44:28 +0000
Message-ID: <7d40f30c-5644-41db-bb5b-ef01fe6297f1@ekinops.com>
Date: Tue, 26 Nov 2024 08:44:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH 2/3] bridge-utils: add CVE_PRODUCT
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20241121082901.2747720-1-benjamin.bouvier@ekinops.com>
 <20241121082901.2747720-3-benjamin.bouvier@ekinops.com>
 <AS1PR10MB5697EA4EDECB7A2FE01A9C2AFD222@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: fr
From: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
In-Reply-To: <AS1PR10MB5697EA4EDECB7A2FE01A9C2AFD222@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PAZP264CA0038.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fc::20) To PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAYP264MB4350:EE_|PARP264MB5710:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d0073a1-0178-404c-9b9d-08dd0dee281a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NlI3RU5RUzJobmtxYmhDU3Z3Zm93ZWo1ZTV2UGtNWDl3R2JBTFJrM1pOUFVl?=
 =?utf-8?B?Uk50VjJtSC9BS1VpNlZ5ZzRLNkdYbUlQeUEvOXRnRERJekk3N2w4NkhnNGZJ?=
 =?utf-8?B?UklUTmVQZ3BLdWVDRkxiSThWbHRVYWhESk9Nb2tMeGZRbjNOMmNGcEREcC9H?=
 =?utf-8?B?a1RKblJEdG5vT1VvcXcycHBJem1LK01QSmZuS1kwUW5yeEhudmZBUnFiZDVR?=
 =?utf-8?B?TmNIVFd0MncwVDdhb0hoZHBTN2FMd3ptMEJDZDkxSlhYblFnNERxTlFMQTFV?=
 =?utf-8?B?cTRzTEt6QkFidSttbEdvdHJRV3cyRGdPc3Q1VlFzQW1JY2NKZWMxY05NOW1q?=
 =?utf-8?B?akhleGFjRytkNGJPbXFNRzQ0ZlN3bkZnODA4VkdlSUdoRVIrZ0N4cGg3eFdD?=
 =?utf-8?B?bmFUR0swM05VdmZ1MU1EOUNZQ09NVWpUY3dUY1Z3ZElvSm9PVHJIWjhnTExF?=
 =?utf-8?B?Y3psazVLcVp4YTNrdlJUc2JlYnFSUUdNbVgvSWZZUWxHZmJIaTNXVGxSUFN6?=
 =?utf-8?B?ek5BSWhqMkFPOUpVYjBOdW4wb1ZXeldYV3IzeHpaVVdCS25VdFo2bUtZWllt?=
 =?utf-8?B?TXlGelhDc3JJdVhodGpLcHhaUlJuam9pYm1nL05EQXpqQ2FzTjNDc0poWkds?=
 =?utf-8?B?UVhUVllQZlRFMUttcktCVm5mdzUvcWIvNjNqdHhoWExCQnhxU0xlYUNnaFJS?=
 =?utf-8?B?SGhOMTR0MllBR1NaeE5DNDM0R2NoVHJNdGtadWw2NndXcEFNMkxzUXJXV3F4?=
 =?utf-8?B?VHdRRGk4T2dCUmtlelAwT2RTVlpnK1hqRkRyOXZQRzM1ZWx3ZXV1cjAxYjZm?=
 =?utf-8?B?NFdEaW13SjFSV3ZDYWJuVVlhTHVLK3hhRU1wSE1RNUg2bVBvN0VKZGxnZnVW?=
 =?utf-8?B?WVpjUlVrT0RMRDZSWlNpVTdSNXNZQTB2aHV6UHc4cm0vdGR0d1RKMHRiVmw1?=
 =?utf-8?B?TXZIU1VmWm1hZ0oxTTJWQzBTeWNtMlZ1VU1Dc1Y3WXp1dElBQXF2REs4UEdI?=
 =?utf-8?B?T2YzMGg0ajNzMXh6dUJjQ1VsYnYzOFZKWk5VVk5GYzdwNmgvR05CT29FSnBO?=
 =?utf-8?B?QnVkUkROMFV6Ty83eFB4c1ZmUHJseE9SVU5KdFc4SUZ3NHJPd29TUE9ZWVRV?=
 =?utf-8?B?YXlXQnJST09sYnVrNk1IZk5YUFE4alErb2dINDFiM3NzWi9IT3AwbE43RjNl?=
 =?utf-8?B?UHlRQ20wVXFJVG8vRjYyUVUzZGxldk1sV0EwaS81cFlaaGFCRkcrdlc2L3NO?=
 =?utf-8?B?ZGVXVUszdllpbDMwcEE5bkhDd054SzhOZGxZdGxsVGdUTjZEMFVGY3RwTjl4?=
 =?utf-8?B?SnpJbFgxUXR2QlIxVmI1bFUrb0xOL0l4bW9oYlRkRUZPNXVHRTBaWUY5cEdk?=
 =?utf-8?B?U3RvUlJKclpaSnQ2Sk9EMjY4T0I0dUZ3ckRpOWI1dDZ2ZGRmeEtOb0ZZS2lH?=
 =?utf-8?B?NGFZVEt6ZXROR2g3eEEyZzRCWmtsZVRoYVlHaUlEL0JFdWFMMWgra1hvVTl4?=
 =?utf-8?B?cU9pYXRZYUxxVlBYWmpwd1l0RTZNemN6WlIxVkZiMjEyNERkOUgyaFc5L0Nx?=
 =?utf-8?B?NE9pbDZFNnhQT1lpZUpnS3pEN3RydkZDOFArNUlFa1Rkd0xONVBLc2JIeXpy?=
 =?utf-8?B?VEhsTnNFekFSZ3dHSTV3TXRSUmVOU2xsNnFuYWw1cjVHcnU2SkZWZFp4V0w1?=
 =?utf-8?B?bm5CL0NZd3Z1d3Q3cEFTU1RQYVZCQjEyV3dWV1VMandWWWpXZm5IZjJQekhH?=
 =?utf-8?B?b1Arak1vNEVsbm1rRUtUWVNWdjNPc1BpOGM3OXh2T2xXSlBPM3BpNVZDWE5N?=
 =?utf-8?Q?Wq5bdaoIcD6vasKh9TNvQ6Cesdc7gy4ooxkdI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WkhPc2NhTXFtR3BocHIrTGI0Q25MbFgxYWNCMXRrV3NpTVFKUFJkN1djNk1r?=
 =?utf-8?B?aGxxeklPYlN6b0pxVTA0bUw2czh5UU5ENXFRYndORk1UT1A1T3E0c2E5ZUla?=
 =?utf-8?B?dERRTFA5TjFxaHJPMUVhOWtmU1ptRmxlell5Ty8vcDIxSGlIdUVRaFBrVTc1?=
 =?utf-8?B?RVgrSXphSWJjVzZidnc2Y1p0ZjROV01OYTBuR2VwMWpLNm5TQ0huUlYyV0ln?=
 =?utf-8?B?b2tFcW5JaElGTklCcWJraHh4VWNaYm5lOGRrZHlFOTdmYWFML0hvVm9vUnZW?=
 =?utf-8?B?VTZtMlhYOFo2TE9UQm5OTEhSanp5V0hKbmhNZmhjRkEzeVBLcUZSY1lRN3RO?=
 =?utf-8?B?aWx5NTZpdmlEZWs2cmNWUE9TMXpCQXZQQ3ladnZuS1ZoNUFiNnBkMyswenN1?=
 =?utf-8?B?b1Ivb0lSWDE3aTkwZDFMZ0NTRUtPZ3ltSEpDWkIycllJVHoyU2lOTjdrcjIz?=
 =?utf-8?B?MnRzOHBaMEpMNmxXdUMreGxKb3Y0V3lWc0s4L0ZLd1BKNExmUWtHQnlxalE2?=
 =?utf-8?B?dkJNTDVrWXN6UXJSaFk2eWg0VlhRZTRuWDdwRWNzL0pManJRRlFjeDAxSzd2?=
 =?utf-8?B?SUtGV25ZMndWaEF1dTlvOHYrMm5ET3J3R1FmTVNkSFVoWGxSL1oyWUFoM3hl?=
 =?utf-8?B?eTh1cFIwZDd5WFB2Q05KZGY5WGFrL1NzUGIvczdGc1dvVmlKQlk1OWI1amhs?=
 =?utf-8?B?K0djWWxwci9WNE8rNlh4SEFoUGx4MUt0akdUN2g2Y3k4THBKMjYyRU5tREYx?=
 =?utf-8?B?QTVJVlhna0sxZzc3MVkvZndHcW5ESXoxcjdyMWwvWWNpY0UxVTlXQWdlSVJI?=
 =?utf-8?B?a2RhL2FoT1ZOYVhncmYzN0dmNlgwK01ualhnZEJVaERuSldtTGxxVG5DaXhS?=
 =?utf-8?B?dTBrdTlXQWJtU29LS25tWmZKaG1PM1B3Ti9wejR0d29FdEJZazhLNkVhNEI2?=
 =?utf-8?B?ZjZ4WENuLzBON2ZXMHEvNjVyZmdGVWZaZUhvOFk1bE1XOGdqTUFZY0M0L2tM?=
 =?utf-8?B?d2hCa1JEc21nNHhrVVRud20rdG44ODArWXVTZ1hac1JaNmNHSlE1eTRxOG1z?=
 =?utf-8?B?ek1pOWFVR29UeXNwdjVJMkJKSXliT2M2ekMxaDZnUXAvcXM2czlPNjI1T2Zt?=
 =?utf-8?B?ZmtsZmtGdFJFWFlsY0lhWUpXbURUQlFvbzN4a05JUVUvTUcyWVhTdkhLVmxJ?=
 =?utf-8?B?TkxJRnlXTFZUU2tacS85ZVA4MjAxK085NFplenpLT01sbU5GN1NXaHBJcnV5?=
 =?utf-8?B?U2I2bUw4U2xpaHA2b05aemNvb09kS2pmYytxeDQ1bWpmVTNUdTNiU2UyUzdI?=
 =?utf-8?B?RExtdTY5VEhvK2FZSXFBemZnVFVONGhMaW90Q29kaW9JZjRlckhjSXNRcVFJ?=
 =?utf-8?B?Q2luOENCMUVhSDU1MDVINlZXZDRYaDVYKzl1VU5XMENwVzJhZjhuUWpkWG15?=
 =?utf-8?B?cUNtYVhPMlBFelZyeFFuM20xbWtsK2NCZEljODBCeldkUFduRnVFa0FVbjEz?=
 =?utf-8?B?cStMVGc2R0dWVFdOZDJ0eXpJOUJiandrdnRxaTRtbDdVc1AvbWxrdzVCaTVw?=
 =?utf-8?B?bVA4cFdyT2R2enhFSXBPU1BKZVErcXQ1UHl0a2hEbmFldUFGZEFyY2VTbkZP?=
 =?utf-8?B?bVpmbVo2bW1iOTBjRGhIeklkQmxTcVVIc3VXZzk2YmRPSlNWUDV4V3AraUxm?=
 =?utf-8?B?TlFQVWQyWEo4T0tVbGJPZWxYSlppOGk3eURab0hZcm42TjB3WVF6Vjh4c0wy?=
 =?utf-8?B?TjNkOTNjemRsVldmZ3NnREN3NWxpWWFIS2JVaW5nT3dsL1NOWkhZYm9KWFZU?=
 =?utf-8?B?ajVxZHI5U1E4cWViNEpHRGJrR085bUZSWFJRVzFGSHRBVWpsN210TXY3SmpU?=
 =?utf-8?B?UjVuL3Z2U2U2MmZIVDVzVlNDUjJTTDNxMVhRQ3V1UHRRRjArM1FUM0h3MjhK?=
 =?utf-8?B?TmxHTnY0Tm14dVg3TlREWUs0N2xWYnhuZjNPQzlLS1V6UHpiMkh3NURyWHBa?=
 =?utf-8?B?N2JVQmtIbjV6cVhaZTdNZ2JBbGo3VFdGUHFmVXJXZ2NQWm9uamkyTzVtRys1?=
 =?utf-8?B?UFRNRmdybmhiYmZnU1J4V2craVowVHlwM3BGbkg2Q0Y0ZWdEUW5Zd2ZNU29R?=
 =?utf-8?B?Q05UZzJqbFlPSTgvWmd3RFVOK0dVOC9Uc1RFRFJjNFgveVNFSDN0WHlES090?=
 =?utf-8?B?emc9PQ==?=
X-OriginatorOrg: ekinops.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0073a1-0178-404c-9b9d-08dd0dee281a
X-MS-Exchange-CrossTenant-AuthSource: PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 07:44:28.4108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f57b78a6-c654-4771-a72f-837275f46179
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phD1zIoVCpaAvge3DHJvGOqjGgDFuK4KaXPrArePNwCCVsLr5MXbu0F7ML0WUcXa41SZawxi/DDVCU1qPnuHYyij3LuhzwiGZTUFtIZJH3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PARP264MB5710
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 07:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114062


On 21/11/2024 09:42, Marko, Peter wrote:
> I did not find any CVE for bridge-utils in our nvdcve_2-2.db.
> Based on what did you choose the vendor?

I've looked at nvd database to get vendor name associated for each component:https://nvd.nist.gov/products/cpe/search  
For bridge-utils, it returns kernel as the vendor name.

>
> I think that until there is a CVE where we can the base data from
> and also a conflicting CVE which would show this need,
> we should not limit the vendor string.

A component only relies on a specific source, which is always associated to a vendor:component pair. Setting the complete name should help to anticipate false-positive CVE reporting before facing that issue.
It is also interesting in order to supply more precise information for meta-layers like meta-dependencytrack of meta-cyclonedx which rely on CVE_PRODUCT variable to produce SBOM.

>
> And regarding the other patches, it would be great if the commit message
> Would contain description why it is needed (e.g. which vendor in existing
> CVEs you want to filter out).

OK, I will update with additional explanation.

>
> Peter
>
>> -----Original Message-----
>> From: openembedded-devel@lists.openembedded.org <openembedded-
>> devel@lists.openembedded.org> On Behalf Of Benjamin Bouvier via
>> lists.openembedded.org
>> Sent: Thursday, November 21, 2024 9:29
>> To: openembedded-devel@lists.openembedded.org
>> Cc: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
>> Subject: [oe] [meta-networking][PATCH 2/3] bridge-utils: add CVE_PRODUCT
>>
>> Add exact CPE name in CVE_PRODUCT.
>>
>> Signed-off-by: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
>> ---
>>   .../recipes-support/bridge-utils/bridge-utils_1.7.1.bb          | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-networking/recipes-support/bridge-utils/bridge-
>> utils_1.7.1.bb b/meta-networking/recipes-support/bridge-utils/bridge-
>> utils_1.7.1.bb
>> index cf0fc1c33..66c8f2d05 100644
>> --- a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
>> +++ b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
>> @@ -19,6 +19,8 @@ S = "${WORKDIR}/git"
>>
>>   DEPENDS = "sysfsutils"
>>
>> +CVE_PRODUCT = "kernel:bridge-utils"
>> +
>>   inherit autotools-brokensep update-alternatives
>>
>>   ALTERNATIVE:${PN} = "brctl"
>> --
>> 2.34.1

