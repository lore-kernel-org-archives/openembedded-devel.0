Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB1BC19F2D
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 07:52:44 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.60])
 by mx.groups.io with SMTP id smtpd.web11.8206.1660290754330040845
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Aug 2022 00:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=IGK5PK+B;
 spf=pass (domain: kpit.com, ip: 40.107.222.60,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8NquqcYpkBa8dwf1y+p0V2+PMhSREJTXy9wiZs6k97jI1gdoGQarM/3ZUcQ1U31spYqKgv13oJAyDZosuNaR7WM0QJtDeOozgknarXDJyYJSUmjpBNbZKIjGnXqhPsRTa9kk+gMfSm1ykz9HvPLhTQhmV3tMpKwWQzK0TlgufgbpMcGK/0s5ydg2pV0XQTB41VY/VINOg7HVBYCPfm4DuKKKXfISQgjhRPfbljAM08lk+uurubelh8GUGW5QXX+Ldz4szp1+QH7P6jwWbwyaZDXdE4LWPKh4RV8HQWXxUdnXwpUbLJ1OUvN2LVRy5yWdkbUnA4nAalCpUxhO4Mixg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPb5Uen9hh/CbFCSb/IFdsl43S4sDgdPblv7nDpj5mM=;
 b=LGcFjgfKrECZlMSjTAP6CoQAqAxaZG0oTosyZuvvjrrXvP/KxZSU9oiQker7oUqQhgPJPq+HI+IXwQ1wrmW0OV2y6pFHB6QTbL0OFoRSB1hqNF3NygSApiZS/i6TS3c9IrY+BzzmVxXJmQTbg+O2VIiKS7a8Zq51CQgjqAXjUGmjPp2M6ecXux2GzCxziEbRuqCHofAuhnOutILbwj6fOrRueXWCbfJ8dsfq2p9asL6GInkZb5JWJ6y3vETnYV0koykyfOxTxHV/pIm2Cib48YemWMusyD8B08dlxxsNfPHS/ZZOCHFuASW7w3cL5MRecqjhw4bUeIQswpFCngrnfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPb5Uen9hh/CbFCSb/IFdsl43S4sDgdPblv7nDpj5mM=;
 b=IGK5PK+BiX1QZXgHLzikQts0wurSO6Blohi7FTerPugJlMG+KbYHwlfD6Pys4F5UUPycxrjKYDUkvkiC7NTvjQZ79CzofvCiJKIP6Tg0+A143GRvdHjp1mV6ijjqmtTKCIAPhgrju+sDzRa3Hmo0x6GkRoW7AMlSO12LsgZBaVg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
 by PNZPR01MB8490.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:5f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 12 Aug
 2022 07:52:25 +0000
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5d77:6438:def1:ac50]) by PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5d77:6438:def1:ac50%5]) with mapi id 15.20.5504.025; Fri, 12 Aug 2022
 07:52:25 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [oe][meta-oe][dunfell][PATCH 1/5] Revert "c-ares: Add fix for
 CVE-2021-3672"
