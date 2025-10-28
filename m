Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D4DCCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 14:47:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10757.1761662833040644421
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 07:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GKnfwETp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3396a95da7=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SA2CIC058167
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 14:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=MFcY7FRSiFnq5l13U6kK
	fjSDLs6JLkfi+qRQC5EhX7w=; b=GKnfwETp9FJ+Cc+1i7d5lEqrHEvYW2Jk9pGt
	MrUofW2PuPjiEoIX12jpNGMlhNjn+KxQiOTvwYnZMQppG2vR/Hzx6OcrsIvbwEGi
	E3CznccmQYuIrR8dMNYN5DwbWMqkdvQeZTaOYguzmAbTc4Az+CJZrB6e8aaP6MVR
	GcMCzXMg2ZVOM4vC6kFYXs3HHP1JgDnOjIedtygkYatpQ6APnlkv3m83LdANYxQ2
	E88uGG0K8ZPiElBbhpMg/OwB3iEPovVr1X2yo/YphKTYF1yRbxZ66jUNcv9F5bDr
	K76h+MwUfhbeEy/mhVmNkPAOqIzdzbEWqZR7RGSrgGMoeKKnnQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012038.outbound.protection.outlook.com [52.101.43.38])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0nh5uams-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 14:46:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Og6igvekurndOTvcCF94TW22tEFfANwUq/pDUzDCCFE0WPOkgT4O99B0xWSHpPsdItVI3UZBzWNQ1HBnFrIwkrctkTDHDlsF2TT6kGDJ8p7v6x76zIpcPDVLtRdz7/QxV5oN0hwQtsJLZfdqp35y+vCh8NcyUt5p9knF8dR6LZPPSEnnPRO5pX3L25SvPNVouPx0axEuxgZnnWZH71ly+M65dQfpLC5679ougPEPaNfMNDKduy8jZdIKJVBymnpDAU+h/an0LT4ENoro3k3V89Zdq0xIDSsbPi0E5MLSAxXq9Fi3+aej8ct9s/ttTt7ogFgu/rhRJPWDuT3tVOwTaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFcY7FRSiFnq5l13U6kKfjSDLs6JLkfi+qRQC5EhX7w=;
 b=OyzfC0JAt5j6RhwWYIG+RGomk8Mkq9WMfYQVSRobfXNccND9gbLFy/nMZxFdxeVVfRyTzDK4BqNKBqwp0zhYhNzyowvKLKvSFGbvj8WeiM67pclDQpmIZYZFF4WecuDLDebVNdGVHVmQS+S1nOYsn4WgCjuIkOVCOJIO/QY9tyLeY9SCCgtKGAOIPZNww0TYY2gfmQ/Ay8i0F43Dji7VvCj/PoQp7+RldndmiYBmYQfLr1UWzpQW00A35sTatwkV3XqqoXq4LAc/pYC0GVM+pxG0nfpo0jVXw1RVqqhei+4T6bjEsRMtwPwwMqjMJoGj/suVoq9XrU8krG5+Is6a7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ1PR11MB6227.namprd11.prod.outlook.com (2603:10b6:a03:45a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 14:46:45 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 14:46:45 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] postfix: upgrade 3.10.1 -> 3.10.5
