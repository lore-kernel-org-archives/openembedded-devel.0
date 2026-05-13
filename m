Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F59CD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 03:12:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3817.1778641918615277184
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 20:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pChBTOpB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95933ffc80=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D26E0r015220
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 20:11:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=lBIgdHZHrZM2u2u7eZEE
	flXT+iWj5pGcsPj/dc3bFGE=; b=pChBTOpBsq+AEJ0kA2S6sndYjStUOZOI2Ze1
	J6zS0RBV2MUnV/u7FLdsXlx6FnGCVWeODj3LWG4fvcmc41rpOPo/7vI4ZDoKWHwC
	km0LtRHxMQ8DsIU2ykM8RKMYw6tdQ2pFBrcMAyYLwQfm87gELEDxOYG4IHIGsN4U
	xAUG3os++4CHTccpp6rfge4BFtFfXALfz4327rtxL1uKpGM/L4VQB2SbDjILjf5P
	ch/dpQGq6bBKb09WXM6rXMp85eWMGcrkX6avCkqzSlnk3wk89ZnVRK62/5Vw1H/a
	CCrVrVrQiL4OiwQJO4gQ8tFCo9LxxBwNyrDdF1AlGayYEKj9ZQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010005.outbound.protection.outlook.com [52.101.61.5])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4g7g81wk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 20:11:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gbQcCacTDHH/kpnC1ni/8F1trik6ruPrLS/Zu/f0gBFUmWc/Y8XrfrWwUcNvqi+T9loTstyU++vBvNr2FSSupvw3NhnAYLRJns4WiEitdo3Peo51poEqF60SO9UgHyfu9n8QKdFHRV9eEuaPVMo7bMvMKx3Tp5bfapJeTXVEX5j9V74XBn8B7GTkNEaPAkQLC8pB1LxklQlpoOvzubcW1juZ0QpPuCSbcBQvtfmljrSNcbLERClMA39fRVEzI+82VpTrnuMfeCvDfF/xFFsyWxiULblw6cXgtR74KpNPM7qCAW8vHXWozKWrELMWG1B2CFkvvCuPNlMFWw+7vLAvMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBIgdHZHrZM2u2u7eZEEflXT+iWj5pGcsPj/dc3bFGE=;
 b=W3jLdIUh2bSLBNRXcj0U+t5LGZIMzBy8cexSTRlpr2g7BgGn9z2ynjB+wV73Ma+tH80ePmF7NEBhsurOA88ioEJM2fRg2psQxdcmUGA6GVFekNbiOGNN20DHRYsZHKkCDDaMmKO30NgJ2pccSviBRVEqxynoPJBWuiBCbiW5GXongcLPUCSJ2zmeafZLnOd4aLjtLIMjG9rZP5I+/aJmoR0Y2cvzeyvse6l5MFJOS8ntL81avXswMqFhEmcWi5WMveu/pxsOBUrmcrNifKeaAP+g/icWRkqpvZM2MrVM4J6fjbyy2c0QhMTfvYGlWlBgix4VKRi+ibKT91l+c3NAaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SJ5PPFC0624F2CA.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::850) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 03:11:55 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 03:11:55 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][master][PATCH V2] postfix: upgrade 3.10.8 -> 3.11.2
