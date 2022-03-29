Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4489CC433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 11:32:47 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.57])
 by mx.groups.io with SMTP id smtpd.web10.5565.1648553565128347596
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Mar 2022 04:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=rdtHbcCR;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.57,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBON2U9mUeRA0V8Q0ntypCHBy514rtbCGrg5lbVfN6/tBXDFpuxERbJSB/Po9M3QsfPlvgC2YeQUzL252bomUkJ5btAKh6HLCMvySzHs2b9j5wiliB0tYGhLDI4F+RNi3mpHNnB/haLWsZKOGrRGGPyU1JenAofU0SbiYFMgtYWXXkZdFHOHeMHUqIJ286X71B+AoUnCIN00mvunFQclKNFhDlPcNq1IQF6eTJ08MCKQgYsFuyrTQielz+AZ+LELfZXNGxcsqxbkdXnY+f5T23GGjx2pZueIsjTZPcsPPSQzfOdHfwQqLGegGQk7EkanyWSjTxeWfI4mRpxvvopMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YuPmE/4wg7S6TFrFU96WSn1BVn3Gwfr2PdxkGLlR34=;
 b=asj312OyG2YwdIQ8QbSBJ3L6LZYH/6WlFUF1djVORWE8tBS1PVzCso7QXu/oHC3jArj0mwJEI8ahhOiRRaSRnCoEa8ImktAHjxzDmL74JUZZjD2kvw6AGn8fX6x/x7W3XqN/eSHuSEZmS3ZA1Vh+VzngsVW8uuCPHn+nzuBIA+PYmKc5P3LaVKjSqiPnO0fYRcFVvQj50S/acTNrwMoLLjFd4Pos513RkbhX7w1zR4uNfPamCoNGffnULbwbCVI1YacjynTGGxK7m+/JtTvovadXu2pD43LyekblvA0gcFbHlagFUj/bE67EJUGlN3hCWvn2FoMk/q6x3cZHaeEwfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YuPmE/4wg7S6TFrFU96WSn1BVn3Gwfr2PdxkGLlR34=;
 b=rdtHbcCRDtDy68cKT52sgHkPS9oUe8lLrp01yKJXToHcpNFSnvxKWsRgjQ2JrpTRmP3jhgCuYHr1X0DFBiwBe0jhxZZxUEn6ZdRjPsMlvLt8zxMMKLiscpmBw9q+Na2bOFd1MNxLdfugacK2nMwhe7sfW6/8oiL2/Glys+xtJvk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6765.eurprd08.prod.outlook.com (2603:10a6:102:138::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Tue, 29 Mar
 2022 11:32:42 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba%7]) with mapi id 15.20.5102.022; Tue, 29 Mar 2022
 11:32:42 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-devel@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH] openldap: correct slapd systemd service support
Date: Tue, 29 Mar 2022 13:32:22 +0200
Message-ID: 
 <20220329113222.12443-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR0301CA0029.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::10) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23311936-7040-4c0e-5d74-08da1177d634
