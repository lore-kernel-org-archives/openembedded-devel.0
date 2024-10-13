Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC37CF2592
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 04:09:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.25531.1728792585295313146
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Oct 2024 21:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=00166a7a54=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49D451di003116
	for <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 21:09:44 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 427md4gkrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 21:09:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mxzdbdq7CfaP1s5q/0plhqVEOAWDWFZby3WEeHo/5w4dTQZ79jyDoSjnz9Rs7Llk+2pTw5SqtCUHSYaz971K+x6MquK0FthKPycUF/ALbDt/EwKBTYC19MPYQ4/vtvP7+ybtAH8eJLb2MHDyZ+eb97dyACYUCIDeaRpjKxBnIbypeiYFvj5a+IxdOGk6Xjlb2UwOEgdO6bMlIjF/Mb5QxrWKiF5IyebEAQscr2mLADzXHZ5hkeD0WACp6wUSCobFpFEQcLV6dw5R85+IHRR4zThgU8jlyP1QfgB23eM0BuW1RypsLSJc3JHVIP0HTd4VBBxzx4RYX0gldg/wskF1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2GREI4/5Ep/wpdp91oHEVfTC6R8wd/t/6Fuvt75Tsg=;
 b=kd3pgjlRN9ryCNSNvImCHPKLFeGIazRLOoMrrbFDvIP4bAH5g5Ul3CXR/14uIR8l2Rk+bT3DrDKlKVyAPK8JcJl3hh+cArz/S9H1hy9pVUNIdXeFPdE/Nsx3B5bCy1nCzDdWT74OEV5jqWmSlasPzoVmcwbJbq40trxMZ6JetsV4zzGUwbIOpKqF9DhSUznBhYz03WxQKbfefycE0VwvivKi2RYTajJPFI7hsBAc6TVJ8U6U8xAk3abeaK5Rir3v9ay3JUnbJD8mfu8cRTFrCGjGbQOzIdLW1x3MKGa1g5TXb+q1mKD3DKsdMygakuzIlmcGHex+ClJtygvT5qC+WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ0PR11MB6768.namprd11.prod.outlook.com (2603:10b6:a03:47f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.18; Sun, 13 Oct 2024 04:09:41 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8048.020; Sun, 13 Oct 2024
 04:09:41 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] wxwidgets: upgrade 3.2.1 -> 3.2.6
