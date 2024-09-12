Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B21EE6426
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 02:46:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.38508.1726109170957502275
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Sep 2024 19:46:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=998582a7bf=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C00xUx015368
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 19:46:10 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gj44da1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 19:46:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWFa5YewUPzB9vcNAocrDofVnwwbN8eT3VutVkJdjWDHcUFAQ5RP5ltLSsUU0hQhdZAkRRMLg8t9BC/t5xSl8XzR8LYboOzL2lHUoR5HoYZH+puqDk/WKub+7n73ykqV6GBe/itLY+xqs7jXp8CFaL02hOX1c1v2wAy6fTbyjInzTG0ayj2e5uKVZnZwzpyp9CID25XaSkGCmjZFMkmz6Rz89N9Pe44HObX0JeFo6G/grpDhzENC5YO8Sjf9tV1QToOJA2x+hyIPDb1Je4IyD+xlLGoWetQ07CgShQDg45Td+1TK66cNQCe+RIVTEQeGg+EsxMpHL0zSfCM/PBWGrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwbZ0111rYUzGRnkFgHsE87qE+x3KgKduVmuzq0yfVY=;
 b=bKKZy4I/J1FNp6ARfdyCXxhfMp+4moHLIzNsX+yBjS332jdwnAzur96US8pSHqeX9qQ37i71bY8DbItjjah+UupfAdnF/EDHKmdcN9FgLLKg/Zh7rLPbxs1tZ0zSLsp4Uy3YSfo1eB0N9fXWHjzq95ndVfIIhs3wcme/yN3EEhbarF6ls0SVKKaX6RXIYXar5tnokFXUvGdqIdNc0nFbQUJqCTN869OZh7bDf3SEN5hMzGgFeLIcbs022UrFzAcXM4Tx59cP0yt6hJov/rxBQEDpBtcxPziqFvzbIu/LuQXpoz6jaf58dyvUto1Lzx7fyVF35tK2MxdPZkNNmsQLgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.25; Thu, 12 Sep 2024 02:46:08 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7962.017; Thu, 12 Sep 2024
 02:46:07 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/7] mm-common: upgrade 1.0.4 -> 1.0.6