Date: Fri, 12 Aug 2022 09:51:32 +0200
Message-Id: <20220812075136.31326-1-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::19) To PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:89::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f917e37b-0e72-4b3f-8f89-08da7c37987e
X-MS-TrafficTypeDiagnostic: PNZPR01MB8490:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yFurxNQYkdq9cK/q/JVcTEta5Ljcf31CTwWqQ0ckH3IBQhShVv95DCUTneEToB8Q+PY/NPk9Bv57QNQXC5i8K/3zhl8SF8D5htoDiPlduaQhTpDIQ/pCXsw3KDVA4ezD6NHp0SWkAQTJ7ialH+7DMPuGMZg8OZS0fg1OZXFXPSOXUX60BaEUXKZBXk131ElrKvcROHJ8QNdQRMHem2EsR+Jp9e97LMeVK1GNH+8FFxtb9kH+xEWr8B7CL24pwKnLhhbKKVPx9Po0bNXTXO6OLYxUGH4+Oflx9NOjOH9hIKBRsF72xoKEYXC95Q3VOQezembJM6PiAMhsKjgp8NcfkmJbtn5gQdunyOlzhv9C/dwDq2Z5QwbhgXHXCZYccJtx3gUv3OQ7vAmJ1hAHIA7rZH1p6qI0vUYBmNG6lAtmq1Ia3piLgGZ4uI/4tam6TLVSEnBf5Jzj0m5IJJpeCaLqWNUijLFsL/QpzG3X+Gu0V4QAQXaMspubvondsogHCo10vnE1QwnTCNB2wrAMvWLG2Nfl3C1iZCAMjAZBtJmsfxZ6HkUO5JCY5ImfJq90+CyCOwX8ltZGPTcJnvjzUEB02w0dBmgFhOGnpx43Ckdm+n4ZZG9yfyZwb7zKG7fpn6H+9GnsV5y1pww8/gIzZ+rOIafZQGDTgrwIB3BC4fqHbJj1sZLLCleDcx+rSacV4f4NagF3aI6DGPfa/0myLRknwvSUi+bwKLu9AHc1RKnYD5/GjyWMRSjywKq5NqjKounRrJUk0QzeVOBIcXk675ixuXg8Tzix8D5ix4CCNGSzDnOdgp/5K05xcMNwCYhzGpnc2dxDBK7s6suFSjwbUpwZhw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(36756003)(5660300002)(2906002)(44832011)(478600001)(8936002)(316002)(66946007)(966005)(6916009)(2616005)(38100700002)(38350700002)(6506007)(26005)(66476007)(6512007)(6486002)(86362001)(41300700001)(52116002)(6666004)(186003)(8676002)(4326008)(66556008)(107886003)(83380400001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XWEwHaOeLoK/LEYFHr5ktwAHQtHRkm9ZFhHRuDWpKk1Ie/wTr421IzMByZko?=
 =?us-ascii?Q?hoAjJhx82zoq6w86XGsQZ3o9g+qftzcPHc2HQhvJR3dadCdenuHGFy9a+MCA?=
 =?us-ascii?Q?0tucK4PLYeqd/yw86nV5yPhy3pP+CKjR9Z4MUx+B2HTxv1kab/42H1Vjt9Yp?=
 =?us-ascii?Q?2XezEpKidwtAhiI0q9EdIkTyguZTj6JJXqE6n95xNJVe/vLnolUqCPqcx3GU?=
 =?us-ascii?Q?WtFui1BYNEuKSjawug/+SktC79pgI6PB1gpBR6eHBSGDwsxibQEXIrX/mD2V?=
 =?us-ascii?Q?Ht9xPkD2a92dVFBMhJRN4dSO5wNO7yPDT3GDpO+f+7Bq0WB4VHJzPDrW9HbT?=
 =?us-ascii?Q?ymvM9DFNGrgX5f9wgdjaDPN+aHUqPg1BehwmhsYc083N51roEkzgf8oUr7sW?=
 =?us-ascii?Q?mtMh1Mtt2eovi1JL/JCl1sKE++fFq2T3Jo/jTnkC38SPb8EOW924n6XOiH2X?=
 =?us-ascii?Q?tomRjlJfyunDnbS+vsTA+V0EhydtsFnQPv+KR+YDZ1odoBx6IFB17WPlul96?=
 =?us-ascii?Q?xTQwUOibhuH3qDyzsGQeBCyH0b/RtYzW7SuuStitTzi2vsROalznExuEwX5X?=
 =?us-ascii?Q?vqAZeN40Soydzy0rUrkAmNf/UJOrUXm6/1EfB1GPrHCGg9tCfQ/rlBMCXvdp?=
 =?us-ascii?Q?o+LASY2qL8neu3hUwaG9Of25BB+mWYQVrHL1aP1ZR5aal8J+oyeHF9B8r4+W?=
 =?us-ascii?Q?+xxxZh8aQ6cJ68Uaubi2iwZbzbZnRvaUei5C8NU8TjhTFrlrSyjP71XQecVW?=
 =?us-ascii?Q?TPdxRujd0VT/GuiXX1I2lEn8F79jjAc3pSaxJRl/5y9OdjSHvI1pf3Cs0+Jk?=
 =?us-ascii?Q?u10L0ZoaBpRh4oVx8KvXLSvIwniSyGrhwQIh4RdzbjZaokihqqqMASgUvORO?=
 =?us-ascii?Q?SxFJXEHiYqZiP4kFgzKZ4bD/wCc6/po69Nszy1j9KuO5/Lj496WkWDdM8q1c?=
 =?us-ascii?Q?SKvx2cGQcjKzrNJfPRLcCyRHitaflqKFensMrvT0iEB74OOZVlDEharZDGgR?=
 =?us-ascii?Q?r85r1nMl9vWpVXSLHZBStk1yao9seRzWTizmVrmB3HUz2OmGLa7eaZyTUAX1?=
 =?us-ascii?Q?d/gVCFRYy+ihN5PjcEaxsTmi6C2XCSQOMyxxz+XBAZEYjvR1TyBw3tG6abNk?=
 =?us-ascii?Q?pk7d3z5PwbCLuPHkHAMlpzMEJpTvfsn09w6C3FvEg4q5bBSBDxJp+E3k/z6u?=
 =?us-ascii?Q?lb62iPwJz6IhN5V4nPdfLItJkEV7LJex3LlsswHFE1D2naRSiB8NMZK2ieVU?=
 =?us-ascii?Q?cXXsKiUX6Csd20wBT86Lox+NIHPsZqSme212U5kGEC/LTngRg9mbbAE3F50r?=
 =?us-ascii?Q?kG+nBX3fftawJH0XIST9NlQgAXICI9xYnuNTOuOYDt6OYCujWztpTh+Cd3mu?=
 =?us-ascii?Q?O3j9ALq4kUwZc1LMyK2wRQ8KTypEnAe3mbxuJGLpO7i48fLZhDOuOsvDyHDR?=
 =?us-ascii?Q?AVdbQrG3HoFnPw5JeHtB1lwhi4LRZijdNu1rwRYFi3bHtMwfyR8xO1UGL2Sb?=
 =?us-ascii?Q?F5as9u3nISPCGN65onc7sabftXn4qHivyHGbd+anUI4ufJKYWrzYelTws3Qb?=
 =?us-ascii?Q?OCT8wZ/Wb/3o6IY6q5MTxjptqJ2D9den7KHdGSOO?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f917e37b-0e72-4b3f-8f89-08da7c37987e
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 07:52:25.3259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ebkRPCEiyxFq/62eeX1GhmRG/16ZogSLlH+PVn8DC/dkEhqM3FOJzaFfH+F/0gXzivvL8h4nlIyIoSKKax5COg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB8490
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Aug 2022 07:52:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98202

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

This reverts commit b06724bc274f751004ade2ceeddfb8ec40d93f16.
Revert this CVE fix as we upgrade c-ares to 1.18.1

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
---
 ...-fix-formatting-and-handling-of-root.patch | 115 ------------------
 ...d_name-should-escape-more-characters.patch |  90 --------------
 .../recipes-support/c-ares/c-ares_1.16.1.bb   |   2 -
 3 files changed, 207 deletions(-)
 delete mode 100644 meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-fix-formatting-and-handling-of-root.patch
 delete mode 100644 meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-should-escape-more-characters.patch

diff --git a/meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-fix-formatting-and-handling-of-root.patch b/meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-fix-formatting-and-handling-of-root.patch
deleted file mode 100644
index d1cb54aefb..0000000000
--- a/meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-fix-formatting-and-handling-of-root.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-From: bradh352 <brad@brad-house.com>
-Date: Fri, 11 Jun 2021 12:39:24 -0400
-Subject: [2/2] ares_expand_name(): fix formatting and handling of root name
- response
-Origin: https://github.com/c-ares/c-ares/commit/44c009b8e62ea1929de68e3f438181bea469ec14
-Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2021-3672
-
-Fixes issue introduced in prior commit with formatting and handling
-of parsing a root name response which should not be escaped.
-
-Fix By: Brad House
-CVE: CVE-2021-3672
-Upstream-Status: Backport [http://snapshot.debian.org/archive/debian-security/20210810T064453Z/pool/updates/main/c/c-ares/c-ares_1.17.1-1%2Bdeb11u1.debian.tar.xz]
-Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
----
- ares_expand_name.c | 62 ++++++++++++++++++++++++--------------
- 1 file changed, 40 insertions(+), 22 deletions(-)
-
-diff --git a/ares_expand_name.c b/ares_expand_name.c
-index f1c874a97cfc..eb9268c1ff0a 100644
---- a/ares_expand_name.c
-+++ b/ares_expand_name.c
-@@ -127,27 +127,37 @@ int ares_expand_name(const unsigned char *encoded, const unsigned char *abuf,
-         }
-       else
-         {
--          len = *p;
-+          int name_len = *p;
-+          len = name_len;
-           p++;
-+
-           while (len--)
-             {
--              if (!isprint(*p)) {
--                /* Output as \DDD for consistency with RFC1035 5.1 */
--                *q++ = '\\';
--                *q++ = '0' + *p / 100;
--                *q++ = '0' + (*p % 100) / 10;
--                *q++ = '0' + (*p % 10);
--              } else if (is_reservedch(*p)) {
--                *q++ = '\\';
--                *q++ = *p;
--              } else {
--                *q++ = *p;
--              }
-+              /* Output as \DDD for consistency with RFC1035 5.1, except
-+               * for the special case of a root name response  */
-+              if (!isprint(*p) && !(name_len == 1 && *p == 0))
-+                {
-+
-+                  *q++ = '\\';
-+                  *q++ = '0' + *p / 100;
-+                  *q++ = '0' + (*p % 100) / 10;
-+                  *q++ = '0' + (*p % 10);
-+                }
-+              else if (is_reservedch(*p))
-+                {
-+                  *q++ = '\\';
-+                  *q++ = *p;
-+                }
-+              else
-+                {
-+                  *q++ = *p;
-+                }
-               p++;
-             }
-           *q++ = '.';
-         }
--    }
-+     }
-+
-   if (!indir)
-     *enclen = aresx_uztosl(p + 1U - encoded);
- 
-@@ -194,21 +204,29 @@ static int name_length(const unsigned char *encoded, const unsigned char *abuf,
-         }
-       else if (top == 0x00)
-         {
--          offset = *encoded;
-+          int name_len = *encoded;
-+          offset = name_len;
-           if (encoded + offset + 1 >= abuf + alen)
-             return -1;
-           encoded++;
-+
-           while (offset--)
-             {
--              if (!isprint(*encoded)) {
--                n += 4;
--              } else if (is_reservedch(*encoded)) {
--                n += 2;
--              } else {
--                n += 1;
--              }
-+              if (!isprint(*encoded) && !(name_len == 1 && *encoded == 0))
-+                {
-+                  n += 4;
-+                }
-+              else if (is_reservedch(*encoded))
-+                {
-+                  n += 2;
-+                }
-+              else
-+                {
-+                  n += 1;
-+                }
-               encoded++;
-             }
-+
-           n++;
-         }
-       else
--- 
-2.32.0
-
diff --git a/meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-should-escape-more-characters.patch b/meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-should-escape-more-characters.patch
deleted file mode 100644
index 3603ef1278..0000000000
--- a/meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-should-escape-more-characters.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From: bradh352 <brad@brad-house.com>
-Date: Fri, 11 Jun 2021 11:27:45 -0400
-Subject: [1/2] ares_expand_name() should escape more characters
-Origin: https://github.com/c-ares/c-ares/commit/362f91d807d293791008cdb7616d40f7784ece83
-Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2021-3672
-
-RFC1035 5.1 specifies some reserved characters and escaping sequences
-that are allowed to be specified.  Expand the list of reserved characters
-and also escape non-printable characters using the \DDD format as
-specified in the RFC.
-
-Bug Reported By: philipp.jeitner@sit.fraunhofer.de
-Fix By: Brad House (@bradh352)
-CVE: CVE-2021-3672
-Upstream-Status: Backport [http://snapshot.debian.org/archive/debian-security/20210810T064453Z/pool/updates/main/c/c-ares/c-ares_1.17.1-1%2Bdeb11u1.debian.tar.xz]
-Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
----
- ares_expand_name.c | 41 +++++++++++++++++++++++++++++++++++---
- 1 file changed, 38 insertions(+), 3 deletions(-)
-
-diff --git a/ares_expand_name.c b/ares_expand_name.c
-index 407200ef5b4b..f1c874a97cfc 100644
---- a/ares_expand_name.c
-+++ b/ares_expand_name.c
-@@ -32,6 +32,26 @@
- static int name_length(const unsigned char *encoded, const unsigned char *abuf,
-                        int alen);
- 
-+/* Reserved characters for names that need to be escaped */
-+static int is_reservedch(int ch)
-+{
-+  switch (ch) {
-+    case '"':
-+    case '.':
-+    case ';':
-+    case '\\':
-+    case '(':
-+    case ')':
-+    case '@':
-+    case '$':
-+      return 1;
-+    default:
-+      break;
-+  }
-+
-+  return 0;
-+}
-+
- /* Expand an RFC1035-encoded domain name given by encoded.  The
-  * containing message is given by abuf and alen.  The result given by
-  * *s, which is set to a NUL-terminated allocated buffer.  *enclen is
-@@ -111,9 +131,18 @@ int ares_expand_name(const unsigned char *encoded, const unsigned char *abuf,
-           p++;
-           while (len--)
-             {
--              if (*p == '.' || *p == '\\')
-+              if (!isprint(*p)) {
-+                /* Output as \DDD for consistency with RFC1035 5.1 */
-+                *q++ = '\\';
-+                *q++ = '0' + *p / 100;
-+                *q++ = '0' + (*p % 100) / 10;
-+                *q++ = '0' + (*p % 10);
-+              } else if (is_reservedch(*p)) {
-                 *q++ = '\\';
--              *q++ = *p;
-+                *q++ = *p;
-+              } else {
-+                *q++ = *p;
-+              }
-               p++;
-             }
-           *q++ = '.';
-@@ -171,7 +200,13 @@ static int name_length(const unsigned char *encoded, const unsigned char *abuf,
-           encoded++;
-           while (offset--)
-             {
--              n += (*encoded == '.' || *encoded == '\\') ? 2 : 1;
-+              if (!isprint(*encoded)) {
-+                n += 4;
-+              } else if (is_reservedch(*encoded)) {
-+                n += 2;
-+              } else {
-+                n += 1;
-+              }
-               encoded++;
-             }
-           n++;
--- 
-2.32.0
-
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
index 692a5f0d6e..0e118c88ff 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
@@ -11,8 +11,6 @@ SRC_URI = "\
     git://github.com/c-ares/c-ares.git;branch=main;protocol=https \
     file://cmake-install-libcares.pc.patch \
     file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch \
-    file://ares_expand_name-should-escape-more-characters.patch \
-    file://ares_expand_name-fix-formatting-and-handling-of-root.patch \
 "
 SRCREV = "74a1426ba60e2cd7977e53a22ef839c87415066e"
 
-- 
2.17.1


