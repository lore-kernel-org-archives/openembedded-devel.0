Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07789CDB490
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 13:19:07 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.52])
 by mx.groups.io with SMTP id smtpd.web10.89880.1697367079777818269
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 03:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=TqefWG3m;
 spf=pass (domain: welotec.com, ip: 40.107.7.52, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SICsG9SN/dRzuNj1RqzLu76sSulbp2J8GK8V4r6M0l0ODvADkyBQcOlhFFzVbmYBwjIqMC6QQjxVsvztp4jWFe5TDdMTnu/Gts3WhJgrUivrPaI3EdDxomM+HGb41psHduWogPsJGrZHSDMM1blcOF/fvnVUw0Rx0LjOCgGNEWpeSQD7Ey2QLbBp0XLmShDrBrnklEeXO9n0PoqBVyldi+pdlvNL0hgWjunlolSH+ajyJP23wY9hiSpNHfyQMg9ONMLCrwLgiyrpObnLUz1WzqWl0pw/EuSRd6BaszxCVe7LaCMVUd59yi3sp5TZKTgvrxQZR/nCcmcivPe2vc8yYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=962+Qutmx7yOQMSpDwCTL5Y8ribZgRBYEVAZLIMnMYY=;
 b=XrDCuSC/WrM1F+mKF+HmAZAtr1GYw9UGN6pwPqGhL9GVPCXY1w4TStOcEkezj1FVgEgffww6P7U716oz3DC6DirmcM8ji0IqxZaj97osyr9CKvYFWFBovLNQyVX2KZQLDXSrO5QKFLiDLTazfeUazGVpbSjJVKIR+iSMvg3KCtic6lFEb4JO1yB0MDM2h+sWG7fiugQ4IaCairOm0ol4HbrpYmjejckzFZWKhDbQRnFcGf3NQIe16Hc58SP3vpxca51ajwjwvt4DAXXwn7eFTE01q2eHj9oZXrRqA9T3suqCybgv/u8CAw3ZOLpZZzYf09puSSlGODTDYcjc5wbrLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=962+Qutmx7yOQMSpDwCTL5Y8ribZgRBYEVAZLIMnMYY=;
 b=TqefWG3mg9+qs6DZ5BiyTwGuRSkdoRM1YNnon/593MguciEhKQCdPXFYpVOUf7RA3HV99kc29sWOidEdoqyMmAjV4hGe04z4sl5ztUs+60DSlMDtzuDzViGXBgGHF/s4yAYtAWaUsLnKqFWiKhyyDahfw54TAPmdei0CwNqEhzirV3Diwv3obsnNYSgm527TkqAhnno9dHNjq35GG1JflNHwqbIjmeFfq+hmXgTMjgvP9s9GxDif5s/mBDj6kSGsePWIknK+SQ5trXPInANO4D19+ulBMlYB0Jhw9TdvR2835i6xiYVDquB1eAr6G4GhxcUGFYV7xeyDSNZAlI77zQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8308.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 10:51:14 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 10:51:14 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 07/11] sstate.bbclass: add support for ACLs and xattr
