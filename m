Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E90D20695
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 03:34:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15268.1729049664607262209
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Oct 2024 20:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=001984bff8=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G2MZ78011700
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 20:34:24 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42a397g45g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 20:34:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqtHJVisZXen3a87B2sV19fcX45rxjeWvw5horv74sHgaZx07wW/DL9WgP9i+1leE9nQLRV6fIzEZcfbhTqa3v2GUAXzg45iFKUHiZliRKAvvfUTmZZnMFHIlsLj+EPCAJo2GDjxa8+mfYOwfBmSW2gS6aOhIvvj/quUmqW3uc7BD8OtMteqYhvTqK5Usda4tNzKgBqmKPJhRUsLw/6Fy0ThyySLzsK1RpLgImNDpqSmOC9luBkdXHjwpmY47co4Q4tu7D6i1HLxQeLeTqo2qjOpgmYewZkm/ohwmuhFsNZ60s46ILLOh9YKyYR8BTblEH2+SjzFpAA3EyU0fO7msw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ne9UNQk4p6BDV1PI/JaiMIPvekFisSnFto+7YDwYbX8=;
 b=mkA+P/GAgHiPMczh8tN/uR9w2p0b/wPdtxkv39RCLKNuThvx9X/Pkk8VuBVhnRVPVAe2S9A6ZSPReagq4Ghiy4yUIxRx7Ethm8HajPfqziqhpzD5OARW+wuvwaWW/5DIXYG1nB7YcVSwGhZbt6DXTcLrg8a3fPvjLG11go04+u04sliMw7TkZOT3DO6biDVFCsl0MdVPkJtPN0eu/2AHMFG7VBfB52UnzPsGtwv+n8ShtUC182wHZZjqq/zydlM0iqFp+U8dcNcHRvcqye7YIkHtrp3BiwG753WqEkaGxZseDF9r5X8Jk4F9UjnFCh9Eol6qi7UHrcflG/7n3rBHCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SN7PR11MB6825.namprd11.prod.outlook.com (2603:10b6:806:2a0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Wed, 16 Oct
 2024 03:34:21 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%3]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 03:34:20 +0000
