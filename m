Return-Path: <wenlin.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E270FAD3F2
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 03:17:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5429.1776914253840049778
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 20:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DpUUOYzg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8573336654=wenlin.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N2n7xw905568
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 03:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=MLkc8I9oSCQvwjqiCDSC
	xYT6Muhd7prrBRzr6yulb1Q=; b=DpUUOYzgkX9gmXDLNGu5f12fKfZIyoINyJ23
	+bSRu0/SzxyWVrSxRqWuVXBYuoVtn1+Xc00auCE2wkcUgpnfNkgtwsYO1N40zKrW
	0UpsM6U+a0pJmkGl50i4Oq1BL7QUNoluYLNP8noY3GGqLxBv1a7GsC5yKk18i21v
	1d9MWSZCXwWWVu0C7y+YCuJvgqChST6g7M2h2fTh3klzpriANbPImm/CDzrio1ng
	H7UKoZSHpq7O26vi45nSQYn5HzgqSxDzeYpbZCUtjaNA3oyxLLYP7TRMRt/Pke/z
	PMhazTv/ioyNtwOOBVRfayitB2WXHJQApd7LyFN9Y5FUtdXrpg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010037.outbound.protection.outlook.com [52.101.46.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8qc041q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 03:17:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aaa08/lLmUxTLeVT7n6HilrOFb0uYgf4lMGvauVJxShhFLQ049UznlRLQUHG/KpZgYq0A4oOqDMsW7bD63KcVov2etZ2Vy2lmQZyCDPS9GN2hGqdKF4040porJEIkzZ3F/9r5Kc2zD3ThQnRSRji9MByI3orce9rqzM//LOqpfSRyN4HxaGiFqkJR/J6djCwwivTi2PoSVmrAGjE7ftf9c4p10Lpe3iEwZa9ansbNNdgwtX7wNi8a5Weaaj+8wolknQ1E+YXHaqh3W9jPBq9gVkdb95uCmEw11PLelHsbqXOlnTaZ/66HHOhXYnxrB0PUzkLHYrkGBAftp1w4Z8I8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLkc8I9oSCQvwjqiCDSCxYT6Muhd7prrBRzr6yulb1Q=;
 b=Oi5XCFM2UxY2NxhiVm8bw2IOJ2fseDhbJ4RPMVQpMg9iWS+JKOEG1+4AggtbdwqhP/WrfkH5ql6WJVhWhpcn4Ybwyp/ezVxGaTWbGyj22faXqMSnEhWrH9n8eakFRJmfWnWmwcTd22Z83lnRl0X+Ej797pIK44hwr+ZNuBKa/eHRgRkTc2ygUvFcYnk0wVLCHTACgKtcc/k2TfjXuijcSmj4GXrofuXHdNw6aiFVsOTGVLTV2R1etT7lu6fxL0huyy2ujGUTjxhBAVVA1tPoq1bWgpQ7dN5gFJvf9toEqKMrCwujgDtGYes0yTPiwtz+pil3+DafDAgLTwpwhLKdXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV2PR11MB6070.namprd11.prod.outlook.com (2603:10b6:408:179::22)
 by LV3PR11MB8725.namprd11.prod.outlook.com (2603:10b6:408:21e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 03:17:29 +0000
Received: from LV2PR11MB6070.namprd11.prod.outlook.com
 ([fe80::4c84:af62:dc60:fd9]) by LV2PR11MB6070.namprd11.prod.outlook.com
 ([fe80::4c84:af62:dc60:fd9%5]) with mapi id 15.20.9846.016; Thu, 23 Apr 2026
 03:17:28 +0000
From: Kang Wenlin <wenlin.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH] xfce4-session: Make libpam and systemd dependencies conditional
Date: Thu, 23 Apr 2026 11:17:17 +0800
Message-ID: <20260423031717.4186749-1-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0029.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::18) To LV2PR11MB6070.namprd11.prod.outlook.com
 (2603:10b6:408:179::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB6070:EE_|LV3PR11MB8725:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d4ad0a2-7174-4a4f-931c-08dea0e6d994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	e4GYaHHh4zb31v+Mh1xIKsak9ZlWf3tOtpFbfUswoCbAsAifxxjG7rdqRZ5KXQtXLCHb0NPmjoZYJoZpz9PBdVvhNz8y8EK9GxI7KSSx9fBtN+YTJ2qdxxxOfYyykQOVb6UVO7UuIG84w5jeM5wZaf2DIj1pmo1yw9CXskF+KbU/AGuQLtjgueKsuUqlrun25FH3+omD5LOjzpC9sIFRW6epBHsKroYzqVMPzMY0tVyqLeSlFDuPs6kwW2/kkYTSp6iCTn0To1udxquo3DYzwmX7X2h5izfihKc05ryPQUm9MPNW4UmtB6ciPNiJpkQ1KsbiCLnFDvHkpt+TqzWBRVbdh/xJEFD6kGa2JqDdcVW7ncQ0mK3zhnlYbWaPP/IUV/RRjHeIXdzof0xDGXxoH0wAZM0OkXqw+e0aBC8dhRmvRVWhgx3qHfnw5EUHXh/Fe+h2aY59B7ked3xilgtYz2aius8Fufi3dJ0ejuugh2xRO+QompQL5kiaIWcDiTqWVu+CxEPbqeILRtw+OcpSQkUaqVzd8Gk9WZhG+7GWycaioQrkJfRt3+QUqHvBXX2UHcBDrXd6m9lNMzj00mgdgDkbgtXRgt1D33BChmcgSjnjAMbU3tW7ZUiGv37mO6I+3vyxwGR99WclHpHEBATYrzSxBmQsGzJi9mbQAA8NH8yutntBFkMdnBZsQayEXblAIxRIu0J3Jw8620upsRrjR4V3dCinRpmA9voxEKwHUvTFmL486GuImQBsUlMRY7K30sfG2SwnKQHjEJNCChDRlJvUcEL00dfWFrZe/q7JRZM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR11MB6070.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CrFuAM9D4okHiNc/uZrQQq6pSfGW8yRHwDbIK7kNtOfiW6KNMiLUNLb8En4l?=
 =?us-ascii?Q?ri0OcQ+KgtOX2CQ9FCGE7GxCxbdwEzOVp9vDKypZdbq8u+jgYKboPtj9tDrv?=
 =?us-ascii?Q?pxlT4NWJWCQzlxjRE2e7pUMMK9iAvKDWqeDkhvKytuHJDX8uqSiBMjFqftq3?=
 =?us-ascii?Q?GEUb043aOLx6uGEE26NcdabV7VhkQx4fCkW2rGkcKFxc6Q0cRS1QeuGYX39X?=
 =?us-ascii?Q?lQDZ2uZwYX0ZBsAgZrFd5FKx9hjGzNnQBbYbCL+kFtsI2l+HCAPZZHBpZTUR?=
 =?us-ascii?Q?SGhIJfdlGChjpoCxboRBGbYirfgmavhkfDC6qrdR+ySJQ8vloeKf1DpGArNY?=
 =?us-ascii?Q?7yiuepUt7ygxuqc2cwKtlFI9+qWW0Dml96pVJh+/phlGXcNec1E5wpenyLsl?=
 =?us-ascii?Q?Rbok3EwZsTwOyfzqOGOS1bsEQcMBo8GvdVFwit9NAHfiYjY8Bhjaj8F0Bgyk?=
 =?us-ascii?Q?6NXI7uyZsPwuuepGymh1+lnqARSpkEDqTvhs2+75fcH+mYqX4pYrUdLHbufi?=
 =?us-ascii?Q?XS5ukzqyrsYWrAcaHgIPE93r8iKfsdYSiWTy62MF/Dlq8svfi6A+ovsvYMub?=
 =?us-ascii?Q?F6U0NFYa/ZLHZxXOq4blr6EnH2BznZdt9mB5xQ/8Xvd8F6tZB0dYT6kXRZo0?=
 =?us-ascii?Q?uO3GuQcLn1AwCS2bQKO2XZUR3Cl/ls2QufKXRZ5ew0ds5njE262MNA2jsJE6?=
 =?us-ascii?Q?DXmV9zn8Ygin4ErYmpSY0CKxtAhk5F60EUBqOiT8h29f5u2b/w0GScur8AuJ?=
 =?us-ascii?Q?jAa8j3LxC4a4SGVl1l5tlGr11xLFEES/258TUD/k2sbJPedhnb1dabjc9QNC?=
 =?us-ascii?Q?ArbX7fbAqkibIcqtoWdhh9sxNDJkuXU3MDuISmWpCpzVx8+m5WWBqEXLnT44?=
 =?us-ascii?Q?BREtE0PEnsOvRC2DDg+pCHTX+pT2MLrY6pR+zJW2WQa6tUFLHMPy7c+QNGMG?=
 =?us-ascii?Q?7bn3FZd+Y20Orr41QKdETuXGeOvVvUTMWq2fIXBFvLLwX2Ob//OrJh2RL5uB?=
 =?us-ascii?Q?QqZB+kxmPPqzwp+CzuIM9pQY6KYQSkqtAji2iuJaFdUtgQhJf1947AtGBIoW?=
 =?us-ascii?Q?NlbP1/v9/ldAolEfWrkmKQjTi04PpBCJ3JrnWvhS2aMujfU3r7P/jnO/2rfK?=
 =?us-ascii?Q?It4fHYFn7SmBcjvhzZ4R0oLlghJXSHimI6bhYPGZDZAe3XrO2YAPp/ZkLgJ4?=
 =?us-ascii?Q?YN/33Rpph/+MPFaeGN6rtRhU4LWtIjXjM9bxPTDTZ59Aiqe4dUOH6xE/I/l2?=
 =?us-ascii?Q?MPicUnG5o3Qf/JlJjlM4UyhKcWxHFcoOmqSO7OPbvx8elM05P8zTETTZ+0By?=
 =?us-ascii?Q?JkiT0d1SmqAxdlOnhO1Ik7Tgc1cueJ2Dbi2layktC9aSuQjXARm48+7kr74a?=
 =?us-ascii?Q?x9zlI+FbB3awLFg1VCWmrmx3pjQ5YXd0sLI/4crXWBB9p+VdzEeNfQerlbUc?=
 =?us-ascii?Q?tRLtU4LvufvLs0Kq85gjeuobkEgMuKQ2Wgwhlqgw7oGrrhoJ5N/i23w/N/47?=
 =?us-ascii?Q?CIeWBh4ooIMGgMgtaUF0RfTCDkissl7XSrzkDcs/myBBNuORHxFAny9El1vT?=
 =?us-ascii?Q?fxLHb9gAcR+B+/s+NgUr7iPCYdtDG0OJ2nJ5/lRWpHSBpengcrSIx11l7THT?=
 =?us-ascii?Q?zy4pExcO6sK2OFUyI3AAGl+x8aZNb46xwNAE8ddm0h/FjueraCx++PJRIXJw?=
 =?us-ascii?Q?fhI6vINaNlzzJragQvN/rFSQxjutXdxhQ+AlH3uCTatrH4rBXLaK4YD2rm7I?=
 =?us-ascii?Q?S0TKsO4FEk0T08zPGFaQWScabSv163g=3D?=
X-Exchange-RoutingPolicyChecked: 
	GAD1cucaTrvbFNifVo6Fl0CaqrHS4l+OtlCdUS7ziMEc07oubSundYXTA4960YK2Kx9n7acnLgRu6hbT4Se0Ealw62kEU9Vp3PRZft6onxDe1xtD5KVdeSBh+UAhOxmXtJxc9vgNRhNm/M1GIpml5nGXFdhcoB28kDUtB5srftrPNlXlMSTR4GUthBaqc5tUdxu4AD/YgLZQ+2oZMJxOsHHt0Qdhp3NvijlHz7wNG4TNTmGHYy5D9CpoPpSI7cwgumnoUDNpwyAafvpbigHXuPt59MI0K+dXqrXiF0qYzDHat52alyc1GlxvDT/07RJ78s33m9TuDden4G5xqrXYrg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4ad0a2-7174-4a4f-931c-08dea0e6d994
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6070.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 03:17:28.9209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+gkbmz7R/TwZMUZjnhPjbaqP9RcNfc8j8/l4RNI0vQvJHLqb/mhlWE9ygdfgQ3NB2lO3FP2a4TZmGbZh7eZuhUSdAaJsMNNvfPh1J/Pd3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8725
X-Proofpoint-GUID: -rbnqR-x3TpZm0aVoZSHwpWgz0impjTR
X-Proofpoint-ORIG-GUID: -rbnqR-x3TpZm0aVoZSHwpWgz0impjTR
X-Authority-Analysis: v=2.4 cv=EY74hvmC c=1 sm=1 tr=0 ts=69e98f4c cx=c_pps
 a=gjcLB77VbSPYcqvaeYBpgA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=B9blQSNkFW1w8koaVrQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDAyOSBTYWx0ZWRfX7qDsJtjcmTof
 seYMGLG0EOrTvYHUVEkPL59j/s+pPzYYyp57MAgC4AepTUwm7flRiNQ9BB3yJwTrALATIY/0yCz
 gtD6MvJ9CNFRmRxznxYQrC4ZFcOD3ihA70QJYaQqtjXYSXZmYRHh9FiJJ+UpHVpvsTVdFVvbj79
 7k2MCGNAdF8AmgOEtVvEcpFp0CSOpzDDwtZkFVjvN8vcuzidsYa29ms5xtx0X05trwaTWHbiCF6
 3uhvS3LXX/uB9A5ietYsv8E07ghqTksBBXkRo15S3WEV6TQAYH+jyl531r+XC/XzcbKnu6///AL
 c2+GE4OkySZzpMc+MfjiSWVxL6DgvauQ6o76wHnXmm/dc2FsyU9Y7fkgZGJGanDG119PwQxqODM
 i6geI6g5KgRaN2cQnH8MxWBPbHHNwOBFBcwdVHetKIVGi6/O+mywDBILV0qNtzFZHCPhuEFFfrV
 RahQ0yES0OR8ctPsy5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230029
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 03:17:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126567

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
index b95bfc170c..191c49b216 100644
--- a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
@@ -10,7 +10,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 XFCE_COMPRESS_TYPE = "xz"
 XFCEBASEBUILDCLASS = "meson"
 
-DEPENDS = "dbus-glib garcon gtk+3 libxklavier libxscrnsaver virtual/libx11 xfconf libwnck3 libpam systemd"
+DEPENDS = "dbus-glib garcon gtk+3 libxklavier libxscrnsaver virtual/libx11 xfconf libwnck3"
+
+EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '', '-Dauthentication-scheme=none', d)}"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+
+EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', '-Dsession-manager=none', d)}"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 inherit xfce-app
 
-- 
2.43.0


