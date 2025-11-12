Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA953CD13D8
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 13:44:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13520.1762955068409837531
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 05:44:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WzPL+Zsx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACCA4I3002158
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=ezaxu1H+wbqrjnVMtuFQf065PeQq8qFlFWccSdp56xk=; b=WzPL+ZsxPD65
	v5AaOTMpD81R13edJUyVNj0fOogJUZcy8KLWx411SAlLUoTYvw3Q8TBRt942Wu5A
	eKCcsM+1q3bUbFoolV9QMUNz3/nMlCNxO6fT9gYggJ/taK5nkxRQPcs1W3qvKBVL
	Epqnj3eVBbO09yzJt91HAVYyRQqkdqlGHXtcfDpJ58RvCfx493amqH6PepcuDi5E
	RoRrU60qOa8L6mpNF90PbK6s5K20oV7WT4PFtuX8DUfS5E8jX2MJRdwz7whLuFD+
	pw7qNl/BQDPCsRJrT/Sa4EbJGkQIXx+m8YFzLqMCtuukhinM8ZGyr1V05m3Hb+2p
	MaSVZKkb9w==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012040.outbound.protection.outlook.com [40.93.195.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x5bmu-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPbp9wws/97KtMaLdCRfT4bzd0Q8iOr+zTzPLy4cndLKzPDII/X64jYKxPOZbO4G/V3c45zZluIqX0kEoh+FLyXfmEc8vxDkJJHVjb0ykcljdWCUmOE6hhDT800L0VoZYscQwltEfiDcuNdXw4qKPq9x7KDW9JPD/0deArOBD8i8ZNHQjD56dd3lFsw/h2/z11vABuDT8srL4K4XkDbYOFlPFiPI3yc0dWXtZfgMuMKBLxtve68kNT7HEwqUH4T6OSzM5GbG64zyKlSGkAgF6ZD0aDajHVV/IV2BhDQ94P40rYBKNjjBJ5w7OD7lmiLDVFI0EYrWHk+5NjGhQB1RJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezaxu1H+wbqrjnVMtuFQf065PeQq8qFlFWccSdp56xk=;
 b=sMr7+fQ/BFp7EiKotDel7iJXt72iTs1oaoFco6KeyLsoUQNfGG0MrBKgtvxqIfYWUad+8em2lXYSj+onDAXcS0e81webIcvwoR6cQZ1vPa+z7WyDt+O8ijn+fnmK2NOlnM3Dx4Y5MTtvXCYg/OwDQ3V+esmrJP3fl3g+WNZiIy49VE2jzC8aCv3RMSUwTmzLRYwLoYGHBznvcvCoRvTNbUpXmadOdgOiNvM0tARTZLT/5Z+MNnG9CtceagndtZgmtObdNpa94SXQSaTDyo1pvUV2ET3bJic1DXuHFXoD8VrhcQJB2R/xAu3LZ+5mkCB0GEVHpvHf+3Ndc5LvhKEZAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS4PPFABF58482A.namprd11.prod.outlook.com (2603:10b6:f:fc02::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 13:44:26 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:44:26 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 04/19] c-ares: inherit github-releases class
Date: Wed, 12 Nov 2025 21:43:50 +0800
Message-Id: <20251112134405.3706508-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112134405.3706508-1-yi.zhao@windriver.com>
References: <20251112134405.3706508-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0125.apcprd03.prod.outlook.com
 (2603:1096:4:91::29) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS4PPFABF58482A:EE_
X-MS-Office365-Filtering-Correlation-Id: 093732ff-7e42-4288-c1fe-08de21f19835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5eK40zFltTyotDzBg4A87w++tEXmcPIlIpeeTCvGH4YBnOysC8038QHYi7pC?=
 =?us-ascii?Q?3rF4EVlm9LEuj0oxeGbBZF82pgMyblnsBDuFp5l21dnCkS4ihiTOmSwzLer4?=
 =?us-ascii?Q?WyBbHdF3D8qxCK+U4zwg9LSdUKhDFCdTRLlv6sLOZbamhsBv+03gTqilqRJd?=
 =?us-ascii?Q?nFGknh+TQqA68v7/SK4xWxf7UIxBBOMXAdO9QosSTzi8JWhf1lo2BZcW1E8G?=
 =?us-ascii?Q?oeNcOdi0udg0UgDamDkwMheOLSz7qW6G/AxQZMnrOISLa7PWVGbyQ4CJaYko?=
 =?us-ascii?Q?XclThJDM42iqHOHmVDGUBugPLGnZRDAx+PR9elv9dqxIcN+xUALar6+St6ub?=
 =?us-ascii?Q?wiz4NP0lflIBqXJr2WiOVEvqNzAw3EEpZYwb1JsK4Tjw/AKjO58ys8HRNrSv?=
 =?us-ascii?Q?AxMerC6oxATVBYUmRSBa9PGUOEmPqKE9zWqBGafVplpuqsVWl7odflKhIt5Q?=
 =?us-ascii?Q?5KRHWk97DqW/kXr+uEutYu6CsO7nJp3CZE89AXr2CieEjBhPR/piCVL87BG6?=
 =?us-ascii?Q?BmccYiEU5wjFcZEhUwzCeb4fg1wPffc7EW2RKKjv8kx8//i5JmeP2D+fA19J?=
 =?us-ascii?Q?Do2CK9d2MH0jAd8Kh14UyNfA8XN2JqmgR/Ff//vwyjaXkN+8dUuEBBbyW85h?=
 =?us-ascii?Q?u7uFMWtmnd1eFnorb0qcVHmOeSruN6U4HzVqnF7NucWW04d2forVDyox3bRS?=
 =?us-ascii?Q?5BJQvcXZqD1iX80NWqpCBdTVSmOV+hnUFFM5uv/RymqS/SfI3062vmkVN+5R?=
 =?us-ascii?Q?WwpcBB7NyWS89oOYynUFv8W5y5xJeJpe0+XNgAKtvat2MNb+19wTqIE5spI5?=
 =?us-ascii?Q?/4rsMvmFRRvSZ8Nc1eOrNvKcM3XwJh2UJyuqR33R53fzaGqcb11GQUIapSqp?=
 =?us-ascii?Q?BscNZP2sjWD9BmSqlHfYzjCLtwfxCNKKIneSNfQk1fDM0/hTNfPErrSpSSK9?=
 =?us-ascii?Q?p3eqPaO5BsBKOSsrs70AviuWrvDbSJvZReu1ZbAjVJvHyFZPL0Yf37x0LeQN?=
 =?us-ascii?Q?3gbL9EusmAs91NWgv/IeRTsZdv0T74dDG9G4+Xmq43u2K4dHAVDKKyc4+vL1?=
 =?us-ascii?Q?daxTplKLAFHJaHdj3QOvF8i18dnRvN5Fz9khlc5+4lmgWq9ri2WUuEETKPsZ?=
 =?us-ascii?Q?5UxVHZKcTH+kt8IU84a1NtNSmtbvRc2MPNbH6/K+3Sl9upZihSuUTMhACyTt?=
 =?us-ascii?Q?UZeKD+oBXrTRsOC8s/6ArRXEkOAC6svTClTv6dLR0GVcZKsJ2wS6/WHY2nt1?=
 =?us-ascii?Q?1xB4NAS2bK4ig6Yfoi5IWHT786hG6w1KolCfbGQjKDSV153wfqXFYTs+9kmM?=
 =?us-ascii?Q?WEL8eS/aP6zachq3+mXhLUBPFYkeH2c4YncZ1vWBKfdlCI97+mHL4j+NwyMD?=
 =?us-ascii?Q?xzuwydtFv8Sf0IeZL40CzhuxKkDK/h72GNcyEYb8ohjSHnSvxhbWUzpVp31O?=
 =?us-ascii?Q?ibAcpbco0uVuRtc+/pj/6SB8+mPdJlhoLYoVoOFDJCHFOGbYN6XQqZtxHlXo?=
 =?us-ascii?Q?gFhZkomC8ulCNVjOtenLpvz1AvNDOJ6gIz71?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lEcJ0SoGQkU0tkcF7+QHfpft/bGjHumFbh+EaiW8PEg6YZ0ECvdrUanYEvnf?=
 =?us-ascii?Q?zmepJfFPpzdBQccdHMQcQUzV0S42Ac2a5vDNI10Kc4vpB6O93SZtrUdDluUJ?=
 =?us-ascii?Q?+woo8n63iZtBqiqNastBA+LIQcUrNOg/M6Ec4VV8RysdUPP8dDQbBy3dAms0?=
 =?us-ascii?Q?CET0GiujIa0JYnXD0pcp2ywzui13xQSm0byWRcuGfb49FfxYLy73Fdv3aFTy?=
 =?us-ascii?Q?fKTY+cAc5qcyOsAfXsgzMy3gLGr7r9W8fAETJCBEF3bt2dHZWLm68xmd66TL?=
 =?us-ascii?Q?szjDaD1zg7EXwcFDwjXuwurrvgntF3jKHPxWk1Ng9CwMyAqzGzp62ugSxveb?=
 =?us-ascii?Q?cmP+xhGNfGt7v6GHh3SM8xsegJxY8yh9SNJKS1eNkAE70BzfQuHY/yBimGUh?=
 =?us-ascii?Q?NUUaFnPu0TJWqD+xz9zo4fWEx9q64thqlU4wPN1FQQU/sFd0vYM/103dzoqO?=
 =?us-ascii?Q?LiFC1V/Bc6mzZEdmoRNDkm8ctW0ARbAgz+pUwXhKZ/CfXy1bhvldKlPPBeqi?=
 =?us-ascii?Q?asC03EVwHoqy50boTaNeuJVatlWR9QoPh664zd0D+jkyVX+mMVyufKVZLOHt?=
 =?us-ascii?Q?nrixReIr2d4a+tPfSrb3KUNb7elZFLQiCOMj9/bCa1dh5yrxbEi4mlqCNAP4?=
 =?us-ascii?Q?96U49Ag8mWzBle2PJKtfwtkjmYZbYjRkk/vH5YvYAUqTUoz9+yYTy7OFYCrk?=
 =?us-ascii?Q?kOcrYDL/ZWT2NlfOxtnXF7ekMcSn9sQ5F/NhoBH8nHVquepjTxbzKvU1l5Pw?=
 =?us-ascii?Q?k45GludBrL+cuKEnEtrbLdYKo291jnsoBvfUZOpDwoN4zN+zhdMUOIEUagpI?=
 =?us-ascii?Q?FucfNy+if54N/IwhQcYbF1M7YOXrnXLUYlNs4PvwlzUhwrwm36RD0TKy9r0U?=
 =?us-ascii?Q?bsKCiMwib8mNaVBd8zsE9ejzzf2mhVLf8/B83Rdfm1skx+vBmKphipiZjjR5?=
 =?us-ascii?Q?rSxUJI8xGFBt7WyjAmWZSZ96sILNzmyFBFdUfwoAD0+L0TpGjTJyCabdlh9I?=
 =?us-ascii?Q?P1Dv4Ii6+HcEhJjPDAMULH9VpsCtS9wykqTOYOWMRFOFVGxyJIsSSIimP/+o?=
 =?us-ascii?Q?YNqmG7e1FSEW2Vi+PLF9V62Cct0yS5n40ZmyrD4ZvKzDyYRQEOX//S0d1QMv?=
 =?us-ascii?Q?afkG90s+70pjd3q0lA7SQrUFW2K2GIInlqCqkWSeqTQ+2twbzHgJiii0zMyb?=
 =?us-ascii?Q?OKlaN7iloibp24DFbEFA0vtVYSnUm5bpwGpX45M11qUtWHDFjPqbvcM20/+9?=
 =?us-ascii?Q?X6aMYIAr6NPR079Ff5ws2+fFjp3YWK4B1XNwb8FFhVRLh+U3BcXucTp62xqC?=
 =?us-ascii?Q?Zbjauwq99maZj5rsPezgpaiBbChmWAxzg/+DZHeXJ8V7S66UPCo/2+66F+W0?=
 =?us-ascii?Q?C6n6KhD5qniZokIaJ6mVdiWWFCcef8LCFUwHwALCExo5V629J227/z2fZe7X?=
 =?us-ascii?Q?+NF+952D2gioJaD09FZCJayjGWW3iimAkqyxL+fCnpRNzn/85QwRfpvKfSBS?=
 =?us-ascii?Q?eUAgrvSCWrapalPDGJ1/xNAbhlYWrRGLXM6bCtx9Tsr2dlRNm8yreWvzJ9KO?=
 =?us-ascii?Q?bkrtWsbWbtsksIjowGxrQcyAY9tVORfiJMd/DAZG?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 093732ff-7e42-4288-c1fe-08de21f19835
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:44:26.1140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XdzuYYa85ZU5YhcpISL+P5QBt+MgSZm7/I+IoZ8BtUvs5etWNRnblO2GCt6s/YL/XSO0lOxrucpY0hAC/sbDew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFABF58482A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExMSBTYWx0ZWRfX1m69pYw21Ngu
 Jq8Uk0/hIvCtsm/QthCBymbaG7o+i14XqPagGleWHyEcQSsikmXD+g9UMJt+W9ttlVHs8vbFDOZ
 3y+ipkViinFceUdFV/qMN+GyWJDeo7E/gMidCLZg8xgihmATBu/gGi3sa6xnpioLjQUJk1Z0U2z
 W7yqIm01IJTgAUyND7DJSzkQbjyEuOX53EsCfnwV+Soim1g7RvrN24Afl0KRixeProEb+OGLlOw
 DXcm05or+q57MH9nhrLSvbyzYiTecbYiv5WQApHI6HAO9O62YBjrIxPyu9qVhd7nMxtp1WkEXPp
 5CS/gxnDFtqHkgEUFzg8Mb1at2GWLMAjdy+/tuWVWPPyUv9ECwbCc36mLDnO+aTRJuXaN+AVeRG
 kVDb+eZjjBt2rVhwnJFSKlILlIt4fw==
X-Proofpoint-GUID: ExsAAOeZKo3rt5P989nPX7zPo7n1XvWk
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=69148f3b cx=c_pps
 a=zWRuVz0++A3eh/KBGeICZg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=p_pR1EfkuHc1GyC3nJ4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ExsAAOeZKo3rt5P989nPX7zPo7n1XvWk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121533

Inherit github-releases class to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version c-ares
INFO: Current version: 1.34.5
INFO: Latest version:

After the patch:
$ devtool latest-version c-ares
INFO: Current version: 1.34.5
INFO: Latest version: 1.34.5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb b/meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb
index 8204f25cdb..b434886311 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb
@@ -14,7 +14,7 @@ PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
 PACKAGECONFIG[tests] = "-DCARES_BUILD_TESTS=ON,-DCARES_BUILD_TESTS=OFF,googletest"
 
-inherit cmake manpages pkgconfig ptest
+inherit cmake manpages pkgconfig ptest github-releases
 
 EXTRA_OECMAKE = "-DCARES_STATIC=${@ 'ON' if d.getVar('DISABLE_STATIC') == '' else 'OFF' }"
 
-- 
2.34.1


