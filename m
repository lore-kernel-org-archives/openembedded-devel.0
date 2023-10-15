Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63487CDB498
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:28 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.48])
 by mx.groups.io with SMTP id smtpd.web11.89878.1697367950849094118
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=jrHbyLav;
 spf=pass (domain: welotec.com, ip: 40.107.104.48, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYbkT+G/3V3wCogaLC9rcpGXP5xC5epIsLdfqlHoDH7hi61vjXUqPOwNMA22W4IfHreyGfDXndlaP5W6LGNUF3Un08dHvZ10Uxd0bkSa0xKHyHkKO+OOFbV6+gv/r034xQkcVPQcbgVjPG+++dordPYTNmubotmRh1+PgfplNSRxVunEE6m8Y/a+Pz6MtloQmMWx1hVLs+h3Qx/qNqROYuxE/fb29Rr36y7CJxHoXNCL4DADVCkvil5+DcXGwFiD+nzoHHd4K6aH7Kj/EfGB+7roebjX7grS0nxK/OgZlWuHjnFnhDH2ryCHYjFjhevr+DaMjBik0cRuxubwwvmp1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=962+Qutmx7yOQMSpDwCTL5Y8ribZgRBYEVAZLIMnMYY=;
 b=OpcRWDvla/jJWpN4/IyML/UiFNtTpjK8rioiyVadUGTSYPHQEFABCp57+Ul6Bt2EGTtCwrDyfJxFx6Ehxonc49DhuXuDOtKhigtJHlbrfLS/C/gadME4MSe29v/wEBOPP4wb9Y+UGBsfNYU8P4K9ihr79wP8luWYxOpohoSyVbuIWzL8Cb4pQ1wofDvR8kFVv24fSZp9AKHokTvgu34z855Fv2aenMFW05JUo42NsjjsHiG6vYTR3/TNX4qxKW1M9pNysXO8ueZrOB7i5Autog6jIZqEfExSoEOyHJyCRjNArAZw7MP6alSz1UIqZ3WK71c95kkdCU5nVZ+Vc6V/2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=962+Qutmx7yOQMSpDwCTL5Y8ribZgRBYEVAZLIMnMYY=;
 b=jrHbyLavx9JmSWeYd1PhuFDhUGhsay6gLvtv7LQN/Jaf+ukCTx3UZKPWHoWQNMrUefpOgfHc3UgAQH2PgnXbKl4EUbBNKBa2j3sCYB6E6HPzDo34r9B5qoVqsyQutSP86BLiZ3M+ATcr4lAHv/3Jo3L/3bMkgZ80iRpaJNv5mExHkfBLmr3vm7PvsG23af7wjzqSUAd+5V4KF+T0XC6F/SJ9qKNEeg3382mVJygZsLS4c8FkzVeaVRTijc23De6tIzDkG862NZvwpPq94DFxr0PjxOfEycO9XK7+QX40bH6TZ7jeZvZy7uE/7k6Mf4nF9AVOZobIvzH8NRkDOnXikw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7925.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 11:05:51 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:05:51 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 07/11] sstate.bbclass: add support for ACLs and xattr
