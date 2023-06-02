Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B128FC7EE2E
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 13:58:08 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.68])
 by mx.groups.io with SMTP id smtpd.web11.13814.1685714282277320489
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Jun 2023 06:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=qzQ1M5On;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.6.68, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K99zOGaUYiqxAUSJYcU9RsmsXlnZyk5t9HRnGY47wTA/JzAzq8T5AxNfG2RxLbYSCTl9yLB8hIVu14b68ViVuwSXe7otxSfWvQ+T7DtziPfRsWuynuiqE+W1PaIfv6Yk8+o2Tb15k8YwQyHWATyzb4VbWYxTsS8Y9i5YEqgOM3vUWUBh70TYvX1/63w5G8jcvAfCu+W7XbnGpNSZ2Y/eHKCDK0q2FlDycSQFTyHN1xMIkHlg/bSheXR+PzVTEZXuFB1W7gb/kVX12dfpg/A3vwCP8W9ENbwiWlKEoylFj2C09MxV94MUV6k1LrI7XcqXepYctsT7OMCCv3g+4t/Vbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MytzJdgW8SUt2fTLHhJP3ePSnS1WOPl7uCy///FVOFg=;
 b=WRWa9jEeZW+amhP8ywdLMtNwiVTj0x2gIudeMJnCRJbZsLFpOtyPx3l7+MUCe1wD7WudJcCUVFkX+Ggx2sZWNYHm7RvJkDt5ep8OnSjeDE7BpPJrcdB6HOrCrA+ioaCRZei6HdUICASfvS87T/w3q2wxbt3Sokhz/sQviwNGeF9AegjFfMo3kZCRfv5CTu6yti2zF1FJdvI7/WyufUFhQv17jxPYYXz/wtXfV9lLLuVrEgp5wSc6BXUFddLL/TVvI/iO99/reFMzOSy8D3Uy+kYWBw34iYE2GesLTR4MJFkVOHoTQEN8juHU1+JsqwismZgBgiPzKpzSnoIgUxs+vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MytzJdgW8SUt2fTLHhJP3ePSnS1WOPl7uCy///FVOFg=;
 b=qzQ1M5OnXfVaiMqX/EbS6zfkHqEiFuBBBnEKmQe4EHonc51kE8C1yAjMBOP1D0uIzoFQraRPz+dYKnGqRMh1Bntks/tyvp7uq0ze3SV45O5ShyAzSigouA0KdlXqbFWi1mwn+xsxoCbXZ7lQZtY4cz6Ez+O4dmq/gKZ7czkwOh/ZM5LFZLPOSxmEy69a2Ra83xVkVC/LC+ZQ13qEAQ4ibu/Uy+AbxbuWPRYME00U9xJseJh6+KZPpwGOdmTLRQYn7pfNtZtDXPslXPwlEQ8q+164GnmgTQgxxdnbOp1Y1taKP93OpyiWv+L7dsJwgTnLp6H/mIM7v5URHLeqBaVUtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB9PR06MB8559.eurprd06.prod.outlook.com (2603:10a6:10:369::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.26; Fri, 2 Jun
 2023 13:57:58 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::9b07:4b2e:9949:63cd]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::9b07:4b2e:9949:63cd%5]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 13:57:58 +0000
