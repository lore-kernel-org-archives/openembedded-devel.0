Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C835ECDB484
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 13:19:06 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.56])
 by mx.groups.io with SMTP id smtpd.web10.89879.1697367075405928676
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 03:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=mAXOJxxa;
 spf=pass (domain: welotec.com, ip: 40.107.20.56, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hq0fwYOrQbjXhjhAM5ipjT1k0ehUdHzKQN7vAWwDeqZMqKIx4oWmC3nEtb4/vo0FEgt0elVVLV+rTHbZGcrq9ESDuN5ks0BLwrXt/rRNRWSZXApUIChSTULek8p8ye/+rTuENeJ3lf5vy90JPW2l78l53bWiI4XhckhCE0xO+QtzDpifQvvuZSkEzE6kd5q4FKSXwuusEzQw1taJIKoksFdn3sgHC44AfiQPJ3iyaZec8bErNMDD9oZgGybaeGchsJqioMAkkx+UgiIumjWr4Fw6XpX5nt8GHRR3TkCfAr88aakGJV0dm3KzzGd+p7D7kLfOZB4wzsVPo8IYNQV0yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulpa9lYXt81oIdqfYfeiZtEThO+YyhBvDq7q+AxaBHk=;
 b=GydhYWEbq8cx2GjvnQvcgzPlWazfj00HQk22oWtKi35mYpNRUFsqGSSQJHktRQ+sZ8D48LYVlwT3L/nNIn4nd+t2nouTZWu4T+rrNNEmhA0rYD5dbqgxsCBYH/QTpznu5q+ETKiNbofhukyPH/rmM7sJ0EyS2k9sptqm8axjAsbjuZApQEmhTy3KP2qWoHhMtcH0YnMdbDbPyEZN5n/5Tp8vtF9ksSz0PC43sIPJa6BIw4uuaC02l4GgoIYcLptOc5vaUP58H67kyEH49kkwadSCPsZ9c+4J6rN2a5WeHUTDoTcactk9qd6dVypL2pTAex4W9DFOBzmIdhyTN+Q+Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulpa9lYXt81oIdqfYfeiZtEThO+YyhBvDq7q+AxaBHk=;
 b=mAXOJxxaOwZYx635FOHsEYJnOKJcJRIV2Pwb4rVTdorrv3WRKw2rVpJI0Q3I9Q/YzReKzvr9j/nugIpNLz+0oYh0plicUN5/0uBYe8eiMzGyoIqMz0nVu7TFJKNnOAhM9VxK6LL0YVbBnKLvU0v82DJft7HQCVIeOARrMjy2LLjZUAo7uOee03TPlxmBSyX739DwScMDz9IoS7M/c2JJ2gvSh95nx8VpZmyuXHh1YfM8lPDW804LXPZiddz2DRB415lNUw05+JJHfeIN6ztOs4tiypPYyzIY3CQkVYAk9q0SPdWJB0zLJM1kHb7iEGn+RjgXs3rRROIrMYueKnIsyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8308.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 10:51:12 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 10:51:12 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 02/11] image_types.bbclass: override tar with tar-native
