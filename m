Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.80])
 by mx.groups.io with SMTP id smtpd.web09.7093.1616936654511417263
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 06:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=KvuFW7id;
 spf=pass (domain: kpit.com, ip: 40.107.138.80, mailfrom: neetika.singh@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXj0hjDuh67AJcdwH6VtRwdECpBVYiflsR4mWj5zHuhgLU86vbC05gYi68t0G3YwCzkZwG8gOJam4DXW79ISp82w+rVLcXjNMOmEQ+8vDeY6DXuiBJSesPyVvdqLXq54fffJTUxCnxcBM6KHvgh5srzqmi54hFYGeikM9sei8z0bfSMA0+cpey+ojD3rzEMV0XEI/J+rHJ0DU5YtTS+0nbzAA6DRfGsv3ztxl+1TocWCxuBZoKeWKqZ6N4jqgx2Cp08DaPJiGszqv2qkNl+KkFbQ4cmnchh8doBswvxQgCJAp066B50QIcqkbcjDzjGFky4/iLhPVbeToDXrJXR3mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/yZa3xfWjXy8bG7rVqMbWyJNlQxrP2zOV/db4jH/L8=;
 b=RynxRqwPaXixAAVa0ijJNSveLlcc0epASbQM6pBlj3UrScnYzWNCOPO+RD2bZNe5Ks0dBZIlyMwX/fOJxCp01stkvl/AT9WknXW8ygD8ILAS7rdudcznjRf/DcWTkfRzYXtAuSi8nJhz2oU3z1aKM5wXbUrsVNjnnjKjiv0o9aEtvoIlU3fjjnzKq1Ese/KLAaA17qWN5WjpN4Wtvw0qoqtocb5ED6CEfnQM7XY9+zn7MF0IRNutW9pSyDm30tJKUjoV07cNbU5dsD5nf0SiN8tZGaD2DsCSM/1q4hKEVyNmFB8hcgWAbfjP3Ghda5Y+E9/w5jdcyhX+mk2YrfhNFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/yZa3xfWjXy8bG7rVqMbWyJNlQxrP2zOV/db4jH/L8=;
 b=KvuFW7id3jWdlANBYvJdOfcEyDVtoU6ooSGYGXgzB2RdrTNlvbZyBxNfuhJVeKSRfiUAouU2/2RiT6/3QWScVcw40ytp5yXWN6z37RszZ1Va/qGljbw5dDppOZxh1rq94JlhRAA4XgYr6kO197fKcdqWFEsjGJfu3o/LOpFwfrk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:31::19)
 by BMXPR01MB2646.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:31::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Sun, 28 Mar
 2021 13:04:06 +0000
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b121:9236:e213:20b7]) by BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b121:9236:e213:20b7%5]) with mapi id 15.20.3977.033; Sun, 28 Mar 2021
 13:04:06 +0000
