Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27B5CDB482
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 13:19:06 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.80])
 by mx.groups.io with SMTP id smtpd.web11.89849.1697367728016861852
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=ZbMTdRl9;
 spf=pass (domain: welotec.com, ip: 40.107.21.80, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjhiAJnYUG3W0qHWUU1mxVaq6CWbwOIra/KmZmnJ1e2w4IXyR2rkT3PMpF1jGaLVQgX3Pk1butEmJ6uwJyhC+Kj0FSYCUCSNSiFRCM498vxK1DxMjIa5CFmR1r+MJJ0TKwQNinOhLNsmNhm/PYDLLZ60tnTOBhZ03CpGhpAa9z0y7DIxrZ61coVyWRXjxQ6bOAwL+LgTq/JKYElExdHh90DCzYl2eagBNAZ1t/S54EvxYwIjdgotXHP0MwqqV42n2s9FjzvJxSxoroW3AFI96ugegh3L0/jul00K9I0Xx/qqw/QfP2Y0BwoeeRQLjsuM0b5s1XdQyo8c1Vf5I7Ncfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=962+Qutmx7yOQMSpDwCTL5Y8ribZgRBYEVAZLIMnMYY=;
 b=eIlzyp70eMsK33QgyDjpYO5nox4wWgygJwO/UZb8R6xTAU/IHax4ff4FpkpmrOKWmlAT3ZHj6cW6HwBl4v135LK3MU8OO0k+nJfzfjXSM+9Q/MkAye5VaQ6qwUEYQI18q9j451W0hNbFUgj0rygiXkk1mRa4Rqpb+XcpXbormsoZVfG60EpdqG9BOc1iKvAO1SR+cbBJVisVZnT9Iv6z/EjCfwUsxbP2uEJYH3Qk/OUp4X7GN5IKRF9lfL0/xjH2/z1Cf2vP4GfKJgEveDC+fZktPcWe20TmlksnoEW27z2z4FQzssYSEZVDVoGKXb2SAG4I2ytvgfDyULdhQ47qYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=962+Qutmx7yOQMSpDwCTL5Y8ribZgRBYEVAZLIMnMYY=;
 b=ZbMTdRl9f+pul3aFuKsTmsycfaMj9ve7A5PcYNFhqj6P6zz3fL0w2quwinwava5JpJopvx5B7f+TaDtYUwAkw8VLvljgucP4J9vHRnnjjYm7vlgzKFjLv4vcD7WewoA39EiymsKfsVq7wDo4xAlUWgjkTN5nOA/vfH9wTKv/epxYxkRfazD7+0Mx6Rtr/6lgerfROVfWMzOZeYaaxVEwZMFLMfYAUfOJGM2roMB511aTbBoXPz8vyc1yIgMaehP+IctUeoPZcHjGDkXmrYT1R6rdtO61WD4s94rOKEdI1p04dtBW8dC5spMPIaj+kiUwJhRtflbPugYG68HhPcJiag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7925.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 11:02:07 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:02:07 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 07/11] sstate.bbclass: add support for ACLs and xattr
