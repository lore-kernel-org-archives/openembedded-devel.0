Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86526CD4F52
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 17:14:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2386.1779124451757147085
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2026 10:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HAeDorCz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95986d85e0=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IEHFtv1522306
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 10:14:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Z1yzta3duheOrrvlCe5hDIce3ZBhTKTO0JVg+6dkvTQ=; b=HAeDorCzVEaS
	qZCEoq/Y1J9HYCier28VeQl64Eh6TgBna0LVy0ZzbNjO6iAZK4pFQqq/Gha8dift
	/LP/qtKHIj4sijM0ccT903E9588iOr3zser5m/pgJcfK5afD6QHc64GtuV5KDznR
	6sbUI4WSvMF/MBlMu4Sc5fkamNVN6Mkslj0a4aoTECZ0GNlSj3OwPeoL4nisfXnI
	WBT4Mr7N9d/n6w27XwIMdepneP8/lKzAQIdAOaNbrAkxR5d9S23h8m9iboYRBsC3
	juGf5CrZPcb3JZ61KuG2uV6F7rF2AMu8t/qF81yf2eLOdgmhnbrTQf19LVcCVnga
	NzmAly5PjA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010053.outbound.protection.outlook.com [52.101.61.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6kux29v5-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 10:14:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DWZIWy3mrke1pb8Jw91giyLaSXlSLRG01J4erEWaeSXUCdZcHUxbW8a0nRDFtfdLXTcjjOeXv1OsAzTwUSe5DT7oDWthzRp9VYK7wJd08nIrxyiNrizsLvKASVsX91Mhjqr9z79xkcnAzUDoQBFibuM0fftWIuz0D83aT6tgWsbnfBRRV4ioqTSKHxBlWQADfaH4sRh3fe99ja3TE+NVIKFx5466OOD3ATS1zDYiEW9EGGWYpaowO+XJ/W2NYFgyVyUBOIQJ2rVUBeRYxuL2YBRxYCI/SZ3CXXzrz6Y7TNfH2zSSjfURvRpkSNO5ithM6oiRrg++vJIJ5p+EKlRfow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1yzta3duheOrrvlCe5hDIce3ZBhTKTO0JVg+6dkvTQ=;
 b=DXdePhXYNBbxCDX+lYnPvsMIan06QS547dDdAgbu9t2edDTd2CF3JVV6G4pyq0JUFvKIt6EgLZUfgmqvdAXWa4KCrAIKFDvcR8Di2So2v8MOTDdOM19o3CFWRHwidG/fOjkuxkzzIyyrbNM5uFpRTF01Jd2hkKn3VPNajsnaW5j9KZnd2ZTcjRqXlcgSsobGykL44vEdGGB+Coam2uqtczJPO+MGZZeDWhWX9RT8cOvicALXVel9bGL7KgqJuRZHnbTXlzTfIG+kKyuwsZPhGKTN/qv5HpZT18VkwjEY0mrQk6RGD9EVYNy2bzw3CwvPT2Zcna2m9yfHB9ut4DXAAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by PH0PR11MB4840.namprd11.prod.outlook.com (2603:10b6:510:43::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Mon, 18 May
 2026 17:14:08 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%6]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 17:14:08 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/6] dnsmasq: fix CVE-2026-4891