Date: Sun, 13 Oct 2024 12:09:24 +0800
Message-Id: <20241013040924.3100620-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP286CA0280.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ0PR11MB6768:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fbf857e-34e8-451e-85f9-08dceb3cdc64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NUZwSnVDVTl6VXFOV2t1bC9HbjVwMHBBcFVkaVVMNGU2d0lGM3FsRWwxUmJF?=
 =?utf-8?B?RHFFazdjOFdJYnRCWUFBVGdWVk11cnN4clN4NjI0N2IvTlRDSXJaKytqR29y?=
 =?utf-8?B?V0lIb2xNb3RXTmJQaU1GRVNpYmppZ0lDRmRYK2o5dktpUXZmSko5cGNoTEJu?=
 =?utf-8?B?VU5kaVJQUytSREh5UlVJbWhocG9RNE5OUnhiSldyK1hnK3Ava2JiRDN6c3Vh?=
 =?utf-8?B?UkhhclM2WU40dnVNSTVWL1hiVk9sOGkyUW1WUDJvcmRBZUhFdXBuWEVYVkVx?=
 =?utf-8?B?TmNNdHFHZkh5R25iR2lYUWhQbkk0ZEd0WGlPM3FObWpVc3o2bE5Ia09MZk5m?=
 =?utf-8?B?ZDZrSkkrRnREdkNjRGVrREg4TTRIbUxOSXd1QkVKSCs0YjJ2Q1NPTXV5MU5z?=
 =?utf-8?B?NEVTZFkyTUJiUFozVjNnVVdOckkwQ0VNK3B1emhybHRNdlhNN1JTN3ExbUNT?=
 =?utf-8?B?MXFFcGhSRWg2UUFSMW8rTlVQWFo2dTUxNEZqYytnbzJpNUpPRzNZWC95V2h2?=
 =?utf-8?B?bVBEbkZjakpTRGFPT1hoSlh0L2ltemFCVnN0ZlA1N0pteXVYdDZUSGFnVlVx?=
 =?utf-8?B?eDZ5YmZnNkZTOFVJUUtVblRUNFRKb2ozdWhHUisweUxMK0VoTUhsd0FSZmR4?=
 =?utf-8?B?MytJL29YYW1Ib0RlRUMyRE9IMC84WUozR0hETDlMVlMyTnhmdjdRSWdNUVJY?=
 =?utf-8?B?SzNLVUpFWCtrMjh3MGFrbG1HMHNZMnh5ZVc4aXNmQ09Ec0dHRThBUHYxL21s?=
 =?utf-8?B?ZVdmRnBqYUVkcnFzWTk2TmNuSklJb1VSVjdzZ3Q4MDNiMXNkMnZ3RjZRVUs5?=
 =?utf-8?B?S3dXaVJnOGVPaytVWUFUakZodUMzdDB1d0JVRjRhSWtUNmhSVHZnZjRxcmpk?=
 =?utf-8?B?OWx4d0NwYlhOa2lHeUVhVjZ2WGtpYnNkM3FSaGpvb1BUZWt0UTFkcnZlcTBh?=
 =?utf-8?B?bWxmM0lkTXBWandEWjk3T2RycEFJVEZwYk4wY2hSOHBMNEE5ZlZrUk4xL2Na?=
 =?utf-8?B?cGwzS2tDMGtud21KeENaWmxJN2N1YVJ3R1dVMmZqYkl3b1hTU2h4SkNyRDhW?=
 =?utf-8?B?L2ovR2FjZXYvN2dsYmd1eU1uSVpLRk9lblE0aGExMWhMYytnRy9hOXhkckNo?=
 =?utf-8?B?NVdIL25ObVNNbDNRNWNrSEVKZjJCS3lkVWtYVFJxSmF3RGlrMHJ4QkF4blky?=
 =?utf-8?B?aFJBM2ozaG52VnIrTlFSRmtsUUovUWlZWlJxdEVici9BZi9hTytzaHhwclBs?=
 =?utf-8?B?ZXdpTDhlS1R6cHBhZ01RYWUvbFIwOVJYRHUzeEtOVGNrYkVQSzFiTk4vMXZT?=
 =?utf-8?B?dWZqOWkwZ2lvRHhiNFBxbjQvTkR0VkJ4bEhGZXRVSC9FV0tuYVFMUElJTlkz?=
 =?utf-8?B?MUpBODdFY25FejdXem84M1U2ZzdJT28yYXRBOENwT0h3R3dadmpkbVNQRnNE?=
 =?utf-8?B?dTFzTE1DYysrMTNHdU1uOCtUL3Z3NWovdWQ2RFF2MEl4ellVWTRMV0VKSEVw?=
 =?utf-8?B?dWNiZWZXYXV0VUUzQlpaSk85S2M1QjZndzdCUkIvTmpscHEycXMzdU5HQ2pS?=
 =?utf-8?B?WUVmVkR3VHVQUlRjaWN5bWszT3hzSmErbEUvbzBKYnFxNXordHN1MkVrR2ZX?=
 =?utf-8?B?ZmRvZ3hvNit0MXluSi93MUNtVStXTGlrcTY4SjI1NWVTbzNxTkEyZ082S3ZF?=
 =?utf-8?B?MU9EaHJHbXpabmZYQ0RSQ21oZVZOZ1VHNHdXcXFSdU1GdVpFbk42WXZjVUJL?=
 =?utf-8?Q?uOWhSZDqE19lYt2tM4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WkV5eXpaajc2MDZ6N3UyUFlXN1NlQmxKK3p1U3cxeTF6V0t0MExCdXhrQzFp?=
 =?utf-8?B?QmthVnhPVjFGc1lNY0hmUkNRbTNCdVMzTUxIbVJsODNibEFjRFFxWCtLTnJT?=
 =?utf-8?B?eHVRS2ZwL3lCZ3lYaWM5STV0OVhWTDZBQVRhbktPRnVsN1hvaWZnbmhkdzE3?=
 =?utf-8?B?N1ZjZGRoWUxHSUFTVmFncE5kTjIrVlpvQWtOUzFVcnBzWjA2OEcxQ004Y2V6?=
 =?utf-8?B?ZFpjWUVNSy82VjJYRXJFeEN1MVZkSFVKOE1GWTdiRTh2d213RXRoQ0swWjhQ?=
 =?utf-8?B?cktpUzRkTTZWRWhDd2J0SW52d09WZ0g5bEhONnUzRkFUcEpjZFFHNmt2WXUx?=
 =?utf-8?B?clRzdlJyWitaZ0l5NGJnSkxrd1NYT1UwdlAzZkhoVWFZdmxGN2JTRWF1M1py?=
 =?utf-8?B?WVUzRmo0WmNSZE05Yjh1MmtWUXU4QjhTakdsQzkvL3B2bFVkcE9kYlg0dTFi?=
 =?utf-8?B?YVBkdUowMFRLWTVBSTE0TVNSRUUrSEI5YkJuRTh4MWJmWWZLRUhMUUVoZE81?=
 =?utf-8?B?T3BXNzhYdnBBRnBVaUFQZ0JZc2s1TlpwQlhqUldFaUFMeldYSlR6T3NYdlMw?=
 =?utf-8?B?Q253eFVjekVUS2F0UFkrQU1qQ1pIMkJDbUdtVnc4OHVNZ1ZCZnUrTFdRSDg0?=
 =?utf-8?B?Z3BURzNqcStaQ3VybURXYmVvWGRuZURLNXlZdTNITmZ5R2p5b1lVOHdoZFVx?=
 =?utf-8?B?aXpnN3NUdEYrdXJRTUg0QzN3Ynh3dTF4K2VMV2p3OUp0NktmeFRwZjJhblFW?=
 =?utf-8?B?b09lMklldWllODZrcmZTbEo0TkNhZStJWkt3MFNIcG5IczU2Y21PTTBOeHRD?=
 =?utf-8?B?RFVhWnVTY2JreWhCOXU4SEJBRWxlSTE4M2VJVjVUbEN1ZG9FN1o1RUkrV0RV?=
 =?utf-8?B?RWoybUlETThGanloOWJ3ZGU0Q0p5ZVEzcDNoMUMzeDgyK3luTFlVNlBjUUdQ?=
 =?utf-8?B?Y1ZJZlpOUDVPWHp3WElGV0NRZy96ajlCS3hBYW4wYW5qM1F2Z2ZlOVJrbjBE?=
 =?utf-8?B?bTc0VDE2M1pjVFJRSjlDaWNaR1RvaDJ6WC83ZDFLMXI5T1QvZ2RXRnhmbTRv?=
 =?utf-8?B?Z0Vhb3MxektML3RMS1hWaWNpdjhGd1Jkemh4bVMySHZMZzJuYmVqS1RJTGxU?=
 =?utf-8?B?Q2VmNmdIMDFtdVJHOGxPYzMva21ZVUd5VnM3UFMvSkljeGxXZmtpa0FQZ2w5?=
 =?utf-8?B?RUNmUVdFaWxvOGp4aDVGcjFDV1I3Y1JEZFJZUjc1RW45b01PSnRpRU5UTisx?=
 =?utf-8?B?aERwVlVwNlZtUmx5ei9mc1dRSzB6K0JMZVBGeWxBdEl5VkI2a1A2Z3RUNVJ2?=
 =?utf-8?B?K3lVMFpqV0t6WlZjNklnWGkwM2VDZzgrdVorbEN1TDJhZWxSWXNNVnJ5SEF0?=
 =?utf-8?B?d0tmbERWYUo1aVdjajlzaWNQSDUwWjRTRWZ2WTZ5Z3liSXpXcDBFZGdvVHRy?=
 =?utf-8?B?eGpLRDNocWdBSkdHS2FnZ0s3TkhtZHNLTUQzMVVKMjJzSXdURXVJM0JQNi8v?=
 =?utf-8?B?U2pvMzVsV2VCM0ZkaWxTdEoreXZwQklMM0czYjBjYzE2R2hJT01jNS9ibXFv?=
 =?utf-8?B?d2pKcjdOcGVsdjhHK25GRUtkamViak1OVmxSNTkrRGtzWnpMNlB3dGJTK0Fy?=
 =?utf-8?B?NFdUYmlJd3djVjdYTC9BbUdNWlgyeGFhQkM1czZUN1dhVGVRcTB6bzRqdWY0?=
 =?utf-8?B?aEdZejlUYkh5eUZFSjdldGoza3V0SU5OOHlkeWVlYXRtL2Y2N1ljUzlxK2lt?=
 =?utf-8?B?TVhjQkVtdUpFMHlCWEFlT1ZCOTMzMXhtR3lvUHhwNUJ5a1dYVjZ2YmQ2MlFo?=
 =?utf-8?B?cmtxeTZMN1RtU1JuUUNaK3cyeXlnSXYwcy8rQ3BqMUVDaUZ5ZzhtVVJSWThr?=
 =?utf-8?B?Mll5NEZoU0VJTzU5SmFUdjc3UDA1cnBKa3hZMVpUc2dJSEtDaWNWekFjS2E3?=
 =?utf-8?B?UGZUV1ZqclQxWkxnTjg3RGg3eDJSTnFpQ3FZVXZRMm9zTUozZ2RJOTYzaHdF?=
 =?utf-8?B?NXRycmxVbkNYUDl6Um9OVHhkN0phQlNUQUNEc2NsZXdrQnNiRW9oQ3BLZVZT?=
 =?utf-8?B?ZlpWTUl6N1FhRGY3emZ3UFhNMWpPbjVUZmtDMmdFVzhEdWFMNkx6cHQ5VU4r?=
 =?utf-8?Q?GoriAwjHFG8xQyRaN684J8AGY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fbf857e-34e8-451e-85f9-08dceb3cdc64
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2024 04:09:41.0824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vn9jL4ucvHq2xmMXRLQAyT82I9zeIQNvVQN7zuor68dFMfwjAe3ICLdEFULoJzJSyHuiqmgQD7bkc1Y/oi7I1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6768
X-Proofpoint-ORIG-GUID: E-Gl4tVgI-Q4IY3h_2QUQ7AftkwQfviZ
X-Authority-Analysis: v=2.4 cv=d6CnygjE c=1 sm=1 tr=0 ts=670b4808 cx=c_pps a=rPWB9DPlu1VaKM/QD/CSBg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=IToquFxsAAAA:20 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=NEAV23lmAAAA:8 a=kJubvfstYM-9OTd9FwYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: E-Gl4tVgI-Q4IY3h_2QUQ7AftkwQfviZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-13_03,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2410130027
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 49D451di003116
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 04:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112834