Date: Wed, 13 May 2026 11:09:44 +0800
Message-Id: <20260513030944.2378915-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0021.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::9) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SJ5PPFC0624F2CA:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bce9e0d-2ce5-4518-150b-08deb09d6303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|18002099003|38350700014|3023799003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: 
	4GUqSIvtBDDkUKb7Ereh7iRQGxrEVKxCRPS1p98sz66AiOAdelcda1BMhEdCzPI/VbIU2MsJbmbxwLywWlBGJqpBetnJ3kRyokSaMtOc59GX2ixLbcFUlRXRe+dMIDXmr+uUnBREn2jorVjuTGtILcdzrNJbpoq9ApxW9R6gX2APWfOLFliZ3QVvnlx1NI46mO3eO1+4Bq2CHzD2WDdk6dhuinrNy+KWtKvqu+p8shGaBRdxP5fig3PPMjgfpRwjmUSw5cZ575yzNIha6lFQZUymGUZZdL0b7MFwS4atqJ+AjQSDgy8cCLRwxHWl4pf0HzpVTxjo8diHOTK1J7QamgUhVCUOwWXq9tJ1Nt2p/dRWwWMbh+mjXP9wlZf4tIpXnjbWuX0oF+O03PKAVKVpGGF7wGMmLgKMbjTFv6WyIv2EvX54XvuXujQIbgHt7U3I5ajBkfj4Z1MDgRq6G3MDtXZ/vy8k5ZsZHPxGAHvtFL1WF5jDX3mW4tiKn5Csj4QLc5LJPKZcdVAsq4/b/0pDJDO/VtRwDP2R1a3Xy5DwA2DsaJavpyAbZ46F2K7axZ13EG9PQsPnUfOYpVs4SMMEIw5WNGVQlE7MlJUWREq4GBNaepUc8wIk+5pREgSGxnjaY95MosgiGHZVmb5+zLT9Jqsf1gF6/ymVRp9KjDohowoLud2v1lrLUVzBVl+Q4IkEKZI/eDIEckkNMHhEADf/nw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(18002099003)(38350700014)(3023799003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PI24WSXYXx9NHLeICrZzhMuRtMuv27P4p1J3rKOQznsb5EcOs2axzMfgO1wD?=
 =?us-ascii?Q?TxkJVWUBwji181dezqN8H/j4Aa/OUJpnpL1xfhkJ55aqL6OKnGPheNGtW/L3?=
 =?us-ascii?Q?zPvp+Y3xUkkldzBRZAkMyln+/HHzlTC9T+CYP/ZOeEW2pZLebT24yjdiCuCU?=
 =?us-ascii?Q?59yIbaSAgOLBEynlylWlYIKl+h+hTEdY/aXDEFnIk0rlX8A0qWVcOTNnTFQ/?=
 =?us-ascii?Q?br78EnGvic+pyEtZhRHln1aCJvn4pCq7quUvv1zltyfUdsNfWR7EBO8CUAKa?=
 =?us-ascii?Q?H1YLy6+naNHZlMG5j5hEGL2JImXOfS+qaIsd6Caiy2Dl1ZIOwn+hwb5bDvUO?=
 =?us-ascii?Q?FhTK07tTM+NHZhkyZs/dQzfboa+s7hdoGDkfAC+SSz5nUWV+bMCpsAHwZ9ld?=
 =?us-ascii?Q?P2rffn29W1DCFvyzW+a534UR68s4fOMnuSUgPnnEXxEGF2fvXngs5gHSaaoi?=
 =?us-ascii?Q?K5kW7e/x2icSSH3tbxcoySrAYF3nQnpbCzW80i+HjfhaQ5DzTPED29oFhxJN?=
 =?us-ascii?Q?2NHo3jsy9n4JBRAYa2htMNMbJ6vzbb6pjcR4z1gh6j1pHfFSvSKPkH2qnel8?=
 =?us-ascii?Q?H5fzRKCiYQiPp2PUpScC3v3QDSULATuQ3Yleo9wq/IX+f4+iF92YpLbqm4r/?=
 =?us-ascii?Q?LwqFbKhgarfjTdSQ2L2nPlAD2YzDuFqUOM3HcB9BhiFi9+uEATPMAyYUD4YW?=
 =?us-ascii?Q?6fwRwwmvSrMKAtj7s0YuUwIyFOU4jeASvSGde4fgDHJW84/bh+lsal03oswq?=
 =?us-ascii?Q?UWBLqlXNJTRHsT9G2VcFEzr17hW6gZW9lord76FqYqf0Lygqxpm5wEUTIUQd?=
 =?us-ascii?Q?FpWoNXzvTQfYmRDQqPoESLH7YumppeQyAR6C21zABSgMA4VGYfbzxDi651Uf?=
 =?us-ascii?Q?oiI2A45Gw5pJARI8REJfkl4XBQ8oJWf4p4yryo8WosWKgLyKRADMbTR1TuFn?=
 =?us-ascii?Q?6PfoOjrd4/wUbO4Q+taR8zkPq9apFc8Z9k7x5Zklgq9zkROaYkUxJfkEhbPb?=
 =?us-ascii?Q?q+0CQhuZXQIIlQ+M2g0od79pSFmkVyyPasooO0nLvWz2r2RfB1jbAY8Js3uP?=
 =?us-ascii?Q?hXI5kIS70+0eGDobApkq6CDhji9sJwjZmJ69VPXEwwjLEqoWCKOuUgxvXp2f?=
 =?us-ascii?Q?/8D92ukJxxY61KhtADC3TT6MN42oIfN31t24Xf9FB05K2YLa4G+jHR0tjrxE?=
 =?us-ascii?Q?6WdDapO1eyz/URwL9Ls9+fqBBfJjOw5cXKZ05+cQGXLW25y91NoVNwS9W/EE?=
 =?us-ascii?Q?hf2HcYJbN7/IZkCFX/9fiPHU9l8aJ8SbheudVvyJNopc6qYaTt3Frwh0LMRm?=
 =?us-ascii?Q?/nwyOgNf4xtqdbj4xml+k4kphtggT7LcG9A3dZb5z2DI+KqJ2ogY4KEkw8Kh?=
 =?us-ascii?Q?Ys7LVTOqY++zrHkG0nqMbohorRQ4hNGBQTnqzy8EKhW2+0MY2nKLVn7lms3l?=
 =?us-ascii?Q?0SA1syrcniNn0f9OHVfwA1e4amgbjw/tVYE6YOwzVB3pZvRk7ulM8E43OQRt?=
 =?us-ascii?Q?FMElPE3eVffEK1IdxYI8PLmL1ytNet0V/Cvos/nMd6HYG6nMO/+9i4MuhpMa?=
 =?us-ascii?Q?uxV29Ktw4MMzKNVOcTX+EMmupRlHmsohnjn159AIOGV3xsnaJtg/sTfgtrb3?=
 =?us-ascii?Q?hgtJ6jo8i/9mW80zL6HmDdS185BFofv4jWAq7RBe3Oca7uqML3dzfC8lmbvc?=
 =?us-ascii?Q?g8hQhnUdw7heeVYBmU/AbwsFISHUupoWRb1Ol7KPY8LNZYc5qs2TyzwGvmJx?=
 =?us-ascii?Q?LhSH+QrlUCAYwFBjbXV/Co+1B/2Q+uQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	AaL4wV3+2mFi45UVJsWHHwlQaiQ80dbiwr/wGardS/v8JfYgAy4Bj3cHm/0WRWRJEcHccDpwmQafI+r7Z76LIaxJZLhymhgvQgnLJ6EC240DMy+YynZq74iwH4/VeZyhiM2IJu0+hOoGJydvOa4lT+hrQ0Y76nSHii29Hzccok0Zr/P4MvSqUFLxH3OJ05A2q3SURvmqQ2/84l8qkGF/TplEr3P7IJS3Rignzscaqj+jSRKHIrLqMxln5xgSYlv9WE5tiSzY3R+QkaM16ITsDscbyLC/8EBexmFYKGVyV1+PRB/v9dj6JmEgwTvgROF8Ht+WM+hR6Q4jOPOmN6kHsA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bce9e0d-2ce5-4518-150b-08deb09d6303
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 03:11:55.3547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BKzPAiikjH5DSrftNiZ+414zOXc5sg+HOavWCeL+LnBAfq9Pkc89KxY6kqMraU2mRBxwIybNpwEUZu/pdQdge2oD0l1PepkVa/cbD/abik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC0624F2CA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDAyOSBTYWx0ZWRfX3ylg9Vnw+qDa
 s+Eb6OReaPZ2kLuoZBBeA9whldKm/nLI5N/CUzjSfKeGuKZZ4x/2dsD+5FuL2jIBbGgtPEPQlqS
 6uuo8JFxhGSOu834EINP0HAx0osrxVMkHHhG8j1jbxBKW+GqEI8/KemBLDgZYEbSy9W6bz9LBZ1
 1Mv4kugAWGPIS7nFjk8RLI13IFMOHV6EzfNJk4vCpZo1P60TSHQfZOiZe/pVdUgSB8MRYBiC2lJ
 SlPj5WIlqNIjRxoczt+k4gfPd4t99q0F+7K6DtczNgXjVows5QRJYExYtvpt2zp0xRPEoyJBjx5
 VxNrMfVofCEzM0w0wFTYeA57b1aLvCS3q8ELPOErDDvvbzC7Znu0zw2+jfwlA1QalzfnpCijesd
 sNl+y73DtJ8RTGNEjjmEHzv9/R1eAXJZKTMb/yZrGLAi92ZxMvfTwrgUVzgWr+TAl0sJwwyZ3KI
 QqUMpXctqK6AKjI1kvQ==
X-Proofpoint-ORIG-GUID: _04wvgGuF0mQP3Lu4jsfkKwvg3ovyUOP
X-Proofpoint-GUID: _04wvgGuF0mQP3Lu4jsfkKwvg3ovyUOP
X-Authority-Analysis: v=2.4 cv=Q7jiJY2a c=1 sm=1 tr=0 ts=6a03ebfe cx=c_pps
 a=FYyDd4Hx0FY4jkPLXAZhlw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=VJYubktbAAAA:8
 a=gmDo1nssAAAA:8 a=Vt2AcnKqAAAA:8 a=e1GkridNAAAA:8 a=t7CeM3EgAAAA:8
 a=omOdbC7AAAAA:8 a=pGLkceISAAAA:8 a=f5588Gt2Gyp9Vg8PkUAA:9
 a=OqWDEjY5HwswFcA5adJo:22 a=DmCNEmdWNTAeIjfGWauO:22 a=v10HlyRyNeVhbzM4Lqgd:22
 a=6ft9yNkZjdd813gQxDxM:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130029
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 03:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126883

* Refresh patch to mute patch-fuzz
* Add patch 0001-sys_defs.h-workaround-for-musl-lib.patch to workaround
  for musl lib
* This upgrade include the following commit, which make postfix can
  compile on latest stable ubuntu 26.04, which have Linux 7.x kernel

  Postfix works on Linux 7.x kernels. Frank Scheiner. Files:
        makedefs, util/sys_defs.h.

Changes:
https://www.ftp.saix.net/MTA/postfix/official/postfix-3.11.2.HISTORY

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../postfix/files/0001-Fix-makedefs.patch     | 25 +++++------
 ...1-sys_defs.h-workaround-for-musl-lib.patch | 43 +++++++++++++++++++
 ...tconf-to-a-variable-for-cross-compil.patch |  9 ++--
 ...tive-compiler-to-build-makedefs.test.patch | 17 +++-----
 .../postfix/files/0004-Fix-icu-config.patch   |  9 ++--
 ...sl-and-lresolv-to-SYSLIBS-by-default.patch | 11 ++---
 .../{postfix_3.10.8.bb => postfix_3.11.2.bb}  |  3 +-
 7 files changed, 73 insertions(+), 44 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/postfix/files/0001-sys_defs.h-workaround-for-musl-lib.patch
 rename meta-networking/recipes-daemons/postfix/{postfix_3.10.8.bb => postfix_3.11.2.bb} (98%)

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
index 785fe87452..4e187849dc 100644
--- a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
@@ -1,4 +1,4 @@
-From e4197bc1f431fd7e555a31e6f7f1e020b4ec8f4c Mon Sep 17 00:00:00 2001
+From 51e29c0a1d98948118e5135bb817a96811105d39 Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Fri, 19 Jun 2015 16:45:54 +0900
 Subject: [PATCH] Fix makedefs
@@ -19,10 +19,10 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
  1 file changed, 11 insertions(+), 16 deletions(-)
 
 diff --git a/makedefs b/makedefs
-index a740e41..28fb128 100644
+index d5103ce..9713327 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -230,9 +230,6 @@ echo "# pie=$pie"
+@@ -232,9 +232,6 @@ echo "# pie=$pie"
  
  # Defaults for most sane systems
  
@@ -32,7 +32,7 @@ index a740e41..28fb128 100644
  ARFL=rv
  
  # Ugly function to make our error message more visible among the
-@@ -563,12 +560,12 @@ case "$SYSTEM.$RELEASE" in
+@@ -608,12 +605,12 @@ case "$SYSTEM.$RELEASE" in
  		case "$CCARGS" in
  		 *-DNO_DB*) ;;
  		 *-DHAS_DB*) ;;