Date: Thu, 12 Sep 2024 10:45:52 +0800
Message-Id: <20240912024558.3998529-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP286CA0304.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::12) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM4PR11MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: e89ce72d-973d-454d-bf36-08dcd2d50d93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dldxR2dlamdSQU5BTnJQSmtoQWhrcjl3cnJMakw1SjhLUEJTTXFUSUNqRUIr?=
 =?utf-8?B?blZxSXo3aC9LNGQwVVI5YVJRMmJqc1hPanRmZHEzRGpQRUxQTVl5Rk5nb2Rz?=
 =?utf-8?B?SDNTMGZCUGxEcUFxRFVlSGgwdXFKbStVdFVpN2d1NTBYaUZybDVNNkJZVTJI?=
 =?utf-8?B?YUlzK3VHYVJBd04rbFdqNXJVckdTNWxPYmhYTnpKbEh6K2RDY1dBdXZTQ1RM?=
 =?utf-8?B?a2xNRkdjd3B3dkdFa1o0NGtmUHF1eUlSeERxOGc5bk0xUzZ0NjhEak1HYXlr?=
 =?utf-8?B?Q1BheVZaMmdrKy9weWJRcEd0dUt4L2NhblNERzlJdUJRTC9zN2RWY2Vzbmtu?=
 =?utf-8?B?bnpsc2Y0RXIxTlAyV2FkTThoVmRiVFdlalhQVTlNalNqTW5lNWNKRGRQVkhW?=
 =?utf-8?B?eDRYQm84dnM0QXVsYnpHMkYwTTJRK2d3K29FdmVjQ29oWmJGamcwbENpQi9u?=
 =?utf-8?B?OFRYeTFwZG1VQ05uOTJiKzhkVjZ6dWdMa2JOOU9kU1U3a1gzSFBqcFRwT1RW?=
 =?utf-8?B?VVRlSXFEeGhHUEtianJNdlRuZVVJY0hnclAvNXhrSUl1MEg4SWV0UzJNUHhK?=
 =?utf-8?B?RjZFcDduOGNNKzVLVndaejJFZ3U1T3NDVnM5TG9JeUxmc1BOaEs4UGF0dkM2?=
 =?utf-8?B?a1M5WGhOQWdYeEpSeitaeWhLNlRZSkMvbkNqM1dSMWRMMm03U1VsM3hZNHlT?=
 =?utf-8?B?RFJ6WW95RnRHdko3eHJ0aWlPdXBtdjJYMyt2QmlUbVk5UXZUL0NRcWhwOVcv?=
 =?utf-8?B?Qlgya0hUSkh1eW43V0NJWXlGL014WGc3b0c2SHEyUEJ4WjIzd2pHNnRsbzdF?=
 =?utf-8?B?RHQ3MlpQKzdTUGtnd2NUQ2w0Sms3dTkxMzFiSnh5bFJ1Ti9ldkVOVG9TMkg2?=
 =?utf-8?B?NEMyRStmZ1Z4L1JmcjFyRitVRDJzNWJFSUpGNHozRHhPSDVTRjJjTGtvTkxK?=
 =?utf-8?B?a1RadVgxZ1ZaMHdGWDF2WTZ3anF2STJYc0dSc09FSllXMWE3bW9jdk1iZ1Jq?=
 =?utf-8?B?YWVoeEpTS2tZbWV2d0k3dy9CWi8yK1lzUUNidWVBaTMydys5ZFJpemV5MGpR?=
 =?utf-8?B?Smk4bXVHS2dwWnhRNWNBRWJiZlFGbVF5SWJPRGRmZEZDY1RWejhUclA3MkFv?=
 =?utf-8?B?WnU5ejJNVDdSQU9vTms4OHhrSHl1RXBYWWVYb3FkS1hzUkRaRDhnb0lFZUhs?=
 =?utf-8?B?WjhGVktQeWZ3TjBlMHBjeFNyWXZtSk9LWEh6TU40TmY0N0ZnTGM5STZhT051?=
 =?utf-8?B?MmQyakJyVW15STlHNkl5V3Q4UTdMUE5scXVlS2J2UCtEZC9xMUtOZFNISEQy?=
 =?utf-8?B?RWdzaElpSkI4SHVyU3NSWDNWYUM2TTB0ZzVYbmp4OFp2Y2Vsd0VlWTBEN2Ev?=
 =?utf-8?B?NlFDa0FUUnVYdjE4NXBkWm1rRlNzYlg0VE1NZ0tiYnN5Z1lzWkcwNkR2dytF?=
 =?utf-8?B?ek5tcjRNLzJlRHQ4b1BpRm5MTEY2WU1taEpVRHNiR2JiWnNlUXA2WTdINU9i?=
 =?utf-8?B?Wm85NFhuSG9YRW9kZGtBNE5aUG1ST2FZT3gyQlNUUC9INGV0d1RCU2h0VUNI?=
 =?utf-8?B?b0JBdHNFZFNRd2NPeTBPOStjUGpUekpuSU1Sdi81NXM4a0NmRjZzbzlDVWF5?=
 =?utf-8?B?Tmw4cWRiWk1IUC9TRVYrU0hXQ0JlZWlXUjdoQXNPcHhZaU5RZkxuWG9STU9n?=
 =?utf-8?B?NWhIQ1ZuT2Fkemw5clZLa2JqR2tnTDZQOEJiQy82eVFSL0M3dWhwWFVGSk8r?=
 =?utf-8?B?U0kzbkZMZTBjLzlJMVRBd3ZwKzBUb1BJTlVXLytzbWh1eHpteXJvR2loQzh5?=
 =?utf-8?B?alBvQmVIRFMzQnMxdFVYbVFQWEVTYkNXOUxpb0d4NWNSV0JDWkVhRGJvc0Rm?=
 =?utf-8?B?MkNlcFN3RjNzQ2xYc0Q2d1Y3L3h6c0dhalJDSG5DR3EvaXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T29zYXZka0pNZGViTE9TVVIyUUsraTZVSEFMV1hlQUd4VHpZNXB0cFZraWth?=
 =?utf-8?B?bnlUbXU0cTdyRkZVYitUNGlDQ05KbjhCOWVnVG9nWnQxT2hVVXZBYWFlT2pw?=
 =?utf-8?B?enc2aVNRbkJ3eDVJK1B4TlRVT01ORFhRcXpoVjFrRWtlT2hsR1lKaTlWdmFn?=
 =?utf-8?B?QXd5MnpZMkdGK2NQNEJpQjRwd2M4NE1XUUZ4NkZ5Yk96cks5c0pGWGhReE9C?=
 =?utf-8?B?SklReTBxblJXWk0yV0R2NDFSdjF2OThYazRWYUpxYS9zbXJSWXJuM09lbHJ3?=
 =?utf-8?B?MFp6Y05vQnpHTkNZWkVsV095ODRScUxwSlJvNU5BK3QyYWQ5K25DWkxKVWxm?=
 =?utf-8?B?T0RwNGdMdU55SmxVNERFT0haK055aWtjR0pITVFJbmdmSlZqY201bHpUWldy?=
 =?utf-8?B?QTdFZDhQOW42K0M1NmdNd21JeWdrdDYxQTZxelMwbldCWlROVS9XcGNZaVc5?=
 =?utf-8?B?VEJzMm5US3lwVXN2eTJaTjBUWnRQY01Wc1NHQlo4aGhBM3ZiSzZIQUlibktO?=
 =?utf-8?B?Y1JNMXgrbDJUSEhyc3VxVWNwaC9qUHZFeXl4b25IbURWWkJ1Lys3anRweXEw?=
 =?utf-8?B?bld5T1h6d0ZCZjJiTFFEZ2YyNTdqSXAyWFB3YThDMU4xa3FhQVhtZTdvUUdZ?=
 =?utf-8?B?M21GZUVobk96QWtWbTRrTnhYa2xPQ2liaFFNWmI5L3dpbmZ1MEV3aTRYZUlE?=
 =?utf-8?B?VVViZTRtZnVCbTY2djRndmt5Q09SNGJGdzFjOEZkaDRrU1NUL0VrQjdvdmpn?=
 =?utf-8?B?dk1hVlJCV0U0ZlM4MnR2SGpwanVLekNKbjFLZWJYejFQQjRLWjlFS0RQM25o?=
 =?utf-8?B?bjRPMFl0WXlIcnZtU3FXMnV3QlpmalhFczBOVjFLZGZURHhRNThtRm1LZ3VU?=
 =?utf-8?B?VzFMTGRzN1ZlaGwwc3JUdGtSTmdKcU1HRzAvYzdUeXFzZVVVYXZNR0NjcW51?=
 =?utf-8?B?czNtM3hwV1hWYWltbzZtWkhuWmwvNUpuc2RJKzlwcjFpenM3akJjWklLZm40?=
 =?utf-8?B?ZjNqcDZRNldCeFp0d29OTThlQ1dGOE9YWTNyWjFSSXE0SEozbFVBeXZYQUZZ?=
 =?utf-8?B?SlhseFJ4TFh1cWlKYlZNWGg5cDJVb3JFWUJlbFkxcFByUU5Kd01hazJBZ3Mz?=
 =?utf-8?B?VU4wYS9vRXpVSFR2S2t4Uk5paXExVjVxZmNpV3krcFFoSFhqZnA4UDlPZnNp?=
 =?utf-8?B?dEhad2Q1TmI5V2JqeGI5UEJMTzlaREpHSG5CSFVQVDdKRU9mSVhrSUJxQkpt?=
 =?utf-8?B?Njc4RzdxcldlcERDY2tMTFJaTEh4WUMycUYrckJtRWVQZVk1Z21qOU9sL1FJ?=
 =?utf-8?B?bE1UT1IxSVg5bEVSaDNNR0M3WlJFMlpPSlZ1TmpSZ3dWakV1WjFLUkF6Yldz?=
 =?utf-8?B?UU5KZGF3cnA0Z3VNTTVpbEU1SzdwRkswZHo5S014UGlmUHdkUHRoa3Nlc2lS?=
 =?utf-8?B?R1RyMDY4MlBLQW5tRmdKMitRUlpxWWEzRVNrZXFNVDdGTGh6MzZEYXhxZGJq?=
 =?utf-8?B?NzEzZitzWFBFRWNNNGtHK3FMajB1eDdGTXljZ292ckpqSnhWbFlUNnRJWSt1?=
 =?utf-8?B?SFNpMXlmZStUb2taVEM1cDZEeHNUUW9uVmNRWmZQb1RjTFUxZC81N0VTNDVR?=
 =?utf-8?B?ejk5TUZWTjVqLzhUMXdwS1ZtaFltRTlOeHUvUXAyZ1Y3VUFRR01FR3dtQ3d2?=
 =?utf-8?B?d2h4Q2VMaW9RQnFsWlRadzBBNDhtSVVOVTVXV3Jia0Fkb1A2RlhVTGphSmFm?=
 =?utf-8?B?YkI4SUwrNDlJdEV0NWlnVHFUUSthVi9nRFZXaGFUMDB6Q3FnTmdVRnhDWEhv?=
 =?utf-8?B?TzZLY3pDeUFRVUVhcEhvaFpaQVpFcXYvMmpXNUJjYUViaVdNTnFyYnlzSFJh?=
 =?utf-8?B?YStQaTEwZDZCbHdldS82cUM4a1lyZVRkckZLNFdrTUFCQzhEdFZwVDc4dDdv?=
 =?utf-8?B?Q3BQYzl3bnZlcmpqNUF4YlZBdlRjRDZBdzVmeG1vdHhicUR2YzhIdlhRcmYw?=
 =?utf-8?B?c0M4b1gzbzZPQ0Nxd2hXaFI3VlRJWERsaFpBT0VUMWFyNERFUFoxQjdWNDVz?=
 =?utf-8?B?NUpheTZoUHlZcXNEVDRENTBmMG03WVovb2RWelN6d1I1ajRFRUtMNElBR1lP?=
 =?utf-8?Q?MndKHY2z4JP4OZfJat70jAWQq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e89ce72d-973d-454d-bf36-08dcd2d50d93
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 02:46:07.9090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0e/g3KX9ExXdWTB3KVASqR5wdPkPmR6NgnXspBH8vsKGyoBZNnNQemOpQxeYXOVfHLjzw3xT8iaW4eoUdXwGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
X-Proofpoint-GUID: KymmSkqSviEqwcqfye-TOSJjqUUCipgG
X-Authority-Analysis: v=2.4 cv=DZxFqetW c=1 sm=1 tr=0 ts=66e255f2 cx=c_pps a=6DIaztarb0XTwjBPIWoXxQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=omOdbC7AAAAA:8 a=puIw4dgwsCexfbZzaOQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: KymmSkqSviEqwcqfye-TOSJjqUUCipgG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-11_02,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409120020
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 48C00xUx015368
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Sep 2024 02:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112247