ChangeLog:
https://raw.githubusercontent.com/wxWidgets/wxWidgets/v3.2.6/docs/changes=
.txt

* Drop 0001-locale-Avoid-using-glibc-specific-defines-on-musl.patch as
  it has been merged upstream
* Refresh patches
* Add UPSTREAM_CHECK_GITTAGREGEX

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...using-glibc-specific-defines-on-musl.patch | 26 --------------
 ...able-cross-magic-it-does-not-work-fo.patch |  8 ++---
 ...tch =3D> 0002-fix-libdir-for-multilib.patch} | 35 ++++++++++++-------
 ...003-create-links-with-relative-path.patch} | 22 ++++++++----
 ...-not-append-system-name-to-lib-name.patch} | 12 +++++--
 ...5-wx-config-fix-libdir-for-multilib.patch} | 29 +++++++++------
 ...-l.patch =3D> 0006-Fix-locale-on-musl.patch} | 18 ++++++++--
 ...E_LARGEFILE_SUPPORT-to-1-explicitly.patch} |  9 ++---
 ...{wxwidgets_3.2.1.bb =3D> wxwidgets_3.2.6.bb} | 17 ++++-----
 9 files changed, 100 insertions(+), 76 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-loc=
ale-Avoid-using-glibc-specific-defines-on-musl.patch
 rename meta-oe/recipes-extended/wxwidgets/wxwidgets/{fix-libdir-for-mult=
ilib.patch =3D> 0002-fix-libdir-for-multilib.patch} (82%)
 rename meta-oe/recipes-extended/wxwidgets/wxwidgets/{create-links-with-r=
elative-path.patch =3D> 0003-create-links-with-relative-path.patch} (72%)
 rename meta-oe/recipes-extended/wxwidgets/wxwidgets/{not-append-system-n=
ame-to-lib-name.patch =3D> 0004-don-not-append-system-name-to-lib-name.pa=
tch} (73%)
 rename meta-oe/recipes-extended/wxwidgets/wxwidgets/{wx-config-fix-libdi=
r-for-multilib.patch =3D> 0005-wx-config-fix-libdir-for-multilib.patch} (=
74%)
 rename meta-oe/recipes-extended/wxwidgets/wxwidgets/{musl-locale-l.patch=
 =3D> 0006-Fix-locale-on-musl.patch} (70%)
 rename meta-oe/recipes-extended/wxwidgets/wxwidgets/{0001-Set-HAVE_LARGE=
FILE_SUPPORT-to-1-explicitly.patch =3D> 0007-Set-HAVE_LARGEFILE_SUPPORT-t=
o-1-explicitly.patch} (83%)
 rename meta-oe/recipes-extended/wxwidgets/{wxwidgets_3.2.1.bb =3D> wxwid=
gets_3.2.6.bb} (90%)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-locale-Avo=
id-using-glibc-specific-defines-on-musl.patch b/meta-oe/recipes-extended/=
wxwidgets/wxwidgets/0001-locale-Avoid-using-glibc-specific-defines-on-mus=
l.patch
deleted file mode 100644
index 52f444933..000000000
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-locale-Avoid-usin=
g-glibc-specific-defines-on-musl.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 72c3b7324f00047e6dc5d8380ed2f6ff2494a6f9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 18 Dec 2022 14:51:34 -0800
-Subject: [PATCH] locale: Avoid using glibc specific defines on musl
-
-musl does not provide some glibc-only enum members e.g. _NL_ADDRESS_LANG=
_NAME
-
-Upstream-Status: Submitted [https://github.com/wxWidgets/wxWidgets/pull/=
23050]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/unix/uilocale.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/unix/uilocale.cpp b/src/unix/uilocale.cpp
-index 57773e17f5..86816ba896 100644
---- a/src/unix/uilocale.cpp
-+++ b/src/unix/uilocale.cpp
-@@ -619,7 +619,7 @@ wxString
- wxUILocaleImplUnix::GetLocalizedName(wxLocaleName name, wxLocaleForm fo=
rm) const
- {
-     wxString str;
--#if defined(HAVE_LANGINFO_H) && defined(__LINUX__)
-+#if defined(HAVE_LANGINFO_H) && defined(__LINUX__) && defined(__GLIBC__=
)
-     switch (name)
-     {
-         case wxLOCALE_NAME_LOCALE:
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-wx-config.=
in-Disable-cross-magic-it-does-not-work-fo.patch b/meta-oe/recipes-extend=
ed/wxwidgets/wxwidgets/0001-wx-config.in-Disable-cross-magic-it-does-not-=
work-fo.patch
index b3b9e79c5..a3b8d0c0e 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-wx-config.in-Disa=
ble-cross-magic-it-does-not-work-fo.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-wx-config.in-Disa=
ble-cross-magic-it-does-not-work-fo.patch
@@ -1,4 +1,4 @@
-From a071243763f4b06fc7e71f541c49cecf380b6f27 Mon Sep 17 00:00:00 2001
+From 8f582c0ea40ccdb2d439b7614459d752f3606e15 Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
 Date: Sun, 11 Oct 2020 22:16:55 +0200
 Subject: [PATCH] wx-config.in: Disable cross magic - it does not work fo=
r us
@@ -18,10 +18,10 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gma=
il.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/wx-config.in b/wx-config.in
-index d132e3182f..d0d162e8a3 100755
+index 4df8571d28..1173d89685 100755
 --- a/wx-config.in
 +++ b/wx-config.in
-@@ -396,7 +396,7 @@ get_mask()
+@@ -394,7 +394,7 @@ get_mask()
  }
 =20
  # Returns true if this script is for a cross compiled config.
