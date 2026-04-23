Return-Path: <wenlin.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435FAFAD3FA
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 04:10:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12369.1776917423968183856
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 21:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Jb9bRLMZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8573336654=wenlin.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3TTIX1449554
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 21:10:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=CvQzyIAF+wJgdGWtm7rlG6qxoTp9KpH/yfQna9giNz4=; b=Jb9bRLMZGCrc
	48mJXhbrNFTrMkpODsoknL0vy/185b/AQgcYLa4M5uPBVtvF2a57PR7qf/sizwGX
	kCTBuT+x0H3mZyA4y8Sera6D0cWD1AwmS6VKKEM0Ro0KwiYK3IFaTlxtn5BjoC63
	JwCOBueYnRQOhdDhlfuDBg4oimVYevyfIG2+gVGezxo0noG4NCBw0570r71M+Kcr
	V/euTop2j2YG/R6XaFmAkk4l/kRX0OEAe783E7+SBFP2cPiLTEmzjCPUCpCbrmTR
	+bGMgGPFMdQGgZkjfnb86i1/4RGlpEbxzPnO7nzVO4vhNdDJxWjv1SjKGlb5Yjae
	6oRGRzuO4w==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012068.outbound.protection.outlook.com [40.107.209.68])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8rcr579-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 21:10:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0w+drv/drRVAsq53NA/P7bObE83gCCIHXUmEoUWQLFw3g7qm8DUOLxdARSUfA1usZiLmZhu/qRVr4IOUvn5VswvgzmfgI+/t0zI+QNRvD8DKeRhW2R2T7Kwtue55H5Ku3wvMZyLtBOpDxKhBCN5/QkuJYn7rUr8VJQ3thLjmFV5699OU8zPyC4+hAKwBU7/tTOsqXDqkTDas1Ov35fkV6Wm/kNV/UGmLZfoa4hOWKUTPL9SYBWPt3J5bwA4DWviLj/gT4MGijx2tg7vYMXoZohE/LjqMv27BUE46J5qSGNiYEK/UpWBQaGwSZpnxYcub6zdwbSfQD2Gi4z89VDyFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvQzyIAF+wJgdGWtm7rlG6qxoTp9KpH/yfQna9giNz4=;
 b=D29KzrKP7q3KZXn9zEnh2cQLc4cacsm9/JSslLyWFHysONmlnrs/IQqeLg8FMzjqaqN+UiYcMwUECohHrKZcQRtrhRsnhnPsa0FcGV2MZamFC6vs8GBzocKN7zclbuIy5o9YwJs7QBzKP6xdInfksn5Xj5Phl2u3f1DuBqjE8QHh+Qf+D0hcaOSqNT3LZmuabXoiOvtMnX6juOq2xU1FZEp+b3zHzbKKJuB6IiZeyF4psrTBNckOdiOK2ZfAsbKlj8SbW//0VzS8fGWNmWX3NbvEy85JZD9+MI+o+Z69BGeA0iy6V3bqNdsATwawj8AlR6U1Y+zosKnD5HHcEUKD/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV2PR11MB6070.namprd11.prod.outlook.com (2603:10b6:408:179::22)
 by DM3PPFD320E2257.namprd11.prod.outlook.com (2603:10b6:f:fc00::f51) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Thu, 23 Apr
 2026 04:10:20 +0000
Received: from LV2PR11MB6070.namprd11.prod.outlook.com
 ([fe80::4c84:af62:dc60:fd9]) by LV2PR11MB6070.namprd11.prod.outlook.com
 ([fe80::4c84:af62:dc60:fd9%5]) with mapi id 15.20.9846.016; Thu, 23 Apr 2026
 04:10:20 +0000
Message-ID: <c8fe7751-ad64-4af7-927f-3ccc37dfb60c@windriver.com>
Date: Thu, 23 Apr 2026 12:10:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-xfce][PATCH] xfce4-session: Make libpam and systemd
 dependencies conditional
