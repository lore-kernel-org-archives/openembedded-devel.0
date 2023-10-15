Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF601CDB488
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 13:19:06 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.80])
 by mx.groups.io with SMTP id smtpd.web11.89849.1697367728016861852
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=Zrl7So1c;
 spf=pass (domain: welotec.com, ip: 40.107.21.80, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLROKh0pWObQnvIE2E8SFmEDFVb3SeX9ecORUkqG7qiQ5ieFGuWAvatuEw8m9IEfQMuO+3h8ETJk63BAmtyLmsQ1bjT2Ld3w0arvLPSSxmpswkXHxIorEq4xbXHE9F92YTev2SxjJkzgIXlN+3mGLOcxi7/COwnhbU6f/n7ySVaK4A3GWcDEtX1AsgjLXGGzJR3Wt/bRCvcF/HpW3cF02cE/1kGOx4ZEMKihh3hcRFaaW25+KfBP3SgJTIEVh0YwrDbEBjcZQGQUE0Yq7/fNADa4meKuebEOFIY2yCBwrAk8NvgMqye1UkKbiGMx4BH54BKxwRoQzezWZxWvCv6haw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulpa9lYXt81oIdqfYfeiZtEThO+YyhBvDq7q+AxaBHk=;
 b=W01UZMMvD4HudSi95m4skquAt0bixlebtPr8M5jIuNwth6og95aMhkwOumKxubI12setVmXupHeZki5dm0jpNZRS6GIQkQLImaDNpgG4scrKJhzIloxOcqORHj8ulOlS0TDh1xnq6Pxg2xHdpUHx0BTlBgJ+BgSNNwez8TA0Nk0c6oTzww6T2k7SACQfzCSh0M/0LhugPrgYseoSvmZC5umRaL2aKXle/xvKSoVff8B0c1lxya0QlGsRCpE+6le0cDkPRYIQkr1BwmGnakPpkAabZH+E7oOLpT16jhVto1yVbwnaO8X5FT0oA55tJ5l6d4nrKbDp//Pd+DApQV/Aqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulpa9lYXt81oIdqfYfeiZtEThO+YyhBvDq7q+AxaBHk=;
 b=Zrl7So1cfAx0NjhPF2v38OIAVyRqjSegbC86mSo5BI0Ebkaj5phJs25B5hiUR9hQvHxaY+2R2FB4NO2fjBy18JkaW03adOnAKnRPd39rEcsdQDTl/PfEL/V5V71GPhNudbvIQE7vvTQKHDHgE/TKAHx9v+ZxEfCF7xFouxIvbtOK2UuE+7MSDql09lzxGb8eby/hTNXg0i119zCt/V/oH7OhjKwWCdSV2H7Ru/yUI4vMu3QX08kUHzFH0w8nKnUSZluBYPva+VqdUdFnyrEGhb3Oh3UmZ6pSkPTxCYnL+HryQ8FjN3T92n7TYWn9PSIRz9kSPbbtz7nhSESaZcztoA==
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
 11:02:04 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 02/11] image_types.bbclass: override tar with tar-native
