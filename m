Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B5FCDB486
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 13:19:06 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.80])
 by mx.groups.io with SMTP id smtpd.web11.89849.1697367728016861852
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=TFflGnNM;
 spf=pass (domain: welotec.com, ip: 40.107.21.80, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqIZNHBDvo04LjkLk1R4U5RFuyNiwWAQMkGEvMzSOknTir6ozzK4qoqy7lyZrZuncYLikGlJ6Ezz1AQLzU8XghYvVDhY878YFNow3KBfqHaWI4tAdbradXu2fzNp/Y1hqi5n8ptkUxMdTcV1ebwRv+PJCYPInStko0BsVxUfZG2nUJeF+lij9rxk78dlGCHXJmrNjgIejFxkkm78TFEKkSZVsFNbYTwI4ijx5YMQbDZR8/7qxnNYWygC/NreMdMwkZVIHs5uQMxQ3MNhsMOKanhAhngWbpznx2I3wX0bzMmSAUbWsvJ24OlgIeWzHK9LKgYwhz1sZyi4sjEDNnfvEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLXSQT+v4yRbOoAidvosZ/GsLd7NCnFo9+kqyF1NMus=;
 b=jTQZUEq4cpYfn/iXtK2DB2hxglPhdgBcKDzo9KPpjJum6uCoe6r8UTxkpPKCiVtbpWYXc1y/4wfU7zhehGaqX/+dKlUfKihtZPXo87+Ov3WwKdcFviVASy/qqlYy9krO+htCO1CCPlTZTR7dn4IR+VEhJvoS8LFuvwsaM8STuv+x5sGrnlza5aUCXAikSdO6YCiYJVFntftFqKnjUEj92640escmGLg8uaXEll2TZPBqj6JXK03MN7nSRkeycu0zh630OEsDlrOd0NbTkRu2Zubg1zYvF4BXaxs7vFeU+bn9RNm5JOl5J21TozxCHESz9dPKMwktjn1G/Y+iYfXJdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLXSQT+v4yRbOoAidvosZ/GsLd7NCnFo9+kqyF1NMus=;
 b=TFflGnNMsnymev1TBHnQ5C8AD5zY+c3Xi5HybVrWmUJrPql+jNe6z5NQ0piasDvOxVvW3YsbSE3KtD1UTcGQAfFfFapxzIRgUoyE/9mOuuWlkE59MSQ23dEFGX1mhRH6FEXSVJ+ZkkzQ3v9nJxuA3uRnAzCR/WVW5OHoiW9GcopJlyK2YYle2FXXS7YG8pmiUzJUNeoJBvb2mWzxcrcaNwPRnpLhjEDua/LMGXgKa37it31TUAuGEidca++avCHQzKtucQtmZCdmmpSR1pz4IYEub8ehpj+XJGJbMw4VRuBaj5grMHsRGrhOPkPV+RbC93+0xYSB7jAeBb5twuwJRA==
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
Subject: [OE-Core][PATCH v14 03/11] sstate.bbclass: override tar with tar-native
Date: Sun, 15 Oct 2023 13:01:46 +0200
Message-ID: <20231015110154.53364-3-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015110154.53364-1-p.lobacz@welotec.com>
References: <20231015110154.53364-1-p.lobacz@welotec.com>
X-ClientProxiedBy: BE1P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: e319fb20-7baa-4efe-e4e4-08dbcd6e2a5d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eLZkLdPUKaoAcaemYCCvnSYpXOoBRw2dZ48+WF8aQ/Xg4Vn+ZtxK/gTIPtr2WeuILUF650pZqN3bPOJrbUgrsRBspdMvOOtNHVSi2KHm/EYaHGdVoDdm+WfxEAfR0E2yETSjuDf3Q8GV/XgFpZYx/ma9HBcwxATZFWfhctKAhjomVZtLDfco+RBtyAocnJLC9jQCRHCBf44SG+7I8QLj1itheS8XCXVZ666LeEQ39+HPYpIzDpTw4qwojzZI+g/3/1cAUN/TYZu7RXbp4NEmRVIpuwvlDno836sk/Hrj0Lv2Cth9KberUuskXJjVEnOKwAbp7BKvHc5kGGRq9oAylnIZouqU+4pLGMFJ2r1GNdXOmVGNEKuFct75mxYFvuxPPyO67e2/k1iQPKkr4CRiOsrcTVTFpASbmDISue6CF+90KgQUsvYMyA1C8N9r5bMM9KCE2CCOlKkbdM1Lt46uWxDpscUA32QJOvHG4ESTT/hOJiIDRMXKrNJioP8pAC84gPyXrJ1qvsGgytRUk0mclwTaXSn1GPeNFJR8BGqx5jUiMQznASQdsG9cLa7nuobxhi2wFP784KgNa+dYQiS4MfS5xC4/NX23wjbYP2j586U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39830400003)(136003)(396003)(186009)(1800799009)(64100799003)(451199024)(6666004)(6506007)(6512007)(52116002)(478600001)(966005)(6486002)(83380400001)(107886003)(1076003)(2616005)(66574015)(26005)(2906002)(6916009)(66476007)(5660300002)(66946007)(41300700001)(66556008)(316002)(8936002)(4326008)(8676002)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HoYYBtnREPlzP/m9iwP+LmUCx8JBBC7k/adW0+aP6JtU+5bLRrUGwY9f+J4L?=
 =?us-ascii?Q?bN8/xlVEEOWb2m8pa/R4yWUwBQJQvz5tji5NWdeeadORce93ml6vUSyc0mhm?=
 =?us-ascii?Q?LYWypHSJ91eXu8SbHIFWhrJjnq//J1VamhtoFunGSk+cItXYDphBb8u0SEks?=
 =?us-ascii?Q?jwMpu2oAcPeTV6NHXmiVcUA+waw6TWZxkxwRF4Fkhy3jiS+KvzJJQaXEKELS?=
 =?us-ascii?Q?UnIbh/NqqOnrs44GvzYzn/DQkq3N/nRsJ8mIhW6zUAsc4WYrLRtxqcJjbwXG?=
 =?us-ascii?Q?L2Z7mtis8pR5tz1isKyeHmdfArmgzIHcBjArC39jKyzVLBgV7UBaxRRV0Wta?=
 =?us-ascii?Q?w1R8sXxm4hWCnMr3BDyAYZAiwH3OknHF9a5wFu1k77Ok2JGVV+59MJprE5JU?=
 =?us-ascii?Q?AEShExKlyRenlpFVK5mkKKruLh2svKnflGp4lzwYCnZr9B1V3+xkpEfqZugw?=
 =?us-ascii?Q?5cLRZ9ijqcs7BLvYYCCgVscHehf32J3PuGg/jawSPFI/CWgxXmSkfgaJJFsG?=
 =?us-ascii?Q?OgRBAVoSX4yLklK93UqHKMiKj/cOHIaZY9ZbBYXzsYiJG9cTjZqE/MCRI+dh?=
 =?us-ascii?Q?M4em7DZp6Q5lsDWRh4YHMDSlZLQWsNkxfyLwGy/JxxhHxU0Qid5wlAAZariU?=
 =?us-ascii?Q?zg/Ayj8mJR14/mvoARu/rfzsgOpyFqj1h+3wuiU24x5ZEVhNFNenYDLgHuNJ?=
 =?us-ascii?Q?5sgAUytFViNzu+5FCZyNnRH7vHn2KR4Xw8xE5+hyAkyckPCOjgOcbliecke0?=
 =?us-ascii?Q?4AyNc860mhpvtrsTzRwO6D0ivYSj35O9NvF299/Swbgj0czjJF2GenHyngoQ?=
 =?us-ascii?Q?yLIYfCJJ8n6yRwDvE6onxdeYrhZBUgAY0srMXJZbAIkwgaVh1+qJXFoC9Kqp?=
 =?us-ascii?Q?BFGSAAosQ3IikbcGLQeI02k2q9563WHlset6mFthXRLXyF2KdgNLnXJrydD0?=
 =?us-ascii?Q?TacdzEETMhy0lfsbv+wAu+jXzr1JTJR7MudMoz9U9FAArFoDm5coqYc+18NJ?=
 =?us-ascii?Q?zQ3p3z7RKujtLigJA1fEmExBDzlZpZg1/AJDJtIBU8OgqTVjmPKMa+cxhrks?=
 =?us-ascii?Q?+4YvgDkJdNP0cWeaLeZmVMQ+JoYupUVQO+bo5CSsKeZLo8NH3Wxm0YLI4D+S?=
 =?us-ascii?Q?dlvLxAN/sZV19FmTDjOzPMipswIwHA7ZWrmnmpkErt73b4WwS/98OOnkl7zi?=
 =?us-ascii?Q?BJcmBSjnIpt4ftMNnlfIhalPba/ICItfPxxpeHNG2diT8OB+2PHh9XSpiQ8Y?=
 =?us-ascii?Q?7yv0u0EKCyWaleUDfSl7ohFTPsqKRtSRpP7nI+A7XA4rAlPL9xeCA/Q4tk8S?=
 =?us-ascii?Q?MHCZ755TUCifcGJrtfl+l0293gnxQmBqUKQXtkCuhL7pw9mOkAU1NIZGYkmz?=
 =?us-ascii?Q?dskredYJsULd8uXXEjgGlcHiZBX5wNRJE/NRSgptNAj/5K3hiF0EGrIE8Z1G?=
 =?us-ascii?Q?QZs5OLpwZIIiHhcBUMWKzLx7oxmOEp40fWBZns2A4Gsf/VuWUuVbYnphrjEM?=
 =?us-ascii?Q?3D6ULUMUHtdwdVc79MncoC58Pvi5jYjGnAd65m5cmpFj9v5e2fxxh2YQjOyi?=
 =?us-ascii?Q?On0I+LEnORDD6KRWpWRQHS6w//bhrxvIi0A6h+f1?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e319fb20-7baa-4efe-e4e4-08dbcd6e2a5d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:02:04.6902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cCbd31AW9JlQ7nfYLCDUjaFamxc3NrQwCWK25lbr9HUAvFTBr2TQMwO/P8FXAQgo/bLKLr/wUBO+zK7RUKG+Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7925
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 13:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105507

