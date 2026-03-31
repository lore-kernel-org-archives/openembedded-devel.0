Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0206A109B467
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 13:10:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19984.1774962650622429776
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2026 06:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UssyfFH/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8550dd076a=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V5uDJH2898929
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 06:10:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=JmmNVvA4YY7zK+k/Rzpj
	7wxJ3jhkLmdHikPTk8gCHWQ=; b=UssyfFH/rUGnxFDN9Ab9uz88I1JFvkmfPz3D
	8WECxhYroVhg4PYch+1uxCLw1/QtTwfvc8gKphuBCmdfA3IttVluQ3s9HY6xf5ar
	1Bz/LXuwVRUZc9TGVXuySO3lxuSWTAjKYilge3vs87zeEG83SEFn84qza5cpkQlw
	Xj8mKwrtoiNkJF/Wbrj0Z9z8j84LGHnZbVezyMgPnr4K95dE93k1l7OvLPpv5iE4
	QJgQtqGCIItZmIgDvmfYElBNuVs3vKlo8j5iQSxqZNIc2gT5q2osujEp0i2Irv/y
	Q0o2xhqt+golcDvY3kdawIQ2FXQjxpMHAjlxhlPO9mN7W1qUgA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011042.outbound.protection.outlook.com [40.93.194.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d6egbua0b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 06:10:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gjzc7UvoNxuJssn72fg9au4FBIGaIIzwzuUTmURvj3uFtlA4jFho4Qf/gzHAvWO08doHSGWXt0ev5lK2pf9QzWEYLPUpH8gfuZWfA1vZpCC/zo0Y3gfK6fWevnxoVRBWNzkj0u2UGXBvu5wS4SJlUuU5TK3U2ZPFGVd2aqREB9j6ONSpGXBIWHJ3eV50uxn7N6T9X2hoaXLOKphsvf4WnY+NTAQMUSek21q344KRcg4nxVqj2MauKaYotVKUZMBDCtMt7zZ4ZQ7zFbUSjA6biUjchwxydDQY8GgERPVmDUJB503irA/d05MDlm2GV/CdQ0MSe19eI9NZRCMk9e5QLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmmNVvA4YY7zK+k/Rzpj7wxJ3jhkLmdHikPTk8gCHWQ=;
 b=f2d7jU6NS5+4aCxDMxT4CJ00jvVUqkwqNybez+Ca3VZc3nwk1nUsaYZ1NLquQyjPa0HqdELqeAYSjyjmGmepEOKr3YuxZqQS5uAc/5OsnqselcXVVqMkGh42dvXPBA3f81ZFrFhjs5JexPexV65NZhjO6olO2HCD3Wl1Nq+dwfOpy0fx1PWS1fUJSWaUkbwFpVvh7vuPn+K5vtfgWZpYD9KwAhxPd3sdYRDcwOZ0TfYnw4JxOw1rhPLjCRtnW+CrvgTdg+10kOMpDT5MsO6TxqO8i81JgWr5EpINwqrGLCh6aSXYKBRgFz6hKsa1LgZO8rCeW99yhvZcDY0/t4XmPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MN6PR11MB8104.namprd11.prod.outlook.com (2603:10b6:208:46c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 13:10:45 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 13:10:45 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] tftp-hpa: upgrade 5.2 -> 5.3
Date: Tue, 31 Mar 2026 21:10:29 +0800
Message-Id: <20260331131029.2702015-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0036.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::18) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MN6PR11MB8104:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c49409e-32d3-438a-3f43-08de8f26eb25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	cVSY8MpfhbjPE1JdkFhH/hksKkF6sGmotk7JCQRQrGHc60YwRk+Df12DfSkDlIiRwJmRKwYw6ufLiAYZyvKUNLYW38evwD2N+LvqTRjN4omu6+xAGn5GPE0QMfZkih837c3pf8iii6nnkp39f+/N2ObOhJO5tGvxbzXwztzpGHZtuVEltt+jrilq+52Wx1+3Goa3MaJsv6DaSya8/qWalXhSZoFtW+QL7i/ac9J7vOFphIQ2xWFrEjgQwQvGoEtNLRIaDHoa4UkvjkF7/zfHnUuzzj/zDR9drV9cJeJkaPWTz9/wt5lWZY273aISUDT7UJ5gjsj2/VEut7G3QPJISGSoLLRRQfKx+myi6HErgIS881zQc0+4Oz1s+XbONZrYIVqxudpvLG0sBwq9fUGxz1Sm8KNEek4YRYrKMIcX3POtYxbwrEzrJKp9MDgRfpa2Rl9rVW4W0NYeBMwbb3dvdb5mVDfKtk3ysHYNTKh9LTH+Lv3dNKgp6JDNMO+5NNy6axQkHKewmsHYsttRWJ+NQ4AWWVBijWYhi8YLiEkyGpb4ns5LTh5unF0CCta23usoMiHU+VhRDpjdOL1MHVQb8JycAZIxGlKGBR3D3UHQrU/hLflJ5XU4OPyqecKcz22js1xpqJqopWDW9AHuHQg/W6b3MXnN9YG1DWRYa0PECNF/RoXn+DnOKEECVeaJ0BpW9sZy9YPNbN7hNWmpJ17nR3zExOOsfp6mAfw7lE+z0Ovvg6Mg++WPOJk1oY0MPcT+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zIqFfy22mQ+/tQDejFJhhggq2vqakYCqqUMxIFLcGCa2QnkU+JPKGWH3Nleu?=
 =?us-ascii?Q?F1vVyKJ/MWpsfFlTfez4Kglu4IcK7ePnu3ARsdFUYB1l8xjSlR6Hbg26p8f+?=
 =?us-ascii?Q?4v7L275H5neLroxyyURZUdkUOijI8oGm8px1EhTbhUemih8wvVuQTdwAW3xB?=
 =?us-ascii?Q?daTFOk9bprFlNbdXs6Ywx8XFTCm708Kf7hpz5y0Lu8dY5WcnEW4MhIhB8nm5?=
 =?us-ascii?Q?TVd13cDm/XqLWBuo6DTj1yB7ngrOthdhBGPdJrndR1/EoEyDWjSy8KXgbQL8?=
 =?us-ascii?Q?HcX8Nb2qGXekT6OQBXw57aMSCnMcWeQkRsbTpxG6y4n+t3Bw28S83ithcuQc?=
 =?us-ascii?Q?Lg3bvkp77joQ7AO9O6PC22hCi60S9KeERreoTedga15b1kIOA3l8MZd3VvXW?=
 =?us-ascii?Q?OB5kx9DosIMHNbp93yfDEom9yHIIZVUzrlq+tjtgz3zklDbyYAowN/TowJqg?=
 =?us-ascii?Q?oz4mLD7WjhY3N1qh4o9YW9aCktK5raU/3ps59gncDW0aGYGF8orw5gCWrtFL?=
 =?us-ascii?Q?0wuvVC/oGgoCyFyceXGEVfHYQIOjuekBHZktuNfEnkWqfvArvAQDbhOBpv0a?=
 =?us-ascii?Q?a5LfzgwV3wcZ5UHxthnHjKVXh5x9HSokbUZWOCQj8Q1dNOitOwUuHxMo8dGv?=
 =?us-ascii?Q?ZE3YS4VKUASuBLVwCJ5CMwxcPpSLfWJgmTQK8YLmWW89im0X2pjUgvkwo7hY?=
 =?us-ascii?Q?zWOybrkFPN3UJATjeFkZWbbPnGJ2EE0b8nQ/H5MHoE3PlBUj3ij7qbOMugHe?=
 =?us-ascii?Q?5BEjnltaeiWRyCvTaHwKEjEJGYvNkl9PlBskOztIsqgtJxMP+/scID0pIw37?=
 =?us-ascii?Q?GuRQjC0VwEkn0Sf3INfLOKtD6DwkVgDZoLFRwzQVE8wMUzu2yJjbL3/4fxAR?=
 =?us-ascii?Q?+NAUwi9Ud2MT0Wi8NuyswpsuKszz84csVC7Od2uTbAltyuwCkWGL5Kzk6hQ4?=
 =?us-ascii?Q?j7YAJ18bTWFOA7/yrXk0rVCBRZ5xUUWY64WeesT16hxtDYxMI35aftDC/ou8?=
 =?us-ascii?Q?A/u2MfyCLqDziVCcGxLLNMDlKSfXjdCGPradegyOaNd2ZYWVsVfn8TGszqeu?=
 =?us-ascii?Q?lkwWUojC/eCoaviyZe2ttGJzASHJ+UhVQrjnRli6GUADOXKOMs0Dtq54BJBk?=
 =?us-ascii?Q?r1PGGRU2gNmCZIMawx+ILgOTch7ezeBtc1CBu2n5RcQt9iD70WfE9Lzki7DU?=
 =?us-ascii?Q?tVRFByOdSSrGa9SzfT1Or9gIUYf069ccSnvu63/LzoiaMvKw/4I+hZsSwpVg?=
 =?us-ascii?Q?ZCKVEESXGAg1UPcsvISQrrWQlwFOTGBdntwoG3QS4U6qm7KARw5necWkmiHS?=
 =?us-ascii?Q?d77iYy5hGSMMlrQfS/U/NSNN7Acu8UjW6qe4YO2vS7mfr3hYJ/CW2taKRw6j?=
 =?us-ascii?Q?//gTkGZAXY8kRKhEv+mWb2+zO+Uv1t7egXkdQhGx8YW8iARjRx6tfLhgc2IT?=
 =?us-ascii?Q?wsRiWE3HsNfjhOgN3QxGFjvo3YMIU393092ra0Q+IcMH2Wu1UslKaDHwirpY?=
 =?us-ascii?Q?bVwaX7C/uOUPwrHyRAyUAJcjMtacWcitNYboGYiwvnjOYZR9i/ZtwkJl0ViQ?=
 =?us-ascii?Q?f5BiLJ8ia7VofcPCy3pqM7lceCktL6PYW59lYEFAxhT5NYP5Yw+n3aDgRLg1?=
 =?us-ascii?Q?vXQnxYimajBFSDUmtg5DGJdGlVAURt/Au1Jkgyb26mTGMhmhw2yKj1bpQ9zc?=
 =?us-ascii?Q?BxVJJ9Nmou/e2GCDcEaACA2ht7f8t4hA752B29NTBQtiM+E7tqS3qDk/pHR2?=
 =?us-ascii?Q?oj6KiMdjJw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	wAB/yr5IYMkoqueU/tjm7sEKWF2hF8SodiFyojdUWcpzLuqDSU2TfrR2Y1ItjPKDfiZ9fyNSDJPDluVrdoNGB7mXXy6A4lzmn7H5AnauMueiug8ikvSQLL3yiwIn386k7oiayUls95v1pEiEP+qz2SjkUr7E6RnVrvDIu5soS3tUssvrWWSbjBCk3F9qh+aeDFsDkhqi7bpM7akMZ69m5IS4s8WAsSw9ZacVi0JTiqMNByEM5vY4NnuA4wbevdbL9qznij8QVRbecYBqJ4HhxUxHFD6620RGyTM62zYLVOqs4orVlH8cIspc4U3wKdySKaGnYr8cBrxdZ1Lql5XBLA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c49409e-32d3-438a-3f43-08de8f26eb25
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 13:10:45.4269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CeY+DkWMoW62g3VJ3Q0H7HxQx5tFrBnLV/n1L8E2fYw7OL9L9RznMYPSO3/xMamJii2ij9wIjmRoXbdPNp/KLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8104
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEyNyBTYWx0ZWRfX7PjTbreVUF7c
 QXlAsV/ZubZy3PkZ9TcCVHwlomWX6+ivSvy8SfO6vZR/HDl3+xPqvXVZVpL5eoNHAmqvZqRh0Y2
 2k5MXc6FKtSOAn64iM9ZcPtp+hcKOCCHCTC1/ztkLOepPrzMmKX0iWpwDtGFYMkBXRcRw4t4/kR
 G+1/MuawOWfpYo6G6t9ScxsVxJvsGaRMRaqXZiGKKH1w0qk1LUV8rfCboKPUOTPrDghNdpI/SrK
 T+yf1RvEfspwCFd32AMneGkxFncp6UVuk/yFawKvzHZTirOe1JGIdThL+ucaYe/bbnVh6ZFlMLX
 oIVZ9bxQ3R1JcALjx1McML0pWKKgD1T10e/wLLwHjSL1HwTVKLWElq27SaTdzE50AqB39iBxJR9
 yMAsmdZuEkUzXIP5ddxwIZgEWkWE1xmucux17RVY+XtBhWwJIHKQxkwYBSnOCLnRW2DAo+l9K7d
 dC+ckB7VtOIzBrgeJkQ==