@@ -48,8 +48,8 @@ index a740e41..28fb128 100644
  		    else
  			# No, we're not going to try db1 db2 db3 etc.
  			# On a properly installed system, Postfix builds
-@@ -577,12 +574,12 @@ case "$SYSTEM.$RELEASE" in
- 			echo "Install the appropriate db*-devel package first." 1>&2
+@@ -623,12 +620,12 @@ case "$SYSTEM.$RELEASE" in
+ 			echo "Alternatively, build with CCARGS=\"-NO_DB ...\"" 1>&2
  			exit 1
  		    fi
 -		    SYSLIBS="-ldb"
@@ -63,7 +63,7 @@ index a740e41..28fb128 100644
  		    do
  			test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
  			    SYSLIBS="$SYSLIBS -l$name"
-@@ -602,7 +599,7 @@ case "$SYSTEM.$RELEASE" in
+@@ -648,7 +645,7 @@ case "$SYSTEM.$RELEASE" in
  		       if [ `expr "X$CCARGS" : "X.*-DNO_EPOLL"` -gt 0 ]
  		       then
  			   :
@@ -72,7 +72,7 @@ index a740e41..28fb128 100644
  		       then
  			   echo CCARGS="$CCARGS -DNO_EPOLL"
  		       else
-@@ -626,8 +623,6 @@ int     main(int argc, char **argv)
+@@ -672,8 +669,6 @@ int     main(int argc, char **argv)
  }
  EOF
  			   ${CC-gcc} -o makedefs.test makedefs.test.c || exit 1