ChangeLog:
https://gitlab.gnome.org/GNOME/mm-common/-/blob/1.0.6/NEWS

Drop 0001-meson.build-do-not-ask-for-python-installation-versi.patch as
the issue has been fixed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ot-ask-for-python-installation-versi.patch | 45 -------------------
 ...{mm-common_1.0.4.bb =3D> mm-common_1.0.6.bb} |  3 +-
 2 files changed, 1 insertion(+), 47 deletions(-)
 delete mode 100644 meta-oe/recipes-core/mm-common/mm-common/0001-meson.b=
uild-do-not-ask-for-python-installation-versi.patch
 rename meta-oe/recipes-core/mm-common/{mm-common_1.0.4.bb =3D> mm-common=
_1.0.6.bb} (79%)

diff --git a/meta-oe/recipes-core/mm-common/mm-common/0001-meson.build-do=
-not-ask-for-python-installation-versi.patch b/meta-oe/recipes-core/mm-co=
mmon/mm-common/0001-meson.build-do-not-ask-for-python-installation-versi.=
patch
deleted file mode 100644
index 4866a5fbe..000000000
--- a/meta-oe/recipes-core/mm-common/mm-common/0001-meson.build-do-not-as=
k-for-python-installation-versi.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From af4069263487399be82ee53d48b1edda7f8e594e Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
-Date: Mon, 4 Nov 2019 19:19:47 +0100
-Subject: [PATCH] meson.build: do not ask for python installation / versi=
on
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Even by adding python3-setuptools-native the following error is not fixe=
d so
-just ask for python3 executable.
-
-| meson.build:9:0: ERROR: <ExternalProgram 'python3' -> ['<...>/recipe-s=
ysroot-native/usr/bin/python3-native/python3']> is not a valid python or =
it is missing setuptools
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
-
-rebase for 1.0.4
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
-
----
- meson.build | 7 +------
- 1 file changed, 1 insertion(+), 6 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 8a18c36..34fd546 100644
---- a/meson.build
-+++ b/meson.build
-@@ -7,12 +7,7 @@ project('mm-common',
-                               # and meson.add_install_script(python3, .=
..)
- )
-=20
--python3 =3D import('python').find_installation()
--python_version =3D python3.language_version()
--python_version_req =3D '>=3D 3.5'
--if not python_version.version_compare(python_version_req)
--  error('Requires Python @0@, found @1@.'.format(python_version_req, py=
thon_version))
--endif
-+python3 =3D import('python3').find_python()
-=20
- # Use these instead of meson.source_root() and meson.build_root().
- # source_root() and build_root() are not useful, if this is a subprojec=
t.
---=20
-2.25.1
-
diff --git a/meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb b/meta-oe/=
recipes-core/mm-common/mm-common_1.0.6.bb
similarity index 79%
rename from meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb
rename to meta-oe/recipes-core/mm-common/mm-common_1.0.6.bb
index 3e99b38eb..a252a6b48 100644
--- a/meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb
+++ b/meta-oe/recipes-core/mm-common/mm-common_1.0.6.bb
@@ -8,8 +8,7 @@ inherit gnomebase
 # All the recipe does is stage python and shell script, some autotools f=
iles; nothing is compiled.
 inherit allarch
=20
-SRC_URI[archive.sha256sum] =3D "e954c09b4309a7ef93e13b69260acdc5738c9074=
77eb381b78bb1e414ee6dbd8"
-SRC_URI +=3D "file://0001-meson.build-do-not-ask-for-python-installation=
-versi.patch"
+SRC_URI[archive.sha256sum] =3D "b55c46037dbcdabc5cee3b389ea11cc3910adb68=
ebe883e9477847aa660862e7"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
--=20
2.25.1