@@ -31,5 +31,5 @@ index d132e3182f..d0d162e8a3 100755
 =20
  # Determine the base directories we require.
 --=20
-2.26.2
+2.25.1
=20
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-=
multilib.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-li=
bdir-for-multilib.patch
similarity index 82%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-m=
ultilib.patch
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-fo=
r-multilib.patch
index ea204ed3b..b599f3887 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-multili=
b.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-mu=
ltilib.patch
@@ -1,12 +1,18 @@
-wxWidgets hardcodes libdir with 'lib' and does not support multilib whic=
h will
-change it. Respect variable wxPLATFORM_LIB_DIR to support libdir be conf=
igurable.
+From 9487fe5cd271a4bee96ab590509ef38f6972887a Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Sat, 12 Oct 2024 18:43:25 +0800
+Subject: [PATCH] fix libdir for multilib
+
+wxWidgets hardcodes libdir with 'lib' and does not support multilib
+which will change it. Respect variable wxPLATFORM_LIB_DIR to support
+libdir be configurable.
=20
 Upstream-Status: Pending
=20
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
=20
-Rebase for wxWidgets 3.2.1. Replace wxPLATFORM_LIB_DIR with LIB_SUFFIX i=
n this
-patch that LIB_SUFFIX has been passed to cmake in cmake.bbclass.
+Rebase for wxWidgets 3.2.1. Replace wxPLATFORM_LIB_DIR with LIB_SUFFIX
+in this patch that LIB_SUFFIX has been passed to cmake in cmake.bbclass.
=20
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
@@ -17,36 +23,36 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  4 files changed, 10 insertions(+), 10 deletions(-)
=20
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a49ecd3883..d469471f38 100644
+index f6ae7f6210..2a13e448db 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -45,7 +45,7 @@ include(build/cmake/policies.cmake NO_POLICY_SCOPE)
  # Initialize variables for quick access to wx root dir in sub dirs
  set(wxSOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
- set(wxBINARY_DIR ${CMAKE_BINARY_DIR})
+ set(wxBINARY_DIR ${CMAKE_CURRENT_BINARY_DIR})
 -set(wxOUTPUT_DIR ${wxBINARY_DIR}/lib)
 +set(wxOUTPUT_DIR ${wxBINARY_DIR}/lib${LIB_SUFFIX})
 =20
  # parse the version number from wx/version.h and include in wxMAJOR_VER=
SION and wxMINOR_VERSION
  file(READ "${wxSOURCE_DIR}/include/wx/version.h" WX_VERSION_H_CONTENTS)
 diff --git a/build/cmake/config.cmake b/build/cmake/config.cmake
-index b359560bc0..c59ea60923 100644
+index addd8d6b81..9ec677534b 100644
 --- a/build/cmake/config.cmake
 +++ b/build/cmake/config.cmake
-@@ -76,7 +76,7 @@ function(wx_write_config_inplace)
+@@ -100,7 +100,7 @@ function(wx_write_config_inplace)
      execute_process(
          COMMAND
          "${CMAKE_COMMAND}" -E ${COPY_CMD}
--        "${CMAKE_CURRENT_BINARY_DIR}/lib/wx/config/inplace-${TOOLCHAIN_=
FULLNAME}"
-+        "${CMAKE_CURRENT_BINARY_DIR}/lib${LIB_SUFFIX}/wx/config/inplace=
-${TOOLCHAIN_FULLNAME}"
-         "${CMAKE_CURRENT_BINARY_DIR}/wx-config"
+-        "${wxBINARY_DIR}/lib/wx/config/inplace-${TOOLCHAIN_FULLNAME}"
++        "${wxBINARY_DIR}/lib${LIB_SUFFIX}/wx/config/inplace-${TOOLCHAIN=
_FULLNAME}"
+         "${wxBINARY_DIR}/wx-config"
          )
  endfunction()
 diff --git a/build/cmake/functions.cmake b/build/cmake/functions.cmake