@@ -81,7 +81,7 @@ index a740e41..28fb128 100644
  			   rm -f makedefs.test makedefs.test.[co]
  		       fi;;
  		esac
-@@ -644,12 +639,12 @@ EOF
+@@ -690,12 +685,12 @@ EOF
  		case "$CCARGS" in
  		 *-DNO_DB*) ;;
  		 *-DHAS_DB*) ;;
@@ -97,8 +97,8 @@ index a740e41..28fb128 100644
  		    else
  			# On a properly installed system, Postfix builds
  			# by including <db.h> and by linking with -ldb
-@@ -657,12 +652,12 @@ EOF
- 			echo "Install the appropriate db*-devel package first." 1>&2
+@@ -705,12 +700,12 @@ EOF
+ 			echo "See: https://www.postfix.org/NON_BERKELEYDB_README.html#build-conf" 1>&2
  			exit 1
  		    fi
 -		    SYSLIBS="-ldb"
@@ -112,6 +112,3 @@ index a740e41..28fb128 100644
  		    do
  			test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
  			    SYSLIBS="$SYSLIBS -l$name"
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/files/0001-sys_defs.h-workaround-for-musl-lib.patch b/meta-networking/recipes-daemons/postfix/files/0001-sys_defs.h-workaround-for-musl-lib.patch
new file mode 100644
index 0000000000..b7a8e05165
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/files/0001-sys_defs.h-workaround-for-musl-lib.patch
@@ -0,0 +1,43 @@
+From ce15792203ae0c787e3602d6d38a892ea1ce31ce Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 12 May 2026 15:04:55 +0800
+Subject: [PATCH] sys_defs.h: workaround for musl lib
+
+Fix musl lib compile failure:
+vbuf_print.c:215:46: error: macro 'VBUF_SNPRINTF' passed 5 arguments, but takes just 4
+  215 |                     VSTRING_ADDNUM(fmt, width);
+      |                                              ^
+vbuf_print.c:132:9: note: macro 'VBUF_SNPRINTF' defined here
+  132 | #define VBUF_SNPRINTF(bp, sz, fmt, arg) do { \
+
+Previously checking condition will make #else branch is selected, and
+NO_SNPRINTF is defined, and when NO_SNPRINTF is defined, VBUF_SNPRINTF
+only take 4 arguments, and cause above failure. musl lib support
+snprintf and we only have glibc and musl libc, so workaround by when
+glibc is not defected, take it as musl lib, and select the #if branch.
+
+Upstream-Status: Pending [Reported to postfix-users@postfix.org]
+
+https://www.mail-archive.com/postfix-users@postfix.org/msg107898.html
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/util/sys_defs.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/util/sys_defs.h b/src/util/sys_defs.h
+index 1890577..c3527c9 100644
+--- a/src/util/sys_defs.h
++++ b/src/util/sys_defs.h
+@@ -794,7 +794,7 @@ extern int initgroups(const char *, int);
+ #define NATIVE_NEWALIAS_PATH "/usr/bin/newaliases"
+ #define NATIVE_COMMAND_DIR "/usr/sbin"
+ #define NATIVE_DAEMON_DIR "/usr/libexec/postfix"
+-#if HAVE_GLIBC_API_VERSION_SUPPORT(2, 1)
++#if HAVE_GLIBC_API_VERSION_SUPPORT(2, 1) || !defined(__GLIBC__)
+ #define SOCKADDR_SIZE	socklen_t
+ #define SOCKOPT_SIZE	socklen_t
+ #else
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
index d46efb95cb..a74c46fa92 100644
--- a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
@@ -1,4 +1,4 @@
-From 953719878466c55572294f42e85127bda5d34999 Mon Sep 17 00:00:00 2001
+From ce8deeaac8ca5d7329e1923790a1f35798953799 Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Fri, 19 Jun 2015 17:14:58 +0900
 Subject: [PATCH] Change fixed postconf to a variable for cross-compiling
