Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C926DC433EF
	for <webhook@archiver.kernel.org>; Fri, 31 Dec 2021 06:14:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9046.1640931244074216259
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 22:14:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ABoRLhJG;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=89994c103b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BV6C1S3019454
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Dec 2021 06:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=U5i0QllmSHezTiYW0YLpTRKCMnsyi5P4HrrVSnxpAk0=;
 b=ABoRLhJGVusU5h0lChqVzoxb2fJkWuE2mWELEcntH40QBuYGN8KQ6fWw/tQ+nKnm9IEv
 SS1qFG8oW5cmhP64AM9Wb2pvGT2jqOVu1J5xuwjQ6f+bz2E3d87SJRvnL4PLOsasxLG0
 U6LSL8OhtaKSp8BINdGOjdEvPe5vj/Ss7ZsBbBCJ88bOTVSp9ub/BGuaQdAFoOkXxHvy
 +gqPObseA62RAgDb4JvxaCbZqHE5kLWteC0Ecrx1uU3L3zL/OBDsPvQLD/a4gsN+yqSg
 6Xc3gQKfkZDE8H1V2Z2ckIGNpFmFVvtVsASz5FFzs7C+yjA9Ilieam4+fypQsMkureUF Jw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d8x51gtfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Dec 2021 06:14:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUeaJtE688p/I7rXyL7270UfFARUr+PWXLNyZSacC8jf1Xo5Hosg/9OO0EI6ZWAcHCPXFaB4lvfoh1rwzMgyzZY3kV+1wvTo8wvR9+qRfQu0gTa0KzWZ7NW4Bl7yH4KfRCWK4nhmp+J+K0CiXQsdpTj43dXxEYeY4OJm+VV7m1t1ClLrbKcNU4L1xsHB4+D+3KmRvVFkPdLhnnPxcuMPMe2fiO+YSwtHcn50p0nnnB1AHDJ1p1Tj+9g4QT4v54pevlwh+FkbhW4jHzWvPvRCWJYopxRbnZkP/9lL/JoZ8byAAQDq9Xsc/vG4rvi7g7L27IreS74AyLuE1IEQqO2gEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5i0QllmSHezTiYW0YLpTRKCMnsyi5P4HrrVSnxpAk0=;
 b=DQqT5o9aTIQsxSWo6B0//zAKrcZJ/G4QxAvelmExVzvS/I2+Td9WvceQhCiXol8hBl9lt+B9B3kgHLOMU08MbYdwqyoV8CG2Or/22BJuHuYp/ES5JvsUzKGDpB6F1y7cLqzzyDEVorOF24qBU7fEVm+I1CL9F6WIdMBcaeO3Hhaexxys3NS9U5dwoUCylPtT4l1ClhAMAg3mSdOPAMQA7MA2MpHcbqrr25ZymGxjSVJfiV6lw5gCM8wf5WjlFN6q9VdSaapOLpCAmhZh3FAupA0lCgNur/hAc5p7l17oeZPM+2IGQn8H09x0fYGpM+wr1bygklgfafEvDJBi1kaw7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4804.namprd11.prod.outlook.com (2603:10b6:303:6f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Fri, 31 Dec
 2021 06:14:01 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%5]) with mapi id 15.20.4844.014; Fri, 31 Dec 2021
 06:14:01 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] upower: add UPSTREAM_CHECK_GITTAGREGEX
Date: Fri, 31 Dec 2021 14:13:48 +0800
Message-Id: <20211231061350.1166984-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0195.apcprd02.prod.outlook.com
 (2603:1096:201:21::31) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2a35f8b-9195-494f-abfc-08d9cc24bcae
