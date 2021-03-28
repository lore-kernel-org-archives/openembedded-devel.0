Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.75])
 by mx.groups.io with SMTP id smtpd.web08.7156.1616937282731340028
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 06:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=VAS/9ONF;
 spf=pass (domain: kpit.com, ip: 40.107.138.75, mailfrom: neetika.singh@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsiNJl7mX94wJZpwG2qD9Pu1nA/Le2hzLURNGM5I9AqAE3CEr/89vJXAwHJFX6gpd9zTC7wwdCSTKyLB/ihkCWyGC6jIFPaQucn7Ti6Vy3VFHov9Sya4RuvJCbIfIeFu8Tsx8+n5g2HnAH0jrpJ4SM+o95h1lcD41YL46q1b+bgFXk8RlYEX1PTTuLW8BiWpLdVHEfm9Cec/cRwWZmpWezpHk4Ti7WUltz+gFK0b570d++JlCP+TtSs2YItLd4Kkhhul07ab4OrrdvKPzjyo8esEDsgjLnzBLeNvPuBPx3QB2SkPIzkHU4dxCQxS8KiGk9KITpneH/kGAHK9x5DfaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/yZa3xfWjXy8bG7rVqMbWyJNlQxrP2zOV/db4jH/L8=;
 b=LFo8m6XZ2hdCMQHidpM0Z5jQpHuvN5iSWeSBsjnHDfQUOYxTyHwdbQ7Ov0abLWZP30EIhP1H78R8gagRqgnbdWayuRTRqJAM4O+FjqQEFuoYb2bxdHMuDAhFTiIOzOxyrxhgSLdHUv59BIlE09wv2RrKxVhrwoz5wQTyyLddWbCnvOO/S8YOL1LwasyhWlLdbb1ScTNKZqVlFUdZkuq7PhsJ1fEIDoGZF26xWYV9f1LLCf4ZtxxG108uVhnlAFbeXFsoFNKeUDPWgENY+MLap1XTPyQpaGwwMw7VSbZZppic0xeDJJssu9mDONh82mzhAYkaaKht/idlR2Fp4g3/1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/yZa3xfWjXy8bG7rVqMbWyJNlQxrP2zOV/db4jH/L8=;
 b=VAS/9ONFZ5I2hEDTIMD9pc5jP1ZzQjuxvzZJGEbMaqJSF076SZYs0S6zWTrmxkfkTK5v1TAtFDCw4/uMJULhTmwKfJeJo870DYOMtqEmIe7VPZ3byhOAs2sGZ8uF+g5rpBn7D+rOyr0PDXUqviHr9bNBEegW/B9aHZIEl3yiuVI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:31::19)
 by BM1PR01MB2307.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:44::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Sun, 28 Mar
 2021 13:14:36 +0000
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b121:9236:e213:20b7]) by BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::b121:9236:e213:20b7%5]) with mapi id 15.20.3977.033; Sun, 28 Mar 2021
 13:14:35 +0000