Due to the bugs https://savannah.gnu.org/bugs/?61934 and
https://savannah.gnu.org/bugs/?59184, which are fixed in
tar version 1.35, we need to force yocto to use it instead
of the one provided by the host machine.

sstate_create_package and sstate_unpack_package functions,
will use the tar provided by tar recipe, which is already
in proper version.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/sstate.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index 2676f18e0a..5ae6f515f2 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -152,7 +152,9 @@ python () {
     else:
         d.setVar('SSTATE_MANMACH', d.expand("${PACKAGE_ARCH}"))
=20
-    if bb.data.inherits_class('native', d) or bb.data.inherits_class('cros=
ssdk', d) or bb.data.inherits_class('cross', d):
+    is_native =3D bb.data.inherits_class('native', d) or bb.data.inherits_=
class('crosssdk', d) or bb.data.inherits_class('cross', d)
+
+    if is_native:
         d.setVar('SSTATE_EXTRAPATH', "${NATIVELSBSTRING}/")
         d.setVar('BB_HASHFILENAME', "True ${SSTATE_PKGSPEC} ${SSTATE_SWSPE=
C}")
         d.setVar('SSTATE_EXTRAPATHWILDCARD', "${NATIVELSBSTRING}/")
@@ -164,6 +166,8 @@ python () {
         d.appendVarFlag(task, 'postfuncs', " sstate_task_postfunc")
         d.setVarFlag(task, 'network', '1')
         d.setVarFlag(task + "_setscene", 'network', '1')
+        if not is_native:
+            d.appendVarFlag(task, 'deptask', ' tar-replacement-native:do_p=
opulate_sysroot')
 }
=20
 def sstate_init(task, d):
--=20
2.42.0