X-Proofpoint-ORIG-GUID: CwCthf95EnsZpTCmB10rXmXRR_rXxhLh
X-Proofpoint-GUID: CwCthf95EnsZpTCmB10rXmXRR_rXxhLh
X-Authority-Analysis: v=2.4 cv=fvrRpV4f c=1 sm=1 tr=0 ts=69cbc7d9 cx=c_pps
 a=audpxvcsMtk9YILK9bmPfQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=S0mpSi8qAAAA:8
 a=vTr9H3xdAAAA:8 a=VwQbUJbxAAAA:8 a=OfU53SlFAAAA:8 a=t7CeM3EgAAAA:8
 a=xNf9USuDAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=KZT0_sYNsiRHhIVGrqIA:9
 a=BJr6rvadb4IWsfPgq2g9:22 a=TPLzquG42BA5giwn8P4f:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1011 impostorscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310127
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 13:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125891

* Use git instead of tarball in SRC_URI.
* Update configuration options.
* Clean up and refresh local patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-__progname-is-provided-by-libc.patch | 64 -----------------
 ...Mark-toplevel-definition-as-external.patch | 30 --------
 ...-Remove-double-inclusion-of-signal.h.patch | 39 -----------
 .../add-error-check-for-disk-filled-up.patch  | 18 ++---
 .../files/fix-writing-emtpy-file.patch        | 13 ++--
 .../tftp-hpa/files/tftp-0.40-remap.patch      |  2 +-
 .../tftp-hpa/files/tftp-0.42-tftpboot.patch   |  2 +-
 .../files/tftp-0.49-chk_retcodes.patch        |  2 +-
 .../tftp-hpa/files/tftp-hpa-0.39-tzfix.patch  |  2 +-
 .../tftp-hpa-0.49-fortify-strcpy-crash.patch  |  2 +-
 .../tftp-hpa/files/tftp-hpa-0.49-stats.patch  |  2 +-
 .../tftp-hpa/files/tftp-hpa-5.2-pktinfo.patch | 29 --------
 ...d_arg.patch => tftp-hpa-5.3-cmd_arg.patch} | 35 ++++------
 .../tftp-hpa/files/tftp-hpa-5.3-pktinfo.patch | 29 ++++++++
 ...p-hpa-bug-fix-on-separated-CR-and-LF.patch |  4 +-
 .../tftp-hpa/files/tftp-xinetd                | 18 -----
 .../{tftp-hpa_5.2.bb => tftp-hpa_5.3.bb}      | 70 +++++++++----------
 17 files changed, 101 insertions(+), 260 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/0001-__progname-is-provided-by-libc.patch
 delete mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/0001-tftp-Mark-toplevel-definition-as-external.patch
 delete mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/0001-tftp-Remove-double-inclusion-of-signal.h.patch
 delete mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-5.2-pktinfo.patch
 rename meta-networking/recipes-daemons/tftp-hpa/files/{tftp-0.49-cmd_arg.patch => tftp-hpa-5.3-cmd_arg.patch} (74%)
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-5.3-pktinfo.patch
 delete mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-xinetd
 rename meta-networking/recipes-daemons/tftp-hpa/{tftp-hpa_5.2.bb => tftp-hpa_5.3.bb} (58%)

diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/0001-__progname-is-provided-by-libc.patch b/meta-networking/recipes-daemons/tftp-hpa/files/0001-__progname-is-provided-by-libc.patch
deleted file mode 100644
index 66c15b5f8b..0000000000
--- a/meta-networking/recipes-daemons/tftp-hpa/files/0001-__progname-is-provided-by-libc.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 941038fc05be21202cab7a7a9434097fb55ecbe0 Mon Sep 17 00:00:00 2001
-From: Thorsten Glaser <tg@mirbsd.de>
-Date: Thu, 31 Jul 2014 16:29:41 +0930
-Subject: [PATCH] __progname[] is provided by libc
-
-Rename local variable to tftpd_progname to avoid a clash with glibc
-global symbols and work around Debian bug #519006 (Closes: #564052).
-
-[ hpa: specifically, double-underscore symbols in C are reserved for
-  the implementation, i.e. compiler/libc. ]
-
-Signed-off-by: Ron Lee <ron@debian.org>
-Signed-off-by: H. Peter Anvin <hpa@linux.intel.com>
----
-Upstream-Status: Pending
-
- tftpd/tftpd.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/tftpd/tftpd.c b/tftpd/tftpd.c
-index e247b97..5fec7bf 100644
---- a/tftpd/tftpd.c
-+++ b/tftpd/tftpd.c
-@@ -76,7 +76,7 @@ static int ai_fam = AF_INET;
- #define TRIES   6               /* Number of attempts to send each packet */
- #define TIMEOUT_LIMIT ((1 << TRIES)-1)
- 
--const char *__progname;
-+const char *tftpd_progname;
- static int peer;
- static unsigned long timeout  = TIMEOUT;        /* Current timeout value */
- static unsigned long rexmtval = TIMEOUT;       /* Basic timeout value */
-@@ -395,9 +395,9 @@ int main(int argc, char **argv)
-     /* basename() is way too much of a pain from a portability standpoint */
- 
-     p = strrchr(argv[0], '/');
--    __progname = (p && p[1]) ? p + 1 : argv[0];
-+    tftpd_progname = (p && p[1]) ? p + 1 : argv[0];
- 
--    openlog(__progname, LOG_PID | LOG_NDELAY, LOG_DAEMON);
-+    openlog(tftpd_progname, LOG_PID | LOG_NDELAY, LOG_DAEMON);
- 
-     srand(time(NULL) ^ getpid());
- 
-@@ -946,14 +946,14 @@ int main(int argc, char **argv)
-        syslog daemon gets restarted by the time we get here. */
-     if (secure && standalone) {
-         closelog();
--        openlog(__progname, LOG_PID | LOG_NDELAY, LOG_DAEMON);
-+        openlog(tftpd_progname, LOG_PID | LOG_NDELAY, LOG_DAEMON);
-     }
- 
- #ifdef HAVE_TCPWRAPPERS
-     /* Verify if this was a legal request for us.  This has to be
-        done before the chroot, while /etc is still accessible. */
-     request_init(&wrap_request,
--                 RQ_DAEMON, __progname,
-+                 RQ_DAEMON, tftpd_progname,
-                  RQ_FILE, fd,
-                  RQ_CLIENT_SIN, &from, RQ_SERVER_SIN, &myaddr, 0);
-     sock_methods(&wrap_request);
--- 
-2.14.1
-
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/0001-tftp-Mark-toplevel-definition-as-external.patch b/meta-networking/recipes-daemons/tftp-hpa/files/0001-tftp-Mark-toplevel-definition-as-external.patch
deleted file mode 100644
index 646757c783..0000000000
--- a/meta-networking/recipes-daemons/tftp-hpa/files/0001-tftp-Mark-toplevel-definition-as-external.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 2a12174a5059e84d4ff6fad8f983a4d0f2127e73 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 12 Aug 2020 12:17:31 -0700
-Subject: [PATCH] tftp: Mark toplevel definition as external
-
-Fixes
-multiple definition of `toplevel'; tftp.o:/usr/src/debug/tftp-hpa/5.2-r0/tftp-hpa-5.2/tftp/tftp.c:51: first defined here
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tftp/tftp.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tftp/tftp.c b/tftp/tftp.c
-index 9d15022..109848c 100644
---- a/tftp/tftp.c
-+++ b/tftp/tftp.c
-@@ -48,7 +48,7 @@ extern int maxtimeout;
- #define PKTSIZE    SEGSIZE+4
- char ackbuf[PKTSIZE];
- int timeout;
--sigjmp_buf toplevel;
-+extern sigjmp_buf toplevel;
- sigjmp_buf timeoutbuf;
- 
- static void nak(int, const char *);
--- 
-2.28.0
-
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/0001-tftp-Remove-double-inclusion-of-signal.h.patch b/meta-networking/recipes-daemons/tftp-hpa/files/0001-tftp-Remove-double-inclusion-of-signal.h.patch
deleted file mode 100644
index 84658d667b..0000000000
--- a/meta-networking/recipes-daemons/tftp-hpa/files/0001-tftp-Remove-double-inclusion-of-signal.h.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From e9ed48d91642d384ce07cbb9bec788f07fc6354c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 6 Sep 2022 14:51:42 -0700
-Subject: [PATCH] tftp: Remove double inclusion of signal.h
-
-Undefine __USE_XOPEN2K8 so we can get bsd_signal definition from system
-headers
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- config.h | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/config.h b/config.h
-index 3ff2915..ae1a14b 100644
---- a/config.h
-+++ b/config.h
-@@ -93,7 +93,6 @@
- #endif
- 
- #include <errno.h>
--#include <signal.h>
- 
- #ifdef HAVE_SYS_SOCKET_H
- #include <sys/socket.h>
-@@ -296,6 +295,9 @@ char *xstrdup(const char *);
- 
- #ifndef HAVE_BSD_SIGNAL
- void (*bsd_signal(int, void (*)(int))) (int);
-+#else
-+#undef __USE_XOPEN2K8
-+#include <signal.h>
- #endif
- #ifndef HAVE_DUP2
- int dup2(int, int);
--- 
-2.37.3
-
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/add-error-check-for-disk-filled-up.patch b/meta-networking/recipes-daemons/tftp-hpa/files/add-error-check-for-disk-filled-up.patch
index e4acd099ab..0f324a3265 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/files/add-error-check-for-disk-filled-up.patch
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/add-error-check-for-disk-filled-up.patch
@@ -1,19 +1,19 @@
-From bd5773947af5ca80ca546ad5625818fc912bdd60 Mon Sep 17 00:00:00 2001
+From 0b89c5bd9723ebd5207590016a14e5f2c6a0bdc9 Mon Sep 17 00:00:00 2001
 From: "Roy.Li" <rongqing.li@windriver.com>
 Date: Thu, 22 Aug 2013 08:56:09 +0800
 Subject: [PATCH] tftp-hpa: add error check for disk filled up
 
-Upstream-Status: Pending [Sent to http://www.syslinux.org/archives/2013-August/020765.html]
-
 Add error check when the write-buffer is finally flushed to the file,
 the caller can detect if the disk filled up (or had an i/o error) and
 return a NOSAPCE nak to the other side.
 
+Upstream-Status: Pending [Sent to http://www.syslinux.org/archives/2013-August/020765.html]
+
 Signed-off-by: Ming Liu <ming.liu@windriver.com>
 Signed-off-by: Roy.Li <rongqing.li@windriver.com>
 ---
- common/tftpsubs.c |    8 +++++---
- tftpd/tftpd.c     |   12 ++++++++++--
+ common/tftpsubs.c |  8 +++++---
+ tftpd/tftpd.c     | 12 ++++++++++--
  2 files changed, 15 insertions(+), 5 deletions(-)
 
 diff --git a/common/tftpsubs.c b/common/tftpsubs.c
@@ -47,10 +47,10 @@ index 8c999f6..b4d4ffe 100644
  
  /* When an error has occurred, it is possible that the two sides
 diff --git a/tftpd/tftpd.c b/tftpd/tftpd.c
-index 1873e70..c2adbda 100644
+index 3158c6d..001237b 100644
 --- a/tftpd/tftpd.c
 +++ b/tftpd/tftpd.c
-@@ -1681,7 +1681,11 @@ static void tftp_recvfile(const struct formats *pf, struct tftphdr *oap, int oac
+@@ -1690,7 +1690,11 @@ static void tftp_recvfile(const struct formats *pf, struct tftphdr *oap, int oac
              syslog(LOG_WARNING, "tftpd: write(ack): %m");
              goto abort;
          }
@@ -63,7 +63,7 @@ index 1873e70..c2adbda 100644
          for (;;) {
              n = recv_time(peer, dp, PKTSIZE, 0, &r_timeout);
              if (n < 0) {        /* really? */
-@@ -1712,7 +1716,11 @@ static void tftp_recvfile(const struct formats *pf, struct tftphdr *oap, int oac
+@@ -1721,7 +1725,11 @@ static void tftp_recvfile(const struct formats *pf, struct tftphdr *oap, int oac
              goto abort;
          }
      } while (size == segsize);
@@ -77,5 +77,5 @@ index 1873e70..c2adbda 100644
  
      ap->th_opcode = htons((u_short) ACK);       /* send the "final" ack */
 -- 
-1.7.10.4
+2.34.1
 
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/fix-writing-emtpy-file.patch b/meta-networking/recipes-daemons/tftp-hpa/files/fix-writing-emtpy-file.patch
index 4f3dcd7767..0b235361c5 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/files/fix-writing-emtpy-file.patch
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/fix-writing-emtpy-file.patch
@@ -1,6 +1,7 @@
-[PATCH] fix the empty file writting
-
-Upstream-Status: Pending
+From 1ce974f1cf6afbc528c941a8cdf0817a3fd7c5a7 Mon Sep 17 00:00:00 2001
+From: "Roy.Li" <rongqing.li@windriver.com>
+Date: Mon, 30 Mar 2026 22:37:22 +0800
+Subject: [PATCH] fix the empty file writting
 
 With the feature that checking the disk filled up, the return
 value of function write_behind was checked and used to detect
@@ -11,13 +12,15 @@ error was miss-raised.
 make write_behind to return 0 if written file is empty, to fix
 the this bug.
 
+Upstream-Status: Pending
+
 Signed-off-by: Roy.Li <rongqing.li@windriver.com>
 ---
  common/tftpsubs.c | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/common/tftpsubs.c b/common/tftpsubs.c
-index b4ea3f2..9f6cafc 100644
+index b4ea3f2..30e749a 100644
 --- a/common/tftpsubs.c
 +++ b/common/tftpsubs.c
 @@ -198,9 +198,12 @@ int write_behind(FILE * file, int convert)
@@ -35,5 +38,5 @@ index b4ea3f2..9f6cafc 100644
          return write(fileno(file), buf, count);
  
 -- 
-1.9.1
+2.34.1
 
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.40-remap.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.40-remap.patch
index 3f690609a6..837d2f7d08 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.40-remap.patch
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.40-remap.patch
@@ -1,6 +1,6 @@
 Patch originally from Fedora
 
-http://pkgs.fedoraproject.org/cgit/tftp.git/
+https://src.fedoraproject.org/rpms/tftp.git
 
 Upstream-Status: Pending
 
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.42-tftpboot.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.42-tftpboot.patch
index 98a86b78b0..8a30194f4b 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.42-tftpboot.patch
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.42-tftpboot.patch
@@ -1,6 +1,6 @@
 Patch originally from Fedora
 
-http://pkgs.fedoraproject.org/cgit/tftp.git/
+https://src.fedoraproject.org/rpms/tftp.git
 
 Upstream-Status: Pending
 
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.49-chk_retcodes.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.49-chk_retcodes.patch
index 7ae1a87220..fae887427f 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.49-chk_retcodes.patch
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.49-chk_retcodes.patch
@@ -1,6 +1,6 @@
 Patch originally from Fedora
 
-http://pkgs.fedoraproject.org/cgit/tftp.git/
+https://src.fedoraproject.org/rpms/tftp.git
 
 Upstream-Status: Pending
 
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.39-tzfix.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.39-tzfix.patch
index 85110eb285..3a3a292e2e 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.39-tzfix.patch
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.39-tzfix.patch
@@ -1,6 +1,6 @@
 Patch originally from Fedora
 
-http://pkgs.fedoraproject.org/cgit/tftp.git/
+https://src.fedoraproject.org/rpms/tftp.git
 
 Upstream-Status: Pending
 
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.49-fortify-strcpy-crash.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.49-fortify-strcpy-crash.patch
index 08d2b5b7d6..42fddfd0ca 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.49-fortify-strcpy-crash.patch
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.49-fortify-strcpy-crash.patch
@@ -1,6 +1,6 @@
 Patch originally from Fedora
 
-http://pkgs.fedoraproject.org/cgit/tftp.git/
+https://src.fedoraproject.org/rpms/tftp.git
 
 Upstream-Status: Pending
 
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.49-stats.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.49-stats.patch
index 720cd69dec..f646ec5afe 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.49-stats.patch
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-0.49-stats.patch
@@ -1,6 +1,6 @@
 Patch originally from Fedora
 
-http://pkgs.fedoraproject.org/cgit/tftp.git/
+https://src.fedoraproject.org/rpms/tftp.git
 
 Upstream-Status: Pending
 
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-5.2-pktinfo.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-5.2-pktinfo.patch
deleted file mode 100644
index 216349d26f..0000000000
--- a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-5.2-pktinfo.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Patch originally from Fedora
-
-http://pkgs.fedoraproject.org/cgit/tftp.git/
-
-Upstream-Status: Pending
-
-diff -up tftp-hpa-5.2/tftpd/recvfrom.c.test tftp-hpa-5.2/tftpd/recvfrom.c
---- tftp-hpa-5.2/tftpd/recvfrom.c.test	2011-12-11 23:13:52.000000000 +0100
-+++ tftp-hpa-5.2/tftpd/recvfrom.c	2012-01-04 10:05:17.852042256 +0100
-@@ -149,16 +149,16 @@ myrecvfrom(int s, void *buf, int len, un
- 
-     /* Try to enable getting the return address */
- #ifdef IP_RECVDSTADDR
--    if (from->sa_family == AF_INET)
-+    if (from->sa_family == AF_INET || !from->sa_family)
-         setsockopt(s, IPPROTO_IP, IP_RECVDSTADDR, &on, sizeof(on));
- #endif
- #ifdef IP_PKTINFO
--    if (from->sa_family == AF_INET)
-+    if (from->sa_family == AF_INET || !from->sa_family)
-         setsockopt(s, IPPROTO_IP, IP_PKTINFO, &on, sizeof(on));
- #endif
- #ifdef HAVE_IPV6
- #ifdef IPV6_RECVPKTINFO
--    if (from->sa_family == AF_INET6)
-+    if (from->sa_family == AF_INET6 || !from->sa_family)
-         setsockopt(s, IPPROTO_IPV6, IPV6_RECVPKTINFO, &on, sizeof(on));
- #endif
- #endif
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.49-cmd_arg.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-5.3-cmd_arg.patch
similarity index 74%
rename from meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.49-cmd_arg.patch
rename to meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-5.3-cmd_arg.patch
index 6b8ceaaeba..3571137ce1 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-0.49-cmd_arg.patch
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-5.3-cmd_arg.patch
@@ -1,34 +1,23 @@
 Patch originally from Fedora
 
-http://pkgs.fedoraproject.org/cgit/tftp.git/
+https://src.fedoraproject.org/rpms/tftp.git
 
 Upstream-Status: Pending
 
-diff -up tftp-hpa-0.49/config.h.cmd_arg tftp-hpa-0.49/config.h
---- tftp-hpa-0.49/config.h.cmd_arg	2010-04-19 15:29:10.567331454 +0200
-+++ tftp-hpa-0.49/config.h	2010-04-20 07:33:03.133232772 +0200
-@@ -291,6 +291,7 @@ typedef int socklen_t;
+diff -up tftp-hpa-5.3/config.h.cmd_arg tftp-hpa-5.3/config.h
+--- tftp-hpa-5.3/config.h.cmd_arg	2024-05-30 00:40:13.000000000 +0200
++++ tftp-hpa-5.3/config.h	2025-12-26 22:27:30.933202754 +0100
+@@ -277,6 +277,7 @@ typedef int socklen_t;
  /* Prototypes for libxtra functions */
  
  void *xmalloc(size_t);
 +void *xrealloc(void *, size_t);
  char *xstrdup(const char *);
  
- #ifndef HAVE_BSD_SIGNAL
-diff -up tftp-hpa-0.49/configure.in.cmd_arg tftp-hpa-0.49/configure.in
---- tftp-hpa-0.49/configure.in.cmd_arg	2008-10-21 00:08:31.000000000 +0200
-+++ tftp-hpa-0.49/configure.in	2010-04-19 11:05:12.387340698 +0200
-@@ -152,6 +152,7 @@ OBJROOT=`pwd`
- 
- XTRA=false
- PA_SEARCH_LIBS_AND_ADD(xmalloc, iberty)
-+PA_SEARCH_LIBS_AND_ADD(xrealloc, iberty)
- PA_SEARCH_LIBS_AND_ADD(xstrdup, iberty)
- PA_SEARCH_LIBS_AND_ADD(bsd_signal, bsd, bsdsignal)
- PA_SEARCH_LIBS_AND_ADD(getopt_long, getopt, getopt_long)
-diff -up tftp-hpa-0.49/lib/xrealloc.c.cmd_arg tftp-hpa-0.49/lib/xrealloc.c
---- tftp-hpa-0.49/lib/xrealloc.c.cmd_arg	2010-04-19 11:05:12.387340698 +0200
-+++ tftp-hpa-0.49/lib/xrealloc.c	2010-04-19 11:05:12.387340698 +0200
+ #ifndef HAVE_SIGHANDLER_T
+diff -up tftp-hpa-5.3/lib/xrealloc.c.cmd_arg tftp-hpa-5.3/lib/xrealloc.c
+--- tftp-hpa-5.3/lib/xrealloc.c.cmd_arg	2025-12-26 22:19:59.751870026 +0100
++++ tftp-hpa-5.3/lib/xrealloc.c	2025-12-26 22:19:59.751870026 +0100
 @@ -0,0 +1,20 @@
 +/*
 + * xrealloc.c
@@ -50,9 +39,9 @@ diff -up tftp-hpa-0.49/lib/xrealloc.c.cmd_arg tftp-hpa-0.49/lib/xrealloc.c
 +
 +    return p;
 +}
-diff -up tftp-hpa-0.49/tftp/main.c.cmd_arg tftp-hpa-0.49/tftp/main.c
---- tftp-hpa-0.49/tftp/main.c.cmd_arg	2008-10-21 00:08:31.000000000 +0200
-+++ tftp-hpa-0.49/tftp/main.c	2010-04-19 11:05:12.389329337 +0200
+diff -up tftp-hpa-5.3/tftp/main.c.cmd_arg tftp-hpa-5.3/tftp/main.c
+--- tftp-hpa-5.3/tftp/main.c.cmd_arg	2024-05-30 00:40:13.000000000 +0200
++++ tftp-hpa-5.3/tftp/main.c	2025-12-26 22:19:59.752870023 +0100
 @@ -89,11 +89,14 @@ int connected;
  const struct modes *mode;
  #ifdef WITH_READLINE
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-5.3-pktinfo.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-5.3-pktinfo.patch
new file mode 100644
index 0000000000..02e88aed36
--- /dev/null
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-5.3-pktinfo.patch
@@ -0,0 +1,29 @@
+Patch originally from Fedora
+
+https://src.fedoraproject.org/rpms/tftp.git
+
+Upstream-Status: Pending
+
+diff -up tftp-hpa-5.3/tftpd/recvfrom.c.pktinfo tftp-hpa-5.3/tftpd/recvfrom.c
+--- tftp-hpa-5.3/tftpd/recvfrom.c.pktinfo	2024-05-30 00:40:13.000000000 +0200
++++ tftp-hpa-5.3/tftpd/recvfrom.c	2025-12-26 22:30:37.142522362 +0100
+@@ -170,16 +170,16 @@ myrecvfrom(int s, void *buf, int len, un
+ 
+     /* Try to enable getting the return address */
+ #ifdef IP_RECVDSTADDR
+-    if (from->sa.sa_family == AF_INET)
++    if (from->sa.sa_family == AF_INET || !from->sa.sa_family)
+         setsockopt(s, IPPROTO_IP, IP_RECVDSTADDR, &on, sizeof(on));
+ #endif
+ #ifdef IP_PKTINFO
+-    if (from->sa.sa_family == AF_INET)
++    if (from->sa.sa_family == AF_INET || !from->sa.sa_family)
+         setsockopt(s, IPPROTO_IP, IP_PKTINFO, &on, sizeof(on));
+ #endif
+ #ifdef HAVE_IPV6
+ #ifdef IPV6_RECVPKTINFO
+-    if (from->sa.sa_family == AF_INET6)
++    if (from->sa.sa_family == AF_INET6 || !from->sa.sa_family)
+         setsockopt(s, IPPROTO_IPV6, IPV6_RECVPKTINFO, &on, sizeof(on));
+ #endif
+ #endif
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-bug-fix-on-separated-CR-and-LF.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-bug-fix-on-separated-CR-and-LF.patch
index e994f28402..f68e6369c4 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-bug-fix-on-separated-CR-and-LF.patch
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-bug-fix-on-separated-CR-and-LF.patch
@@ -1,4 +1,4 @@
-From 6ed1eb8829dee351b54e183bc42c007cb306aaa5 Mon Sep 17 00:00:00 2001
+From 2be04543d790d9ec29fa8522f07f221468ccd033 Mon Sep 17 00:00:00 2001
 From: Zhang Xiao <xiao.zhang@windriver.com>
 Date: Wed, 11 Jun 2014 14:01:16 +0800
 Subject: [PATCH] tftp-hpa: bug fix on separated CR and LF
@@ -34,5 +34,5 @@ index b4d4ffe..b4ea3f2 100644
          c = *p++;               /* pick up a character */
          if (prevchar == '\r') { /* if prev char was cr */
 -- 
-1.8.5.2.233.g932f7e4
+2.34.1
 
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-xinetd b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-xinetd
deleted file mode 100644
index fe70163966..0000000000
--- a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-xinetd
+++ /dev/null
@@ -1,18 +0,0 @@
-# default: off
-# description: The tftp server serves files using the trivial file transfer \
-#	protocol.  The tftp protocol is often used to boot diskless \
-#	workstations, download configuration files to network-aware printers, \
-#	and to start the installation process for some operating systems.
-service tftp
-{
-	socket_type		= dgram
-	protocol		= udp
-	wait			= yes
-	user			= root
-	server			= /usr/sbin/in.tftpd-hpa
-	server_args		= -s /var/lib/tftpboot
-	disable			= yes
-	per_source		= 11
-	cps				= 100 2
-	flags			= IPv6
-}
diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.3.bb
similarity index 58%
rename from meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
rename to meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.3.bb
index 96c9bdb653..fc7e54a160 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.3.bb
@@ -5,51 +5,47 @@ booting diskless workstations.  The tftp package provides the user   \
 interface for TFTP, which allows users to transfer files to and from a \
 remote machine.  This program and TFTP provide very little security, \
 and should not be enabled unless it is expressly needed."
-DEPENDS = "readline"
+HOMEPAGE = "https://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git/"
 SECTION = "net"
-HOMEPAGE = "http://freecode.com/projects/tftp-hpa"
 LICENSE = "BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://MCONFIG.in;beginline=1;endline=9;md5=c28ba5adb43041fae4629db05c83cbdd \
                     file://tftp/tftp.c;beginline=1;endline=32;md5=988c1cba99d70858a26cd877209857f4"
 
 
-SRC_URI = "http://kernel.org/pub/software/network/tftp/tftp-hpa/tftp-hpa-${PV}.tar.bz2 \
+SRC_URI = "git://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git;protocol=https;branch=master;tag=tftp-hpa-${PV} \
            file://tftp-0.40-remap.patch \
            file://tftp-0.42-tftpboot.patch \
            file://tftp-0.49-chk_retcodes.patch \
-           file://tftp-0.49-cmd_arg.patch \
+           file://tftp-hpa-5.3-cmd_arg.patch \
            file://tftp-hpa-0.39-tzfix.patch \
            file://tftp-hpa-0.49-fortify-strcpy-crash.patch \
            file://tftp-hpa-0.49-stats.patch \
-           file://tftp-hpa-5.2-pktinfo.patch \
-           file://default \
-           file://init \
+           file://tftp-hpa-5.3-pktinfo.patch \
            file://add-error-check-for-disk-filled-up.patch \
            file://tftp-hpa-bug-fix-on-separated-CR-and-LF.patch \
            file://fix-writing-emtpy-file.patch \
-           file://0001-__progname-is-provided-by-libc.patch \
-           file://0001-tftp-Mark-toplevel-definition-as-external.patch \
-           file://0001-tftp-Remove-double-inclusion-of-signal.h.patch \
+           file://default \
+           file://init \
            file://tftpd-hpa.socket \
            file://tftpd-hpa.service \
-"
+          "
 
-SRC_URI[md5sum] = "46c9bd20bbffa62f79c958c7b99aac21"
-SRC_URI[sha256sum] = "0a9f88d4c1c02687b4853b02ab5dd8779d4de4ffdb9b2e5c9332841304d1a269"
+SRCREV = "15c4f369ee741e9205dc28ce631aaf6799193b04"
 
 inherit autotools-brokensep update-rc.d update-alternatives systemd
 
-export AR = "${HOST_PREFIX}ar cq"
+DEPENDS = "readline"
 
-EXTRA_OECONF += "--disable-option-checking"
+EXTRA_OECONF = "--enable-largefile \
+                --enable-year2038 \
+                --with-readline \
+                --without-tcpwrappers \
+               "
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[ipv6] = "--with-ipv6,--without-ipv6,"
 
-# configure.in has errors
-do_configure() {
-    oe_runconf
-}
+CACHED_CONFIGUREVARS:libc-musl = "ac_cv_type_socklen_t=yes"
 
 do_install() {
     oe_runmake install INSTALLROOT=${D}
@@ -57,20 +53,25 @@ do_install() {
     mv ${D}${sbindir}/in.tftpd ${D}${sbindir}/in.tftpd-hpa
 
     install -m 755 -d ${D}${localstatedir}/lib/tftpboot/
-    install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/tftpd-hpa
-    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/tftpd-hpa
-    sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/tftpd-hpa
-    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/tftpd-hpa
-    sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${sysconfdir}/init.d/tftpd-hpa
-
-    install -d ${D}${sysconfdir}/default
-    install -m 0644 ${UNPACKDIR}/default ${D}${sysconfdir}/default/tftpd-hpa
-
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${UNPACKDIR}/tftpd-hpa.socket ${D}${systemd_unitdir}/system
-    install -m 0644 ${UNPACKDIR}/tftpd-hpa.service ${D}${systemd_unitdir}/system
-    sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/tftpd-hpa.service
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/default
+        install -m 0644 ${UNPACKDIR}/default ${D}${sysconfdir}/default/tftpd-hpa
+
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/tftpd-hpa
+        sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/tftpd-hpa
+        sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/tftpd-hpa
+        sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/tftpd-hpa
+        sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${sysconfdir}/init.d/tftpd-hpa
+    fi
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${UNPACKDIR}/tftpd-hpa.socket ${D}${systemd_unitdir}/system
+        install -m 0644 ${UNPACKDIR}/tftpd-hpa.service ${D}${systemd_unitdir}/system
+        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/tftpd-hpa.service
+    fi
 }
 
 FILES:${PN} = "${bindir}"
@@ -92,7 +93,6 @@ ALTERNATIVE:${PN} = "tftp"
 ALTERNATIVE_TARGET[tftp] = "${bindir}/tftp-hpa"
 ALTERNATIVE_PRIORITY = "100"
 
-
 SYSTEMD_PACKAGES = "tftp-hpa-server"
 SYSTEMD_SERVICE:tftp-hpa-server = "tftpd-hpa.socket tftpd-hpa.service"
 SYSTEMD_AUTO_ENABLE:tftp-hpa-server = "enable"
-- 
2.34.1


