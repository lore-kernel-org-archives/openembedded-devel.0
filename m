Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F739CDB48C
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:28 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.60])
 by mx.groups.io with SMTP id smtpd.web11.90066.1697369032343148425
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=r3SJWh1T;
 spf=pass (domain: welotec.com, ip: 40.107.249.60, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbdtcE/VoEphqAXsLKZK6FZSdw2DknShDgz9PFe+ExyM/CV7BWRkOJIHtj3bpajvPH96dsXimiGdZAhxUMXK8TI/HyIB/n8nS0hZEK+jG6xYEWkUrwwtE+qB9iK14GodCoJDopXPM08jaVhPxsDNNv1oBkEKEBI3YGAeirfUkN3OERv5wMy15aHCXxuhWPoiJWbV2+DoMM78PlDNAamMbzonor4DDNq1w54jwa6iccACidAji/Uy+Lg71VwHvZwAIAzYa/rBq6b96vtPY7uKQdp+EynqJ9HTv6ceoQeGNk/9fzTgAiFeXdnISXiLcWBNcydRukY5PkBxAcp3J7GKtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulpa9lYXt81oIdqfYfeiZtEThO+YyhBvDq7q+AxaBHk=;
 b=c0FI7OqIhAWXsiPGSdMe5CwawBbtode763Utq0dNET4hdYGa6Ohlr2yuISq9qnTVXsrB842ODHmbrVAfV//9yAJZLsN/rgKTsanDAdmXyVhBZcFdGDokAaHjmK9vvzFHisvt8QX+9Cqf6AV4cHQems/xWckCslyUcqAEZ3L+kTMwSQwtCHjm/xVuiiEBFPFnIQpfu5KcW3Qwo2Rbxf6VFN1SUSaPV8mJ9IUkO94FI+uOQsFOr2e6x47Lbu6bR7mIifkYszmBvNbPQ4YZbgy6zZ8BEoqlfFIAzvlHLOORxJxRVcYlgZxKY9ooPJ0NgCZwU+dxKPPK1e46MygjYFZo0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulpa9lYXt81oIdqfYfeiZtEThO+YyhBvDq7q+AxaBHk=;
 b=r3SJWh1TLQ0/kpJzdsIzhfeB+zDHPmy6Ajd+vzhqEAjnWzFoXa9Ia6esS8xnyd9mxymcVkOoaHgF2P7DByPT7ZvpmwbQeYsVb0SFPyT33X3gJfACKtX8zSvbXtTPgBs89r7nUQ2RP0TU1433vZwtTMjYrrox8om33KhJsMfRAFI3njvZghCiva+Mz357AzjBOoLg6EXu2iL341hmdBGLiyEHfsNOdDpZvxdM3c6oDKhTndm+yJXwqks9e9WoR0lpMsjXZUbdpYEuWfpdYwznzv5ikeWM5g6euQEPMHSupd6KAuqWmtP53AoB8NNe1/nMtPIu5qj8G4iKSc8EHyaytg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8113.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Sun, 15 Oct
 2023 11:23:49 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:23:49 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 02/11] image_types.bbclass: override tar with tar-native