To: openembedded-devel@lists.openembedded.org
References: <18A8DE19AC3F7167.2028604@lists.openembedded.org>
Content-Language: en-US
From: "Kang, Wenlin" <wenlin.kang@windriver.com>
In-Reply-To: <18A8DE19AC3F7167.2028604@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0072.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:118::20) To LV2PR11MB6070.namprd11.prod.outlook.com
 (2603:10b6:408:179::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB6070:EE_|DM3PPFD320E2257:EE_
X-MS-Office365-Filtering-Correlation-Id: c45deb11-7df8-4e51-34c4-08dea0ee3be9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|4022899009|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	FLw+ZT4kzqQWv9CLoR1D8eh4GbaLq30ty7RG6yq42fnr4mR2row85V9fkXDjz18+4M8UyLjBSsVhLWx1XjnKp06AuXp1nLzVGe0o/wLop0A7Ndd+h99oDWrUM0IEhH3ixyEOKUQnqYccDarcGcRQY5czlbmg9dReo197gxXmqGzIYzqU/RKuhXdUGBRvjWRA/2aQaNtZnSEiJb1N7L6yE5Z+RecbhnL/+EtaYAONj+qWoFaABudpLomWqi+4Hw6evJTqD0yXiu5Df6fHb8uyzS7k6MNedZ/4sNtB7KyqTxMYwFCFSjSow2Za+gqRPpURIQtMkmCXpfwOTGb9cUxpfXGfe7lNqo9rYETNybcSE6W6XPsmO2Xc0Haja0AthRPTXuKwR6z6/F+LUs+EXln8M4bHSyNzUOdnfrRwWem+scSwBPvYj2Ma861NI5Kq1ANtHRpXytJpte1FrVFdlNivvsYlNZo3LMO1gDJNYhjCFg4eVbUlpHglFFUZjKkXqmLqzXKyQNb+ynoY9TrWSDVKzc2pnD6/Iubx5m5/JmrdPoqJvS0PaWTZAAw9HhCPlJ5GDco4Y0z06g7gbtf3NAt3rTiXPLiPhbO7FsrJBhbamcCzZsunQbgPO/eia3bAb41wgYjWycvndICHhtSKoj3eGWgbJRNvoxAjlCJAoqk69H4BI3TOD7GcCJfjSmXMFaCs
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR11MB6070.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NGVIN0xGMWVsMkxCSkxzR3pkSnpvVFo3RCtxK0pGOThKRTFNcWNmbFRHalJ1?=
 =?utf-8?B?bkFmdUdvSCtRb3lBMjM1TGhENXNNOHZRM1YxZWxoTkZ2UHhPSXNoTXVkNFJ0?=
 =?utf-8?B?WFZUa1RsVll5c2ZUNndxQzNIT1cwMklvbzhuWTBvREJoQWcwajNjQ3ExU1oz?=
 =?utf-8?B?NzBZTFNvMFZsTmhqMEE3UGNMYWw3VkFDSTRRK1kzOHZBM3gySzNaWmVicWJt?=
 =?utf-8?B?cmxsVmRJc01qcW9aT2VueSs2WStMT1dVU0RRcGpETVcraGdROEpmc1YrWjRG?=
 =?utf-8?B?b2ZTK2V4d1FaSmpNN3lHN25PZDE1Um1HdmU5SFNxUDVKOU5wN0lYZU9NVmJq?=
 =?utf-8?B?dTc3U0RBVjR0TzNaaTBxY2ZDUWFyMFlaTlBPenpVZDdlOEYzcWtnTnpLbldr?=
 =?utf-8?B?cFFleHBpM05iQkdrdXJpVmVNTExyOTJWRHY0VG93SS9oQ2Ezam0xa2NMS3Mr?=
 =?utf-8?B?S3RUNnVsUVN0ZzVXS1AxekF6WldnRkZCRyt0UzhTRk9tdXlVVjlJQ2UvelpC?=
 =?utf-8?B?Y01lS3VpNU4yeWc1b3ZWUVJ4Ukg1RFVoZVgzclkzV2lRL0pNNGx4c2lKTTBH?=
 =?utf-8?B?UDAwdkkyemVETmlMQ3Y5MEFTL2ErMGFvYkhDZXR3bXB6NjUrdXlOd25JWHhL?=
 =?utf-8?B?aXplTzZwd0VlVnVuNFNDMGJDcTEvOFNpdDFsaXlDbnc1R0hoR1NQTENJU3dz?=
 =?utf-8?B?S3c4WkhqRGdZZ3hJNlJCT0R2clg1VXdYdFppNVZwWXdBeEZ4OFMvSTEvMXkz?=
 =?utf-8?B?eEQrSGNCcE8zSmRWVnVMVE1vZHVNdW0rczA5aGtSdkhhRlV0QU5USmpMa25a?=
 =?utf-8?B?Zmp5anhiUFZYMXZOMWdqQVRLWDdBYW03b2ZNNnRtM2gwcFZIRUt3UkVwY1c3?=
 =?utf-8?B?bGFwNUx3OFhaZEJqdnJMbm03bDAvOW1aeHpqWHdEYkthNzkzTUlqWGR3RnRD?=
 =?utf-8?B?SmF6U3AxblRFUmdwdzA4UmcrcTBEOW14aTZxbGFMdzJ1VFA0T204aDFPOXJk?=
 =?utf-8?B?aVp3MUcxQ3FZM09nMmJCK3R1eVBMTFZxejN3NDJyamMwVC9SeS9PODRtcEVn?=
 =?utf-8?B?a0V3SUFUd09TQnpTdVdHbmpIRThFL1FXaGtjYXpIRzI3RGJjU2xQRXVITUJY?=
 =?utf-8?B?Rloxa0lWM09NV2ROSlIwdlNCVUJvc1lxRDdxczJLVTNPdnE3QlZQUTdLZzU1?=
 =?utf-8?B?ZStUVFc4ZmtHMzV1VzA0cUlsQmhJZ0F4dWIyUWFsczdEWVBRanUvaWhiMjNp?=
 =?utf-8?B?dWYxRzkrbkQzbm5KQjh5MWdjSTdBeEsyeTFad3ZWZ0RmUkVJTzc0VjlNVTRB?=
 =?utf-8?B?MnBPays1U2VySEcrMlVlWnloYkdFa1BGMEtVWEZPcTh1MHkrc1JSOVVSSEVn?=
 =?utf-8?B?N0lna1lUdkdUR2ZqY2pld1JzK1FmbCtDVGExdDZTRkc5M2YrWkhsRk5kR09M?=
 =?utf-8?B?dmV4SzRXelJuWkl2ZTdJazd3MS9ZYTBvRTYyaGgwY09Ob3JmdXZyZUdZRzVj?=
 =?utf-8?B?TkFIZUg2OUh2UGU0VlQvVnhudENhL0t6d3VzOFVsK2lQQkpOZHNONVBvb1FF?=
 =?utf-8?B?SjRWcGJRbFZDMStrVkdYWk8xUmp2cDlyUlJ5bG00Nm1wbVBQZlFyZ2pWaDNw?=
 =?utf-8?B?Y2FvSkcxbi8zWUsyNGxYYWpMMzVaZHJvd0psWks3eG5IQW93aUowZ2VLSlU3?=
 =?utf-8?B?aVJiN21WSVdGZld0WEU0RlpuSkE5ODBoSGU5S3laK3JzV2xtNGFueWJsbmcv?=
 =?utf-8?B?SUpBRVM1N0Z6WU9zcXVSbTBOR050U2kxK3U4RWJnekYvVGNQMHpJa3JidmpI?=
 =?utf-8?B?MzdEOFVvNFdjbld0MWxaa3UxdVdiTG1KQjNkL1FMdDRjcnhETXc3eUh5MUQ4?=
 =?utf-8?B?QlhpZy9nSG9MblEvWTBiOTZxZENlT1U0eXlBaWFnbWhpVGNTK2RiZjAzNUVj?=
 =?utf-8?B?TnZVZEhsV2ZlY0NMSVV3RmprMTdPaGQ3MXpMUXVBeEhmQWt2dUVZek5pUGs3?=
 =?utf-8?B?RUdqcnlYRzhyVVloYlRKVnZ6NEpxb2VqZmFkWmVhZkcxUU4xT1dDSk5mbWZx?=
 =?utf-8?B?UXo4VXc1UHRyblFOcTVBcXQySnY4YTRrY3dWL2J6ZDd6WlBWTTAvUjZ0V291?=
 =?utf-8?B?ZmFEVXUrUWlPY0M4OHo4SGVKMWE1aGJJREJHbzdra1NVcCt1RGNUQVBDSEJT?=
 =?utf-8?B?QzVmUmpLNlF3UTNJS0s3ZUZYZStUTzBqbndVVkh6dTR3ckk0bFJ5cGxYeElP?=
 =?utf-8?B?UEtQdzQvQUMvOWdGZm41cVhLYkpabDVETXByTHNWa2tLcGYrL3NPREYrWTVu?=
 =?utf-8?B?OHVzVWZuN1NHbGxTL1dSYVRrTDhoRUpJYW1CMGxyemF6WHkrSWljdWdGbDJo?=
 =?utf-8?Q?gWVIcMUKBlAV+uyc=3D?=
X-Exchange-RoutingPolicyChecked: 
	VhUvCLyFqbd8OkBku3u7qRcUrOhW4+jS1KhEcba/cKDKt21jSmyZwgk3KVBVnYwodoyIN3B1V2hrfxGmyMmmPiEEdWWofSw4dMbCgI/73xEl7j9aBj+zzcEwawKhM/dag4RvCDz11TLDrH3bvdasI/DVvaVEGpgueI6M5taY45V8Tl8kv/Y3W/+8IBGVoPKyxEqND+r0if1QdVkUy9Z6Q1Jp1eZhU7RavMsC0egTZw6CIyEpQVPyQYl7ilM/M1eK2h8avsGX73hkNbmNhr4jqUU6mkcQKixJdL0kZjLxbko7Umwd1A21Qblmoa9bYFoNcH0XuCdWU2uDbSDuF2THAg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c45deb11-7df8-4e51-34c4-08dea0ee3be9
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6070.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 04:10:20.3909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: knmbD7NCdIfC2yxWRIrRQHUlIHaLX7jXyFZ75LwoPJddrnj8qizq425frjSahqEKBtFau43ZzsibFJZ9Fy7MkvSiJb1rGirWtrIsd7V9N98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFD320E2257
X-Proofpoint-ORIG-GUID: OvJ_0mk6ZBnqoKqeJTHyeLqqMgB4w36p
X-Authority-Analysis: v=2.4 cv=MYhcfZ/f c=1 sm=1 tr=0 ts=69e99baf cx=c_pps
 a=R5REeynT8B2cGAMauuPKTw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=x1D5sdFhi9I1PhIp_mAA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: OvJ_0mk6ZBnqoKqeJTHyeLqqMgB4w36p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDAzNiBTYWx0ZWRfX+fVTFq/DA2uk
 zvb4Gt3Hkgkrr7Hd4x5/T801hr5sRlodxVW4gTNYHaQ/iAcSRSnhFdRGNBvmcAkdXVh/ceFFHFj
 7Gs/6RXZPb338Qn7veodPzQOObDI+q9v1N6QZO4xJJ2U2OLpV7vCfLNEuPh8uk92x/x2DBI+V2m
 Opli3kv93RPePNsrb72AOSQyQJsqEjcJ58owgUwBAzrsXwqMrbicBWYbTnnEX13cKkS/vbFbAoj
 VVX6EDjORxymxrrJPO+sz/5ubRBoYyZb2Q7zhd7QPrhgI5vj7dwxdnZyDtX8BOVttvWtI05jaB0
 KzFXanK+EErDNoGgf1P9fGTs7CRuIsXlp/2RKoASzew/p/XnoKHfI0TnjQ42u+NkV3/TdiUFZkH
 ztZNlZcybYYcih3p1CPxojw9JDmQHT+8vnp/xIeIZb4IBgqPlstxy+jMUGK/eG6fRITK/yHVJsv
 vOVWnX06kGY3VMnr5JQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230036
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 04:10:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126569

Please ignore it.

On 4/23/2026 11:17 AM, wenlin.kang@windriver.com via 
lists.openembedded.org wrote:
> From: Wenlin Kang <wenlin.kang@windriver.com>
>
> libpam and systemd require the settings below:
>    INIT_MANAGER = "systemd"
>    DISTRO_FEATURES:append = " pam systemd usrmerge"
>
> So remove hardcoded libpam and systemd dependencies from DEPENDS.
> Add conditional logic to include these dependencies only when
> the corresponding DISTRO_FEATURES are enabled.
>
> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> ---
>   .../xfce4-screensaver/xfce4-screensaver_4.20.2.bb         | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
> index b95bfc170c..191c49b216 100644
> --- a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
> +++ b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
> @@ -10,7 +10,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>   XFCE_COMPRESS_TYPE = "xz"
>   XFCEBASEBUILDCLASS = "meson"
>   
> -DEPENDS = "dbus-glib garcon gtk+3 libxklavier libxscrnsaver virtual/libx11 xfconf libwnck3 libpam systemd"
> +DEPENDS = "dbus-glib garcon gtk+3 libxklavier libxscrnsaver virtual/libx11 xfconf libwnck3"
> +
> +EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '', '-Dauthentication-scheme=none', d)}"
> +DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
> +
> +EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', '-Dsession-manager=none', d)}"
> +DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
>   
>   inherit xfce-app
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126567): https://lists.openembedded.org/g/openembedded-devel/message/126567
> Mute This Topic: https://lists.openembedded.org/mt/118966722/3617706
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [wenlin.kang@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