Date: Tue, 28 Oct 2025 22:46:31 +0800
Message-Id: <20251028144631.1221737-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0020.jpnprd01.prod.outlook.com (2603:1096:405::32)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ1PR11MB6227:EE_
X-MS-Office365-Filtering-Correlation-Id: 9854f129-e2a7-420b-af9f-08de1630d10e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2EP6id2LPWckgTzCKmKGDhdYFdAD9+3ER7pAWh3096hd9WTie12m5YHEhzER?=
 =?us-ascii?Q?Enpfn66eRJ7V8/V7yx6801hz4KxNy+Es0EeulZfvJnoZlyuPtn2zo3LL5r78?=
 =?us-ascii?Q?T/xtI7rZTXxpefbk5PITVrieR/zOQyhrUy+azumXhQO7xfbdEYx1fPZ32dBI?=
 =?us-ascii?Q?8M911nhcqqvR7/KiBkAqrRARXeZehfsUUuC7LNYK0ohbaiQV0lb1rP7ERJsU?=
 =?us-ascii?Q?ujylYwycnLTJQ62xXVTZ90+GPjfcJ02dlRqbO/Df4phpdnqOP0Q5FkrMXJrU?=
 =?us-ascii?Q?2D3oAp7Iglqv54Pg5uefi+AGXt3Zn652WAAjQNFp7vUIIwtAVHBR288/O6/K?=
 =?us-ascii?Q?0TGFGUm37or7stv/GzuJTpcPsAgEG0xbTe4N9Zm3K7voQRPAHwLGbvGoFxx7?=
 =?us-ascii?Q?IUfRdMxazaW31yWICzT8ByuCV0LOFs2Sm97+n05L4Z9BO+e5TcGAlfIJ+CYV?=
 =?us-ascii?Q?tPWnVqhoC6Sqozlz4xx858i2L21qMD1+Vgh2UTuH/6OmvAydGjv9OXMaofkP?=
 =?us-ascii?Q?HBh2hhNcnoR6C6fhAjInMdjIFSEAKOvVV4VYo/XSNmQd+Ij2O5i0mAwYqRDE?=
 =?us-ascii?Q?/nmm8tEzkHH8Y8hKcd0Z7x4ALI36Dfg6iKnKXC+P1LDjsiI7+a5HqJJ0PzmR?=
 =?us-ascii?Q?nY/4a0B8Q5NJ66m5cfHFhLog7SgjHrF8gKzeNNJOGo/PRmVf25qFkdkKCSf5?=
 =?us-ascii?Q?QS4J9FzsfLirfoafDRcvRWcIFFrm+r7lmg3vsilpEogf5HfJRhzLadiXlIPC?=
 =?us-ascii?Q?vUCYWZHykzcMSgyWW25DOJajHwZN2y8Lxn2piVO1UBhNBIedvb2GbG9QfjYJ?=
 =?us-ascii?Q?qi3Y/O+BXw0Azcu23UCUR/BUpGMJTgM0sChuKHAaMWUkFvsXdsHkqoazi88/?=
 =?us-ascii?Q?SveDThwfHmvPb2UOcVMpBRniIA+fyCiSmuI01EkRSAv2JvwDv+bHAFbenvpp?=
 =?us-ascii?Q?NDhovJg3GeFFSpD9k6wXsuf09Jbzc8Ft4hFqDEUJqgA15c6yfGnTRKC/eHQ/?=
 =?us-ascii?Q?FcTy4Lp1rSruLFoPxjHpCLeN9y2LAGBz0aCw4QakKUtHRxgbI5vAupjE8gTl?=
 =?us-ascii?Q?tdtO1UdnymIYCkDPNLfaAqGD2GCY40Ea3aX/opIe0FnkodeMeGfkm2qExezt?=
 =?us-ascii?Q?hvSk5jrqvDeTvVIOZPxpIIeS1UmX4aPYr/e/K2zUES3O1126ulqU1Uqw7EM3?=
 =?us-ascii?Q?DyaxNZAKff4RnI0sk78MGxtDtEnRrEhopp6Qr5JqGQGHY59tHPQQnD1SCXD6?=
 =?us-ascii?Q?Ga+4DRzvm4SSQUIXhu+lgWJGc1+K7a9nibVYZfMNVoW2QsIBkkFWMJPspu4X?=
 =?us-ascii?Q?VdQeJtbmWaaX19fzsPX/NjCLTFrx6lSZ7VznJuXTZMXJH5em86Aln0kGymQm?=
 =?us-ascii?Q?SllbTSUb25thSFXCr9qr9s4hacog9EqIfiUTSkS3Vfp6JRZNr8m7viCa44qF?=
 =?us-ascii?Q?PtvBetFyTy/kUaieF8IntF2fK8KZtZzqYLYyJF110ZHe+Hr3GkcTzw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BTwayMK967l3IV+vU1K9T6YHzjdZq7Ha4zpz5Qhpl86j4HaQViu6wAT9/GWq?=
 =?us-ascii?Q?yVsxA2S5aq46B4at29e9gj4E51zxFYXSzmYVVmiVajiIOHyIoto1uqTKydh2?=
 =?us-ascii?Q?CqgW7UihIZ4qpQJZYmbrh6ga0toZL3oy8IBBkQ2qlQ6w15k9Sy1e/CoC6eS9?=
 =?us-ascii?Q?7SBEBvfCDnbHx1meyeqFzKrewguHiiAeBtcgSsxHZ0WCbXHGZvggyw0+VgDR?=
 =?us-ascii?Q?hp9P7z32y3HJjr0hly0krfZPztxLaCmUcco8P+ccuVAPnyI+DXhjsEfy6u4z?=
 =?us-ascii?Q?XR0UnNFMF9IcVEC0+U5mlsBNn7EIn5oBQz1F0rPBVX4J9T03lDivWI8CGZZl?=
 =?us-ascii?Q?e1wuVUbVcEG/r0zk7Va3nY3M587lanIRHRYjwLH1QA8kQfWzUZkuAudz2LVW?=
 =?us-ascii?Q?bZOxPaHFQLkU9ayxgvjSacy98tNMHbYTECoMbFPChDGbWL8gO0PDgnYdIIwo?=
 =?us-ascii?Q?JImcUaIj6OD+Ow8IWIWSbNUkHp1Iy21LV0GKbJrTvUvz5pIMmtLeQiNljUFm?=
 =?us-ascii?Q?hudzczUbKN3BHGMpsW0aL9+P1Jvxjf1ZU5z6aTvQrELO1oTF4z0rOS4hp16B?=
 =?us-ascii?Q?i29bU2eEY/N+8CZ1y1Kw0kyWIb7sgp9KnmRH3Mdfd8N5yeUP3kz8Z8zBDIRp?=
 =?us-ascii?Q?6fu9J/7foFYaJ6NAoTD3f92GFrEfTgJXqfNMoioaoHYTSN0WPVC1u6BC4y1O?=
 =?us-ascii?Q?+2TP/zkjLR8FubMmdLqrIxy2SuGVjmKKiY+SUemyycFp5Nswb4rorl2j0J2w?=
 =?us-ascii?Q?W+RJSFbCaoz+OIGTye2IuBmX1Lmiu5+v4q9Lek38FNtH4ujai5JPW3SIcRKK?=
 =?us-ascii?Q?L5pXX5IBpLFLDNX8Qyre047Akdm063ENhTK8M+CvMD8rYzAFXfD2Ydcs+yFI?=
 =?us-ascii?Q?YN8MiLMZART2FjwRzSOgYVmm1XOdVlJ5RWQyAjiMT5Pu3BUv4j+vHRT5k8LG?=
 =?us-ascii?Q?usfxv/DAGMhV55X+JiAmKwT9LwRzdlg94z7GCxA00ufwxCUBHwCHZBKYg7oV?=
 =?us-ascii?Q?+9SB4deOXLscuP00OaHjOCI3AdJ4GMe1ypvCvfrVqmnvz/qDb2hDbS8vziJc?=
 =?us-ascii?Q?iYI32YPkpnGOonIgNEFXmOLt8hQOCUB3Q7hMDr3FaOvYSqUkie/F5712ymsm?=
 =?us-ascii?Q?Ka3hvYIyDHrRH3/Wbgu0/m6kbkbNS6dK74wMxxkg3+qRdYjj7A6XhsgqfjHb?=
 =?us-ascii?Q?iJdTq3Rx+5K/KG02TfSea76nOUczgmJkkirvo/yuumb8FMwNw62oWcMHYT1h?=
 =?us-ascii?Q?xRz+Zlpd3HwZpRzUwE2Ij3AdY/iUuBR/kgku4y/CnW+v8j7UCoA3uY6Fc1ss?=
 =?us-ascii?Q?QVt6DEF7Io6aEvjEjsI1KIcQ5US5ARm+Zwp+cmmoB+aUOBPtpTBAzTdgWjvt?=
 =?us-ascii?Q?j4PsVmw1hUesPgsfUCBHE80pu9C8ymVKPdcRRJ/ZSx7ISYV7kbzWK1OZsx4d?=
 =?us-ascii?Q?J4HXGHyCuMPvWC6j9MAmlXfazjjE0tlRC4jDiZ4jhgqCOWFPNrb8AldD79DF?=
 =?us-ascii?Q?g6Tp3skO4H3GartsmcPwkVtsajuHMFTUCttl3nmcC8WmWO6nNUF4vsZcyy/h?=
 =?us-ascii?Q?ubMhAsjFsR4mBBS1EsTYmkk3mUE9rIzV2Kdq7Rl/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9854f129-e2a7-420b-af9f-08de1630d10e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 14:46:45.7408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ejOOlSUKknwddNDDvkZJ+oUfhZOaCCeyW131dHAsRF5c7YRS9Kxkh6rNcugxZ6N31+LVIvtHmr2Nz055AEUTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6227