-index 7182364e5e..55fbebc7ee 100644
+index 72a34f0b4f..81ede7d8ae 100644
 --- a/build/cmake/functions.cmake
 +++ b/build/cmake/functions.cmake
-@@ -435,8 +435,8 @@ macro(wx_add_library name)
+@@ -462,8 +462,8 @@ macro(wx_add_library name)
          endif()
          wx_install(TARGETS ${name}
              EXPORT wxWidgetsTargets
@@ -105,3 +111,6 @@ index 384c6837b8..d3303faabb 100644
  )
 =20
  # uninstall target
+--=20
+2.25.1
+
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/create-links-wi=
th-relative-path.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/000=
3-create-links-with-relative-path.patch
similarity index 72%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets/create-links-wit=
h-relative-path.patch
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets/0003-create-links-=
with-relative-path.patch
index 6eef0b679..dbede0304 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/create-links-with-rela=
tive-path.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0003-create-links-with=
-relative-path.patch
@@ -1,18 +1,23 @@
+From b86806ef34d4c9171165c1533064bf34ad822e20 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Sat, 12 Oct 2024 18:43:25 +0800
+Subject: [PATCH] create links with relative path
+
 It fails to build python3-wxgtk4 which depends on wxwidgets:
=20
 | ERROR: wxwidgets-native-3.2.1-r0 do_populate_sysroot: sstate found an
     absolute path symlink /path/to/build/tmp-glibc/work/x86_64-linux
