Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDB1EB1076
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 05:07:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14099.1773205620032507033
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 22:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ELwnbzdH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7530e974aa=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B4uAiB2750338
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 22:06:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=O+P5e3oHQ5d+hjz7GYKRnUkM6RwiKlAYA2oZuFnOR4A=; b=
	ELwnbzdHmZAwSs3O2qBDeFiUn44TqzHvS8+wjx6/S4nLEbqEllknJPo8GCnWPHJo
	YKqTz1u/iPnT/+eJzP0TC3h6HUBCnwfRca1NV3iyUOXvRvoCS/0VcZO0Zq8tm6vX
	eQIYI6T7lO1FoL/HUneSTbITIOfvY3YJBK+QfnZLHUk/CiE6YAPqaiM6gvAGDNy9
	JAYMHBZvzs5RBAG2jfUwnLld1LfRMoN8hgkhpm0ygXn2sEQND7KHOy08Hn8AMajr
	KofFATxuCG+u2kT/ynufSOFPRPid2UXkZqL16mxUjbLd4XdlQslwa7X2nX6Ffz7E
	PM2ugyCwB7MhnYrF9KRs6w==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010030.outbound.protection.outlook.com [52.101.46.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cty3j04u5-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 22:06:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WjtuXow/XwwK23rj11rb/X4wlOiiwea2ajMnYTZt4+CZYsfCTDKNTlEmCYiabjR9x14Af4kNLrg/UOPJlbj9vEbpnrtMbLa8kRYCYCLPHa3wHoy5nUx8AldMwC4Eda+F3w3Ed4rvdQJrdpYOL7pZEFTRZIsJFQFcQZOrLJX41wNdv+Tg+IRDaVv8Z/Z+JteBWGo6uHlmbyHHW8dWXi6mNcjAw76vuH5U5QUHKvhIYD8bw5ir84AdM/VG1eGZfbXoPFmY7CAOYd76sqJsu19zhj098w39ju3dIl5s8rbo1eQwf7/mTnFzQTcBdu1/P4DubYozG1/mS1tfAVsGnbUA6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+P5e3oHQ5d+hjz7GYKRnUkM6RwiKlAYA2oZuFnOR4A=;
 b=ra1jma77N5HL5HshtdwRn8fKKkYpQD4bLv+S4KU3nH7DuRd0chIPTs5nLA4Vzfrlnnh25tW1RwIcDON3AWFCDAQPYpqflBirpYowvWUxPBUZNnoF8V/Pk1ef0HTZuRIgnDyhpIO4NYH3fOOnCLFGnUICU9KJZnu84DtKKlnUmJtawvaXYZDoPtY+TbPHm00e1CH+cy+PHOMWxxjT3CxQDuLldTh+s1AU6sBGPEthgEX7Y9pW34VpEozvqWufPHnYqZFLqBdnhdTB/oLHy10K8xUecm6h8ZTKb5jGSewDEsH8ct2jKQH6OYQw3Zf6vwL1AITpaH6QidaCco3SsVAYpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH7PR11MB8034.namprd11.prod.outlook.com (2603:10b6:510:247::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 05:06:57 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 05:06:57 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: f_l_k@t-online.de
Subject: [meta-gnome][PATCH 2/8] gimp: add x11 to REQUIRED_DISTRO_FEATURES
Date: Wed, 11 Mar 2026 13:05:50 +0800
Message-Id: <20260311050556.2079418-2-changqing.li@windriver.com>
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
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH7PR11MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 886a6d60-b14d-49f2-f602-08de7f2c051d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	my/WGms+wBR1R555j4+ogqKHFGwR1SiOcHUGmCjU2oLx75EaGoA5p0ZFnrvHEZlOZ2X+4PlD8tFv3x7U3c+EM8IiME8hUEY7UCp3MLNyf1aXsumSYNACbcOGRs/ub7SgrcK2YYYK0NB7gaJdbB6JB1DwK+zQXuw5SXb/AEULDHCATk+Fhc9uuGsJ3xUjAQeDFW4XOWMXhpm8gNDlBkHCVaroMSk6PK+pBV59WkfFIgxd6nN7ISgeZQqZc3bWJAXNtvUnVPQR6pzH8mYO6xY3F3YC3BdsfolXrvkvyIJhnxREr8ciGWMTv6BrLuY9iHR6jqhGi3n+Qi4eEUJdGWkZllrvHuVi1tneI6onU2tYGt799O2MsysCaGoc9Ulcwc63RZiP3SnBi8jGPYGjDyYqYjCJccpzrubB9ovDvKGCU664GPWWoDGkTVWIYGEyB8EendQT3oNTNNwmQPEJjtVq7xbbc6QMTD6lQzn6vY938EEGjSZ+Ghlx4nQ75zcvAWEXsn1qHRQnzujHeb9fMPSJ1yBdZQVHRbaNq6T380p6clML2iT4Nb7tagO3BbdD87iiUwsU7kZklXZK6Y4BaCBZRtbjOthqsNV14cT+NaeRAKePOnMo1Don48vLJb98fuRDSQLq/xyQmgwVMqLGco8BxEctd4SDweFqTYBbE/N6Hc6D2rE/9GAsByjZTE8I2AH2UY4uRFjddZs6kYafmOIDLhyUYkdavnDFd4M/HYEFRnlUbkV0z192UeSxhY6g1uI2LBlUmB244KxDiKho7m2jKqLiicibm0R7eqpVWfz4/2c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?18GIQaZ8Jc9MTyRw3tfK/cXC5U1sLo/3vohcCddW1xsmoPfTSebIppAgmoKV?=
 =?us-ascii?Q?QogpnadAwLgZy13o7IzxvUhoLPfuLKanvZs9Y/xipfkzE7yvv/u1cZD2F6J0?=
 =?us-ascii?Q?iUT+lxZsDSvd8xdqPva5qc7Kp3hOiAiQgXpX7mcQc3YRrRg3/x8KT7xsIdR3?=
 =?us-ascii?Q?7yVSawyZDreFnQSQJPv5BBfy9BPcPk2VGe5d/4fqil6r8uvgZXCsw6ynOTxs?=
 =?us-ascii?Q?aWrEddpVx/nNQlzU5YlCO9qxHgui6tahjPzQn1bZHhKpUfn6hZ6zZTrt0vND?=
 =?us-ascii?Q?fKU69CUcgdUknxV6YuDCJ54klTAJUwItxMaDkod6pCO6WK5dcHzcPAKGNe+4?=
 =?us-ascii?Q?oaZEnIh014TxT5ZHRehbgAoyOxR5F4iwjHbj8xTvT1171P1hKUogVPwkxQ67?=
 =?us-ascii?Q?LZBnz3m9cLCtF32FFtogoYmiFfaLsWZaJdHvenQPH347xA20n3h4DfRlP1bg?=
 =?us-ascii?Q?b0C8NHlhw2c6ohRoBvO9NkgP/v5FlXI8fzlaQ22n+nqOMLL7HfomSGMfPiFI?=
 =?us-ascii?Q?hS6P8N7lDcs3uXcEO0+B7BNvdSIyhFOp2d7GHZl+ZLppvvh6yIlFfUauelHR?=
 =?us-ascii?Q?zvUN+8wxXp2ETv9QUSj8hd5geX2NPNjUakZdIJhwjTf1Sf/u7KGgosYbzOMH?=
 =?us-ascii?Q?vBuInSUqWj2R7wcd8hjarGSzjF3WC6Lhtust0zmlGpTj007d7Gv89fo18/wL?=
 =?us-ascii?Q?q0v+6BSQ90+aQvmaCoLx2iMhBCk2X5BoER4CjQsDlVhp6xO3LaHNwJlCPiwM?=
 =?us-ascii?Q?dvzp07fzoOSc6/FFZEPJN1EqgHWAnzg+cvFlxbkZUcU07pFFN3PZSfxL7tEk?=
 =?us-ascii?Q?h0HbqNePkQ2mADwAfhH5JLN5F2+ht5RVD5+Xu5UgRVqJyzDqqr2xEherHKJ9?=
 =?us-ascii?Q?BChaqTAdgzomaW7ArB2IMkCVhjc33ACt3VkKZB/iqmLMvmlKYW0F4OlpPEW8?=
 =?us-ascii?Q?9tVaiZ/av47IGTkMrS3kB5bwQy5i2hFfHOEznTdJMBGIfHmY3Ys9Sib68R9l?=
 =?us-ascii?Q?1fPA+6g1O4OT+66VlvmcyBRRc/gwfditcnf1tOBsnBIxxuPYfY5lNUT3Iu3R?=
 =?us-ascii?Q?qNJIq0X7eiqAIQGvbfTGb0uJomkkXf1bojBXsNGb/SzAQ834YUggstQQKS8H?=
 =?us-ascii?Q?T1Ki4B7LKzIHADU1onchrPPzlykMlcpi8T/l7UzHdXmLImVQ5puqv/KOIDeX?=
 =?us-ascii?Q?6TDeTWFBoA2O16MGSq0UBjBvldUY3XlVh+iPMVXEJ7yzMgTeL/L+BIHLMOVn?=
 =?us-ascii?Q?hOiPcXUbaSDrrJvDobmUmf1UIrTBbkFUsWETVWAUNIY7JInyZ34zcFw1Vxr2?=
 =?us-ascii?Q?4HJ1svYI7RRM5w7KL3xAm35V4Kf9imKmIcYRKRXXStNGdRFKGzf0DUJySSLn?=
 =?us-ascii?Q?UnOALZEL53Bf6ZR4kgdtJNoOtVnO9I/ytUBGgqf37bbclmLXNWMvGte04+OV?=
 =?us-ascii?Q?KTjb24pFXlAJQYdPWAO+Aav36RZnid2FEk8QpIsWBGuBB1e8jFz3UNx8uOlT?=
 =?us-ascii?Q?u2H8/1TNzB25Su7B+SewcyuyrhLFojngSmWVh3ThL/WxR/UXvnP85KlqnL7/?=
 =?us-ascii?Q?AhAOqBQOmGt0xMIu9DUT94nFNUmB8kKzCkmjZ8v0p7K8DVdoqWen2wYg6qhX?=
 =?us-ascii?Q?tF/gq6T6Su6ZTikic5pMCH7EGYfqJFYH7b3m19xGXbek1+VuxzbfzE072Qn+?=
 =?us-ascii?Q?Tu09ZGow+XDeLHULGpgwG1+8nD/MviUmPZK6raeW1IzuYFBHNQGOUaDOgMRc?=
 =?us-ascii?Q?enQordQML/duHBX4ox54Rq4h6dQqJNE=3D?=
X-Exchange-RoutingPolicyChecked: 
	DEXudmAKfm/su97z5MzO9LlRP+zMra76qqs6GsgGtmgbbxjcN5WqKuiUwt6tfMAGjXF+gY6pYJN79780BiAFMaMbDGWmUP8cTc9Tm+QwvzVvbLhrVxukAOJiVyBhZ9g4j+3xhziDTLQ8m2CbXXZ/FTNBzNi13CHvoA/4Dh6XS8Bx4b8X5cFwFtsHd2WRUgmy6mb4u7VqwtmWkqz+RMgoItmLzA/6XSobEQ3ysmRbmoVgwuTV9EsuMxNdtCJW8pXWI7ZzBYydc29k6Cdi6keA4ZWZON85LgetUz9Nw1k3gSk18CkHIwkHbNyh/xlzqsYfUaxJ9wwY3sqrPJgeTWMM7g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 886a6d60-b14d-49f2-f602-08de7f2c051d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 05:06:57.7182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZAeo6yKMtGPUmdBFnLFOUK1pMAN4zALu36FCFvm1tgccgazLRHa5N8n5RsOZqXId/wVMLxSyS7stKf2aMz1Q4wdCk00l6z7L/4LdCEDRVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8034
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: ZYI6UvPD9oYXvsTlvMC2PDTU0RG2x-37
X-Proofpoint-ORIG-GUID: _znDhCbRb2Ha_RYCX0C0KtxAufdMgD9W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA0MSBTYWx0ZWRfX0dh8uWA3t2q0
 6wfhzlaEZdp08iIW67uCf2mrb+84GXWZa1baU1gWLVF27IV+A7+P9iAfPhHgc/94+jCqQV5CPYN
 yh21aAt9TYMmqpV8eKGuYVhXzrXKXWFXBPlPWX+j49mVbFJyGB1vTbvR4ejHn9B7SiqOnIL9/6n
 dI8YwGD1A7NfHXFD3z4WKfDGAlGX07oWE+x9aM54oMHF0QlDyJQpuHNWljV8mwHI2DKWUEUvEO7
 QaTpm28hh2dNXRAHcszq836jVN+oK7SOE0X3TSzcoNzIUknErwJHLJ6CfZ2bK00XnHppb/h2anI
 er+hWuWLeKLZBsl0pO1+s4YqOG+3fuSdZ83Cd6DiC6sTTQtUyrqSW6mkAwlE7tRGSIRlQXCpGsu
 DTipJrAON0zn0yBdsCwyfPrKF0rs7DJ8JKpgWHgv8N/+PXm45bSaz7FSEp16iodVidT/Ikwh28F
 fomR4FxKsRVA1jkCcaQ==
X-Authority-Analysis: v=2.4 cv=Qr1THFyd c=1 sm=1 tr=0 ts=69b0f873 cx=c_pps
 a=7sXfYZKWL/+VDStniiEWIQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
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
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 05:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125052

When DISTRO_FEATURES only contains wayland, but not x11, world build
will report:
ERROR: Nothing PROVIDES 'libxmu' (but /build/layers/meta-openembedded/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb DEPENDS on or otherwise requires it)
libxmu was skipped: using DISTRO 'poky', which is missing required DISTRO_FEATURES: 'x11'

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
index 5cbb94055a..1c7f634b65 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
@@ -48,6 +48,8 @@ LDFLAGS:append:libc-musl = " -lexecinfo"
 
 inherit meson gtk-icon-cache mime-xdg pkgconfig gettext gobject-introspection vala bash-completion
 
+REQUIRED_DISTRO_FEATURES = "x11"
+
 GIR_MESON_OPTION = 'can-crosscompile-gir'
 VALA_MESON_OPTION = "vala"
 VALA_MESON_ENABLE_FLAG = "enabled"
-- 
2.34.1