Date: Sun, 15 Oct 2023 13:01:50 +0200
Message-ID: <20231015110154.53364-7-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015110154.53364-1-p.lobacz@welotec.com>
References: <20231015110154.53364-1-p.lobacz@welotec.com>
X-ClientProxiedBy: BE1P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: e50696b1-5141-49f9-6fd7-08dbcd6e2bee
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PG9X8K5slZ1GM+mP2E1Oahg0Ns7Hu6frt9VuhJJSr5aywU66D2GXa6hsNRU/pPHfhzRiBJIR5+nzoiWdXGQju/jiWiJ55z9+YPBQNAFZ5U15NXB3X/xyGdQl/jmwZR3DnYxNzqLjhoTApNOIMO0NxIi6NkD/iWZyxVMKEyrj0qsOzrGS9LrioZvXr9hFl20Uka0ApmqtcIUzz+R4LTGgDsQ2rxckxF5i1e0BaRwJ5oG5HYDS6/JoTqbi+yhOVX82hlFHn+EGUm2+3i7kvW2JK0m73KzfHHqbdi0ViL5Ib+0t2fjBK/Pm5+Gt4OO9JFCQqaPFf6a5qnRjnlpEKnrFI1XAm8ooJHG5JlBBGHw4uOi7TfODlRRUNjS8AKhGk5la5dN/1BZhxY0+C/TMovJqPS/QtUGoyxQbOyLO2lFfAiu1JcYIjy2Yp7J8gb4qTY2/LISbSpoSvTfVrUpXMMHiMVSPndeXZ7ahxJ+s8NZXxzr/aszB0N8JFdVMdD+9EBBUemTLTPfFLGcsUyKjmg/n0gRro7CyEWKqDvERCyt08zLGwuyD2qmdABueC/vfh9hN+UA0lifObJ/5OhpRoD5O7NfVliw7/IWeJsu/qhDAZ5Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39830400003)(136003)(396003)(186009)(1800799009)(64100799003)(451199024)(6666004)(6506007)(6512007)(52116002)(478600001)(966005)(6486002)(83380400001)(107886003)(1076003)(2616005)(66574015)(26005)(2906002)(6916009)(66476007)(5660300002)(66946007)(41300700001)(66556008)(316002)(8936002)(4326008)(8676002)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rjeV79wVYbb8N6x3kbIpuQ1CYo1MFMpDl1rVAcatCIuoHZx87x6pSdLFJLM5?=
 =?us-ascii?Q?g+pkqORGxSiabVsIYa+EaJyOd3aJWnTaMxprDj/H91Or1Sfv3dPMQmxFJW4B?=
 =?us-ascii?Q?2WUDMdyUX2Hllm52HiahXOjLRURFzJhIzURw1eNdsZaqS7gixwzeUzdiPEHM?=
 =?us-ascii?Q?KHm8PZNY9brgmFrsRKs5CgmFQuJchMPs4Z5T4h4TbcEKo+M9ynHM4kwQGuuY?=
 =?us-ascii?Q?TiLc260ER/H2ROT37Ss/ccm3+pDxup4oxL9yeQhzH5K8opBYDkYUxGKlTA5r?=
 =?us-ascii?Q?P6oi04QLkhazPCy+G/Zi3TDS//4Y88p+fhFPLAYqugLmj7DfEh2w40E+R7Qt?=
 =?us-ascii?Q?qpsInmA8k6byCVcSleJOUU91S5ESfokEMc+c/RznA39YgoEOK3E3KmgKwRFl?=
 =?us-ascii?Q?1PFTMrCmuh0qYP9Qosy/8C47BHphn+NH0+yvW3VIGRHdfrexVGier+a+W7ns?=
 =?us-ascii?Q?6mgPhpeQk+26riRxM+ZtCnwAqsrxZI7bXFUsFX2KhLXeUPlrvkZC5hI468UB?=
 =?us-ascii?Q?TP+iNN2bSj3RcOLEesS2hiVQIL5l7T5JAphcKn2SAUJJ64R+IK5rK+Il5gc9?=
 =?us-ascii?Q?B5lQ7GTgqC4RvsyjgGNQp3bampvoWEo6ud1x2gZ5RifemNIn63g2cjFjdAch?=
 =?us-ascii?Q?7NrCZrDHcesvZlwJZtPHRgQqdzUKgYYs8rCS/hLESuMfknca5Xm3kNVQKSCx?=
 =?us-ascii?Q?bLaccCl4jguOTLh+0ze/mUx1gZqsY9K/c0Ro3rGAsNO1fmZB9hF7tQL5/IyD?=
 =?us-ascii?Q?Bt3L19Y80h7SGf4U+Eljv9Y57LCBmqB7tb9HhTGT49IUH9fdWjwdur/4V0oR?=
 =?us-ascii?Q?sfhSX8f5ULHlMnEKFdu33ClMZbZpgQZjHrpcj9NIjB1SDKxXTCYbTBp9qoky?=
 =?us-ascii?Q?OyFifppyWKtzMCfFA5HkeK+hPz5UPXLsS1J5twSBxEfVN1HmJa9hNyuoZLcJ?=
 =?us-ascii?Q?o9qwJCg2qhs38qlK6KMV/zTIxL32qXx4qudQVi/6nTBFwtEbCiDIbLck05Zz?=
 =?us-ascii?Q?7wR3abbOHV/ZwZXssMPktzfdSZC4hDzvLhSpmBtnmMT5Xjzc/QnslG+6pGTA?=
 =?us-ascii?Q?LIrYoNCExd7iJXz6u8vHrO6hKAYGy8ClwZdcaZ45+NswtcXzcfr5Ow4rMcsQ?=
 =?us-ascii?Q?eHhrBW8Mm/aAUxkGBwkH79RnptqgkAJwTf5jTS0NZvBw4by+e7QwGlSdTA9H?=
 =?us-ascii?Q?9sJ7hZ4DdmJHQ4RBV44ChkjYBzwPRhHvQ2iMbAVdHu9z46TEEygRWNO2rQtA?=
 =?us-ascii?Q?l/GGH3T4UdqAIJxGHPLTBLuH8joYEAySSagqcWpHDEG/T4bSZfGGZN/CONxN?=
 =?us-ascii?Q?l1DrTWNtdJOBZ8moU1y9pSnhB/hIdLsQmbQ5vFHbpzLYKFsEbVoXgDA8gLBe?=
 =?us-ascii?Q?dvfqp6IIy+FG+1JFdwN0h1C7nyPOoCGGPtn1q0xQF2ZigsGn3xISN6E5WpW9?=
 =?us-ascii?Q?jBWRYHfWrID8tlD1K8Hae/4/Emu3nT4GlZVDb+zC23sOYBjTuWS5da797u6P?=
 =?us-ascii?Q?T/FQywoMsHBXbpGb5LgSdBO1RFwHlkHrFB2hevMhqhIlLbgUFUWD9tSx0oCH?=
 =?us-ascii?Q?xeWsjCyM0bJq+dZrJT0ZT4YZRZ6tL8xE5qvyNlQq?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e50696b1-5141-49f9-6fd7-08dbcd6e2bee
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:02:07.1960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PHQY4A8qiNJEc5xg2mojWg++mCLJOoV/QJKB1uYBimYwE7so9MB27+ewB834/vZ52fhlrqrO/LWebEZWfXrbuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7925
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 13:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105512