-	/wxwidgets-native/3.2.1-r0/sysroot-destdir/path/to/build/tmp-glibc/work
-	/x86_64-linux/wxwidgets-native/3.2.1-r0/recipe-sysroot-native/usr/bin/w=
x-config
+    /wxwidgets-native/3.2.1-r0/sysroot-destdir/path/to/build/tmp-glibc/w=
ork
+    /x86_64-linux/wxwidgets-native/3.2.1-r0/recipe-sysroot-native/usr/bi=
n/wx-config
     pointing at /path/to/build/tmp-glibc/work/x86_64-linux/wxwidgets-nat=
ive/3.2.1-r0
-	/recipe-sysroot-native/usr/lib/wx/config/gtk3-unicode-3.2.
+    /recipe-sysroot-native/usr/lib/wx/config/gtk3-unicode-3.2.
   Please replace this with a relative link.
 | ERROR: wxwidgets-native-3.2.1-r0 do_populate_sysroot: sstate found an
     absolute path symlink /path/to/build/tmp-glibc/work/x86_64-linux/wxw=
idgets-native
-	/3.2.1-r0/sysroot-destdir/path/to/build/tmp-glibc/work/x86_64-linux/wxw=
idgets-native
-	/3.2.1-r0/recipe-sysroot-native/usr/bin/wxrc pointing at /path/to/build=
/tmp-glibc
-	/work/x86_64-linux/wxwidgets-native/3.2.1-r0/recipe-sysroot-native/usr/=
bin/wxrc-3.2.
-  Please replace this with a relative link.
+    /3.2.1-r0/sysroot-destdir/path/to/build/tmp-glibc/work/x86_64-linux/=
wxwidgets-native
+    /3.2.1-r0/recipe-sysroot-native/usr/bin/wxrc pointing at /path/to/bu=
ild/tmp-glibc
+    /work/x86_64-linux/wxwidgets-native/3.2.1-r0/recipe-sysroot-native/u=
sr/bin/wxrc-3.2.
+   Please replace this with a relative link.
=20
 Create symlink with relative path to fix the issues.
=20
@@ -50,3 +55,6 @@ index dbed8cc9b3..1dbc3261d3 100644
              \"\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/wxrc${EXE_SUFFI=
X}\" \
              )"
          )
+--=20
+2.25.1
+
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/not-append-syst=
em-name-to-lib-name.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/=
0004-don-not-append-system-name-to-lib-name.patch
similarity index 73%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets/not-append-syste=
m-name-to-lib-name.patch
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets/0004-don-not-appen=
d-system-name-to-lib-name.patch
index 6329256b0..e3463ba17 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/not-append-system-name=
-to-lib-name.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0004-don-not-append-sy=
stem-name-to-lib-name.patch
@@ -1,3 +1,8 @@
+From 5e9725c1151e2b029066d61ef5dccf1f3e6cb323 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Sat, 12 Oct 2024 18:43:25 +0800
+Subject: [PATCH] don not append system name to lib name
+
 It appends system name to library names for cross compile. For example, =
the
 library name is libwx_baseu-3.1-Linux.so rather than libwx_baseu-3.1.so.=
 It is
 not appropriate for oe.
@@ -14,10 +19,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/build/cmake/functions.cmake b/build/cmake/functions.cmake
-index e374d9a273..c6b1908bd6 100644
+index 81ede7d8ae..23eebeb914 100644
 --- a/build/cmake/functions.cmake
 +++ b/build/cmake/functions.cmake
