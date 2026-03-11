Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7E8FD88FF
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 05:07:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13755.1773205626816062943
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 22:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sajOIYFA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7530e974aa=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B502Wi2757543
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 22:07:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=mHdLU2YLGIlLFUmo3L8LiXvpbDFevo6KBWPQGNEg3K8=; b=
	sajOIYFARNRGnsn+8VGTp3j/CqnfLLMgK0hCIowaFXfYN3IIHQ/Be1yNooIsMhVM
	4d4wtZPqV84Bebb8EgX2UnOQD6QbgV673AniDSDaIQ1dBcxijJXlDX2Wciv9JxeZ
	gWMexlu6de3xlipPqkNXLAAdFy+0jfbg48VIkfei3uleut8wgOGvc9BkOQcRdRFS
	ZFt1dU8bkdr7wGf/x0qyKQa6t1460Y7Ah8vjAYBn5E3R4P/Lxz1HhDww/F2kPpmP
	47e3sLPCkmYrtuMcVWOi8m14RKm3YNYACeceX6FkXMIm05tL2RMAqycoJOjK4hUp
	boNKqRhe9IOc6hP6PgIvoQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011024.outbound.protection.outlook.com [52.101.62.24])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cty3j04uc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 22:07:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PhFGxDq99ph8GN+kvbMCHvX2c7NJMEOVOOYzZlv7ApFPVrrEF/F0ESi9KpwFK/+YtsnLZxgm6ePlIBmtRnanIVtlUSx0BVfgQ7t+KG/afrFKnk5jzLYulY61hzJ0gl0sj5pVseVoL90vODzsq3sumOmfXLfofZVGSKSaTeHasVBCctyTDhf+YO8XlfXpxEY3ppcPFARP0Nzq+0M78QGmaHP92cDNTwZfEFhHR93VT8vqlOa6s7WW/btjAJYQhDr3I/DEnus3vAcuNeIOGjSl9j6pSe7jLcinPkjFGz0ZzRW7M2s+G3dz9qP4dtJZbpUtoVIIRUdNMnnZL1GHn0O9og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHdLU2YLGIlLFUmo3L8LiXvpbDFevo6KBWPQGNEg3K8=;
 b=hEa6CQDH3C+ypK0Ssl6j+HRPaiMS54d4rgpBXHoW/rXNReTDeh1dOvEm0UflEiDgskFWqre18U9hfrK1ch60uzFLFXA2RcISimCKmmH39feG8oBeJwsEUrXkB3DSuWY0N53EZGmImEQlExWBkVGSMMF8mQ64eVlU/NYliDg2KVE8EjHjpIeB4QoDpsSN5pems9YDRvLF0VKnKF7sOvYDf1BoH0mwQ+JChXOkXIdE2oyk8fD2vHJ52dacsu1q1h+9cwqdTCTAIq1Jbx5EFWsCd2G3UJnyhEKiFJvPAxP7qh+gTrZQSWiMnI2IV3ktob6uF0uRvIyTKYURpgR2zaPd/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.8; Wed, 11 Mar
 2026 05:07:04 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 05:07:04 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: f_l_k@t-online.de
