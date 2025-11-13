Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CD0CD4F48
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 02:59:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15572.1763002764679498039
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 18:59:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=k7Kv4kFk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3412a946d8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACNelD63217377
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 18:59:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=I+PfBEm5spQweaN1FqUpHZM3JCHGiUmtYjvMLqsJY3A=; b=k7Kv4kFkFvXS
	2ohPkVVLi0lvNoCsr1cGI7DX9Mqx8qKF669/xkWJDfLmZWv066sNq5pUCvL40VsO
	gnrc77D/nK5e/WnTXMMMWOUuIJy7vceNlOxnD8cOWCpkWbu8hbP7s8MXPvg0Ws9O
	yXoOcFkFffHDBz/+HMO0eOsL4mfp6AoftyyAEDckwr4i7MQoRNBV+YSVGwEICqag
	zsYJzE7QDiSAjAM08tRYxhx6ByupambaAkf63Jfo4vWy1ek1d4ibM4WUUdjxJh09
	goFE6iGRjat1VCp2CSADOsnuBbLs5CIOHoxgL4QT8UnyVMyHHiTUbmo/seFkc+qS
	LlY2/s5hmg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013066.outbound.protection.outlook.com [40.107.201.66])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa68jp8je-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 18:59:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJDDBiqqziWHhThYYW3sSnC6HwwZIaurfs4zZKq3Dvkzufc6UO0f/wNoGRpTGyYGK7eA48IKeP55DD4boYjn2ZVo2QKXdYyr81vezZx6I6NhovofPVMG1tRt2CCBkMx8oMh8mSvo/RkUL9WzbMXO+EtcCYlfJ88F9pHYqAKFZ/npBSPvEGYs8QO9n8mIImd4XqkD1ru0OldUR+tetaXaSINT8lpmypvWz5Jc1rg+yZRc+ojUwUl0LvAPzv/dc80ktOT8qbHD58KpA/evZyrav06QtSwI7/ywkjjWmlu2a4N8xYycA7aclO2FgUunNT0+N+PjjUyMGeUhxH3DCUelwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+PfBEm5spQweaN1FqUpHZM3JCHGiUmtYjvMLqsJY3A=;
 b=lHgvTFkdJzPAlGPCoW6R3ijYHBIsYNx1Y7k3qf1Fe2mT9mZcb8dl9sbMK+S6EhsUrwZG/VgiIaPHIZAUvpOFWTyHI/+iGgC6P8rr43MouTUiw2tPB3NHYhVxKal4umXgzxTwXhnOICNGCAW1u9UEAk6VQ4gxr/qQcqzJfvyuhNc5jXCam5bd3OJ2THC3mQbXsr66fapDoDvVd4/kaS+uu8/yTIr+yOvmI5lpSeQt3xOF3DsCObU6ne4b+Z8v+VLjgeVtU6gdPLLNmHRaRDwsa9PcwZ24EcFztUDfrN7xVWhZ4RghTpXXoLDLSNsoziboAZvxrNCFYH/tjPFnV81glw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB7570.namprd11.prod.outlook.com (2603:10b6:510:27a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Thu, 13 Nov 2025 02:59:22 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 02:59:22 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 11/11 v2] python3-types-psutil: add UPSTREAM_CHECK_PYPI_PACKAGE
