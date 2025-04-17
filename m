Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A4AC369C7
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 08:05:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3645.1744877134041725830
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Apr 2025 01:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=62023c0ecd=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H60XU7002201
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 08:05:33 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2043.outbound.protection.outlook.com [104.47.58.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 461u2ma8hp-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 08:05:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQ/g+laWhyrs6sg6cMGRarvRLALdwTNaMm5g/K7+JFFlq8J0tddl+4hD1j7xC+OwjXJOsyZ6DvYtZGEDnTUAkMTuweo2ORHeaVb72prQYvZwtZbTuKkmbVJZcsSGq+C/yW4Bgi3JEVYlEI//3voJIqQWJsxTAzqEQuZfl7vzEsswhftn9mYo/xfAW6yIdk4leKVbqVrwoRe7WPc4Yk4YloBZUrKF8OK4r5PapYWOwYEyxd+sTrVF1cUqrN9dN+BVhn4Q/wSdVQMW/jPZAflPuxl3MthJt6/XXtd5TPc6wYGANvMlxeHFBpBXyL6Ut6FfMLy6zuJfcaAhprMMmMZNNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Y50WEvm+ww+I4RlkcW49KywLuiYxhYqMWSIdmbP+lo=;
 b=XoLwvtnZtUUXHLU+godMUsBzcivD96atzQygA/WqhA7bmr34Vd2ifTHgAfbws6q3V3JjvurE3cNUaoPulDv9Wx9BrGao5f12l67cKIF3zMqcWYpjPUrlP/rUVVYBAaTh5peY5TIRUjsrczFCMtqcnQ++G1irrW+Ke3mufcdw2G4TVrXqasIHIb82viduvWVAxWIRbD8+7I1lZ9EZmNCs3TU+hPGa7ev6TvKLs7u9JFGGlj31qTB4kQEtm4UAaH2ZuqyQGswdEjDnzF7ribac52ABZTgMpCE4TdG60exOimW88mZNL+7CcyLnch/DGAXDFSpMw9v3Lrkq/obwValLAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5163.namprd11.prod.outlook.com (2603:10b6:806:113::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 08:05:30 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 08:05:30 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 6/7] conf/version-check.conf: skip version check for a few recipes
Date: Thu, 17 Apr 2025 01:05:15 -0700
Message-ID: <20250417080516.3158818-6-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417080516.3158818-1-Qi.Chen@windriver.com>
References: <20250417080516.3158818-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH3PEPF000040A4.namprd05.prod.outlook.com
 (2603:10b6:518:1::53) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB5163:EE_
X-MS-Office365-Filtering-Correlation-Id: db0f64c1-1246-4d68-1583-08dd7d869ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ff/QTNXqJz4ibiXYsi72iyFFe5IkgbrQQTGSrynGLvYl2L/6DgXEMxZx6We+?=
 =?us-ascii?Q?Vazph1Kw7VNAt6RwDEqDY7UTWcj7e2aH07CaejU6FQeL5k+rapoEDLn7Wk56?=
 =?us-ascii?Q?IAZoEeFvVCLXIK2jn63At+aPr5SVwsPY+M66sUyB4sP7mXYoqZC/KriLKD6t?=
 =?us-ascii?Q?HzGbRSvPjHqJJ6DSHXIIxZEo0L7Qlg14J5zBq5zaDquW6HXwGNiw6jmONIdO?=
 =?us-ascii?Q?tt5iYwlCeV14eoQrFy1Gvci5eQwZNjYahuyVEbjXry21gprXhkxkWw/XN0cA?=
 =?us-ascii?Q?jLeDrXDKM6ddC6ZIRqx1DjFbLxDqHppIN8H9Bdrx2pGCBkZm46NUNPBblNjP?=
 =?us-ascii?Q?pX9/0nbgJrfVTvbzKFJ65Y+DwW31rPYh6xF4iuK9ZbAAxKPE6iRTVtnlzZ+v?=
 =?us-ascii?Q?1QQX6MbCa+rcTEcJRmn0eDgZpQJgYNFg3gxjWLb+5x5Nip/0Sr7n5lotol+/?=
 =?us-ascii?Q?yK1pdkIm16zr+W+bjpOa1etbrNv5MC2entYs03aTkv97yhZeS9ep+YTBZb7h?=
 =?us-ascii?Q?X2hwOE8KVBt1Z0nBZ5QmSE2mG5fjV9sX9Chwt61TuFVGSmsoCHWIl4X2CH4u?=
 =?us-ascii?Q?0dej4NFuvDJLudg2S3XwD9362rzM/zqEmH8Eeuj6YPykFholjM3Qy+b2Kele?=
 =?us-ascii?Q?5QpKuStaoWN4JiD57XeuoZI59hyihO2EGd1GjfHop0LnLmkEAGYxWnHJYOMZ?=
 =?us-ascii?Q?79wps5ThVgSftIXPtLnL4xAz9hyrQvQIwJruphpBHBaw1Pv4HPPwGSmKVzrU?=
 =?us-ascii?Q?yIaHgNgNIsSX/ku+A5wCT5HzzHmIH1j0zdLAZVG4D2N2q1TU5mVhN/8Xwt+I?=
 =?us-ascii?Q?c8gDBgL6vOIzgzsb3ocmrhp2Doq18wjWugq7s1qmxhhZiRQs3JiYzbR8ME/+?=
 =?us-ascii?Q?fXFqltP5iBQ7KhaHbTjqpK+AbBk6gHy9EBQtDAygng3Kl1nKsOyedPtI+0Sh?=
 =?us-ascii?Q?scr8gwwieETvZ4MV3w49QIOPR2rYOUYnKLXgUGIyNM9IfVh70niRdwGR1F31?=
 =?us-ascii?Q?LecxHEsTd3+D8Oxwm2qJEMmdvDMuM6fSfUBd+p7YchoF9IPwmA35sToYbjnV?=
 =?us-ascii?Q?zmmXWROdbks/nPmM9EZmgG71kX8KhDTTWX6c3rIXT04tQkIePm83+9N/VSRV?=
 =?us-ascii?Q?DzuSNKzngLx+zEqwyw7pxExPL/I3He8Kh54Jrtsu/VRHFN/CUCMPecqVsdBi?=
 =?us-ascii?Q?Wd1swT0o5KeDWFrY8mAVg+aw1q9mSlEarlYfG6Wj3E0GrW+5l8kw7PBaLlIj?=
 =?us-ascii?Q?NabE3clnob3S2wODTuWAvGtnNm5CHAmrJb2C0rtzekmoWqcoDpe8w2rhT9Jq?=
 =?us-ascii?Q?mHbKp4rny+s0PM4sFvLjCTbDfxJu6l6v1GuAPGumIbuxD5p3NePh6VuJK11g?=
 =?us-ascii?Q?Ec4JMWvuGP7JViztE1atKGIoG8eztVd0QCO+aVKXTltQUkeSNlMUmM+0tFOi?=
 =?us-ascii?Q?l1lPHg7EpD+pUd6UGKkY77tpjKI+gjjxgWD7ht9Z9LhYL2Ss2HQgMg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n/aaziYXe0PqV9B0pzDiV473EjUJvN94FsMCJXKARCYrXrFfPCve0Fuzn3Y1?=
 =?us-ascii?Q?zvUKE1hjMDJ7kfRCSnUkjaKIZ3LA8RerjOic/DMkLA1Uk7teI8En3lx39l7c?=
 =?us-ascii?Q?MExvypqlnWNT6G9mY7Ir2eSyNn6ps5NNl6tgtYwYab9Ip92ICZNPcy2HW4ch?=
 =?us-ascii?Q?0l37PMY8l9l8LCA59vUltm+EG2fSYERfz+2QbF9ovRdQTXej67YHWfvd71VM?=
 =?us-ascii?Q?Rr0Ewahav+vpbhBbqv65j/co7/OT6xl4M9tBTqv0CzAiiVlInkJ+TlxwSk+N?=
 =?us-ascii?Q?lqNafLu0cAJgPAgeHENFIs0ruo+cprUn8YUbubn8XwGd74PoY0CXaeG6HJm5?=
 =?us-ascii?Q?U0qAeJVVEJNUfEN0JK5KjHCfgF2GwpDDlEkiUmWtP7CwgvyvQ82RUn+1szTl?=
 =?us-ascii?Q?0T03IjcFSmxmO3klSyRr6hbB6Fq60fPzG5+b2lakYLxFSD2YbrRACK78QMIa?=
 =?us-ascii?Q?2irljzjWR9rtkkeW4nYTOXPJ100QU+nLD91nLpm0LnisxQ5B1DP0drzMJ2Pn?=
 =?us-ascii?Q?wkwo63zQEctuFWrvkZ1wgqfiSUyLNvn05lZRBT1haAYE2JuHnhWT+1qRF0/0?=
 =?us-ascii?Q?RL1q0lqCIiu7Clzno1pluneKmQPfwp01XwCapZRt2JVkRFYL1MUzWgnmF2C7?=
 =?us-ascii?Q?rwjoWI4RpKD1lhudcWsoh6w3JmuYF3OagUBNP4Trc4q2V8kgkiGPNXgkGGdg?=
 =?us-ascii?Q?9f7594WuWi4N233tL/iGWL7EIp92Jc5RWOrKjcn1+qDWyLjYs1jJF6iTrcxp?=
 =?us-ascii?Q?az4aUTV753lWciQWrzwi6fO0VizCRPLc1DQGbqpVuUZK21qq5San6Ov+e34Q?=
 =?us-ascii?Q?bPth+2w9TApa++GxYXT2eT+Dcc0v/31m3NvQ6O3vsa3rkIqzFAg1/tcbdEqU?=
 =?us-ascii?Q?O2rX+suQykvHMxbtddIxK5SLtlJ2szgNsaUsAaY/YOxKlA5pE930nAYFVE9b?=
 =?us-ascii?Q?4lUp6CDQnlRhZG8bgVe1OMqlu9daGwHJBeCysRF+i3X72a+mBKNKml0YVj93?=
 =?us-ascii?Q?GtjDk6zbghsYV92lefP9vI2Fq272L90vDkwaMMFhDCrEpKS8HMVMhIo1TtvV?=
 =?us-ascii?Q?DmUyNeMWPLYNFfd/CRAR9HEbK2gNMb3B5VytrNQJZ0u4T4tTjZqT9QS9emQZ?=
 =?us-ascii?Q?oxC3j6B5D1SDa88B2+n0g/I4KikkMH9zZiwtWYbxwLzGMOBPRXKmktH2Utnp?=
 =?us-ascii?Q?1owkBqZF8FgJv16JwR1qQx2dnZBdEj3e4WXY/wizpVSw1hVUzdY1dil/LcqO?=
 =?us-ascii?Q?yHHssKlfSwGp5tTImq4/YXxWxARwqS4JiPsfYHF5e4KyGaS+VK9yjTozGTCS?=
 =?us-ascii?Q?cKsaAyZVtrvgVx5c4s/YkUB0vUjGDd1zAqAX7bxfpCQob2tacYf7dTTz9L2D?=
 =?us-ascii?Q?WjzBpr4eKq+6Xo3JB86Xwe1lyDbSFeXeYqcd2I1uNA/GRwuEoJJ7/ST+lcAy?=
 =?us-ascii?Q?oj3qTCHvwVEZ9WgNcYOF2bEUUASbuD3HMIf2LbDWLg6MBC9/I6e2MypnmOlG?=
 =?us-ascii?Q?jCXi7pIuKqXzTKtjP/38iviwtz78mpa8lh4p1rPr6fCcLcFIx/IRcaaucBII?=
 =?us-ascii?Q?J3gAmtyXLOPDLWdHTnAzpWUIdEkr80Ayo0+Q29O6//cUsbYcyzStnVvA/5OR?=
 =?us-ascii?Q?gQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db0f64c1-1246-4d68-1583-08dd7d869ec3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 08:05:30.1020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 960G2HTZb5giYxwViYrkYYR+bg+mdWOXhG6OkTwd++YcHMocFG8vtMSfNlLVrUJqOsoIJIk03J5cBfvGxPbm6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5163
X-Proofpoint-ORIG-GUID: qkP85zsDwLJ_6kc_3xaSD_L3FBsVqExZ
X-Proofpoint-GUID: qkP85zsDwLJ_6kc_3xaSD_L3FBsVqExZ
X-Authority-Analysis: v=2.4 cv=BaLY0qt2 c=1 sm=1 tr=0 ts=6800b64d cx=c_pps a=S2IcI55zTQM2EKrhu3zyRw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=3vtZyVmMsWnjot6tiGMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504170062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 08:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116925

From: Chen Qi <Qi.Chen@windriver.com>

Now check-version-mismatch.bbclass can check scripts' output
beside elf binaries output. We need to skip a few recipe.
These recipes' scripts give some version information, but they
are version information of scripts themselves instead of the package.
There's no executable in these packages that can give out useful
version information.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/conf/version-check.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/conf/version-check.conf b/meta-oe/conf/version-check.conf
index 5ab9a1d665..1867c23c81 100644
--- a/meta-oe/conf/version-check.conf
+++ b/meta-oe/conf/version-check.conf
@@ -14,6 +14,11 @@ CHECK_VERSION_PV:pn-ncurses = "${PV}.%"
 CHECK_VERSION_PV:pn-alsa-tools = "%"
 CHECK_VERSION_PV:pn-gst-examples = "%"
 CHECK_VERSION_PV:pn-piglit = "%"
+CHECK_VERSION_PV:pn-kernel-devsrc = "%"
+CHECK_VERSION_PV:pn-qemuwrapper-cross = "%"
+CHECK_VERSION_PV:pn-gnu-config = "%"
+CHECK_VERSION_PV:pn-sysvinit-inittab = "%"
+CHECK_VERSION_PV:pn-opkg-utils = "%"
 CHECK_VERSION_PV:pn-libedit = "${@d.getVar('PV').split('-')[1]}"
 
 # meta-oe
-- 
2.49.0