-@@ -219,9 +219,9 @@ function(wx_set_target_properties target_name)
+@@ -243,9 +243,9 @@ function(wx_set_target_properties target_name)
      endif()
 =20
      set(cross_target)
@@ -30,3 +35,6 @@ index e374d9a273..c6b1908bd6 100644
 =20
      set(lib_prefix "lib")
      if(MSVC OR (WIN32 AND wxBUILD_SHARED))
+--=20
+2.25.1
+
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/wx-config-fix-l=
ibdir-for-multilib.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0=
005-wx-config-fix-libdir-for-multilib.patch
similarity index 74%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets/wx-config-fix-li=
bdir-for-multilib.patch
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets/0005-wx-config-fix=
-libdir-for-multilib.patch
index 628f8dee5..b650c5038 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/wx-config-fix-libdir-f=
or-multilib.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0005-wx-config-fix-lib=
dir-for-multilib.patch
@@ -1,8 +1,14 @@
-It sets 'libdir' with path element 'lib' directly which is not suitable =
for
-multilib. Add an option '--baselib' for wx-config to support multilib wh=
en
-cross compile. And set default value of baselib with "lib${wxPLATFORM_LI=
B_DIR}".
+From 4230cd84f156f9eb5c9b80ffbc69dd55fa7c7ca7 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Sat, 12 Oct 2024 18:43:25 +0800
+Subject: [PATCH] wx-config: fix libdir for multilib
=20
-Upstream-Status: Pending [oe specific]
+It sets 'libdir' with path element 'lib' directly which is not suitable
+for multilib. Add an option '--baselib' for wx-config to support
+multilib when cross compile. And set default value of baselib with
+"lib${wxPLATFORM_LIB_DIR}".
+
+Upstream-Status: Inappropriate [oe specific]
=20
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
=20
@@ -15,10 +21,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  2 files changed, 5 insertions(+), 3 deletions(-)
=20
 diff --git a/build/cmake/config.cmake b/build/cmake/config.cmake
-index 52ae69d3f6..28aa733eb0 100644
+index 9ec677534b..ee61cf7572 100644
 --- a/build/cmake/config.cmake
 +++ b/build/cmake/config.cmake
-@@ -86,7 +86,7 @@ function(wx_write_config)
+@@ -110,7 +110,7 @@ function(wx_write_config)
      set(prefix ${CMAKE_INSTALL_PREFIX})
      set(exec_prefix "\${prefix}")
      set(includedir "\${prefix}/include")
@@ -26,9 +32,9 @@ index 52ae69d3f6..28aa733eb0 100644
 +    set(libdir "\${exec_prefix}/\${baselib}")
      set(bindir "\${exec_prefix}/bin")
 =20
-     find_program(EGREP egrep)
+     if(wxBUILD_MONOLITHIC)
 diff --git a/wx-config.in b/wx-config.in
-index e3f7d115bb..0e78af03c7 100755
+index 1173d89685..8364a33e9d 100755
 --- a/wx-config.in
 +++ b/wx-config.in
 @@ -42,7 +42,8 @@ usage()
@@ -41,7 +47,7 @@ index e3f7d115bb..0e78af03c7 100755
             [--list] [--selected-config] [--host=3DHOST] [--toolkit=3DTO=
OLKIT]
             [--universal[=3Dyes|no]] [--unicode[=3Dyes|no]] [--static[=3D=
yes|no]]
             [--debug[=3Dyes|no]] [--version[=3DVERSION]] [--flavour=3DFL=
AVOUR]
-@@ -137,7 +138,7 @@ wxconfig_output_options=3D"prefix exec_prefix
+@@ -133,7 +134,7 @@ wxconfig_output_options=3D"prefix exec_prefix
 =20
  # Options that permit the user to supply hints that may affect the outp=
ut.
  # These options all accept arbitrary values, to interpret as they pleas=
e.
@@ -50,7 +56,7 @@ index e3f7d115bb..0e78af03c7 100755
 =20
  # Input options that accept only a yes or no argument.
  #
