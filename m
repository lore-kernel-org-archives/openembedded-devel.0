Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FC8C04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 12:34:07 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.59])
 by mx.groups.io with SMTP id smtpd.web10.31796.1659011639087318390
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jul 2022 05:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=W59J1AuQ;
 spf=pass (domain: kpit.com, ip: 40.107.239.59,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KY7TIbN0dyfVU6Z+5zxBgM9dPRA00BHJG5SrJ38h51gcL9R+m0tJ9cDsSeO+z92vcHD2AkkBW9IBR6RGFTwPXEP42KebJAJiSatg9HUQ88pAaFQ7oRUiNL9DR+uXNF/ZyrHvCjWJO5SQ6qGEQnqK+KeUDbL4/kxLh68On9fB+j1bmCimVIGGIGmoWav2y0Nc86a3NlWT7ObDhwpwoENTNTstPcdBePrfrJiHxMuOh1knx6igR3+Wbmry2oZYyI65KP5RbzZhHfu4k5gu457jtFI6DrBWalEU2F2Oc4gObjpgkeBgvLlvV5f0Ng+KuH77PTRnpf6I2TG/D2YzAHczQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffoe12F8vkXRb78OcQraef/HPTG/yUnuIzDthGCSn08=;
 b=WhxyZL9XL6hWEbwQeUWUsrXExw+oKBW4cykXdD81mDerb/Z+96MuiSTO8Evc3Dh6KnF1+RZXEPpLS7A+My/Qxe72csVu4hm06/TDW9EcaXqTW3B2To6uHIEGHpyNcyDtv+zLOU1EYpIIzI4CGExt2NdBn1PW6m8ue7LmD+01toiHrS0j7ng0bvGGd9sIb86M+ACIwI/mjHZQXcT/k6tCEqhbewBfpjef/nfPVlto2BfgnsRjlC7z0+b2gYa6L2dhZb1sgit2kXF7sNFsILnmoSYC32LcMcjPcOCyMpa2mML/bd8eEL3n6wot1mShHJMhnMdhxpWzMsvrLAccOjE4Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffoe12F8vkXRb78OcQraef/HPTG/yUnuIzDthGCSn08=;
 b=W59J1AuQh2vBt2CwybjSB/e5sMVWtSyeQXF3sjBOOIQi3CpF9cdt97aCIhKGzRv/MegAODSGHf3dOMyJ7adEsHy7PSJXYnvX46yiKuOeFv8qAQ77r/ZHl5dO+Nkuui4xPlK9/lE4fMPRoxLzv7urRQ3IpUGixabC7HHbeGF2L6g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
 by MA1PR01MB4434.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 12:33:52 +0000
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::3ddd:9cec:cb83:7c15]) by PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::3ddd:9cec:cb83:7c15%6]) with mapi id 15.20.5482.006; Thu, 28 Jul 2022
 12:33:52 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com
Subject: [oe][meta-oe][master][kirkstone][PATCH] polkit: Add --shell
 /bin/nologin to polkitd user
Date: Thu, 28 Jul 2022 14:33:12 +0200
Message-Id: <20220728123312.28952-1-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0774.eurprd06.prod.outlook.com
 (2603:10a6:20b:484::29) To PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:89::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ac49459-1056-48eb-b151-08da70956dcd