@@ -12,10 +12,10 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
  2 files changed, 11 insertions(+), 9 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index a37f89f..17cb64b 100644
+index 8d7501a..d2a85e8 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -22,7 +22,7 @@ META	= meta/main.cf.proto meta/master.cf.proto meta/postfix-files \
+@@ -23,7 +23,7 @@ META	= meta/main.cf.proto meta/master.cf.proto meta/postfix-files \
  EXPAND	= sed -e "s;\$${LIB_PREFIX};$(LIB_PREFIX);" \
  	    -e "s;\$${LIB_SUFFIX};$(LIB_SUFFIX);"
  SHLIB_DIR_OVERRIDE = \
@@ -102,6 +102,3 @@ index 563ee27..00d4651 100644
      "daemon_directory = $daemon_directory" \
      "data_directory = $data_directory" \
      "command_directory = $command_directory" \
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch
index 6f8e3e84da..201b4741de 100644
--- a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch
@@ -1,4 +1,4 @@
-From a8ec63a71361ccd3f6d2959c4c87b7824282b291 Mon Sep 17 00:00:00 2001
+From fc51d9145210350577fdb29a9b0680df779ae347 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 26 Aug 2017 10:29:37 -0700
 Subject: [PATCH] makedefs: Use native compiler to build makedefs.test