Date: Sun, 15 Oct 2023 13:23:27 +0200
Message-ID: <20231015112336.55722-2-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015112336.55722-1-p.lobacz@welotec.com>
References: <20231015112336.55722-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR3P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::18) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: 17ff9217-2653-432f-439f-08dbcd71339e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	my8w8Sk38DaHS2mbobMY/Qkqu8IWnL/MJ/9l4/IAXun0Vy9NH99v5ihGnV/pdgIX6mXTJztZoFov39j2fx9lv21tXgAnX7g8mwKUs2hfZYh3smZFVl1YNaMUqrejt8QC10ENlWuZccnYrzaQPRcYaKV8FbbIMzXF9iWeXDNzgR4+78Mmagat7ZwoA6xGnPHhxeorYbUxMTHEuu/EHekkRtcC2s6aws/LqBcFWtXzzVRVQp+VgkEs3EEZr9ZItN8p8i6Dd/aoAk5+ZVIT3zRmvnqaKQsfcu8UGhEXR4wX4Fowpg5i8im22ZVuhsYu3/+a213/Gf3CgM0iQ+HqnMXcTlxoBthCnQtnF9GQGalb0qu/GISRqigcgPoE4R0C5aUelxNfjl/wPQabtgxNn00L7z9phy6cTDiWTuP7G7wZVhoWSchXmX0YjK4AbusFFGlVPphXXI/CNHZ+Yl1DbIv9ufmbB1m85So/Qpr/xbKVJtbRgeDnVOTF/s4XDYZFFao0/qoH4wUDsTfPVdDVgo31SoePmb6tih9R6txAu+5CPiF3SOnozmZzITs9m4TCWDbL8Sb+nua29eAtd76YUUsVgc8NkrS3DlsIEphGZ+808/0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(346002)(396003)(39830400003)(186009)(1800799009)(451199024)(64100799003)(478600001)(966005)(6486002)(66946007)(6916009)(66476007)(66556008)(6666004)(83380400001)(86362001)(38100700002)(316002)(6512007)(66574015)(26005)(1076003)(107886003)(52116002)(6506007)(2616005)(5660300002)(41300700001)(36756003)(8936002)(8676002)(4326008)(38350700005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hFH17y7vUlUyiKLT5AW/2/fBpTLqnI+3OOOPhf2DJyYZb+y6kXSrgygoUih3?=
 =?us-ascii?Q?mtMdIhb4ITeLXiHdzcTXI5FqLhS9lccAa9qBME22v2U0/jekoQyN/NcfDSCp?=
 =?us-ascii?Q?cL+rTv5miDeV6UK2F7vhVii3tIr6DPmAazaqObiaXs2L6G7uVkuGi5G8H/Ob?=
 =?us-ascii?Q?Bu8ZrR8vDMWaeU3kDtd3elmCfExipCPk9VIBwxLdtSVsCeGiAPyPVgdtvHmG?=
 =?us-ascii?Q?7HGO/oQD8To3mIfKJ/WKMUBNpyTxbLQJg/xXCONI9cQ1Hr62U9A7gy9YhBje?=
 =?us-ascii?Q?xywpCt95jpdtEdVMqJdL+Tujh0y/PXHiaOUwpum1kiQPpFXumHxg5Zzkxuja?=
 =?us-ascii?Q?2XBUVfEXUT0huZgFCQkG+e3VIsYoDESpUA4br5HzvfsQmIBfXEves1MjN1dD?=
 =?us-ascii?Q?OHp6FPJqZEjL5wVDjL2bPjyt21H7a2b2rjkLanAGtPuQwoYZctSlqIcWsZNd?=
 =?us-ascii?Q?OaYje8+clOIGMG85LA6FVfdiBpClheP1p0JjsxRYxlzckgpsdqGwp2U5p3uw?=
 =?us-ascii?Q?u9a1vtkMO8+/5UPKVvV0kMjjhd2aD6wB8p9R1JdtDqDEMu3O4YcX84iDtNQW?=
 =?us-ascii?Q?gVXIYCaxgamHmuVFfr8O7NU2gGDz5K/1nkpudw1gHSSCP3B4HpyCVmX4s28f?=
 =?us-ascii?Q?3TE8KbhUfMgMycgvmd+tLK2HxvTEykdqJCokQmCGimzBgS+ASEIxgfsxGm2l?=
 =?us-ascii?Q?gLy9cmWf7ebyKnr2nHMY5PrE7RO7ZHYOIMegUzcoPiwtWnYQpGlisncvPpFH?=
 =?us-ascii?Q?fjrz+dKIfPsiwjfBJCtH5VBiPxfOT4zk1KMM6mlEpCAjZ57PNjXPgFbaUAsf?=
 =?us-ascii?Q?CJGxKKDtH9LSllM9DunxSjcZBarvWk1L88Kde8Dikq4z9WnNd4uAXXpsuCsa?=
 =?us-ascii?Q?rKikuV9G6Lm4rCNDW3l/WlXJqOEsFZ2xSoFKi59mCx6BogXPtt9F/SjT/djh?=
 =?us-ascii?Q?qj1UJT0gRkUDt/OM8QfwQzfPazjb63J8Q4VLk7oljPzfS9OG/XnxAco/aQ2p?=
 =?us-ascii?Q?bMx/mM1qYq+0FHM4tosfHw1hlp3hZCtTDdv2oeUtF2UDBsi73ngilurfFquE?=
 =?us-ascii?Q?R3aRDQmgLsmG2in9tmvEe/lmKmNuPQcKjkPtkVwevtCmd6Ut1UYZnYlbfXJn?=
 =?us-ascii?Q?y7R3+r6+isp1TvgU0t72rGYEl2QXkxBrDkUWiddAPzn0Pp3+pPLJZpT3BBI0?=
 =?us-ascii?Q?VmkNTS+IlujnRCUdIVfAUZRE6aTtW5/AKVt7CKrTbM2UY3S4iXsPEIGSdiD5?=
 =?us-ascii?Q?yXZu119BPPqKcVD84Iz5D27PGGSLepRNXUNeAOyeABG004Yl9lDdKTKragB5?=
 =?us-ascii?Q?rMEMLnHwYFvznWTyx6faNUKtxsvZbjhmtmLjC1hBH4A0SCsXw2IRItMn1A5x?=
 =?us-ascii?Q?5PPuUaL3eLuzxawLDZEqYYCi7U4JosUFsTFeuooAUCmtslNKTmuAETjWkLSR?=
 =?us-ascii?Q?FtjdqRnXpVA8sz1QKvec0gHFZX/kdEeh2plmhfR+2oXZn02oBinqIWi3jKyA?=
 =?us-ascii?Q?Ucn8rqcNE2wPrT1kkXkReEO5foRFLAfFrx3OGuW4wc5VpPErFPJ0ZyE854zH?=
 =?us-ascii?Q?PjN9Br2cP/vugFVCRg4fLqwxu53YXQxvCIiFcTVm?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ff9217-2653-432f-439f-08dbcd71339e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:23:48.5988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZhW3wQfCnF25hQItn2B6JfY/uqhALonXh6wpqYdkMhEDWVOWctAci51zzQ+V/IJ4GNqRBQb/Fjp7SkR+np+Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8113
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105529

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


