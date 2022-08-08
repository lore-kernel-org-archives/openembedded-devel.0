Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD095C25B0C
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 14:10:08 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.54])
 by mx.groups.io with SMTP id smtpd.web11.26080.1659967803706592473
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:10:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=NGHacvxr;
 spf=pass (domain: kpit.com, ip: 40.107.239.54,
 mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/xRvRsmuW1le1Ch+dS+xjy5JTJLaoE51ipSjVuV2Na0hUm6pkqC8teP8bmeSydAwDyNaXC2FOHG7Fa+g/0tpwCUxxfoa3rLWH/04i3Ags/FhODIYnDNqw/5PATOQvjDNU9VRIUr0C8D1sQKk+KTaW6zl4BwWOYMoILFjdJTzn5qJnLVXqE8bEROb+Xk29z4VpIHf8bctdVhG6cZC5WK68sJKTx+P5xWRc4mhRRBlQaVIALPguI5jrbdWc2SvNjMqQgD7HBAfuBSXDHvnv4VyKKJgh0YwA2whk+zr3g1qOKeUE+D79y+GJpGEpHwoIbsSx3AC0742bLhCPktCDlpBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujDoFK0TseRxa99BxnkHKYLnxIuIbSFpHrwNXmyLJs4=;
 b=ZbQEdD5aqoUo9SHE98sUPhE2s4/7ZBOAagTacn0ZCB8GDdSKWIiudYdlwZVv3ObSjg69Klvf7TyfiZk7Xzo0S6fo+/FEJPjWx0kAHKPk+TTek3+XHUnIws70DFRNJ/dyj63R/F/PAb7Q3YZX4UQH/5lZSKededtqlxwHn1K6DRXh0NtKrQIa9cKlk9SUM9XrA8I2zLs7hHF3S72mlqGabGiN/fqaGniX5hohUFzTvkH4FUeEXbcgsEwdqqTG4yddoT7aqKcq3C13Zjsko6pf4NP90YaF4MerQMX8Ix2G6NgUI6ezcU/DEaz6dtyFG+5iZXXr7qJxEGm/1RAU3jMjPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujDoFK0TseRxa99BxnkHKYLnxIuIbSFpHrwNXmyLJs4=;
 b=NGHacvxr1gAMUvkDBOld/TI+uK0T5tzMeh+C4LMDT8jFW6YPyCgP4EuDc/XRTtoOQ0roJmhCbnyFKOcu7KETkwpLCyjAGrpR/EtZU8LG6L/db2JeJde4xICvJFoYJs2ZzMmguN40azof9Opn933cmccmHOQajmKWe8aWCdWzbQQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8d::14)
 by MA1PR01MB0618.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Mon, 8 Aug
 2022 14:09:53 +0000
Received: from PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6986:8621:f6e5:e4ed]) by PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6986:8621:f6e5:e4ed%4]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 14:09:53 +0000
From: Ranjitsinh Rathod <ranjitsinhr@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Khem Raj <raj.khem@gmail.com>,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>,
	Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Subject: [PATCH 2/5] c-ares: Upgrade to 1.17.1 release
