Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D113FCDB485
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 13:19:06 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.83])
 by mx.groups.io with SMTP id smtpd.web11.89851.1697367731043602381
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=dt4OeNJf;
 spf=pass (domain: welotec.com, ip: 40.107.21.83, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkwGDS0OCiNC1DHhK8u4ls5PVzKl2hd/tQke5H6Pw9zUpyZcqxPzOVx9Zdlv4UexOGrwLd3GHlRc3JSoX0sgykOjuiOru25y57gtlCohlxmpIMDIKpOC7f7batUssM2JajCMm/OVFlBU8gMuOkC8YL2vb/x57UsFVHfVPW6whIrwJPHVWSAUsyN6ae8v6msrtV312VfiBjMTzVDZw1jAAAMCBWTn4EtpDT0EaBKTJ3Uw3WIrUHI+yoGjJp3ogZtvs8E4F5bcrVr1PC7tVkgfu/DH9TsgR02Kwf3hZX8hULRr8Kiw0eoHNQwhQieFJZJd43nBhKuXORXY+lY+/pus7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eED+SE16zxfd5KCIEFI+rPVPpfJS2w3L2Q1srcPDrmM=;
 b=TrtwqPMdphSP8Plg4oFgmJlmkjSwdJVHTtNJOdBcEyWLQvGRqCnLRoFIcUiEJQ7AMb7H9kH30njT4GNRuEHWHhm0C6+OXaoyRraMTDQGHyX7cNsSdb9ZUynGLBcGs/ny146blED2WHvO9gZXmBH9MyDxE3GEbVFrMohSW9cfemxaT6WBAsbau8t3R8izfzqXgwVR1tiyQR6FfUnjwcIhJ6J5rVpwKplfViqtqxCIdyO0KF+OJLMnol+7g+1P1Kgvl5X2QBAQVdsxO4KdNK/KaNJCBsz/XWAZMEnlOwQlrLOTi119wbHAShQwpnBHWd11T91iF0RLPPgOQoiMd8JwNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eED+SE16zxfd5KCIEFI+rPVPpfJS2w3L2Q1srcPDrmM=;
 b=dt4OeNJfUrLYn8qLMSXPRzjhnmY9M1wUXFQ28vJskPgF6dRPwxtzIl/m+BmkAHR+r52WJRJD3fgZAXbf/Vme9AmIV95Cqo2tMNHsJCIuiWLd2w3VtjTZTU/Yl8j+eBgkjK4jK9gMxvahKoVic4hJloXTXdRgNZzOgo0sLxtDThlrWUI1WbtS8VSemiS6fw8IMOHnFIRVKEtxlTIBVWJe2rrq+HkOW7cnL/TG7yf0Bx4oJ7qVtXuvR7rS1XKmKBCYOnbErGoCh7d3qu/wBPd7EbZ/TVR4q09DBI8JEwS8mr3G3pE0xl80SFh920b2JdIe3EuzE+PWvKVjdvYnM6OATA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7925.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 11:02:04 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:02:03 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 01/11] package.bbclass: override tar with tar-native
