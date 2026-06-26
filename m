Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1904CD4F26
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 11:42:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33164.1782474120007895887
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2026 04:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Od0BAknN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=063731df1b=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q9uqvI3489980
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 04:41:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=EnqpLb940wsMTZ3rZ/eYtAfQh8gw6o60RvrLxkuGWE4=; b=
	Od0BAknN9l6BOeSQHLwa2kdJ9DValxJHJK2/th+LJeFkQu90fB3HcLDF4smCsQ0p
	aXgrcloYVS3gH5RppwiegUFEgbCx0VjIayOLrPvw1sK1eJKDXRYSwvfab2fFib7K
	c4zw+/XeszJAFKRmbJaHJYEB0Z9T14cL0w7C0oJRxcqMN+5kBm7+U30/c+cSn1M6
	OA3zwNOFmnFVRs2fyEQp4HhB3ZGeFc3g2p8ft3moZdii05zpCyLy2GgPT9f+9Orl
	rojLph+3rkN+9+1VP30A8nXlnDlyoVbZETXbIWIczxIniunRd5eqrzRjTaeKfBSO
	Z5RKaO7/aX5TUkJ1j5iJ9w==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010043.outbound.protection.outlook.com [52.101.201.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f1exk8hkm-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 04:41:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADLXqVsdLQOlouI6Uel9WPZVmVZqeKyaajgfTFHsbHKVbFo9IqgBVvVhoLAl22dIRwOm2CNEQbXYx3Il2JkbjFhWjeuZPOhtR5M2CG3TFapT8yhU3mJ4f5VRzX8mzFsK20XfZb+P1XHx7uOu5CE+AKCdRewSDKSoKDEXQyIXSeOgd7svXLNbRGYmiMaDM2otEHJoDdwdn7EVhPy2om2QjzrCSi1XYrbYFihGuzUs4D1pjSTo6D10XWtsqEouoLgpzNQaPSfEvIagGpwsqVa9WAhRZ46NBFvsHB5ePXn98QYWUFUpM2QkLJ6S0bMSNkLSE+9UoyB9sEHss1IGEJjnBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnqpLb940wsMTZ3rZ/eYtAfQh8gw6o60RvrLxkuGWE4=;
 b=itF35I7ucbxs/eFvSRn1YkZjgdgP8QaVAU8/cb5hhX65gWKQjr7q2LyGh9jdhydJLi+fWUM3wujKkJ1J6eOyaub5n94IR8EAFzbDq5LKsmWms5F5/WJYarx4aX9eF8FUC/2jv3pYBd14RfKuvQvcRqPtfcOXHgk01ItG3Ebim1PUJQttr/CMgxJZGuheBUfy4TJwScz8aKgZiOAu2MO5Z3HqjOZwZyEzACC+VmIfOjgpbPnUcxAD1Vr01tK+mPPb/LWgIrd4LCeP3IIKiFEcodLaMRKDjRSapW4y+KzdaIwfj/09PN0ntqhG9I5h1XN27odEA7e970SkoCO1K2vD5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 SA2PR11MB4780.namprd11.prod.outlook.com (2603:10b6:806:11d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Fri, 26 Jun
 2026 11:41:58 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0159.018; Fri, 26 Jun 2026
 11:41:57 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [meta-networking][PATCH 2/2] lftp: add zsh completion subpackage
Date: Fri, 26 Jun 2026 04:41:33 -0700
Message-ID: <20260626114133.3486742-2-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260626114133.3486742-1-Hemanth.KumarMD@windriver.com>
References: <20260626114133.3486742-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0198.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::23) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|SA2PR11MB4780:EE_
X-MS-Office365-Filtering-Correlation-Id: 74fbc628-5b99-438a-c229-08ded377ed95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|52116014|376014|366016|56012099006|11063799006|18002099003|6133799003|38350700014|22082099003;
X-Microsoft-Antispam-Message-Info: 
	hljxVeuCWqXixVg2FBd1vr1LyUGjac0+kXCdHZck4PJyQwAEObfpMIAOHIIX8izifboX7yCpjZOQAH6QhahJSnbCDfAGlnsY7wwhxpK01G0WG9RMTtatsPZlk8S74SumjxH3mT2UPfNo11YXwXYcKM0iSTJMiCs9+EFvcitnzNXM4a14TUl6mxCAx3iGLw/YGNKVBQA/dtAd4CO2IGqWNoZb+Do3kBAxvEGgQyOUD270pxaZZ6fQhYTrkIKhQCUIbGRYkaaweqLBjHXp5c5S5QY2/pls4feZzKtNCiUgGryNodwydfgukjB3nfg4mvlgjQTuqJLT6cvGcjI5vshy48jBvcMzTSSxS2OdJpT8Sxr67noJ/k0MUoJOY67LtS6YLsi1FTmBiocvncGf33qku9nj/CVZTpHl0f+OIHL6d51Cc407vZlGWVJV++UtRPhz5Rh+oa6f9lsE/WprIICj+Ry2+mzrTypYMAoXPdm/Y8j81yvzVKnDSwjfZ0XlS4llFJvWqvFw2wjp6MY3jzDBy5RPAiPc2QLeBW+viVeBNQJMSm+IgFKMgOQ3Ewa5YjMqy6dpM5qMh7+pYQ6WL3rRd5qKcU2QGfj6Vrty0Q3pJIBHpVU/UqxkjeOV/kGRMWiEutGrtg3BvXQM7jwRZzjeLMW087f8LgBwoOcLzWT1VfX4GcBhsvPZPWxb1LXi1L8JJXy2Px4VTwTHpm4t2BlH5CurHw4Sd98sSr5q3OKvI2s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(52116014)(376014)(366016)(56012099006)(11063799006)(18002099003)(6133799003)(38350700014)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IV6QErkc8tvCyGIFBum+KUeO176KQUZ8lVdedwRICbhZ+ISbJZqgSQXHYN4Q?=
 =?us-ascii?Q?WPE+3CIbjJfdN18zxytYzG/Kj+aVG1UpNrCNdnUchm4jzoeH7Lk4xaFjVYq0?=
 =?us-ascii?Q?16UhCw88mRzgYCJzQumPvf4NwlUOTquQBWmua/hZ5TwjeNg+zGlnaIVUib8l?=
 =?us-ascii?Q?9MmNicPKVt8EovfUU8WcdCrZJINfJ49OE8uVbm17pU2k2X47XrvtjrAuzPil?=
 =?us-ascii?Q?qL0COTDnDJdFmDVKfqBdU7m35eDxbHjmTk97fAcQnj2D+K9kb5CPHatGWGSs?=
 =?us-ascii?Q?/Zxae2NPIaVMFjv50vhTgBGb0dxenFO2kGYpAoRoO0k53+2o3raB6deUlGjp?=
 =?us-ascii?Q?iYihgGag9ehgx+ZWc8/lXPTggPEbK0NvSeUO+E5VoXRMAENbm3oClsluDdmh?=
 =?us-ascii?Q?3VCURCRqvEDmCqV92SE1V4hAz3PohwbT9CG02v3gaAlAS+8AKYvBGqSWEen9?=
 =?us-ascii?Q?Tj4ioFTJEm+y+pkk3mtInJoczsoOuH+1ythNhOezi6gWwzmfjVxdfgn4TxmB?=
 =?us-ascii?Q?UJ754vZxHPxp9JHE4UX56L1iF7n2Q3nYsn5xnHiRLV7EmENwiKTP9zEN9mff?=
 =?us-ascii?Q?6oSnoGPhKuR658fKwzlNrL6sqzA2kedwZyunC2ALJ/VOgTjwgP0RB0ym5BbR?=
 =?us-ascii?Q?PzC+nPrEAe3keJhSwUT4wnrnKLCifLImQ9Fl9v+dJxM1YNNU/JJduATGx1lZ?=
 =?us-ascii?Q?vNA4esJq1ZXcPmOwDUgX/javB8GDT+CM3lnnL7L6H9yMUF5PMbe/bQECOs80?=
 =?us-ascii?Q?Vj9XFZT0vorx1GQXk9BpeOjg7vPnHCCEVofp584IZUZmg5S6TYWsREDLBveB?=
 =?us-ascii?Q?OhWgRasJcjW62iR2zaBBaTatXRpLwfytwTCGJ99IBfGFT32Cxk8P1KUPLCk0?=
 =?us-ascii?Q?2oLE+UZgXUd+ELVZROaUGTgyIJSFvIu1JvZbQXWQ/c5ErJvS5dsrlffWVh35?=
 =?us-ascii?Q?fbqHOVQnluXCNEM1JYeGGpCQWrO2oGY59EmXBRYFqH0+zTP9pg7rOzTlK37B?=
 =?us-ascii?Q?aJ1G0UxjPvpgFVVmvExP4KshZ1WMCRKsX+o9lK+um/3ATB2FrfUiaaCPmx5B?=
 =?us-ascii?Q?tkE9sbRB6CZRnuLMDT97UTORZKUMdTC+Ha3aVbDT9p3+4lqhogdqY6awEpGL?=
 =?us-ascii?Q?GsgUzD0k0U0iCj+Dbc56z8R3EN7S+S50EpqepKn4KAAn5p0REhWc9oiaboLq?=
 =?us-ascii?Q?0vPcnyB4GaJvRTHlOgGIjIplzpBSdo0O+wj7mfTneOUHuvuexmQRbVjep6XF?=
 =?us-ascii?Q?7VmeeEprexTOzSXoWUNewSvRp64zP2IYN5EqJyBHX4EPBACRN4Gv91NyBsBM?=
 =?us-ascii?Q?G9rTqbUjdxwSR74Y0nhRjiDigi6idJPrfa621NX3A/nrGj6VMS9LjH2nIPBD?=
 =?us-ascii?Q?b51YAIaYHbv3UU6xEwoRZ+POMjhak1wKJ3q5lrI9aMswrlIiLoiq+zf0++/e?=
 =?us-ascii?Q?YtTAp1QXtJuyK73wPLxrZO21mRHPtnAM8OxvcDzaieA7xetwClP0UncNnXto?=
 =?us-ascii?Q?o9RTa4dcF6bA5zOkux3dN6PjRSj2xN8wXtN/9wxOgsDhat7Z47xVPg5n+hNL?=
 =?us-ascii?Q?1PLioNOksBarnDSKgmm8sr8epaFxqFjXXeQ66ng1Ki36FXEv19xV0ya0hAM1?=
 =?us-ascii?Q?10xA4Gv4H+w+3P0qybhg201qUoqJqciNIGRRPflX81LfTa/ALO/vMSipeEbm?=
 =?us-ascii?Q?VQEk/l+ulPZHfMsxu4we8b+Elk+T10BRvzYIt96kNJwsf4oPC8JvAcRHlgPO?=
 =?us-ascii?Q?qna9+aude2lu0+SveqoGivK0KcOuf4s=3D?=
X-Exchange-RoutingPolicyChecked: 
	G08cl+Gg9aG68zKmw2YjkIcT2KCl5bwTxu85uHYdDR/XmRASGYdEdjZCh7nyAEAleuRgAhhJ54qQG51DCgBwtpCvLBoBqJc8zHfv/UPT/osj1ANs03o4pp9wcXG/vHrb6rGII5UCRvmdJLf9DM1cEK7iPYSLHynnuqKBpQKzh0oiuI3yGXscZ+LRWe4gFaUoaTb3Q9fhzh7amftyseAnTyk0933IhV668JNzem0mH3cWX43IYrGL+BVINVFM5F4w98S4vZvEy4c79qhXNNNVijv1E0HoouSdpEpFb2EuN+ro0jhFdX9J62K8r544GN6A0MgakbP0o9aFGDB0MiyOSw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74fbc628-5b99-438a-c229-08ded377ed95
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 11:41:57.5358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBJ25MoP5PQwBYFGtIrrklikRD6zvXVIZ3k5REqAgNWo4zIQTn7hvOvwF+pZp6iaQjTdzsSM1XV/bb2k5sUr6caQDqUUAfb0NLJw/DBlZxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4780
X-Proofpoint-ORIG-GUID: fZqJ1xPNWsolah7_OOojaiFFd_mXDnlm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5NSBTYWx0ZWRfX9q0SNKFThOfG
 LRuEos+uAvOJeLaR+RtHl7uWbCS9HfPKQf9KZCfZLvu6jzC0StB5SQogtlVaN+SJtPauyNFAphE
 2a4lsDm0b9g2hsFtRFodTF9WMQnoOMDNwFDMX6vuZGHDAZ8JK4nd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5NSBTYWx0ZWRfX3mbe3rLxsuAx
 K/Qn9NELDKeR3w5i8IjVOIq8UPVst4RLfPHb6A6Qyw0JBX0X6vWq04hwmXA3jjwGAQSJsjvkFM0
 wU/bqqsH5Iz3ZMuNpl74Rt+6s/veyZc4wt7ekQPVG/XOeoaZxNsxi4l4PC2AJa2sjV1YjO7z47d
 CyHvkqXcTcyThTulSbXSpJn1CA0RRZYXw8iMZ8hu6NPh7H9944oxCdgEaCaurNpHBpFGFXUih4C
 6Nw7Cl1R957EG9+rZqAu9vFx7LU9hHcNNf2eSeiHPoOvPAcKC8pkoI3SmIZ6rjfFrWONjDfnFYH
 5SS+S/fnPQhF0p4SOSyCl0FBZLQxYM669tTtHwM4GkvD85EhPIY7f1/kfpElwtenwiU5s/saul+
 /Vlb6U1pURczCrY/V9adCs78lDVSQtai6C9PBD4e+vblLrt5YjOKLCY7KZliVWhn7ZIH1CMkEFh
 gdsx4hv/MrxfntNnTeA==
X-Proofpoint-GUID: fZqJ1xPNWsolah7_OOojaiFFd_mXDnlm
X-Authority-Analysis: v=2.4 cv=NLLlPU6g c=1 sm=1 tr=0 ts=6a3e6587 cx=c_pps
 a=MXKEcm+r4KK8PT7sjGsI9w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=RY-AXD4GyMzBhyZB318A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 11:42:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127791

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

4.9.3 installs zsh completion via 'make install'. Package it as
${PN}-zsh-completion consistent with other recipes in meta-oe.

Link: https://github.com/lavv17/lftp/commit/7f5c127878fa76a916b9ea80419d65e7df549d3e

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb
index 3d838e6c42..aa47362c92 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb
@@ -27,5 +27,9 @@ PACKAGECONFIG[expat] = "--with-expat=${STAGING_INCDIR}/.. --with-expat-inc=${STA
 do_install:append() {
 	rm -rf ${D}${libdir}/charset.alias
 }
+PACKAGES =+ "${PN}-zsh-completion"
+
 FILES:${PN} += "${datadir}/icons/hicolor"
+FILES:${PN}-zsh-completion = "${datadir}/zsh/site-functions"
+
 RDEPENDS:${PN} = "perl bash readline"
-- 
2.49.0