Date: Mon,  8 Aug 2022 19:39:29 +0530
Message-Id: <20220808140933.25968-3-ranjitsinhr@kpit.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220808140933.25968-1-ranjitsinhr@kpit.com>
References: <20220808140933.25968-1-ranjitsinhr@kpit.com>
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::8) To PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:8d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81eb33cc-254f-4339-a2f5-08da7947aa61
X-MS-TrafficTypeDiagnostic: MA1PR01MB0618:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oAdO7C4Z/vFGh/oxJZW1Mi7iogtl6qEiv8s/1ICpWxz5e3XRA6mDy0jT4SjbDjE4z8I76czPlze6IglqFYJw1EdZz0t1yliPlv3jRBPeP1KanJRkHTWgfDtDyi9006yK5xCKtDybdJYcHkYEmwm3H9l/gpJRPax+p+iq5Bf2yZgnfRqi90Sridf9uFZLnop2+4ZeQYGwLesT6h6hZYw3F2RFKmzcC2KT+YMp9UbKkq5aK3/drC1nbh59ObocCa/35WOQSW2bV8Z2RcyDu0iOwKDOxnEUZVMBk+t0QK/4fmPdUvapgcWjq+R7Tcy6Z+pTh735QalILGh6zAnxaLMqjp5CuVZbpt+K6P67z7HhEy06KcxPskuC/sZqaAD2RmC1WCNcnhXeodjWcy6SgcAHUTuSTCKVqOSNRO7B8Kq+8dHrICH6Zowyla30eHlnG8Je2DamAfPVKN0uPjgfvt3iiSPjB3cop2l2g6qCFnP6SjjevZYZUsFZliMbq32MAqrqss6DmSx0xj442RABJEqvyiAUzEQJYPWAqIvL6cLiSjXffi1qWKjYPpir8K2TZIqbxgaJJIsPgWMufhOWwqZd7VH1OFsTAhFu4PqHUq5kcUu7azXnN/uCr0OgAvlG0jyj+YnJdENey+LbaWaZYu+uh/xV+4Hig0h2ZxMsy4Yp/0RU38TkKv84nfFkBGh/cUM4QVcKj2SbjqDXK6xuJhhGBMrQUjnaRkvI3Y/uXGeYZRXEb3EjHtdsHGYM8/JFRQS5TegMLPmN5saND9K5B3b877L9tHq7EhLFYP21+Pu8+Mnp9k4LWps0Xf8YVfzXvdvP3lVOOZq+I/7dxCbRsDLJ3IkOc2Tiqud5wKx6xK14FdPLAVgCG9BbTLOavU5g/Lv8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(41300700001)(26005)(6666004)(53546011)(6512007)(38350700002)(52116002)(38100700002)(6506007)(186003)(66574015)(1076003)(2616005)(83380400001)(8676002)(66946007)(66556008)(4326008)(66476007)(30864003)(8936002)(966005)(6916009)(5660300002)(54906003)(478600001)(2906002)(6486002)(316002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cYGxgLgg6SmWopngWRjTSJCVjnUAARQG31FJiANkk6v4YqjVU2UmPWVUv5Ue?=
 =?us-ascii?Q?jnTO0aUTYSJMIFRLD858YgHwpt1pGdju7TvXBGzaejXh0nyA2Q7GOz5lZAv9?=
 =?us-ascii?Q?T62k6uoD82EC5vrCchfFk2rO2SvEXlHredVcLwfAPVAk7G7Lmd3KwmLcFv/o?=
 =?us-ascii?Q?3rcrhx1QCRlnwWxc9X0fwWTX2zjqTTRGcSEtTxrmmY4z8FpTsNzwQtfVdg80?=
 =?us-ascii?Q?TTKBLvJOg9mk69vDHDLBRQJ+gl7W/bolnUNkebxK7+JL48seTEOsuQBrk5G2?=
 =?us-ascii?Q?RZ/tSurEWhFy2P4ttLbjEXTgb20YPKKTqWu2V07o7VOIzgJCPzezilDgRgV3?=
 =?us-ascii?Q?MEf7/Ml1fDmOyci1TuIJLyhRO9ueoX5QA48oJgjCTl22bjJdL6zPFxIdUhKr?=
 =?us-ascii?Q?25trOhyYL0VzEq0KFWdoV7L7nU2F/BxL02FW2dt5Uuh2pstA6r9XjMerdCqw?=
 =?us-ascii?Q?7eObuuB0TXcyRKQa+IR+BDHNnthKz4Ex4fvNZ+6ELyVUlnGl6xOhUsPq54xA?=
 =?us-ascii?Q?EFChLdufg4H2r2oWob7agZ28Mc30fWkXYp+erGeJbGfZhYJi5/1jPQTmOL7a?=
 =?us-ascii?Q?vXA9zI1nGv+/F/Wvih5NIsGBkv98uQTxNqiDLeb0rvhNj0Y+oWHzBYayWk+l?=
 =?us-ascii?Q?o9zNSP3YMguC62JaDg//FTos6L6btl1x2Opv/8BFFckDpueCquctdCJV57pa?=
 =?us-ascii?Q?DA3CbBPT2Hc1GuMg+ObSZkWPaN0xvOAElFKIOMu1I+S6KMl7JOmWeYSDc9am?=
 =?us-ascii?Q?Zv9X84S7ZzA21+EPNHaIe4KbQVJdH5FktlOoIuLyx3DIZFL8sPSM+3gCaXtB?=
 =?us-ascii?Q?uo/fXV6YmToqMmTTkqQrzrBvmdc0s2srb6DEH0HkP33ggQAvSWAwABJmBd9E?=
 =?us-ascii?Q?2mTaMC0O2rf8UbRuM+qRy5p2xIw9rh55E6K6gOGNRV/Sk3rfd4Feenq0eCtf?=
 =?us-ascii?Q?uaUZLCeVU2H55xgWRM6wp+LeetwqAF/ft4PThtWI29K0aNfnhenIYGDeGvCZ?=
 =?us-ascii?Q?qCOUo7lyqqXKO4nzBz0NAJPIQD+y7ZiUTinpEAc3dcThRodKwIREsaW92BCS?=
 =?us-ascii?Q?diS9upHl1v5Hs+zEM+iaMEcUJo7DtL3FIGFCjhxciuZyTKHJEjN8Y+Qs81Xo?=
 =?us-ascii?Q?oSAo6iwE7EVTCfEP65BEeq/Om8SvRCFWCyPd8tJdV4Kd+OfcKRQJjV5+twHy?=
 =?us-ascii?Q?ftdDJ2iNqg3HV8+hmt4UYLgf0eWR1BDFDDxrt6DO28hKo3k9RIB1Q+zLeR7p?=
 =?us-ascii?Q?24tfd9h62NKgN/4/9uL8GDAtDTwLOr+FJUjKXFFwOZyA0SehYxDMPQaWt/aF?=
 =?us-ascii?Q?5Y+2qH7Oz11l0sx+q3xSHvzgIbhNIX/LzGNbQvsPZDqo6rWaYJvOnuzGudzZ?=
 =?us-ascii?Q?0O0ELe59XduCdTl2YgjfgbradSFudWTDxD0VB93HEe59D7FG8UcL+6wos6fo?=
 =?us-ascii?Q?1x6Q2FaB95tVOuEcyRZdZvT/6gzCaQehtGFCraBdrspP+aL51V0SwcVODe2a?=
 =?us-ascii?Q?5GbSOnBP5WbyY4wZ2cpFirjhY7wyBcbENrzBUEcymD2Tow2K5/N8gZSs+I5L?=
 =?us-ascii?Q?IRk0BLQnOTLIFYB3IqFYfOP8iF9/qHO4zXck5bfX9/5EauXlsadW/86LV/SY?=
 =?us-ascii?Q?rg=3D=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 81eb33cc-254f-4339-a2f5-08da7947aa61
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 14:09:53.6698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tjs0Pz0GwhPfW9p8PIBR7kP1oiC08MeYJJlr9Q5kQOKL/4x2ZEyoS5Yd/6jGz6Gm8Wnnya8ru4KJdz9tATjGpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB0618
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 14:10:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98157

From: Khem Raj <raj.khem@gmail.com>

Forward port cmake-install-libcares.pc.patch, drop the need to install
pkgconfig files as its already being done by main Makefile

Remove below two patches as well
ares_expand_name-fix-formatting-and-handling-of-root.patch
ares_expand_name-should-escape-more-characters.patch

Conflicts:
meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b65f2904191b8d309b3971d4e65c5e1701156b1c)
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 ...-fix-formatting-and-handling-of-root.patch | 115 ------------------
 ...d_name-should-escape-more-characters.patch |  90 --------------
 .../c-ares/cmake-install-libcares.pc.patch    |  27 ++--
 .../{c-ares_1.16.1.bb =3D> c-ares_1.17.1.bb}    |   6 +-
 4 files changed, 12 insertions(+), 226 deletions(-)
 delete mode 100644 meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-=