Date: Sun, 15 Oct 2023 12:50:51 +0200
Message-ID: <20231015105055.52510-7-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015105055.52510-1-p.lobacz@welotec.com>
References: <20231015105055.52510-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR2P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: ebad915b-9cc0-455e-7b7a-08dbcd6ca724
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gm04zhn99yYoxQ6EBHCXek+FPu4qAGpe/tnRg5DfouzyNLFXZkalndZnBZftGOytLSRPjdbQRTBbrtHoV715KBYCy/rph6hgk3u/KWvp3mo1/dAf9G9cTc+mJx7IvSLn92/5V7NMREx7O9mwV1jFLMQpjYs8xb/lLUIIChyULxCI25h/IebOitJZSMfeutxyaaZpcAk7vtkRcGZpwe6JFOITiSfWSx1H2pEXWYlnlga22q76Us9uqk563l/PNweTRgk3xTjkcEV/feuBFcYYCzmOylgALqhgKCyUi43HxDLxS25Ozj0i2jdARkZKZriRSU/UsVqbaolU9e5zOF6N/KxdcOKbGDJHx8yxJfa31act2PsqlvMsfFHSGwOLiPie5rj6ZZJRVISPEpD4S9MXKxlgwYJe6zT4YfTCsOVsPh9eug2xgOaRsj20aMjcmKfAra7j8za2DrkM1YcwvgDkwTnidm8cYQfHe2X+t5Al7c/OOpUi4OGAP4ekglDuPVYRwf3s94uRMd9kNuEjluBwwi8vvm88DTlXY/CESnW1cacVjArZ28n6HjWq0r+NV8rAuA4w0guLuLzDCB6UCAIOkLAv6HR27IQhEH9sgIxwFJo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(39830400003)(396003)(366004)(1800799009)(64100799003)(451199024)(186009)(38100700002)(6512007)(26005)(66574015)(107886003)(2616005)(1076003)(478600001)(966005)(6486002)(5660300002)(8676002)(4326008)(8936002)(86362001)(2906002)(6916009)(316002)(36756003)(41300700001)(66476007)(66556008)(66946007)(6666004)(52116002)(6506007)(38350700005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BuaxJKtaHyhFYubyozGP9CkbcXOLlm7z6UPqy5k92mztMoSHnott/Jwiv6cr?=
 =?us-ascii?Q?tFzD7S6zjDAPz86C1ClS8WTJBkZe0AjD4OOWqH+hsgn1Q4LWhoJDgcOwEnPu?=
 =?us-ascii?Q?ERVIWk9y9lt1pDdB8jiT2hYVe4JzHQ5GnziwgNGj/FpPoLcR4HdDyxjUzwkq?=
 =?us-ascii?Q?JgoX+UOQ/qR+46ZSFsArfFh+qSuSkCOeeePiwdzBFocF/2jlADngz16pcE6k?=
 =?us-ascii?Q?UsqAs6hz1mQc+VSlHLOaME7mRj1Q3478ZsS+u1Ug066JCaa8G5YNKKovuvv/?=
 =?us-ascii?Q?oVBPoUK7ddnR+LfpCBcM3xviRcVjA61DhYs5v7QZe4Dca8sHMbUTOqsOCyGe?=
 =?us-ascii?Q?T7GitWnJy6gbNCQwzgtNH/4cl6oQZSPxNU7nwZN5tqj7d4idlAtsrS0aTtev?=
 =?us-ascii?Q?hpoEfCo8S3hweqYe3e5C9zHqo0UjgciWtoUQ5eFVScmllTbhF+02c0XonSJ6?=
 =?us-ascii?Q?WbCncelahKp3VeDGHiLeiASctLhfl4Kah27gc3sJqZp5T5IpZagdjdBPLRb2?=
 =?us-ascii?Q?HKGdrWJQ/dw/2SCofAMfFu/3U99wQYJKkKgvvkcomQvcmH2ahWLqURgOp+va?=
 =?us-ascii?Q?UllASA4zDLVWcfB63q6QRs97Sduq8jIUZcz1tC/xbFeRAqSenzCLwHQK9P4B?=
 =?us-ascii?Q?BWVy7+bpSRjULvEgc2S96oPZpuz1UXh38yQ1Jmiw7cHYDcVqvYrr4QW+LPHh?=
 =?us-ascii?Q?5/3YW/6Rp5Ln4wyGPgObcZG0RG9IjhXM424MbGrBRCCg6wkwfjeSRBOE2+rn?=
 =?us-ascii?Q?qHlvclvEMu7ucdr6M3o6YIVOi0XqmwL5ig60uLK95ca00g7KXA4uzgsTPxjC?=
 =?us-ascii?Q?7182fyN8Pvdf8a8NAKALTgNy3C6BXZsiCSrqWGISubxIaGMLJON3eA2Ml1BP?=
 =?us-ascii?Q?RuOJAmGnptIkdu//6GCb/Fhuh9BRSfw6QnPs1wwJO09onCSffybKtqVaF7qD?=
 =?us-ascii?Q?dJuZ4/RLpgg7mB48hY2y9/NVZDn0BVkrL2X571COEN9hFwUDl4rkPYTBsbVo?=
 =?us-ascii?Q?i9MjhyEMuPUvkoadcRnhqXWh1MxjSW7PaHprtD8KDfeyNXiZZH7HgATp7ktm?=
 =?us-ascii?Q?RGuqpTRLfkt3YcSY7ymaUCW9e8srtW28cEBCPYTT7/9kLLae6AAQFhnnXqeq?=
 =?us-ascii?Q?W1pcgf+DXKWoyRKOtBIIsvo1kAZLKFxaLDca5cifr7lLKXZElOoygC8sLYXk?=
 =?us-ascii?Q?kASiCreiUhUYDzZ1p5D669WD2HoE8kn+XJS1DEnUkEDsVMHvdbflF5piYJ1N?=
 =?us-ascii?Q?TJynvqJ6aFnrRkhKd53cxUijb1UzXDD+/eTQqgQpFHJgIoNKB/I9CkNNAW8s?=
 =?us-ascii?Q?opytEVJV1Xk98yS8DmYU4A/hHPUWBh9m1CAlB+wVFC5y7dyeyi6BZNbbBWfM?=
 =?us-ascii?Q?NRTqwWRNeOgqjIu8g4siV6CsKYJtsvonShi9J3xKJGM3dXK3Jy+TWYy4+3Ve?=
 =?us-ascii?Q?TtgDg5PvFYgRqqtNAPoWlFCIBfOkP6sfW2kKF3+48mykbpQnYCBnDkKGCzf/?=
 =?us-ascii?Q?6ZahC46a3ulxYxbdXFiMYl3Vicz59u9IgLAjHX54RsCuvE14WaJxCN4xd1tX?=
 =?us-ascii?Q?wMk6M1XvHEXE0uGahONbbxzBws69lPeJYAuk39dd?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebad915b-9cc0-455e-7b7a-08dbcd6ca724
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 10:51:14.8944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6yxuOdbq3IGo9GHSxUim6twB6MsekJLTvkJ7e0lDoEBphpHCoLmIzd8l/PHmpFW+Mb/qZmbdJhkL8NwO0mbOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8308
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 13:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105500

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