@@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/makedefs b/makedefs
-index 28fb128..313b401 100644
+index 9713327..e879832 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -622,7 +622,7 @@ int     main(int argc, char **argv)
+@@ -668,7 +668,7 @@ int     main(int argc, char **argv)
      exit(0);
  }
  EOF
@@ -25,7 +25,7 @@ index 28fb128..313b401 100644
  			   rm -f makedefs.test makedefs.test.[co]
  		       fi;;
  		esac
-@@ -865,7 +865,7 @@ int     main(int argc, char **argv)
+@@ -914,7 +914,7 @@ int     main(int argc, char **argv)
      exit(0);
  }
  EOF
@@ -34,7 +34,7 @@ index 28fb128..313b401 100644
  		   ./makedefs.test 2>/dev/null ||
  			CCARGS="$CCARGS -DNO_SIGSETJMP"
  		   rm -f makedefs.test makedefs.test.[co]
-@@ -903,7 +903,7 @@ int main(int argc, char **argv)
+@@ -952,7 +952,7 @@ int main(int argc, char **argv)
  				  &error) != 14);
  }
  EOF
@@ -43,7 +43,7 @@ index 28fb128..313b401 100644
  			$icu_ldflags >/dev/null 2>&1
  		    if ./makedefs.test 2>/dev/null ; then
  			CCARGS="$CCARGS $icu_cppflags"
