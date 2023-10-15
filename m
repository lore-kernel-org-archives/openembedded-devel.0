Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AB3CDB485
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:28 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.60])
 by mx.groups.io with SMTP id smtpd.web11.90066.1697369032343148425
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=SvBrTeCZ;
 spf=pass (domain: welotec.com, ip: 40.107.249.60, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXYQG1d3pgMJLuBWN1opNnNlih5k6o1W13KP3KfpP2gcggmm/2TSVtRbIL+5TDaqGPxbPaPOhWfeRr/z5FkzWNSXhrzi44rKiVyKe4De5VCOGlc67PzHgsLumQF52l6ettCsFNeNj4k5XkkYsXsd0neGA40CkaJTriVmZv9TCPKCe9N5uXQ0CBUSm4WFWOpGmTwESzHUCLdPqPGHPVznsNlmdz0iqZ+gYvzLanTjfVQukA4zqrl0j24Hl0mGeCzGt6xwM2w3FmIESPOpFiuTBvqdZtMGcnVkko77pjI6T6BnskuXbusIaRC3oRNgB4tqRixUF1H533lgIkIxV2X/oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=962+Qutmx7yOQMSpDwCTL5Y8ribZgRBYEVAZLIMnMYY=;
 b=TjyTzQBjPdP4CNEiHk4lV3g1WK2xzfhVRIwr0SLAAfuimdkYfIk2/H7BybknIo/miOckiI9mSDT/1ZfbNkH8BXuwkMNL7s13yi99Bb3qonebYmLYp32XRP0JvM0avJhZCeLNn6Ll2xmAhBKa+UziOZv+Lk2kRaLKOA8RWyFXX5HF80jimU93O9rytMz72WV4A4sjGwV6PnKAbAYxZpD/nmGVgl0xlhvuiyicxqYjz4A75coSvHuLIo67mb73LJYPzO5rKeOLgwr24Z9uPEuAxEe/Y5WjdR9lVYB3C8NJFnM/x2U4QmHH/YXKqNFcMbRemj+EgT/hYGVcxTbm1Idq8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=962+Qutmx7yOQMSpDwCTL5Y8ribZgRBYEVAZLIMnMYY=;
 b=SvBrTeCZ7vWY5sdhdYWV0JyEIe7AjXbIrPwouajiFPS7QtqXkCu2iIyBV0g0Skf3k14CKtobo9Jp7EcxtDTVA+3XggDWa2yvx8MruFgNQJCFEwnPSc3XqSERwjAZVqSXaw05LGzGsZoGl13MUOj9IIYZuZS9GthGmSvVdN8YXmra21uG6wSvsNwGEdIvZZfEsFXwdEr5BnqXmn4iR1oLt5Gd4M35tYfhjSafedn8ExisprqoJQ/Dv3KrJZf6KfH/7LseTijMq/8UDyit1kIlYKVzaxXQH4e0CMkF7b8PAVZaxOhkBaBxyzks5bk1PbVhc03zsQ0jAygDmIy7zLg5ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8113.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Sun, 15 Oct
 2023 11:23:51 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:23:51 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 07/11] sstate.bbclass: add support for ACLs and xattr