X-Proofpoint-GUID: W6wvVl-sZCo5IbB1dyjH_KzskpGULqfy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDEyNCBTYWx0ZWRfX7KtFqFin7siM
 DpBzRNoMceX9n8PV95pd5b9upMiFLbd93A0KSrHynl/9LqlurDjBG76SQcJd/4S2EAG2GJZJ/X9
 Gb4/3a5j/nX6jmN9QPlG377/CNpO8RmeKN58pdZhKEEewBq7oxkdeosKgvNqKm8Lxomza83NN9E
 lWxo87jL7rlktl9HZBor9Am+4gSXDXWL8ykmw5jPQN2gr3Ma9EjEpim8+uQuyA9yYz58FHBXa1P
 2sWJjDyWuk3UBeZZ2/0yLa6+g+lSttDuVm02CptR6+I1w69+CS29hZ0V92HQgF8jKdCM6znsD2r
 1STb4FbQeh4FWCmF4y/oNTQP0cChE9xY1Kg+6DcAlKyJNgk833ft23W1JiXaYYdKFHPZFpHKeTD
 afqst0s1X0sSFzxbphOz9Lf9CIzaXw==
X-Authority-Analysis: v=2.4 cv=FOoWBuos c=1 sm=1 tr=0 ts=6900d759 cx=c_pps
 a=MTA8SzjkfSP6DqtUeP+PaQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gmDo1nssAAAA:8 a=e1GkridNAAAA:8 a=t7CeM3EgAAAA:8 a=Zm0DuRDv5t9iF3XKuP4A:9
 a=WGAcqyweuiUA:10 a=HzMXIw9vF_kA:10 a=JJlgKMWLszAA:10 a=cvYGM6TDMKAA:10
 a=DmCNEmdWNTAeIjfGWauO:22 a=6ft9yNkZjdd813gQxDxM:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: W6wvVl-sZCo5IbB1dyjH_KzskpGULqfy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280124
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 14:47:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121092