X-MS-TrafficTypeDiagnostic: MA1PR01MB4434:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xRvSpF03+MuqgkJk+fPhdMe1LffGRsQZOrb9IfSx0wjP9pqObwQA7LmiA7h89u1LGJiYIEaLXi+iNQsU52v4pcMso7bWMHkmOA7OX+ytxBeNmCCNpXbQ4TbNq2kykEv7W8QaXopzg4TK6koEyAYlVD/ObbYja6/F89dM07r+CjjGWOibx1DuuRMsyUe5YAE/H+OlTYQ/2DdMqfGHMcW9IKWWpxfuV5/nwk7sLUSRULZfz+oQ2mp+ejAsv8j3MtATSHaRYWaR/cd4mjw8LAc2QOlEHVxnAun4QCzHvKoGjm6Fl6KD1ZHdWv+ukH8sIAmtYz48dkjsy+ABmWDYejXS4RiE8QxSECz8Ht2+MUF0+CI30WkY5uooOw11IVGMk2v96n/2/t9v8tivfGIAiKQ0vmjStf7XBYPd6iTrRVCFyqDLLosQgnMOuJnOD18NWRpXRw2Y44z0lHjozPTD9ZseUJItWzBfPMX5KI8980UzszWrkTYcFPNsn3BSSBVf9fmjPhl9eyQFKEwYTH3mXjqbrLXsIlKp2S8JbdZ9MWBTmPnkMAeiOQ+gqfiVPm/XOUgILImUsucaANpCp3wAFz9SBv766cBix6pvUqY228HnYPEw0+YjDvS80hM3oNc/kYweyBJOW78Zi+fHnE5RkgZVvNlxiDGLsh4Zr2vfVFumrUo+DfJMnuPhJH+aVi85eYG1NHd/ezMGYEltgLP5110Q9s6WouhiguxJjzFxdQCZSJNR9nvCHM5CzBa8vprhidsjrHsh5Kx3RatyNrhZxJ2pS/5XjG6qjzx14rXA//VUvFCp9zy7kXgCvnAEWXfYrL7Z
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(38350700002)(6486002)(4744005)(8936002)(478600001)(36756003)(44832011)(83380400001)(38100700002)(4326008)(66946007)(66556008)(66476007)(8676002)(316002)(186003)(2616005)(86362001)(2906002)(1076003)(26005)(5660300002)(6666004)(6512007)(52116002)(6506007)(41300700001)(107886003)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sw9PZI/eHg+m1ndVNTFXQ2rPHbq3fv8zFGNjTR15e6ozPeMmxqUPOwod/Q9D?=
 =?us-ascii?Q?koAagh/ywnB05OGuYcmoFxVcHZC8Yb5sGiwUj4I5hAXU5klXWYrQvSP9BnqN?=
 =?us-ascii?Q?+hXpbjzw73mXQxMBTxCrxb81YTB2ZT/J4CC6/Lucw1ifP7ocz7ObXVkFnC7p?=
 =?us-ascii?Q?nQOUORF5AB3/k3Hlb3E8ZqF1n7l0UCAXIxTfWHWawiseJb0ufB1/D1wQRsfZ?=
 =?us-ascii?Q?j+ahkcEkyd0ckHmK5/cRpaEKAMGHLcWqwknuVEl8uSjUV56nWu8w2QtCvK+P?=
 =?us-ascii?Q?8VV2Vq4Eckcv5WkOUTo3vcP6QNxBOXuTBRIfWK5hhp2rV9MoSCgvLgH+5oNG?=
 =?us-ascii?Q?/6oPUt+snHdlQkvNnyv+bwL5sbt5fd3WR4PDbvuDWYugHeEYt7ZFA5hmCr4k?=
 =?us-ascii?Q?YeA3LK4BqRrO6z2XoUwHhxNayuZU6A4lt8Ut4j72noO1nFph+iwl500vOjpu?=
 =?us-ascii?Q?nADHj7Ym5bdeX7HD08N10sSdDgUiFPHZUiuXGSt1FmXRhcsOvtPmhJBMxeM4?=
 =?us-ascii?Q?qG4IMFMGUchJNyJTmaUMNGXXW5Cs0BBnSP9ho6WP0/W5af1eBx0XAq8joCpz?=
 =?us-ascii?Q?NgjTBXhrSC+VJQWp0Jwh/YYYTekrybtyYiIlCeVHP8S9cX/a5aOG032KPXan?=
 =?us-ascii?Q?jI4QzZCjNSKPTMkMH4gv7O4RV4/ktnNswk1ME5noIgxqSkfQZZ7QnZGytSaO?=
 =?us-ascii?Q?M9qg1JYiwie4uGxKZUOSdI/wpgmg5CLE1tHd0K2pQbYq4ETGl5/ycZbNbEy0?=
 =?us-ascii?Q?vpn6AYr3noEJy4xckaGPtoYSRVGWwratJ5KsFO9LXQNcO3gRW2LC6OQn45Ic?=
 =?us-ascii?Q?XDvoQwkKeP72CSRSJDIzxeCl97LeB1XukO7P14qyHv1c4lPCBNE1oTNn5SOD?=
 =?us-ascii?Q?NvPhDIPMSMZi3424jVP4AU7KB+QBo6P8l6ArO+/YAp5I0OIf+32eAQlViJ6x?=
 =?us-ascii?Q?wMKa3xFzhW5+GcuIfmcMJaYDh3EWRR+IjSLcK6nv91xm2rPcyiOgQ5krx9PV?=
 =?us-ascii?Q?VlKqnIcwsrRBG6G0dyh9ZeT67lEY94WYZmjvNJGOO0JYv53yVpBfGUkMuvhy?=
 =?us-ascii?Q?P2riDsy/kXL8WWahk/DXPrM9EpDUBOE6yG4OOIkqhVqoTK+zX5NDRBOiZABk?=
 =?us-ascii?Q?C2z3nZ9g+cTQOivn4/jB5x/FNaHq4Nl0nbNF+bT/J9Tj4dx42HIjEFvorL8A?=
 =?us-ascii?Q?ycs7K+xtuC/0iz6yN3U8HFfAe3OicZusJoIKyfaftFzJaC6sDzAYh2WSacZO?=
 =?us-ascii?Q?o9FpUUItmMm06DklcshnhJgtL/dAsbYlqKWUE7nNKhz4z4uIrvWu1NOFw6R4?=
 =?us-ascii?Q?E+DHSV8rexUEe8Sc3SnRfHrZdZx4sRFkDDuEWLENXJ/o+jyEK7blQq5NErha?=
 =?us-ascii?Q?qrubCrIwDzv24mjrzzteQ1jFXO3joHnO0E2iliyVA21VXw0PS1eo2rIrZiGq?=
 =?us-ascii?Q?TqgKrPQ1uVT7kB80EaATsLUvZOVMLbtF+iSblwPgj1s/MacSd41RMX2lvVs7?=
 =?us-ascii?Q?r3Mw6HV57R4rxAcFOSrHpDe3dB8AQLaYGHxguORY1c5Gzlvo/Z8Co2NBwO7+?=
 =?us-ascii?Q?PhwO1O3M9ADj926xFp3cWo2ujr62mmReqU1eWnR3?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9ac49459-1056-48eb-b151-08da70956dcd
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 12:33:52.5198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WQkk3w2XzJrYwqf2g4k49ojsFnmaLfyWyK8lZXnY43r+Xxdvmn6smcHieLascwfH7z9nwen1Up5tOHVriG5ypg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB4434
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Jul 2022 12:34:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98033

polkitd user has default access to /bin/sh, add --shell /bin/nologin
to remove default access to /bin/sh and avoid login through it.

Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
---
 meta-oe/recipes-extended/polkit/polkit_0.119.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit_0.119.bb b/meta-oe/recipes-extended/polkit/polkit_0.119.bb
index bf160053d9..4ce5f0e045 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.119.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.119.bb
@@ -71,7 +71,7 @@ FILES:${PN}:append = " \
 FILES:${PN}-examples = "${bindir}/*example*"
 
 USERADD_PACKAGES = "${PN}"
-USERADD_PARAM:${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/${BPN}-1 polkitd"
+USERADD_PARAM:${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/${BPN}-1 --shell /bin/nologin polkitd"
 
 SYSTEMD_SERVICE:${PN} = "${BPN}.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.17.1