-@@ -404,6 +405,7 @@ is_cross()  { [ "x@cross_compiling@" =3D "xyes" ]; }
+@@ -400,6 +401,7 @@ is_cross()  { [ "xno" =3D "xyes" ]; }
  # Determine the base directories we require.
  prefix=3D${input_option_prefix-${this_prefix:-@prefix@}}
  exec_prefix=3D${input_option_exec_prefix-${input_option_prefix-${this_e=
xec_prefix:-@exec_prefix@}}}
@@ -58,3 +64,6 @@ index e3f7d115bb..0e78af03c7 100755
  wxconfdir=3D"@libdir@/wx/config"
 =20
  installed_configs=3D`cd "$wxconfdir" 2> /dev/null && ls | grep -v "^inp=
lace-"`
+--=20
+2.25.1
+
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/musl-locale-l.p=
atch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0006-Fix-locale-on-mu=
sl.patch
similarity index 70%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets/musl-locale-l.pa=
tch
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets/0006-Fix-locale-on=
-musl.patch
index e4ca6579f..37d61dcb3 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/musl-locale-l.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0006-Fix-locale-on-mus=
l.patch
@@ -1,8 +1,19 @@
-Upstream-Status: Pending
+From 64d5d7f68cde208c6f8a5e0b71da93f98e4720f7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 12 Oct 2024 20:30:16 +0800
+Subject: [PATCH] Fix locale on musl
=20
 these macro'd away functions don't exist in musl (yet)
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/wx/xlocale.h | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
 diff --git a/include/wx/xlocale.h b/include/wx/xlocale.h
-index c433d25..3ab9d84 100644
+index c433d25d05..794cf0b66b 100644
 --- a/include/wx/xlocale.h
 +++ b/include/wx/xlocale.h
 @@ -33,6 +33,26 @@
@@ -32,3 +43,6 @@ index c433d25..3ab9d84 100644
  // The platform-specific locale type
  // If wxXLocale_t is not defined, then only "C" locale support is provi=
ded
  #ifdef wxHAS_XLOCALE_SUPPORT
+--=20
+2.25.1
+
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-Set-HAVE_L=
ARGEFILE_SUPPORT-to-1-explicitly.patch b/meta-oe/recipes-extended/wxwidge=
ts/wxwidgets/0007-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch
similarity index 83%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-Set-HAVE_LA=
RGEFILE_SUPPORT-to-1-explicitly.patch
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets/0007-Set-HAVE_LARG=
EFILE_SUPPORT-to-1-explicitly.patch
index 5160f2e1f..ef94e3551 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-Set-HAVE_LARGEFIL=
E_SUPPORT-to-1-explicitly.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0007-Set-HAVE_LARGEFIL=
E_SUPPORT-to-1-explicitly.patch
@@ -1,4 +1,4 @@
-From e108aff9d6dae613f486c1b1681f4a3cdf17b845 Mon Sep 17 00:00:00 2001
+From 22f70d5bd039b20bfdad522341412ca001c639db Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 19 Dec 2022 15:07:55 -0800
 Subject: [PATCH] Set HAVE_LARGEFILE_SUPPORT to 1 explicitly
@@ -6,16 +6,17 @@ Subject: [PATCH] Set HAVE_LARGEFILE_SUPPORT to 1 explic=
itly
 nothing sets this to 0, but for some reason it gets undef'd
=20
 Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  build/cmake/setup.h.in | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
=20
 diff --git a/build/cmake/setup.h.in b/build/cmake/setup.h.in
-index bce33a73f3..22afb4cfa0 100644
+index fcc282980d..767adbf658 100644
 --- a/build/cmake/setup.h.in
 +++ b/build/cmake/setup.h.in
-@@ -869,8 +869,7 @@
+@@ -867,8 +867,7 @@
  /*
   * Define if large (64 bit file offsets) files are supported.
   */
@@ -26,5 +27,5 @@ index bce33a73f3..22afb4cfa0 100644
   * Use OpenGL
   */
 --=20
-2.39.0
+2.25.1
=20
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb b/meta=
-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
similarity index 90%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
index 91653e285..2ddda142e 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
@@ -20,17 +20,18 @@ DEPENDS +=3D " \
=20
 SRC_URI =3D "gitsm://github.com/wxWidgets/wxWidgets.git;branch=3D3.2;pro=
tocol=3Dhttps \
            file://0001-wx-config.in-Disable-cross-magic-it-does-not-work=
-fo.patch \
-           file://fix-libdir-for-multilib.patch \
-           file://create-links-with-relative-path.patch \
-           file://not-append-system-name-to-lib-name.patch \
-           file://wx-config-fix-libdir-for-multilib.patch \
-           file://0001-locale-Avoid-using-glibc-specific-defines-on-musl=
.patch \
-           file://musl-locale-l.patch \
-           file://0001-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch =
\
+           file://0002-fix-libdir-for-multilib.patch \
+           file://0003-create-links-with-relative-path.patch \
+           file://0004-don-not-append-system-name-to-lib-name.patch \
+           file://0005-wx-config-fix-libdir-for-multilib.patch \
+           file://0006-Fix-locale-on-musl.patch \
+           file://0007-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch =
\
            "
-SRCREV=3D "97e99707c5d2271a70cb686720b48dbf34ced496"
+SRCREV=3D "5ff25322553c1870cf20a2e1ba6f20ed50d9fe9a"
 S =3D "${WORKDIR}/git"
=20
+UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
+
 # These can be either 'builtin' or 'sys' and builtin means cloned soures=
 are
 # build. So these cannot be PACKAGECONFIGs and let's use libs where we c=
an (see
 # DEPENDS)
--=20
2.25.1