ChangeLog:
http://www.postfix.org/announcements/postfix-3.10.2.html
http://www.postfix.org/announcements/postfix-3.10.3.html
http://www.postfix.org/announcements/postfix-3.10.4.html
http://www.postfix.org/announcements/postfix-3.10.5.html

Drop 0006-postfix-add-preliminary-setting.patch as the issue has been
fixed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...0006-postfix-add-preliminary-setting.patch | 31 -------------------
 .../{postfix_3.10.1.bb => postfix_3.10.5.bb}  |  3 +-
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/postfix/files/0006-postfix-add-preliminary-setting.patch
 rename meta-networking/recipes-daemons/postfix/{postfix_3.10.1.bb => postfix_3.10.5.bb} (98%)

diff --git a/meta-networking/recipes-daemons/postfix/files/0006-postfix-add-preliminary-setting.patch b/meta-networking/recipes-daemons/postfix/files/0006-postfix-add-preliminary-setting.patch
deleted file mode 100644
index 62b3cf0c05..0000000000
--- a/meta-networking/recipes-daemons/postfix/files/0006-postfix-add-preliminary-setting.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From a5863e19d298789328e11057c469636aa8775847 Mon Sep 17 00:00:00 2001
-From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
-Date: Wed, 2 Jul 2025 10:55:53 +0800
-Subject: [PATCH] postfix: add preliminary setting
-
-post-install call postconf commands to modify main.cf. When multiple
-parameters to postconf, the order of those parameters in main.cf is random.
-Then it will reproduce random results in rootfs file(sample-main.cf). To
-fix this, add preliminary setting in main.cf.
-
-Upstream-Status: Inappropriate [this is the use of post-install,
-upstream is not affected]
-
-Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
----
- conf/main.cf | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/conf/main.cf b/conf/main.cf
-index 1d2c8c2..50398ba 100644
---- a/conf/main.cf
-+++ b/conf/main.cf
-@@ -683,3 +683,5 @@ sample_directory =
- #
- readme_directory =
- inet_protocols = ipv4
-+shlib_directory =
-+meta_directory =
--- 
-2.34.1
-
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb b/meta-networking/recipes-daemons/postfix/postfix_3.10.5.bb
similarity index 98%
rename from meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.10.5.bb
index 444bee0668..edcdc1a8ca 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.10.5.bb
@@ -26,10 +26,9 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
            file://0004-Fix-icu-config.patch \
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
-           file://0006-postfix-add-preliminary-setting.patch \
            "
 
-SRC_URI[sha256sum] = "75868db7a8ed252cd3a14c13a3ce383ddd42563160c02027d061202ee36799bf"
+SRC_URI[sha256sum] = "6a926bf702173861b08e49bcb51fca3a2f269f9a337f72ef159bf46052087e35"
 
 UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.10(\.\d+)+).tar.gz"
 
-- 
2.34.1