Date: Sun, 15 Oct 2023 13:23:32 +0200
Message-ID: <20231015112336.55722-7-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015112336.55722-1-p.lobacz@welotec.com>
References: <20231015112336.55722-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR3P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::18) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: c06a2de8-ba56-448f-2e1d-08dbcd71356f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	90iMbRozYOs8/LowRt9u/3cKLHeP3fZXNT25EdphRg8ZiGnSDFg03HFBv7O4Styu76r9JQhvJ7vTSXdrbpREBHPZ5g2EXKlQTge0IP3OluKLyEet/Wk8E5nwFhALzeOVg8LmBbepyL38HfkDbJvK9dp39FF3IMQDisi+CL7pp2X1XIaw8bWZEmGe392XJOTE2XQIOT5VeNc4mdc3jUH9DWeBBXSGdqqZ1LX4z5ZOlGxnmF+ZJHLwv32Savd8x3v2Y4QhdoxTfS2rUO6xftqL647K7A0KS9GXUrAx/t1twU6pROcRN2OB0T1VQZ+gIH7MadR0wpVjwYMBBI0xnU27THXcAG4lbpgXCE9AC02gYHB9JBJJ0tiLy3bq042yT7HyLsZVhhuvcKY5sxYnwDZ0l6CJAq9xnAt4QIdKVj1eZkLbalgSImjvw4+2i7IRBUWFqVGTPL2804JSuiW8KaFb7+6rUjtdBEWJoSeH09rhJ1aBV5ZEtxgRG7D5tUR0WWodW0g/RMmjtRTUl6YE8rt9jBY3klODcPg5G6l0jr8cc++AgSFM2XP8kyQxrpzvS58ALfgjS6Y3tfcbKyNbHieh0DLR0PY0YlFilNYVsYYjUio=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(346002)(396003)(39830400003)(186009)(1800799009)(451199024)(64100799003)(478600001)(966005)(6486002)(66946007)(6916009)(66476007)(66556008)(6666004)(83380400001)(86362001)(38100700002)(316002)(6512007)(66574015)(26005)(1076003)(107886003)(52116002)(6506007)(2616005)(5660300002)(41300700001)(36756003)(8936002)(8676002)(4326008)(38350700005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?H3sIQlmC3E3LzhLnIc/FpnYvEsRxEeLsv/pli+3O5Q2JL0OKIXrqD6EKhgmM?=
 =?us-ascii?Q?YkyBvrpgggwBRHA/rGbLtNKc6d4IJfYIvauyRRaVJUl39Fq/cc/yT2ZdwPFM?=
 =?us-ascii?Q?zn++5RYRkffb4ylvqc6P3LCpoU9qNGu03AeLX62YM1JFNUg4SjetScLKlls4?=
 =?us-ascii?Q?Jnh3RFOFKoDdLN1an1RpHZDJCV9xYNcrLij764++GJ//h+UMHTzGHvjyuI0D?=
 =?us-ascii?Q?gTUOdRsshneoMKuiHfPX2cjdxFyBAbQPoH8C5obS+J/b3C82och3AnxI2UAe?=
 =?us-ascii?Q?wduqx774iA9ygmjjGpE1KB8Nh+lq2oQ1niCxe62lJ6eaG2OAnokDIIJcqNgh?=
 =?us-ascii?Q?fklBsp3kf1q5wIoHsYtg37fOlf7V/jnZG8yqU3NFsE4RB5vOIgRepOhGY177?=
 =?us-ascii?Q?On80dxfahwURMrZd/T6lBXp1Qa+MhyfjEQ5nUTK0jwjLJm2SGzc1+kls8SJQ?=
 =?us-ascii?Q?kmyWkyVc1dQh1TQoonD0kC9uIfxYYQ/UbRFKC+eaFb2W/LSj6I75z2haaAOV?=
 =?us-ascii?Q?8XzGJA8i+XO6j3XwI0W5rMCYHWMM+yyw7NJCTuc5geSRljOhv7ENxb9Yc8Gp?=
 =?us-ascii?Q?WovAp3d+tUnPUN9XLk5FR82c0kaegmWp9OyfqRSUsaIJrvfuY7rNtGABksZj?=
 =?us-ascii?Q?V2llCC/SS51l/erjyyQfjGlIYO39iPEdSXnE6BGeaKDXzHgOVxJaDNAm83ua?=
 =?us-ascii?Q?6yJ0YRNofThiOZ9eq4PfcrJaG8hBSotUjIVfB7VxeLtz0eIRSPAkve+JsZdB?=
 =?us-ascii?Q?GKZ6Vd/NFyY8I3JNP6D1lqxa5mlTGjScMPprIxxelmurlA/y5KAd2lJbKOHY?=
 =?us-ascii?Q?10geSFsoyOFm+PW2aufEZRtXnhPF/vB2+ElT1EPKEJ8Y94YCbwEYimAxflMP?=
 =?us-ascii?Q?uAoPtx5afPnHbY01J082bxCgXovFk8CnnlRwMCgbm7qOK9o+l4Siv0RrH9Lo?=
 =?us-ascii?Q?az+5y3q+v7sRYehUe4Mf9YOhb5W5+wjogr0M8Lhs93c8BEP2O+N3s7pI1JgS?=
 =?us-ascii?Q?GLw0HCG7h7vtcpBR71h0a9o24YOe4pqtNv7wZETjVO3Bt5AAebN+oitdJ/w8?=
 =?us-ascii?Q?v3DKj1RADqmZ0fNs+EcF0AAvAg8l+b8hWrJIZaj84UTEaTms2h+qFtuxnCi1?=
 =?us-ascii?Q?tB+eGoBMgeierhiBtD9sFA/lWTdV8Cbi/NTv9rmphXYIpP4P4w4Sz8NaqBP+?=
 =?us-ascii?Q?Thp49Zfc/GrIO/GFRZxo5JUGEQjpmwxV8zko/f26owXkGzeiGxQ3w6Vi/QW3?=
 =?us-ascii?Q?Bd+QKJNcOE5nFy0ToWtTDVbVAO2FOeU9M4fHOea8oWXfwMfIWZipG/LHYY4H?=
 =?us-ascii?Q?JOrYwpdeRCpKR6cKnLlVjmAz+5lHOuyDT9gth1t21aXNFkMenVXLpxnJoLdP?=
 =?us-ascii?Q?4XG+wl8hIxN+JL2FZkogdntEqazq/haLnlHWy9L3IZ09sktHB/WfCQhNmBd/?=
 =?us-ascii?Q?/DCHYnN6ITrQq6UXzIAV7BgIJt4L/W3mMbeVL6kHr4Iq1fEl8IwL49xFKAX7?=
 =?us-ascii?Q?DPaO/vROacgB8vu8lIUKoviWXGBm724KFFV9K2H/6JL6WZYFEZi1MHFcCBuv?=
 =?us-ascii?Q?JTQcWRvqy3xL2ATF/3iK8Z5Kg8AhTIeL5FQ2OdGj?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c06a2de8-ba56-448f-2e1d-08dbcd71356f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:23:51.5825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WzG8xCyW5tj5igVA6qWfQ3vSqQ0e1lISMSGG230NaSGFz1Xi7A6It3INIUu01N/R+GRG+LTmxKQtGETlttD4Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8113
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105535

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