From: Hongxu Jia <hongxu.jia@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] transmission: fix compliance checking
Date: Wed, 16 Oct 2024 11:36:40 +0800
Message-Id: <20241016033640.356368-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0370.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::18) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SN7PR11MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: 8602c2df-2ac8-406a-552c-08dced936b81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6SSBRVnvOsUsXkFln8ftdSoN5Eb6ITegA0uvPU2vUClTOv3rhSpFl47Y3PKI?=
 =?us-ascii?Q?XqMXZORiyOFEPi6LdBxR9KzdJA/jPJQx8vMCltvisEprWhctbAoeIYh6qurW?=
 =?us-ascii?Q?ei9Btw6rfZqVL8WHKfrv2THNc5wMbRlOAzQMH+48P7QiCTkjTQ1Yof/ODHnv?=
 =?us-ascii?Q?7h7kes/vvjAmkRxSaEIfBJODHpvs0pLvkbyhH792/vj5ctqoDRsEMcdFFhAC?=
 =?us-ascii?Q?eF7ix8P0/xi981O0yYppQP2vRlHTRJor4shRFiGanAEcIOWnKK538EEnCZ8w?=
 =?us-ascii?Q?/xeAmCs+h+8zt7g+CMr5bhZUkpFRzWhiywxxSuriyDEbs1mIBCTTyTudIKZ8?=
 =?us-ascii?Q?taRfyZp6EHaFZJ595nR/oaNdPjMxyYzajt8iszxaXhtF0AnOsowsZ4Tdf1HU?=
 =?us-ascii?Q?ZtuNaqIQA0DfdGq166E26MkhcFHDwUg4Np5n8TX00Ne2At5Duq7++IWEi38p?=
 =?us-ascii?Q?m9uBp2hOPwjMAhjwwbaaBkXc5n2m4GM4aUQJc9jqFKVyVc6C6MD0cSjpdp+R?=
 =?us-ascii?Q?5kGemH1sAcikJFy0uTqCsiNv7YGaALj8s5W1EvNUJW9gnVvptDg6A1aw060T?=
 =?us-ascii?Q?R1pMb7fevcYW+Oyr3X7P164hs0NMIc37PdyGekbtpmS0NI6H1OqQ5qodIR+s?=
 =?us-ascii?Q?Ek16v1UbKxJlAJSOpckD+QUzOa6MYEbnLCcEGBHI2hEpSeJsZFN6GtkJuTk2?=
 =?us-ascii?Q?ARzExUByYmffENdkP+DU8oOnVv+iBXJ1KWWb71ydLL4BC3Vz0qF1WetCeK15?=
 =?us-ascii?Q?YsRlf1LOzKGWbCxDEg1WkwXgup59dYJuSR8M/gtlWNgTRENJf7+g6oXY7EQb?=
 =?us-ascii?Q?F1ndfzv/HPvj1Zbo90DhuExN3nPB4cSvsEMAhK6ka+sKDXmkr0NHRWQShWhA?=
 =?us-ascii?Q?B92DcZA64LpX/DOyjT5WZ9DlpkdWTPkOhz8w7Gji1gX6lk/TgMVlYXbO9PvI?=
 =?us-ascii?Q?ZKcQyh8erIejDNlUmEbelgykDexeNnEytwjbqneXOGBnfKK3q3jo1UJ2SPQD?=
 =?us-ascii?Q?38aBKSRotrifvtWAYhe2FEJ/lVI6ZqkT2hcQ3faVSkY1nCi9P8A7AB0H4B6H?=
 =?us-ascii?Q?Z1KHV+UPE/uQfYaDDYe89Z7z9NN6fP42Y/AzXnwH0wBuLeSdaOr9xgvqqeR0?=
 =?us-ascii?Q?FHkn/yEfKl3i+dBAIlg16PyDeUWy9RRrpzEvWsMc09Jpcqi4v/jKf4uoMH8v?=
 =?us-ascii?Q?tt3KvZwF+UD6pox0wrzrXOXzN6bgAiOPDDTnNtfouJFFbDCx2WRkTE1Wnh4I?=
 =?us-ascii?Q?1ewSgSX/wVTtiQLdZQuVl44zbkSkY7ONVdXbsmzsQ5VQARsoIDkGeOgetSqA?=
 =?us-ascii?Q?q+obHC0kipHsHjCa+ub6yJUZa8bXdtApMuJosqhwuzb3Yw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M/LQh5SzXi2ZcH8OlqAvyKe+xcvmfz8buP76RxNIcr3jWPdtAAaT5KJaRjFf?=
 =?us-ascii?Q?XLzCfw4AAaQ9RnVddJC3c/wmqcBBp8AwEHIGC6VQT0jN7wPdxhvaTD+TjTcA?=
 =?us-ascii?Q?44hFpMtWuj3MhlgDX2DGdINOgAq0Bis4p0DOsp27EFovlRVZ41A7uzzPpxoW?=
 =?us-ascii?Q?BRKApwVkARfJW42GaQ9n+FdfQDPo3+Irhthcsvy4Ag1bjTBsE9284ByjhiM/?=
 =?us-ascii?Q?QIXYUfophx60YHzTgXNNuKBP9eGSTwWl9pOANCkyb2QUhYbh2TV/mxMIplqV?=
 =?us-ascii?Q?0dI7U4xk3fCQxS8c/zgxYT59WbxhQJu7TZ+/ptJkCvf3nmaRsO8InIdGU7oo?=
 =?us-ascii?Q?MKO8ehuBpypXk7K8PJg8GrDyNJeUerNrH6bun7S6OIfaWdCkiESFQyX5fWAH?=
 =?us-ascii?Q?6EaLNc0IcJnQha7JKvkVvUx0epZbq6vBzIHSLCgtCt33WyqK4gx0vx3WpKSa?=
 =?us-ascii?Q?LOxva/O0CggY2uoOe41T12lrT/E2Jc7PFy8jA+/t3J1VwNqeWcAysEPIbV30?=
 =?us-ascii?Q?bwHP5CmQOjTDLMeiuR4GjDNLgT7oTyTmtwL9HPNrC3Ww1Xg0JC1FwzfxqpMZ?=
 =?us-ascii?Q?Xoorub/qL0CgJ7YZ0tc3NCXyWL6oDjKvrv6cI3X/XWNo0EbhZMCmMAnSYwbq?=
 =?us-ascii?Q?PzOUITGuyfwx/Bd/NMrALBIhTINHbSVyLwCSlXWe3vc0X/7o3VkPwFo6hZOX?=
 =?us-ascii?Q?2t5wP3rFFp7kMitUaHsgX+w2UQh5mQ5ZOOGyJl812fJKwUZONsXXZ3flddWI?=
 =?us-ascii?Q?C6UGXbsB5WsWCAz2017ioWZSmt9d5tVv4UdBxuo746FEWC8AH9yO6eujl6YA?=
 =?us-ascii?Q?wgxtaq2877cHBuxKS3rrEnG1bjkHpmSKA+wvrCAIat1umHJEtGZsbDuhu5sl?=
 =?us-ascii?Q?Mf1+yR6Glf2BLcKpiyuAT0N57rWTw3faq395Y2DeuoUgF8eB3/qPFVctWLcs?=
 =?us-ascii?Q?1Ejtsdydh7h0kadaLKYOz9IyAvPeNeXzMuCmRV5vCxSHbDi1re6vG/N6o9GQ?=
 =?us-ascii?Q?3sFXEVMJjErtdr0Y4OvT3+8n8zHG15fwvKuH7fWDI0BkuQnNXdpbDkbEBJSz?=
 =?us-ascii?Q?KA79/RU3H5CB9fvoxw6D4xgraeVw//vyV3AWlAsdwNPHnL7mt32KmELtOxcy?=
 =?us-ascii?Q?47aXAKHNXtxXA9Vn/qfugBa+DOU3N8W4pNF7XXJSBlufLwopw15UYzVxUjwI?=
 =?us-ascii?Q?n0T8G8QliVw4gD0AVt+jkjKCeBUkqbQMwS24n8DHUk1HWJVNaFq8XKayTYAY?=
 =?us-ascii?Q?FZ/lHR4FzrOyGF0ce2GColmSRczfJid+wSU6Za2AJDMvMGObVrq2uLgxED9F?=
 =?us-ascii?Q?M3hmyz0AqlRAmHZBjAqyWWDIOjjzLCgWseYCy7zKaQwYJaMw4ZaG5BUHUTi6?=
 =?us-ascii?Q?+dqIbJVXOgtLipGc02youKca3eL6tgqLjT+eBPWkNcWeDh4EoQSQN1qkgKMr?=
 =?us-ascii?Q?7HYZ0tmjOtJ0j+J55IGeUb1kOcXbqWb1v0Qjg10AR8HGwzxoZabXsRx2vXm2?=
 =?us-ascii?Q?PcbJxcpd3F8Avl970QYXnsSRE/g0hcOZAmeqecwAjFluXWmuds5/Ea3A8MQH?=
 =?us-ascii?Q?10X/5duuSm0bn8zaiwU9Bsn/mfWBMedwyVcl0l2bPOedyVfrDHMpPVlBY3Tp?=
 =?us-ascii?Q?XQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8602c2df-2ac8-406a-552c-08dced936b81
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 03:34:20.1798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gq62vr0+sWq9ZtwJSZR8gE2yotYyE6teTJ5b7KWBvDMiUhoSr76PqPyGubQsOEMxDaad1N55dZve3hj34Myj3350spA3aaQ2FAKixWxs/PQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6825
X-Proofpoint-ORIG-GUID: BrsFJpMKH31kb_k_Z-_87c4cfbCFIOxh
X-Authority-Analysis: v=2.4 cv=Fc1lx4+6 c=1 sm=1 tr=0 ts=670f3440 cx=c_pps a=ZuQraZtzrhlqXEa35WAx3g==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=iDkAzacNh8Du9D7U9WgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: BrsFJpMKH31kb_k_Z-_87c4cfbCFIOxh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_21,2024-10-15_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=760 clxscore=1011
 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410160021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 03:34:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112935

'''
ERROR: Nothing PROVIDES 'gtk4' (but meta-openembedded/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb DEPENDS on or otherwise requires it)
gtk4 was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers
'''

Add opengl to DISTRO_FEATURES contain condition

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb b/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
index 199a7c6d6f..f86389998f 100644
--- a/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
+++ b/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
@@ -21,7 +21,7 @@ inherit cmake gettext update-rc.d pkgconfig systemd mime-xdg
 
 LDFLAGS:append:riscv32 = " -latomic"
 
-PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
+PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'gtk', '', d)} \
                  ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
 
 PACKAGECONFIG[gtk] = "-DENABLE_GTK=ON,-DENABLE_GTK=OFF,gtk4 gtkmm4,"
-- 
2.25.1


