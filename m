Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB064C41513
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 13:19:06 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.56])
 by mx.groups.io with SMTP id smtpd.web10.89879.1697367075405928676
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 03:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=RVvLCFzk;
 spf=pass (domain: welotec.com, ip: 40.107.20.56, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbGNl83HyhjFk3580RHyW/Ebzu0rUlE7iANcdzjr5/17SuA5vO3HOGlSAXG6aCvFimK/GzGumgzQpPrt4d+IptFbKQNTZzpzi1FrzTXAkF/PDh+2gkAAnExaIarFFbYHM5TRxIeELEkGns4Qq+fpWJyppfo9xImEJuA5UQI8lz5rjxVCDr8D/NG72+mx6pUD29sMLnPxnmOK8/Wn33TIbddwxhIOIJPWQwniLZUg4tLVn/7xe9Wo0yKGy+2IfDXgFbepf/3joi7gLzBVrY5/gm8bTwwcorWmKSJmlhRomuUIRRUXbocpUceMwrEySzb2xQKNZseqOrk7qA4QkAEdpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eED+SE16zxfd5KCIEFI+rPVPpfJS2w3L2Q1srcPDrmM=;
 b=PXeHUcAoSd96aNUdwBRnueib0FUNvBqmL2jXbze1AtGL/tbY0czp5b6705MxvsC+spG61ud9pD1U1nqR1fSItD1fVrrsCCY9JFlT/7uoM4YmdQkcbYJ/L5cPRENlPuOMdPEKZHmXhOgK0cu+9pi2UIQ4JzpFfGP7S9GgPkc0UJHPWSdK5kPdZMtyErLzXln12LKKuqse7LNbxwIEc8xc6PLRShsGQmbSirgFpHkAXwT5J+RijuGG1NKvb9TKof1MyAEXboPb3V7yd8DqrzGnMuJm8VsjeCZ/r3V3/5LQlCBlXkz+1vkQZ/bvo0os5w8VBl7u4yao9CWO0yq/Dra2uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eED+SE16zxfd5KCIEFI+rPVPpfJS2w3L2Q1srcPDrmM=;
 b=RVvLCFzkyif+QvgJrbRB8heNIxPhny0STzDwcfInn0dWkUsAU50fGT5czjK1pUA0tTfMQSStm0W0fn3M55HmjGyE7Y+jg+hgrPsomDXNurlaXuVaylxpQYS1b/ulGIxGQ2E2iiDinthT5PLj+LDjRt7+ripGJP0X4Jq8JazzPOyXIO1x8alEFyDhMN+xVtvhzLKJO51ZIIqm59QVVW/QI8it2vfaAf6xaOY02X+H35gQYZ8Kp8oN0aeFdfREXKB0Fq2Dx6UsBorBpFbbNRgMUB40jm2H0dBLUSo+RQJjPQfrdwWtvtBI0xv/XG7j3JV1Z2ipWqjIoJbiLw1CPyGThA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8308.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 10:51:11 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 10:51:11 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 01/11] package.bbclass: override tar with tar-native
