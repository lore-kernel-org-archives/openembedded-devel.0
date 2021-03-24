Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.40])
 by mx.groups.io with SMTP id smtpd.web12.344.1616607577002543119
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 10:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=BU+BgXuF;
 spf=pass (domain: kpit.com, ip: 40.107.138.40, mailfrom: neetika.singh@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKfN0G1FliJEVQX41qVuSJkXkzOeltcPvF5xrTZV7G+gtFsbKIMLwJESeObs7rtZoxBGPK1QJrKZpNQB5d4isjaqCjV9A2gfGa8FXf63SEDJ9/pECtSk2A+XqzFUknePvVkdB9/OjR4CHlIy5yLxaVd2NfdnBxDr+X+/aEOQJRp4udfJdY570OFWIL9wE5Xg+v4T3o2mrrvFyMn/B1dwrA0o47IkVM1bbugMrW/8ZKmwXXlanEWuvWL+QKHByGZ1jfN4MIy74nNr+tQc4TXw5HG3JXotuhGqs0OCy5fciNnHAMAFxD9qLHNJXBfi3WTiEuHQv3dqqX6k4o6IGCsI4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=im+a8ylWsubSKRLTp0uX5i551rAEMMKTWSsZ3OnGhKk=;
 b=PFOTLvk3YPuitvSj5JmbzXisSpSJwNm31UILBPIHMtbg5UDGUqgeYJn+TChoafgzF4ExeAEZ3/aLvcLOQb887Bw61I/NQ1hRatl1BappD2KhFaQxtpCDPwzE2kzaCsG0THVM7iajv/Kkh+4XOnGY1HNwFRStK06oV/pu6ScWgCXnRCd9Kgen1V5ZaT/cpDgmlaYUOSFXroR2LJWWdFaNqm2AW7BC3tFiJIYa5x5b0OugtNvZHxyqriFjEjKtH/A5qjw34Gtd9YcN3o9apQLs6cHbaAXgukKsxFa13Mc2VYRdQq0Xvg76zcDAg3Ul5see9nd2j4yPUlklh5g1UVT4MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=im+a8ylWsubSKRLTp0uX5i551rAEMMKTWSsZ3OnGhKk=;
 b=BU+BgXuF56GDT10JVGv+ICQ63WrFPIIFWJ60mSutFdwK2DlIJlqbKaQzns8EMiEg8vQD8ByrUawTwo4nbX4d0AyH1nwCbuWl7ZHzMBQ0d0UTjMIMMXW4/ul1VANHQ4Hp9Im7Vmy58nVovGFa0CSGp+1kTvb2/z3v2UnjPm6nCI0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:31::19)
 by BMXPR01MB4918.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b01:6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 17:39:13 +0000
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a05c:dcaa:1ba4:f108]) by BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a05c:dcaa:1ba4:f108%6]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 17:39:13 +0000
From: "Neetika.Singh" <Neetika.Singh@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Neetika Singh <Neetika.Singh@kpit.com>
Subject: [meta-oe][gatesgarth][PATCH] libcroco: Add fix for CVE-2020-12825
Date: Wed, 24 Mar 2021 23:09:03 +0530
Message-Id: <1616607543-18872-1-git-send-email-Neetika.Singh@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [117.222.183.78]
X-ClientProxiedBy: MAXPR0101CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::33) To BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:31::19)
Return-Path: Neetika.Singh@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (117.222.183.78) by MAXPR0101CA0071.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.25 via Frontend Transport; Wed, 24 Mar 2021 17:39:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d991857c-198f-48d1-cfed-08d8eeebbd13
X-MS-TrafficTypeDiagnostic: BMXPR01MB4918:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB4918218262A4F55E2F09B43C9F639@BMXPR01MB4918.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NklNPTZ6OQU4liO/ZKKAdAcX5T2MIGLI9SwKT/CA7EThG60KaGH/NqTzele9kisNPIvXGd0Bgi3Pn0zV0rgseAjpyX3oWmRlwfHaF/lkquyRBh/G49BlURbWRSZ4pVtcuMQkgmQn5uR/vO1wUyMFNKZsuMIyxWui/TMpIxETHqNTsp9DmFsfGnlauY3yA+gO7wiCchQiafNdJmtlTz31TpOaaznCCQySckLiaKF/5faOWcpAfDS1YUMS3bMKof8JCiKfxYmbq4H1+tSZSOrFtdhg9pX3tX1kFe1pyP35zHlcSNP5Scn/iNw2NBnNK4pufGx/SU4u0B5CL+7Yl+Kp9SdkrVhJN+L3Pct6RcfGKNAHMP+BS/Q6BFeSvFFR6xMaBAgN0f9RfaMmwCgHLYRr7rwh0uqRzfn6kHJ+e1TI2sUFo9VSJ8dYpOYTFttD3uC+bDk/rvLdbnoNTetGj/s0Cz06prfuEAR5+li0g5j/vWDBiHPHX3O1ZYK36XIIyL9Tx33u2eq7xR5AjvCjs5hSSpROoj6Fj9WbvSDQrBX1GxKuzYyDEYBtKrDmU8F4hMNLqE2E7/fUr6e66QeOT5gh7U9xuFRKr0lZPtX/B6/DRrkmK1kJ17o5/oIzhrAmYdSk+xekBs8Fu/6xtQJMgisSwr+1wr5COVZrpT1xD29PAYFot/qAZ8KybWvzaaU1/HpQHzB9vhSJy214AYIxCLMPAYY9QpAEB1TiqKCuLRYGgCtky2gwq645JLY3ztmd1ohxt9vpMZh/jGLXNAC9EREDig==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(376002)(346002)(366004)(5660300002)(186003)(966005)(2906002)(69590400012)(16526019)(8676002)(6666004)(6506007)(66556008)(66476007)(6512007)(38100700001)(6486002)(52116002)(956004)(2616005)(66574015)(8936002)(316002)(478600001)(86362001)(83380400001)(107886003)(26005)(36756003)(66946007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Spdi/gfyaEA+VKAuaULM5O+DJRvztp4EcDZFVljT/7dNrxBtZT5UwTPspaTU?=
 =?us-ascii?Q?0+t8XyYdswsoTjgditSmhFLV3YXoFHdnjyAgrmtflgNNaBZogkZqsollncwJ?=
 =?us-ascii?Q?yVWuqZUM5mdwgS/dLtA0cbkkzBnu5fa470QbI/JStDpJ9/8vGe+GMTiptBGI?=
 =?us-ascii?Q?4pxn7gN+PPlQgs1i3AQCLo+rC8+vR7vPD8aUyV53ZjPMtis6UDQsLurLYDLH?=
 =?us-ascii?Q?MDdyK48maMrgXNMkr0cNSPdmA/s+xGqfAPgjmF0M/UlYSzM2fYY2ovXvX0w7?=
 =?us-ascii?Q?BMUoCAyefca4TfUXZ8VD3GOOoZA5S2p9hsJJPgmRhlaPIjxrqqMSJt1PUlVJ?=
 =?us-ascii?Q?b+Ej09SVOFKdGZQtYHggpRuQpP3EZsaRodblwrh7jYR9kICiC7W4e5zN1gBo?=
 =?us-ascii?Q?UfMfjhTpcx8k5bEFhzCOMb5nStbqnDncx7+bcc9KoThLLB5um9ZuFlTMcXkw?=
 =?us-ascii?Q?EpGAeefqMRbQzLrXSubQ8Y/l6oj3WOBu/YjFq1zJXn+h1DZxsD0IeDdWp3qO?=
 =?us-ascii?Q?HANojs5OMlfuIo83PCocprVLq6XJjCTJASA/yDVRbIBEiV7JnCQPhi4BJRdE?=
 =?us-ascii?Q?PIxZOsxVAlRF2K7tfwkSctZpLT5EIKT+voptMJmQon/DlU6xKAdUmdGfp2nG?=
 =?us-ascii?Q?RLyFxRqwbY4mmFzU5Is8sju4mMHtNm/ewT2w093+ymYNJhwWNMiaytUxWko7?=
 =?us-ascii?Q?WiSee1n+MhT3pUXJnTiKZ5KqaNgB8zkhD6uDirClqUkQCYNYInsH+iuXv2b7?=
 =?us-ascii?Q?fGn1s2gDNLe5XIx91YGVb/CDJVYGQE392bizxjxXjCcpBt6MNrw2WCc4v6yT?=
 =?us-ascii?Q?VS+VJcJ9qRfPK4X4w8tuF3chYar/AYb1KXaUWIvEVabIPHZ2Sx4DrPoF8S/0?=
 =?us-ascii?Q?BJV9wSgViBCkVW3Gb306eNSEX9vtp1GfncKSYm1qt1L91nNCilnVly2E6A9P?=
 =?us-ascii?Q?VZ+BhWC/8mjIE+h0dkv6WXv3kQvjny85voPXr7UcV7MsOGUOxzVSHMLQ4N0e?=
 =?us-ascii?Q?Fd9AF17SqOVeo3KlL75LoCuQaDaWNNiKqHmzMngRxRDqF8ttsmLlMI4b1XyB?=
 =?us-ascii?Q?5ls0tiJbxVkPVzjWBVkSNhqHCt0fbzx+sk1mSsBPaIH8rKkJyIYt364srg+N?=
 =?us-ascii?Q?HrOIQ7Mrn9Svj5EUuBSwTj4UIAHRq9jAJR0cFU0+/Va1RnfEGkdPcP7bWXMh?=
 =?us-ascii?Q?rDjxkzLvSmkseEVqm4AeSvEoEJ40Y+FX7B/fP8YAch0EaRLQWgdbW9TLnmKb?=
 =?us-ascii?Q?CXsUg24J4D5eGwvaF2IDkIOWa/Gt/ACJNz3oCIO08GzQUkZ8phtXNdAeKMkK?=
 =?us-ascii?Q?meNhSHl6QqWIlAp9dCzVUsp5?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d991857c-198f-48d1-cfed-08d8eeebbd13
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 17:39:13.3530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SeOA5mhXvxP3N9imkJpjZ1TyFXp3ZLGqzz5xAabmQmWcf1W9UY1ep0yaGVzoevgi8ZRtnFXm1XUnEnl1l9zIyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB4918
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Neetika Singh <Neetika.Singh@kpit.com>

Added refreshed patch for CVE issue CVE-2020-12825
Link: https://gitlab.com/inkscape/inkscape/-/commit/203d62efefe6f79080863dd=
a61593003b4c31f25

Signed-off-by: Neetika.Singh <Neetika.Singh@kpit.com>
---
 .../libcroco/libcroco/CVE-2020-12825.patch         | 190 +++++++++++++++++=
++++
 meta/recipes-support/libcroco/libcroco_0.6.13.bb   |   2 +
 2 files changed, 192 insertions(+)
 create mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2020-12825.p=
atch

diff --git a/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch b/=
meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
new file mode 100644
index 0000000..f6c6a55
--- /dev/null
+++ b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
@@ -0,0 +1,190 @@
+From 203d62efefe6f79080863dda61593003b4c31f25 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@gnome.org>
+Date: Thu, 13 Aug 2020 20:03:05 -0500
+Subject: [PATCH] libcroco parser: limit recursion in block and any product=
ions
+
+If we don't have any limits, we can recurse forever and overflow the
+stack.
+
+This is for CVE-2020-12825: Stack overflow in cr_parser_parse_any_core
+in cr-parser.c.
+
+Bug: https://gitlab.gnome.org/Archive/libcroco/-/issues/8
+Patch from https://gitlab.gnome.org/Archive/libcroco/-/merge_requests/5
+
+CVE: CVE-2020-12825
+Upstream Status: Backport [https://gitlab.com/inkscape/inkscape/-/commit/2=
03d62efefe6f79080863dda61593003b4c31f25.patch]
+---
+ src/cr-parser.c | 44 ++++++++++++++++++++-----------
+ 1 file changed, 29 insertions(+), 15 deletions(-)
+
+diff --git a/src/cr-parser.c b/src/cr-parser.c
+index d85e71f0fc..cd7b6ebd4a 100644
+--- a/src/cr-parser.c
++++ b/src/cr-parser.c
+@@ -136,6 +136,8 @@ struct _CRParserPriv {
+
+ #define CHARS_TAB_SIZE 12
+
++#define RECURSIVE_CALLERS_LIMIT 100
++
+ /**
+  * IS_NUM:
+  *@a_char: the char to test.
+@@ -343,9 +345,11 @@ static enum CRStatus cr_parser_parse_selector_core (C=
RParser * a_this);
+
+ static enum CRStatus cr_parser_parse_declaration_core (CRParser * a_this)=
;
+
+-static enum CRStatus cr_parser_parse_any_core (CRParser * a_this);
++static enum CRStatus cr_parser_parse_any_core (CRParser * a_this,
++                                               guint      n_calls);
+
+-static enum CRStatus cr_parser_parse_block_core (CRParser * a_this);
++static enum CRStatus cr_parser_parse_block_core (CRParser * a_this,
++                                                 guint      n_calls);
+
+ static enum CRStatus cr_parser_parse_value_core (CRParser * a_this);
+
+@@ -783,7 +787,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
+         cr_parser_try_to_skip_spaces_and_comments (a_this);
+
+         do {
+-                status =3D cr_parser_parse_any_core (a_this);
++                status =3D cr_parser_parse_any_core (a_this, 0);
+         } while (status =3D=3D CR_OK);
+
+         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr,
+@@ -794,7 +798,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
+                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
+                                       token);
+                 token =3D NULL;
+-                status =3D cr_parser_parse_block_core (a_this);
++                status =3D cr_parser_parse_block_core (a_this, 0);
+                 CHECK_PARSING_STATUS (status,
+                                       FALSE);
+                 goto done;
+@@ -929,11 +933,11 @@ cr_parser_parse_selector_core (CRParser * a_this)
+
+         RECORD_INITIAL_POS (a_this, &init_pos);
+
+-        status =3D cr_parser_parse_any_core (a_this);
++        status =3D cr_parser_parse_any_core (a_this, 0);
+         CHECK_PARSING_STATUS (status, FALSE);
+
+         do {
+-                status =3D cr_parser_parse_any_core (a_this);
++                status =3D cr_parser_parse_any_core (a_this, 0);
+
+         } while (status =3D=3D CR_OK);
+
+@@ -955,10 +959,12 @@ cr_parser_parse_selector_core (CRParser * a_this)
+  *in chapter 4.1 of the css2 spec.
+  *block ::=3D '{' S* [ any | block | ATKEYWORD S* | ';' ]* '}' S*;
+  *@param a_this the current instance of #CRParser.
++ *@param n_calls used to limit recursion depth
+  *FIXME: code this function.
+  */
+ static enum CRStatus
+-cr_parser_parse_block_core (CRParser * a_this)
++cr_parser_parse_block_core (CRParser * a_this,
++                            guint      n_calls)
+ {
+         CRToken *token =3D NULL;
+         CRInputPos init_pos;
+@@ -966,6 +972,9 @@ cr_parser_parse_block_core (CRParser * a_this)
+
+         g_return_val_if_fail (a_this && PRIVATE (a_this), CR_BAD_PARAM_ER=
ROR);
+
++        if (n_calls > RECURSIVE_CALLERS_LIMIT)
++                return CR_ERROR;
++
+         RECORD_INITIAL_POS (a_this, &init_pos);
+
+         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr, &tok=
en);
+@@ -995,13 +1004,13 @@ cr_parser_parse_block_core (CRParser * a_this)
+         } else if (token->type =3D=3D CBO_TK) {
+                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token);
+                 token =3D NULL;
+-                status =3D cr_parser_parse_block_core (a_this);
++                status =3D cr_parser_parse_block_core (a_this, n_calls + =
1);
+                 CHECK_PARSING_STATUS (status, FALSE);
+                 goto parse_block_content;
+         } else {
+                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token);
+                 token =3D NULL;
+-                status =3D cr_parser_parse_any_core (a_this);
++                status =3D cr_parser_parse_any_core (a_this, n_calls + 1)=
;
+                 CHECK_PARSING_STATUS (status, FALSE);
+                 goto parse_block_content;
+         }
+@@ -1108,7 +1117,7 @@ cr_parser_parse_value_core (CRParser * a_this)
+                 status =3D cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
+                                                token);
+                 token =3D NULL;
+-                status =3D cr_parser_parse_block_core (a_this);
++                status =3D cr_parser_parse_block_core (a_this, 0);
+                 CHECK_PARSING_STATUS (status, FALSE);
+                 ref++;
+                 goto continue_parsing;
+@@ -1122,7 +1131,7 @@ cr_parser_parse_value_core (CRParser * a_this)
+                 status =3D cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
+                                                token);
+                 token =3D NULL;
+-                status =3D cr_parser_parse_any_core (a_this);
++                status =3D cr_parser_parse_any_core (a_this, 0);
+                 if (status =3D=3D CR_OK) {
+                         ref++;
+                         goto continue_parsing;
+@@ -1162,10 +1162,12 @@
+  *        | FUNCTION | DASHMATCH | '(' any* ')' | '[' any* ']' ] S*;
+  *
+  *@param a_this the current instance of #CRParser.
++ *@param n_calls used to limit recursion depth
+  *@return CR_OK upon successfull completion, an error code otherwise.
+  */
+ static enum CRStatus
+-cr_parser_parse_any_core (CRParser * a_this)
++cr_parser_parse_any_core (CRParser * a_this,
++                          guint      n_calls)
+ {
+         CRToken *token1 =3D NULL,
+                 *token2 =3D NULL;
+@@ -1173,6 +1184,9 @@ cr_parser_parse_any_core (CRParser * a_this)
+
+         g_return_val_if_fail (a_this, CR_BAD_PARAM_ERROR);
+
++        if (n_calls > RECURSIVE_CALLERS_LIMIT)
++                return CR_ERROR;
++
+         RECORD_INITIAL_POS (a_this, &init_pos);
+
+         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr, &tok=
en1);
+@@ -1211,7 +1225,7 @@ cr_parser_parse_any_core (CRParser * a_this)
+                  *We consider parameter as being an "any*" production.
+                  */
+                 do {
+-                        status =3D cr_parser_parse_any_core (a_this);
++                        status =3D cr_parser_parse_any_core (a_this, n_ca=
lls + 1);
+                 } while (status =3D=3D CR_OK);
+
+                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
+@@ -1236,7 +1250,7 @@ cr_parser_parse_any_core (CRParser * a_this)
+                 }
+
+                 do {
+-                        status =3D cr_parser_parse_any_core (a_this);
++                        status =3D cr_parser_parse_any_core (a_this, n_ca=
lls + 1);
+                 } while (status =3D=3D CR_OK);
+
+                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
+@@ -1264,7 +1278,7 @@ cr_parser_parse_any_core (CRParser * a_this)
+                 }
+
+                 do {
+-                        status =3D cr_parser_parse_any_core (a_this);
++                        status =3D cr_parser_parse_any_core (a_this, n_ca=
lls + 1);
+                 } while (status =3D=3D CR_OK);
+
+                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
+--
+GitLab
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.13.bb b/meta/recipe=
s-support/libcroco/libcroco_0.6.13.bb
index 66ee647..2f61f87 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.13.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
@@ -19,6 +19,8 @@ BINCONFIG =3D "${bindir}/croco-0.6-config"

 inherit gnomebase gtk-doc binconfig-disabled

+SRC_URI +=3D "file://CVE-2020-12825.patch"
+
 SRC_URI[archive.md5sum] =3D "c80c5a8385011a0260dce6bd0da93dce"
 SRC_URI[archive.sha256sum] =3D "767ec234ae7aa684695b3a735548224888132e063f=
92db585759b422570621d4"

--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