Date: Thu, 13 Nov 2025 10:58:55 +0800
Message-Id: <20251113025855.1520038-11-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113025855.1520038-1-yi.zhao@windriver.com>
References: <20251113025855.1520038-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY1PR01CA0197.jpnprd01.prod.outlook.com (2603:1096:403::27)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c6cada1-f2b1-44dc-bfaa-08de2260a590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ptzV4yAgM2lc2SMipXMVl+u5M/PuzX7gTxwkNy/g0VS55xCeVVdnSinlTi7A?=
 =?us-ascii?Q?99B6wjEqKfguA19A4EfFdrmULHgGHUMP7Hkl6xAadqR4YAFaNEbxKndBeV6z?=
 =?us-ascii?Q?2KzhB6Jf5nX/uWq/aiDbby7i8v7d7w0BTtKNO3TQj21d3Yc1vUb8ArPe1cVe?=
 =?us-ascii?Q?st6ZJoS8dCLFC/2SbNAnf7H+EoWQEtd4dAENCYvWx8/85cIIulscGWp/NsmS?=
 =?us-ascii?Q?GyiNFz4FURQq2t9ZAF56V8v49TpI7HfrkR8eUDScbb/j0Yr08MAoalpdE5mn?=
 =?us-ascii?Q?eOQxq4lJrNZDss4PLowqjjkGGdkSd8b2yJLt1cZ4Msdt/Csy0vn6PJWqrMyU?=
 =?us-ascii?Q?kZMESntz73VblGTVzoenn2Inp1D22zntkM8fexUbtBMjOXqjeRIR/71SyGoR?=
 =?us-ascii?Q?QbZvgYBtgpHcWIk3XU0hk6awWjehEwQBdj8XAf+elY+ySGkEkEyY/PG5Wuka?=
 =?us-ascii?Q?/r8SEFojtDk0ipLZM/bHbtHQjOGuckq2LuxKnTc97rI12mmIzgkAO+3B+fJw?=
 =?us-ascii?Q?nPFjvaRiIzzYdocYmouJpDBkuKDl8CYHICLI9u9P28M2wIO6ePa8Q1XWm/is?=
 =?us-ascii?Q?P7sxl08l04o3mrp2fO6Z5eTvBfH9GIMMFq16GyS8L3nn72PePEyZxfm9w7bc?=
 =?us-ascii?Q?A9Q+cHyfXWZAZG1vSo/JEWCJUjwg2fzOImXMJAQ833fVO3nu+Bae2BG/yis/?=
 =?us-ascii?Q?FGOVidvb24vs0DB4Co8RJLXDLgLkDeN3sSkAdxbx4nMPnkKQerorCTav8Dvi?=
 =?us-ascii?Q?YKZ21lF+AxmEeaSpd9h4wdLGKXgyur032qDFoC2b9PvctQR+2WudYz8VZ9Od?=
 =?us-ascii?Q?MCZKE3e+YSJhXgIeHegsu7O7LUtHqymGoGtSfRQnbiIPzN//1ZM9pIxKbC4i?=
 =?us-ascii?Q?ngzX+8rn0y09Q5qP8AqtPUWS5L6qFJ/W/x9pnTbygEHTVe7Ppx8gRVHK4hfG?=
 =?us-ascii?Q?kuwh419s0w89jp+m5O3z2tLaK1jtVDFL8YnvLNi2TLfg3sau1fF0catB2Wol?=
 =?us-ascii?Q?qYGozxW0i7XudjO9b1LvV4dn4F/ogu9YYopsUAaS8S2Q14Z2eV1jKAwJnloS?=
 =?us-ascii?Q?oKlGR0lZF84ughAM7X1pqHGmx3MAF++yabm4wappjfbv1pEjnqC44A0AhWoN?=
 =?us-ascii?Q?UhwaFeGafleG4NNVgBVkSjDBE5Ylast+tT+e4OZsTftXLkqnSmEcmXDnrO52?=
 =?us-ascii?Q?IFNEFZHQ6uWwEkQatkGzFdiA0mkFQ9Fi+bHf1+e883x894xm0qxgLDp6NuRT?=
 =?us-ascii?Q?eOZa/LVltErBeOuKtCVWAEHge9rF2ftV3Xaxt3vsBhYnyWNMjpZWa3SIX2wG?=
 =?us-ascii?Q?YA0//q1TtE7ZsKjnAO0lxZSeXDk8hArIOy3UVdVAlNlQBtl7ks8SX/SGmLG+?=
 =?us-ascii?Q?n5Z+ncJnrALobqHfadaoLU+CthjPuMgHTpcioHZy9WBdzqVBNjey8/glVOW0?=
 =?us-ascii?Q?TAP98H7W9RqIhQ+Yp/i+Z3iUDCUFxgGgcvxmF4vNZmsJ7P4J6NkaKQINntw/?=
 =?us-ascii?Q?/+GYiqbsy6AsS9RwdKXMBvDZyKC5rwv7bmsL?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+GrXUfvV20h1APuConUijONtRqklFlnnV3ejMabjXr7TOKT9KKcVHv8yT+kn?=
 =?us-ascii?Q?Kst+8xsIo8BKqQYboFfC0/QfF7hqsujLQp4MJpgpVTsCDYdgOTiovpSVEfMx?=
 =?us-ascii?Q?BqoDvpG4F1KEIy3nZX3gTmjwVlW4NOEcCcJfa6o7v0JGN7z7K6aBM+CzlK/s?=
 =?us-ascii?Q?5fzqkGz+Mmoprg/g1GdEtqpEX4sQ3xbPl22LSAengxCBXOGvDKeghQw+sIcH?=
 =?us-ascii?Q?p4FBPv5fs/l9e27jf7j8gUg+qaSmC7Tn7D9xFlTtV8MVgkSDG0Qi+mpJZdUm?=
 =?us-ascii?Q?RZ1xfaNpkvY/HmjYHgHTFdLkbRaItWWi1w00PsHY9UKBG1Uc5ZX0KvjCi7mB?=
 =?us-ascii?Q?Oj4TlYNmyA4YxGp80c/O7V8ZTGUaYmhMklcxSLy8MlgpthbhNOSGjQthQZvz?=
 =?us-ascii?Q?pv/raP6LwXCucLxrLUUzJwrwwFujDYt40eOmxe57YAUSLPAjAi0aN5H1DeiZ?=
 =?us-ascii?Q?fcpChTvqF/urqVeRbLeiuLVlauuZW8UqASx7c6DH0V62kq25PWbPYL0Z2JFO?=
 =?us-ascii?Q?n0S/nAJnkJQQ7DJmBcWlPlLYpiTtcHjPW75GFJ5xUK+IQtx/V+wh6D6Rp9EB?=
 =?us-ascii?Q?GVKNRyLNZmP0ledfugvf6qyR09NnSwRrH08kUBE8+rmMcoyQ7YaLVROjn0rA?=
 =?us-ascii?Q?e01R4b8GtoCkSQnCSERDFZtfWLVmrjAgCMEFfl2uat6cwB2M+t4hps+V7B5S?=
 =?us-ascii?Q?ZstkW0U/wmyBZLSSuHZp5aC2oFN4/cd+pUhtWnyGLPnknVWWZ6ULnklDKQir?=
 =?us-ascii?Q?WoqiNRbvanKtKnJm3jTt0jOS28Nn1chENRK/nM2EsvpQLDvXt5nBL5YiN0L8?=
 =?us-ascii?Q?UtLM4Hs2Qj9jkc/YTE3IYYrEN4AMPzGL8lMvLH4Xb1zBiAbYwLbtUkD9zoKJ?=
 =?us-ascii?Q?y4lbHRl49A5fAth8uNFF2FguwN2vUqk2X27lQ7W/QB1I9C6o2bAK55X6SbCl?=
 =?us-ascii?Q?2CW1/bAa9S7h4IeHEx0dP4fdVrF5pMvgrGvgqBz5RA7xC0DVwwLY8H1R7exw?=
 =?us-ascii?Q?c8zr2jnqw7E4WsCzwqch2GRFK8yEKy7q2tN+tkqg6MCfwOCQnK8wK26G8RoO?=
 =?us-ascii?Q?6JW4WUZcyNeL6ln89kSutOX0Na7phAsJQN5pYp6KrlkE2kHK848SmfFvVpr7?=
 =?us-ascii?Q?7iX7gkxZ6MwC/OUsOJXOwNQmpQqEJo+Yp7KVpD0KoUfxsXTA2EBPaZUzkjcT?=
 =?us-ascii?Q?o2tvYhO2qSEFS2gt55ltwChx3nQRRx9wT9e8tFhjE5HoSAR3Zx0tLeU7e4j5?=
 =?us-ascii?Q?/xi/r52O42gVGfWBT8QoLQ6oCVTJp7OQzkI10Cquw86nwwxgM/WFIZb0DRsJ?=
 =?us-ascii?Q?Ljqv0si80t6VG/CiKCyohh6KXGl7qGqNNVeM21gIXp+PvF/7gNeuMJWmF1gQ?=
 =?us-ascii?Q?BxFxoaB4BFO63Xwc6YQJfLpKfk1qZHbgYbw25i0Qb7cpHLlbSOPc3Hr3C8aU?=
 =?us-ascii?Q?T+h+CTWaja1vCSOoHh5PupWp/xQCtHcRpsfBqwIss8RNjNxjns2QTjKoOvJU?=
 =?us-ascii?Q?/RJbxGBz1ywXErKQlEVgdx5rdUUfSedxBSh4WwWDGJ2kGG7F5JfJXyEZM3KX?=
 =?us-ascii?Q?HFkshiyer4uZYHJmDebqeqZwjTniH8r0ZngXSw5s?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6cada1-f2b1-44dc-bfaa-08de2260a590
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 02:59:22.6352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2TdjEw1KMwtRvqRNUWYtsTaeJRrD3ck8FsjP8PwOtOq0np/jNyzuL5tw8zp82UtNBQPijyuMbd/0Rzs1vCgp7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7570
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAyMCBTYWx0ZWRfX6hiRI07Z89w0
 6clfCavddB4muNl1Oy5agE+sKa6MwYXT30HKGdfs9t03LbnYaF5VfwBYwQ3VCFUqXoKEJ7whxmE
 yWjuFab9S+NQhg0zo0yhJ0Yh0wXUFPGfSWofE7Sh6nQ3T2LXO4g3W+YBOmSiTpbz4rD9Skfi4zO
 hZbx7pRRQCfYAaRqOBNqWo9t8voNmHTarAvJ1YDgWzjMwcZiDfa11mSZezuIgkA7MuioGdXDgQv
 0+c/B1dQ+LSsWLFoNkbSbdDdCrwcCQxY3CzpkalTly1fCpnxKZrfFVIqb+nhZVR04ML+KGAKz6E
 RPqVm+QGe0jpxJ3dkNXIy19uHrJz8M3kVik7+3OMHxfsfbJbKlsPW2CIPIGJ8EtytSotnEU4WXO
 f4EL40FxcGAA3U8hA8LcWiRUZWw2AQ==
