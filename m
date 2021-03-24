Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.45])
 by mx.groups.io with SMTP id smtpd.web09.27.1616606263799093508
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 10:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=Y1I2lrpV;
 spf=pass (domain: kpit.com, ip: 40.107.138.45, mailfrom: neetika.singh@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIOlEcrxJc8T1XqWfB0TKJ5yDoausfa005B1Kw2Ck/3fEV1uckXhQM/zu6Yl3+gtV7YB8eRXYeFhCcN67Gnp1JtlJgt2IJr7A/RGjG+SREtt3qe5qP0MH2uHOEmCab/UWeXyJPcrMLaVL6dM5tLDuD1PWfD/igQtiWIol83A4L+ptefUATNc2r5F6WVE/CRdscxHccvICJH8HOPw9hc0TLcJOCaGuNyY9T87ppAJXQ+SDTDZ1qwuLmgRGDcIKG9zIIgS+B4TPWKs6s/6bHQ0Z+aQTKSo2eyn9zO9OAayvz9N5DPsP0nprr7bGc6HHhH1SNuu/ZOFAFCxeNflYS+gSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xBGO6A2IYI+cTxLurS8Xvojng/gbwKioNeKlk5yJtU=;
 b=VYDh5ta6vSlwAkHT396FCXINoKyQrK5AKcseFG481pCXVDWqABRHeIWVO1uEbGDWqQZiGJTJWTaOZ2T9Gk+60Gy5w8N7oSbzeMZIVTBCML4o3JHpXRL0uQ0+eksVDYzVP15dmhHL6Qi5HnH0h9/WXDbtaGUcN3ZIBid6vwAMCCeaN6tc4IOq5UqB/YlgJ1+2xrLIL/UX8tiZDjKgAwwtGa+fhoBFNcDobMUCYK0aa719yDHBA6ihVRYrAtOqmeWAbJkMpjuWc+u3cRLGG/bRT9CiFMabPX9Ljd8uazfQ2Rj/BcDmTESktj1UMrfQ23KownjE/Di+LhvG/kG+Nec9FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xBGO6A2IYI+cTxLurS8Xvojng/gbwKioNeKlk5yJtU=;
 b=Y1I2lrpV0KzpAWhMJXBzyIOGLG7wE+Ww9eomBAQOgBX/eALt5VURrmfDWohe13+AGNo4vPB8Drm+E4syQQzp8RgezkotaC60+iI9SWB1nGn3e4wzlwGDRzSlu1CQBwyxUw165jXpWlcOSeogEqN6nf1kpcG6W1z/S9WuKDVRSmY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:31::19)
 by BM1PR01MB2721.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:4d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 17:17:37 +0000
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a05c:dcaa:1ba4:f108]) by BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a05c:dcaa:1ba4:f108%6]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 17:17:37 +0000
From: "Neetika.Singh" <Neetika.Singh@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	"Neetika.Singh" <Neetika.Singh@partner.bmw.de>
Subject: [meta-oe][master][PATCH] libcroco: Add fix for CVE-2020-12825
Date: Wed, 24 Mar 2021 22:47:24 +0530
Message-Id: <1616606244-17079-1-git-send-email-Neetika.Singh@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [117.222.183.78]
X-ClientProxiedBy: PN2PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::31) To BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:31::19)
Return-Path: Neetika.Singh@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (117.222.183.78) by PN2PR01CA0026.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:25::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.25 via Frontend Transport; Wed, 24 Mar 2021 17:17:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e6a83944-c0b4-4954-e4ad-08d8eee8b8ad
X-MS-TrafficTypeDiagnostic: BM1PR01MB2721:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB2721976EB6A3251D4A4770979F639@BM1PR01MB2721.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4Px/cw4PkZKRyu5d/Xgt2ti1BntuFFYa0NWIYKvbWLJNV4MsZ25MR3Bo0FhDWhfdTpR3tOLewdshZTYaPR4vm2hrUCy1JyL9tq6iFrOQ5AWH9EQSlMbsyclZ8MbYoWBelV7OyHLEUO2VAnUN1+oS6qUIUTydLp5v5Wo8+eWkcIOH8cusbD4RiiHxm355oAo3ZFEVEPYQF+IvRt7LcKH8VK+6bPtUvez4GCJNvT4Dm+8LZgmz8n32GEEZM3aXBQA6I26dQALyIGmSEEg93FD//dO2N3ZksXlPdMCcQpPmd1cqlFuunCkVWBeOju0uUmKnbNqI2Fwj/sjl1PkbYvIruyOshfjYXsC3/1OmbyT8BfY77ThdYq1TM/8optQoxa+zj/zyRyFTE01pSr5w3IimB949+qSZpk1rSkFb8d9mDzbrDyfPmGqdWiJrAm5uMGgx22e+6sgmuimbbqO/Qju922Y3uyXC3SvygDlebX5qHCcdJo5R6TGihwpJ6UptXfUydc8tTsMhCcXuCDBR+sB2dgeT2TCFwOTR5kLpVwT90QmIwiDbWL00hxbKYvHz9ugL/yCTff+52/M9ar0TPkoPUKfwvyo3yaP06T9WamQ6hRoVeKJeM/EewHCfGmtu+qjLomNDooJG3Pk+ejrXLoyxkLKkLQ8zq7rYjC+4jYJaHJA0kWMrhxFz3jLxk4lX3+JChS5h+vwx3lBw4TB/gYGw9a/dIH3Sqw3pPCdB0hR9g0hGLs9EyRMpM7aG9qzgErBSMoGAoxL8bf3P1zIXToqG4w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39850400004)(36756003)(66556008)(6486002)(66574015)(8936002)(66946007)(66476007)(6506007)(8676002)(186003)(26005)(6512007)(16526019)(6666004)(2906002)(316002)(52116002)(38100700001)(86362001)(4326008)(478600001)(5660300002)(69590400012)(956004)(83380400001)(2616005)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?COjw2c7DBfmvVu3ENU4IR64I92AnLv7reKK0t3erD6qBbv4v8gc+PX+RaRIH?=
 =?us-ascii?Q?5Yu2a88aEpNDTpqlWknjvQJPlp9JKm4qDdhRczBzQPN7aAGzViq/0/meXsQM?=
 =?us-ascii?Q?mAp4Fi4lNLEGqRo7L8jkxMDe6+/ojm0nboVzleSqGXI6YlQ3vddV+9qBUbrR?=
 =?us-ascii?Q?hXg/88IhFvtQXZEoAUWqUU8/TpMqVuIaxh5l4P8bXunECHisZ14kYfDhT48Q?=
 =?us-ascii?Q?0XWY7WBtPvaFWqfDr3xTomtzyQzGbpmTK4EQ2JkJqANgHQ3P/8G0hnK7x59i?=
 =?us-ascii?Q?Beu61IWKtyqFSZWvgkbix9HWI0TuQe2Y0NJskHxhSmqJ7faDrXljvb6XfepV?=
 =?us-ascii?Q?k6fA5+g+CgjTH3q04lan33zKh2v9LtkWuOopOaz/Lm05pImM5T8iByWHMHQO?=
 =?us-ascii?Q?7MQQlXkle8M0qaY9MgCLhuWhsmN5bQ+VQRPJ+zIQ7o2oDUoaAlzWzB/9gVwp?=
 =?us-ascii?Q?SQx8xD0OjYcKYMGkS680zVor59v3bFHSO83xmaEFN8zoyWR1PlDeZhroY0Gw?=
 =?us-ascii?Q?C2zs8q9qEVk87zDT8VECMMFpSYYIlCp5Ib7qgZHdfzx56lGlFf5pxw5TDwmW?=
 =?us-ascii?Q?yFItGccTwuc7MhL9cVJcvDjXyU+SnWfZvezG6GcrgpGWvjnb7YghT4BXDUp7?=
 =?us-ascii?Q?W/V3StU1hpzWNigrL254YqYaIM+SY9mPiUULPqNUDxqbcBEzY/ANmIoZlhRq?=
 =?us-ascii?Q?FfSZJtsmU+YGHdjQS1u/SFMWjKs9IRYBzXMJJBxmd/alNEFC898p1EyUv1lc?=
 =?us-ascii?Q?vBR8HgwLwIBowUgLcuLOUyyBPEmAzNoLciJAxhDEg98YLbOdcj8Vln3+wOhr?=
 =?us-ascii?Q?4RV5y9WGkuyw3EO5WzSqlXgXOP77s9/trKXq/iITKa36/lmQNa1wbJaD6kwK?=
 =?us-ascii?Q?wsNsEApd/FjL8cbCYC0VY4VG9zDyw1VX8qFt0FGt1LiVfT6SucjAi6kH8R+j?=
 =?us-ascii?Q?GMOR1hiDA50tEyWKIRNBNfR/ljuN49sDDfWJt0k8Ha836J/VO/RzTh2kyf9C?=
 =?us-ascii?Q?BS69ljc0B/18nHw8x+B/pb4eHOQo5vMWq1OGaUlSVTUBJx3GWb7/RD093pl8?=
 =?us-ascii?Q?UJka9ScTdBuCihCpkvBuA3Doematw+spPlfm3XhDEhtnr8RxvlZEGKFbqLbM?=
 =?us-ascii?Q?o/EfIqhYnayTn1BtJSOnTH4qIzKNJHlZDeBVB3ifIC4hvyuxABqObQupaMdK?=
 =?us-ascii?Q?fICdIDIqhATNh+oPKr8Z45rVbvSVlSGJo/KYE9eqtO+iMhFufgwjMhhV2UO7?=
 =?us-ascii?Q?JZhlfTGtgo3kqA9IYcKnogaQi2tyz4spZNEONl6cIj/ALlLrjLMsUmiqd7ec?=
 =?us-ascii?Q?SSGCMZ4J5GrOTCt/OfIHLT39?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a83944-c0b4-4954-e4ad-08d8eee8b8ad
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 17:17:37.3591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LojLRSAYkpQZ5nl/u2KhfPQT0+s7fZ3jvoJviaIRHHhso9osjfxYiWetszKPzgqqKzgkVR02Er5r3J7Mc+9C3A==
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