Date: Sun, 15 Oct 2023 12:50:46 +0200
Message-ID: <20231015105055.52510-2-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015105055.52510-1-p.lobacz@welotec.com>
References: <20231015105055.52510-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR2P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: 760d978b-e321-4021-8e4f-08dbcd6ca591
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lL80eu+w7XbuUUVo4y9r100IQpqOWOvtt33/ou7Sbtn77lDlh5JaICZCn0IpytHr9+GDtFC5J5jB3HH0CLBiHhGJxiPsAOdjyLL+hQM0iEFa2qjcPGacCFd/TC5e2Rw0HODlyPAOvfOY7s0IhpfR2KM2hi8VGlMWbmNekFF2cuZnVBvNv4tZwxuaCl3IDAyHFAftfqOAyCEzKNlP/+wj2ceNPKdv1TXmjrFjWr5sk7CK6SLWNHt0hqrILkNL8l+1ugkoijmrn6kySG9Xy5YleeoziYmxRFoPJS2clpH5GA+3VVbEs3xorEu3h0E/oAmDWVqyd7lIQxrgdXIRPgmcO7qFFifR5nBUbUQLXNIdGKf9/kAK6Enzb6XVAhfCfvraD1IDXR8HAMuT+PIqu6LxrUicMtmSgDUMQEo9NywZj9QkUs/IfS6B2hkMT5zSkmPZN0eHzRHbu/ZWHTbmn6Xu1qkHPEKkfw3yRCML0tlQDr8WFVqV6dTKm1iuD7HWllH6YCiaXBzO9TCDEVNJNBx0vib/WHEZKPGfLv0JHz4pxNB0VICzk4bIh1fgs2Cj8HycinJ/OpGPvBe0zahlIDoimGnRtt1fWy5kuIajh1jPvE8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(39830400003)(396003)(366004)(1800799009)(64100799003)(451199024)(186009)(38100700002)(6512007)(26005)(66574015)(107886003)(2616005)(1076003)(478600001)(966005)(6486002)(5660300002)(8676002)(4326008)(8936002)(86362001)(2906002)(6916009)(316002)(36756003)(41300700001)(66476007)(66556008)(66946007)(6666004)(52116002)(6506007)(38350700005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iaAZ1J07WxUBMsUC7UAoOb3/Hifs+Uixd0KwQavCtTYxf72bV4RQ34y/Y0tx?=
 =?us-ascii?Q?DvFps9VUezVoTwSPBQVtn8LpFijlRU+e4oxu+qf2QMjuFHCcHE51I1uXb0eG?=
 =?us-ascii?Q?0JFoCsoXBl0xPDu65BMAypvh2q4buMtA3Xbb1sLzYfl6saTv7ekD9mL2JNL5?=
 =?us-ascii?Q?VVTIAFBGmsNT2gNzCuBVhNhSIuFhFS72QA+r+bdgAELyPLRxn0nfXspr9kbS?=
 =?us-ascii?Q?DQvKYyIJBF8SKYpOe302VVd5gy6rz+hd2PL0YN23QdQtRWo0NUNXVf3njvdS?=
 =?us-ascii?Q?odOkno8npWP3MJG2MRyFAAaKvONSz6GCtyRYPJUs/4/Kv8orMe2I8qbZzxoM?=
 =?us-ascii?Q?YQ7i2XORxLVGGGIRbC3uGluk9/yZUhuAjPpzchip956z9HqRqShPP9ho2PxR?=
 =?us-ascii?Q?iN4MjMiYwnR5DlprF0r/9AxW05jZGK+mKVcGtj+T8PoQZ79nE3zXYvbHNDcl?=
 =?us-ascii?Q?5XXIQ4b2+5AvqQj88XmKVjwj9xl41r2geqK5jTo281sffMoAQcNiXoKnlKLO?=
 =?us-ascii?Q?bjm44qkjZhowCZc98XDeh8LTbJTIF/ME99MpeDWmKjKEI8OaAMLlPIKnHbdR?=
 =?us-ascii?Q?rDedn6gM16Zm1FslNB4QxUTph24/DLgwcRjQqGyU97yuvHrHEyLaA4ENVerr?=
 =?us-ascii?Q?FCnT+8XcjRrV8BYx+PXXsOA3c27peEQAHzr7LGvR6YR5Y5VC6oShWLQKpImc?=
 =?us-ascii?Q?6eh1JDVlrALrTu+lbWQ7ROqQBvVmcoeJpqadsKrRUVfiLC3tzAwHxVpGBV0j?=
 =?us-ascii?Q?oNd6NqZYDkd9e5X03LLkRsoyDY0eQBCRMvj9y1tLXRQ7/qj2QsVKU46p5fgH?=
 =?us-ascii?Q?yUMVFH8wF28TeILxyleK5ls8EO1WYOjPnnFMOwrrfXwk/929eUqOyVxafROR?=
 =?us-ascii?Q?ZnGVwBKc8GWHJDTzbxr6jK0it3CuUz2D1rUGAdFm34rHf5nBwcpZ5V1OMzNq?=
 =?us-ascii?Q?d8i6QH9UkkGM4YJt3IDi96Pa4aEpXCtvIuWwvBsr/3oRWvHI7jqGPxIVAIXg?=
 =?us-ascii?Q?KT/Cib/UU/QP+rfSsxB0WPhDvmXmquK86AjLpVMDtHiND0IhtIRXwdUIplAh?=
 =?us-ascii?Q?1+2J59wgNwYv6p7Mg0Riga3GdAbGWSJioATYEWAT8xBCUCf5VVZc3ZkGN9xq?=
 =?us-ascii?Q?DIl30mrtDAKj0yn5uy28Veu43hJuuPQ3jncWmpg/PC/a6GOP0SbA3diYHlD5?=
 =?us-ascii?Q?+h52BHxXkLdbi3ee337kIz7OIjscHQ2s+nxFeOycOFElMBq4Y+kSUprE/C4x?=
 =?us-ascii?Q?uBO4dILMMO3LhMhK+elLT9oz95V51+CZRFEfiG8fKI0Tp/qyLWCTbS+OvT0F?=
 =?us-ascii?Q?2COg/KXo0XdmZU4xHSIlJLPopZKg49TRVPt6eY9HCtYtvC1v01xhZqmcUtCU?=
 =?us-ascii?Q?dFU48H/KgO8CEWnOlCm2wBiA7aUgzHvc6BIUWR/YenR6M76UR296mjXOXArk?=
 =?us-ascii?Q?FGqKJ2nq6oXxTmFxavvyDUcerdbtWWgyYqpYhnj8DxftspAld8Cf5i9IGtbV?=
 =?us-ascii?Q?RXltLVM7cCaj3p4+C60aIUiMyES8/Iwl2o2XNrvuH/GxXpdzAl6Hy4VxYfH9?=
 =?us-ascii?Q?ZyiUSKmGBzQ4OgNAn9YultUgQoupuMRuV47Bprey?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 760d978b-e321-4021-8e4f-08dbcd6ca591
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 10:51:12.2840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ltawvzLgct0oUU9JvI35Cnd3fpKHrhx80AVfHG8/OP2/D/c1ey9Muux+evJ/eNCyPvwsCRJWwCo+MswH5+1lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8308
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 13:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105496

Due to the bugs https://savannah.gnu.org/bugs/?61934 and
https://savannah.gnu.org/bugs/?59184, which are fixed in
tar version 1.35, we need to force yocto to use it instead
of the one provided by the host machine.

IMAGE_CMD_TAR will use the tar provided by tar recipe, which
is already in proper version.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-recipe/image_types.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/=
image_types.bbclass
index 4aed64e27f..c50bcf673d 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -385,5 +385,9 @@ DEPLOYABLE_IMAGE_TYPES ?=3D "hddimg iso"
 # images that will not be built at do_rootfs time: vmdk, vhd, vhdx, vdi, q=
cow2, hddimg, iso, etc.
 IMAGE_TYPES_MASKED ?=3D ""
=20
+# Minimal tar version 1.35 is needed as it has fixed bugs for storing ACL =
entries in textual representation
+# and is able to extract files with xattrs that are read-only; this needs =
to work only if acl or xattr are turned on
+DEPENDS:append =3D " ${@bb.utils.contains_any('DISTRO_FEATURES', 'acl xatt=
r', 'tar-replacement-native', '', d)}"
 # bmap requires python3 to be in the PATH
-EXTRANATIVEPATH +=3D "${@'python3-native' if d.getVar('IMAGE_FSTYPES').fin=
d('.bmap') else ''}"
+# IMAGE_CMD_TAR requires tar to be in the PATH
+EXTRANATIVEPATH +=3D "${@'python3-native' if d.getVar('IMAGE_FSTYPES').fin=
d('.bmap') else ''} ${@bb.utils.contains_any('DISTRO_FEATURES', 'acl xattr'=
, 'tar-native', '', d)}"
--=20
2.42.0