Date: Sun, 15 Oct 2023 13:01:45 +0200
Message-ID: <20231015110154.53364-2-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015110154.53364-1-p.lobacz@welotec.com>
References: <20231015110154.53364-1-p.lobacz@welotec.com>
X-ClientProxiedBy: BE1P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 3348af3f-8a11-42e4-ae07-08dbcd6e2a05
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S8deCYC+7r7lgQ+5SI4Ha8KTX2+qHfyatOm7vkfJbdqE/8/RZC6ObfDocnOGUXP/BfWqxLVDyv46S2wp+FllDwYYsHKP/vtOQ/3qjYYKon25KfjKCgLmV1CqifBzEW/qPmgDRZcuOfiYPaFqy3BFkS2+/6khwfz3NYpqQj5vMowzOkjlf2tq9Ni84eTFXh0EQ5cLRJJe+xtattFr80esu8P1TB3UsZYvv39F33m2MyEe27x5zBoLtStV7dpW84c1Bn+kNGj5QG7t4tZQZ+359vnOLGl5mLvIe0jzuRmGVfAcHv4Uymq5qLmghuKOL4qp8Uo5DunXzqYMelXlODGktA7MADWHRx0xtHbsSr/Y2T35/aXlcafi9wjUtcCxOpSpREVWd6Rd4M+w0DDsDT2IFWxkQHgNi9a6zB0HA+TK012Gw5UMw2ugQgR37iAR2btVddmZ8UsLhMaSrsfgwZ45wblvPvepboJv+vNmexdTVMMgJks+C2A3V7IZdMIgVV+HIiO50wOwsLlrZ46kqI8sf+m1mqGMj8Ac9n9T8EhcmvsRCe39HurhRigGKwnNn0SLFG6bEJrl+joU9YuGG5GCAiPGEh5yWYFwgG8augqFbIM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39830400003)(136003)(396003)(186009)(1800799009)(64100799003)(451199024)(6666004)(6506007)(6512007)(52116002)(478600001)(966005)(6486002)(83380400001)(107886003)(1076003)(2616005)(66574015)(26005)(2906002)(6916009)(66476007)(5660300002)(66946007)(41300700001)(66556008)(316002)(8936002)(4326008)(8676002)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6J32RvMb4oO4WCV/O1XomspMpIrbdCc0tuELw/IQN+NdKDvOP9vrMZZzGBZw?=
 =?us-ascii?Q?rLrdQ6xwE7v1/nCOTpmfVvTXc5BA/qTWXl0RzAHU5SVgYlWqRF9TtE9eGsQl?=
 =?us-ascii?Q?rnq90YkNuHQ11OU1oosAYqLUenaiF0R+C7OoXDP2TOdUqcDKKkmnjd2NLQIa?=
 =?us-ascii?Q?SKXd/4DqA5o+t/dCTlyPO3dBL0VyPvRAHxZnpA5fjzEasNe0wr1WuC344ROQ?=
 =?us-ascii?Q?LLvXWW4NyrGImNqTuyXAkfuIESRuHRrGlf4dSbnHCbkmOhHawI6gkLkkzDUs?=
 =?us-ascii?Q?bSopKFG54O57w7ETy6mlOMlYFFsYpeFr1enhw5TvmDBHTEP5XxS3+V/LEEG1?=
 =?us-ascii?Q?nKADB/hfuIdbSflgoyNCI3rppXSpt31ec3x5J2OJu73tmq6LhPR7Ngo/snnU?=
 =?us-ascii?Q?5SPqv8o99pVYBki3f1OQMjFBVvVOSo8Xez0idzBQvq5yZHfQT2/DmgIRl+MK?=
 =?us-ascii?Q?2zynhvBBfU+hwvE+s0GjeIi/KRL3H8PIiq4vB3/gjHg+m3kRZqXiSNP760YB?=
 =?us-ascii?Q?7KKfvz3IPkgA7BqLv+yQaahCGKMbmPfWRdR5CUKVjPRf2znA0YOAjPWfvfvl?=
 =?us-ascii?Q?jh0TooDW3aeEyNUvKbEjhCHzaWpaGpm5v1Hig9EDvRsl25qNuH2S564Ypcv9?=
 =?us-ascii?Q?03owdJRCde0CvTxVN+mSHm/vw0Gm1omXF7SC2Sl41YT4X0O8b08nfjgx7PCg?=
 =?us-ascii?Q?FpUUyKTjAysq7hkCLLWiQwTxP0MukIuG0Dez+/VaFJmGchrpxfVXAjxrrvx4?=
 =?us-ascii?Q?dFvOtE2YPsXGOSwIObVyHc02yQ2FSKMiUO1HxM1Wr1SgBSmHO58jiiKOSSKp?=
 =?us-ascii?Q?QL4gfYnF0MZUL40oI/qhyfU5THq0FG+NkFXmuiU4LfNKXhyqBoJc3L7GuwbM?=
 =?us-ascii?Q?4p5Egj4SZBgorhA4i4QaO0dH6hEl3JFnaHrkI/nse7QRu6g4eMwtB21EqThc?=
 =?us-ascii?Q?TkKb1JbNe1QS+R21pO9Wx8MdcHhgdJjn4RDUJ45KGUrurv1b3qPPY8UXz0Ph?=
 =?us-ascii?Q?AohJgBqhvFGMJFWUqHPNSaG1PHkGTdb9F1TS+Vi8eDCDYB3izDLL3zihAkEj?=
 =?us-ascii?Q?t/az9wi4RG+TvUpPvhxVcErReANi7DyAcfInLQzOUgavcqF6q0xArKMXaT/i?=
 =?us-ascii?Q?ZreB2OVCT7OXNtqPWHV3S5u24Xj8AuGEKMA7CEZ1gGCRGb93+jTRyRn9shRr?=
 =?us-ascii?Q?ORAdUrkvPyZvLHSRWo/+VelfpRZSwXqUN7rRQVZmRwWneRK5/Vw651CM3rLr?=
 =?us-ascii?Q?RRtM4dn9O3A233lTMag5K3Zxu9CsSp6QVEbGGaMeZ8QKoDlXykDxhoo1C0A7?=
 =?us-ascii?Q?Ivw6MoMsD9S5+mvCPPgfRiK7I2AcAMJtrhvJNr/QV5MPqHaimGCfZHUH6Klc?=
 =?us-ascii?Q?VLBizn0cr88fpR/vL7li5Uyq48EAIDjJI6B1mzF6ZAfRWSNUgkalnNdV9NrN?=
 =?us-ascii?Q?aRRzFhc3t5BeItZSB6DvQh++aPJDmALREpPnO+znJwh9IPNcI7uF21Yt4n0H?=
 =?us-ascii?Q?klUWl/1u+iTATJuod0P6M5LIQ8yPIFpEc6ueLeysTIfdTiBpT9zLFBwLm/Re?=
 =?us-ascii?Q?ex/4rXVmwFVineCZRJXRztNXnwmRu552A1V3LUjW?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3348af3f-8a11-42e4-ae07-08dbcd6e2a05
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:02:03.9924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6dzKVg8RcfYFcGvandyHQnFHTXjPzH9DpJcxz0m4V8sVXYmgFz3Yr5tdUobr70xcmGujCICbn18RwmwZPFWLhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7925
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 13:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105506

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


