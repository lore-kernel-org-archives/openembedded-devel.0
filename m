Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E79ED7B84
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 07:55:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13676.1776153343612029646
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 00:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ItmVZFeB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=85647f3f2e=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E1kV2J3377126
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 07:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=3IKQk4vfl30Ap0Xq/NC11vdde11IV0sBbZv7HdNbxc4=; b=ItmVZFeBSVAw
	r0arbg2iSxmrKWIYP6PGN6BNcAYByy/zPuNF9RgCLTRpelEJomLWZBaV9LrVMwRm
	e5anwgPqUpo2l1FVnG51XIuJ8UWbfsRUDVynYWE37+KN0+yKqG0CBvlvopvLH5N3
	vM3aPHoxJuS0vCzF1Lzgd/sCKEQAC46L5vJY5j6zF6757qd9fnCVlJ//MJb+osFx
	vaDRR3NLczwc/EHdSBxuFjC1HosapgaYO3eyN9QPKuT1pw45xdRfm9AV7GjeWOZP
	pKkOlgzjt1MwbwhB5EJLO7ZI9CJhhbTWaPfCvLXIfeym2OXiSUJtjk7i9WULCXn9
	+ABhG75p1Q==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012066.outbound.protection.outlook.com [40.93.195.66])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh87a8ejh-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 07:55:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBvwoUoXTd7PVP+anbz00w34t2ItxAofWHLGWJ2KG+zvuLYqAZJsA2XsJKxE0jffBzw2YTVEsYHMpg5trMl+qywmk8wsAFIVPuaFXOT3L9egECUvvPtDJza2KkjWzT77trW9muW2wJLmRLXFZngwq5iuxOp+nyxlyK0oJY+A+EA0nAZICrhgh3gkRIrln7WdX6GB0lCrluhJziGyMgVj+9JaIJqYoWfiWXgedikjyNQz11GtmmwyxIT/0LNcotBm4CzATX8s8ff8rj5lwqPKskSS1bS0Lbue9PAVC6ExNAjbydVHBWPIEXo0dMhD6A93RP97j7SBgyxAXdgDAtTgqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IKQk4vfl30Ap0Xq/NC11vdde11IV0sBbZv7HdNbxc4=;
 b=Gsfn2UrYjGRPbrTUFX4aDJItRNYT8tp6mQJvV/iyDdPe9SJJNADTb4FSv8mxjeinQGw3T4gi3wzL94jqGIKkVoWbHCwSGJvGHkECqlgDIftYgjLixKxi0vhvOznVqfNTCgPIvVtCgKCmo3zsb7jMFAUlK0SxuO+FzrM+sRWHRFQ6bjasGNL9E37pY9xxy4SbPW3iVDa0+Ei88Qxawyj0BNT0dUwyj1xE/tST2GOZ4HQPiTcmSNS3p9BPdPbgX0rS67LZ1daoSw4ksnnAjufKd5D62RgjoReGyHeyYqz6XW1fyzVAw3bp6P18LT+TGCfCIt5K81o0kzDBhg4h8I4qSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by LVUPR11MB9786.namprd11.prod.outlook.com (2603:10b6:408:39c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 07:55:41 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 07:55:41 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/7] pavucontrol: remove x11 from REQUIRED_DISTRO_FEATURES
