Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.50])
 by mx.groups.io with SMTP id smtpd.web09.329.1616607545414507483
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 10:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=ujLXdGMi;
 spf=pass (domain: kpit.com, ip: 40.107.138.50, mailfrom: neetika.singh@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8fWwCg5CgaN1R1zax9eC7Xsst8Yi6NnULhcwRDUZiBc2pk4z4k0wJXxQSACVI28FP3LTXnEk4ICOlzFHKVksRkz4Da+AkfCDACUu0RvnxuhYCyXlmPbj4yLoWA/Yc2S8NJeWr7vLBR1zKqCMW0kKIoYzq7RuSxHg08IWOHoPF23BEucPSJKZnhwmoFEz+ivrLDUdubXwkNJwoxJeH3dWmOwNaFvZ6O/5dCT8tn2Z413r6jTgKPztRLnSMO5r3olHXKLxBGo0pEaTf5UAfX2OL7ft3rL3ySic47asmJKXoNWt2VYNgeVu21gfglmfZlBe3kFKxwjSHR7GtcnNlPgKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=im+a8ylWsubSKRLTp0uX5i551rAEMMKTWSsZ3OnGhKk=;
 b=UCI+rbOw7a8SOdrLMGMr+G2DBg9g2d7Mss/OO1MYRZuZZ5ffWrdxQ7NS3Wc4M34yCx9RDr3uBhNKV6UN32nXJ9rswLC6LT1nxukNNVGn1cqh+qui458nO4TTQqhZVA3ZEAGboYpAODnXeWTiSHODHrbQUCDYdHucbTRjdPrVIk16n2jr7wAZUL6mwQNAnXA7xR0FhGGxrVhN8ExpIgfUoWql0z7vqAT8uUjZFhOeq5YvNzc/GrggKbQqAb+sS020z3M2lAlTSC6qUdP4wCkWvFJcFL/rtbpDzJDkbLqgV082y1/+vcl3JPS4gGxCdQ1uxtv1Mt7axlFbkPjptbzQig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=im+a8ylWsubSKRLTp0uX5i551rAEMMKTWSsZ3OnGhKk=;
 b=ujLXdGMiwgVrUAn57xCuv3rbuOd9vs6tkW9XgWOIWMTmKAW6wUn87Eovxvpg1j+36wP0Bjgnwxq2omDn9r0+A0Vu/cfI6snlqBtwK9+NkJuPsYbPfuywXgMzKDFr2iE1lP0p7mu9P/vTB2UhPFpULoJj/HRpXeo7WzhJmxBOsvo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:31::19)
 by BMXPR01MB4918.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b01:6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 17:38:21 +0000
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a05c:dcaa:1ba4:f108]) by BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a05c:dcaa:1ba4:f108%6]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 17:38:21 +0000
From: "Neetika.Singh" <Neetika.Singh@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Neetika Singh <Neetika.Singh@kpit.com>
Subject: [meta-oe][master][PATCH] libcroco: Add fix for CVE-2020-12825
Date: Wed, 24 Mar 2021 23:08:09 +0530
Message-Id: <1616607489-18742-1-git-send-email-Neetika.Singh@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [117.222.183.78]
X-ClientProxiedBy: BM1PR0101CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::28) To BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:31::19)
Return-Path: Neetika.Singh@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (117.222.183.78) by BM1PR0101CA0066.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:19::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.26 via Frontend Transport; Wed, 24 Mar 2021 17:38:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 456ee3b3-df74-4b46-d17c-08d8eeeb9dd1
X-MS-TrafficTypeDiagnostic: BMXPR01MB4918:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB491813925BA4B75F0E1844B99F639@BMXPR01MB4918.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TqCmmG8MhwDWMKw86Ekh5Cy1eNR1wkVA8yMArOtDE/xk1n+2Xwmlcx3ajvAmRl2cxBxWUk3Kq04vik3k71/rxrMfP2iPN6eJ5Nt3ewmcT1q8WKcZROnYazgBYX9TE/WkQrw33XfhH65ppNCnDKKycOQzR4mgFMKa6OT5zVLZqaafbH45j6Gu9qfEaMxAksYUEnWUEfbwMtsnyqPZBxrJL1RMCF81YQtu2SCjQhI0fzxTTEItFWMSr0+XaMBC3NgMygbPRMLktUguUIxuWIBXJG39D5WsrI+9p0ClmvNYQKA4+oGzjMKuwFm/C0mkz6QvvT5/P4ZclkmsbHa5kKgaQKg2W6XD4Ibl6+TIJldI1DvJhHo7w4g5LjHJvdMpnfN53mA33db6spls28edXSjTulapoeMdkgj9XVDcxCPBCLsvJc5t+bx+PW3EBiczHdmuPXJqle+TNWqbdjSAofsJF13epaUaGhduXnktMmDI5r8Gfu7BlKBd9kSeLNrhDfsGStk7pz4GYvohVqS/uyWvmQOJJE3adPoM4N6OeixyWVjyZ23zYMteuVgX/wn3G7YsmhBYCks/Hn3DvEIHFoNvkLw/qy6Bacq2OGNalUs/gkUYuWTQrnE/8FDwl8gL9i5g4O0no7376FEjs6hzF4VDqlbDHbxtF3TbiP/13tzrWg5X6rIo4Y4qAXR7wL80NULhL7Y/L23araDxwZB4xIk+8uFzzgE8uqs8TebX5nZtY8QGBJQSDGBp7iojSSPdT+yS95t1yRAl4tAyZnrBYWiteA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(376002)(346002)(366004)(5660300002)(186003)(966005)(2906002)(69590400012)(16526019)(8676002)(6666004)(6506007)(66556008)(66476007)(6512007)(38100700001)(6486002)(52116002)(956004)(2616005)(66574015)(8936002)(316002)(478600001)(86362001)(83380400001)(107886003)(26005)(36756003)(66946007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?i9u72w/PT8068loUnHNxmiv+sPkdPGKMDM+Z9yGW1LB1tslTzDLqAaD3UfOK?=
 =?us-ascii?Q?9Hid25UiQ5SKf61rXNL8xTaobIRh7zusYcsVKop05qdSEE0Yi+7j0qZ2sOts?=
 =?us-ascii?Q?OmMb+T6wa6E8vilQgIwpCRoN8VVHKBdR3duM7fvTqYpQuHlhE4xOwwhiC44n?=
 =?us-ascii?Q?1Eba42Mhho3ytQDOUYmgFhGg0M1Ax4wiX/tieKNepk15AUJWZEEYGy3qi1ac?=
 =?us-ascii?Q?EQNm6aS4j+2JOmSk9Q8SweeXIII0X4KpVdcghXpff9hI0uo7cY1jFlbRaySo?=
 =?us-ascii?Q?SnX4fJD+N9SKHnTRTufNAYeIcpY1LWjpC76JsN3wtHJC2skhPmXk1Cx/cxYi?=
 =?us-ascii?Q?1vrfiz33lSRGPPEy1mE4uaa9PJDZCBf/yPOL1etHNZMkJDjvagnW3LFHJT1i?=
 =?us-ascii?Q?y5Y50BUymUoLlHIi+GpWXa6xAqJ4sAsBvFaBjvzqMlP7MM7uzl+W8o6ezkf2?=
 =?us-ascii?Q?5eeazGeDNfksFSs5DC8W1iwos6+GgEl06AP3BPOFzm03ddOSxwYe37v/MC9p?=
 =?us-ascii?Q?d7O8aRSiXsFtSFc6rxgdhbqfnYW+LzevYmchKehA/MdNJLVPSf5/Lf93cWKD?=
 =?us-ascii?Q?+yTpNwrfjwA8K3kN3VScPWlSWEHfWO/D5oMqSPiS1SuLkMFPO5qkiD2rTLQb?=
 =?us-ascii?Q?iMOWIyX3IDw2Wg5aOMkBvYADcoptF7YCOAZZMH6mHJU7y+ds2nzhGm+ASJ6T?=
 =?us-ascii?Q?43RIaU0z+y4raE1Xn8GGNhSR1dpaoi8ZtGAIadued6hAZtsZGwbi2i6DwI9J?=
 =?us-ascii?Q?2ribt+9L1nhrA2aS4TILRdB4UOxKFMEYo464zb4nBGBydfsel09A22Ux0x11?=
 =?us-ascii?Q?UbbibbR8FCeqEu9FAhClwtSvaR2UQzmK3s7oKEoAcowwqcta/4Ay2izyTtoo?=
 =?us-ascii?Q?Ro+PUtCSI0aMonjAdJedMgMlFsHsofJbvmjSJV7WMExuXoie8A8poEm6lZUI?=
 =?us-ascii?Q?KDTnzKYX4xZvbn1F/sOAuYZvwLnFrJMq6lcTgJW8ecpeNJx4qHebz35SWzCQ?=
 =?us-ascii?Q?dWxLWDUDln9kddG9mfjicWdzz4A/KK6+Sr9OZutYV45T6zUcbBFrkw8a397o?=
 =?us-ascii?Q?Lp6HNYb09obE/QWLwV4w/jkRgLH/1Anwpg6R5L2xyi6gDtcBexSgIhQxeKy4?=
 =?us-ascii?Q?mBhFXlaMCeUqPCAd4dY86qMiunGoh3XvohqoMJKk3cysJROnAto+wA1NKf6J?=
 =?us-ascii?Q?6Ov2YBZZqQIu72TfBZvBymxXBr5DyY7vnjCdIiQIWHTLuIpAOkBANviYxYTq?=
 =?us-ascii?Q?L8RdbxNo9SUvbIrZdLFGhKA0hbydbTa1fMAk0K0rU2ZVTtFkQn0GxWhpSC9C?=
 =?us-ascii?Q?umHAknw/LIuRwvTKu8ZTxDMg?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 456ee3b3-df74-4b46-d17c-08d8eeeb9dd1
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 17:38:21.0261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NUJzje2tXgdOrRe0Q+8VpiUGO2e6W4UzhZJeR3vg+RxoxPJL31DwaQtaMnsKHtQlYp5vZR7xvK9qGkxuHtNmEw==
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