Date: Sun, 15 Oct 2023 12:50:45 +0200
Message-ID: <20231015105055.52510-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
X-ClientProxiedBy: FR2P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: 94888bf1-74b3-400a-1d90-08dbcd6ca51f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wJnJ0//qY+KE0m6AYPibw2JEUn+XuM7lTvaaloD2zW90LxxwrdzQ4Mx1/cGX4LkHmN6oGqMAifxcXD8MDzpTlbXRVDTDB0pJGobDxDt2MJMrOvUoQdjaDM5+d/m47tEIpj+FZ3giSNq5nFJE+DCZxeFx9mE/nkCJsuQMV3KqptTwfZdwnLuFzEKu86plLKh1FowokuFS1lXRJavrykwrI4vXUOrKZ5dyhvyKadtBtp9gmolZnfd2vDcH7KVHwNeSlczZAG34G3APGr1rlzsLXTgkm6lCb7EzbOXW5iFB8KCyTZ5tW7nr8I0V/o9LLYg2ZIKMugY1CgWQDJl6KgxZ3MHeL3ORpDTBKS2nBwkGJyZgxuD0iH0+TP9mnX1HNVKzKLc9IAmI4D6LldNiay8uY5+MDbF9Uf2kvDjEtqO8idQxVsy7ebW01W1OOZmOhc3AgJ6N4zEk3+vNhbkJ/lW6UlTMy1EyUadeAOoC9OHSWsS4HZ7FxLKMKwv28insIdWOAj5880h4ZfuIeUPA6dOIDpR3gJ7Ec6j1Qm/gdbBH3ztqDSfJFc2XoXaL1td2EIaNDqhGcFYs0PDgUkbJuTdCLpQ+VMl0K99zJHGOG+fRn18=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(39830400003)(396003)(366004)(1800799009)(64100799003)(451199024)(186009)(38100700002)(6512007)(26005)(66574015)(107886003)(2616005)(1076003)(478600001)(966005)(6486002)(5660300002)(8676002)(4326008)(8936002)(86362001)(2906002)(6916009)(316002)(36756003)(41300700001)(66476007)(66556008)(66946007)(6666004)(52116002)(6506007)(38350700005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BV4fzVrOL7/Xw8kOEt8dnTDTuyAOPv69UArOORFm/jlxJD46EjKPrcPReC0R?=
 =?us-ascii?Q?Oczy/CABEqoOyPJCwH8BJJxhB4o4ebVag7cekaGFQO95fITHx0N2OzaRczUd?=
 =?us-ascii?Q?CIMIyEgQrgwGohFFH+MBl/4AlAcneAVCiOvEVfQgG3HcdIFUtyTFXyUjGcqs?=
 =?us-ascii?Q?/HS5zbHJIchUPSsFPwleu0A9LNMb3g2Pt/BpFqVKf869sYIHG7XMFuOlIN3X?=
 =?us-ascii?Q?e3y5E7q5CbTwF63YVSiUavPaa7bUAl2UyH4gt8SfhWE5I6aHfMx/jAbAnAWT?=
 =?us-ascii?Q?zcVPRCJGorUgDt3kH0C/6H6wu/rW5CtxCq1ZNajp6X/o8UtUKl2ZWY0WHbw6?=
 =?us-ascii?Q?wp/hShV4N4PmTU0aMZnTdg9vsvCVeSYB+L4GBuzRTS7j1rgMPGmQZkNXWDoG?=
 =?us-ascii?Q?Rze3gbHdTtnfdlBkPyQg6H8NhrAEfF25z3LKH0WTqK2JOPr6+h2pU+bG/t6y?=
 =?us-ascii?Q?pfZ3lh0+oDvbNkMTmZt2iA6Dg5uMtXHf6bl0q3MDyd+YmRmp6eQeJgoHZ7hh?=
 =?us-ascii?Q?qFaxit6zuBnTWOUlHnxJ46lcgy2lpqiafd/ilI/6qHwAYbHOYzYyP1xYPhDo?=
 =?us-ascii?Q?v4fVO7EyJFH0wUA9Gdjs8md9F+WoR1eiMArcDUgiw+B0p8y/cGQxpXJMUHOW?=
 =?us-ascii?Q?TXybCgV543WLdAckFOeUkhUmaxGjx6xvpTRDK8FA3dwhucjZM35RxU6BG315?=
 =?us-ascii?Q?XXM6mfHu42mvtQGtafwqA6xRDYScTS9yL/pBo2qX7nbHHPbK13we//GtDmX3?=
 =?us-ascii?Q?rNZb9yaW26uVNxnslcY53za53GI+eXtofUwASxD9uIidC0SF1P32HjkmhWaT?=
 =?us-ascii?Q?nYN4DHLIF63uxY8k4DxTRoVHzeoNf3pRWZBPEnN8VO59M3hcydpHxCBeKE1o?=
 =?us-ascii?Q?rZlvuobF2oq4NkEXtcS6/x/4jwYeZHWrJ96Rd72jHRlQayQ5v/iBEDtSR+4n?=
 =?us-ascii?Q?S39okBgt08sfboBakh1VLdWXpGE1Y4NQrmbDnFeaO02E+iUTGSSxoMuPUuCR?=
 =?us-ascii?Q?GMVO+csR4WqJpoGVEWhmrcBcuLl9TpshhvXDC6p1HRghSoMISOvYRHNKgo5K?=
 =?us-ascii?Q?Z9asiDmZFVTCqYkhmZj3EBH4QkOwOn+dcJHiJInH2ZYR1aV4VaNLFd9PoRNY?=
 =?us-ascii?Q?6/vNtvF+bPLROqUQ/wcbj7LoXj2F5EoCEKSNzM+5nZTxGJvLjgTOQNKxY4Xm?=
 =?us-ascii?Q?3fkJX4KBtwYyqmMwqXynvDDGmHBGob+7r/6IhmlBaXC9RlEMUHJ/HWL4K5O0?=
 =?us-ascii?Q?C98PfWlUjhhEcCf1dOJxhmuXOZVMudnVfEICIXCmcGXLzber+UFr4xvxLBKP?=
 =?us-ascii?Q?1ts9b2Zv+0Un7+NpCW3zwAI0bXAsEv0EEa9PGST8clhnijF8lUdiSP2qX4KG?=
 =?us-ascii?Q?wq2IaVRVEOqvu17MGQ4t0mO6XcqZpFcgZ3MA8JNPWulSFUdDTq0JqQFOAhNL?=
 =?us-ascii?Q?pPVO+2DlmggghoEOrVJbPWIBr4i4hNoEwcPdmQ3te3N9K1a6snHKpHbmGsri?=
 =?us-ascii?Q?hgETretscqfuL4SjAQ8lyyZPlKMnlMDTRRvNdYO2MdyoWkNVd2+OSlzaYl66?=
 =?us-ascii?Q?kVy5LJK2vg3aVma9wtoiP+XUrnepq3V09W2TRFb7?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94888bf1-74b3-400a-1d90-08dbcd6ca51f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 10:51:11.6235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMX7ndM+6VA8DAMl24DnJ4UlCrmHy/afqRHRrWoj8fr0cc+8NRi2Ha3+BJYS9mfTXoBSCj/dPIW9a0KT1mclbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8308
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 13:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105495

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