-@@ -1024,7 +1024,7 @@ int     main(void)
+@@ -1088,7 +1088,7 @@ int     main(void)
      exit(ferror(stdout) ? 1 : 0);
  }
  EOF
@@ -52,7 +52,7 @@ index 28fb128..313b401 100644
      ./makedefs.test || exit 1
      rm -f makedefs.test makedefs.test.[co]
  }
-@@ -1180,7 +1180,7 @@ int     main(void)
+@@ -1245,7 +1245,7 @@ int     main(void)
      exit(ferror(stdout) ? 1 : 0);
  }
  EOF
@@ -61,6 +61,3 @@ index 28fb128..313b401 100644
  	parm_val=`./makedefs.test` || exit 1
  	rm -f makedefs.test makedefs.test.[co]
  	eval ${parm_name}=\""\$parm_val"\"
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
index 0660ee098e..daf5c7089e 100644
--- a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
@@ -1,4 +1,4 @@
-From 404150f53bb49af987d7338a808f47fdbd50ba7f Mon Sep 17 00:00:00 2001
+From b63facf538af99e7c79ebee8d41abd52e7d5ee5e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 16 Jan 2022 11:21:54 +0800
 Subject: [PATCH] Fix icu config
@@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/makedefs b/makedefs
-index 313b401..e5db212 100644
+index e879832..f9c132e 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -906,7 +906,6 @@ EOF
+@@ -955,7 +955,6 @@ EOF
  		    ${BUILD_CC-gcc} -o makedefs.test makedefs.test.c $icu_cppflags \
  			$icu_ldflags >/dev/null 2>&1
  		    if ./makedefs.test 2>/dev/null ; then
@@ -29,6 +29,3 @@ index 313b401..e5db212 100644
  			SYSLIBS="$SYSLIBS $icu_ldflags"
  		    else
  			CCARGS="$CCARGS -DNO_EAI"
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
index 1571aa844d..c2e640d6ff 100644
--- a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
@@ -1,4 +1,4 @@
-From 25e7d1a9bc64f39666eb0e2b9b175773615e28d2 Mon Sep 17 00:00:00 2001
+From fb5b16db0282b5d80edb0ccc6f0f197a7f663610 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Fri, 12 Oct 2018 12:38:02 +0800
 Subject: [PATCH] makedefs: add -lnsl and -lresolv to SYSLIBS by default
@@ -14,10 +14,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 2 insertions(+), 20 deletions(-)
 
 diff --git a/makedefs b/makedefs
-index e5db212..b00049b 100644
+index f9c132e..5ebef5b 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -577,16 +577,7 @@ case "$SYSTEM.$RELEASE" in
+@@ -623,16 +623,7 @@ case "$SYSTEM.$RELEASE" in
  		    SYSLIBS="$SYSLIBS -ldb"
  		    ;;
  		esac
@@ -35,7 +35,7 @@ index e5db212..b00049b 100644
  		# Kernel 2.4 added IPv6
  		case "$RELEASE" in
  		2.[0-3].*) CCARGS="$CCARGS -DNO_IPV6";;
-@@ -655,16 +646,7 @@ EOF
+@@ -703,16 +694,7 @@ EOF
  		    SYSLIBS="$SYSLIBS -ldb"
  		    ;;
  		esac
@@ -53,6 +53,3 @@ index e5db212..b00049b 100644
  		SYSLIBS="$SYSLIBS -ldl"
  		: ${SHLIB_SUFFIX=.so}
  		: ${SHLIB_CFLAGS=-fPIC}
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb b/meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
similarity index 98%
rename from meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
index a66ecc0b5d..14fec1b276 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
@@ -26,9 +26,10 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
            file://0004-Fix-icu-config.patch \
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
+           file://0001-sys_defs.h-workaround-for-musl-lib.patch \
            "
 
-SRC_URI[sha256sum] = "31d4b3eb8093d823b5a151f571719ff7c0462571bc95e6440d87ca525bfb096c"
+SRC_URI[sha256sum] = "daed65b08c9288cdb386a914f3e52cdddd44935407b5ce5aee8bcc3aa4207778"
 
 UPSTREAM_CHECK_URI = "https://www.postfix.org/announcements.html"
 UPSTREAM_CHECK_REGEX = "postfix-(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


