Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D3FED7B82
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 07:55:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13677.1776153344810368680
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 00:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jYUrmOBn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=85647f3f2e=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E4rPj31795353
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 07:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=75oSs+/mb2t2hFOJZC9DUB6QNkE7n4ZzBeWD/Hj4pV4=; b=jYUrmOBnnh1q
	ii2JI8ZeRe2f2cINs8YSYUXeBU4kw+Jw2BGoD5XwnaigRfYqBxfEbCmPmynCG/8i
	OEvj/dW9+LEIIMS2YmRG+tyRPl0WYmppvDDIEytUtkr+bR9SOFWo9dj4Mk1vAq9S
	zCW62W0CljhXBT3bKoQAHP4A2qkM7E7XqNyIwaN0Tn5jdsFJ/aGKTmyp+ccZWkUa
	Pl/3ogY81lOzsaeYu1LSY5wZagphyxPm2/ZGhiPHWu/B9trKDNAMllye2OHiO0Sr
	0px5wP5N5iLCf4bE5cEXwh6kwNzWntSuwLgiSpdhwLONIt2OFlkKbRdE86+rOhzr
	kFiiDDruLQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012049.outbound.protection.outlook.com [40.93.195.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh877gekt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 07:55:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C18cDNU4m563rZR1LFhuPClMwovkImZibTJrzgdlXNlfoSL20hcRbZjcrbYZAxtsKCEuup6lIvJ20Dz6IWdMEW6N6CgA3qOonUMSYunfZ+ON9ePUwszVMzJ/lb4/TeSkUY+wW/HJ6UCtLsrbp+RcJIM4d7gJF1g25iNMn33O4IoGpDd414tOfWxWRhIKthRxLcEYSlrBWouoPlw7koQAH7Viua+6nQC5szJFyMtS2Jss5kNHKjP17ZIw6Y1zz/tVirSjppqanBUMUby14P1miorfP8c3bkjRQnHI8Vvx2NwFJ7glpzvFD1nsvZqecKz2nMNTMTSHlRXa626cYn0/7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75oSs+/mb2t2hFOJZC9DUB6QNkE7n4ZzBeWD/Hj4pV4=;
 b=X8Bt5cFRc5W9/CXW3VLG0SnkdQL5dWVTMp9ZhBiIDjwjAIn0G9snp3gw0+UY6ShT6i9yDQcnNuarig3yCvwb9twv/hfpiyiJOX2SBAE493hKIjp8yGZBJodRS6VosS6EL8/HaWGFlrrjav5NI3+JaqmJvhljb9jp/sdDWzbtrxRabqszsvjvVUiDZ1OJECEcz+PoI8Wve4dQfzkHRBnK2BQAAzrjWDJ+Zx3IGzmRz4xUSlQIubueGPMNxTnXV7w6qEroiE4/Hy4HvwNnXsyUWQL8sLWgBksXcuJkMDcdt2VYJbloAjUd9YW9aL9cVtBgtYutN3Dbo3RGJbyNjPdIXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by LVUPR11MB9786.namprd11.prod.outlook.com (2603:10b6:408:39c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 07:55:42 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 07:55:42 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 3/7] xfce4-pulseaudio-plugin: remove x11 from REQUIRED_DISTRO_FEATURES
Date: Tue, 14 Apr 2026 15:55:17 +0800
Message-Id: <20260414075521.91846-3-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260414075521.91846-1-changqing.li@windriver.com>
References: <20260414075521.91846-1-changqing.li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0092.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c2::9) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|LVUPR11MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b9bce77-e9f2-4540-c2af-08de99fb3a08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	XVA3Gn0x19AaxArHgA+6uqkMtdKcg7LVH30FPt8wPMnbHmnDjkTtQl9fn4PV8JDW94v7FyhZo6IojjCeGK1E/PJEg4L9NuvW+EGLQXh+NWWMZiRN2G8wlEMwWNlTwUEejN2OBlzCUDPVC4LtD0nQh/m56BkX/SW1LkXdHIOFmSIpQ6s0mxMmSeVleOQxaU/ASbvYYqBv7HpAilZh2MPAsbLBM9TmOOYBc/VdnSTQCs01SakJrgMRXGxc4ZQRjjnCEX0GEAb3Wrz8e2H0prIo02wQNO2ZTe8pJ8NWnS6xvKIZH0BkXEK5dGXXJTeqA98y4UfmCfJ6Kkw1fl4vcWl5teHahqNpcCB6btQIGHJKfxdDyXoRyF2w3nJOLjjW5mplWAEGlKZntT/p8RB++5cybCPc6O+f590vip4OgUKQm602p1rlbbZWbGTy0yMPixc1emS9f6wusmM/qJzDrlYLw5jHc3tWQT8S/fdBtNIiRfQ/54Vf9snvSnYivOlwrnecHALj0bbnose0crKVmW9k47hiykk7dyJTmTBZ7Y4FcGmH3frDfCBGemmgc4Mi/DRNkJGIaAJV54v0pDHj6cat57n095p04HqYdKJoVLCQHd8F48m6lklLy3JAckwbYKaOaRV3HKMMO+Leagz/B6iCew3TDoHmzV5ZmTmq4ORXrZS9AO3NJ1zlIvnTgF9fvGXOCcl/vWcoB4ph27WmD+I/h8QwPZnDzZrXwLAZ5QPhDtfTNhQFB0KnmZgVRyQXPOk2sdPiiCcLthAbEjQ45YmhjVScvTY8tA9nu3E+6papmtQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fBntsigJKQglFCXg5kXzSOSmKJJ8vVIcjPB6wjLl/NZLqcV0chG1+GdTXwhS?=
 =?us-ascii?Q?o0MoFutQhIhW+NZHx82dhYq5bcloSgLgTSf9Y+u1GT+8fdYfcUzh5QX/4Ia+?=
 =?us-ascii?Q?CWHV2kHHAPM3nN5eww2rHSpYnLoYlcOokuTwuQ4g2AJWAHeysfS8SzIIbkCT?=
 =?us-ascii?Q?sgHO/yIlBZQxSUvnL86TJJQFqLCf6B8vjZHtPcGo6paaObdsi6hFuCPzRn9j?=
 =?us-ascii?Q?bYPAO7UkuyAyHl6aRe2s2L9NDfRjN5p1hHfqg+Q+TyDP+/3ax83U+hOI+Ces?=
 =?us-ascii?Q?JATwoESkyUXMejiW9j51QIV9258k014/sN0WY2PzQrOoagFDJfzDTWGyyEUT?=
 =?us-ascii?Q?bEYl7vTE70t7Hfkm9c79L48ltxJsCm0WNsN6k1X9jRP9WXDz8NZRvXdXVSqL?=
 =?us-ascii?Q?/6TN37PkX3pbkqB7J0A5p+VUShJMWb+HS87BwPrae4rajj1c52JYUk0NTeM+?=
 =?us-ascii?Q?YdR/wPqSPAzp3unedJV5wfZaf05lV3S/dpn6DaDxbtIClYi/3lF6W6XbkqFe?=
 =?us-ascii?Q?9MNLgENwowcgoPc14BXv2s6nWlCYHwlZHjbyCJF5A1ZcabOntTBrEQ861mlZ?=
 =?us-ascii?Q?0sTLYMq2Jx4UxeeBSNwtP+aF340E3jR/23hJeX/dscMqCrxpVL2+0QZKEcwh?=
 =?us-ascii?Q?WUPTGiEhfWuFEMYISdXYcMPegyNov2Ng/OBp5cV8tgVtFGF39RpSs6HZUfhl?=
 =?us-ascii?Q?5RFjw6Uno2ggoTeS6iyEUZwoQBemoGnw5rWjFDA9UCiNmA73wj2FPllRlFhE?=
 =?us-ascii?Q?ELYg/loDSUr9bcxWYk7A3INqJDlv/+VQEuashg6mCPe3v1d6D1ABozUJj7IK?=
 =?us-ascii?Q?5E+4wBn/PPQ0ay1sv03ql4bwVJqyryI3wmujFxPlwdDPq1SwVZ/Rw6XgBXnV?=
 =?us-ascii?Q?C29ET97U7ezp2ncTR96OitnrdIgvAwlNUD7VowcHLHX8jDqsW3tiAOPNzC3N?=
 =?us-ascii?Q?j/fDCXlXXp5eaBAOTxVbJj0KqvKeMl3s+jB+ZLapsD4qas1eu/yDNLt/EtIT?=
 =?us-ascii?Q?lQSZgqEDmAWw/BoU0yQJBEzKS5+IVCLfcctMUoj+G3qGiZP3KYB2lCmVzPSC?=
 =?us-ascii?Q?rSMZ0vfjZoPHB0CNWORio6P2net0pBXAjhHO1NZ1PPhC10TgaxON+tuNiGr6?=
 =?us-ascii?Q?MgIexoo+KSTK+6ZTbvdUxjrCajmV4B09NPThOENLSqOyb8uyGF1LyWq/y/3n?=
 =?us-ascii?Q?iURKTSxd3KIB1UBu4j/8ivmaPbitxG06qoTCrPlCktZPW9hAKHHR9FVeBiAK?=
 =?us-ascii?Q?PC7AcjHx1omoZvwXG2vnEygdDdqu7KSFH8MTouZNOa3xZvRztvEl8nWGgVZD?=
 =?us-ascii?Q?1vsx9ZSjbTSRJ2RSG3+j8S0MDGQWVJsybOhMuF8wVazm8HEO0+k3/xr4EtSW?=
 =?us-ascii?Q?+62KrnjKvFwXPBI6fxAhSJtYNzQRx23eV23/oLn9hfVCzKi71z8nXenPWvpt?=
 =?us-ascii?Q?QUT5L8mCbO60cI8WrJom7uErab64rITftSAQGshm/SiBWMCGh3KVIUmgDp0A?=
 =?us-ascii?Q?ccg578KtIiu3LD8p9LQoS5Tc4RQv5yhdtJgIn8e878Ed4oPnDNhP5DRKN3a0?=
 =?us-ascii?Q?ecow9imx8Zbcua7d8smtNMERNDSlYzBrEifDnx97fkXapOeFmdZqOjOTtyaN?=
 =?us-ascii?Q?bmLJvzpr6v60NlcyGHolypy9Kbjz4RLVVQOQX7AVfwGImMzUSAsThgEumGnA?=
 =?us-ascii?Q?iGdmGYy1a5rIMRjQ37+Ldmj0IGitfsUpL0RUQdK3nijYZZvqEi/Za+xLs5qN?=
 =?us-ascii?Q?f+6I6zJzOE5ZG42ev3tRSZru8UlCHyA=3D?=