Date: Sun, 15 Oct 2023 13:05:22 +0200
Message-ID: <20231015110526.53738-7-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015110526.53738-1-p.lobacz@welotec.com>
References: <20231015110526.53738-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR4P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::13) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: b27694f9-de58-4d47-de9a-08dbcd6eb1a8
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sZVAJfXd1geaG96GmHiM99A8q0AVPocFiVx3sQ7sFU1dE2obMuDy4MnxPuPaU3StZ04/VwmfwuP0YrbLVUSB4ws28AqdP9xY/n4EkwRpnpdUo8hotzcIOLC/Xohe/wAv+o7ftXWAoarVCgdFxp1Ch2YMzD1EVUw4EDhTKlAVZf6HmPqNOvd0aUyTke/CEooCD57is0lokOEuxPKvIzyrOSsjPMmsWLHucG9iLzLzSG2YFzFfD+5W0oarXhA0F9LTYxmEhnBzU5btDZaWgHjrzEQ1gSBW/UnicXyNbCTtiDlGluLuaruJ6J6OqH7f72P9P9RfbW1aDF1LkBkucv3Yo7jVTO0u82GC/LukzY5vrvnBcbbbrE5H1wRRjtjX1ewBMYSZuEXZvVSINTv1I+OaKJW+M0zsnVk5pcFuZ3jdVkxqz6oGIb+OMRL3pYF+2AzKyKeV9EGzBLrcDm5a3VyD5Bh/imwcEhYo9T2Ncvi8mvWJvn1MxaUeFuRNslEqV5EILixlP6jTjl6/j81d6gYE2RjR/urcj1wk52syqMBcf8svcvvr6Buu7+EMhJiIdd6T5B/PECBIudKEmMz6DpK3TjrQwAEwJggO6oaKAttkgu4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39830400003)(136003)(396003)(186009)(1800799009)(64100799003)(451199024)(6666004)(6506007)(6512007)(52116002)(478600001)(966005)(6486002)(83380400001)(107886003)(1076003)(2616005)(66574015)(26005)(2906002)(6916009)(66476007)(5660300002)(66946007)(41300700001)(66556008)(316002)(8936002)(4326008)(8676002)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hurfhuW8qVbb3neLDiVIvThJw9UTBjDd6fhzIXT5a5n927nog8bokaQknXBP?=
 =?us-ascii?Q?l8fIxZvFwtDZN3SC8zh0XP3Ljt65RRIybUJln9n2eqnn2YNRCI5nbJqu2rDD?=
 =?us-ascii?Q?BaetXZpRJGgjlwtDSij9itjNkljZN8Xi5RPNA4uGhmFbrtNbCHLwylaYytmZ?=
 =?us-ascii?Q?i9WoMS3YOSqnvfn44lfLWZXOSEXSYqwCEOxVo6CumKi12uf1DzUVjOGV8MEB?=
 =?us-ascii?Q?SVBI66gJ6GeGxgwVbyLfnyGd9kCKTTN15XtN7TjaIb5ysbtUMGEkoAfGe/6o?=
 =?us-ascii?Q?lbCWFZmg5VL/HiR4qHZ9OkQEvLCLUF7rr4eNwhxlwxlMX/prlIzU6iuuqset?=
 =?us-ascii?Q?bB4Foprcm8j/kZyYTnTQDEHszjtd/E0GQ8dlxpG/NxwRTdFUaRVuvuafJoQZ?=
 =?us-ascii?Q?GfxLSCb702nj8QUcRgae5aFz+zGLGF6JRJXiCVw6mVjOVlwPqg3zSpPxn/ZZ?=
 =?us-ascii?Q?7YqqIBRlDpGjv+uNPFyXgjxsxUxDlUIROQGnVnmq1VoJjoZ53gqq+4Z741fo?=
 =?us-ascii?Q?pbEqvCPmSBRfF+VPDJwHpUz2L+3mDQDKE4HZ0XySVFm7TB4Cmq3+Yhk1et+k?=
 =?us-ascii?Q?yS0XhauVFgvoc372cXkswhC/9QPx9kKwxd489XfPm4LP9mkwMs11Z3v4tPka?=
 =?us-ascii?Q?auAr9CXLM2MfY7ivack8l1qqqKN79a6r5unykTLSzkuszHNvQkMxOw//dTUK?=
 =?us-ascii?Q?w790+gHyxcI3ovaYIqa6SsfxkNq07/k1akWO/YMG5r5nOcQbVuP0mOnjolrM?=
 =?us-ascii?Q?oTS0+ItbYuFRXCI1pgI0OvVti9aTS2mg+JU/LRsYWRxAhR5uPpv+5tftwbde?=
 =?us-ascii?Q?re1zxnam0xG1A2frPEwR8dswfTwk7qsNcBGFPqayeWiLhaemLqjSj47hn4/v?=
 =?us-ascii?Q?IufaBt9g5sc6fiWulWVVaKWjJlo+pcqyxRu+nVQFssaGzN2pzGlo5ougsoVR?=
 =?us-ascii?Q?7/MPRSYQTtcBY76kVDYYTSsADLr9x/mqsoHAueIvyx6AmxLbZVqlv8gkZq/j?=
 =?us-ascii?Q?1kW5GDaiC+DOnwWtOPz9DFfeD8BjTfStgqhXNiBDdI+GNnKFHM+samzpzVCs?=
 =?us-ascii?Q?aE7I7+fuZ0+gNu7qfgb/9yX459V4jJPy2VNF8UYGxZdspn8YMfzc6QYUpMuP?=
 =?us-ascii?Q?HvXAyTUWY1ZtGLKsSHGZGkckoCuVYOkmtYAk5QtlT0ugA4lQ0hQtc5iPaZa1?=
 =?us-ascii?Q?oKt4ABFvqS2ae5Jwjy28cQUTCSAK5GXSbe7jBl7DZB2ZcDSUwJAvhCyMtPdI?=
 =?us-ascii?Q?TGdkAk3SQ6eyFIel6ztMbTSoLmzTtP4HP8xerVfah+qGcHex7vb0li4zKXHx?=
 =?us-ascii?Q?FaZMiBlEoqYtEdrJlO/TPGAWaMw4/U4AFnfvaDRO6mcYaerORsdib4KnQ2SE?=
 =?us-ascii?Q?JqEiTxyko3WMnvMMKkxPDQYVQr4Oac7gv8OcCn5z5T7XfxjkN+odh5KZyqLI?=
 =?us-ascii?Q?24chjXgE/6zwrvI1dj8IwSRcEIiHDwyK4qiVJUJFLqWbblkJ4lEudAPJBRky?=
 =?us-ascii?Q?riS7+O4ZJpF5GSPDMS+9FoW5dyX6yv1zVcV1oY85dTQBAD5hrJ66gboljZcs?=
 =?us-ascii?Q?1N33ihk5Cxv7AExRQ1WEDhmPS+rameQV3fbpmuIF?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b27694f9-de58-4d47-de9a-08dbcd6eb1a8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:05:51.5070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eoutKDshMXFlxRyeKxjaa2Xec2dJwBOyhMneaQ71kqPL2N9I44HM/1xKhu8GJ0YVa/oK3MpChpW7gsqjeq7lGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7925
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105524

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