From: "Neetika.Singh" <Neetika.Singh@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Neetika Singh <Neetika.Singh@kpit.com>
Subject: [meta-oe][gatesgarth][PATCH] libcroco: Add fix for CVE-2020-12825
Date: Sun, 28 Mar 2021 18:44:21 +0530
Message-Id: <1616937261-30950-1-git-send-email-Neetika.Singh@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4053:2e83:3ab9:7daf:a153:a495:7080]
X-ClientProxiedBy: PN0PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::10) To BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:31::19)
Return-Path: Neetika.Singh@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4053:2e83:3ab9:7daf:a153:a495:7080) by PN0PR01CA0005.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:4f::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.24 via Frontend Transport; Sun, 28 Mar 2021 13:14:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: be15ae02-8ccc-4ccb-a845-08d8f1eb6ee8
X-MS-TrafficTypeDiagnostic: BM1PR01MB2307:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB230769A72301184E347296049F7F9@BM1PR01MB2307.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tMcyqbbhvl4Lj+naTB2Ua6eljy6Ou0XhKOTl0tf7/nj7rrogB40JumierTrIhXQDMrZV3MvSPL2bdzBuLQJLeHRDycF9Z8NYr8aXLuOwCg3p5q/XdH0fBVdBrvpHn2yN6MPZcScty2sVJ6K4uJDCdBzNlYe+3Y5sB27Ojd01i1Qy4gL1uAZ6FHUbDHZfUOsNYDK2FtfFzhiV9DCr0wX7xRsTr/O0OOQBzYo9NWbrY9CZzIXiUGFY/XhhMjgiq8GO+DJhZ43NpPil2ZN60fuzWcM+JKF3l8R5k/yd19AX8HOvtklsC1/NDRVb/kUFoxG7+q/X+VptGziPZWZRDQDfXBqFuxS4kyuMdD7y5kOrr76TzYyu/+iBKBaWsAQu+5e+imxzibcmb8dAuY8ghZGqx5LBnso2Vr8+404eUr2brtCcNxWlxxmBdxDaiW0jTuvHqnifwrg3Vlz6rvr7ARP0Z2Bpp9LOM3MTfdDQ34KqE7aH2iq/W7zVeV/ng/dS2A/BTqaX4bRzSuiu93tbzwpTFie6Cw7XUxC0wnehW4L03g8kI368K3Z08GYetB2mYvaAqhxmpEA9TqSYINgpsVw1Ku+gbJPejK9o+V11TPsgtvz4wLLhZX9BtZS5vLlJOUfS2ACluLwnhf7jIaQmxOC3/Cxl/xZMJfhgzsSNY6AY7YJ4jT/Tz7REUwsKEDbwwa+u5vkqsBeTV9NtdNOsktZizwMQvZXKXVdB2zIEigCA0dbxX0aIF8lByBJQw++s5RcRu+nCfGFpWM2RDxzY41h75A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(366004)(39850400004)(376002)(38100700001)(6506007)(69590400012)(8676002)(316002)(2906002)(36756003)(8936002)(186003)(6666004)(66476007)(107886003)(16526019)(66556008)(966005)(52116002)(478600001)(66574015)(2616005)(6486002)(86362001)(6512007)(66946007)(4326008)(83380400001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?fOnXiyvAWUKunHJ62e0fPAroT0Gn31BaSKl0xsqNcAGFAQrNRqHZg3uHUo73?=
 =?us-ascii?Q?28nzbQHoWOGxKWgokTPm+wc6hEhspGNwV4rkFlp9sc0x0M2nDseS4oazXze+?=
 =?us-ascii?Q?rCufrWMOORL3cYh3auKTQxgdu/xikMX50CJd4X0d8goAxWSC2kFtMUKVQtLx?=
 =?us-ascii?Q?cMIOlspl0BXfh7xmC+xawhokYTWCTV1C55kICkSsozn4SDJdmLEhT/Gcf3Tl?=
 =?us-ascii?Q?QjkxsD7QJbcY7ws89yDExNrXNYLbklYiEYGo3IZ9PrhniquQc/7Xvv2uRBeq?=
 =?us-ascii?Q?PlmMxG/6Lhv4UcVqz6Qe6utsO8WdrAXZzXGTWb0ARgc0DA1cFCFJLYj8vtvc?=
 =?us-ascii?Q?+FZC4bI7igyf70pxa93jlfNv28S0PNKBidswDT7JYxjn4IIN5ao7vBF4t0mm?=
 =?us-ascii?Q?Yv3e1A88EhW3q4AU3MLtNmPuENft1WIL4DBV6WbcZyyXFGYfry6si7VPNe3q?=
 =?us-ascii?Q?kmsm5V3QJQ279DX9lKhSnDz6cfwWlpfG6io7pSbvg1yZZN2om8ADfow7XFAa?=
 =?us-ascii?Q?2yINxNDRFBsgZYlY1zdR1yhyJzMRupOdlBmmjUgdxfT73PE06Era5v2WxkuW?=
 =?us-ascii?Q?2XO8lNG3cgNcoHwFdYt0r6LiLV/sVmxTiYJAZwADTP4e8NO76O4zJLISAT9t?=
 =?us-ascii?Q?HiimhYhClpivN1oyW6Ka7pSQ62d/sVqbSylrRafoYgFkkFrLRCKY0uEXSHv7?=
 =?us-ascii?Q?zXsr5JtvI2eF0gkyZbHCyZcwTXF4ZSi/ymdgDvN1JLA8TsgndXIn8kBK/MCg?=
 =?us-ascii?Q?XA+VGProcsV9WbYXv5bJvkym9ybevaJcUUVu4wuC9t1RxRu+Bc+5lQMwvxxZ?=
 =?us-ascii?Q?np5yHSlpgEcOwow07tCl3c4XVWifgMy1QLP8WeOrDPozdpM7hnchy+dM7g6O?=
 =?us-ascii?Q?loyTggZ4TqMnd78IOJQxh3brQ/s42fuzJXpalghOD1G1f79Pm1cabYHFHbLQ?=
 =?us-ascii?Q?jfBrXfjfQfPTb3SICe13++T8IfAquwKb4Dflgf08QH/NYVwtloMswXFuj9A+?=
 =?us-ascii?Q?DRHgjoBoq6IHB8b1jCLDVpbbCxsLePPfs2LzUUZQl3msCdnOS91UmVuMfprM?=
 =?us-ascii?Q?Q1ldH7Cdr/2BwLVl4NVTu+jvxeIsGIehp1jjUXO+Na2190hVgBqyvH9Jp0YU?=
 =?us-ascii?Q?Oao5Ihm8pMxuU2QcxPo7RjsfBXD9FvdLxDQGal7/TtRf/feVNhLoeNghcmAp?=
 =?us-ascii?Q?IK9H3AO6kwSakvMbphpuHv8PZ/blFuepIj9NEN53daqHZ9Mq1ZrmWlN1KAD1?=
 =?us-ascii?Q?vtp21Wj4aiiWkDvRq5MTzhlxTekneCIhAfbUD9uGfHlReLDzxreG71gqWD03?=
 =?us-ascii?Q?RX+85QLBX+vc/5uZ+ye5LY0Lb1kdMnvmqCOkq1Y6SGVjFRqjOPokeusoHvms?=
 =?us-ascii?Q?HgfkFUHGSPxrPzIghYLKTc1oT+ci?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be15ae02-8ccc-4ccb-a845-08d8f1eb6ee8
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2021 13:14:35.7852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yzfSCB0uTC07UZVTgKXQTgNYmpXrI7UOvqgMdO/oz93D+GPbVVP8KM6h+HX5r8tboD9pb39MxmbKiHaRRnTEsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2307
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
