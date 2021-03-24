Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.49])
 by mx.groups.io with SMTP id smtpd.web11.301.1616607426393430790
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 10:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=lMINGc19;
 spf=pass (domain: kpit.com, ip: 40.107.139.49, mailfrom: neetika.singh@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WryTg+vb2SFOGtSn6ZJ7BglhKmQl7JpGw04XVmabzchEo5mGgUwZ5vozwwXCrQ5qXUQp25jY+NUtO8OOaYnLAJAE2asRJv8PgHGEo9pmOKi9TazVMgZNwEItUNDFDCnC6N3GM+kNleFo0qny48afypS6hM291QWcFz7520TLPamxrJQrnzg3XEq4pNiSNv3B67qCAn3a1TLsA8gEZK0e916jM8Aa9q//mEJExXh4JZGFK0HUduSWGLuSk0aZOxYZkdwKriKkqXJB3BtwwTP01Skq1zxu3gYfW2I3x3SSOMMZeBE6xZS/V7jPWk1dcIja39D8d6VQRUKqZA5ULn9eiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=im+a8ylWsubSKRLTp0uX5i551rAEMMKTWSsZ3OnGhKk=;
 b=eWgJcU3jPLIWLOEr0ny7ias7TK9Sdu08JqosAQDoxBNvyn9HBPusCZAVKcoFjStH7NfYK6YCZ9rb0/FfMYXpPINGhYZPgs5OTq/rXExf4VXlzhk2YxkZUrH7JwPi3AiEhUJfS6f3CKJEA6Wtr3O0wi9WNE3Z+or4sNMiBlKZOud2gtU7BzdE/2g+zyDMDfnUMGp0YUITsB96a34H9wHQqp1ffQwakHJIFr4ZlsMFhyKfs6uZm34ofMSKirI+Mpckanv5cnlgzNrjMw51ltrls6CUnu4wP/uuhIlkv1PJKO4TBzZ7CpnvDZ61aoPI0XKXzQTSP91YjaQh/7qtTFPQjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=im+a8ylWsubSKRLTp0uX5i551rAEMMKTWSsZ3OnGhKk=;
 b=lMINGc19UqUd+q1HpGvTdrx2fbFurp8b4fy4GjDqE1CMUHg31ZZllXvodI97FHTL2KfvvRza5NAjDNbyTQwDZnjHpVhtE242qS1zdEBwVxfS31aDzlRzpL7cBTAl7RTGF/G7L63IQVlPIM0AQdEHBgyzKTbOkanZ1MsOu80hpnU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:31::19)
 by BMXPR01MB2261.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:37::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 24 Mar
 2021 17:36:56 +0000
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a05c:dcaa:1ba4:f108]) by BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a05c:dcaa:1ba4:f108%6]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 17:36:56 +0000
From: "Neetika.Singh" <Neetika.Singh@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Neetika Singh <Neetika.Singh@kpit.com>
Subject: [meta-oe][dunfell][PATCH] libcroco: Add fix for CVE-2020-12825
Date: Wed, 24 Mar 2021 23:06:43 +0530
Message-Id: <1616607403-18586-1-git-send-email-Neetika.Singh@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [117.222.183.78]
X-ClientProxiedBy: PN1PR0101CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:d::21) To BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:31::19)
Return-Path: Neetika.Singh@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (117.222.183.78) by PN1PR0101CA0059.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:d::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.25 via Frontend Transport; Wed, 24 Mar 2021 17:36:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a645cc47-ea37-4f2c-55ef-08d8eeeb6a9f
X-MS-TrafficTypeDiagnostic: BMXPR01MB2261:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BMXPR01MB2261C81295628BCFE22276E29F639@BMXPR01MB2261.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SpETL82nnjPaRuIiealVVannQwNHeNNRQ2YH9BHQeWpqK3FxuAihZc4H5QaGC4/UX2OZHtiDK59IahZb2UKliS5fMtju6Im+Uqvchkn3GEL/dLzkUjRDT37ISIqptr+ehyGSGvxpZfVTOaeRxkpXKS78h6pdA4kK9lOcMcgDU6RQ8WAgof3b4O/CoV0USFVTjhGOagFmE4SpFdA07YFU9yJz5l/xjznjtTnsKiwdYPOKuzSo4ToAJHg5AdXztBRQMZhVdWLmOINdE86jUI7I4Pl6sQXlWfECuUZ5HER4LWapWWzMKjrwESzR0Ltd2c0tVE75dezkOG4lEZWGJe214yi4F4Qty1CBn3+MlHjCp1uEVRwoFIZAlZ5RWpVThuqg2FtshzxFQ/vhCD2aiJGcCAhWQB+tu05WRh2OsrEy0OVUqCSvFaOIResNZNcubqevDIEupIm2owZNCRNT3s6PrAtNUC5HzjAEMOYmXAVBw/rs37eiwwr8t1i4+9eConYAtCyjkmWFyOaE8Y9bGfQ3KeCPLGyjZ9PfktKRRV5fRVmzw/J5WFoQiB4v3Q2KyOGWI+jKwEs8UIgxmZyzGnIzbcPNNgUUng/XUx4HSFqiATO2Kgk+amEvb70M/9uZs/7hgJalwva6NP1Pp/NyrPrm93ucfY+aQxhxSKZ6PmUYeFkIJuKxM3FSb+ZIz+7E3yUUD/9SBOsWkBJiIMH6T9tBzk6xg5x+2ieJybFfXWqHHKlIKvivgxrhYK71Xybt5G3uErjq+rsBbP7hvYYsyYngCA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(396003)(39850400004)(478600001)(52116002)(966005)(6486002)(6506007)(69590400012)(186003)(4326008)(107886003)(6666004)(316002)(26005)(2906002)(6512007)(16526019)(36756003)(86362001)(83380400001)(2616005)(66556008)(66476007)(5660300002)(66574015)(66946007)(956004)(8676002)(38100700001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?rak5g3e4pfBaRqEn3ja00K/ptHto49KYsCX/25tjHQehrV0++Pxou7FyW9mW?=
 =?us-ascii?Q?x7Y3kCuURVfz6q/CBxYkxPjeng0DaMEp/CVVymTWa5El8xdxU4IzXTNsAvXD?=
 =?us-ascii?Q?czmqcrM47/Ug/5VrtuEJY19qD0c5Yow5+IvP+FeMfTG/GFwSRaaZ+8dX8kYz?=
 =?us-ascii?Q?QUPxlIRCTT6evX2/kFwmrO5gRYrdQbmHSwskpa8fSi7HeH7xt7zdHP0V4Gme?=
 =?us-ascii?Q?HFsdfNMrnmIHwOBcKU7wNCO4wTF5XcBK9VlBQnuOuw/n5S961SHnSXf9YLX5?=
 =?us-ascii?Q?d30rF42ocq0ftmwoufqyx9LF9x1WCu1i/CwdJzup2FXaQQgmkc3DffUBVIAt?=
 =?us-ascii?Q?Vtxre+lSRy2dB1+7zbLlDqM/9geUrM+DbdUoNHlBrU6pUwxtsph+vjxonN4l?=
 =?us-ascii?Q?BwJ471bc5PwLol8Rugx0meyB999tKv/JhSO79n6ro0k7OhcsQZtMX0dfJwFv?=
 =?us-ascii?Q?SmAp/DVs6gN3uTWuPFFq+KwUSKYTqpR3VN2MF5Y1pTha161osEOT0eSCENLl?=
 =?us-ascii?Q?h5OZ7s+dPU6YqiHEzjnMwL79f3/Egn1SNDMe09KzaV4YykblC3Gnucf5IRyB?=
 =?us-ascii?Q?mLKaE35J3lLAQZTVCOr+Uzb8lYn6W3GOoug83h1XLdIEQxxZjHTytCnWJBa9?=
 =?us-ascii?Q?jJhgC59zLBX0fOCiDb+3cJQbdIlI6K/HsshiLrSZDtwE9d+YGpHjNin5+wru?=
 =?us-ascii?Q?7HijJgU2WNGjabifCYUZ82PeBE+mBnmFW3RjSPfJOpKvwMzDOZ07+2rPKyO9?=
 =?us-ascii?Q?6GjKqw56PlbhCV7kXOxQPJhw1U35MX8mAKwN+5pFxm+L7bfGBfOQas+/dQrr?=
 =?us-ascii?Q?JW/lTbSLMRb529FMV88Qn20Ucj5rR8VU25PF9EiwvyzTJm5mtYX1ReIq9RGV?=
 =?us-ascii?Q?I8wKav0S/yHz1zvMpM9vU6gztcC1TE4hLkVf1Ig9tOLgKHdbylpTfPb+BLJx?=
 =?us-ascii?Q?p60mzLdJkU/OpWRJuuAsogRF6RTTBUAhCD295wiS/blTMCTZFQQNDAM6MtwS?=
 =?us-ascii?Q?RaQLS2rizRVdik20s5LtjX5b0ufpQRedLN1X1oxVfvcg2R7WqnxcNlIWXYgv?=
 =?us-ascii?Q?Ha0JNrugic7kLU9pxvb2T921FGeDEx7D7Lpk5+AK+wm6cOpS5R+ug4omndI3?=
 =?us-ascii?Q?0Knt68QTz0jrek2ZXfGRl4FOYBi64hf8An0gR8BqTWGZSZn18SlfvzOBlp0Z?=
 =?us-ascii?Q?spmNahnoB66vM5obbJal7ILuFaJRuNJwxwX2drCWGfZ/7VqI2jdO12NRp4pv?=
 =?us-ascii?Q?sM9l1C6UYgf4WGBZIcsOhKgQxmtNuYNYS9qRBHUiIoymNFQVW0x4rOL3B3hT?=
 =?us-ascii?Q?oaDTX9MfjQheN37xzWpzHD6V?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a645cc47-ea37-4f2c-55ef-08d8eeeb6a9f
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 17:36:55.4333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CPSWtLd7mWemoTLakmBqMB2fMdHANnkc7XEVVWUfpr8ol4gjM1p10/5d0sLr7N4HWqoo1lOAezUAIvO8IQhB0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2261
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