Date: Tue, 14 Apr 2026 15:55:16 +0800
Message-Id: <20260414075521.91846-2-changqing.li@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0e15df4d-b3e8-47ef-7e9b-08de99fb3914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|18002099003|22082099003|56012099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	TZU5mX/aWgocuGyjUYfTVd74guQaTO5KkqW0u29BIq0hSAZdNm7MVEd5xv3PNqSKqhYtlliI63dRbcs8wiokaaAuIcnnUVs1RugKXrf+tArCsbSujXFHIjFI1DCei9MwtQUNEIoMPng+KJE8e0EJJ0CsQLaOjzOGcyiBTrebukjq8dU4fY03qeCOU9uj7L2ZeSnTVWdvk+2n1P2Fz0yA8MAXu+bCeti/7U4JgUjyRM2ZIcWVzOeiIzKP98DqgOhOm0vTrgp1PCGL04qcxZ7K4ws9OXAbDAr+eVGOi7DDZhYGHXsxsXNL5/xe4IHQNQVCdXYtz90mg9BonGaUKzo9Pal7IQnrmjkDMbQggc40ziwz4hp8Hg/zxvtQnW8xaSiAzV+w2kgL4Ypi1h1cKa2Rbqzgb9Zkrhxaf7pScc69Jepq/w/2CQdoi9GHZI9JJygJkuN9dtfDgNwmlha40S7TDk50EJSgLKs9U9dSsT4bwlh9HSQ4sUxRDKMJODEinKuYMSUvDH0NVHVjJ2S3JILjWrdIqF3xJO538RERB2Z3GuZftkE5wVmvHHDx5fJfLlBR4TmPZcadEPerlohm2Arn+73oVQa1PUGw+ZSXipLsEdh94tbLxRXfXXWJveVInUX1SypUu2vvniJq7C3Pbluqxsr6UYI4GL8/svSSMsD5J//DcYG5ouJCE1cFxd48aHR6aNjBb3YhanX7eBe+X26HW/nhfSW3AGEFQJ2ToijtVckpVihHpAXkgb18xPUWzqlJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zNnXZS1VlAsoBs00bmgAS5HJbxUC3oRVEYSwKZz1IEHPVVDJI9rWfHXczZdX?=
 =?us-ascii?Q?I9rHaA7Wlf25KB8tkGNEyDMyqnkmGUGcpO76AlK7iSQAIn7CBbSV9u8Zsac9?=
 =?us-ascii?Q?0Cf76zvJllZE1wUrB3ETL27jiA7c7r0SjWg3S2fogKkEhr6L65Op3UEsI8ti?=
 =?us-ascii?Q?DKySylq7klMyxsIZOBZs167SpDGKZd0j6QUHIqQ/v70UCiPq1qi3IYpR782X?=
 =?us-ascii?Q?7OQG15HLNh4nyRhADjaDDGzN9g7oOxG5RYqHgCC4n9z4PJjLR1q5SpugDVaC?=
 =?us-ascii?Q?C+trLZfCzXayosWmeIncFg9d6C1oS/17jXPnzY1qBpq93/WUWKscWs54jXGU?=
 =?us-ascii?Q?afJmFBbNaxR+v0VQxTDC+T8zXMHQWab3mNREqn8G9hkQ4WY8dIDBhKaQ5edk?=
 =?us-ascii?Q?SmPHSGIklwlmvwA1uhgqtaldJNxXWsxVTDaeXNxuQGSzPrMIqj4oBlwyNh6G?=
 =?us-ascii?Q?MzpHeQiaroleEI2isEWH1EWg5TVZwNHoLE4pIP5RJ+Y0XtLXRu2koPhXeVMY?=
 =?us-ascii?Q?Gr7Q3MRyraqtQAhjkphx8iuyd++fYXQ1iedYLVg1RrteDcscCf7VkfSlEivg?=
 =?us-ascii?Q?+m+M7vhUYRCwG9gLPWnJ3h3S/nB+ZajDPffd1yLSoznbxVSIfI7n43HTaEea?=
 =?us-ascii?Q?BVVhvmfYhcWSeOf6gHnmKqDEzm3YB5H2QHoqfrNcr390Ic+dU1HatNnAy327?=
 =?us-ascii?Q?rt0QiODvKQmwnfFGIymM9yRDVyCggNpy4ovSukeuTCjs6itz8uwnpcZOkCws?=
 =?us-ascii?Q?eKYOqUcvKgYXXYrGdmvqqtHYnvsiun6A8DBbrtzahisnwk5u3j9t8tuQ5UqO?=
 =?us-ascii?Q?As9w/5X915Q+wIzleJuXyH7wHrYkrR2BOEoUbijRnUCmBBa2KR405kUIMhGq?=
 =?us-ascii?Q?5oWqMdl1049f8WFJdg17j4eBtM/597KnrYldJX+xey/n6UZbge8MlTylU+rE?=
 =?us-ascii?Q?dGqYTRgqkMyuqvuRLAldE8SEQgd+BnM/fmLOkY5JtoIYi9lOHIKdGUjGGg9j?=
 =?us-ascii?Q?le8Y1E+N9GDtYqcQqd4F3NoWSS8a9WfyuJRskQWsx+fVepRzCxtqoSUtol8L?=
 =?us-ascii?Q?pHMac5JUXpPySGtXtXEUo+6y5RF9KiHVmxqrfms6WHPyfDcuNNRTSAzQQQB9?=
 =?us-ascii?Q?AvN43HNzO+vM8V5aG6KtbFzl/mAGX/9x7i0y4RZScN/KVrQBgPD6Q3qD+625?=
 =?us-ascii?Q?1kGpXT6w4NP5cZsBPXODHy0Zr8cuP6uV4X4SuAxjshgsAjebNRXJrA6TEyj1?=
 =?us-ascii?Q?g9I56+PUirVoMp/HKWQFg7mHYsnHqOLAR7qme2J9YlFCTnqgvPiwjjWyKTEC?=
 =?us-ascii?Q?T6OyEHwKKit8pdLJ00DrsjvqTstGsj9H00KDJoeJOhcKRGxuIm3+O1mlJHQV?=
 =?us-ascii?Q?EDMreY+5//gVDLWHv7gjoL2V9wUqbjnxPi1Y5hvR+FZ9mVfTIea4rEUolJu9?=
 =?us-ascii?Q?MDNk+j6nWNG00+XyIJiOzKfAXcue2LKRoJO/Mh7uOmtw2WXUxfdFvukK5QCw?=
 =?us-ascii?Q?EEs3f/kS0LVit1OYnga+Ge+mKrWWXoOH1h5rJk/sF4w+zZPEzDAsCrAA2iK8?=
 =?us-ascii?Q?jA4Jyd84wsYbH7kO+gOJWY/TQ79T8KARLM3yUITC6HXcVHz50CCdGw1iYHuX?=
 =?us-ascii?Q?TdcG5A9XEB+BbhWb0PpABt8q947pNnNgQ0UdGcgcVch9G/RZ8lwNQdx5oEVt?=
 =?us-ascii?Q?7rB8WqYOBr8nVklPriGOiAalktkl8Ju4QqVKDuTAZjduUpF8DH3k3/O9SPvp?=
 =?us-ascii?Q?rj6LEiC+9n9h2l1YrOP/jwQsoZZxzJo=3D?=
