Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A77EB64DE
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 15:34:36 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.100])
 by mx.groups.io with SMTP id smtpd.web11.32164.1725809673142184746
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 08:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=JSzcQjoD;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.104.100, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGE/KP+5hj/c89VrF/79j6rJ5gGkLV12OnLM97ksqKLYkXhBzahKvb+m/rklpUayYFQCtQDrRchcqZOUYtMEUG3gl+mkQh6gdEnhgdz1L/JOLlYppJeh1koG3eOosY+VuZGIX+S0YbKXJ7+LppNiFaOrnhbHwBE/gAyz4yaC4zTU9Hdcs02GvMPb3j0VkEIH0cl4wfudRyQbsTUvwPbRYX6l2gvL/HB9499L0oz+A09e810taPBAo4Ce76Y4vVfVZ02y+1ek3nXt8J2a/0GtnUm6GKBaO2yxe4lf6v0ZQX8IYpnN3Sm7tJA+FosF2b7u+2oR2YWxGeUAr65A9mmKXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpWztVR3IijXjmy9DqpJfuhmYnYS/WmW6YuG0t/nOek=;
 b=B1QHzdgGwllJYUA/iJASNA4YzfTjlvn2LTroLON5SXCj4WsVJnZXwBdNAQ3t9onYGdFG4ZREL6Xxo4IbzS5Fgu682HlUsuuiX/DRUuCoL6D1uRc5gVEjnubU3vW8V5CNvSHD83c9N9CzijYXyiarLdh0L0mHUIub2Iz17fKWztvf8x9Z8G8AEVi8R5Ow2BdGg6hEyaTRUm7V+JmEW2UQ1jSkUgIo67smb8iuaposoO0mfBUwN6IeXcff/Tjp3sbg8xEK/UcvLNY4D62KhiufxauvgUY0ccaQJluUpjGQm07Ms0kpqeo4xFz81HdbTiQQFqiYCtKL9dh3TbVNljbkTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpWztVR3IijXjmy9DqpJfuhmYnYS/WmW6YuG0t/nOek=;
 b=JSzcQjoDKH8uKoXqLu+nYwGKa/TyaCj+oYT2JQPwuYdzeVkq7oCDGqR/8o4/DOuNQWwpD3Gzea5IRSySymjogyA3OGGdNHtN5P+9beDKUSE/Zrn/xUx1euMt27R8tqDIZp9pfAG8I4MwC9behpHyI+DpFTm8s6CQP93g+vJTUP7HW2e5l34jsLOY3PSgnCajurLu+vBs6/MCh6k9m9LW24R/t/49lKi2Bb6c9JnZkrN46vYXUyf7r1l+Yyr+NMtomUhjRRAL+vigtVSehQDED1ZJ5mcgfe0XaYVKdYaGUbXZziIRQK8fbiGanrntyJfjCyfpW/hKYjP+1EXI8rN/UA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DBAPR06MB7095.eurprd06.prod.outlook.com (2603:10a6:10:1a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Sun, 8 Sep
 2024 15:34:30 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 15:34:30 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCHv4 03/19] python3-cbor2: Fix LICENSE and LIC_FILES_CHKSUM
