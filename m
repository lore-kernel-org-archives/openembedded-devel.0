Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D30CA5FBA
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 10:39:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10369.1790764754029089394
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 03:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YcSeYuPS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=47337851c1=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7eHjG3868189
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 10:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=EMuaq9x+DwGKsH3utP6t4o7hz998LvaWIdixF5cjV2w=; b=
	YcSeYuPS9a9xbEWj7z8THmu8KXzHM6R0PxtthXoIXWkNNAC29bG7LRo14zklyRxY
	0rjLMJ9+7DkNrSY3rVXxHe/lgV7OJ3xEtzhLgDNIKYrAqrOB13Zn0Q/CyxPw2Abg
	Y13W2/1+zFXONET+zXZceQhC3JoHlju9jWduZaZpeW6N24fvWymFBo4tRwGLRaNy
	US/2E5jdRQxYYb1RlLDstErO2mnsUH3Go11cV9mrCptzoX0a3dPybuDaTS5clU6H
	YKvqBs+wxkLylrDOZeW7HuF2+07Zda5/KayHR1785XXVSOMZDB1MvITEln/aeZqz
	7V7Ovxsx5vzYs2m7JYsnXQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023095.outbound.protection.outlook.com [40.93.201.95])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gx515e88p-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 10:39:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/esKjRdEr9Kl86Xyvrcsvex9jgEA7QsFH8wo5FNlvsbhJl8+ZdKVLJabrDMgxEHVR7DiphjrOUHjjVjFVfBObgk2xOTpIXO6L8rEA8HSlrjBvoJ9w+mU0zNRjiOQsemHZwsk0CzQ+RiY51px3jzqWW9GFRoLeXtkJ8MqKjnVwHY1KfQfzK6TH65XjiycItin5NkV9jYlM9n2FsMPG8ZzTM2+WucvHVTnZ0wm6dz3RFFdeNQBagjx8gOMxAbd4tQPkuqK7n4yYIBsUgu8Lz6wraE9vNfAVyOJvamrrxSWkbFpW8FtavHr8pHfA63762zgkXVynTtdIqHKp11joTQZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMuaq9x+DwGKsH3utP6t4o7hz998LvaWIdixF5cjV2w=;
 b=B5+HaVo26cKWBY6K9kW/OL04hg1gkSx60h/DtXFNlsCmT1WLIVsvBjJ2qYZz+dG6YZI/WzHS88/E3/uvJQmguA6Dnvgpv+95PDuc9CH19sKTk+vnB//QKieeYkRjz3OuCWk8gwuQ/N6vsv4Nv1mXvm8oMnVxezXBk8D7Ps7CbirO7YYnbC7Gl+j6EGaSgaY/ZMHrF4WKJt8iffBXZ95VeKFEBft44pvdHp5Joh+C22fc4aQhx7wB9/8e+eKTOjbmQVe4BpnDokD2SSRO4lk8jqZpP5ASrrG0zholwuDGApdcxJZamGox+G2TabRzzA8qPsO+cOy/ipG1Rd5QcOhBCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM4PR11MB7328.namprd11.prod.outlook.com (2603:10b6:8:104::9) by
 CH3PR11MB514151.namprd11.prod.outlook.com (2603:10b6:610:360::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 10:39:11 +0000
Received: from DM4PR11MB7328.namprd11.prod.outlook.com
 ([fe80::26e8:ea57:9a33:9a86]) by DM4PR11MB7328.namprd11.prod.outlook.com
 ([fe80::26e8:ea57:9a33:9a86%4]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 10:39:11 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: Deepesh.Varatharajan@windriver.com
Subject: [meta-oe][PATCH 3/3] librust-cxx: upgrade 1.0.197 -> 1.0.202
Date: Wed, 30 Sep 2026 03:38:55 -0700
Message-ID: <20260930103856.457219-3-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260930103856.457219-1-Deepesh.Varatharajan@windriver.com>
References: <20260930103856.457219-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0167.namprd05.prod.outlook.com
 (2603:10b6:a03:339::22) To DM4PR11MB7328.namprd11.prod.outlook.com
 (2603:10b6:8:104::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7328:EE_|CH3PR11MB514151:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c1a97b0-7e2e-43fa-bcb3-08df1edf101b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|260925021311599003|260925022911599003|260925021911599003|10067099003|56012099006|11063799006|5023799004|18002099003|22082099003|6133799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	JfgIPLGZwl7ZCphn1wmcnTkcYuQl9JO7nyHL1aXpRsKvbSLz9AIkqI/q6nKtYXc3G5K/4ieDVQ76Qnj6n4yi2gM/du69wiJ4qcWuF5Yh9J/jOKBLtlW2G2a3OsMulPmrd+mGxYJHUbkU10yDrxwhm5SC8cO2LvthdorpUVjbHLHAQMr7y13W4bjdr9shr0f6vhi/GpiTFtyI1p37uaIrpQRSpUa7oRFQ7Nxhxvw3BnP6uvRhSVy++ICmfmJRK+ZKV3v/iLVqaEdA+y2jGwtl4v8rBBBfEIna1QFRQgbTyCaHibhOOvPdwS/th0gPk3fnvoCTlZFU0ub/iKSz+Cr/K+Lk9QvsVHHiXNONgwWn9nXmkE3mEK2CV1dD0fxo6u/6+ap/inUN0JjDWB1jFZkmESLdlIddTxnGhexfftw9iJANvusMjY84rk0w/fH9ncc3bE9vn9Es6nQgzosV9tRTu3DDj8bRpCeQrfxxjLAW1nk3XA18IeGuhTBv2TX+tKoLY+W3TZdSp1b4jSPmihmnUDgNHgTajv37Li54JkMzoD+wA5RF5bH4xZxS6CvupV8GmJlp2ud1+ARpcQvUM1nnqTn1S5fKHVq8BCoi2X+5mvvi+iOl2luF2/Czwy5g8P+ahAxSq3W8SHHUM6Kct2pitVDWB4Tqck4jvMvrNXpt6V0bUL+v3UhGp5e54ITYTPTcpdNM5jNlh6f0bN/Fn/XbP4a7EXGei+47rqSTSswIh4s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7328.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(56012099006)(11063799006)(5023799004)(18002099003)(22082099003)(6133799003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4cPlN2gV6O9mE9A4m2MkJ/eWyL3AoXOxm+TJ7XNnWdYL8AQC+cdVWUsSG0Zi?=
 =?us-ascii?Q?g+x5u6UGZoRhyifCa97suzLOaQ23L2riNfwiwen6CYc9b+9GgfyAUi9Pe38G?=
 =?us-ascii?Q?ZsW4OZQTRoxQ9YBKm9TDDa+87RxXN/Dv06Zn1wZ36boQFkBYWZyOjoBT0rrU?=
 =?us-ascii?Q?4Oy8CoY7UPyQY86gcpxcSnoYcKvXa6G1lqsb1OA2DrD/xgwNClJKdQB5X7Ws?=
 =?us-ascii?Q?+ktRUq1C84oqBixVH9+xlFDoqLC0rV7u0tRKwQy/ZlrNUo/2L8G6tQExNDTT?=
 =?us-ascii?Q?c5ui/LvivlWwbFZXnG5zAvMEDWsvFhHrTj9u3rVe+BvW6uosO6LsaWpjaqKZ?=
 =?us-ascii?Q?eVk2ygUJACQYLQoeYU7K07DcYBbdl0ukmwF0exYXLpX3cXtlDpFB8WmxwbyD?=
 =?us-ascii?Q?uMH/edlV+0GCfyGxo3vV7GV2qhqzbXh5iunSM9hGME/Sy9p1p0y+l3E56e9h?=
 =?us-ascii?Q?58DHAFGuFL2uqAswEnd4+Ay/d23z4xmXvAu7YsAxMGsCpwW4qfoFqOLhq7Bs?=
 =?us-ascii?Q?0v8YtUrA4RXxYtDhl6k+PRih5uXi17Q7myX60EcY2+gT4VXxW0GytpBMCl/v?=
 =?us-ascii?Q?o/BuRPi8XhSuuOAUaTqPInZ3QMn9cOSf2U1SjvQgYrrnd2u2BTJys+YIL4lq?=
 =?us-ascii?Q?OQUnTHI647u9V/v1ExDXTbWfuOXkt7JkpubxAMi2OceYQqXKBtam0VMSTmjO?=
 =?us-ascii?Q?j22r1YPVYt912JhRz2Zr6HFevDsZAsNfgVZUx+4CG0QMZDj15TGaE4eH+Z3s?=
 =?us-ascii?Q?mgwUMjAvuOQqms+toXwutDIa+rV1+i0XLjfCPR5+q2cgR+rn351ofBV+RsDw?=
 =?us-ascii?Q?eCGPLnvc/3glgeQHZgwR1K47UFIdaJXyRw331mdcZSM//8NWa/RH8+xQYW1b?=
 =?us-ascii?Q?cAZw8xoBbYxBOSTnwwYW34Yabh07mq+Ju0pb3HmSf/ZTO3l55FyMnRv/PNgL?=
 =?us-ascii?Q?L0kmc0XP5sfW5P4zegbL9SadVOGmLDsiEmMXTIR9VXraOCbUqZvMRhs0hdBH?=
 =?us-ascii?Q?/4wkYP4Tx0ffDO5UDm6ojIHMIP3oeY6U5MiHn0/JrpyKXrWbDLcBmlor95+1?=
 =?us-ascii?Q?xijEBXV2zXp1csLfLZaQmu/dUbb8Q1mXlzsSt6nx8EUKM2gi14c+eeC+Ieqp?=
 =?us-ascii?Q?3OmVNzzmHYrwBt/bQzIPKCcB3oGVKqawaHKCv7o4b40baY4MTAoNC2DQLlIk?=
 =?us-ascii?Q?yBQp4P71rksnjKgNmWmPZp515mRvJNiNa6v91+B3JyY2kdHbxSuB+T9deHCq?=
 =?us-ascii?Q?WRmpTjsOOrrsoG6atTyG5aJBJd4dWWUvtLlNT0Roi3ZlabnsrjhYW0xBwOB5?=
 =?us-ascii?Q?RB7AnRyAEngavLCwCnFgA7ld/1t0ktd1TIvitI/Wehl3zQHQVKWcUklf6E08?=
 =?us-ascii?Q?QfPaHOmD6xfKfG6z6kkEefo944V70s5NxVwOOKBAaaDsZu5N9XwCDS7hCm0W?=
 =?us-ascii?Q?AU/BZ1AVNdaCf2HVZyglbE1l1C997BXH2uLL1jfOT3tJBU24z4TohtQjIi3S?=
 =?us-ascii?Q?vMIwoNAnuSZNbRqYR1M3zh73bsccfexkkE3HtwX07tIfMcXVfsjE2I0RobSz?=
 =?us-ascii?Q?3TXKqPxIjD7IQHhVk1B939K480tlG9HJdhGhIXDieGK4Ea+wMGnVL2ISxiug?=
 =?us-ascii?Q?IkL2nCcXJpISeZyaLrqeUcn9z8VSLAV3Wtutm49ru0Z6vZehT26oi7F1NETV?=
 =?us-ascii?Q?VsCxrzCk34ixunRPaw4PNlrwuE+6TEDnLf3kToFZY0jY67icQNVzbKEYA4op?=
 =?us-ascii?Q?byj56VDnILE3cXdwj3RUTF357zpmMT+vhoOuXjK9r1oOheRSFppp?=
X-Exchange-RoutingPolicyChecked: 
	ByagaAXs6sv1Svy3eT1NobcPnkFs7jqg+YYptM/Jmk9e/YOy5bKWosTli0SxgRih96/dN5wpqMsXAP4rerg5QDL+ept/xcERUERDT4FsX5ilQBNha+LkuQ/flxHFd+JrNJ0WyXCqTsL1y+1MTngmIupVc/p2BLseGmRM1+hLgyCw5lNs38rAYUH4LyFNacs/tsE2wYjuEkacSIukzjeCskKxGEdawfubFXXRaScXR+AcjtZz1NMGJOHBBLf053EPK7zbnAHMBgayI4iK9cuYmnnR526iZRT1fJs731B12tqymG5EyI/zfNuBTmukz5h0ii1OcsPNVJrB8oZQw3S/Sg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c1a97b0-7e2e-43fa-bcb3-08df1edf101b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7328.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 10:39:11.0170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 359clHGYoqhnJVoPbk2kJbb+AKZAY8uoFV3wgkP/qnrxJF8usjWnO/kKsSJnrdbmnfxdDUbg7It89yD9gMlMEph6zncNPPlxByG/rqIYODf3r2+i62h5sOEOkeWUK+97
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB514151
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MiBTYWx0ZWRfX9JuEF0DICjY0
 oSnEDLZfjKgCYhHT+JIF39jhvhNrjLzD+H9IDrawplfB4UXDiPwMAu5yVCuA74wM9BJqi7Zpk5W
 p3MEKCvWd87yIonxEGtH/qFf+SqDdJ+f06qeErzgNUQdqxU8yzw5
X-Proofpoint-ORIG-GUID: Sqjk3_klUw-J2MLi2VuAy3YN6Rzf8MWi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MiBTYWx0ZWRfX2eXG2o3jkIBO
 bF076C9klWJL70F9km+dQk6v+dASrgtEVs+andDDuHW0P+Pg5UMMNzB4eVUmjdEc8BNWibIC7t6
 py70fEeJ7R0JnDLaqhl3atOXv6NZNVOQyQa0CWpYQOMrYMrOwB0VJ9zvrOdrJS2OySfo6wvmqhO
 zBoVURf6/TMzO6iEzcsePnB91vV2ysYpt1V5kTcu0SxS4kLByx5pJPo01eBlucmIY8Aiij0d6G5
 sEPY002Gns3qWAvIc75LovC+btCRoatjcewNhV6GQwypk2rvuTyQEXUw8HuFqVKuHmFKlmsa/sc
 GseHJJPABtaQDTRzASujnyOjrcSvcvesVVGNikIli+J2I1pbYplWzBUIshC0CFE/rRgAL9oQyJn
 iAxbK+4BCCvazR5EcPF2Jhx/g6QhEewEoP8tprakzNUGInoxgbSVAVphaqLqz/kgTWFI/2BqPFO
 rK1uYcOrTggyauoOSBQ==
X-Proofpoint-GUID: Sqjk3_klUw-J2MLi2VuAy3YN6Rzf8MWi
X-Authority-Analysis: v=2.4 cv=S5lMU4sP c=1 sm=1 tr=0 ts=6abce6d0 cx=c_pps
 a=ughbxRIXrQd+RLe3kEOXVA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=Um4bPDTZb6BnJkSS4F8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300042
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 10:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130519

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Update cxx crate from 1.0.197 to 1.0.202.

Changes in this update:

v1.0.198:
- Update to syn 3

v1.0.199:
- Suppress clone_on_copy clippy lint in generated code

v1.0.200:
- Do not classify references as guaranteed POD

v1.0.201:
- Specialize enable_borrowed_range and enable_view for rust::Slice<T>
- Register bazel toolchains as dev dependencies

v1.0.202:
- Support build environments that limit build-script filesystem writes
  outside of OUT_DIR

Assisted-by: Kiro CLI 2.12.0 (AI assistant)
Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../librust-cxx/librust-cxx-crates.inc        | 102 +++++++++---------
 ...-cxx_1.0.198.bb => librust-cxx_1.0.202.bb} |   2 +-
 2 files changed, 51 insertions(+), 53 deletions(-)
 rename meta-oe/recipes-devtools/librust-cxx/{librust-cxx_1.0.198.bb => librust-cxx_1.0.202.bb} (93%)

diff --git a/meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc b/meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc
index 0965a6b5bf..d54aada670 100644
--- a/meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc
+++ b/meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc
@@ -3,59 +3,58 @@
 # from Cargo.lock
 SRC_URI += " \
     crate://crates.io/anstyle/1.0.14 \
-    crate://crates.io/bitflags/2.13.1 \
-    crate://crates.io/cc/1.3.0 \
+    crate://crates.io/bitflags/2.13.2 \
+    crate://crates.io/cc/1.4.5 \
     crate://crates.io/cfg-if/1.0.4 \
-    crate://crates.io/clap/4.6.2 \
-    crate://crates.io/clap_builder/4.6.2 \
+    crate://crates.io/clap/4.6.6 \
+    crate://crates.io/clap_builder/4.6.6 \
     crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/codespan-reporting/0.13.1 \
-    crate://crates.io/cxx-build/1.0.198 \
-    crate://crates.io/cxx-gen/0.7.198 \
+    crate://crates.io/cxx-build/1.0.202 \
+    crate://crates.io/cxx-gen/0.7.202 \
     crate://crates.io/cxx-test-suite/0.0.1 \
-    crate://crates.io/cxxbridge-cmd/1.0.198 \
-    crate://crates.io/cxxbridge-flags/1.0.198 \
-    crate://crates.io/cxxbridge-macro/1.0.198 \
+    crate://crates.io/cxxbridge-cmd/1.0.202 \
+    crate://crates.io/cxxbridge-flags/1.0.202 \
+    crate://crates.io/cxxbridge-macro/1.0.202 \
     crate://crates.io/dissimilar/1.0.11 \
     crate://crates.io/equivalent/1.0.2 \
     crate://crates.io/errno/0.3.14 \
-    crate://crates.io/fastrand/2.4.1 \
-    crate://crates.io/find-msvc-tools/0.1.9 \
+    crate://crates.io/fastrand/2.5.0 \
+    crate://crates.io/find-msvc-tools/0.1.12 \
     crate://crates.io/foldhash/0.2.0 \
     crate://crates.io/getrandom/0.4.3 \
-    crate://crates.io/glob/0.3.3 \
+    crate://crates.io/glob/0.3.4 \
     crate://crates.io/hashbrown/0.17.1 \
-    crate://crates.io/indexmap/2.14.0 \
+    crate://crates.io/indexmap/2.14.2 \
     crate://crates.io/indoc/2.0.7 \
     crate://crates.io/itoa/1.0.18 \
-    crate://crates.io/libc/0.2.186 \
+    crate://crates.io/libc/0.2.189 \
     crate://crates.io/link-cplusplus/1.0.12 \
     crate://crates.io/linux-raw-sys/0.12.1 \
     crate://crates.io/memchr/2.8.3 \
     crate://crates.io/once_cell/1.21.4 \
-    crate://crates.io/proc-macro2/1.0.106 \
-    crate://crates.io/quote/1.0.46 \
+    crate://crates.io/proc-macro2/1.0.107 \
+    crate://crates.io/quote/1.0.47 \
     crate://crates.io/r-efi/6.0.0 \
     crate://crates.io/rustix/1.1.4 \
     crate://crates.io/rustversion/1.0.23 \
     crate://crates.io/scratch/1.0.9 \
-    crate://crates.io/serde/1.0.228 \
-    crate://crates.io/serde_core/1.0.228 \
-    crate://crates.io/serde_derive/1.0.228 \
-    crate://crates.io/serde_json/1.0.150 \
+    crate://crates.io/serde/1.0.229 \
+    crate://crates.io/serde_core/1.0.229 \
+    crate://crates.io/serde_derive/1.0.229 \
+    crate://crates.io/serde_json/1.0.151 \
     crate://crates.io/serde_spanned/1.1.1 \
     crate://crates.io/shlex/2.0.1 \
     crate://crates.io/strsim/0.11.1 \
-    crate://crates.io/syn/2.0.119 \
-    crate://crates.io/syn/3.0.0 \
-    crate://crates.io/target-triple/1.0.1 \
+    crate://crates.io/syn/3.0.5 \
+    crate://crates.io/target-tuple/1.0.2 \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/termcolor/1.4.1 \
-    crate://crates.io/toml/1.1.3+spec-1.1.0 \
+    crate://crates.io/toml/1.1.6+spec-1.1.0 \
     crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
-    crate://crates.io/toml_parser/1.1.2+spec-1.1.0 \
+    crate://crates.io/toml_parser/1.1.3+spec-1.1.0 \
     crate://crates.io/toml_writer/1.1.2+spec-1.1.0 \
-    crate://crates.io/trybuild/1.0.118 \
+    crate://crates.io/trybuild/1.0.121 \
     crate://crates.io/unicode-ident/1.0.24 \
     crate://crates.io/unicode-width/0.2.2 \
     crate://crates.io/winapi-util/0.1.11 \
@@ -66,59 +65,58 @@ SRC_URI += " \
 "
 
 SRC_URI[anstyle-1.0.14.sha256sum] = "940b3a0ca603d1eade50a4846a2afffd5ef57a9feac2c0e2ec2e14f9ead76000"
-SRC_URI[bitflags-2.13.1.sha256sum] = "b588b76d00fde79687d7646a9b5bdf3cc0f655e0bbd080335a95d7e96f3587da"
-SRC_URI[cc-1.3.0.sha256sum] = "c89588d05638b5b4594a3348a2d6c20277e43a7f5c5202b05cc56888475a47b8"
+SRC_URI[bitflags-2.13.2.sha256sum] = "3ded4057c258ba199e2d26386d3af3780957ecaee6c4ef4041c6b4b8b97c0b06"
+SRC_URI[cc-1.4.5.sha256sum] = "005ec2760ca554fae18df7a11195552ec576cd665632a881bc011d5bb2fd4d80"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
-SRC_URI[clap-4.6.2.sha256sum] = "dd059f9da4f5c36b3787f65d38ccaab1cc315f07b01f89abc8359ee6a8205011"
-SRC_URI[clap_builder-4.6.2.sha256sum] = "f09628afdcc538b57f3c6341e9c8e9970f18e4a481690a64974d7023bd33548b"
+SRC_URI[clap-4.6.6.sha256sum] = "473c7e07f409a8d772161724aa8db6a765a2532a70f9667eeb7b49d3d02fbdca"
+SRC_URI[clap_builder-4.6.6.sha256sum] = "7b48fea5a88e9ae728a2dcbedbfc0e730f7d60da42e1cb049a83c9fb8b789889"
 SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
 SRC_URI[codespan-reporting-0.13.1.sha256sum] = "af491d569909a7e4dee0ad7db7f5341fef5c614d5b8ec8cf765732aba3cff681"
-SRC_URI[cxx-build-1.0.198.sha256sum] = "e3184a94384c663718698311a78a51ac00c484c10b4eeac06fb0a068c5f64fa2"
-SRC_URI[cxx-gen-0.7.198.sha256sum] = "fb0f24fd8cafa20f043e24372ca5d8273ab1fdce055ee977b989f82c1bcd89b5"
+SRC_URI[cxx-build-1.0.202.sha256sum] = "4fde53ca86b9704a943fef0f1e1d836239a6aedca5de3c65fa9f97ec0bd46d39"
+SRC_URI[cxx-gen-0.7.202.sha256sum] = "5010d4044b4ac8b18aca2341f3a6227aaf332ec8f5e38fcb93cba53451f2dc92"
 SRC_URI[cxx-test-suite-0.0.1.sha256sum] = "2a0a413bcefc6b37668d9eae784f5fe11232343e11101f1d1834163a509610e7"
-SRC_URI[cxxbridge-cmd-1.0.198.sha256sum] = "0148d8fd1199329ddf1d157a5e134e51ceff37c6a7ddd38615c399d81cb05d8d"
-SRC_URI[cxxbridge-flags-1.0.198.sha256sum] = "52850339faed2eaadd24e286dc1d8268cc6f8a7bd9524d713adc9099566b4c89"
-SRC_URI[cxxbridge-macro-1.0.198.sha256sum] = "2c77c856545d886c9bd5215409ebb63b925e262135248b50c79e5a5f194ee47c"
+SRC_URI[cxxbridge-cmd-1.0.202.sha256sum] = "07bae89236c811fd4d08ed3441759ac4ac98d752cbfd3de341315ba16ad20ec3"
+SRC_URI[cxxbridge-flags-1.0.202.sha256sum] = "49045042e5fced01b80742aba5508de82aa4f13677ed3fa2b4cda709c40c5918"
+SRC_URI[cxxbridge-macro-1.0.202.sha256sum] = "b181252e2e3d3b5d183afbdc033a3958b445eb3e1a0ae65fc3d4f5259f5da6fd"
 SRC_URI[dissimilar-1.0.11.sha256sum] = "aeda16ab4059c5fd2a83f2b9c9e9c981327b18aa8e3b313f7e6563799d4f093e"
 SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
 SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
-SRC_URI[fastrand-2.4.1.sha256sum] = "9f1f227452a390804cdb637b74a86990f2a7d7ba4b7d5693aac9b4dd6defd8d6"
-SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
+SRC_URI[fastrand-2.5.0.sha256sum] = "da7c62ceae207dd37ea5b845da6a0696c799f85e97da1ab5b7910be3c1c80223"
+SRC_URI[find-msvc-tools-0.1.12.sha256sum] = "3e0f1c7c3a72c66fd80abe965175f7523475c0489a87d3ff9d6e8c87d87a9d2d"
 SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb"
 SRC_URI[getrandom-0.4.3.sha256sum] = "300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099"
-SRC_URI[glob-0.3.3.sha256sum] = "0cc23270f6e1808e30a928bdc84dea0b9b4136a8bc82338574f23baf47bbd280"
+SRC_URI[glob-0.3.4.sha256sum] = "e4eba85ea1d0a966a983acd07deee566e67395d2d96b6fb39e62b5a833f1eb0b"
 SRC_URI[hashbrown-0.17.1.sha256sum] = "ed5909b6e89a2db4456e54cd5f673791d7eca6732202bbf2a9cc504fe2f9b84a"
-SRC_URI[indexmap-2.14.0.sha256sum] = "d466e9454f08e4a911e14806c24e16fba1b4c121d1ea474396f396069cf949d9"
+SRC_URI[indexmap-2.14.2.sha256sum] = "cc4e190f5d26ca7051642629da2c52fc03bde85a03197c99408dcd291734c855"
 SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
 SRC_URI[itoa-1.0.18.sha256sum] = "8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682"
-SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
+SRC_URI[libc-0.2.189.sha256sum] = "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2"
 SRC_URI[link-cplusplus-1.0.12.sha256sum] = "7f78c730aaa7d0b9336a299029ea49f9ee53b0ed06e9202e8cb7db9bae7b8c82"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
 SRC_URI[memchr-2.8.3.sha256sum] = "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4beb022d3b367256b91b87513d98"
 SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
-SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
-SRC_URI[quote-1.0.46.sha256sum] = "dfbc457d0c7a0759a614551b11a6409e5951f6c7537be1f1b7682b9ae9230368"
+SRC_URI[proc-macro2-1.0.107.sha256sum] = "985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9"
+SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
 SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
 SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
 SRC_URI[rustversion-1.0.23.sha256sum] = "cf54715a573b99ac80df0bc206da022bcd442c974952c7b9720069370852e21f"
 SRC_URI[scratch-1.0.9.sha256sum] = "d68f2ec51b097e4c1a75b681a8bec621909b5e91f15bb7b840c4f2f7b01148b2"
-SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
-SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
-SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
-SRC_URI[serde_json-1.0.150.sha256sum] = "e8014e44b4736ed0538adeecded0fce2a272f22dc9578a7eb6b2d9993c74cfb9"
+SRC_URI[serde-1.0.229.sha256sum] = "4148590afebada386688f18773da617792bf2ef03ffc1e4cbd2b1d45b023e0ba"
+SRC_URI[serde_core-1.0.229.sha256sum] = "67dca2c9c51e58a4791a4b1ed58308b39c64224d349a935ab5039aa360942a48"
+SRC_URI[serde_derive-1.0.229.sha256sum] = "e7a5d71263a5a7d47b41f6b3f06ba276f10cc18b0931f1799f710578e2309348"
+SRC_URI[serde_json-1.0.151.sha256sum] = "c841b55ecdae098c80dcae9cf767f6f8a0c2cdb3416bbef72181df4d0fe73f14"
 SRC_URI[serde_spanned-1.1.1.sha256sum] = "6662b5879511e06e8999a8a235d848113e942c9124f211511b16466ee2995f26"
 SRC_URI[shlex-2.0.1.sha256sum] = "f8fadd59c855ef2080decdef8ff161eb6661b86933c9d82e5ba29dc602a55aba"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
-SRC_URI[syn-2.0.119.sha256sum] = "872831b642d1a07999a962a351ed35b955ea2cfc8f3862091e2a240a84f17297"
-SRC_URI[syn-3.0.0.sha256sum] = "f2fac314a64dc9a36e61a9eb4261a5e9bbfbc922b27e518af97bc32b926cf967"
-SRC_URI[target-triple-1.0.1.sha256sum] = "c3a6bfce3d99adfa72d24750a61f782f3036a81e7f86d8841ee1326deaebd171"
+SRC_URI[syn-3.0.5.sha256sum] = "12df2e0110f65b775f769bb17ef989067a1d931b2eb822bd4346631eeada89f9"
+SRC_URI[target-tuple-1.0.2.sha256sum] = "876fef147edbcbddc8ac5cbbba92c7b86519e314e86638596c09673b2ed01e7f"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[termcolor-1.4.1.sha256sum] = "06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755"
-SRC_URI[toml-1.1.3+spec-1.1.0.sha256sum] = "53c96ecdfa941c8fc4fcaed14f99ada8ebed502eef533015095a07e3301d4c3c"
+SRC_URI[toml-1.1.6+spec-1.1.0.sha256sum] = "920602543f0911ab71da12c50d59701da54c196d1a2bf5cb4b75667f137a406a"
 SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] = "3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
-SRC_URI[toml_parser-1.1.2+spec-1.1.0.sha256sum] = "a2abe9b86193656635d2411dc43050282ca48aa31c2451210f4202550afb7526"
+SRC_URI[toml_parser-1.1.3+spec-1.1.0.sha256sum] = "1d38ac1cf9b95face32296c0a3ede1fdc270627c9d9c02a7274dd6d960dc4d56"
 SRC_URI[toml_writer-1.1.2+spec-1.1.0.sha256sum] = "7d56353a2a665ad0f41a421187180aab746c8c325620617ad883a99a1cbe66d2"
-SRC_URI[trybuild-1.0.118.sha256sum] = "06649c6f63d86604ba0c8950d5a1829fc9a17afd70fc6629f481d75b6a624c78"
+SRC_URI[trybuild-1.0.121.sha256sum] = "c0cabaa10be1917331a313866bd94526343e03c77bcf69144b62b072ad35d47c"
 SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
 SRC_URI[unicode-width-0.2.2.sha256sum] = "b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254"
 SRC_URI[winapi-util-0.1.11.sha256sum] = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
diff --git a/meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.198.bb b/meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.202.bb
similarity index 93%
rename from meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.198.bb
rename to meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.202.bb
index 7b4aa36568..4b8a7a71ea 100644
--- a/meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.198.bb
+++ b/meta-oe/recipes-devtools/librust-cxx/librust-cxx_1.0.202.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "crate://crates.io/cxx/${PV};name=cxx"
-SRC_URI[cxx.sha256sum] = "6fe442a792c7c736eea18b32a7f8a3b63cf8aafabda6760042dc2fdeda456291"
+SRC_URI[cxx.sha256sum] = "13f6de320895f42e6e081abb5c7983bedcf0b6d0ff9323de0d33f620c8ac1199"
 
 S = "${CARGO_VENDORING_DIRECTORY}/cxx-${PV}"
 
-- 
2.49.0