From: niko.mauno@vaisala.com
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 1/2] contrib: oe-stylize: Fix ambiguous variable names
Date: Fri,  2 Jun 2023 13:57:36 +0000
Message-ID: <20230602135737.3833492-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0094.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::7)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB9PR06MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: d7e4b377-04b2-4f99-3043-08db63715f75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9E9OrppIJ1+k+bV6WjGstI02HABudtzLIsuqginVDB2hOnNaDEOX0f8O18ngzqGC/ChGxkv/RheCUiIFBUGT/ipfJQ1GCm0iWQTVnYJUe9GZ8CU9RApLelhY6OVxG4IwlCmWRvDUWlasHkN1sCr/z6YsbCwINODmw5N8lTtwFwPGoek86aPwD2AnywSSRvO4/WxKyC0rF+39MWbtERtClK+GzN3FgfyvgKTA59TmJSlca23cGZmOY374RUycuQlcmyDILzf4G226gv/Rq5dp0J+kQatRo7jT5TL2/HQLy02MpQFDipUvTa90rX9Fg3EKD1/rWhFIggEziZWOXkAHaxdtDOeNLmciVAZ8+8pp3w5CsP57Qme+ZGcIgEBR5T+sFmf7QJAHT64cBdny/FoskSbc49mOLYvbXpkUSgHCRWpjYu7iwKOW8XXoE4YawND6AN9rZhxUfCYrOZid3rWhNzlKDtnFdcUkedBuOes5bXCJf2UHZxEq3fP5zFh8EZ/Wvi22LZloDJllDRimB7luJa5u9Hum2r8N6UcjwXq37+dNLxj39ek5jQ7MMW49vsWW7XQEgrQTDQ94pxVH19t5vDdk5mjJbRCTFk7bg4X3eNbmzB6efRC7Jyz+H42Bc5E8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(451199021)(66946007)(83380400001)(4326008)(36756003)(41300700001)(38100700002)(38350700002)(316002)(6506007)(1076003)(6666004)(52116002)(9686003)(6916009)(6512007)(26005)(107886003)(6486002)(66556008)(66476007)(2906002)(8676002)(8936002)(5660300002)(2616005)(478600001)(86362001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Jwg/LJ0I/2Gc3BMp9j19V6Dk4XMll1TCTYR9KREpEfbEUZtY9btZY1EusfK1?=
 =?us-ascii?Q?UgB6icFNu9y2ASXROGbtbdt1Y8+k0lVNzEDaCvl2J1R0rwQcukIOCGMCubVm?=
 =?us-ascii?Q?UnUFQFAzQMt3NzLqI1QlhAiW6UY7qk/ePSNQiY9ru41chbaruYm6eFapPQCQ?=
 =?us-ascii?Q?r/aChavCq1PLE8OyoWdtQhBGRRRPTX3pO/NfolTdsNNDp0z7iIv2EazJjdas?=
 =?us-ascii?Q?tpPlFTWXHIDSGg8iDHfxsn/f46iQloUrNmXN1JyNPFJmAbuwkp3R8kNEXVou?=
 =?us-ascii?Q?dlhDYDGVEb+trwP76aWhbtqbi5S9udXEfgmmDyr9jNUjDlUGMF08ViPjZS8A?=
 =?us-ascii?Q?YilEKmguRUjBfEB7Sr24UZRqjkdeDkwCUPc3D/Vud8wMwbodYwaxJx2w6Sm0?=
 =?us-ascii?Q?2n+ZqQsK1KhWUaxGxgFLHji3y/XJ9o1/kEfX4G+oJtVHQiBMQpZstRDslyWj?=
 =?us-ascii?Q?FD66jTnUkaU5SlGkKsv43Ul+Ls8Qo2BH+vMcSHIuYDRtekixQbDf7Cu+zL5A?=
 =?us-ascii?Q?NpLdx89/oI6/otOnPEmCPvvDwh2Y1ZJ8FHEvT1ey61eRSUIAqb2YuOfTdgDJ?=
 =?us-ascii?Q?KC59vx7aon1mup3oc4kkYXdBTnqGXTOX2xC7N1Am9LkcAALxU7mmORRBM3Wz?=
 =?us-ascii?Q?m3FT53Y2pOwfrXIQmoR++7xeajTJwIu7SUzb2Ly/5FaMuJnkLo6NbjFKGz5K?=
 =?us-ascii?Q?LfRnMtPSy5lgQdB5Kzvu4YlSVjrNrL/XQVCDoiFjPYzX2oV3k5kpcyQLJcDu?=
 =?us-ascii?Q?EXoYBNl9j+l/FGzLq0ARnU108ufYi8E2itKLFV6WMqbI9rFJCzJbFIHPf7Su?=
 =?us-ascii?Q?C5wVkoNi8wf4nwBh+5DHuvEoB30a6QuUCZtrfKmwUEiJZt6Emy7PNQE2c5OJ?=
 =?us-ascii?Q?5NxCH7hVyKMIl+yKrnGymbK47LN1U1y8uWjXLu9v1jb54QkRnA8EG95CQUxn?=
 =?us-ascii?Q?cgltKRvmrqIcHS3naXtroKJr65JvxQjUFpLTb2xs1W1dqkO4mwYLY3+/1HHd?=
 =?us-ascii?Q?81eVzTvI99f5jMQiNSQk6dpX3kNt59Vxy2JXvSFb7cenvzSyzczSYdQZIi7n?=
 =?us-ascii?Q?7UoG8YLFiCbn6i+ZvE4ou1RCBBTQq7rT2GZTsAjUMlJscKM1oD7Nt3g2LUoI?=
 =?us-ascii?Q?tkAmemQM6FNC3Ndg+OqsoPrlSUmp0A+uJyhUzWxIx4JZpr193mKgNlXe+CWs?=
 =?us-ascii?Q?Ca/5pQwO/kkGRGN6Xtw4vRhfDFq/4BTwJy0QH9yvwga8IY+Xl4gUIRFQyC+n?=
 =?us-ascii?Q?K1Y8RhT2RDOlXkUN/OVbu8paioDX0D4m75WLqGS+lcuxWoxkAGnhdrH088vX?=
 =?us-ascii?Q?UBYzcFJrDT7Q+k3oul85PjXSiyMTlnlqQhVSJ5Tf0IxuDFEW6inU0Un2sqLh?=
 =?us-ascii?Q?yRIjJKGpT841bgtSEm1izEGB5jxbj6O2wGOIpMOn5TaTLYi2VlXFVu1APm1b?=
 =?us-ascii?Q?h9UlOm3dF14Nwh/gZaycTyz7GIR9YXLxrbqqV8bAN/KlFkqvjbRS/vLUYlUG?=
 =?us-ascii?Q?C7ZMwz7EnlQnZmXjqi+7u9d1Xls0PgciPLWB3JelXYIaxeUOrO9OzOUw+b6t?=
 =?us-ascii?Q?q5YcSs8oMav+9vl8raCn+PhavGa+2kfCzP3l/1zfO2sA23jwTrKqoqOK7zIB?=
 =?us-ascii?Q?FA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e4b377-04b2-4f99-3043-08db63715f75
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 13:57:58.8211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cChFauWQo7whh5nBIK8flZEswt/kGvyTSlR51EiTsLrnMI1Cn0UDSQasCOkKakGZMVufvqcoplWG8VLZ23wgiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8559
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Jun 2023 13:58:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103098

From: Niko Mauno <niko.mauno@vaisala.com>

Fix pycodestyle warnings:

  oe-stylize.py:439:9: E741 ambiguous variable name 'l'
  oe-stylize.py:449:17: E741 ambiguous variable name 'l'

by switching iterator variables to non-ambiguous characters.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 contrib/oe-stylize.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
index 30b460e12..1ef6391b6 100755
--- a/contrib/oe-stylize.py
+++ b/contrib/oe-stylize.py
@@ -436,8 +436,8 @@ if __name__ =3D=3D "__main__":
     # -- dump the sanitized .bb file --
     addEmptyLine =3D False
     # write comments that are not related to variables nor routines
-    for l in commentBloc:
-        olines.append(l)
+    for c in commentBloc:
+        olines.append(c)
     # write variables and routines
     previourVarPrefix =3D "unknown"
     for k in OE_vars:
@@ -446,8 +446,8 @@ if __name__ =3D=3D "__main__":
         if seen_vars[k] !=3D []:
             if addEmptyLine and not k.startswith(previourVarPrefix):
                 olines.append("")
-            for l in seen_vars[k]:
-                olines.append(l)
+            for s in seen_vars[k]:
+                olines.append(s)
             previourVarPrefix =3D k.split('_')[0] =3D=3D '' and "unknown" =
or k.split('_')[0]
     for line in olines:
         print(line)
--=20
2.39.2


