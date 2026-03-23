Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15D0EC01DB
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 11:42:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15257.1774266137345014830
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 04:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CfBDwc31;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7542b98c32=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N5qR4X3908974
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=VkeR54IgUOzWRRVXA28Vef1cIA0nCas4S8IaqK3zN5c=; b=CfBDwc31sVv2
	6AogylUSdKdos1LJhALsrANLk4LXZ+DAToRv1Hs3OYdPZo07OFcODhimQ0lcHrjI
	EtM5QjGFzt6zDdiU9oGwfZmSyVrpVmCK+YI8RbrJu1fFrat0uFOoth+I1FCflYym
	XgLFOSywTgKQC2l1cXG2waxVbQDKNlAdL3TwQ74yMmU3bIDjajUm0iRSERmB2tlW
	8W8lqwPcOe4zmNA7zQxMhXpOBS/4vfYvMJOL267HTPdi421hmIPAYueFF4pzK5zN
	kU2bZkkHSxM25dMvsvqraC3axCRYwJxC6FN4lIKYeYpLZQkfBv7ibolUengnqsyZ
	vFjkQMgr6w==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010069.outbound.protection.outlook.com [52.101.193.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1tucsea2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nIGfMmst5l3p+tK7pJctsW53TNftC0ARvfZF6o7EV585hhs4zU9CGvkjKCumbt9x92bC+eb3Nb7YjwJLij+nfiDNL1ALYiRdnGz2OrWP8CTUGsN0O5IypD8XjPaFOgjyQQ/SGqP7NGHyTOkUTamZjb5EX8DbASyPSYn6ceQGSJFZQa8NRsUt3AO/uqpG+/X4mKn+GErrHh3Q4EIygskmkRV3uH9HEPV0yepEbha9WzU/4ZMEX6JIH4YDf//zLVV2ZyNNuFFg92nD96p6+JjFcICY+Z5OvmMIEx/cn7/2s51suIVN3mE54UII+8KxOoDsW8xxZoua1LBMqTLopkCqtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkeR54IgUOzWRRVXA28Vef1cIA0nCas4S8IaqK3zN5c=;
 b=dN8lAlYz1yXUZ8OjW7dNXEzCKAjSCS0dGarGPM4AyM8gFEtb9NpMOch2j2c2j2hi6Y8SdQa8kmNBxSWPf3vd5pN0lVe5O1Vc+n5Z6AR5N62RZLuflfq2099YQYoBz42kZX8sH4kRyeyBxekTPvkDq5A0LaYKLz3YRyiMOosQ30Gv66Wi7DyObRxiNuvqA34OIGRDjXIXAutI++jH9m4bKIXCLYAfsx6AM4MDrihx+mT17Mjp7BmgIZ4Xh2KfbavWv4dLA7AX2BWBaQWMIPw+1tJu+nzexQzyr8yxX6x8FiGzGR6KLyJ3+/8Tc+WfXZiXSvHNIbCTLuawgLpg5Z9b6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS0PR11MB7441.namprd11.prod.outlook.com (2603:10b6:8:141::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Mon, 23 Mar
 2026 11:42:13 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 11:42:13 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 08/15] tumbler: upgrade 4.20.1 -> 4.21.1
Date: Mon, 23 Mar 2026 19:41:45 +0800
Message-Id: <20260323114152.4178269-9-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
References: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::14) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS0PR11MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: 18cb36ea-c9e2-4c40-a715-08de88d139e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	Jp6yqlbXLX9zBUjEiRSolnbdVfWrZnpIw3Iq/lR8WdqACLpE5TmqjEFVLg6KmMkPkYMePWevTr+O4K6eE2LCPG5GeHB7Mq5oKzHPnhHllMUYNxl2im2cTiiaI1w1Pjt3dXe7uHnCA/fGCxTiJ24n4HYmqLy757vMG3tQ6RH5qKRih4RXXmES0XbjpwT/o+jppt4eQOC+7+LeIH2QBbBRHl4HndYOdTldzZ90MktdYQOASnId8wbZ00DjE46lJ1PzbNABhw1+Qv86QkYXavypk+QvwdOxvkVDySrXNMonH2gP6ssJPg8dJTU8oejjrwQfzUcLQZjihFEkXE8snfiSqLs3/f3g0ltqRDa2YH1XRN1madqB16VacinQckcVbhSMgxbWIPLAY6S1DZciBxZJ9P4Lmb4fbUkWIbr0aeg+qfhPXa8CahYsyAkUQfJ+cU61PQ57pKENFj2qDrMAeJZxBPl/vVjn4Px9FiFB+fZFRN6HPF8nOH1nnZhTJsQVZCKy3eogI8a/YAtGTO2aJalO3zllixBZ536/O8uz337fcLXC1T3LS9zhWd9Cv3Y7+yh9ZHpcxV86E+aRrKTwoWthtTNGiq6pkrxC9X3IpwrLScBsk/7VP9lm8+xcjetqNegCaCElwOtIqg+JhJLbJVlKvkkMwabgtlcMcAsrKtin+2YfdFha/hWbS99VLf2oIS06Arc6QYfuPyd1i43t7aN/MHDd0HxyczZ8xDyKN4SmYE3u3MzllwFdjsiRNCoXGvLm
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cUSw96Kz1jdQXXLxy00zZEtsCduDLtqY4WO2GehnN3SpdN1QeoWIK9chDN4S?=
 =?us-ascii?Q?/IK9ZRBeTcKoODQz6MxR5dcZ84dkf5jf9nNwFB5SqpByJDTWDR2GgPcg/Q0G?=
 =?us-ascii?Q?x/y+h5D1qMvPpzW7wBz0ilhxnmKFzN6OyEb3TnPGtgsXnfCTSaKznLhlMrfi?=
 =?us-ascii?Q?UdCRkqenfJR0KE3FByDypCL3cf8F1leMjSMTUsvJCheC1L+s+xJHYrCa23SD?=
 =?us-ascii?Q?IodSm6bmrVTT9yNcMsnafaAl3oofIvaaFui8Nts5OQYyfNFtXOHb7Rgo62DZ?=
 =?us-ascii?Q?Mx6de15zM+fZLiNs1b19O+bbQ7MzKXuVJyG5lZxn3c1FWh6KNvmvmWuxEG+o?=
 =?us-ascii?Q?uv2cDUiicO0np9bsQ4+tX6kEYWO1mtbAVYnSbgclwcvYJovNDgJ7BbUfOLqf?=
 =?us-ascii?Q?4L0BJ+wVDxF93AmQ+E0eC0Ids8fmG7zBaCPWaaf9IhjetOSj1JEsz/TQiW1n?=
 =?us-ascii?Q?zT5Jqq/WperIlHWxgNIUvpZYApopomql2LFpr25M++P6o5fEJ/SscHqCykUQ?=
 =?us-ascii?Q?9kfLGi1S+zyfaQkrqwdpiWQDfEIiCmDqZmawqxihhci3pG0ulEH/XuSWbgyA?=
 =?us-ascii?Q?gEVHxWh0watSHy0KXzsgR+1MJ64glaQHGLcym27SRKSQyKhAN5RcVyC6HBAw?=
 =?us-ascii?Q?Aze+NWKR7SUl9p2hCsNmXXfdOHPPFubTn25UBuzpaZqxMHKDKsh7sMxSJXiL?=
 =?us-ascii?Q?l5RGrRE9hpsxaQEx+ahRq2DZLlmOt/rDmRcWG9mZmo2xfWYvhYiLjd31GZwj?=
 =?us-ascii?Q?dXWNbkHrnZLxnj3+hbNiZ3OPMl3FYnk71IyEkwEmsBJGCRLu1k3Z0uhiJrq7?=
 =?us-ascii?Q?pvJakegj+4K/JfsXFzszDcxYvBEqrydO+NQH4CiH/tVLpNrTAQq09LTm6ntl?=
 =?us-ascii?Q?knJv+BtNSM/kNcqMHBeuFZlLbzJFbD6LvYHQKwz8/iR+gF+eyKj9HfKw9Rtx?=
 =?us-ascii?Q?DHAheaORomlNpv+FvY9pL7JDsEvE/7MgbggiPjkK3TCLnBphYLxcygWx4rMb?=
 =?us-ascii?Q?O7EbgpdnuhZ9J2MlHcBhGOjjV4ILE0EHu1v+WMnVxU1X5etgjelKmRAG6UT4?=
 =?us-ascii?Q?4UVGOBnOtOP8uo9zrNI2g6P/64rO86i636+bqgiq8hCLULoJwpe330rIT6bR?=
 =?us-ascii?Q?Zb3fkQYtGEY4ZdZuZM7A0auw7H4OTDs1hJwOUL37VxyGryAAnyByqAH7rklw?=
 =?us-ascii?Q?SguPnlmblpGcFbiowLL+pQX5ttIvN6OQ1DN44x6f3Ghn1HzqCVDGV7d6v108?=
 =?us-ascii?Q?HvnUXRsq7rXyVuVikX3IC6UcooRQH/ebqA4T7H3iLmYCRVBNXgfSNdUoKysP?=
 =?us-ascii?Q?qex2hbzR9Esc27Si8YYiF5kAANNq3630vEBwAUP1d2wAVWaQKSADQ3Sk7jqS?=
 =?us-ascii?Q?Pumw358+y2/mrS1Ig4rYoVaWexUzv26WI2JetJ9TMjf4gs665yS+1Q7bcZK6?=
 =?us-ascii?Q?jnEHnKYCTceiobAq0njtdR68wIkxTfRaCG16SrDkj++nyJSbb34DuiZ5A44H?=
 =?us-ascii?Q?dsV2qGyjjmAbYqvHtFg8QQhSrGUot0Z5t+LsujjonNWe9TeEXB07/vfcEufp?=
 =?us-ascii?Q?tDaNslZLWGs9H+AnHEIxy15OJksjpYBgCAcO741BXwtKNJlOZ8Iaje7O5UIs?=
 =?us-ascii?Q?wcyqtYP2pFlg82WdQQpQhl5379zocREMoKKVl+vRj+KvmZAC00lY3LQtN2gF?=
 =?us-ascii?Q?guc75ft9ApUE+phVjZbS3JRSWOdjxSGnEEDbQJWkIpvbJ2QgCChV1+qbo+Xi?=
 =?us-ascii?Q?uJzUSY2FI6Vu6aMoJZPR+9ZrCi8adpQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	ac6xqkUTLxNdSsa3s9u0MAd0JeQUtDzNBYOsccC/F7j8SQAGr7lKudSH3IwVswTVsO8wZm2kWpSU00+mz9QLdQdH87nDIimTI/lBq6OkrpVUoXD0APF8F950ig6oaCVjs7yx+7tN6Cfdp2hgtBSTvxiOgAeLgsCim1V/Rzvrv5Fpg/ShhGHqn/UCz+EbT1cNSEYAm7lp4wftWvI1CHOy6fvJ68TuWc6ZTQGTB+/g3WG+gqEfwSAL5bMsD6aSL1BYd0dqgcF05T/ZkxdR2PR7sd+FgWoVJo50I00D1JpF7mJB5XYhxrpU7P+Gr2A91UEZwtIXhJhOGICf5qcZ7BB9Ag==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18cb36ea-c9e2-4c40-a715-08de88d139e5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:42:13.6018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3yrIt+k19N67ER/GEqAPAmwlbc1s0WeLP2wxTkt+XbaLPyXH50FcLeoeJHtWiJ+whTgPC9yg4lH5Paq+jYNJfhWPMKbJ3sOhyB7cHPRNxIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7441