X-MS-TrafficTypeDiagnostic: CO1PR11MB4804:EE_
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4804F93FE0C2A5A060B6C618F9469@CO1PR11MB4804.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+Bzn1J/z99BmCZwLAahOJNMJn/MIVMcniQLcyzwNeAlYwyJmtSWKQattAyH7n8M6AUBWSfCQBCs1rQXYRH/ZVOznoMRUpNdqW2D+GNA+uMqHk9Vj5+KzJaG3/9zVOM2EW+2FtqV5wkubsDUOYhr/uLrqPvHNgdkKz18WILvRK2LAyseRmTOP7RcRXSSrfaxMbt4AMUHmCqSEdhS7D54qKgDFg1Gg6UL1JoguZ2ci8WuGLbz67SE+vIBNRKrXswrxTH1XM5UnG0D5etF5WRGvD+3sQopL8+d7AK6W0DVY2Vc7GxIIBVg6JHwIoiUeXtOC1AHFyrLeKWjSirBYQ8NMSaykpdgpW++JwfDVHckQ2xSkfTaKGHtb61d7zlwalbsJ0WfJ4lCFS9nD4G6dZYUMPY5l9Z4gtCE8Eu13s614kU/0646EWluQ2nLk6FJpzZAkbS+zRKVTpgkZcadF45RxNfuXpRDCw8j8iLn3PCEpxCkYO6o3UcFC5pYg3pEQu+dbgnE7GIMhfgwBMy0HXX86FP53emgByp6tXbUzffJ7Udgamfh8WT+TPKrGN41LmHzc5d1M/usN81IEe98EPsiGoMVS45Z72YpQfkChScp9be+QaKTf2HTsqwveT/gre0thS7Uirkl3+/Wk51odIkKxcPAVnnZmQEV4j4Ry+1hX0WB/7uTQo2pxbSiDkQs0LyXDOqz1jIrnVoT/SU5ry1RvEg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(316002)(508600001)(2616005)(2906002)(36756003)(8676002)(6666004)(66946007)(26005)(38350700002)(6512007)(44832011)(52116002)(5660300002)(1076003)(186003)(6486002)(66476007)(66556008)(38100700002)(6506007)(8936002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4RYcAMbroRohV8H4a/eXmLsEQeCIcqa4JkLo/zf/J8yPqv2iwdjYNfFDe+jX?=
 =?us-ascii?Q?83Fkwcx1wSzA7zhagEYE4+TPNh/GIh4IVZz+3rd7JA7JEh2QpCfJ3UMTVSjY?=
 =?us-ascii?Q?Dk+xqRGzvcaPie4lQ+KY0tgJjpuCNxyNWwUZipsxZfvDErLyBlAz5lC2bQPH?=
 =?us-ascii?Q?j4/fepNIFgAWt+X9e+KUKPfIo8z3vzV8zArhexIWJ5VVxu6CS/AiVtuPA70J?=
 =?us-ascii?Q?ZUg86V2gCu2aSZozAQi40XHh1M+1mm10+8HdFvv0BRDKnuGEPZKBBsDEkL3B?=
 =?us-ascii?Q?58yqcWTERfqRvrA2DZbv+rM8EAx+Yb0c3/5IlnPdSS/lE5sisHZLaAIakT8l?=
 =?us-ascii?Q?fLy0B/otAhQl++SphZzdBCWVQjU6NOfqU8JAZaHWBNwMf/H7JccsuZiK0Slq?=
 =?us-ascii?Q?xdbJFzIaS7vRWu5cDy5FadfDxHJV/u55bYZiGBh8NSifrQNtp0xpfSxKEYJT?=
 =?us-ascii?Q?phuIk4W8L2sKbOpR2gbrb01vHHBEMfAIR/LLcEMExgm+09Eek27S2DGAj39c?=
 =?us-ascii?Q?yEwrbTsb5q/xGKQMtJU2pIEiuMBNFEDMvLGaN4HyvuaYNHtPtHeA8rvOR0P4?=
 =?us-ascii?Q?fSMWXmIAfh83458qco2x6GMg8xJkqEshcFQgB4HFsnKb12Uwj9+atVKBC4/i?=
 =?us-ascii?Q?/8SYbvhpRA/CboAXrFCR4bRKlq02iSXaGRCWrcdi7i/p9vv9sjcvTzyJH7ux?=
 =?us-ascii?Q?1vMFFEUR21ODO1xvoX0zJZzvFVGE7UuDd+kTD3RjVWckfWCfFUjM2Dr0krAC?=
 =?us-ascii?Q?EODoBxoT+rZ7jGdUlXi5cv4FjbEB9AkQDo7yn+gnctnhlzHZeD6BwXzYma6N?=
 =?us-ascii?Q?BDoT3w1qAhk/LJcVgrRGsYWA3ACwVsz8ZxoqpeaZkSPd/21tec/smKydGAuZ?=
 =?us-ascii?Q?jnyq6tio+fpPSXeWqOlYeXhCSsEyptW/esAPX4Fzn5t+XuF0mCHVIRhdXs0/?=
 =?us-ascii?Q?8nD672MJOw+syUzU27/EY5P7h1Pmy3ask3XKqafNsi40xZhJ3eIvPToIVWkB?=
 =?us-ascii?Q?mryB/Xbs/RnVH5kcQQWGCn2xgz4YE7tTXaIc7JUtJ0rqeas1XgQpMrgXMv3A?=
 =?us-ascii?Q?IO6r0To+mmIoY1y+B6BsOdazwQe0yWsrDtg/CrC8xEctcYS9b6R2SNrz8jtZ?=
 =?us-ascii?Q?pgQwTKHGl/Pu1IJNwL7qTXYf85lJJFloqY/2aYRjRIW2R8aM6eBslWgufpbd?=
 =?us-ascii?Q?lGH2r3DFB9vh+50o8REeb+YaHz4Z7Y43CSdn7xld81JG2J3RAY5LeiYubwhA?=
 =?us-ascii?Q?XAhC0bXV/kd/lW/HIPN9JTFhDbqHa8/MsSVzhuHgKOtFE+iPFhbwuM+p/OJa?=
 =?us-ascii?Q?gspyp6DfrH8XpFp53K5PZpLtbhAI4ZxlbwQihRmrCRT+uYmVLncdx+OkoFTq?=
 =?us-ascii?Q?XDlVdrbLb3RACf9d/pWkj1AN6jkQ4sMsiTIhc6NuadzKPtD9cdATeLdEKM0Q?=
 =?us-ascii?Q?/s8H+JUkwFyyt9JeV57Az6cRylaTOq+2KzB3bJBzsTgAMsYY9nCKm3WTkJ1W?=
 =?us-ascii?Q?Qn4hXunccDIF4tZpQJHf6bBZmYgYFFIZ/DXXsq5onYbw1jh/N0PjYMHmqGTX?=
 =?us-ascii?Q?KGO1q72sfs7UIDrfY3jZ2qF5esNroWwlXZpoQfpXNNlHoZNfyG0UtD7RNcLx?=
 =?us-ascii?Q?K/7ZjC+fBLOkk3rL3DDqn94=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b2a35f8b-9195-494f-abfc-08d9cc24bcae
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2021 06:14:00.9364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 78Wtp1Y1+LHTaFzBJxprPdFpB0GXOuj805mFHQ78acXTBEGjO1CIJkVHW55QITZsIV9quV5mXdZshEtC01b4UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4804
X-Proofpoint-ORIG-GUID: Dx5mCHpaVWeCJbKMTQ_wccy5jYBHB747
X-Proofpoint-GUID: Dx5mCHpaVWeCJbKMTQ_wccy5jYBHB747
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-31_02,2021-12-30_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=886 bulkscore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112310030
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Dec 2021 06:14:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94579

Add UPSTREAM_CHECK_GITTAGREGEX to check the correct latest version.

Before the patch:
$ devtool latest-version upower
INFO: Current version: 0.99.13
INFO: Latest version: 014
INFO: Latest version's commit: 8cbaa7f70b1bc8aa96f420f9061b20e5d8839ea7

After the patch:
$ devtool latest-version upower
INFO: Current version: 0.99.13
INFO: Latest version: 0.99.13
INFO: Latest version's commit: 0f6cc0a10be22d7ddd684e1cd851e4364a440494

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/upower/upower_0.99.13.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/upower/upower_0.99.13.bb b/meta-oe/recipes-support/upower/upower_0.99.13.bb
index 6110a26c0..105976316 100644
--- a/meta-oe/recipes-support/upower/upower_0.99.13.bb
+++ b/meta-oe/recipes-support/upower/upower_0.99.13.bb
@@ -8,6 +8,8 @@ SRC_URI = "git://gitlab.freedesktop.org/upower/upower.git;protocol=https;branch=
 SRCREV = "0f6cc0a10be22d7ddd684e1cd851e4364a440494"
 S = "${WORKDIR}/git"
 
+UPSTREAM_CHECK_GITTAGREGEX = "UPOWER_(?P<pver>\d+(\_\d+)+)"
+
 inherit autotools pkgconfig gtk-doc gettext gobject-introspection systemd
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-- 
2.25.1