X-Proofpoint-GUID: sshtVgdz720lVzLmEaTOFb6fPmppeMfZ
X-Proofpoint-ORIG-GUID: sshtVgdz720lVzLmEaTOFb6fPmppeMfZ
X-Authority-Analysis: v=2.4 cv=ef0wvrEH c=1 sm=1 tr=0 ts=6915498c cx=c_pps
 a=2KosHvP3s5kmPOqSYQ0Nog==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=AGN3R9wGTpm7tVkc7lcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 02:59:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121593

Add UPSTREAM_CHECK_PYPI_PACKAGE to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version python3-types-psutil
INFO: Current version: 7.0.0.20250601
INFO: Latest version: 6.1.0.20241102

After the patch:
$ devtool latest-version python3-types-psutil
INFO: Current version: 7.0.0.20250601
INFO: Latest version: 7.0.0.20251111

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../python/python3-types-psutil_7.0.0.20250601.bb                | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_7.0.0.20250601.bb b/meta-python/recipes-devtools/python/python3-types-psutil_7.0.0.20250601.bb
index 146361c5fd..fedc14f9df 100644
--- a/meta-python/recipes-devtools/python/python3-types-psutil_7.0.0.20250601.bb
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_7.0.0.20250601.bb
@@ -4,6 +4,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ec038232ab86edd7354b091c54e190e2"
 
 PYPI_PACKAGE = "types_psutil"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