Subject: [meta-gnome][PATCH 6/8] gtk-vnc: add x11 to REQUIRED_DISTRO_FEATURES
Date: Wed, 11 Mar 2026 13:05:54 +0800
Message-Id: <20260311050556.2079418-6-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260311050556.2079418-1-changqing.li@windriver.com>
References: <20260311050556.2079418-1-changqing.li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0144.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c8::17) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DM4PR11MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 72ae8106-2701-4be4-95d7-08de7f2c08e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	aaHphmxXua4UkawYd67x+klph5IbXCR+2b0+e2tOEAvu7ogsU7gIcLVQZDHfMAusBR6Azf29vl87JSdbMhCi6ghaTc9MyBDhFjusMDzxhJtWrN37tjwTt3Te/KIPQMzp/fhO3POYtI8A11eFVcBODxQQ/gT/yGCL25CyBLpzhjKo67XtaeP9C1UalL1+1DI6wvPmI2m2pckVhNR/05blBwZsCXfB0hKhzrnYeo7j4e8oPm7/okbJJxjuVC2ISNOyX+b3B+BeiigB315ib8a05GeUl7ZciLfWe39hhymvgaVCssQ9FfWIwYHRhPwd51Ar7dIXKFzqobjYz/EfvD8Sax2W9rQDNysMrOTkEwrLksGdx4SyZQQZA3UkZJF4va6krP1RI7UHh+v6VyYWUX1ZPRP6s8TIVlL8O6vAAgJMea3du0JCNoW5zi9dmTuVE3UXgwlBk5f1OgIy6N0WFdV/LJkOvFi73IKXc+IPP2TEQU8WaZNuhSlbnCw5UMKr1LSNZVT1mwIl+3Gp6FoWF+UNLqEj9NKWRZfNm8uFNfXsdsXW/xLj/mmVn2rhOo/zuQczbZa0zL69D7KS30Q8u84yoYIym5BvMYS7Pf9fNSbhhDWsnUdcu8ErrwmincIisd50QBXW9GWsSy9oJefFIZWtKOODUm6AcEiKKA49dhyNFQd0jlGSlyFLm0KOEoEkrUeJKkzN7z5G3bNJoTx0GyLWiXpqL0iaFFk+i+RP0eTaKrNqU6jT1cSRBw+bMbEVog3cMX6jOY3qjiQcDczzHcvnzPszGSYDV0hhEcTQpItbDT0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w9rngCfabjjQ8qEZL4eoSx4gEVx/UGdgga25AO/QbKuO4MgEupYEZs6iekGk?=
 =?us-ascii?Q?+9+NqiLN+3USRUb+AmIfiFPclu9Ab/eI8Kb4+meO2m8nLSG/I5ixlWdamrmi?=
 =?us-ascii?Q?26wlH7kNSZTGUqxADZ8yNikafd9QVZg4i1Arj0tggfDQkwVqPlfMn6XCjmfh?=
 =?us-ascii?Q?jf3EEppEKXRpAB9h12G3H3KiKBXb9Qydd//pl0FLIn2wmYuy+0Tynw+U2LcY?=
 =?us-ascii?Q?WC7h9qAmCt0CKGi2OG/7HEwjKdGETbkRN2W+bqsQ4I2YQu/YTjxio9noIl3P?=
 =?us-ascii?Q?IfSJKyXMik5y863ixPAEaOQHniRSuCj4AowZFKwph3cov4BBbjirPe0FS12s?=
 =?us-ascii?Q?2LEFbNO160pXSpUxteFZQnZg/lslYPaqt9+/mGM7c2pKkoVP7H/rIM3GIBc9?=
 =?us-ascii?Q?hwtSwzyik4xL6G8Y8AMxM5rgEtzl84UvXPw4Deu64JYy+htHpKExpa1uHNim?=
 =?us-ascii?Q?ZO9UnUdetfiQevDn+6wnP3at2tXyeSqJKOB8/Qa1PFeexVMJ4NGcYVWke33v?=
 =?us-ascii?Q?/5Hmm4erGqVV/qZYwO9yXlO86ezxn2jJpCS/B+WIGmPKrkWbVWD2OVf1bxHY?=
 =?us-ascii?Q?ulCHJUueHAqnXaMry++02HpDVljPrH30CpbX2tiuIAbPbExPKskUcFn8UX8B?=
 =?us-ascii?Q?TpqWrc3Jo0aWtKZcfm4YQCFLy5O6988CQ1LQTPELxXYGxzV+zNTZKAwf3F8G?=
 =?us-ascii?Q?kGyyG9H9+Ef18K0HKEHXr93gZeXWrjqTQS7D1wxsAmW6nLaHSg33KqfVHcA+?=
 =?us-ascii?Q?IHq3/OW32YTdCCPSBJafJBqjig2Tca6YWv2lWysJNixPPbop/QyDOu4byEtP?=
 =?us-ascii?Q?1CMeHy5n7F6XSlNB9oZ4RAUTukeBv/Ac898GvG9tuF39NZ6VnSRCxOdRFEre?=
 =?us-ascii?Q?orDB9gH02EJMguNm22HdhbUxPMmMUZkwuJibecVtN3ST3qfKnrUB1GUbYF54?=
 =?us-ascii?Q?n26InozqYSQrKpa9vuG7Vv40wDXpmOlpl6lHiLl9bBlrxlyZcD0v+KEP6t68?=
 =?us-ascii?Q?/KDi0DwSuiTJW8i80CmyruuE+17TTTo/WBLC38ZHTzjXZDnn0SwQqrAJZEqS?=
 =?us-ascii?Q?omDolbyeTpElTLIsQiqhX51Dy7jLFa5DhswBaXDk4jouqalVU50MeL82O3LT?=
 =?us-ascii?Q?y/GidhtZJS8whD6yVSsen6FZxNgF4bvPGAEjZ+hgjaVVaH6CBQsO10dk5+0L?=
 =?us-ascii?Q?rNbM5PMFTVFWG2f5QKdRNqbs3t9nvAlWSrLs6dQvHMcgQI8sHMseB4MaCvnS?=
 =?us-ascii?Q?sf7DcDxYeJXgChXgTec6e29RwUm6cd2bgKAEENjnbOkZvGIAtaV5axb6bB+5?=
 =?us-ascii?Q?6XLapXiq2Asnls7P8WYlDKcpylGZDhdGIzMBDl5Yp2Fkugqsex5qYPkvLopJ?=
 =?us-ascii?Q?yMlJ+PIRzMoWqfISdUN2Acd92yHGUbrbCWm1ifUW8T9iu9OIh1XAeUp2+Bmc?=
 =?us-ascii?Q?3drgQRrCjwH2SWo12h2igDNNcCi1JamYI21/Tgz28mO72V/TbS3C2duJWN9c?=
 =?us-ascii?Q?LCw+wurZ6KffDVjsTJwHJYiDuWoVmKH+EzS+z5EHnhwQFSdSgSqZld4JORi2?=
 =?us-ascii?Q?dh5szs9NAKnegohMkmj+phySJkBH+6M1PhsTjspvy8FWRrUb1XxiZczjcrK0?=
 =?us-ascii?Q?kFMyYvWihN3dHJBzC9KeCEWoJH/at6CqpazQOGrf6EIcWJ17Ql3E95PcyHPF?=
 =?us-ascii?Q?iXudNbv0UJdmiWAZhSA07BXiCCSwnSY6jYWxr6weH2cPI1UGyi+ib6pzXbWK?=
 =?us-ascii?Q?dasBUTXpiobBUyaMJ6OZSDWwCXWqMKk=3D?=