X-Proofpoint-GUID: soXWVt9DrG65AqcUm3p8tuSJTUIhqbCS
X-Proofpoint-ORIG-GUID: soXWVt9DrG65AqcUm3p8tuSJTUIhqbCS
X-Authority-Analysis: v=2.4 cv=deCNHHXe c=1 sm=1 tr=0 ts=69c12718 cx=c_pps
 a=hksmzbl9AP/Wdhn7pSFcZw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=ulpM91qxE69dckgpr6gA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5MSBTYWx0ZWRfXxXcEiP4b5IJK
 sX3Vq7oUfpXEw1U1AgHFUgjZhENFWOqVwcwaFim5WRE3q8514kuEfpVgkXDNIl/XI566A3ZDVM/
 SH/jlo5jxyPjcKhkqK2/rMkhoAv2CykfJA01f0ko0AT6Ngk3sQTXZPva33OG0nQZX3XhseNRVaV
 oKierTTQrMUpl5HpK7Z4wbMnw7ybsfEbvBBnHjjm+kBBUzS8uIRBu+e2vmbLdmz9DWsgpOLG/l+
 HZsjve8PdkT6pn28nh7XUeIwsS2XX13GCSvgIJG/e3xUBsFw3njSxT4hzFRNcNJn72yQy3w3/71
 E9+i8G67TLgGDS1P0WkqQvPguSCuBNZVsyrCjM0M95Biuo90vhBBpQR15sTk9aFrb9Ql+HuyKG8
 unIq1a4NIXxgfFmHte1lLZod+vHaFVnr9dC7dzONoRH57mqzGWxYB20yH0OYXrxCv7zqI2eLS3m
 8PhJDJdsdbJBW5E1Vvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 11:42:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125511

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Changelog:
https://gitlab.xfce.org/xfce/tumbler/-/tags/tumbler-4.21.1
https://gitlab.xfce.org/xfce/tumbler/-/tags/tumbler-4.21.0

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../{tumbler_4.20.1.bb => tumbler_4.21.1.bb}  | 24 ++++++++++---------
 1 file changed, 13 insertions(+), 11 deletions(-)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_4.20.1.bb => tumbler_4.21.1.bb} (65%)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_4.21.1.bb