Date: Sun, 15 Oct 2023 13:01:44 +0200
Message-ID: <20231015110154.53364-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
X-ClientProxiedBy: BE1P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a77c1d-c998-4651-8b35-08dbcd6e29a1
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wg9iQIIjqqnYgiljpcKK3BxOmCeEkc5X65OqenXEWTUdPCBzBX/0WVN9qSd+l8a1LQR/OFtJE5YYwt4NDS5EkmB66O0swmZPg14lgyE2qLkYabMvbdwQ6JZT+28REi02BtZWjpfwfeDw9klv9KVU9xICrSrL75UeDamyP63vLFwxRY8xmiSrhhvG/ptnbRGDOl+IuMDUNzWA4/qRpYx51j5OAMKwknkCtnJzQ8TC5tEn0zpJJHeXTjIV4uJlz0nZAdi7tD/tGz3VtkwiR9cyUceHTGQJxI/7Zs3J21tjC12Pq2yl+SlcCaLUImRco4noiOFMACas9oOY1iol79WrNfU6m6TUQtGUPkSGy/InVAvYfrmN1a4OneVJL3+WwaN29Rl2ilYFL8AsFP6gL2wzwJ466j0SiTotZ2beQc2ygUDPQhnPfM8r1TZRL6pWEVlvbH94gygc5N+p3PkDpg8SKDhwVlxgTmH76s0uHVCkjp9i0mCUpMQsefXUqfy43o4S1xgmbQ7tO6ZTwSYVe5GlnX1UTwqq+aPaOqNqr08Mr3uil2D8fLwD8uenAcETe00SW4SRTl6fSdEiCIWghWGF4XeG3GQqeywB1mISSDVl4S0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39830400003)(136003)(396003)(186009)(1800799009)(64100799003)(451199024)(6666004)(6506007)(6512007)(52116002)(478600001)(966005)(6486002)(83380400001)(107886003)(1076003)(2616005)(66574015)(26005)(2906002)(6916009)(66476007)(5660300002)(66946007)(41300700001)(66556008)(316002)(8936002)(4326008)(8676002)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ljFh3EwWr+6rMt5F07w7FovJG5f4VppebCwvoSGcPRu3C7z/Jn1N1XDxKgw5?=
 =?us-ascii?Q?EXah9rkYocJokbWA1B2/bLz2QFnfYp+YszoYUJVm3FKa1PF9wcooWeGqyJ/J?=
 =?us-ascii?Q?lXv9EmqNdtxVcdxijYb/K25y4dxQZlpLiYlJRD6SakZzzi1ZnGA+tu4yhuyv?=
 =?us-ascii?Q?7buKqkL37pXx+HBhSH74/VgYOb1BJ2HQXq0aFasMF3YLeP/CBisMruuFXirY?=
 =?us-ascii?Q?JRKJgo7gwKPJi+fQpTHxV8zTnixDwH2RFX+0Pn2CFOxeYFuLdVNutFAzxlJ+?=
 =?us-ascii?Q?R0Q3uWtHhxLuDkm+c1cpoo/DKI8l2jPPjI7h//M7xZSrq6Bewi8DxmAibp7o?=
 =?us-ascii?Q?aTuUzMIayOV/0ok7lsuU9HFgeYEpq/N9zW9MtCbsVTS76W9pgCIfbQ/xrTvi?=
 =?us-ascii?Q?W3xGHVJkGIHBaFNKHWdSHsERr7/dD2W65akQWWFkCuTNdWEFZE3sfkZ/yH00?=
 =?us-ascii?Q?EENLBOFPpaZrV5fBzvYgpW8mu36u1j/L1wcvMFBtb1tbaZVQi9/7yKUVq+XG?=
 =?us-ascii?Q?f7dFav8virGPpsPV0Yxw9rVjQFpWEsyMReaYyDVEqvYd6vfYV/R6f1Wrmh+l?=
 =?us-ascii?Q?tPQGFWNMhuww5lBGPeXuhxThjOE6GVy0TnBttfHOvI+vXKztYSxCQp5E14RT?=
 =?us-ascii?Q?9t08cAw4iv2+0qFdbW2ZyDIZh/YvXn2SVXHAg0t8Zp0uQGlEtL5AGjz5IqKn?=
 =?us-ascii?Q?54kW/KwLbKbf+1SGYfrWu1g3lvWKPo48qxXJSn2CqHEDFsPGQKk78W4SOjhp?=
 =?us-ascii?Q?VAFZw5Rlq5pcL9KYo53J3SmsfFMtnejnqTpqMgNkMgA3Cvh+EIlYZrWtO6+w?=
 =?us-ascii?Q?BRtwXLLzHGDIfU2+DfqPyGIHmXTp3f0m9rfDigEcJW4lBjsFOnozs6UB/dTl?=
 =?us-ascii?Q?etCCYFEcvpN7/QP0p4Ankg/YMZWuxLewRfb+YuUFEAECT6VssthsJKPCaL2/?=
 =?us-ascii?Q?uHRDEmt6MCu3x8ZacmI3DXrXScY8f81QpPEUk+DPrjze29H/Hkvyipn6O8H7?=
 =?us-ascii?Q?Kjj3dKGhuTiHWeUZS1/sW/gccDAzR2Djm9OMiC7ELtpsHQNWY31itELJmRtY?=
 =?us-ascii?Q?1k68EeqnnLp1SjLaNv6BfWDN3qWxx0OB/Ly+Ci09PACHD7gre+ywedH74Kj2?=
 =?us-ascii?Q?N9bJ9UUgpv68rVOAj3xuGyR6WNIpRvXglbnQNLTbjrFkLVM73g+YXqUj7r/U?=
 =?us-ascii?Q?VaWb8yikjLsQ5EV/UACgVxqADwn0YH6om2B6bDPXsIQH2yaj3iJAG5KXh38G?=
 =?us-ascii?Q?c+wXWOj+DHFBzV1lkkVUUoQkdPan1Lgr6FNH6Fq+miIaq8NUzuBIaPhDzY6l?=
 =?us-ascii?Q?D8hZdLmgFQAFRMaW2bAgt1VgxqPebgtSN87gSU8BmZL/6vM9Vtg3OLvJwmQh?=
 =?us-ascii?Q?9N3cKJDzfThFfqTDBmzK+o/rWlwu22CK3iuFVtLRLybMQyeBjjyg48IU5WCJ?=
 =?us-ascii?Q?nBTBAy7QQFEpIqLs9YT7HCJfFbY5e8jgItt8tQswzz9uMRIkimRtdnAwv55o?=
 =?us-ascii?Q?uX7ZM2aG1/W0A6HUoBgksjsp94mo6BgACyrRHP4KsA/DWSkZbu66U0GFgHWd?=
 =?us-ascii?Q?TkDJiu7mccloVtD95vehfmmJkt4OXSXvLG4omRVV?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a77c1d-c998-4651-8b35-08dbcd6e29a1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:02:03.4703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPliO/JMT86xQoZ9sOsWi/ug7XGerYo9n5ITPJQDXdNKKb0PvjUSP1Uieg3iDiTzwWnxmDXxiKE0waJco+CblQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7925
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 13:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105509