X-Exchange-RoutingPolicyChecked: 
	pOf2Cr3cSgkXaM8XyjKchs47XgVvl86anMsWerLicn6lKbl0XUgOGTqae6MoU7e20RvyPqbgV40eKf0V17PiJz2TEgxSvyZQuAKjR4KUx/1KfrMv/jOFs2KgLuqTUWMkadxa7XZn+YmgtRgmdEiDapsYiIV8Aat5Ekp/QbIESVcCGTwgxxxuUZcUHLH2gbc5vV+icsAMt3HvLpZrI4sR6V2LghKuvS/LxqSNwY9Rn+1CnyWzcew7BxvmmZ5R7JLYCfVddg83LpVpQVzlEi5tvqB9HTSOTiETXVUcQe0viBrX4ZM+nbE8eWuYy1nLIqG40DoLolou7YtLVtRw+e4OEw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9bce77-e9f2-4540-c2af-08de99fb3a08
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 07:55:42.5684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPmg6uwv9KyksYydoXdsh65ZJwcfatbcbr8h0FifyKyMhYw+rq27A1rDz+0x1HjSmDBs7xxnfhk0pxumVSSJ3FXT0dPiVq1pkX5XwxPXe6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9786
X-Proofpoint-ORIG-GUID: NGGhrq7spbNvOFOfN39cEFrSNRiaKNDY
X-Authority-Analysis: v=2.4 cv=ZtHd7d7G c=1 sm=1 tr=0 ts=69ddf2ff cx=c_pps
 a=nvwb1BjkeYK3HDx+lqLWkw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=s--Z1-01E1JoBneAJaoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: NGGhrq7spbNvOFOfN39cEFrSNRiaKNDY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3MiBTYWx0ZWRfX4J+DjNNOGQiu
 9Z7J0N7lNlh/5Hp1CHAcJs6zjvTqL5I4kXoOf2nNgDvovG+sxfqZudhiCAEMyrQv8yzVVINO5Ic
 6gfFRV8U/1YCSZRVNcav7GkvTLlfsKpxhW0FALIbnrQmjMWLnetVap4pUZ7CfL8v+VWHYmSdqSi
 g6i8OmYdh9MeVtav6o3ft/DlJIyiUyd6Qf5frWq1LlNAbUqbY3xO7U3DfHLZfK6oJqgOucGlh+s
 FDUdmheqCuXAsu4vqXRmwG4bpkeF7WpjozBpxgGOPyl08Ub+SFER+7BULn7oywtQkoVOV76+4mS
 CdJCu4fIlx0auYhJKJE3GTCos2nlvFVFKyGIHtr582LDIWbbGo+Te1FukIOlLrum4zbxmoSjASV
 NAtcjUqppCUJD0Px8cnf5R0PHMQ5nfJzkyAC51qXfEKwZx0EAo9yCeigubDHGv69hfSoLlhVly1
 eo1dzqgnCYFHIm5CUCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 07:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126299

We add x11 into REQUIRED_DISTRO_FEATURES because one of the dependency
pavucontrol requires x11, now, pavucontrol doesn't require x11, so
remove x11 from REQUIRED_DISTRO_FEATURES

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../pulseaudio/xfce4-pulseaudio-plugin_0.5.1.bb                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.5.1.bb b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.5.1.bb
index 4f823c67b5..2fa76351a4 100644
--- a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.5.1.bb
+++ b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.5.1.bb
@@ -7,7 +7,7 @@ XFCE_COMPRESS_TYPE = "xz"
 
 inherit xfce-panel-plugin features_check
 
-REQUIRED_DISTRO_FEATURES = "pulseaudio ${@bb.utils.contains_any('DISTRO_FEATURES', 'opengl vulkan', 'x11', '', d)}"
+REQUIRED_DISTRO_FEATURES = "pulseaudio"
 
 DEPENDS += "dbus-glib pulseaudio"
 
-- 
2.34.1


