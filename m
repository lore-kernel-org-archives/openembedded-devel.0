Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.52])
 by mx.groups.io with SMTP id smtpd.web11.60.1616606394523933206
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 10:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=fCJdy8LT;
 spf=pass (domain: kpit.com, ip: 40.107.139.52, mailfrom: neetika.singh@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQ9lTX4Fr9iE9zU9A1+/XljNa404LV5BaDO5H985AHT7YXJI4nQ4XakakSjLwkZNqkFy35E7hun/kOsFQ1EeHjsClRAvhzlJWWRnrK4HDz1wvg5Z3ZQptO1KozQPqMxyucnbX0sLt75AWa+MKf3sTexoYRE0e8ngB+4vYznFCFq2OqERNldVGOyT8tP064PER+7ASEJfkE/fnnSZH73/nIR3i5TJG6Wf1sRkWkVWww5wjcl8EMlWD2tUKaZVp/3VPsel+buPCobjoXdXNyIUMqzp9GRfVWr33Fe3sQTCT4YuddyoTUc2j3e/U5ftvAkm010/EwY2CALNKHayfNR//A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xBGO6A2IYI+cTxLurS8Xvojng/gbwKioNeKlk5yJtU=;
 b=MkUhnG93w/BoviMOFXiX7UZDEM1JE1aiS+aYaYxrRTikJDx7AeQbVi5b2Tn1dL1MW8ASPv/hA2ykEM2ze4urPewSTt4tM/d6ruav+Gt4A0tBlWvoqd1AvJopU5M5ICv7eP00a9YfSHDspLjXR7IY/YdU1z/8RTP8KK7wjHVgkZL769LLyypeui+m7lovVUBfEZlCu1kXsQqzom/Wtzohtp5hDyzuz4E6VtqiqNmLx71oyOq8DAow4dz1DCOc05veQ91bs/4/ZA0Lwbgm2HDPRXe52oLpQD1Czo5EYh0vTefSyOj//ak0o4lEi0C/XknW65reIY81gkvNnF0VQnIeAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xBGO6A2IYI+cTxLurS8Xvojng/gbwKioNeKlk5yJtU=;
 b=fCJdy8LTysok0cLtwyYfnzzkaoUGLJuBKVOg7B0f/2zfCyh0rDXSBM11RAINtQzNN9jfJpNeJsID563DwQTEkgF6FIBaj8OrKf41Q+iz2y+sGRHJaZgcgjgp7bUc0yI5JN0vlJdVbPNS7LGgBBnOTbODOVgANJ50qNx13N1+6Js=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:31::19)
 by BM1PR01MB4737.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b01:13::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 17:19:42 +0000
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a05c:dcaa:1ba4:f108]) by BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a05c:dcaa:1ba4:f108%6]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 17:19:41 +0000
From: "Neetika.Singh" <Neetika.Singh@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	"Neetika.Singh" <Neetika.Singh@partner.bmw.de>
Subject: [meta-oe][gatesgarth][PATCH] libcroco: Add fix for CVE-2020-12825
Date: Wed, 24 Mar 2021 22:49:30 +0530
Message-Id: <1616606370-17377-1-git-send-email-Neetika.Singh@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [117.222.183.78]
X-ClientProxiedBy: PN1PR0101CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:d::25) To BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:31::19)
Return-Path: Neetika.Singh@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (117.222.183.78) by PN1PR0101CA0063.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:d::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.25 via Frontend Transport; Wed, 24 Mar 2021 17:19:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9e539748-176c-432d-237a-08d8eee9029f
X-MS-TrafficTypeDiagnostic: BM1PR01MB4737:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB4737AB7BC27EE15007B856CA9F639@BM1PR01MB4737.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CBDewgIEPzQC8BwbSCQ1pMltw5ws9vJO6UHfG7lZITjyJaBOAy1eJoE0NVEpzXL9PwKq88rkPKokKsCGihFAftDf3RMnsS0FQPvHzGXozv0GjyJAtLBUILxCog4tiF4LezyPZxth8I0OXRTxUavPU/IYcVUYd+VFJ/VB/Jylfh8HCvPm4XlaiiKMrbitkhxTVTqwDzx04lQ9KRy8Ng11cACgy4fryODx+66vCPhEDbf0Jer2PDttiIoFEbeQ3/lFsD2TZT2f2dtgOGfxzJv4Mfg9wO5fVhvNE5DhnPTJxBoqoBaQ5L70uFapiPwuKjX29DCZD7WbbdN4KbCmd0kDOtBQwEY42xfn6SpTkF82wIhOgbxpB2HdYjw8JUZEi3ZEqTRZfrfl02WUE0+uuZxhkV3flEbq0FZ4qQE5+w4MaFk4fnbqVZYPtOupeXsYQ/HQi9nhmtUTb8Lk/CJJ4uyMW9LTLTM1oln4Duy6vk/LkDyC+vM57o6jI7NV1v+9ZsMNAk1t4FnPWBhRErCKHVvkJDiyYVklmIIz1rnuv3msT2EG//10PR6V9HTQX2VBzr1aNhcyLfZb4ApKNy2IaFd1aIJQ9yDt+m9jvk6gW3az5z0Zg4djtSwuas2suK2EmFYxwVCMU2EnhUlWqkLmrhAr7bAUD45EwOFKQ0TvinIGKB9ulD2qAt6B49Gkro3Y6KzEnJfiAsRxLjOOp7lKhZozwB+RxHL1pIzyKE5GWcYKL3tOCB/O0+0my+soJrAYldSyIwA4zgS2ZsKJ0NMfeRKG2Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(366004)(346002)(376002)(66574015)(69590400012)(36756003)(6666004)(956004)(2616005)(8936002)(966005)(478600001)(6486002)(5660300002)(8676002)(316002)(83380400001)(4326008)(38100700001)(52116002)(86362001)(186003)(66946007)(26005)(66476007)(16526019)(66556008)(6506007)(6512007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?/3SsQCEu1evrByr2KAPP7d0wnxhVvI8U9k8RdOfT+mDXxFv0ZH3eLpQakVFh?=
 =?us-ascii?Q?Whw0txK5GvinyD4BkePs/Wq5+GAubrHGLG1n0fKitQAMpX56G21I24RIgEo8?=
 =?us-ascii?Q?DM/du+sPz5zRHb5CSf1ooYtLiHK0w9zgjd/0umwpzJRdjuNfJ8ubtl+SeNAU?=
 =?us-ascii?Q?2AJzhQohz6Abg4b44ajnaxLeAxRIyQdcYEpuNbCl4xpRbO2hgA+W7Ewny8IZ?=
 =?us-ascii?Q?ugFr+J0CNqP16A5YYcLRiQcYU222+gfazewEKNn4xJjyLLtRDHPPDrrniKLR?=
 =?us-ascii?Q?QoxVDHyjqCYVKVfW5WV0zIw3h3SXVdYbfZyb268CssnKUoSDUSfIUnt4gpHC?=
 =?us-ascii?Q?fCJNglRAgC6/SqVH3SqV7VIU5x6DL2nZiKrdJX4ECztyd76kDSVtL1OW5qAL?=
 =?us-ascii?Q?0bMQaLadagc7NnT/Szbd1DbIcdMAtf0a+9oFmwO/nSqeuIHdGhh2s5FW6kis?=
 =?us-ascii?Q?6m4gOZqcbNfhBeNIgF0CBmQC7HGTdgvh+DFTcy68xAazuQokrbsF26QMKZlN?=
 =?us-ascii?Q?/HElTEJU9zRVTf0CLjvqg+Guziqx6iIDGD7A+FbvrvEOvmw4KlYb+YIAtqFO?=
 =?us-ascii?Q?2QZsSys8CRH7QKzcFzShJp7d4gb1ZBc/+h2uLfsmIB0x4/lq+/Z59IyL6g7b?=
 =?us-ascii?Q?POFPotyaytR7ZHR+4koxUWOIiRahWeLf5hU4Td2uTuXJ3P1pvP1Q90wurhfE?=
 =?us-ascii?Q?fmMijlHGkDd9IBUi3rA0B7lR28Uq4Z+nXc0MLZDjAj8YBlp/WuxeFP/CSu1n?=
 =?us-ascii?Q?KbnuTwX6d4ZYLeZl7XgbH9cZ17zAJGPNjanH2dUzkuHOriJzSfg985n/h9yo?=
 =?us-ascii?Q?szwnkisSPQP8XaXl3VuPic6+WFrqusy501dhFJfpYyFLIQh722zyl9SzOHCJ?=
 =?us-ascii?Q?0b+V7QLldmZ0kjhwhlJJHfAot79fsznA8cP53XXBRpl2eW5cPoRYM97JnplJ?=
 =?us-ascii?Q?ndBOHvou25TaSS9Qe/A8JTybjT7lsG4AR9vNAuwWZUv/np479AIS2v8xolyG?=
 =?us-ascii?Q?Hj1HE24oXs3EhD8IhnBToLoydbwLhygeDdeArFpAavMBADCF0LQx6yGYel9w?=
 =?us-ascii?Q?4cpVc7yOoBabzGvJ0fGsyJjL18EJf+windfqUPOOK954GA8bdIUHAgnE6jKe?=
 =?us-ascii?Q?WhekRDVg1CFNpp0Sv90hAwkaBpWtkYh/Koz5Y6OUT3XBnLp7CKJbBWRklAzM?=
 =?us-ascii?Q?LhJ2XCaX+/WYK23n9T2GsKC2dpcYww2bakpOIDXkvJA7bmwPRR6+KGhIcwxu?=
 =?us-ascii?Q?MGVcc4ZG5FwXeJIIwtO2wyjRLC5RRRvgeAlfN20rmc+0jIrBNPoa3FARo9w2?=
 =?us-ascii?Q?ms4j6EaErCETGsth8XO7Yqzq?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e539748-176c-432d-237a-08d8eee9029f
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 17:19:41.6406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qmRxPrdGXYEt2gFbUf4Aenv6AK9zX+XtAdwhprFBlh5qe9/HAFAx7Chhh3LMClgdtzG/loAyiJxagQcXZyvHjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB4737
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