Date: Sun,  8 Sep 2024 15:33:52 +0000
Message-ID: <20240908153408.4114753-3-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: 45d02723-75fc-45b2-d7dd-08dcd01bbb27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sQmuNbpa+C5iC4mbWRdKEl9qOjyrHSAFJ9EdOtuMclKiyOany5oba8/THCiZ?=
 =?us-ascii?Q?Iev47jOJcquocd8N7PnuP64j5HHf0rFKzGfVOxKw7vkmZyfV3Zw6+YxYQNDK?=
 =?us-ascii?Q?hH1lMzsKgQoti/oJ4e//vOR4syPWdYIBNkX3zEPuldcchwZfXhp0RIu4o23/?=
 =?us-ascii?Q?1ZeWJxnaq/z7rC8DpTwmV1OkRtynWWcBhYFxl3w5DhSawlveYuU4lfy49iOd?=
 =?us-ascii?Q?ze4zoikVR+eaubHSHf5fQO1IM8+oV0DqyjUHF2I4p7+hn16EWURJcgG0LN3w?=
 =?us-ascii?Q?f11bb3D/8HX+OW2NeNiHp+tw42usQvFyTedTH0RStviEXLXv2xbS3jxLqh1O?=
 =?us-ascii?Q?1+C1LWETbUYxi/aNTM2UIJ8iV/9J9h5WmbpL3eedTuKEZ6in9KM60ZQWk627?=
 =?us-ascii?Q?LStycRjAS1LQfZSEOjPoUmhVHRcwEFj6QUItzgrnNe6dPoTw5pvpw4meLB/A?=
 =?us-ascii?Q?me8+UQxrl4hPor9B+wbAlhaCb1PXqo0Re/IlGHoWeB7BLNO8fjKR5jv4xEaX?=
 =?us-ascii?Q?eFghMUo1upXm6oSWLmRRrRWWdtcnYPqIsquxCfYAsX1ezptTQFDRzsSJvskX?=
 =?us-ascii?Q?LQ9HdxQDEwR0vvkQYl6aTh+zqkSkdq4N+Ck7hgyMbqUOLozdmA0qy8MvfsDx?=
 =?us-ascii?Q?y34X/j52rPLYe2yn39JR7Fvm2u/D805o13GZQHoPT9wPibgDcqH25+R4IxVs?=
 =?us-ascii?Q?bphorQ0EDSPX81thHW1Udef6sLsFYrdG3lVw8PC5YFcFPPhSUGcrMZUVkDtI?=
 =?us-ascii?Q?EpQEBNIVGYI96qZ57jeK2Pznuo6GV9IN2bO3ZmVcysTcbIs1VrjfVy151Gx7?=
 =?us-ascii?Q?7vI097YewKQu3eDK6iTlXASU2EY9sVuBLQz3Nw6sEuG1uAT5PE9Iho22bk3X?=
 =?us-ascii?Q?rofCQiydRa3Q1Boy9+NCyI00pWwv4M5Ma4SMniyIK74QqQVmsSgB8MmMK74S?=
 =?us-ascii?Q?oeKXTKWk3a5RXKIGDLqHDlInh0nTYHfrN7tHPQhDbehVGkL6J0eWzNOaZgUt?=
 =?us-ascii?Q?yHocK9sKc7Ne/orxl90nCGHYG7GqPqC2TUr/pdABS5LDeS/Qlx/miPfrBHWs?=
 =?us-ascii?Q?UVB4ZCms4k29Pao6WbS3nUpg1pmuxC/NOX0lyGgfXkw8iwmIoDrlXOxmhO8j?=
 =?us-ascii?Q?VxY0WoyS6QvaAQvyTstSM3sjJWOmSXrapV/Lj5zZCC7i2qINcadGKRiVzpki?=
 =?us-ascii?Q?+19dN9qB8LG5Rjj4a3a6qitu6weAd7DkCtbPS9igy4CnsSXY5Te3qNAG+Hrv?=
 =?us-ascii?Q?806niqLddG8V6tTkp8e9CGzvOqZOmN8axQU+gLQQ1bWtQffP5/X24Gds5fs1?=
 =?us-ascii?Q?8UpVEdYL/0Jr1Do+dyMpyRKFtWLQrZnqyqN8nCxGgISa+j/CvAF+FL1EZAED?=
 =?us-ascii?Q?3PAJ4Hw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RSREOO7TqvX3IFpZ0axsaI8g8JhtCfSnhWNR2Z+xox5AvBGsPLS72Wz1lHJG?=
 =?us-ascii?Q?/2Az14xoUlS/XcZUKybDh9r8i1N/e+gEh73O6/VDM9emCghr56kLuN/P1XfH?=
 =?us-ascii?Q?AuoV5aMI/8qf71LBJcqLA8rIlAkhUMCUAyWVim1ZicU7DY4vPzYA7UzqCXiF?=
 =?us-ascii?Q?T608W+PKFjjT9dTmZ2/xSJ6a98VMyooEKR6yr4fk0+FdhXgaBJUTDiQWjM4z?=
 =?us-ascii?Q?gcTt/y9W6zaHfBWt1BK4+SsnrCGEzdNDNG29KwQQtJo9n3LOCgbBW15z8cfO?=
 =?us-ascii?Q?3MnnOsV6FNfAbj9kbtJyesQfAyGrQcYTmkq3ZyxWZeuuKKGOFbwARGZ9atDX?=
 =?us-ascii?Q?gK7HvfE7ON9GJWPtpkKMHoSYIRDQus+SY5q3GpVH0IvUTUBLADCRxey0OQ2l?=
 =?us-ascii?Q?w1wjqD8K5WYu5Hkt+QbbmaoFWjRZ4+GXer1OamuGZHTeTpX7ulvtVe6EdU6U?=
 =?us-ascii?Q?bviWMRfZ5bYa0LiAE4fs5fQlYvZd2tDa7OMglE0YQ1NrJp7ec4ZA2P2v6Nvt?=
 =?us-ascii?Q?6EInUkWXZec1wuCSWtUNokI/a2ac2V4B4U1AUa0+kYZsOUCKA5wkccWwZszZ?=
 =?us-ascii?Q?OtZr7ybltVsHD171rVh4LIc508znCEZ5sBHdt7WIDxCXMicbBVgTgFviKJ/q?=
 =?us-ascii?Q?/OSQ21GWZ+NqVJ1/Tx/fL3jN/8W5gPJZ4FbOc8i0we6WGSfaG0eLVgV67CaB?=
 =?us-ascii?Q?DrDQbzrVCv2gYeJXoGZCPZseGac+wC8OuniT4jljTQKB+vBUfIDDJsAF2FUG?=
 =?us-ascii?Q?PncJbDAOgz+J9JTVRTJqfFyIYidMOp8477Fq3VYRXei6Yi5iSAAhk71NEDLP?=
 =?us-ascii?Q?Bvl18sT/xBgAkXM9+z4E8+JkmH4QuOxliBf99tKUGsqOS2QTFXNxbYLf1uBc?=
 =?us-ascii?Q?fVuuh8UVMhJxmm8mbVquqDz/tXBe1tkef8noXHBdA2fPa6wHzbuWV29j37S8?=
 =?us-ascii?Q?WT7GA0ptAFRCoVFiu87Mag226e7n/3n5nbJu0wV03LOc5FaCTfeZBpea3m/8?=
 =?us-ascii?Q?RlLKsek0fu9jS/pWf8WaJZ0PVPjEdQbgF6BVeMKPuCVIrJilCB+bvFM2BHho?=
 =?us-ascii?Q?ObyC0f8JPBAKtiqQuOK55HlCodX3Xhnj5HdHI/0VQsiH009ByzMyEpXgFkw5?=
 =?us-ascii?Q?OQbwesYQVE63muAq8v0joFTd8qvYzoifqcmTwXJc5D8tGqQ9WMdbz01ofc87?=
 =?us-ascii?Q?3ZPb7VoNfwvaeJsAegWDcM4+ZWe5FFQ36lnndF8ehChMtSDX6JI3bJaPpNUk?=
 =?us-ascii?Q?0GpOa8wHqmIiH8KbmxFoXWf07v5Tiw1uvqskS8l7n+jt610rSuGcmudAyisa?=
 =?us-ascii?Q?U9egRQZ7W8WE8iiD0UeU7IYMpMvzkVcu2o4R0g/JPOpppiZZhQ+ZXM8ECD2r?=
 =?us-ascii?Q?0ZC9haSbl2n7yYQf3tLAyt7j69ntWwqrdZSAdR1TQKQ4Y6B5AGuXXtEPJYkt?=
 =?us-ascii?Q?Fam58mJIwX37zNojQy8hvecwRLBh+g/jyfZrF3pFdRF6BbZ20RjoT7mYXIX6?=
 =?us-ascii?Q?jTWFTe9MJD6n48h00vHKL8W6u8499lEEMmmE8VGmPTHVYSE+6BAATP7MCdam?=
 =?us-ascii?Q?cyvWkCBwVzj8KOIS85O7qfg1KbMyQ/bjUPdF+awI1SxWx/W/pe+QkYAv6f8h?=
 =?us-ascii?Q?Tw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d02723-75fc-45b2-d7dd-08dcd01bbb27
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 15:34:30.3858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0te2W05nabI2ERqDT8uf3EjeA1thqy4JlcDXzXZRgCkFY7of4VLgvMLCTOR8lwy1hAERdoRdnjwIlzH66LmGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB7095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 15:34:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112143

Both project pypi page: https://pypi.org/project/cbor2/ as well as
https://github.com/agronholm/cbor2/blob/5.6.3/LICENSE.txt state that it
is subject to MIT rather than Apache-2.0 license. Also update
LIC_FILES_CHKSUM value to reference the LICENSE.txt file from the
downloaded archive.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-cbor2_5.6.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.6.3.bb b/m=
eta-python/recipes-devtools/python/python3-cbor2_5.6.3.bb
index c9c98b6fb..69573064b 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.6.3.bb
@@ -1,8 +1,8 @@
 DESCRIPTION =3D "An implementation of RFC 7049 - Concise Binary Object Rep=
resentation (CBOR)."
 DEPENDS +=3D"python3-setuptools-scm-native"
=20
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4=
e17d99a7cacdbeed46a0096b10"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da79e64179819c7ce293372c059f=
1dbd8"
=20
 SRC_URI[sha256sum] =3D "e6f0ae2751c2d333a960e0807c0611494eb1245631a167965a=
cbc100509455d3"
=20
--=20
2.39.2


