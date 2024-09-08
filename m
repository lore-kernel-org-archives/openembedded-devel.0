Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9E6ECE580
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 15:34:46 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.100])
 by mx.groups.io with SMTP id smtpd.web11.32164.1725809673142184746
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 08:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=SYlgyaEg;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.104.100, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVqywXT+3PR6MmI8DJCDa4ku89L+Z2zynCxJe+JBqVNxHHF/0fdzo7mDzfo6hBMOSm3yF+fsmrBG7wNhlSZAUum2KLhzBav30Cnf2GG8DTtTcA4/DrTFqbleaDAKyJzexu7ZChz0TA4Ig0ifzZGMOnCv+lE31xYMwFASfeyMO5ycSnRwpc1pep01ZZ2q+7JIIYyZp0McfJQST2qT7mL7lCiNV2KFHsJcAqqDpaYKLqoHQ/7OUQD9zPEbs+uvz0/a+ne+LwRyRCkz3vxZpk7UQcLP176n685edXTTYjwFEv+2h6pGtaG2mC28XDxi05r92jbt+RI6+CGEW3VWZHDWZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfd2gQD2+pAHcVI8ApbWDRVNqrJJSYkmI8m38cs5Emo=;
 b=IbG2MZ/iY8/dcV6Sr20v3cFgTbeIjrl0p0+R2ZV+y7pnV0pcmuy0JFRNmMRISBojufTWr0eFDu6/Lj7LXiNieA8jv9f2+Qesx8ta1SP0OrxXgTv2rREtaCv+D3Zb2avQfBlJ4rJYp36H/t0ldgLLl9imyk31BCVlYmrJ4hHjXv/POpWmWpjTbq7yNqJFhLJ75eZiMH9hj1O7m/yW+Sjzb+zWbH1T/TVNmjiTsBFdg+SfD7EsONecb0MFkfLPHGkum8ReOXfbJAi8/uiwySPccstUD1szu/Nt1rkh9GV5W0iNDiLeLOseirwC3RjSPpv+mz5JDZiBVb7BbYKDjrKm6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfd2gQD2+pAHcVI8ApbWDRVNqrJJSYkmI8m38cs5Emo=;
 b=SYlgyaEgRb9bFBlELpCb1V7c6DpnIJO+q2Ps0GnGkE6G93hl5Ug2wX+EAQDe83STPpAu9H9MkMZBvw7+LoPPXe7Fth0nN7WBTnH+W8NX2BjUAUNgwRvcr04qv7DiyK+XJNUVWiDAUmc65Pq3bkDaRIKNZZIRAcMY714DGe7zvHt5MVmCOUYFAMzRaJ51G5utWFAJB0acrme1Ac9sHbplUnpVg1YXdIEqBBZjjYeBzcY1SShfJkIYGkSkjPP4+pU9VSMWvFmYiPD7YiNk3Y55XL4Bxv8NfweMsF7PoUlRcmqvYocua2s+tw2KPq6TKIVTNer1rnwGSYjpN97G1tj9Lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DBAPR06MB7095.eurprd06.prod.outlook.com (2603:10a6:10:1a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Sun, 8 Sep
 2024 15:34:33 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 15:34:33 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCHv4 09/19] python3-pillow: Fix LICENSE and change SUMMARY to DESCRIPTION