fix-formatting-and-handling-of-root.patch
 delete mode 100644 meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-=
should-escape-more-characters.patch
 rename meta-oe/recipes-support/c-ares/{c-ares_1.16.1.bb =3D> c-ares_1.17.1=
.bb} (76%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-fix-for=
matting-and-handling-of-root.patch b/meta-oe/recipes-support/c-ares/c-ares/=
ares_expand_name-fix-formatting-and-handling-of-root.patch
deleted file mode 100644
index d1cb54aefb..0000000000
--- a/meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-fix-formatting=
-and-handling-of-root.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-From: bradh352 <brad@brad-house.com>
-Date: Fri, 11 Jun 2021 12:39:24 -0400
-Subject: [2/2] ares_expand_name(): fix formatting and handling of root nam=
e
- response
-Origin: https://github.com/c-ares/c-ares/commit/44c009b8e62ea1929de68e3f43=
8181bea469ec14
-Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2021-=
3672
-
-Fixes issue introduced in prior commit with formatting and handling
-of parsing a root name response which should not be escaped.
-
-Fix By: Brad House
-CVE: CVE-2021-3672
-Upstream-Status: Backport [http://snapshot.debian.org/archive/debian-secur=
ity/20210810T064453Z/pool/updates/main/c/c-ares/c-ares_1.17.1-1%2Bdeb11u1.d=
ebian.tar.xz]
-Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
----
- ares_expand_name.c | 62 ++++++++++++++++++++++++--------------
- 1 file changed, 40 insertions(+), 22 deletions(-)
-
-diff --git a/ares_expand_name.c b/ares_expand_name.c
-index f1c874a97cfc..eb9268c1ff0a 100644
---- a/ares_expand_name.c
-+++ b/ares_expand_name.c
-@@ -127,27 +127,37 @@ int ares_expand_name(const unsigned char *encoded, c=
onst unsigned char *abuf,
-         }
-       else
-         {
--          len =3D *p;
-+          int name_len =3D *p;
-+          len =3D name_len;
-           p++;
-+
-           while (len--)
-             {
--              if (!isprint(*p)) {
--                /* Output as \DDD for consistency with RFC1035 5.1 */
--                *q++ =3D '\\';
--                *q++ =3D '0' + *p / 100;
--                *q++ =3D '0' + (*p % 100) / 10;
--                *q++ =3D '0' + (*p % 10);
--              } else if (is_reservedch(*p)) {
--                *q++ =3D '\\';
--                *q++ =3D *p;
--              } else {
--                *q++ =3D *p;
--              }
-+              /* Output as \DDD for consistency with RFC1035 5.1, except
-+               * for the special case of a root name response  */
-+              if (!isprint(*p) && !(name_len =3D=3D 1 && *p =3D=3D 0))
-+                {
-+
-+                  *q++ =3D '\\';
-+                  *q++ =3D '0' + *p / 100;
-+                  *q++ =3D '0' + (*p % 100) / 10;
-+                  *q++ =3D '0' + (*p % 10);
-+                }
-+              else if (is_reservedch(*p))
-+                {
-+                  *q++ =3D '\\';
-+                  *q++ =3D *p;
-+                }
-+              else
-+                {
-+                  *q++ =3D *p;
-+                }
-               p++;
-             }
-           *q++ =3D '.';
-         }
--    }
-+     }
-+
-   if (!indir)
-     *enclen =3D aresx_uztosl(p + 1U - encoded);
-
-@@ -194,21 +204,29 @@ static int name_length(const unsigned char *encoded,=
 const unsigned char *abuf,
-         }
-       else if (top =3D=3D 0x00)
-         {
--          offset =3D *encoded;
-+          int name_len =3D *encoded;
-+          offset =3D name_len;
-           if (encoded + offset + 1 >=3D abuf + alen)
-             return -1;
-           encoded++;
-+
-           while (offset--)
-             {
--              if (!isprint(*encoded)) {
--                n +=3D 4;
--              } else if (is_reservedch(*encoded)) {
--                n +=3D 2;
--              } else {
--                n +=3D 1;
--              }
-+              if (!isprint(*encoded) && !(name_len =3D=3D 1 && *encoded =
=3D=3D 0))
-+                {
-+                  n +=3D 4;
-+                }
-+              else if (is_reservedch(*encoded))
-+                {
-+                  n +=3D 2;
-+                }
-+              else
-+                {
-+                  n +=3D 1;
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
diff --git a/meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-should-=
escape-more-characters.patch b/meta-oe/recipes-support/c-ares/c-ares/ares_e=
xpand_name-should-escape-more-characters.patch
deleted file mode 100644
index 3603ef1278..0000000000
--- a/meta-oe/recipes-support/c-ares/c-ares/ares_expand_name-should-escape-=
more-characters.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From: bradh352 <brad@brad-house.com>
-Date: Fri, 11 Jun 2021 11:27:45 -0400
-Subject: [1/2] ares_expand_name() should escape more characters
-Origin: https://github.com/c-ares/c-ares/commit/362f91d807d293791008cdb761=
6d40f7784ece83
-Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2021-=
3672
-
-RFC1035 5.1 specifies some reserved characters and escaping sequences
-that are allowed to be specified.  Expand the list of reserved characters
-and also escape non-printable characters using the \DDD format as
-specified in the RFC.
-
-Bug Reported By: philipp.jeitner@sit.fraunhofer.de
-Fix By: Brad House (@bradh352)
-CVE: CVE-2021-3672
-Upstream-Status: Backport [http://snapshot.debian.org/archive/debian-secur=
ity/20210810T064453Z/pool/updates/main/c/c-ares/c-ares_1.17.1-1%2Bdeb11u1.d=
ebian.tar.xz]
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
- static int name_length(const unsigned char *encoded, const unsigned char =
*abuf,
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
-@@ -111,9 +131,18 @@ int ares_expand_name(const unsigned char *encoded, co=
nst unsigned char *abuf,
-           p++;
-           while (len--)
-             {
--              if (*p =3D=3D '.' || *p =3D=3D '\\')
-+              if (!isprint(*p)) {
-+                /* Output as \DDD for consistency with RFC1035 5.1 */
-+                *q++ =3D '\\';
-+                *q++ =3D '0' + *p / 100;
-+                *q++ =3D '0' + (*p % 100) / 10;
-+                *q++ =3D '0' + (*p % 10);
-+              } else if (is_reservedch(*p)) {
-                 *q++ =3D '\\';
--              *q++ =3D *p;
-+                *q++ =3D *p;
-+              } else {
-+                *q++ =3D *p;
-+              }
-               p++;
-             }
-           *q++ =3D '.';
-@@ -171,7 +200,13 @@ static int name_length(const unsigned char *encoded, =
const unsigned char *abuf,
-           encoded++;
-           while (offset--)
-             {
--              n +=3D (*encoded =3D=3D '.' || *encoded =3D=3D '\\') ? 2 : =
1;
-+              if (!isprint(*encoded)) {
-+                n +=3D 4;
-+              } else if (is_reservedch(*encoded)) {
-+                n +=3D 2;
-+              } else {
-+                n +=3D 1;
-+              }
-               encoded++;
-             }
-           n++;
---
-2.32.0
-
diff --git a/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.p=
c.patch b/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.p=
atch
index 0eb7e4bbb3..c6f9c6de61 100644
--- a/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
+++ b/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
@@ -1,4 +1,4 @@
-From 12414304245cce6ef0e8b9547949be5109845353 Mon Sep 17 00:00:00 2001
+From 2cc41bee63223cb398ea932aad6ecc94ff5b61dd Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 24 Jul 2018 13:33:33 +0800
 Subject: [PATCH] cmake: Install libcares.pc
@@ -11,12 +11,13 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
 update to 1.14.0, fix patch warning

 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
 ---
- CMakeLists.txt | 28 +++++++++++++++++++++++-----
- 1 file changed, 23 insertions(+), 5 deletions(-)
+ CMakeLists.txt | 23 +++++++++++++++++------
+ 1 file changed, 17 insertions(+), 6 deletions(-)

 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index fd123e1..3a5878d 100644
+index 08c0247..0020d6b 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -214,22 +214,25 @@ ADD_DEFINITIONS(${SYSFLAGS})
@@ -50,9 +51,9 @@ index fd123e1..3a5878d 100644

  # When checking for symbols, we need to make sure we set the proper
  # headers, libraries, and definitions for the detection to work properly
-@@ -554,6 +557,15 @@ CONFIGURE_FILE (ares_build.h.cmake ${PROJECT_BINARY_D=
IR}/ares_build.h)
- # Write ares_config.h configuration file.  This is used only for the buil=
d.
- CONFIGURE_FILE (ares_config.h.cmake ${PROJECT_BINARY_DIR}/ares_config.h)
+@@ -551,6 +554,15 @@ ENDIF()
+ # Record toplevel CMakeLists.txt path
+ set(CARES_TOPLEVEL_DIR "${CMAKE_CURRENT_SOURCE_DIR}")

 +# Pass required CFLAGS to pkg-config in case of static library
 +IF (CARES_STATIC)
@@ -66,19 +67,11 @@ index fd123e1..3a5878d 100644

  # TRANSFORM_MAKEFILE_INC
  #
-@@ -728,6 +740,12 @@ IF (CARES_INSTALL)
+@@ -624,7 +636,6 @@ IF (CARES_INSTALL)
        INSTALL (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcares.pc" COMPONENT =
Devel DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
  ENDIF ()

-+# pkg-config file
-+IF (CARES_INSTALL)
-+       SET (PKGCONFIG_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
-+       INSTALL (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcares.pc" DESTINATI=
ON ${PKGCONFIG_INSTALL_DIR})
-+ENDIF ()
-+
+-
  # Legacy chain-building variables (provided for compatibility with old co=
de).
  # Don't use these, external code should be updated to refer to the aliase=
s directly (e.g., Cares::cares).
  SET (CARES_FOUND 1 CACHE INTERNAL "CARES LIBRARY FOUND")
---
-2.17.1
-
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb b/meta-oe/reci=
pes-support/c-ares/c-ares_1.17.1.bb
similarity index 76%
rename from meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb
index 692a5f0d6e..de27d736ad 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb
@@ -5,16 +5,14 @@ SECTION =3D "libs"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dfb997454c8d62aa6a47f07a8cd48=
b006"

-PV =3D "1.16.1+gitr${SRCPV}"
+PV =3D "1.17.1"

 SRC_URI =3D "\
     git://github.com/c-ares/c-ares.git;branch=3Dmain;protocol=3Dhttps \
     file://cmake-install-libcares.pc.patch \
     file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch=
 \
-    file://ares_expand_name-should-escape-more-characters.patch \
-    file://ares_expand_name-fix-formatting-and-handling-of-root.patch \
 "
-SRCREV =3D "74a1426ba60e2cd7977e53a22ef839c87415066e"
+SRCREV =3D "39c73b503d9ef70a58ad1f4a4643f15b01407c66"

 UPSTREAM_CHECK_GITTAGREGEX =3D "cares-(?P<pver>\d+_(\d_?)+)"

--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

