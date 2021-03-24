Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.49])
 by mx.groups.io with SMTP id smtpd.web11.330.1616606017187576238
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 10:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=SGBU873R;
 spf=pass (domain: kpit.com, ip: 40.107.139.49, mailfrom: neetika.singh@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWmGNdXfJFEBAxYf8nOvxaXqZ1AdoOGjrYVHAtxqLC5tvvZXXVTMlKIrPeQwZ7laowidcAmweNVnKOMCtjP5ZWHvqvKwbheQ1nuj2k7jJqfJvG2qrjHITeFT7Jw2gbJ3oJflAnlNGQMhodtK6qpIRI1veWn/yG3HPbAk4B7evouxkEyLGDeFwOuQnreHu+1mOQ1ty3fCd0F4eJJhjpOyX2z+7D0nFPc+35begWt3zLj3RZKu0bR+sg9W7X898hK+fwSEfJU8PMSlyuN399/4S16u+gtbMOIDHJZDgwxJWwc9DnGy0HGX8N+vALFEROMoEkDRQjc+GaxDW9QVbdsnuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xBGO6A2IYI+cTxLurS8Xvojng/gbwKioNeKlk5yJtU=;
 b=ih/K7QjuD7Er0Ti3z90jPychA3N0L1c135mfNsb3AUAA2sAu/DQs4IF8rNEB8ciy1+ITlWnEMLUYSvbzt7wkilHi6URmI37LkxvhZrWTB8NfDmGeAI1Ff6FgQWHkLMn9Z3IiOgjvTp69UL77HjEzQfZ6osL86QcXQC4UbecBVFNwvJM/R0ZJU80d8qEcqQRKdF9DANYMjB0D1QcDIyaDDl+UHtYXsjIvjm5lioti/Y+hK3w4cXY04j2ty0j4QhSQ7V0iEJ1/5yDF0PQrdYRDMSwhnSiQi6SAfzZDLtQ9JG+4SUJcBaXm9lV7XkuU+RvMjckRuiSnygAmZSPgKMcbTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xBGO6A2IYI+cTxLurS8Xvojng/gbwKioNeKlk5yJtU=;
 b=SGBU873R/AftB6a7Fz72c7T9OYcE6XpPbhwJrQcUqeGLEkWq6SkASOFIIQwZRNw14RS8oh+CqARsSbYale1bwInS9lGIGEgcStKgy3X2IjyaNaDaI7enDoImkSlOijRezVbo82CK5cyN1OI79amA4cVtMzBMtQXNOdksnjOmf/w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:31::19)
 by BM1PR01MB2721.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:4d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 17:13:28 +0000
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a05c:dcaa:1ba4:f108]) by BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a05c:dcaa:1ba4:f108%6]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 17:13:28 +0000
From: "Neetika.Singh" <Neetika.Singh@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	"Neetika.Singh" <Neetika.Singh@partner.bmw.de>
Subject: [meta-oe][dunfell][PATCH] libcroco: Add fix for CVE-2020-12825
Date: Wed, 24 Mar 2021 22:43:15 +0530
Message-Id: <1616605995-16557-1-git-send-email-Neetika.Singh@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [117.222.183.78]
X-ClientProxiedBy: MAXPR0101CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:c::18) To BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:31::19)
Return-Path: Neetika.Singh@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (117.222.183.78) by MAXPR0101CA0008.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:c::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.25 via Frontend Transport; Wed, 24 Mar 2021 17:13:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: afe12f03-0168-488f-9797-08d8eee82407
X-MS-TrafficTypeDiagnostic: BM1PR01MB2721:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB27215E8DB285C312C675F8CA9F639@BM1PR01MB2721.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ftOqzlBi6EF+3mJzTBpe83yeThorn/X+ML2qON2NDwlWKPab4qqw1vkQ8PpQ4dghMpZsVRcg8RIbR2rQAFtLcGw9UZrtlu7tI0bfDTfwa7AWowC8Vcnjqv+Q8eMEODRa+51+eEn8FQhXVOzlmTUaj7CJS69fWrMdoE3j+4retqGWPWhQp56a18o0LF/0Pfm4UlgoIZlqzlPdxlQj/+lC7uXNQSlYMF3j9TXD3/k6Uy2uJZfDBPVq36CKDe4liefTxLyHDOzCjGYXSTgFcPJqXTRvj068vUDB2urgpuU3iMCWK1pjr344eK7zg7ct7A63Hu7sEW9MG1hUaZZG/E8rriiCDkp9YboCIsXavtIcz5JMeRCEqWbLhk0k41D2o8RkGu5Svia41/a5N665PlIdL7/RG0J/fFdJxpYdQeUtKoThKpeqkMu6uvdZ/1Vs0Oo1pWrF5feLUIKDWhBruUeM/Lt+JTOZtc0rmjcKqLasUUcfQlSTVRADv6lWtuCOA+Cbo2i/OlV3uWo0joQxRU/FDDz0s8W5pc+AfKMEFmQ4ltWKKqxXyqNjAAIngu0vGsrYiYOfmhZJBUbOEqWUSi2SlG/DB199tYEKl0rhyIBn/RZFhhzUKRkPMIFGNl1C/ZTgKGG6F7jgsHipiXccdda/FTBrIk0mry4oZyQ1VVvjVJyVDDyHu0GxnizYM9x4cmp+3kLCwz2ONGFauozz+UMnDLFtsuGal7UUyPKDyzAni1gQpSWfyVoOJBOETmlSLaNLjwb3kyRaaVevRIBQtj6AQA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39850400004)(36756003)(66556008)(6486002)(66574015)(8936002)(66946007)(66476007)(6506007)(8676002)(186003)(26005)(6512007)(16526019)(6666004)(2906002)(316002)(52116002)(38100700001)(86362001)(4326008)(478600001)(5660300002)(69590400012)(956004)(83380400001)(2616005)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?XMrLew47jH4VZvsD6VS2OGAg4Xcjw/4JR0KDazfs70PuHFmu45pY/nuQEzM6?=
 =?us-ascii?Q?W/KVsS2WWSVSbShQX5Elm7G18OrrY6p81/1U6mMD1mR3m4DD8R8HC7SHFQxI?=
 =?us-ascii?Q?QgDEuKU6Lzi9mxJBTx4w4WqiBLB/qSEMsO1HT28AFg9MH9Tk2QxJkBtOjw4I?=
 =?us-ascii?Q?QlL0BjKNspCrYONgZgp5pksLEiPgDKNyT0Vu9vsAXh9q4Cd3FgbkAWdLDGcY?=
 =?us-ascii?Q?rMTxtLpEL2ZUY5tIAombGlZK7OG1UhB481u/SeqVDSXVFBW+nzol5h3bsB0Y?=
 =?us-ascii?Q?GbAoeT17q45hNSQ8K55xqo0QlzrM2L9IlGRELKE/YHTf8SCBRukdz+1JzZhM?=
 =?us-ascii?Q?1gvwRMPH5auklssJsxSg8prxUBfUsM46st4OKmKf0etTjZUQwkpKlwrbJtgj?=
 =?us-ascii?Q?huQgktr5B957mhF/D7mll0c4dk3jGGQ2osr1Y8o9V8pxFUqEwbqz6BGZCAdY?=
 =?us-ascii?Q?k9vXLBkDGZm79rmK7F1Mo4h5+bTwSpf5BimIOefux4f/oLSjIaPxcbr5v/LY?=
 =?us-ascii?Q?PB2LHGGtUzlDRSPuLexYpRrAjGw15hLS5q9Cm+D+e/X2J7FeEK9VjVwffWxd?=
 =?us-ascii?Q?g9Plk4lZgprdQbk7fCzVtDnqy+aGH5mN8YNiUAA1Qg0OIYx7MSKPxH/sO+Sr?=
 =?us-ascii?Q?VPWFHb7NGDU2xLSLu2ffnXounf6rTkJjPgSShT+nxYC8y8JjrUEA5q4gr1kH?=
 =?us-ascii?Q?hQyO0sKrfYZZ0v2ZP+3w5vj57OFGFbnpepY5H4ynsWN5Jwv1V5KUS9GMOeJS?=
 =?us-ascii?Q?q5mzHIOyqBdKkbAKKzSGXCh4nVyv7KlC8/lLahG7TTBYrLfs4RF3nzd9+q8I?=
 =?us-ascii?Q?5ysD4dpnawr7tyv8EPSt9c0H3ejdmhcw18VE6mybIa3bjjEh3CIWfaooLPhr?=
 =?us-ascii?Q?op57VtAuQUX03eTBbomOqZGSc7Rja1kYjGN+UBmuHlGIPJXDDlsvFtg6O73A?=
 =?us-ascii?Q?BvAxbOUInE1Mn/AYAohlySHKfvdElBlijL/NiJSzcnB7yrm8kB7SJqwb55IU?=
 =?us-ascii?Q?XWvBkndFgtdfXqfT9cNb60kEZcZvmMVErCkiIyHHTzKBzSwq/QyyDYNCpiWX?=
 =?us-ascii?Q?rQv0XyItXxkzsgAGerMFo7NEC4lmIouTl9e/q5BeFUJRPCyA2uQZqSZXh6/b?=
 =?us-ascii?Q?dSAbLkVr7TWstjBwuTZtcGRiB+pahj5bJWyKLs43MBq9mvCzUOih6aEgCzBA?=
 =?us-ascii?Q?My21qGbcmyYX+xeliyOcV/5qIeOEpcdhll3PvomS5fcfSp/QiP130hzW1Zjp?=
 =?us-ascii?Q?mZWhu0aD7yyOB9XV5GDrBpgjmOl/O3oJOa1lKPZOT8UyVgOA0xzbuz0I+gUR?=
 =?us-ascii?Q?bcSfkKqaWqUznTDnCs8tNhLv?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afe12f03-0168-488f-9797-08d8eee82407
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 17:13:28.2262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a++GSNj9krUWGMYDpfgOPOZffEef2R4eBFgFegqf7QcPr5Z6WquBQ+JM3aQnIcYHlgeEF3QKUwD8m+qywt2dfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2721
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: "Neetika.Singh" <Neetika.Singh@partner.bmw.de>

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