similarity index 65%
rename from meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb
rename to meta-xfce/recipes-xfce/tumbler/tumbler_4.21.1.bb
index 3cbc43fc20..7ab4b59416 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_4.21.1.bb
@@ -5,24 +5,26 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "xfce4-dev-tools-native libxfce4util"
 
+XFCE_COMPRESS_TYPE = "xz"
+XFCEBASEBUILDCLASS = "meson"
+GTKDOC_MESON_OPTION = "gtk-doc"
+
 inherit xfce gtk-doc systemd
 
 SRC_URI += " file://0001-Handle-cases-where-there-are-no-plugins-gracefully.patch"
-SRC_URI[sha256sum] = "87b90df8f30144a292d70889e710c8619d8b8803f0e1db3280a4293367a42eae"
+SRC_URI[sha256sum] = "0f499f79a2a7ee49726a433584dd8a680d514101b72bd1b003360611ce1dc244"
 
 INSANE_SKIP:${PN} = "dev-so"
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[cover-thumbnailer] = "--enable-cover-thumbnailer,--disable-cover-thumbnailer,curl gdk-pixbuf"
-PACKAGECONFIG[desktop-thumbnailer] = "--enable-desktop-thumbnailer,--disable-desktop-thumbnailer,gdk-pixbuf"
-PACKAGECONFIG[font-thumbnailer] = "--enable-font-thumbnailer,--disable-font-thumbnailer,freetype gdk-pixbuf"
-PACKAGECONFIG[gstreamer-thumbnailer] = "--enable-gstreamer-thumbnailer,--disable-gstreamer-thumbnailer,gstreamer1.0 gstreamer1.0-plugins-base"
-PACKAGECONFIG[jpeg-thumbnailer] = "--enable-jpeg-thumbnailer,--disable-jpeg-thumbnailer,gdk-pixbuf"
-PACKAGECONFIG[odf-thumbnailer] = "--enable-odf-thumbnailer,--disable-odf-thumbnailer,gdk-pixbuf libxml2 libgsf"
-PACKAGECONFIG[pixbuf-thumbnailer] = "--enable-pixbuf-thumbnailer,--disable-pixbuf-thumbnailer,gdk-pixbuf"
-PACKAGECONFIG[poppler-thumbnailer] = "--enable-poppler-thumbnailer,--disable-poppler-thumbnailer,gdk-pixbuf poppler"
-
-EXTRA_OECONF = "GDBUS_CODEGEN=${STAGING_BINDIR_NATIVE}/gdbus-codegen"
+PACKAGECONFIG[cover-thumbnailer] = "-Dcover-thumbnailer=enabled,-Dcover-thumbnailer=disabled,curl gdk-pixbuf"
+PACKAGECONFIG[desktop-thumbnailer] = "-Ddesktop-thumbnailer=enabled,-Ddesktop-thumbnailer=disabled,gdk-pixbuf"
+PACKAGECONFIG[font-thumbnailer] = "-Dfont-thumbnailer=enabled,-Dfont-thumbnailer=disabled,freetype gdk-pixbuf"
+PACKAGECONFIG[gstreamer-thumbnailer] = "-Dgst-thumbnailer=enabled,-Dgst-thumbnailer=disabled,gstreamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[jpeg-thumbnailer] = "-Djpeg-thumbnailer=enabled,-Djpeg-thumbnailer=disabled,gdk-pixbuf"
+PACKAGECONFIG[odf-thumbnailer] = "-Dodf-thumbnailer=enabled,-Dodf-thumbnailer=disabled,gdk-pixbuf libxml2 libgsf"
+PACKAGECONFIG[pixbuf-thumbnailer] = "-Dpixbuf-thumbnailer=enabled,-Dpixbuf-thumbnailer=disabled,gdk-pixbuf"
+PACKAGECONFIG[poppler-thumbnailer] = "-Dpoppler-thumbnailer=enabled,-Dpoppler-thumbnailer=disabled,gdk-pixbuf poppler"
 
 do_install:append() {
     # Makefile seems to race on creation of symlink. So ensure creation here
-- 
2.34.1