X-MS-TrafficTypeDiagnostic: PAXPR08MB6765:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6765C58EA11433827CFBAA45D71E9@PAXPR08MB6765.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bkRi5wg9dGwiek0PwMhBMv5Z8a6FknkT58O0dv84cQp9e5N5FPTm7vSHN6VEAhiBvK3+njx3RFfhrHnk+MMUt/SDGknX7z97ziyf7UcxxaSzGLlI7nBSwFjyX8nkwXXLyGbTYbgXUpnruynAWkxPT3afoW26zh0UFyvmd2q6llhxYVnFN/H+A3iJaqXVA6sP0e5hM5QXprEiIEDYgClINeY1XahHFe3wOJfpUeRT5Xwx22vOM5tUnwVTBUpNgV/3w+CMuw/epK7tF5QCyr3q1FZ/zAwnSkF8o9qAKz18xaTUKXn8C7SoxhRQNMIutI54SyBrGgZinEd/DHYyxdlxtANi8KsdZfGrgivXskY+umsW2f2IPOtXCGnZvk7VaNnA2rBDQYwzmcsiZxEzRixLAJRPSUa4tGvpi/FNYoFKRJIWbJBTkPE2djxT7ToAzuiNrQkpFBrdQolPc7fw5FAERUL+yJ5ZnhQ2Eg9fG90LYtPKw1BteR1HsRhCoKSW8DKgvAET2PqJ/OSaqptYH7GuK80tyfm1m0CJ6yySbAnGyjkNYtXUaAdUYUZFDS4EIFBLCCeIQ4/Xx2oR4HDxtu05EiTYeojUKOiCkY0AMnoI1ktouYv1Tp6vnsfCnhO8rD8kSDRhc8f6a2ohZ50xfQCxCeYX1VKnl1ruKLcWNNirb8Hrkb59SIBVcJW0lcSfUDpzJohLSuSWkQ0AW8/Qa3EvmA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(5660300002)(38350700002)(2906002)(4744005)(316002)(66946007)(66556008)(66476007)(38100700002)(4326008)(6486002)(83380400001)(86362001)(1076003)(8936002)(26005)(8676002)(6512007)(186003)(6506007)(52116002)(6666004)(508600001)(107886003)(2616005)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cYrlwbvYLA08U9xeO/ETiMzCqTBUvPvIDaq6Wqb7NkncYV8zYpGK+zLtTlsp?=
 =?us-ascii?Q?Emq7ejA3e9oSxNybh6k7XNGKv9uxd0xcC8m4UIEVzYXR0y7hdqDbZ5L2pV3V?=
 =?us-ascii?Q?0E74FoBZ9J53eGvZJM6Sv0PScwERDvFCqqZjzS4s9/pXtKERQ3U/D8uyqMuX?=
 =?us-ascii?Q?IV28CChwvXhms1DatGLMXE2abofpJP6Ythu2LTBMhtXnMVPEMnUbdA2Y+XbL?=
 =?us-ascii?Q?63vZHuRz4Xtf3VqW6ddxLljPVGknFiwBKFooK/u9VBq/j/tStsPJDnzPCgiE?=
 =?us-ascii?Q?xQIkDFXeNsWpgnNH1hsMxTOlmcboPB9xpHog+YGsnceC7/9XOEaJCc8QzLRI?=
 =?us-ascii?Q?+4AsjiNDhhPRDSfbsdg7bApuhjlIfzXDUjJBzY28JDYkKDkwL8slyVV9hjq2?=
 =?us-ascii?Q?0sZicFKD8M6rqAhjduzlpOPv9cvd2uKNY4P5BADpUnQnakhwV/VY03vuuVTs?=
 =?us-ascii?Q?p3U8KFQxrWisgELAE/m/QAwlzOZlNL0L22OyTwJP+7gRGgfIKEtvyuxhcnVh?=
 =?us-ascii?Q?IsPq2cFkfKimCTL4yv9Lmji9pl9R+2wRBGd4CzF3UoGqt0Aak8YWHJlJL751?=
 =?us-ascii?Q?H8qSAUJH5KdTWuyYHUA9AxtFBX7Yp9v571OF1i7s6El0JiOlkEnR5NcLMSU3?=
 =?us-ascii?Q?2O4GpEJWEguxHQkbw6u4gfrVI/v3LpCkfGGBT1hihzA5DythulelJylIc/0U?=
 =?us-ascii?Q?zYqWwC2sAN9kWmnPvvRp936gGaxDGMyf5lcvxdri+Ippf+UXO/ZH0ozBek9R?=
 =?us-ascii?Q?94q7nY/xHHT6lP7lUipxMuUKsNIDFcumyqJ19Z7KTdih3Klm4A/sZeLE4h3T?=
 =?us-ascii?Q?TyQ9wBGFGkQ8JZw+36CHDfPf4LIbtJh3ors0omM8xNwWUG5B+1THlUifv5JK?=
 =?us-ascii?Q?Dq17nrh5Qq78XZSdemYGdBQQScfkeKxzokgnY0oWP5HUJ7+ZgmtkyjUJG77H?=
 =?us-ascii?Q?sk5pRUZtWkNaf53E1bhPNx9WzNE2M8lakEDlcixKaXl4IoCrXT1FP6lC9m+H?=
 =?us-ascii?Q?4j1K9fMa11lXTNyNiwhPnoaVXg8rsG1O6dnUQxb+yysoBY+xaAQIjpAmcKOR?=
 =?us-ascii?Q?n54yfZ06FJLPs+VCd3av2NvbD9ZswmHAwvaBJ8y/aVUv5iobpthIhwRN2UWz?=
 =?us-ascii?Q?tZTvnfSeqw1Xu+xX+loyk36EVwqQ0ov0dLL/EXZoVP7cNFjNNSQxHToXuCiL?=
 =?us-ascii?Q?OH84fSpa63py9l7cAPB2zu5urKqRHVDETnGu4BV//PnO9hS8znSRStmpIB+z?=
 =?us-ascii?Q?D3Xdl8GWY43JbHJ50U3QtKwmcPgKfCM7HLnIm3Dm9iZWmfQTEBAu7vGxHMSX?=
 =?us-ascii?Q?d2Cd1jnX0rCtOdSHszYVxEAitSa9XL2TodLX76OwW8i/4OrKeyUYu9GiG3j8?=
 =?us-ascii?Q?+7txUFu7jy7iErsF4WlWNHJrXbhg9BNqcUdzAhpOpao9tvBK0E/m9Lk98nEn?=
 =?us-ascii?Q?tluEWIajGRUiqKR4M5SQumn2DnL5b4xEY9fSvc8m/EhM3T9H4c6Mq0Xg/qZt?=
 =?us-ascii?Q?2SRwPUAFEOhVXmkI3j59i3Rzdo9EXstLuPr44RcSKr4iuOkP0+7ZblDbxmXT?=
 =?us-ascii?Q?w3bNaq/jMRSztnGFEPz5QcR3nI+0SI3civ8zp3lpskm3NoFktQw/dkNUokUE?=
 =?us-ascii?Q?RtfaG0o1CJ4TZmRLiIpMCSkklAZN+qmFmiPWLXI1nVNClqikPUYSEAMR8bfW?=
 =?us-ascii?Q?Chr7QWjyKR3fFhecyiG5ZEtnP14LnIA4NlZofGCZjf3HVN0WUGOhzBhBeHcb?=
 =?us-ascii?Q?Z1q+F68G6JO9Pg6Oj0yJ39j5lEskkWs=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 23311936-7040-4c0e-5d74-08da1177d634
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 11:32:41.9976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uzS6x/DBuV2cKlulbtxwl9qSFvLM4SHxdmzURVQmxNKlPGaUaVcyW3IixH803JM7EYt5O6nfUDigC8e9RHi9hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6765
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Mar 2022 11:32:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96257

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

 meta-oe/recipes-support/openldap/openldap_2.5.9.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb b/meta-oe/r=
ecipes-support/openldap/openldap_2.5.9.bb
index 541a6238a..5ac5660cd 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
@@ -203,7 +203,8 @@ do_install:append() {
 INITSCRIPT_PACKAGES =3D "${PN}-slapd"
 INITSCRIPT_NAME:${PN}-slapd =3D "openldap"
 INITSCRIPT_PARAMS:${PN}-slapd =3D "defaults"
-SYSTEMD_SERVICE:${PN}-slapd =3D "hostapd.service"
+SYSTEMD_PACKAGES =3D "${PN}-slapd"
+SYSTEMD_SERVICE:${PN}-slapd =3D "slapd.service"
 SYSTEMD_AUTO_ENABLE:${PN}-slapd ?=3D "disable"
=20
 PACKAGES_DYNAMIC +=3D "^${PN}-backends.* ^${PN}-backend-.*"
--=20
2.30.2