Extend `tar` command, with additional parameters, depending
on choosen package class and target distro features, in order
to support ACLs and xattr.

Additionaly set archive posix format, in order to preserve
milliseconds in timestamps for reproducibility tests.

Currently only `package_ipk` supports fully ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/sstate.bbclass | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index 5ae6f515f2..3e7b2ce474 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -829,7 +829,22 @@ sstate_create_package () {
 	mkdir --mode=3D0775 -p `dirname ${SSTATE_PKG}`
 	TFILE=3D`mktemp ${SSTATE_PKG}.XXXXXXXX`
=20
-	OPT=3D"-cS"
+	# Notice, that if you create an archive in POSIX format (see section GNU =
tar and POSIX tar) and the environment variable POSIXLY_CORRECT is set,
+	# then the two archives created using the same options on the same set of=
 files will not be byte-to-byte equivalent even with the above option.
+	# This is because the posix default for extended header names includes th=
e PID of the tar process, which is different at each run. To produce
+	# byte-to-byte equivalent archives in this case, either unset POSIXLY_COR=
RECT, or use the following option:
+	#
+	# --pax-option=3Dexthdr.name=3D%d/PaxHeaders/%f,atime:=3D0,ctime:=3D0
+	#
+	# https://www.gnu.org/software/tar/manual/html_node/PAX-keywords.html
+	MTIME_ARGS=3D"--mtime=3D@${SOURCE_DATE_EPOCH:-$(date +%s)} --pax-option=
=3Dexthdr.name=3D%d/PaxHeaders/%f,atime:=3D0,ctime:=3D0"
+	# --clamp-mtime requires tar > 1.28. Only use it if SOURCE_DATE_EPOCH is =
set, to avoid having a generic case dependency on tar > 1.28.
+	# this setting will make sure files generated at build time have consiste=
nt mtimes, for reproducible builds.
+	if [ ! -z "$SOURCE_DATE_EPOCH"  ]; then
+	        MTIME_ARGS=3D"$MTIME_ARGS --clamp-mtime"
+	fi
+
+	OPT=3D"--format=3Dposix ${@bb.utils.contains('DISTRO_FEATURES', 'acl', '-=
-acls', '', d)} ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '--xattrs'=
, '', d)} --numeric-owner ${MTIME_ARGS} -cS"
 	ZSTD=3D"zstd -${SSTATE_ZSTD_CLEVEL} -T${ZSTD_THREADS}"
 	# Use pzstd if available
 	if [ -x "$(command -v pzstd)" ]; then
@@ -895,7 +910,7 @@ sstate_unpack_package () {
 		ZSTD=3D"pzstd -p ${ZSTD_THREADS}"
 	fi
=20
-	tar -I "$ZSTD" -xvpf ${SSTATE_PKG}
+	tar -I "$ZSTD" --format=3Dposix ${@bb.utils.contains('DISTRO_FEATURES', '=
acl', '--acls', '', d)} ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '-=
-xattrs', '', d)} -xvpf ${SSTATE_PKG}
 	# update .siginfo atime on local/NFS mirror if it is a symbolic link
 	[ ! -h ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo ] || touch=
 -a ${SSTATE_PKG}.siginfo 2>/dev/null || true
 	# update each symbolic link instead of any referenced file
--=20
2.42.0