Date: Mon, 18 May 2026 22:43:33 +0530
Message-Id: <20260518171336.470608-4-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20260518171336.470608-1-Abhishek.Bachiphale@windriver.com>
References: <20260518171336.470608-1-Abhishek.Bachiphale@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::18) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|PH0PR11MB4840:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e6372d9-3c62-43d8-9589-08deb500df33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|56012099003|22082099003|18002099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	BGedu8PxRMTswItqzKEMnWx2+7OZio5EGh8vQ+2qsQUN3Wyurh4ikKxx2ngOVyZ8OCZshmJpLMYYUK2mryPtrvhRTU+zHg7syxUcX9136WNnKd6ZCu7Jhg07vgkL6TNpWtkhieLAjiQZ0zysb8pfP9d5iqEcsdAyRHJoESLUKxeai3jLxSC06papguFmM5z04F1XR80LFZIVFMGt8GZ1Z86cnGwyiT9lWM48TYdICA68FPRz9XPZ12v2HB1LNpmVWTXbDONoAZJnC6/u/PvZ4kKB9iVrSiXvzt1g0Kv0raF08IE8gv5pgkLMR5on98L+kGtC0GYGyi3iugkJhJICiNaKhZUzTyK0tWTpL3Y0svIESRTv6eTboPJz6CFv5C5cGGq9gTqsAwMW+qkhEAU3xCTktKQ3NUHsvo8dUScIK6x+y5R3ri8Jd3BIYABrlbGP7ZyEUf8wgBhReNs0RxqeGlBWVK/gIFxnPPWHAA3m606W9BT0NIbW/zwMSdn9VX2KP9SB4ZrAS8eYrtrTjtkAwHmPHcQ7/n9oM6YgJCqrcUojKm+/vcCfFnUNZhoUJQB4kyswS/9CVJ2y318x4XaqC9NniH6iUvMIQbtNdmo6HHXpa0vHT6WTZ0BmHtD345n4ptb8Nz531KB94IJrqhKyzMV6ZL5tx2OlAM6WfAaPDfYZpTR9ZITC9D4lzVTUJpXywQziPo75oDXbvyTdXBzrbw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(56012099003)(22082099003)(18002099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9qO1lIMsF0oTpGobRAus6V9LcdoL8XD6QaJ5xA3Jfy2Yebv3qWyouVNTAzX2?=
 =?us-ascii?Q?/nZsmmDaEvZAb2V8GLJUQHCNjRlY++i+3ketKfBIwum5+/9DmPy+Bas6Ak/h?=
 =?us-ascii?Q?o8732OMl/cp387GNF/V9ByJ6EnNe3OM/PL8f32JGfKI48dwcnrm5FALamAQS?=
 =?us-ascii?Q?Aye+5ecBYNdhdgVQZw5hn+utBGhqYF4cet1NNgNJsz/Cbp/QFZHT7DBqCn3O?=
 =?us-ascii?Q?GzKF/cL6aeWxfbQi91ZSRj4EvtdvpxR3d5PNNncdBcAR6z4ZTtwvOf8IXutS?=
 =?us-ascii?Q?kJacMKqn1rSE3KuyyrsX3vxHdLkL1gmCJEdKG1EhMii521VT9KaqirS0RW68?=
 =?us-ascii?Q?MFNQX9IVqaQF8cPj6f9c5wGTJYLLiS5E2GkFfIz8noAaGXKtMrkfAGv+g0lu?=
 =?us-ascii?Q?YGhYaYcyE+eT0l3RJ9XIMCefn+mpUDX+rnEOu3vIi3MemyLu0qp/hYYs6AYc?=
 =?us-ascii?Q?k6YgCd77ltFcaTbnqLnp36+/MyHvH6cH2ai112Oak2Cl/LX8DGZnz6tYj0Zo?=
 =?us-ascii?Q?eRyLJ5ZxvrgLyGAV2K1wNEMuRPRKfGy9JSgjS1gFfno5ho0V/r4/THbFkYF6?=
 =?us-ascii?Q?TSs8x5uE8heo2mASHiooMtwahD3ldt3c3qUIoiZ0i4+XkNIzew/EiwLbQ7QN?=
 =?us-ascii?Q?nWJd2n2eWUrKk7ooySM5EaIxRoZOpDEg06i5aOUJNzpYgAtR/grIEBr3Afwp?=
 =?us-ascii?Q?AnVLL4Pg5EIqkxa2a0096moyr0LGdbPVZIzKa3TMYk4YTeG7L4AShofobHpx?=
 =?us-ascii?Q?xAJRZQO4rQfQiyrTPy+qMXENNiEyahhwhPPDTAy1l6YR3az9g7IfjZqFXg70?=
 =?us-ascii?Q?HZOjuyoPbpIpykUkVDvqBWzGD+6R8bffzsMId5dNaVepBh6CI1FpRq0zh206?=
 =?us-ascii?Q?hBYzQFooZqJfDkR724qsh3pueyUVluf6U1/3F2Oqmc70Ltl+vdcD4jFvVPJc?=
 =?us-ascii?Q?eATOcECSZlRHK5BYDwW/I+8GVIRvEhN1ieZylk49ZHnI6zYKJBSqw9BoJnAg?=
 =?us-ascii?Q?92dkIz3UEHF6mcDui/sYUXOek7N4cOwXgIEeny3VOzdVYH4hOZ7/Z9J4Ab0m?=
 =?us-ascii?Q?rGHDj+SV/NCDBLer3eM/TtDYA5WmxYCU9MKNTqBO8kzT/sLN5reQdr8C+9rW?=
 =?us-ascii?Q?JAb6DoOhEGlp4kWx+Wsx4ODs87Y3DZ539O3GHdm/MtaKrkNrBjaEuEcsmORb?=
 =?us-ascii?Q?AKn2QTBVpykjYV6jwowXA8PR/jwDP20Jw4EwVlMh7DrP4iE80xGfm7zBav9s?=
 =?us-ascii?Q?dbHQYKXLjuM8RxaSR0fjiVi/GwUsMq83RZYrN1IiGJACI5+7xjw14plxZoql?=
 =?us-ascii?Q?Wjgo45VSAXbF6KmvV+uejZmEEa3C9fmuiKshd3IOyWWgFJrLkWnnW4uLnpfo?=
 =?us-ascii?Q?Yao4FtOxXdXEcPS8vcFifCTM80DcRv+9gzn+9ggOG9g3WqLHGaeKcsigYeNH?=
 =?us-ascii?Q?yT66cXQjcJOfXpu82N+sajtgQT8DU9GjlGgqA6gU86VH/51Oe5oVBkplYNgX?=
 =?us-ascii?Q?NVheLPiIPoJiXGVv3T+ce9ALi4n6KUI6T5yxn8Vt/2cugpIIYgStH/+Zmp3U?=
 =?us-ascii?Q?QU9bXsbbay7s3reUigUhImjTXUu6jzuRN8RAySJH4m3R/9C8xq09Jk4ef42W?=
 =?us-ascii?Q?TQ4rSzxBOOzWvV9AGuiZJc9ECsvXN0FwK6a0yfXOaNAPnLYnoQvysQujlcZI?=
 =?us-ascii?Q?rNmzDx6rIrm9+regm2urz40IpmRkPiqvYgvN8WUV8yIAlQxYPupQ4DXt/3TX?=
 =?us-ascii?Q?uccBMPbPLF/Q42ZhAGhgEOmOyts6BihAjpwyk1prwn8wzBFcXVMO?=
X-Exchange-RoutingPolicyChecked: 
	JXeJCz2D1YKkuNQnQTWZRHVIsCKtGN0uX/8LEiHJ/hnxqmdXcQbRztrGyHdL1VSYOiKrXAEaz9XZqV24lCvC33Ia+LDBtmttLpi2ew/0yNgNzrfdhqTnpooCIxKickBn+xEqPWfxV699bUdhT3QQPP7I3LofBcmkyge7p+v+u3JkCalUzaN44fvFUdW8ettBR1BHW5oTBDwx9n2rgFKuvkzX9Iny19M9JwHDWoqtKUUAkw3Ay1CYPun6oVvz4btbR03Uw2sgAaNBaBpFnfnQXnxdjpgk2+T0oxP2GCvSrp3emU8HS6yi5F/xYt5pWehOJGscjzsoWo9IYnBEOJAwjQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e6372d9-3c62-43d8-9589-08deb500df33
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 17:14:08.4400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5BAt3vZO0pbLOAiZYm4ACqBVHi40jqz3ELsOqVoitmtjVu1IUz7YVyo+HJd/q1UOpfncJQCofepsDc3gXOcaNQ9W75Gnvt1w5LQzY3osbT8J5OHu8Y0WuBfFeoZswaj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4840
X-Proofpoint-GUID: 012rpIGG-iYRIvrjPRf7evKt7J6IZESr
X-Proofpoint-ORIG-GUID: 012rpIGG-iYRIvrjPRf7evKt7J6IZESr
X-Authority-Analysis: v=2.4 cv=NMblPU6g c=1 sm=1 tr=0 ts=6a0b48e2 cx=c_pps
 a=ynjcjXHaqbEn4NYQb+mZsg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=PYnjg3YJAAAA:8
 a=omqxvBYPAAAA:8 a=t7CeM3EgAAAA:8 a=VBowi81kAAAA:8 a=0YQz8tQMA3RWegGhgFAA:9
 a=LHRESdT2jHCYgTnjdhDM:22 a=FdTzh2GWekK77mhwV6Dw:22 a=uoxt2CKr5i4t67rzx1zf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2OSBTYWx0ZWRfX6BTpIc/H/PQp
 WIy/pZzFClLha1zHD3sxhDU3dTCtGoUusCCNG8cd4kBK59oJaNMkxdg9BhwGhegvF0e9c0lNurK
 uO1jqb6xA607kBWyHemP1n9dDj2wrMjxFFQpSNt9QPOKzMAlExt7iSwBtQT0hqplbc+YFXswpPV
 Uc9J82fhavfW4VARtGUppFTOmv9AjogXySyPXKgwn4Ie54T6jAvc6saRlDYzOiA+OXkeBnE4EuQ
 rEPaZ55kP68itzR6IH9c4gCNHnQ2gIvIaehNanhMg80E0USpuzHiurAlRYfZ3Kbc99RsSK4t9VX
 2P7zDYonD8uPJM18Xse01PYz+3l9DrK70qMJEuqr4iI8JGAB/TtRG3KyEMdfpKymowJ6x0ps6Ui
 o57jje6wLGDh8aBJtGuP/cYdUX5Oz1d2XujZNEWhtFik+eiV+RK9M99jqdDt9Zg4LnzLyR6Nagz
 CljSFrG8JnCLnp0NjCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180169
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 17:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127054

A heap-based out-of-bounds read vulnerability in the
DNSSEC validation of dnsmasq allows remote attackers
to cause a denial of service via a crafted DNS packet.

Reference:
[ https://nvd.nist.gov/vuln/detail/CVE-2026-4891 ]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.92.bb   |  1 +
 .../dnsmasq/files/CVE-2026-4891.patch         | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
index 61cdccb241..850bfd2657 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://dnsmasq-resolved.conf \
            file://CVE-2026-2291.patch \
            file://CVE-2026-4890.patch \
+           file://CVE-2026-4891.patch \
 "
 SRC_URI[sha256sum] = "fd908e79ff37f73234afcb6d3363f78353e768703d92abd8e3220ade6819b1e1"
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch
new file mode 100644
index 0000000000..e721f5ec0b
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch
@@ -0,0 +1,40 @@
+commit 2cacea42e4d45717bd0ce3ccfe8e78960245e5da
+Author: Simon Kelley <simon@thekelleys.org.uk>
+Date:   Wed Mar 25 23:04:08 2026 +0000
+
+Verify rdlen field in RRSIG packets. CVE-2026-4891
+    
+Bug report from Royce M <royce@xchglabs.com>
+    
+This avoids crafted packets which give a value for rdlen _less_
+then the space taken up by the fixed data and the signer's name
+and engender a negative calculated length for the signature.
+
+CVE: CVE-2026-4891
+
+Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=788b4e0f6c05217981b512bed4e5fea6f8855d01 ]
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+diff --git a/src/dnssec.c b/src/dnssec.c
+index 0860daa..4bb0495 100644
+--- a/src/dnssec.c
++++ b/src/dnssec.c
+@@ -546,10 +546,14 @@ static int validate_rrset(time_t now, struct dns_header *header, size_t plen, in
+ 
+ 	   *ttl_out = ttl;
+ 	 }
+-       
++
++      /* Don't trust rdlen not to be too small and give us a negative sig_len
++	 It has already been checked that it doesn't run us off the end
++	 of the packet. */
++      if ((sig_len = rdlen - (p - psav)) <= 0)
++	return STAT_BOGUS;
++
+       sig = p;
+-      sig_len = rdlen - (p - psav);
+-              
+       nsigttl = htonl(orig_ttl);
+       
+       hash->update(ctx, 18, psav);
-- 
2.40.0