X-Exchange-RoutingPolicyChecked: 
	WQ2bFqKltW8NotWHpivHWSfdVQfB3q+26DxmmSzRvylKGtuZLbsXwbJChSKQw5GWOpaQP6EeZU02/xPdVu8yoct7WrrK75jwDExWdEIYgdFuHo4rPnQHLz9Ad3V5pUrgdSSufN8F0K/kXVmBF2rvYz7SM7v/7tK/mXev/UKxSg85QmhLgRlIYYhhDktNvr+gopipvLIZvZ+pqI6kThkBygd1Z7noYjTWln0q/LSbCKrA0s9WXrIdKQ0CAQsK0lBABydOQZ7D5/0SK3VFL3BpVBcrdaqPGSrotYD1ywnQcmbk1s+96dpUy0hutKORwZCZFlmjx3ACu/2K11wN/lLdnw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ae8106-2701-4be4-95d7-08de7f2c08e4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 05:07:04.0520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2kW3TdzOyQMqiJP5skXg8WJsjerKOhqlKur/o6LH4F/WOAi5aZzRx5rWafVUNGOH0J4ojiwrxZ1ttmlHqbEkB2bw+Wpg75iCo2y9QnvbsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: rcMpNuHLh3cF7obZ69VaIo9km-s419y0
X-Proofpoint-ORIG-GUID: T96i3dWst1lztdtQNyOzJe4qNlc9DfGX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA0MSBTYWx0ZWRfX36KGZD+P92R4
 6RKu4FxWp7rtkL79ywmcXsROJriyMmK1o6kBMB3RqfpxHp/oKD6Fgg96ml8XWaPwn95FbvhFdgA
 5vbgY7laXwS5oG0mRrQ0z5rHvavXyaO4OZPZUB8k0NuCTceuyR5xZGP0Qe5Y2j3PlC2NdVRJdlM
 U+sJaOiu4e3Xl3oDj4j4Rmuja6iPGcPO1GyDlAza37HL1moP5cb/LNh2OYFAftrbaKbuTGMLj77
 FKgBefgooqyShkYJ1NchJq2gROhNn7uxudBy5Q7V0LxWyJl3VgIPAg7OlKy+z0wMmi6vNInLius
 b4tkmmz11MrvOrKya2q0twqMeYHhx2L5PBXlXgK2Y6xpBHRF1TQyxoGzP6IGt2GSvfF73UnBNBL
 gw5Amc6ebCwXgCrkMq/RObENXq1DdWoa3ErHydzUEG0GdnN8Dubmc3ye1ldWrxmOahzcidBFzlq
 Oqu9IY3lobCbX0deM9g==
X-Authority-Analysis: v=2.4 cv=Qr1THFyd c=1 sm=1 tr=0 ts=69b0f87a cx=c_pps
 a=oVQupeHHWlONJbG3R3cvFA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=6VkjH54F1Yo8vJXnF-MA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110041
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 05:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125056

Fix world build failure:
ERROR: Nothing PROVIDES 'libx11' (but /build/layers/meta-openembedded/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.5.0.bb DEPENDS on or otherwise requires it)
libx11 was skipped: using DISTRO 'poky', which is missing required DISTRO_FEATURES: 'x11'

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.5.0.bb b/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.5.0.bb
index e9cb53c97c..0c095f8be3 100644
--- a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.5.0.bb
+++ b/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.5.0.bb
@@ -12,7 +12,7 @@ DEPENDS = " \
     zlib \
 "
 
-REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data x11"
 GIR_MESON_OPTION = ""
 VALA_MESON_OPTION = "with-vala"
 VALA_MESON_ENABLE_FLAG ?= 'enabled'
-- 
2.34.1


