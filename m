Return-Path: <wenlin.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4710FAD3E7
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 04:58:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12968.1776920290740128923
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 21:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KsCnG4qh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8573336654=wenlin.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3ZHJQ985311
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 04:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=waQksji83KvMrU/b6/Tu
	1r4MsC2G2j9rq/IHaatB1Xk=; b=KsCnG4qhh6ugyJ/TSRjIllxh0ITxP0zs70zH
	CmtDTsI3ghSgCXwaGbCQbLxGomrxzZ95IHZPU4V18B13GL6Ol08nhW85DUMAf6AB
	gCWHc2fv/iX99C1ZHpGdpeGpyabNe1vwa1y6Cf4neBlUp6YpymZWAnCIT+EWQVBQ
	YuRknapz9YPmcEmDf1UkT81dpN/D0ABlUQcJoNRsZJmy6W9vZ4uq0lcx39Slo9eI
	zui5ArC0lyvvAWUys+pxEl7kYeIgpwwtNVRPE7xVvhlbklt+juKiacXgLIhmMVxP
	vlfPL2URL6h93sP8hJTk1Scv/4UsbaoEO240J/hCEcy5y1h40Q==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012035.outbound.protection.outlook.com [40.107.200.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8qc065a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 04:58:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pj1boQNDETKehVTdOYqUfwbdBA9KSC6EpFadCjzNrOiBqavGgEO4N8VxIXluTeXFnW+S3seLX0OOPdcQEGQNeXx7GVqmepqyK0TbhSYX5wEySH3sQCj7Y0NmEz5B7Exnj8PwfiZlBWA2xFuPfV7v41BY+PRERYEZWFfME6oCIZHl9P7PequGaEvT9OaAx8/ckxN/GUQYLjGBfWh0igpcx9cFR/s1N1FhHECI2CVobaeiShEJBkrm+VIOAmn0+3jVHJ7eyxOFbBxhKENcLnRWXfp610cZFHwTPZnOSzj9SUdA/lHgA21XTR+whewtPaUHk7vaEHqz4WX5RVYsrAhtBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=waQksji83KvMrU/b6/Tu1r4MsC2G2j9rq/IHaatB1Xk=;
 b=Q5msgM8K/S802hkPecC5JUQPelxnbm2i4eu0qbY6ohs4LcWLbhCurZc/ZMH9OIaamqN/laXaKKJVN+vlqP1V4pKYJG0N+lb9VLIIYA90wJAFCKPbWCzsDydiAfpw3A0pBrFBzKfX+VXv/Q84T2lPuxnCMizLzRWGpUQrdbOVaYO34A9OcOzWBDlcOVz+PkjWnxMJUqhMxlZVOTFgcfIIqAf9P15xMB6Wlgo39vbCW+8Phtn9den/f49c8EWd1C1kzOmVJzhwgEMOuhvvrU36PU3tT0dyOGb4U6e77qenBdXAqHeGaszw8v7hvOdb1Zvnawdue7W2uGuzLxih8ItNow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV2PR11MB6070.namprd11.prod.outlook.com (2603:10b6:408:179::22)
 by CH0PR11MB5217.namprd11.prod.outlook.com (2603:10b6:610:e0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Thu, 23 Apr
 2026 04:57:04 +0000
Received: from LV2PR11MB6070.namprd11.prod.outlook.com
 ([fe80::4c84:af62:dc60:fd9]) by LV2PR11MB6070.namprd11.prod.outlook.com
 ([fe80::4c84:af62:dc60:fd9%5]) with mapi id 15.20.9846.016; Thu, 23 Apr 2026
 04:57:04 +0000
From: Kang Wenlin <wenlin.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH v2] xfce4-screensaver: Make libpam and systemd dependencies conditional
Date: Thu, 23 Apr 2026 12:56:51 +0800
Message-ID: <20260423045652.209433-1-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0115.apcprd02.prod.outlook.com
 (2603:1096:4:92::31) To LV2PR11MB6070.namprd11.prod.outlook.com
 (2603:10b6:408:179::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB6070:EE_|CH0PR11MB5217:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fe3bf8d-233b-4701-1886-08dea0f4c32c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|18002099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info: 
	BiNXLewpXIxWuo09V6tStRQYeaaTV8Iq3J45QoMC/TXwr8zeH4pz8KAOTcR7/nmASNIfhGkp0sbeXLKZkvfds/UATpv2eKfnjwvgKeOX7EBlU7FyJY6O5lvOlFtfyhR9Qwq4OSsB1dqcbWXVeFmD8zmLxYoWSSE2Cj6a0Ud5w7rzXGP5tQsyJtetSUXrTifA20CXGsABrTrgUoEgs4N+LfcFoNiRAkMR1Z5/h6IBUZe3U8v1gDeTi4n7h1k5Q/AACYuxxnhteN+yO+UAFJmP8fXw5thqoTVAGrsiDxWo2BrCMnOU0N+2jHsLiP9ck7PSBZGAl9kdsPJjuyjZdSpG792rLDpXXmq4gDVGyil3PAr2ebYRNx1CH3Xw/8NVd+K8TjsZOgL+73AP3eQMd8CD4fpcD5BFkaKSfEC218DsTi+Eg/X89A4atq34C4DAxxLv4MNywEXcOQK6dZ+JkJw49JEwHHa3pX/DQCX7N4O48/7rC+5mF9SKCqfXF+J1EqOlI7C9URpJovLljAnRJIggsmMvecO4kU/TUNkpcgEHB5eSddr2kqRBjk2kA31NUqpV7IYFuGVXWzeI9oBDWqrgpq80DxzynCOD5JY1z9iQ2UAYKUsiiG/qEji3Gz4Inn2eVtuFART2i3ET29L4P5v0fkMy7ywdRC2FX8KJBqm5OqdwpgfRoFFbXFHtU/kJ3lnBBdT9Ixh3gmuNxqonz7ZpQV/p+5g5Y9lQdsgyZZI/zxbvoE1N+ofe9037R/tR4iYXdZ2fsGenVBBz+/edg286vHV57O5ZM2bYQTMjJ52yc74=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR11MB6070.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(18002099003)(38350700014)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ff1UVxfmOTbkr46OefDkh6yAqfgcSduFgFlnigUeu4WqIJ6rkFRwBPS9rYfl?=
 =?us-ascii?Q?Sw3iqxaWIH+mN9HMbElbHXtJVogCBKpxvzt6mzUnzVnaBCn1vyTsr9l97UlN?=
 =?us-ascii?Q?vYltYrGMjClYH6fwiQIe2A7srMAjy7e+HftaZ/lXkRKY1DufgpipB6OmhPN5?=
 =?us-ascii?Q?y7zRrOcdHQ2x0hhDY8CCZTMHlqxk4ql5USJsd/8lKztHAr12vpA6gV53+NFz?=
 =?us-ascii?Q?TWQqQN9n0+dg+7A7L+Mq0MwUL9aDcSO+UNElqzTA+B7xTH2Ic8hEFiJRmkaH?=
 =?us-ascii?Q?fSNnLNWi+bCoyd11tUnlsB0G58gkKCfcQkMB4eUD63q+nyB9HmmldUlgImOc?=
 =?us-ascii?Q?mjL4xR0VlVTjHRE+dPWg1Ngz+TkuivPgBCs7hSkHd33E9F5/YN5jnpXRd795?=
 =?us-ascii?Q?2pjhdbmS+zcRQQWjysJAvL4hUIAt49HryESSD7YKSS9UR0rTBf36vOJOfAEW?=
 =?us-ascii?Q?vlKP4lfSemTXQzHkzFoyKHt7mgElNrGteJYdj7j4f+D9hMF3OagvRkgeQcuc?=
 =?us-ascii?Q?LPogkIDjABfE90gXpbYfEtB6WiCpom5JmA0SpxQjLJj+s8Gt4Uq8xmgdnScO?=
 =?us-ascii?Q?uoUlx2gdEjQhU4DpAP8+mkwohOjBPQg7MkCCg5k0lene3uyB26QxnwliozBt?=
 =?us-ascii?Q?RbjA5dPZzHmRhQa6ZIOJP1tvs6K/IAWbbERVBU4iNdkj2nHWY1/SIx2PkncG?=
 =?us-ascii?Q?vowAPTBn0GZVAjUNgt9sKR3YcpxFF01rlLSBRqsnj3ec3q9N32rLivlR0Hkf?=
 =?us-ascii?Q?gHKywkrXx/uygtTOC9wd83Y1u3cUCK4B8XSSB2MXXuDIZGbDcb4CNfwJ5jDN?=
 =?us-ascii?Q?2bv5MiPc5gyhEfaZjOtnSxQsTGR/oGaKQ36iyYS8oSzVpADw0Hd2cKItjYkX?=
 =?us-ascii?Q?0h5zZ6KojAJflxM+gm0Bf2jzDXggwHmyniMBw6VUGLR2gRLk9M5ZOkU+5djG?=
 =?us-ascii?Q?y5y656Ier3tPUxmEbmn2GaoUiChJgvP6L2+WttVoE1rRxGt+Rpl4gK+dKYKr?=
 =?us-ascii?Q?IYr01kLbRHciwYom+qDmltjYcWpNL74vyxKEXgJjhZOnlbbDXWvF0LLk6MjK?=
 =?us-ascii?Q?Eg/xjVsb6jpMPvDUS+xxvbp0sOHrseMlIeto6/VfmaZAaCjMz6yWnCGbRvZc?=
 =?us-ascii?Q?h5405S2DiigZ6+UCFdYwaxqWC/uVDzC9n9Q/7DBKuqYMADJQMP4pqZs8A/gE?=
 =?us-ascii?Q?Te0olJrzht6ltZJzaBwxZcK1tTi39r01LAs4MAurbt9xQXqMxhPH8KOrSBxh?=
 =?us-ascii?Q?Uf9DiSn9nQOTgfNkzVCdCngmqO/87uBVB7sZRWR1oknY9zJxU6O+tq2Ec0Iv?=
 =?us-ascii?Q?TrCLuj67yKsLJ++oe8Tz0/O1QPMTnqLfJEav5ybMxySKby4XPWP6kWBp/QtA?=
 =?us-ascii?Q?yVjtTdCpA/5zLTzIfqrm3MJlsnMM3yk+qttER69HWkiTK2iel70iWlhDOC5z?=
 =?us-ascii?Q?G8z2XJYAL6aqmQvq7Z/j0leh0EjUyXalOEX0g3CFXlkC6Ct6bciY/7jtSlOc?=
 =?us-ascii?Q?eX1/MIq4Mq3dd4S57q6xeWrD3WQMZmGZgUwvhzdKqQgeBpBqcKid2MXsCuKy?=
 =?us-ascii?Q?rpjr1PkHvxtU+G5lsmck4r36cmu1nlsgmAWqkS9oR8YMero37wC2O6taE6QZ?=
 =?us-ascii?Q?2if4pRnxYMGe8k1mQS+vQQmvU5VEKfqfN2z2IK6dzlGBEvuzjwd+//XWBhBS?=
 =?us-ascii?Q?nu4eOKEwBaGzcPUQCYiWPNJRuU1vrfP4iGBWmNU3yasA30bBYhZ6azF63Z9S?=
 =?us-ascii?Q?bRiWftqQPhWWrT/imvTNmIOXo6NlmMo=3D?=
X-Exchange-RoutingPolicyChecked: 
	dmhJMWjNi1t5Z05i3xLUbiyhtrfYSzxROlpWWylQsf1wVBVUdg0lGIONxsKkRDzVGlExb/i17E455SwY/AP4yGxDPTaPmi4GtQbr6mWtfvW5xxjM5hXRhSfu2MtyEzmHwEBemADHW2UMbGc+5vynyM2/Fv7Sw9OzA69O1JaL8LEtazN8GY9kbKLlmRSmm9P5Cb7decVM440SglCiVxl88LNEFvwXPWSMiJ/u7/5p5vRPvnkw9NpSk4uy4Zmn+6SgdbYQdroXuL0b4TPLRqdSA+yP20yCwzCKi5rvHVrfW7it3vDDyvY9CH9TTgy96MnILn9y42/VDCYvRFbh3asAPg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe3bf8d-233b-4701-1886-08dea0f4c32c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6070.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 04:57:04.2826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cHdoxwC6UapPEzJZYXlXvKnPDmlYEjMn3dqXkWvTEUWRgtC+15ni4+1TejTj1nZOsAp4fvMK5FZW42sShY/PUm910Dl4MSv/OnCoyD3rirc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5217
X-Proofpoint-GUID: j1YwSFcwzXpGZVW9tWGvpOEAzeiYiNJ5
X-Proofpoint-ORIG-GUID: j1YwSFcwzXpGZVW9tWGvpOEAzeiYiNJ5
X-Authority-Analysis: v=2.4 cv=EY74hvmC c=1 sm=1 tr=0 ts=69e9a6e1 cx=c_pps
 a=3Rvb9JmgCdrss5EpqVD9LA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=B9blQSNkFW1w8koaVrQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA0MyBTYWx0ZWRfX6PhshetsfjQk
 RLHD6JzOGiM/BR+pfuMBj7fzj8E5ueqIk4ykSbwWEOgbOsEPHyU756JBJFEoDqUFmS+iRTo4ZXl
 m5PVcH5YSlf1UnonB/wYcXgenss1pzZqAWC+JdoColJ0RgidZtqJ8RGt4XIZBkpWkBOK9LlhDMx
 /8fkoPEBzMjiD2TZCn2xo0HAOKtXr4TWJfCnlv+tR15GuOIx3WfzpxNs7tyyfBM7m91nCTxz/j0
 wI5zmVGgSAvIteGiqlBxD8IxuzM04fssPXwzoy8f9CjnPdqzxSUBZMmJMNNrg8ZR7QSrmlRb/x6
 4dydKDFU1kO+V0e8peADk8OXLQPmUO4sC208yQcU8wU5gZNkJjiBkIWX3e012XXYZz82RcW19nI
 7EI7B5ub7u/rwoOIqxLtO7LKlsJ7yh0Zwsd/JoivePnrvO0xzsIFP9QeSPMhHIlk4/7CwEIyl5w
 QK96Aw/gtZq4PL0AGpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230043
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 04:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126570

From: Wenlin Kang <wenlin.kang@windriver.com>

libpam and systemd require the settings below:
  INIT_MANAGER = "systemd"
  DISTRO_FEATURES:append = " pam systemd usrmerge"

So remove hardcoded libpam and systemd dependencies from DEPENDS.
Add conditional logic to include these dependencies only when
the corresponding DISTRO_FEATURES are enabled.

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 .../xfce4-screensaver/xfce4-screensaver_4.20.2.bb         | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
index b95bfc170c..2136892c4e 100644
--- a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
@@ -10,7 +10,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 XFCE_COMPRESS_TYPE = "xz"
 XFCEBASEBUILDCLASS = "meson"
 
-DEPENDS = "dbus-glib garcon gtk+3 libxklavier libxscrnsaver virtual/libx11 xfconf libwnck3 libpam systemd"
+DEPENDS = "dbus-glib garcon gtk+3 libxklavier libxscrnsaver virtual/libx11 xfconf libwnck3"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'authentication-scheme', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'session-manager', '', d)} \
+"
+PACKAGECONFIG[authentication-scheme] = ", -Dauthentication-scheme=none, libpam,"
+PACKAGECONFIG[session-manager] = ", -Dsession-manager=none, systemd,"
 
 inherit xfce-app
 
-- 
2.43.0