From: "Neetika.Singh" <Neetika.Singh@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Neetika Singh <Neetika.Singh@kpit.com>
Subject: [meta-oe][master][PATCH] libcroco: Add fix for CVE-2020-12825
Date: Sun, 28 Mar 2021 18:33:55 +0530
Message-Id: <1616936635-30281-1-git-send-email-Neetika.Singh@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4053:2e83:3ab9:7daf:a153:a495:7080]
X-ClientProxiedBy: BM1PR01CA0143.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::13) To BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:31::19)
Return-Path: Neetika.Singh@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4053:2e83:3ab9:7daf:a153:a495:7080) by BM1PR01CA0143.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:68::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.24 via Frontend Transport; Sun, 28 Mar 2021 13:04:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 60b22509-416d-40c0-220e-08d8f1e9f7b6
X-MS-TrafficTypeDiagnostic: BMXPR01MB2646:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB2646DB7BA16C2D7B26EE11349F7F9@BMXPR01MB2646.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gMF/5eQ7mmRMKZ5NXbFfuuZBp8K00GhW/n8GCTGI3ALKvCs+qSNmLiCaFVHowi6a/fBStI4cEXSe5LGku4kpW0iFisHxF8TkIiebgV1iidgVYJLROxWhs7SoIyzC8O9HLqlu6Cqyp2W90cRKnsPfK1YFNXCUSW7zykCkYxvg8UFI098yBiVQDY7V23U79ALtgr+DChK6AZ984DHn0kEXp5cTU/fWgZyrhajunFuo6utDB6D9vX6H19PgvgCc0XuNnsmjM1gQft10VLLsj8dXuf2ryxyU6PhYlkiDqlIr9vO09MnvpddQ+ngISfUOgikLYRpfLe2fEhOc3NVR7pQ7Un/fSam9FolugSOHWYSQwddhcLK9His3XRIQA1PBUiKxATByXLYb3B2LlXym2AN5Q6P28k52cv0dZtu5TsNwL4RdtiySyWG4gbCm9/ns3/KFSmHo6rWQCyN5Az4DdKobo1fiQcqJBAeMHQxVfVUpInNr7FsT6v66fbhe6iSDmiEPcWmMcOrtFFISucEnwLecEeFK+ZQ0PVv6QQzTmxbKS0sN+mXgTnqpqz+6tnM2kdq8xVtnGrRGNCv6ze9kYsNLzFASm3dZ/pbkpYED9M+nlhZwmhfXYSnpczXV4v4C1D1oHanaAoI15dTwaTvOxRNCsGx4KiA9nufKT2nFTLiTQem4GUOcuHb5SGXeA0NKtBe2HMhrj80B5/p3o2e4cJJJko5uGaashl59yZursYnUTpGU3VbnXzDaqPC5yWIetHm84qcabNuwfy8n5rihQezy9A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(39850400004)(136003)(346002)(36756003)(2616005)(69590400012)(66476007)(66946007)(52116002)(8676002)(66556008)(6666004)(8936002)(107886003)(16526019)(66574015)(316002)(38100700001)(83380400001)(6512007)(478600001)(4326008)(966005)(186003)(86362001)(6506007)(2906002)(6486002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?IXZs3szm+6a3aW4gAfbExhDza+XoDBp81InOi1YVV/gJuMq5+v3XNQNrGYU9?=
 =?us-ascii?Q?dYB7DoubXEIF+YtAA667JZTbdvX95+VK9W5nWHmqUSmRk1bVcWQp7eKsSgTT?=
 =?us-ascii?Q?dcr8sN+wr63CH/ADiSeyW3JTTVjt1egVJMlpD3oERRgqgExjWmFybEKEw07g?=
 =?us-ascii?Q?oK5f1DGKUV5Otxei9ganApPTMEKMuuupn3SFmOe9+DESWihJteYFqUq2eDPr?=
 =?us-ascii?Q?7fGFZpYH8r6WOFpKTAwe3b+eO1PbybxmABmYKF5mFaG/hy72K1SQrXOi8Q2s?=
 =?us-ascii?Q?jrE75i5Z3KDO2q3r+XlpfN8aDTq5yiYewQHFTyv5udlKI7km/l6J8ER9ViEY?=
 =?us-ascii?Q?bqsf7dv7umVlTxzJQGGbt+cS9dU5m7Ot6dVVwr1wBEkhXxvJg8OIluH2IYri?=
 =?us-ascii?Q?HFtf5QbVoJNmMod5XsWWvqdwjMfkC2tmIHX87ZLSQCYOKMrftDtcsyvkMStB?=
 =?us-ascii?Q?77hWziTabMxQKzmAM185YoZDfWc7K99bcSAAxubq5amEAqeXKqCA6LOS5w1W?=
 =?us-ascii?Q?VulZPpyh4MtidbHEtqONnmp3k7GXH6IwhS7xhSpYSlW6hK75rgdO0cKr2gIK?=
 =?us-ascii?Q?/QxeRcQr1F3Avezm/bMAqFekXwgUvWzr2fifwixvBeWLJgxSGebyda47SRCu?=
 =?us-ascii?Q?WUMagU7x9Dgya/facP0vGI4gvcIL4fT6i17HGIr1f+/LVG0Uwh8zXWH3AEMC?=
 =?us-ascii?Q?iwmB35lsynVSe4vxtROwc6+ce9EG5iwN7N6XlVCI64900yuDDaSQkFBx+9k6?=
 =?us-ascii?Q?PjKvqF9SyA4AiHx8+MY21XT8b7IR2nW7MOA8mXwD8Rc/9CJk8WuEnVEm2aft?=
 =?us-ascii?Q?YDGbKxyOE+3nQOfEuT/IUmCWPT5GG4zJR/vJUPZgfxjCuS5S6FeJuk3rI83/?=
 =?us-ascii?Q?C9eZt/b6oC+Gkr2zAz8W6kQixVVZTnoTM0IAiSKLlgTJQDM8cJVedbpZfyku?=
 =?us-ascii?Q?/Uch05ncmLDqZByPzXxIzgupC+5pkBB/+OQeu4gJAaClMio8XDUVgdaxsBMs?=
 =?us-ascii?Q?MRVaPAMSLGPIqKcfYSoF3tJTOVaWnFw3ZVQX299J0eXeOim6LlR7ErigPhZW?=
 =?us-ascii?Q?eYzdmPTIm8Q8vrSglLSwAXhZWbyDCh7xpzqMu2NoOaahY8B1kLgLw1yGfEBf?=
 =?us-ascii?Q?PoIH0P2Vg9LeBuA8veitCWPqRz0GaET+udOXd9w/9xCkPajQ+DpPgBmfnUKJ?=
 =?us-ascii?Q?Xq1y11MheKMnX4uXj/GnWpF46QrI9IPjoExcIQ1quZtRLanm4efLJ/ixsLli?=
 =?us-ascii?Q?Nt40G+ojnGbBaV5SyxS8bvbQSwwM4oWZdhGEKK4LEmcZxwbkHcC/L1S66rqA?=
 =?us-ascii?Q?86w/V83PRcPS2VJEVFBGWlYqMaR/LDdkV/jsfnfzXDCVUPgCj0X4H6CEWZ9K?=
 =?us-ascii?Q?E0VGP3sRvcxgyZJ9SSDU7cet1Wj8?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b22509-416d-40c0-220e-08d8f1e9f7b6
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2021 13:04:06.1186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sRkFancCK10Xa/T9AerF04lK0JHWIIz0q1xnsMlWpsORA+b4vEav5zeTPJYgVq8pf062DDMCJ0Op1TayG1kBYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2646
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
 meta/recipes-support/libcroco/libcroco_0.6.13.bb   |  22 +++
 2 files changed, 212 insertions(+)
 create mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2020-12825.p=
atch
 create mode 100644 meta/recipes-support/libcroco/libcroco_0.6.13.bb

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
new file mode 100644
index 0000000..fd5927e
--- /dev/null
+++ b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
@@ -0,0 +1,22 @@
+SUMMARY =3D "Cascading Style Sheet (CSS) parsing and manipulation toolkit"
+HOMEPAGE =3D "http://www.gnome.org/"
+BUGTRACKER =3D "https://bugzilla.gnome.org/"
+
+LICENSE =3D "LGPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc60=
5 \
+                    file://src/cr-rgb.c;endline=3D22;md5=3D31d5f0944d556c8=
589d04ea6055fcc66 \
+                    file://tests/cr-test-utils.c;endline=3D21;md5=3D2382c2=
7934cae1d3792fcb17a6142c4e"
+
+SECTION =3D "x11/utils"
+DEPENDS =3D "glib-2.0 libxml2 zlib"
+BBCLASSEXTEND =3D "native nativesdk"
+EXTRA_OECONF +=3D "--enable-Bsymbolic=3Dauto"
+
+BINCONFIG =3D "${bindir}/croco-0.6-config"
+
+inherit gnomebase gtk-doc binconfig-disabled
+
+SRC_URI +=3D "file://CVE-2020-12825.patch"
+
+SRC_URI[archive.md5sum] =3D "c80c5a8385011a0260dce6bd0da93dce"
+SRC_URI[archive.sha256sum] =3D "767ec234ae7aa684695b3a735548224888132e063f=
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