X-Exchange-RoutingPolicyChecked: 
	eAKhhRijvsyR4wY0GuGNIBmWG31I5Asuz48CJnnGlAWii14phq5V82LHij7uyR5WJ/iHJwKuqNZaFbje2PTymz4vl/WQGo80A6USpTsrXpn2mWstuFg1Z57/qPVidoDJ4HYoQPxMgWVkKy/i9hnTCcosK+xHYXFlUNcqtSev6pVDTMCd/RJerytfrWWWxcZr1YQYnTc0A50xf5tscQtplVnxDndASSDuwLAD9FKN8FdIUc4PZp2SxYuj/5kZ3t2Zww2nwZxgn0b359Esk4+VDRQKtlgTTuD/GTC0+tMfn+9OSTdqK+IMCQjBT2Hj6e8O0ZYUQdmZk75fx9r83Ucjeg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e15df4d-b3e8-47ef-7e9b-08de99fb3914
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 07:55:40.9955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+OdaOLrIO3UfckGFElW2P12HGcaHubsrTrCE6SPLuhxuAzDT2cA7xUtxpoincpZeAYc91579A/eelM1LcjkFDTdpTgN2tyZPU6MbOPNWMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9786
X-Proofpoint-GUID: zEDugbxBZMx5bUZUmFL1wWxI-Ltgqbt0
X-Authority-Analysis: v=2.4 cv=Q4jiJY2a c=1 sm=1 tr=0 ts=69ddf2fe cx=c_pps
 a=T5SYj2RWWwK9pVLeGBda9g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=e5mUnYsNAAAA:8
 a=t7CeM3EgAAAA:8 a=_OtIFqSj5marew2pGA0A:9 a=Vxmtnl_E_bksehYqCbjh:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: zEDugbxBZMx5bUZUmFL1wWxI-Ltgqbt0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3MiBTYWx0ZWRfX2vy02Rq2+1Z2
 oqgfs1nguf3rZ0e1eLw/KdvirAVAtd8tGXvR2haV5A648UXfB4wXVk/yS3kAX+eGJXUG1rCCwpA
 5WBnuevmj9zX/wG+n6qUvOa6bo+W/lEIqdEnR2t6tUiqbTrcZdZMdZ3x7TJvZv/u//scI8MgE3O
 PlxfR6Lu0aD27utbUdoeyGU/RkKq2TGeVOPxRSL5x05x9xUbCPHxRTYyzcTqsfhF48yTimWwLRR
 0PNl9q5U9X1yyXVJbLPEYCNZy7jBZMajQOx3u0GwWfVjb8yzwEJ6pwIGUNilosyp5Cj0R5tJPou
 2LdnX/4pVi04IzJlm5gS32iZqpKYleD8qqVpt9ECv/ZN2fVLnVPm9b6nthoFUzKrECsCvoKhsCM
 1H7C2oS2pMVs2O0JQDuX87lzMkNBZMEZhkZpFduosfK/4wgaz/GEXclu0cZDZq1HgtdToUo9ac1
 rJBvzlJow7PzHKL4Zmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 07:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126297

We add x11 into REQUIRED_DISTRO_FEATURES because one of the dependency
gtkmm4 require x11, now, gtkmm4 don't require x11, so remove x11 from
REQUIRED_DISTRO_FEATURES

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
index 9e54f49dcb..b6b9a068a9 100644
--- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
+++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb
@@ -9,7 +9,6 @@ DEPENDS = "gtkmm4 pulseaudio json-glib"
 inherit meson features_check pkgconfig gettext
 
 ANY_OF_DISTRO_FEATURES = "opengl vulkan"
-REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://www.freedesktop.org/software/pulseaudio/${BPN}/${BP}.tar.xz"
 SRC_URI[sha256sum] = "e93a7836c7307dcbc989e95fc7ec0878322514c475fabd90e89ed52fd4f15d32"
-- 
2.34.1


