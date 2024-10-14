Return-Path: <christian.taedcke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A409D16268
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 14:27:57 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.134])
 by mx.groups.io with SMTP id smtpd.web11.56311.1728916070515995784
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 07:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.com header.s=selector2 header.b=q7u4cEj2;
 spf=pass (domain: weidmueller.com, ip: 40.107.20.134, mailfrom: christian.taedcke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PO5j40+syNpsVEbXXPSMlPyN9JN8mGp33eUW+X+kosAzj3Bs/yS6wAOZWQIbc9N1g8qklX5rewlycwuRwq8EuJoWg/lgdomRNAjJQ0JhSqm58irTGj88gFVXtpEmEcVax9K2TaUvkKt4gWhv5qYJwr4g9qBuKZUfOhiOP9jEAqECxKc5sxG9jDsUtpW0RZcE8iEr7pNrjRMq90okYb45yBJGbgoTk9Olt8B/s4oYPM8vjesYkzBgDsbd1T14YnCSPe8UWFcfe7fbR7m37PTRVEERw5wAxGsFqYf/p/bm3iH1ZtIyd3bPY8gX8hjVjFTgfXfQBnfOP4MSV43LTr5uIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+bseOWEQF9GozOc/jBvod+lujTmc0Py1vuFTtxCSzg=;
 b=gWvPZtbdvT/uQvZSZCixacqY7r4Jpctf87zVZX4X2u0++LqjsXKysYAl2vg4xg/yI66Et6mO+EMmu67k3VDr8xyVJXw0W/nDg9e8b8Ft+nVfLZtQXvF8V7RrVOJzq6TOhmzfjaY01GFKCmP+TTvUku4Onw/34MV4QkntK2sCRTEow2vemTTvLC9F5AYQ5mc9S/kmkBK5ftKvdrp/qhjqz+B12Hkg1r+LxskDfxQpABb7Vumw2yWJ9rPnMBAwOvaj+HkIGsuEkev5nh9W3Xsu/3ij3rOS5KebFNDF4MmAgyUPTxS2dDcn7hHi0DyaOLEbqqjyOKD7sL/HDsQz6T93lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+bseOWEQF9GozOc/jBvod+lujTmc0Py1vuFTtxCSzg=;
 b=q7u4cEj2xL/zT6YmjzW539CfLUjf0AZolRzfeUxOcblmpKe3+SGF+LkyUtYTFISYeNEpKuSVYTjJjxTlT0c/ur932Fk2cnrnoBKEVbM+bM31/pi2cdYYIqd7o4XfsTidF7eiHWjWEv7vK0XG9UWkfhSNvOiOtAkBM+aBjdLvcW6Z+Ji0niVA/QBb66eAeltxueyKu8R3Pp0e4e7VDBQvDZTZbsOjcu8lgT81Yxn2OvyWWRRlBVHmDVXx5hlutZNtk0PVXEoXeFfrxEN+D11pz3HhP3tI+n6T0FicrasRwwQ9BSbu2t/wbClxqtT9y9Q/NXV1HSQcTp4nsYgSwusdrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB9199.eurprd08.prod.outlook.com (2603:10a6:20b:578::22)
 by AS8PR08MB9954.eurprd08.prod.outlook.com (2603:10a6:20b:638::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.22; Mon, 14 Oct
 2024 14:27:47 +0000
Received: from AS2PR08MB9199.eurprd08.prod.outlook.com
 ([fe80::7254:707b:b5d3:ef15]) by AS2PR08MB9199.eurprd08.prod.outlook.com
 ([fe80::7254:707b:b5d3:ef15%4]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 14:27:47 +0000
Message-ID: <522f3d32-6d6d-4c62-8f6d-656c48fd65b0@weidmueller.com>
Date: Mon, 14 Oct 2024 16:27:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta][kirkstone][PATCH] xmlrpc-c: fix do_fetch error
To: openembedded-devel@lists.openembedded.org
References: <20241009065729.4114713-1-guocai.he.cn@windriver.com>
Cc: kai.kang@windriver.com, guocai.he.cn@windriver.com
From: "Taedcke, Christian" <christian.taedcke-oss@weidmueller.com>
In-Reply-To: <20241009065729.4114713-1-guocai.he.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::16) To AS2PR08MB9199.eurprd08.prod.outlook.com
 (2603:10a6:20b:578::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB9199:EE_|AS8PR08MB9954:EE_
X-MS-Office365-Filtering-Correlation-Id: 54333795-aac3-432d-ab30-08dcec5c5fdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WjBPZXI5TVNKTDgyc20yZUpsSlRmc0J0bnZjcjZENGpLNDlCMmdHTXlNYldS?=
 =?utf-8?B?M1JaNFh2WGJTUnNxQnRpMEJhRGhHa1FSc2NtQkg1MEFpM2kzL3dwYzJ0NEIx?=
 =?utf-8?B?UkI1ZTRHV1ovNTdObUJtaTdJVndkVDdaWnNPeDJHZkVpdVViT3NDU0YvT2VK?=
 =?utf-8?B?Z1ZWRGtpN1c3ZE1CVnZuNUdMbTJIWldCVU42ZDBDU2tIWmVwN0xPTXNHNjZs?=
 =?utf-8?B?UStwQWZiRGYrTUgxYzFINStNRi90aUw2cmxOOHhNQnNtQXBHUk1YanVrWVJN?=
 =?utf-8?B?MjNYZzJNZkJaRldkS0phRk1mR01lWXgwYVAvUkpoR2xOK3ZvTy84YngzSFRx?=
 =?utf-8?B?UkF5Rzg2UUYrWXdXam9uQ3lWWG5oZVE2dk4wcEkvNHRxaUN4NmFmTFk1YnZV?=
 =?utf-8?B?cTNsaHB1TEpnbGprN0hOU3k0MXpOeitaVXFYdDlTS2NXZ2hsNUVRdXdLQk53?=
 =?utf-8?B?c0Z2V0RBTXNSSE5EK3Q2Qm9LSElTWEZMY1MwL2ZZT3drZmZMT1U5aHBPeEl0?=
 =?utf-8?B?Q1dYUkEyRnlFVi91M3VSNDQ1T0pMcEtyRWdmWEVIM25YRHQzY295c0JkdDYz?=
 =?utf-8?B?N0xYclcwcUpZM3IvdEpuOXV4NkRaSFd5NnJmaEczdmVMSU9Fa1dyM1lJUDc2?=
 =?utf-8?B?Y29FSUh5VTFXaGV3cEZnQ3BRUXlvYjBTT2RoU2lVdVk5UmN4c3JPbm9iaWZn?=
 =?utf-8?B?ZElFaGVrcVBxUmFRTDl4NU82UnNiUXJudHlvcEJvSXcwMVBDejNZcVBKbU95?=
 =?utf-8?B?Q1B0Q1licWpqQ2k0ZEFTV3dxS2Y3VDFkcGdyc0d6V0FtakZaQndmcmg5Ukl2?=
 =?utf-8?B?YkFqaHB6WlVheU5VSjJlektTREx5WjRTaTRuVTM3OFpyeERVcnFvbjgybWNG?=
 =?utf-8?B?aVBPTSs3T1B0THUvUHFmWHNQTzdFSDVFY1oxd2xVZ0hPYkR3VHVTZDFEKzZT?=
 =?utf-8?B?VDB6dDhWZ0M1aDlWY3A1M0VtTjByMGlYRTd5WEluUmYwNDlHTDFTcGFRZGhC?=
 =?utf-8?B?VkF3T1lBb3ZYS2drOGMvQmR3RXpOQWJTR1pnMEI5QTQ3d0JPRlhyN3Y5djFh?=
 =?utf-8?B?K3lvUFhMUVBCbDJ4bnhaYWU1NHFldjI3TS91RFVUemJOVllJZS9uSENPUHV6?=
 =?utf-8?B?T2xGNnlZdUtrNHB5cDJtcFA5QkkyZWt6MDFiSmlqZ3BDcnQyVE92WEtUUEFD?=
 =?utf-8?B?b2RuWjFoNFdYSzUxeGZlamhiSG85WXFURmRkVU9zS3lvMlAwZFdob3dLOFN0?=
 =?utf-8?B?c2dtcGtJNkVOZCthckJFQmF5dENNdG5KcGRWbk9UY1pvRm5WMitPZTQrZUNa?=
 =?utf-8?B?bVhIbFJwVkhMMWF4MXI1TWxsMkEwcktxM3RIRi9WTTVMQ3lWUDhJdUF6UDdy?=
 =?utf-8?B?MnpHdmJ5bGdwaWhhK2tXQldDSU9ZKzBudnYzTDBQdUlSWDNIRW1lZ29CR3Jt?=
 =?utf-8?B?Zk95MGNxVUVVZi95aHR4UHZNMmtSZjlTUVRJQWVEK3BRMTg0T0NjMGxlcmJ5?=
 =?utf-8?B?L1grY0ZmT3NTYUpYSG9jSU1Hc2R1R1F5YzFoU1NiSWpQaXhZUzhEdzlacTRO?=
 =?utf-8?B?UVF3Nm9ZcFpzbFl4dUo5eTJTdDgrYWdWR2RoWEZWS3hxUmlyOENsNzg2SmxW?=
 =?utf-8?B?OEEvMWZPT29GSmtJK01hNlhmN1MzN0ZmYmtXT2ZLRnFvVWJhaWZHUHA3Mmlh?=
 =?utf-8?B?MXVmTFB4elUwNVdlTTl4T0JUUUhaN1FVZmtOLzlOVU5INWQybERtSmNnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB9199.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R01wcXp0TjBHWHFPckRtZU9DNmtxVm5WNmxlbkNWdUtCTStndnZsNTFrb052?=
 =?utf-8?B?ODN2dHR5ejJGTmlqSW1Ra0J2NDJKako5WkJvR2MyR2dJbktuY1FmcERrdTd5?=
 =?utf-8?B?ZWJKR3U4TEN6QS9aajJJZExsSzdydlUzTW9GaDR2SFB5SWY2VE1pcUNSWjV0?=
 =?utf-8?B?ZUxZQjRNS3FDWSs1WVlJZmpzYmR3ZGNhRjg2ZWptMVpndnNnRGk4bURDZEc0?=
 =?utf-8?B?RklqTTVxUktETzdIWFRFNmpQK25XUkFuWG9QUjdZUFRhdjEwZDB1YVNiclZv?=
 =?utf-8?B?ZHlCMG53dm9VN1dKTTJBNnR3ZEQ3RmJVZ0xqcW0vNW1BOVdzcnkyWDBEbWZt?=
 =?utf-8?B?ZHZib0pXd29DMnpXbWpESTlJekY0YUh6NU1sUmc3QXRyOXBoQXVKRkpaTDZS?=
 =?utf-8?B?c0hySkl0a2ZGM3I4eWdKY1FGb1U5U3NLRVlvY3ZBdWZJTWpqeHN0SGN6Sjdt?=
 =?utf-8?B?bHcwSXJmcWU5V2JEQi92UVJpMTlQaTdoWk5vL0tmbFpZTmFiOEV3TGNaM1cy?=
 =?utf-8?B?dmt2Zll0cGVYQ2xFa0lpTHNieG9WMVBKWTlWbVlzNUZQTHRHMXhveXgxYlNU?=
 =?utf-8?B?b2I2OXZGRFlmK0Z6TW9PRW9ZK2dPSGp0YVRlakdMbDJ5L2YvSEU0OW5wNHBC?=
 =?utf-8?B?NFNKakY2Vm9sb1l4Z0JLMWJsd0FlbnRha3RzQWkzVTN3cVJITUxEV3VOOUho?=
 =?utf-8?B?QzFXVERhMUJwNkJ4QmtBeFJwVHNpeE0zNWFZN1JuditjTUQ4bEVYdUloeXZn?=
 =?utf-8?B?L2x1bkRjT25YUHFTZjBXSlZackd2RnZCS01IZFYyNFlSQVV6L2I3aUp1Tk5y?=
 =?utf-8?B?aGZzLzB0VlAzOWlUMmRmNmdjUEQ5YmIwbzFZcjBVNmxnRlBHdVFSTEhzNGRw?=
 =?utf-8?B?RU4yeTVaVS8xZjVxNDM4bXBGTG10WjhYeVdibmwwMDk5ZGVneU1MaEpRQ3hU?=
 =?utf-8?B?RC80WE9BaG9HZ2MxdmhteVdta01zVEZOTGp0dzNaS05TMUdIcTNvK0dhWCsv?=
 =?utf-8?B?YmMwMG4xcjhaNW5MY1NHYkt0bW5kRWlJOUx0c1o3czR3WGRJaE5BVjM5YWpp?=
 =?utf-8?B?UGVVeFYzYmN5UFF4Z2FEMXNxY2ttMzE4SFNFVFNKWEloU3J3SjlFR3BwVDhK?=
 =?utf-8?B?NUxxaG15YnMvUDl5VHhhcVhHcmo4dTcyb3EzTmh1aks3Nk9xRmFMUUJSdThl?=
 =?utf-8?B?MUJsZjFqNFdIR1o1cGZMNmlXQ1hPdGRLTmVUb3Z2SXpXYnRsSTBTNk9OMk1Z?=
 =?utf-8?B?cmpZbUZ0Ukk3YVBOY3hYKzJ3KzkwR3lYbDh1ZTc5R2N0VnJMcVFQZDg4dXNN?=
 =?utf-8?B?MXorWXVma21OYUROOGJ0SmVkM1MvSFErQWZmSVJZdUFITGxTM3E4ZmdIakpC?=
 =?utf-8?B?d3REK2pkUzhnZGNmbU9lQXZzTzBvS0VONUVOeitpOHZaU3BYOE5WYTZyMWds?=
 =?utf-8?B?UkJ4dFhhVVgvNkpwODFDUk1RTks0c2dMOXFHOENDTjhyaElsZEEyQ295ZFhL?=
 =?utf-8?B?OWxROXIzZHRWK2ZvRFVrOWlmczdTR3NPSXhEekN5alZqQWlNOGxUSTdBbGlp?=
 =?utf-8?B?K0pWNEF1UzloZWV6WDZ5b3Q5VjN1dTE5d0ZxK25DQTFoQm1GRnNHcTd0WXBt?=
 =?utf-8?B?MnlVZG5CdTN2UW9hdEZKcVUzaHRZSHVWME1Ma1A0Z0QvUnNvMVdyMFhSVG8y?=
 =?utf-8?B?d0VXbzRaRlpZWEdJd2Y4SVp6cGoxaFJ3T3gxeWU2aTJsY2k0V3oxMHByZlAx?=
 =?utf-8?B?cXRTZXQycHd4ODM5ZGt0dXowNm5XcXZ2elluMGdpSUM4aDdSQ0NtMko4Z3ZQ?=
 =?utf-8?B?a21qNXpuaGdQTXBFU3ZDWXVuQzl6dnEwOWhBVm1VTFIxZTY5REt3NDRzVmcr?=
 =?utf-8?B?c2pKdzVHaHUwUTVnYUdGUkFKUkxmZjk0Wk5QTzV2c2g2cERHNnM1bWZ1V25T?=
 =?utf-8?B?aDNjR29BRHVEZCswREVBZmQrRU43NkwyckRMVUVlWVk3blA1VVJ5bHdZbVBE?=
 =?utf-8?B?VzBENFg2b0hqeHF2MFd0T2RKUGxDSmVLZ2toNis3SUZSZVZuRE1SdVZaYXRv?=
 =?utf-8?B?MW9pQnk2bkF2S01rVDNOUjhWeEo5V2JsTVpzRHBobmw4UXdjZWNJeHpaZm9x?=
 =?utf-8?B?RlVNN1Ficy9uQndZUnpxMGpKM0RIK0R6RUR2OVlwd1Z2RVE1UHVQNlFiSncy?=
 =?utf-8?Q?U/J+bQbuqLKWqZr3IKCgvpg=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54333795-aac3-432d-ab30-08dcec5c5fdf
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB9199.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 14:27:47.0279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AgypedBymKBJagyqu0Cg6uYkv0bSS4J6r3MvRMdgxtrnis8M+0PKx1FaNVSprTmX5UDBcQjBk3RD93UWC7axYzMASk9YHudWJfrkvP4Wriwh97vP+8OuaWhuY7ks714e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9954
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 14:27:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112905

The same issue exists in the scarthgap branch (probably in other 
branches, too)...

On 09.10.2024 08:57, guocai he via lists.openembedded.org wrote:
> From: Guocai He <guocai.he.cn@windriver.com>
> 
> Fetcher failure:
> Unable to find revision 86405c7e1bd4f70287204a28d242a1054daab520
> in branch master
> 
> Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
> ---
>   meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
> index 36205009a..991c4544b 100644
> --- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
> +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
> @@ -12,7 +12,7 @@ SRC_URI = "git://github.com/mirror/xmlrpc-c.git;branch=master;protocol=https \
>              "
>   
>   #Release 1.54.02
> -SRCREV = "86405c7e1bd4f70287204a28d242a1054daab520"
> +SRCREV = "36b142d6179514989a44c1087f6c46182dafd21f"
>   
>   S = "${WORKDIR}/git/stable"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112723): https://lists.openembedded.org/g/openembedded-devel/message/112723
> Mute This Topic: https://lists.openembedded.org/mt/108904710/7654653
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [christian.taedcke-oss@weidmueller.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Christian Taedcke
Software Developer