Due to the bugs https://savannah.gnu.org/bugs/?61934 and
https://savannah.gnu.org/bugs/?59184, which are fixed in
tar version 1.35, we need to force yocto to use it instead
of the one provided by the host machine.

perform_packagecopy function and opkg-build script, will use
the tar provided by tar recipe, which is already in proper
version.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass
index 7787042e21..580884cd83 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -58,8 +58,11 @@ ALL_MULTILIB_PACKAGE_ARCHS =3D "${@all_multilib_tune_val=
ues(d, 'PACKAGE_ARCHS')}"
=20
 # rpm is used for the per-file dependency identification
 # dwarfsrcfiles is used to determine the list of debug source files
-PACKAGE_DEPENDS +=3D "rpm-native dwarfsrcfiles-native"
-
+# minimal tar version 1.35 is needed as it has fixed bugs for storing ACL =
entries in textual representation
+# and extracting files with xattrs that are read-only; this needs to work =
only if acl or xattr are turned on
+PACKAGE_DEPENDS +=3D "rpm-native dwarfsrcfiles-native ${@bb.utils.contains=
_any('DISTRO_FEATURES', 'acl xattr', 'tar-replacement-native', '', d)}"
+# perform_packagecopy and opkg-build require tar to be in the PATH
+EXTRANATIVEPATH +=3D "${@bb.utils.contains_any('DISTRO_FEATURES', 'acl xat=
tr', 'tar-native', '', d)}"
=20
 # If your postinstall can execute at rootfs creation time rather than on
 # target but depends on a native/cross tool in order to execute, you need =
to
--=20
2.42.0


