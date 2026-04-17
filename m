Return-Path: <wenlin.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC14F436A2
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 13:30:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45055.1776432621614550324
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2026 06:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ah9OogZm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=85673a818e=wenlin.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H50AbT3108666
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 06:30:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=0vxYU3Wey8mpZX+vgTO6
	XSQnhPwBBmyPL7zznz/zoHA=; b=ah9OogZmbeRt4kQHLLKBc8rHieU3M7L7o5Ak
	IboTCvuXtXuOs/Mp8A4/ViMgv19JJVvTPKCA30e3O3JKmapWSHPWCOYbAPfm+H96
	P4aApmDEHA018X2878qej5mz9kdas0GBZygwjv6wPMLwlxOfBCiPc+2Z7jB6IqrT
	Uugo7216+wzz22yHlafEPQLPCRHOKrMTbxdhWE5fTaH5ufJ/I7h+cY6x26h/FO4V
	zHbkyW0ixUuKwls1RP2uI7VUhYeHbyHY6r8MLFrx87Txp8Ney2bozGWiXwk6fBai
	hw1fo2w1WTPg+q8nXqdpqfThl7o1JYWb8uuHp5bg5KgBC5ejVg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh86md1t5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 06:30:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPONSpXU3bhs8NfTLUzPpWzJUUgjhKZ8asqk88PeZDffwL2iUSrq9ldFj04GVA71MdavGjCisx8tH5P9TVZVDEDSfYWRp/kjg2iFJ3x/3dj0puk6q47L+5eBBQy7g7DeQabmiA2AO3Ntj9O/xak1cvACMf6oklbIYqi9t9XvI4/Dpj49BgAO7pLbvMf5o1QVdu/DDqolmtgOtRu6IhVLXrOKXWXzRmNYY9IqJnFvTGPNWzfegqIz5osC+FS9u6NfHhpGwfLcacXdculEF7pnti19ndfyhvr/iag0nqhM0rSQQpVAi4Kv+Y6E5PZo7PoLsJUPYNj0RsVRpyOt1bZ8LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vxYU3Wey8mpZX+vgTO6XSQnhPwBBmyPL7zznz/zoHA=;
 b=hKlOXhTK7A8SmRvWbOPdWJStEGSc5ZSKEqsAbAL4msRkYJZoOZ+sBrC76+PZvctz6IKajxXYvGA6Nct6Hbt45UqL0X22jXm7GEVdflg9fBo9JZP1Y9I9ucmO7eC4RmbrM301BzEvbR0pcEQm5lJugdkNacF9Fv833hd8nERxnGWa0qZn2GrniLTWPtCmbgyrm+qbRald+MngES9cp8GINNLxCEkOtoXDBhH+EirjkG3UFOMeJXVj4vHTORVIBA8FvssnYSomLGvVBTYkLFrFGtkSvgt1D+/adTm4ilsCCXcSuEdg8Y7QJVQbSPazzQ4hzIk1J/+fs5wA0HHuwnE3Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6325.namprd11.prod.outlook.com (2603:10b6:8:cf::11) by
 CY8PR11MB7825.namprd11.prod.outlook.com (2603:10b6:930:71::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.25; Fri, 17 Apr 2026 13:30:17 +0000
Received: from DS0PR11MB6325.namprd11.prod.outlook.com
 ([fe80::5c86:6882:c257:cc28]) by DS0PR11MB6325.namprd11.prod.outlook.com
 ([fe80::5c86:6882:c257:cc28%4]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 13:30:17 +0000
From: Kang Wenlin <wenlin.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-xfce][PATCH] xfce4-screensaver: add dependencies libpam and systemd
Date: Fri, 17 Apr 2026 21:30:04 +0800
Message-ID: <20260417133004.3770849-1-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0212.apcprd06.prod.outlook.com
 (2603:1096:4:68::20) To DS0PR11MB6325.namprd11.prod.outlook.com
 (2603:10b6:8:cf::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6325:EE_|CY8PR11MB7825:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f1c0966-842c-4b7a-e3cb-08de9c857719
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	SuXN6ZHMqIVoPkvdb0MdBSGxW1yZTTTQQTvojaTkYXkkiAqann6vqLHMnfvy0BzZyyDk82go1+BOsUDZktu9mhWIiQTGMuMW0f0BWsOXv735hl1UagOCNNZzQUgtky7oKXBzPKBc2roKQmfBoTFl1jaakbX5gSckxBEbUHM5vrLefVRzEuMdiw/tYX4ezlmimPpnoai7AMqimHNLOYDj7wyDlWbXgmNn8mZJoqUukiQifXcyeWG8BlWRBakqdq/sVnxhXPc97By98KfAd8DqmdW84l2xJlBzPGePMPxeuQ6urC93X+t7eev4Fvjbrfi7xnfLyI/I7fKGNP3+T4+s742ghFe2nV7gXrb5ptCOghpH+4OqwXPMTHtRtzab1paqQnX8u5OP7oU4zi8bQyFevxAZCNfUWN2PVrRrUfe3TVtv8z73t7p7uocEx+Nzr/EMm1DMXmkYkFCm/tlx9J6IcUjuqmJ249XwtJgljNzc3idnrNf7BRP1N/czRZMJ4zVWhuZuXp0sjf8Djjudcd4/xcAOlXOhchkfusBl8V3lE2W10ubziMx+bBp6l/8tw4+z5HJyRQTsE6rHA/O+0L+CEmXqv1fLrWMgn62Gk9mxljk9JHZTkz6VuMBdPwMktyQ/T5xMEoi6Fn6gNgPybq5u0yO4tJl0H0WDbpIXLjXtWnE37NApCaPXf46EFHZB2y5rHmPw1VliZIT8/8KpV9cYamnRBGJf1rKLAEvix3EP2gYpfdyLwD3vS+fKcIuUDE3zu/Humh5qbLWKRpZZdOaKmvQP46QKrJGbl+7xglVtDJs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6325.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5f9N9+BP2oI1Fcy1oS460DBcV13PN+nV7KD4MTY+FQnvitPXUSWVZWSOu6I7?=
 =?us-ascii?Q?exCmTxqKKg2kbDWumAsIv2svo6rcARVvmhQIUP+YsPxxcpNMo3GP6ySXs9o6?=
 =?us-ascii?Q?J/wA3ll+7lqrEkYSnc0XHiOD6tXt4p3pi+B2UJ4E0vlKzlgCRaKHPPkukq5d?=
 =?us-ascii?Q?Sw/cUL4Y59j0tBkl2/3iaPeLz3phrabnKld7zppT52ihdoAf5MjdZM12McWw?=
 =?us-ascii?Q?aKjFGq39UgDqRtPh3XdqEtApAjjNKBK7yDVvMbdbnixucIrj+xYlg5zXmEXb?=
 =?us-ascii?Q?nOWKQIDqfS+HMpNs2EH0ywelvCEJ0XEAkJx9lgcw0d5MkGvhAOQqKACo/SCT?=
 =?us-ascii?Q?Aaq+I54exl9umM0Wk7+pRgkGPifRYzeVkTqgPUSC8e4xzHhCE6PqufAAkTI4?=
 =?us-ascii?Q?hJHc0F55seHPSm6wL48FuW/JUWWsMp9x6x/sKYdGIN9GDhIHFHWkV8t+Z7eT?=
 =?us-ascii?Q?q5PCiTeCSbAR8HaSzKW+MuUhPiKonYwySQeMLSvJS39jjCkiTfqUtnXzkkxP?=
 =?us-ascii?Q?NTWo/X7nwUSKSsdnkcuAdryPCxMsNRhbRlQVPVpzfaYRqx/yaKoUBaCEdvF8?=
 =?us-ascii?Q?NEkDLb6yMD+1/iK/8bqkh2L1kS2MvAb0gdtKx9FZxmr0TdC56APldwK/tb+2?=
 =?us-ascii?Q?KycVwRzZv4i8ImNTiPpjYEZLY/hE0I0dWzfwe3YG2oHueanDqXCzdvQm4a/Q?=
 =?us-ascii?Q?KGe8eRqYCp2FTfHtjQBdgvVEMhF0G1/Xc8vBebdwUUC4vl33v3hQFWnqGyXC?=
 =?us-ascii?Q?IbFycusVGvLE7wWcMOV4W7NQf1r+tWNVneMd1JPmulCUdvsecrHbjdJp7CKE?=
 =?us-ascii?Q?jZ0+C4j1nFmg7J95lzoR98tdue+MesO+H0Se/Wk8g8mVB1pgrqk+t7+1vTcp?=
 =?us-ascii?Q?giExn+RMbb74LMSAALnUrJ8Rd23XmP5xIRCtXxdDp/71mKOGjY5kencPFk5L?=
 =?us-ascii?Q?/jtJoUu7MxWQk22MzFmj0Boh8tFlLcSfZP4YOMuTwHNdlOZO/gnf7RwIztPs?=
 =?us-ascii?Q?DYIAAYCXBBDA/isRxbnrbutJ2olxnq0HuCWB7E8x0qJJ/oVp+IgNbufZ9Px2?=
 =?us-ascii?Q?I0Wia87vJvapjbQJg1C8ziWz0rIX2Hu9I56YzLjY5CnN6fKUC1EZxJUgr5fu?=
 =?us-ascii?Q?dX/hyWbT24EaQs8w+z+eujrt/AxdbaLUDXew924EyKelVbzkxOQUEXxZZ+ht?=
 =?us-ascii?Q?/clXk8wQrN1HggVEUBw9Ex1brvyhdG1jCiMBs6+9U7LwlvAW+lyE9mvxk7mE?=
 =?us-ascii?Q?GHLcjur9ix+m5jlUTmW6S7K2kOisVOF98iMmPVq0sTNFrp6FACEzSb5tpF/m?=
 =?us-ascii?Q?yqmozfFGuilgH6Tv1qdu48efVFaSDv8hy+sCSCLH9ZphVPU0LG9AwR4OL5Va?=
 =?us-ascii?Q?xjwRcMQ5zHORnLXIUfmMIA2oo9PvN/El8XGns7J+kxIqtB1jmAsz3Q3h2hzA?=
 =?us-ascii?Q?JlVQeLHjKa8qTC3noDEdQ8S+yJz1qdK71nlbzyFJ9uXrALquW0zw1KUNNqSo?=
 =?us-ascii?Q?9Nkk2sWZB7I6x/biaNl0q659JoUl0r/yE0Sqfe8xO7+velMrVAmAIvZhtd37?=
 =?us-ascii?Q?4RRfDD7G2aCBduZ3+vg3epXZ3+MCrJGiQzZq7gARTwJdNUaiTC6PLIXpBK1J?=
 =?us-ascii?Q?q9nH7rEK7jIHmThuV9Pi6jmIBYSd0fZsc/PYs37PFY7ZxGHJvviDrJiIOp/F?=
 =?us-ascii?Q?Er5Zue6FB6D5okrXP7OPFvhn6oscJjzAsrAQlwQsBvj/hbkqHyfoV9GgiEYo?=
 =?us-ascii?Q?JabZTdNwM49CKMgAIfc1Oi9DPfnBP1c=3D?=
X-Exchange-RoutingPolicyChecked: 
	qLLDdJIP7QzEuzMgJrk6WfqTy1qLceAchcS1VWzVAXGiuOn41hI6PtKj7wntqk6a++SyBAGtYMU/ipVJiE8o86vC4Lb47moiZIGrSN9pvRaX/StWNOTfArNeOnaYriOeMC4joCoUzO4jCTFf6xRUHFYyhWuX2Y4WDCE0Rt71F5V28ahhGfhPfdm+ub++0SDx1xPIv703RENSHfQDJrWKH0/ybaGzXshUcvNkIQBp2Z5juUrvEXGxxTlVkxztY342ZxV+2mxb3mnOd6+j5uqRbd3PSy+bfnUMERioH2F8iVjEX5ZteeD+VZF2tICcRDG4mmWgkOU7NoPjcTFSGxU2lQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1c0966-842c-4b7a-e3cb-08de9c857719
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6325.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 13:30:17.8060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IK209FAd1AxtUlZgnwLFY1QTdIM3Iri3Ptir32PXQ48NyiBAjN+T6qAw4IrxFtodzIsZ+MMhyTXzWo41EurQIZlsHOgsb53VSB6cfSLUsNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7825
X-Authority-Analysis: v=2.4 cv=Q5riJY2a c=1 sm=1 tr=0 ts=69e235ec cx=c_pps
 a=bIHOvEVewOWTfzx0yc51bg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=B9blQSNkFW1w8koaVrQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 9LirpaV7dlrDIcgI8rALc_9QZo35A2Up
X-Proofpoint-ORIG-GUID: 9LirpaV7dlrDIcgI8rALc_9QZo35A2Up
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDEzNSBTYWx0ZWRfX/0QRNttwuVl3
 OMS7UtOjsHUETT+w+8A+ENb5LkL+35zgYI8rFqNFscZ15wJ4oKA0KJA5NmmrFE1JR10B6Tq0j8L
 /7BY4KfKsRcSO+lZz9HLke8rnaVTlBRlkHNYvgYzsRYQmNqjlbwTtsC2FITdLhmrjvhFG2tv+TO
 YmsrJGZoiRp3NTScUUHLzYjmTKQ2r/0lq+GdlouuqRlxxz0wIpHoBRAW2A+/HRi8K5a1FnNhVul
 tVgqSSiiu/xrS6kFMXF50OK1qxXP8+SzSnD1u1cEX4cX2QSNHMfyePQE8r7ML46u1Matw1/8tVF
 eD5yZEkpj7g/srgsoMVtDy09zXaiHPt7PqVP4aJ6VT/1e1rrgULUps7gdPOyqEPmGBkyIpvWEpc
 C1Fql7tMK61S3YDMpsE4OYrVgrAGN1S9uOu46R7xrFIb2kv1a2nDMZLaAC4YxJAEl/2vnELxC3a
 AqBsTEsnF2KlCpEFfyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170135
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 13:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126438

From: Wenlin Kang <wenlin.kang@windriver.com>

The meson_options.txt sets authentication-scheme to 'pam' and
session-manager to 'systemd' by default, which requires libpam
and systemd at build time. Add them to DEPENDS to fix the
configuration failures:

../sources/xfce4-screensaver-4.20.2/meson.build:167:20: ERROR: C shared or static library 'pam' not found
../sources/xfce4-screensaver-4.20.2/meson.build:265:26: ERROR: Dependency "libsystemd" not found, tried pkgconfig

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 .../recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
index 2033eb082f..b95bfc170c 100644
--- a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 XFCE_COMPRESS_TYPE = "xz"
 XFCEBASEBUILDCLASS = "meson"
 
-DEPENDS = "dbus-glib garcon gtk+3 libxklavier libxscrnsaver virtual/libx11 xfconf libwnck3"
+DEPENDS = "dbus-glib garcon gtk+3 libxklavier libxscrnsaver virtual/libx11 xfconf libwnck3 libpam systemd"
 
 inherit xfce-app
 
-- 
2.43.0


