Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4D3CCF9F8
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 14:20:08 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.5])
 by mx.groups.io with SMTP id smtpd.web10.16786.1761920401652060630
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Oct 2025 07:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=D55rzBkx;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=D55rzBkx;
 spf=pass (domain: arm.com, ip: 52.101.69.5, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MEHKn/o9CbO224IYhqOd216icrZ2aiQUxfV4F6T62FtuFaZ6UFecBJcqTonm4AUcAAVAPQ0ZAb4ZdOQNcgZlKJ0zEUVsW7jt2ZdpkYFRvoiLiNWHG3xxyU+1An4tRAmGLRiuwW0SaNRXV/tdj5R91zOqi4GoPkrrzFX/o+/CvdA5TC5dWIVsyqSaA6SbfOoIYb6SIwVHQN9VnzFFAg65WxAZqFU9p/74esBJzK4XEDZjDbHjsfqssYSAb/1Gp2ubDAl7BgpDfDfv6M6p4yavSvyriMaW4Ox1OyWBsW9giv1XD1tBUgTxT1CtDh3YLlV+JqXU+9di+KSt0HPNa0TOyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HC8OqsAFwTdigdCvWcIJ6v79EwH4FL6QZPbp7e8uCEo=;
 b=IngGh+jVwmCG4GNfZ6VHyP6Bua5n5KOtV7f/nXUNW4VIzqo4bm/jqUE78pCCw109apCsLLOSIUUaIVi9Vi/ijXX2CceWBZXtPYVyDNJ/06+OuXDeDTfX+D3O5L9wImVKy5qZ1nyCkKtx7NOxCadGzL/ylocu6jvMBnXahLVITKLkRwmZdJX8QoIrdOYoroBYogmS9JJhssPQPG7JYZKSZK9DJ0Hg1dzkzfY6BMTfiKtZHMqIH87ZFlidXZaEPUPq0dOacgmFxfyFyUVSylvB7Lp+sztdswqjNjv6Y1lwNCTltDmFqdnx7l/n8vYizL0vwlyRwDYcXm4DXLP4GXCESg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=smile.fr smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HC8OqsAFwTdigdCvWcIJ6v79EwH4FL6QZPbp7e8uCEo=;
 b=D55rzBkxRb9VKghk7Yfc6Sr/41nUJ5OOx4iSrO1RWxT0+UHShBlL0+RKVrgsCrH1DIS2rwUuX2aEQc7wtV2QIDf18UBkZ7vWLA6qilGoH2+QOxtAhF/2DJwhR8hbQ1GBzf0fJkt21mMZCcMUk2ezTXzGlRofHW2C9xfsbtE9NiU=
Received: from AM0PR07CA0021.eurprd07.prod.outlook.com (2603:10a6:208:ac::34)
 by AM8PR08MB6609.eurprd08.prod.outlook.com (2603:10a6:20b:317::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 14:19:56 +0000
Received: from AM2PEPF0001C717.eurprd05.prod.outlook.com
 (2603:10a6:208:ac:cafe::b1) by AM0PR07CA0021.outlook.office365.com
 (2603:10a6:208:ac::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.5 via Frontend Transport; Fri,
 31 Oct 2025 14:19:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C717.mail.protection.outlook.com (10.167.16.187) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Fri, 31 Oct 2025 14:19:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v63+dOBczifJNe16dmO9Ics3q44XFywuFW92Jf1KqTmyCHj37W8TErLpsShs1Kw3fQT0G1egAFojjq+4uZyE+GP18GJ9OTiDNH1SJmlp+mVaYPX6YNWioTd8ke7WG+WVmr87jL/VtAYy8GSfYA5nKPW82FVj7DwWD0gVDq5TRScc5MIBMGeOnaDtANlD5mg1HV3thDG4P6g8DAnVOpL8Gw1eam5xfpXjlCKcVpOyb49IzNLkKjbfP0ux1w2pZoA0RyIA8cgpgk3cE9gqM8ULRAJbiZmVkW2MknoIG5cZGGSLxYQ774sENYB9R+xED+Ry0SAyS1P+RKVLWfneC2TiGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HC8OqsAFwTdigdCvWcIJ6v79EwH4FL6QZPbp7e8uCEo=;
 b=NBkwomph/JbAH+W9apQGMPrE8LGgyUrVy44SrqtxlLQ6mcnQjuuJZmU+/MLyw5tO27l66R2HiHUNzUs/ZrKT+pz3uADVejuRr37yXlTJCzwT8PZT+Iw0Po4+XOBRVETCvPgclE7BsFiw3aQfOz3Q5Eqfcd2yQfwoTnSabkFXnMm7qDMYEhjd/E6t9tsGc233qc7qeZCBZGz7SiB7H70NAgh4/22mMxkK1ReZ+ZCPxpk2M0zoRKBRUZi73WKvQRqzY8XjE6YM/RrjrNevstm9OtgFaymiTG1zlS2oGo2R57jMZ+PwC50uUa02BhYIsCDad0sr7vKYlpLDN0cjcA58Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HC8OqsAFwTdigdCvWcIJ6v79EwH4FL6QZPbp7e8uCEo=;
 b=D55rzBkxRb9VKghk7Yfc6Sr/41nUJ5OOx4iSrO1RWxT0+UHShBlL0+RKVrgsCrH1DIS2rwUuX2aEQc7wtV2QIDf18UBkZ7vWLA6qilGoH2+QOxtAhF/2DJwhR8hbQ1GBzf0fJkt21mMZCcMUk2ezTXzGlRofHW2C9xfsbtE9NiU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB5794.eurprd08.prod.outlook.com (2603:10a6:20b:1d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Fri, 31 Oct
 2025 14:19:21 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9253.017; Fri, 31 Oct 2025
 14:19:21 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Yoann Congal <yoann.congal@smile.fr>
CC: Gyorgy Sarvari <skandigraun@gmail.com>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH 1/2] psqlodbc: upgrade 16.00.0000 ->
 17.00.0006
Thread-Topic: [oe] [meta-oe][PATCH 1/2] psqlodbc: upgrade 16.00.0000 ->
 17.00.0006
Thread-Index: AQHcRCt+2NvoNToeqUiEOPVOx6BaobTcTcKAgAADHgCAAAlwgA==
Date: Fri, 31 Oct 2025 14:19:21 +0000
Message-ID: <48C3D497-F482-45F5-9A57-919781B6505D@arm.com>
References: <20251023144351.264756-1-skandigraun@gmail.com>
 <4248C252-5AC4-4D04-B9D6-B71509890D3A@arm.com>
 <CAMSfU+5oOg4FyOa6+BEz2ci2+4wVhXXg=9CVB63XQJEN88j2eA@mail.gmail.com>
In-Reply-To: 
 <CAMSfU+5oOg4FyOa6+BEz2ci2+4wVhXXg=9CVB63XQJEN88j2eA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB5794:EE_|AM2PEPF0001C717:EE_|AM8PR08MB6609:EE_
X-MS-Office365-Filtering-Correlation-Id: 33a66f53-50fe-43ff-4a3a-08de18889115
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?dzBNL0lpTGJJNHdzbVRzdjlnL3RFTzg1WTVWd09QVjNCd0U1TmJKdWhzVUt4?=
 =?utf-8?B?VnFFK2lvKzNMY2dHbFV4YjRjVlplOGQwVXJFVzJXZml6akgvR21DMENKWlVP?=
 =?utf-8?B?ODFsTHFYaU5nR1FoZGhGVWt5SDZFSUsrREs3YWo1WUduVWpGeEM1T0I4S0Ft?=
 =?utf-8?B?UkE2b0JxNEFDZ09IUVFjWWN4WndyYmpVaEozQWdVcDdndGlkcU5kTGFWY1Bn?=
 =?utf-8?B?TStLOXdqbE51UHoyRW42RzhLbExaYVo2cmtmTW9NbXRlc2VVTjUxOVZkSE9J?=
 =?utf-8?B?WjhxVm96aXFia2w0Q04xelRjWnFtYXo2aVUyWnU3ZlQxTXZnUWZNRkVwdWVy?=
 =?utf-8?B?SGs4UnAzN0lRSXZOcC9JNnovNVFGenZMSHhKU295YlU0R01RSzRwcjYzdDJH?=
 =?utf-8?B?Mlh4c0JlYytodGtleTFIN0NuRm9idXhFeHIxMzRrQXBSeTY4bzFnazRkR2ZL?=
 =?utf-8?B?WG5XTUdoeDVCYUVTSWlSWFgvWS93UGFSU1g3NUhyWHRjVENIMTFmSUY3cTlL?=
 =?utf-8?B?UURKc1dWa2NDL2NLQVBjeEtlVVk1RUVjQWwzOWdjQ2g4R0cyZXB5SS9RMUFF?=
 =?utf-8?B?NWt0VFdqR1hTOHRZQmNUZXhMWmdRTEFIYXRVQVhycHJXR3VQUmNORDVQVHBu?=
 =?utf-8?B?aWI1RDgyQjJjZFFXTS9JOHNFcmZtcmI4MG1ZZ242RGlDOWlSakpjRGZ4d2FT?=
 =?utf-8?B?SVRKeVVTTmM4MEg2YVp6UUp6bjNPRmg1ZVo4TGNnb3lWbkQzUUU1VUNmZ1Jh?=
 =?utf-8?B?NGhyZjNYK1BORzg2OWh1R3Z2TlVxbDFQL2thQjd1TzhyWldDRGtmR25seVNI?=
 =?utf-8?B?V0FtWEVGYndJL1c4RnFDTHlnZ3ArdllzQlBZVXYvaTBha1FxcjBkU05NUGpX?=
 =?utf-8?B?QW5XRkpVamZWNWgwYXV6dFhwaDJiZGVPTEdWRENXL2ZXMS83V1ozbFFDZGhI?=
 =?utf-8?B?Mzc0dEhpTmJrZWRVYzdpL3NySFJtTG5DMkNvb08yRjd6MkFOVXRiMEhRUEF6?=
 =?utf-8?B?RFJtS3h5L25IRDhxcHpDZnJrVVdYK2NIaHczTVhkVUNBamF2a2FLS05DbXV1?=
 =?utf-8?B?WFI4N1cya3pveEs4SWlGTW5HWjJ4ckdTdEFUejRuTTdJWCtkZkk2bnVGemx3?=
 =?utf-8?B?UzBKL2R3NHhFWXpaeHZDaVl5UkliTG94UmxwUjArYzQ1L3pkZHBuRXpZSXl2?=
 =?utf-8?B?dGxhNXlvTXdSUUV6KzBYNnU2MWpVd2VFaHVxSEhzNGxnQU04bWl6SDZMdFBW?=
 =?utf-8?B?R2k0UnRzMjdvcHY4bjJ4SzVjNzZhRERoQmlzN2RySkp2UlBWZlBQbXIrSEVM?=
 =?utf-8?B?eENTTkNyZUhDNzJudFhFU0F0WlZrWGswWUpUN05VYmJjSVNpc2RLa3c0dzFN?=
 =?utf-8?B?eXA0Y2RQcE9zdzkyNDl6MmJEOEZ2RXVsRVowTlJ2aVZxYTBvcUZrd3pLSlVG?=
 =?utf-8?B?cEViSzYxR2VyTlNQcDNQMnFUY3o0OEd3QXMyenVRZllGc0l3U3JaemJ1d3VD?=
 =?utf-8?B?TDk4QzBaOHVZdUtMdjVPWXBNaUs1eDBzZGFCUFZRdmo4MnZhTm8vUTh0TWo2?=
 =?utf-8?B?VkVMTG1yb2I5bmhyNUdhdklWN0VYeUhMV0lRQUFxa3I3Z25mczR0RlNXMkpL?=
 =?utf-8?B?Y1F5SW53SmNTanU5eGNGOHhMQkZOY3hnWDFtdzYzMmlLd0ZaSTJSaHRPL0lE?=
 =?utf-8?B?RkdrNjVxRW1OM0RVNDViUXk2TFpUNkQyV1FVeDRyTTJkWVJielk4SWhiYk96?=
 =?utf-8?B?M3p5OGFCY2FkdVcyU25ZZkc0bWhuemllczNNK0tDMCt6a3lJQ0poTFZ4ZWps?=
 =?utf-8?B?UDB3NjNPNFN0QVJhUXpPL21Ycjczd0Z4QjdtUkRBT28rQVYyWWxmMkpLVFZU?=
 =?utf-8?B?RnM1TWlpd0JTOVVyM1ZBSzJBTGZYY05hOUVDWmsxWnRTSDZUb3o4eDNTeE4z?=
 =?utf-8?B?V2J3K1ZQL2d4VFliTi9zWDZyU2VidDA3Q3RPazcvRVBUY0JqQm5zWW1UL25M?=
 =?utf-8?B?N3U5THJOc2dRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <ACF311D08E94734CA55D2BF5AB8BEEBE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5794
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C717.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bd82834c-1d55-4bd8-18dd-08de18887c5c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|35042699022|14060799003|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bnNXWkgxeVh1c2JVMHhPa0FES3F3Wm9rQ3RqVmY0MnluaFVLaFpGdGRsUGc2?=
 =?utf-8?B?THBHN3hvVVozSUZSOGZ3eUc3UGoxN3BnN0kwak1DNFh2RlhZSkVKS0t0SWk2?=
 =?utf-8?B?ZVBnbzlRUE9PTmpSZ0RJYXVMeGpuVnNyU3Y4enZRSGF1OWpVQWcyeEVOY3p5?=
 =?utf-8?B?U3gzYlpwQzc4N0k5MTRXZEZjRVMwR1huN2NMMW1zWUt3KzY4YjBEVk1mWlU3?=
 =?utf-8?B?SHpUN3NDQmRIeXhYc2M1engyamxLdWJOWXowNGtPaVF0N2xyZDUwVTdlOHZo?=
 =?utf-8?B?bXBCR0J6cm9SZ3J0STB1ZkVuTjkvY2JmZU8vU0twNDhuRnZlSnBDcHY3U0V2?=
 =?utf-8?B?eE1Jcm54YlpNYkwvQ0ZFL05vS0VMVzBEb25OaWxHK1NibE13SUpjQmQxRmRB?=
 =?utf-8?B?dGhhMFBzZnRveUMwRUdTazhBOHBVblUrdTJITCtiNCsxNVJPai9tTE5peXN4?=
 =?utf-8?B?alFySWJhSlRiakZqZFoyYnZaWnNsMjZwZDF6bU8yMGFZSmlCRUVsc2pDdmhk?=
 =?utf-8?B?WTd5T25WUTkwNkRsYTBWNmRtZ3Z0b3dzV2pBRG5xbUp1Vjc1MzlreVVsK2xm?=
 =?utf-8?B?TmRZdG9UdWwyczI2TG56T0xoZ2o2TXdWT0VnK0tMVVpsUkF0RHVXelZqcG5U?=
 =?utf-8?B?MWNCZnM0bjhKTmY2ZFFoT2Yzd2g3Z2Q2SG42K2dqM0dWNEtwWVRsMGtwQnYr?=
 =?utf-8?B?V0hoL25FcU1oajBUSWZ3TW9rVk14cHF4SmM5S2x0YVBkelA0UlFlandRWUZY?=
 =?utf-8?B?TWhkaVdmSGd1ZStET2hMbWV5S3dTZERwTE1oUUhza3BYenBScG53TWdYV051?=
 =?utf-8?B?UlRBeWkxSW5pT1pteTNEQ0pEY01PUVpWUkRRcTdjVEJ1aisvVXJzZzh0d0di?=
 =?utf-8?B?MVAxVWprRkFhYjRMTExZcDRRcXd6WkgwWGsxL3VEdllDaFMxT25ET1AyR3hY?=
 =?utf-8?B?aUhmY1d1Mkh1TG84TE45S3VxUWwwdFB0Q3lIcUlyNGN3bEZLTTFkNDhaREpC?=
 =?utf-8?B?UnVBUC9MTzBIVmUrRFB1ZUJOM2srWjIwcm85dDVEUllTaWFmQmFqeWhyeW5l?=
 =?utf-8?B?SVhzcm9mTzBIbTJUV2pVa2lkMWEvaHgrOHVlcXYzSTI3eFVqbU0wZENhZjRP?=
 =?utf-8?B?V1NyMnlhOEVQWEJuSTlDZEp1NzNPaTBFWHJWUmEzLzZ0ZC96aVMxamNPK3l4?=
 =?utf-8?B?bTRYVWRWZnFNZU1ycHFyTEpFOTN0dlV2cVQwaXlaQWNDRXlzSDdkNndKR3Ba?=
 =?utf-8?B?VVpWWExUdzg1R3ZPelVqamF3b1Z1NXl5NEhzUDdnSm8rdXNVYjRuLzZwQXRm?=
 =?utf-8?B?WlBPYTFWM0p2a2xmRTdWaXcrSkZnNlJBUW1BNlRRYXo5aFU5MElBVEk2TFZr?=
 =?utf-8?B?SDI0VGV2VEZFWVdBT0QyUzdvbXQ3azBKYzFZbDJ5bUt4OHV5OGZoY0FMQ1NJ?=
 =?utf-8?B?bEJEOE1tNHBNZWY0U25kdDdyY0N2cTA1ZEJTazdTOWcyT1lOOWh5RC82cHNK?=
 =?utf-8?B?ZUkwdWI1RElLYVo3UUlxZEZmakg2RmJBSHE5M0NFME5HNncrOEE2NnVGZjF1?=
 =?utf-8?B?Z2NUc09NQmJ5NldKamxJMk43bm5FN0RxemE5K2hYYTFqTnYxbjZ6RE0zVWg3?=
 =?utf-8?B?WUtyVVRyZElObUY4Rks4Z3hNZFNuVWIzV0s3dGZMUDRvRnBoNHFCUWM4Q1dD?=
 =?utf-8?B?V1Zsc3orVG1SZmVJZlpLLyt6RklvUVE0U3JDM3ZaeEFiQlgrOFBZTy9xem85?=
 =?utf-8?B?UGt4N29HY2pucVdOS2F0ejJBV1gvVk15V3NkbGE2bzdtL29hdlVPYnhBM1lu?=
 =?utf-8?B?SEE5b1JDdnp2dDF6QkxzWEtxeEl2YW9JVnZLYS9tMzV6UzVDMXZ4K1VZQ1lI?=
 =?utf-8?B?TUlUb2lKSWhabHI3N2pUVnJ1UlVaMTdNNlNleTZPanJKRWJLYy9oUlBKQ3Zn?=
 =?utf-8?B?UGorQitSNWloTEp6L0xERXc1c2VCSUxrTmRsUTIwbU5mRlJ2MHc4K0dkdFJX?=
 =?utf-8?B?VkhFR3NLcDVFS2FOSS83cXd3RmhnUU9TY29INkxYNy9SamI1RWJNRHFDV1Np?=
 =?utf-8?Q?cvjgVP?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(14060799003)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 14:19:56.0893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a66f53-50fe-43ff-4a3a-08de18889115
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C717.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6609
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 14:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121235

T24gMzEgT2N0IDIwMjUsIGF0IDEzOjQ1LCBZb2FubiBDb25nYWwgPHlvYW5uLmNvbmdhbEBzbWls
ZS5mcj4gd3JvdGU6DQo+IE5pY2UgY2F0Y2gsIHRoaXMgaXMgbW9zdCBsaWtlbHkgd2hhdCBkaWQg
YnJlYWsgdGhlIG1ldGEtb2UtbWlycm9yIHRlc3QgOiBodHRwczovL2F1dG9idWlsZGVyLnlvY3Rv
cHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy84Mi9idWlsZHMvNDk0L3N0ZXBzLzE3L2xv
Z3MvZXJyb3JzDQoNClllcywgaXQgd291bGQgYmUuDQoNCj4gTWF5YmUgd2UgbmVlZCB0byBhZGQg
YSByZWNpcGUgcWEgd2FybmluZyBhYm91dCB0aGlz4oCmDQoNCkFncmVlZC4gSSBkaXNjb3ZlcmVk
IHRoaXMgd2hlbiBhZGRpbmcgYSDigJxCQl9OT19ORVRXT1JLPTEgYml0YmFrZSDigJRwYXJzZS1v
bmx54oCdIHN0YWdlIHRvIG91ciBDSSwgYmVjYXVzZSBvbmUgb2Ygb3VyIHJlY2lwZXMgd2FzIHVz
aW5nIGEgbmFtZWQgdGFnIHRvby4NCg0KUm9zcw==