Date: Sun,  8 Sep 2024 15:33:58 +0000
Message-ID: <20240908153408.4114753-9-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908153408.4114753-1-niko.mauno@vaisala.com>
References: <20240908153408.4114753-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0011.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::7)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DBAPR06MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: 6407194b-0248-40a6-eb15-08dcd01bbcd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TOeQH7h2kfWdkr66X8I0qM3HjrCcWpVA3/BUWmHCrQQJRnhtbGv8/fxAZYUq?=
 =?us-ascii?Q?H1f9U6R/PtlVRlGhfoIMa7zlu36hHygREjBwGHALb0VFvoADEnPiVY8h+e21?=
 =?us-ascii?Q?mgEYaE1i6yMA1uqDMRoVn4e8Vj2A/ZGru5T+KDqjm/5u4eFU82wMnQkFHApv?=
 =?us-ascii?Q?CjJGZy15/ePf0yglSO2eNGa73MfZqH7SMuVrCN1dhXNO38UjiWux6P00Ti9b?=
 =?us-ascii?Q?ly9zCkonXGKZXDWNTMXeAhsbh3hn2WmRDJOwbLneXHp9VpE/TQW/hU61aX3y?=
 =?us-ascii?Q?gpB146mBuCa2IofnHZTGivJvhKm2a8dil1soHW1Sj5oGC/UzWL9sEXMc+yOX?=
 =?us-ascii?Q?Z1hk5gHBLwjQ4mo4KCe7Ojq9V5OYQ3mfpWwmf1orX3H05GIo2+eySju3VW87?=
 =?us-ascii?Q?kfNQVisb1ywobBWLt1xDqDP0ohLerGSdabYcvyFm5ax3uhsuCGdoRMzZLBLD?=
 =?us-ascii?Q?0z0WMgioz+NAGWFbkXmxpyaG/MlltKnOgOn+l2BdGCGCL0p8q0TbqC7xavrA?=
 =?us-ascii?Q?0rF6aKONtkMW8+R1Doe/Y3LOpJTuvzhMiBmCjN5o/4WteVobP3prK3WBh3m1?=
 =?us-ascii?Q?TzULbsLA21Ctlw+/tkb6pnvRa/MKP7nG/DmNxiw/MtmRpNLxdHL2wMYg+ewt?=
 =?us-ascii?Q?gGYWZP/jdFO4CF63Cx6n/6T6rs/zI3HuqTD0hVROd05xXwS+3IDd5rYkX2qu?=
 =?us-ascii?Q?6RrSKX5VP28F5uIfRlNn/JUkDLIdwRLLN10mJ7XoypVx+oo/zKdHCjfWISVq?=
 =?us-ascii?Q?bQdgU1mISbJUS7gAq7e4TSjDDOtRFEieHvy2x1vdteBP3GuDlg5A3kN0nlm7?=
 =?us-ascii?Q?fh+D54mIjliWT+fGNLCNXoG6zENn5lpGKfFKAsfgzUG0KkixLtUoSCsT5eRg?=
 =?us-ascii?Q?DH/3j4AaLP26oS+UwW4JjgZ3uzHgZ5nChfrxE9qfNxN/STlNUQeBcr4Ru0vU?=
 =?us-ascii?Q?bYlEmngSu1klhmBWHYY1+41CJBbUePpH3WSbxB2LPx6kyFqT9yQltIWP1wiw?=
 =?us-ascii?Q?3EVjmV3dgM5+0k/iEY7HCxEAPuxAwdGJZfyCfKcw1PeB9C9vyeaasguyPZEA?=
 =?us-ascii?Q?8HIMtZrakKjX06cSIh8VyOngQBxgIJrh1SvIi7pcVMJUM9HceOSPFI6hjgyy?=
 =?us-ascii?Q?5V1nwtz50rjJUUCauMU9z0LhiFvS8iYzYv8uwMQpUZmsptO8wB6+4DOdhzkM?=
 =?us-ascii?Q?qpoa6MYVLxaIMlBbLI8SJfFJpwU6yYYWxWcJkldvZhTt7sur+Huy5qy/nlak?=
 =?us-ascii?Q?j0W2WxToU/A9GX1NAThmO2lJQNiYLfTx2ql+WMWLLdA6q9jv4T/DHcdZ1AWu?=
 =?us-ascii?Q?Cr2IQLa0Lb0YmRRp3EiC+7qvhwc0nSSoHm8e91A0CrkAgA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vWpWCNDqBpeGOuxg2fkKC/sg1ygIuv+586tPWPn/GFIHrvj8ov180YkP5vGq?=
 =?us-ascii?Q?PKBrZbZ5bYxZXPpT1fLYRvfCzuy3CcZ1MUJocTyQ1xWQM5qfRd1jUFWCMAgM?=
 =?us-ascii?Q?D2TVlPm9eD7TOdgRSqfpOq6mwEXTW3uobGpaWABww1zpFxhy24Plg6BAR8V0?=
 =?us-ascii?Q?xZYvZD9ssiHaQAxS7SAes6vADvZMkkvnqt8XRbq56djhHGfDp2A+gaKxgHmj?=
 =?us-ascii?Q?oEPwsMtSc3u0jUN3kE51F/aCUWPLmdSP1cBSsHYOXKrr+0gUbTuOCoD+oIsG?=
 =?us-ascii?Q?MLWh+mEa2GTXXCTV4AJPESrl22LD6uhQVxrx+AEyjURqewyWF8Rt4PzIxx1o?=
 =?us-ascii?Q?mCmygSGXd+2EMEUjQJjpJ02L980X86Ss3s8v0p0BGZ38fIz03r/5wRPTBA2H?=
 =?us-ascii?Q?nJgjIgzoxfDDJsF2xmGNvk8hOUdnzb4IaIYWY6ktlYzMM27HqQg0nMaO5zzk?=
 =?us-ascii?Q?j0vSITaRjMs2Em1RzrSBVFL5+tqI6vvScvAF3HuWmzeOrUtnwqqEv8H0Z5Sa?=
 =?us-ascii?Q?nugvgx8MenUt4OWOibgh/7cIo/S+FSFIQk9J+aAB3jiabobmQV4pkFaFKapw?=
 =?us-ascii?Q?RKcYVzlpOgaLi0j5S8cOeSli0WChQRJ34/r5akZm5CtlbRwndDMCosO0U3yp?=
 =?us-ascii?Q?KL7XsLYysoKicmkGdfFtewS0IRJf+BP5UT1xe8DZ/HETu9e0Uxo4J/aI2qmi?=
 =?us-ascii?Q?GueM+y+foQ9V3mVtbLYVdHgSFGG46btRN5Oxz1KA7uqQkszrOJgJZn/0dWnH?=
 =?us-ascii?Q?pAHzW1xM0SIbfwbMJ/HFwXT2PBbEcdBirU8OxCyLLHGKuVz2itc3VeSpkVKY?=
 =?us-ascii?Q?xv1zQQ1hiDLfo8HXFd48rEgwc3dB2T5Pd8+tIiAZaR/G09oUtZZhyVaGoqW3?=
 =?us-ascii?Q?8Pc3ljRV2XcnoVe5t4vtSeGgTNg2PgKC38KfFDEqeDZfUE4u0q8KWCIyHObm?=
 =?us-ascii?Q?oh8lDbZlNP0dib/hsi3Qgo6zM6l3Br8XjU5FiR92OC7GwVkyhaLDWd2hJYEG?=
 =?us-ascii?Q?+RtZMCi2KSzkflGskP20Or9O2QVQTnLPiswI07CPaKQy6kGjQoe5lSW99dPu?=
 =?us-ascii?Q?A8rzPkGBrH3kR8GVveh1XuuzxAyW4iIFLqJuUYL0+Ln6MxnBbudtIFm5N3bH?=
 =?us-ascii?Q?go+hG2zPjzKHcZpG95EHT2vftfR+sWHEuaQHj4B69eAxB1ShNVfP+CDUJIkw?=
 =?us-ascii?Q?nIw9PiVh3F5vuvWaNMKzMovbVu5c+Gnjr8Xxq9nCQ9PIssFtY/jDS/mOfuUe?=
 =?us-ascii?Q?JjdE1XY1Q9EGBMLeyaRQ7h/t9LwA3ZPrrFZGftfpr8vmQ8Ec0mo4aXD5Nwnl?=
 =?us-ascii?Q?mcxqaIhTRJ8+PARdcRlLpj1tiTuS+HosOyyQMlmf6HHyHaMHY11FV50v+iUk?=
 =?us-ascii?Q?TrAGx2t3czOYw04p4DpdQDoDPnscoY3P+3UVqLekj/eG5c13R42WusOpy0rS?=
 =?us-ascii?Q?+wL7TE8jreG2pZOAThGkEh7orY40RgNZYvjRqdbXR28+cvyFmMKxcVOZFHdc?=
 =?us-ascii?Q?AkNcjYP5xVRhZk2qc+15iV/pSmgpgyqLg3vFxOkMcJxcKjxu4i4nb/5sZAqC?=
 =?us-ascii?Q?xQU+wfhCmnDEUkzstdJuriRKa5mi27aeT0dk4dVwXfBVLTKqrJGiB0ly0/UL?=
 =?us-ascii?Q?jg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6407194b-0248-40a6-eb15-08dcd01bbcd9
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 15:34:33.2551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: szNUl3r6/pVUpd9DxSI51U7BEy+fxB7dL1PdKhGnWiW/tpLU0wDlrnxw9VCImI20nGDAzF2e4vhBEIeVyX86LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB7095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 15:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112149

According to https://pypi.org/project/pillow/ and
https://github.com/python-pillow/Pillow/blob/10.3.0/LICENSE the project
is subject to HPND license.

Also change SUMMARY to DESCRIPTION as it's value is clearly over 72
characters long.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb b=
/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
index debf48815..8b0bcf55d 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
@@ -1,8 +1,8 @@
-SUMMARY =3D "Python Imaging Library (Fork). Pillow is the friendly PIL for=
k by Alex \
+DESCRIPTION =3D "Python Imaging Library (Fork). Pillow is the friendly PIL=
 fork by Alex \
 Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh=
 and \
 Contributors."
 HOMEPAGE =3D "https://pillow.readthedocs.io"
-LICENSE =3D "MIT"
+LICENSE =3D "HPND"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc349a4b4b9ec2377a8fd6a7df87dbff=
e"
=20
 SRC_URI =3D "git://github.com/python-pillow/Pillow.git;branch=3Dmain;proto=
col=3Dhttps \
--=20
2.39.2


