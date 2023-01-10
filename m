Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A35C5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 12:45:20 +0000 (UTC)
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com (CHE01-ZR0-obe.outbound.protection.outlook.com [40.107.24.53])
 by mx.groups.io with SMTP id smtpd.web10.108971.1673369222906882280
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 08:47:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@spinetix.com header.s=selector2 header.b=VapjcgHC;
 spf=pass (domain: spinetix.com, ip: 40.107.24.53, mailfrom: valeria.petrov@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCc+ebPTMvnQGR8hYcpIggF4sbmb72C4+8I0CoiNXB7Vq65k/3BJVLhxUgNrKTSKPwCcvdtKiEkGpCe4WRlQy5tbUbVhc9+awf7B/1MNJO0J8pER6eeyF7VUeEGcdbsQohnYhgLfKoLhJIwLWGWleyRIm/vzS/KFFXrzP/NVaVEfc+W2zfInZYwBSblUeXN4p4BcTsruc3TjIj/5e+brPWmXUcKbQ9GY2AVg4m7IOrCMu0VT1FvnxWD5rNsjeTrGmh2kyLmIMabAKDD07Olw4kWjr88IOLg1b6RjMT6YdK/3yhY1ihSNpK/4gN4Ti7nPqEcmyE+aurrAM8Kd0VLx/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87kI8MTKmoRzMLJ3FEtWOvQJQ8hn9CxUvpVz2euwmrw=;
 b=McwmtvuZF31P9H+9nzPLKWn6apQ7xhg1XAyG16w3mlXZiR80sAcYSvmy5hgPZrE1XcaSzxs2UMq/3kW8k7vMqMjAEoUHoufLhMvAp6H+6dKqcqVuCjrXtCF3enXZbQO44J+LBvPjqCjXn11JPyj7b6z7cv8BkTwBaF4zl8iuPqW5RjIeXvrOE2psH7/6b82LjNA4zzXecWMQG8s14aFZANOy329eky82+jkMx/wFpTbQVow27znI43I1/J6k2/mfGyesOKzL0KTxqLRb0OsJgIW/+UUPSn1PeOHx4VEDkHhVDTqiXmo0sGl0F1bdopVlxkrBvGGasLz712PAUPsuHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87kI8MTKmoRzMLJ3FEtWOvQJQ8hn9CxUvpVz2euwmrw=;
 b=VapjcgHCAzN/dI561mnoHS5uCgX8sfsTiIqH+BtT6poNjMCeSvwqpeoTxqhXWFDtNng6O0CkjcpGk68a0lVNgw1K7j27N25zW89PIj4yrCRvBGv5ByE1GCpBhwmOie0rIfSKho5HEhEs8+tl2bY3ItFwg7LJduNbb4GQUoRvGwI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=spinetix.com;
Received: from ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:30::12)
 by ZRAP278MB0160.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 16:47:00 +0000
Received: from ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3a4b:440a:5f47:ed17]) by ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3a4b:440a:5f47:ed17%7]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 16:47:00 +0000
From: "Valeria Petrov" <valeria.petrov@spinetix.com>
To: openembedded-devel@lists.openembedded.org
CC: wangmy <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH] apache2: upgrade 2.4.53 -> 2.4.54
Date: Tue, 10 Jan 2023 17:46:16 +0100
Message-ID: <20230110164616.15252-1-valeria.petrov@spinetix.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: ZR0P278CA0169.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::16) To ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:30::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR0P278MB0379:EE_|ZRAP278MB0160:EE_
X-MS-Office365-Filtering-Correlation-Id: 3447afd2-ad0d-4010-ba3f-08daf32a4b0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sqHsw4Rb1JuULFqx+eb0m8QEwcAoCUId6gHYbWbylEUDj9UuwWElxZYihC+muv33L8y9kADctGPGgM1PRUQEjHCWnyr8IDhkvFeIiFMq5VaLFklc1DXgiHraH6oDGDQsxPXg+zY/dMRcu+enQedJsQQa0OKgxxT8jLK+0bXr1lZ4JzX37gWffzaYSsHjoK1iHlsjICYj8ggupHasUpMkd6nzUJWADDuEHxu9T38gzAzpXGPINcQAsdV7mQ7DBeJaPm4Kfk/n5xB3XPbujOoVUNSjXGawmp3S0/Xg/s2fCKv9OXmAKPzEm+StMQlAVJpml4APUJvBv8JgMLhqluYIH7JUabmIzJR6R8irCryMjS6Tlc76BOWOK8HoSQ7BvCsyyG3PGj0TP9dc68pcgj0Jv6Ol8DPiLBYlkVjp+MnA59GNCfaUnaK9WQDYvbHAH8hAUhJrHm7IctG73e7k1OQBWWoLudw9GH9E4zQGpSXoFFBng29dp2xskmNVDY1drfqX08/LM0FGc6GGI3RIdoxLxhLGgZOGQvCfFQ6iTRa/szLYYVYJA9MsHXr2Gpt2MITrxxiXMHT5kLTQnstTeG/wfB0/y1YudO0FLEGsj68cYr+MAaao0d1sb7zR2ouWNW429h0VQQHVlqyP8psRlgN/VAcvoN+SrwccHZIkkNZUzOuYqutoy044ohD/UfgkFyLWd7tJAn6bSNlFPgSO57tdjMxMioZ3wow8pWB/4RYf9bo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39840400004)(136003)(396003)(346002)(366004)(451199015)(44832011)(2906002)(83380400001)(2616005)(1076003)(66476007)(66556008)(52116002)(6916009)(5660300002)(66946007)(6666004)(53546011)(8936002)(26005)(186003)(36756003)(6506007)(6512007)(478600001)(38350700002)(38100700002)(6486002)(54906003)(8676002)(41300700001)(86362001)(966005)(316002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?C5DvCseZH5LaWNi8KzUxKxsHICJZUFvxzLFjfIVpHr/3vGhubA706RJCchaX?=
 =?us-ascii?Q?wKs9N10wb8T4EXW4QeNsvERqIAJ9d+6UeE5KQKw6Xw8eueeicY75wYnxZ11O?=
 =?us-ascii?Q?kIc/nfYcjgy0AqrPWDMucWUx47eaP5b9ex2lWz37ereYck97rUKovfh3MCjA?=
 =?us-ascii?Q?twaf85Jbbpdj9j6uCuUdnJDdGsP8TIncmyzz9Xi85prRPlY12JjIZEiLKLdW?=
 =?us-ascii?Q?XMre7ksbNTp5qYnd2qlG0SG27eFAUAxN81t9LNCb0rz0lt9UE6UqtLM/8Lih?=
 =?us-ascii?Q?anO2QwALvenb+Dsg5ijpYPr2oXi8VyLxaEOykrUpCstN0Y0xIDi/WsI81/tm?=
 =?us-ascii?Q?nXJRT6nAIbLibJ8HQkRDj1AJiZi2h0B49RgNJVJnTP4YVAxlsHz++cAEqrDf?=
 =?us-ascii?Q?WF/bOCCUTADzIz9QuZvvseLyZgHoyIzQ//TCyHFApzvFhBARP68u2MraBSN9?=
 =?us-ascii?Q?nAz6me9L87UwJy2ckVme29LVwkto5O8yP2RizSpvljQxGpW3/xQsSoesj5Y2?=
 =?us-ascii?Q?sEFfxtAWhSYP253sb4zelfwksiwaMWaLlEXdY+IiEN9pC5GFcI7tlvNmCMsD?=
 =?us-ascii?Q?x0qgPLUB3ZguOtGroqXHRv2hb9ytodW0EWORD0IPoqskf3lGbXeqfshMnI8q?=
 =?us-ascii?Q?436EJFi+Oj50fVMk0FQe8vx8tZe3NSB3ng/EI1HlyW44zH7NCch8CEsrdd/w?=
 =?us-ascii?Q?a1waIE0WzwMLhsfxmVF9uJKkaubK5+eGemo7uvxYzOsDQLvsu5CFC8QbMFZt?=
 =?us-ascii?Q?wFenCewAEUVwPpRh495jf0chfgrwSwvigb4iakPapeOm3et5uGEvrLFzGvtf?=
 =?us-ascii?Q?yF30DcLe9LlSSigSaKNMpdDxQVQgjE1lq7wmwv5g/4M9omRzW5rR3PrnsCzH?=
 =?us-ascii?Q?5qZVE7lDtQPiTtujbkmP9RetMZ0fFB++O3P7+mbhgSeNKvBXtt9rtQd9EZuS?=
 =?us-ascii?Q?fM1V0igKm89QhYlEWQAxQFA1AI1CytoCl57vaXdWq8IQVFg3j4DmDN8tEXEZ?=
 =?us-ascii?Q?6PlMAEXJ9cv593A7MQ363sSU8BVS8DUk8WL1CEXp/+hMitxWq6nV04Y9+Z0W?=
 =?us-ascii?Q?iD6ERjLViE6CO2EgmcjdEWzb4wbaX/00SjCkC0z14rt1u2w4BNea4CRoCvsJ?=
 =?us-ascii?Q?aIrrMxjGVoQHSPy0C/Ps/bKZ5JwvAQEuVnzEj0NnjlhF/z/ADGqcFVnqd37k?=
 =?us-ascii?Q?hFP8ukoM9XyolWdCSZbEjg+UR/1EcieHEe3MrNCliZlF+sFnA3WLDXMTw90S?=
 =?us-ascii?Q?f8loooF9Xt90wHhjEHopRL/2zN7OUEbjYmIT+8ArNjswa5sbddaPvPGAmjot?=
 =?us-ascii?Q?aP2lzN4SAu0q1DJYI6vyzQLi7Ij/BFjid/e6a2oL/KRQ/e+htNiZFdcFUe3g?=
 =?us-ascii?Q?lOP/lskkAZbdIZXaFMsOzz4SGShrgYYL2JCeAlTUwfrs6NvilbyQ4q09kO1V?=
 =?us-ascii?Q?o8wWILmojpkCz6ERwbgaZF1e/zW5Q48vrhzLKSBLixT7Stu3fxsOJ6tOJOD4?=
 =?us-ascii?Q?8T+P8DoXlqjd8s9cQrFctH+uqSDrIo0jxC9IqKOYnvpf8zUi+cGVMaUHClos?=
 =?us-ascii?Q?Ib2oCn3dPxwKI3uBKuOFk7oZXFuDLv8m98KOEQ76wQtNHI5daXN/CEzUulq8?=
 =?us-ascii?Q?Qw=3D=3D?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3447afd2-ad0d-4010-ba3f-08daf32a4b0b
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0379.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 16:47:00.0377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Lyj3/oa8sfvKC6oIBZl9R9gyg2m+nFYz/XgAtSGejb9xW2GAwXpCUe4kYEGAhVjF3GM0K/Q6N/DcITPiwB/wcQMt6fb1ElQEu15da8BgqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0160
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 12:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100550

From: wangmy <wangmy@fujitsu.com>

0004-apache2-log-the-SELinux-context-at-startup.patch
refresh for new version.

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.54

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-apache2-log-the-SELinux-context-at-startup.patch | 12 +++++-------
 .../apache2/{apache2_2.4.53.bb =3D> apache2_2.4.54.bb} |  2 +-
 2 files changed, 6 insertions(+), 8 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.53.bb =3D> apache=
2_2.4.54.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-=
the-SELinux-context-at-startup.patch b/meta-webserver/recipes-httpd/apache2=
/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
index 5d82919685..3b080f54f6 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SEL=
inux-context-at-startup.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SEL=
inux-context-at-startup.patch
@@ -1,4 +1,4 @@
-From 37699e9be04d83c5923644e298f400e077f76e85 Mon Sep 17 00:00:00 2001
+From e47cc405eadcbe37a579c375e824e20a5c53bfad Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 17 Jul 2012 11:27:39 +0100
 Subject: [PATCH] Log the SELinux context at startup.
@@ -8,13 +8,14 @@ Log the SELinux context at startup.
 Upstream-Status: Inappropriate [other]
=20
 Note: unlikely to be any interest in this upstream
+
 ---
  configure.in  |  5 +++++
  server/core.c | 26 ++++++++++++++++++++++++++
  2 files changed, 31 insertions(+)
=20
 diff --git a/configure.in b/configure.in
-index c799aec..76811e7 100644
+index ea6cec3..92b74b7 100644
 --- a/configure.in
 +++ b/configure.in
 @@ -491,6 +491,11 @@ getloadavg
@@ -30,7 +31,7 @@ index c799aec..76811e7 100644
  [AC_TRY_RUN(#define _GNU_SOURCE
  #include <unistd.h>
 diff --git a/server/core.c b/server/core.c
-index 3020090..8fef5fd 100644
+index 4da7209..d3ca25b 100644
 --- a/server/core.c
 +++ b/server/core.c
 @@ -65,6 +65,10 @@
@@ -43,7 +44,7 @@ index 3020090..8fef5fd 100644
 +
  /* LimitRequestBody handling */
  #define AP_LIMIT_REQ_BODY_UNSET         ((apr_off_t) -1)
- #define AP_DEFAULT_LIMIT_REQ_BODY       ((apr_off_t) 0)
+ #define AP_DEFAULT_LIMIT_REQ_BODY       ((apr_off_t) 1<<30) /* 1GB */
 @@ -5126,6 +5130,28 @@ static int core_post_config(apr_pool_t *pconf, apr_=
pool_t *plog, apr_pool_t *pte
      }
  #endif
@@ -73,6 +74,3 @@ index 3020090..8fef5fd 100644
      return OK;
  }
 =20
---=20
-2.25.1
-
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb b/meta-=
webserver/recipes-httpd/apache2/apache2_2.4.54.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
index 225f6fc4f6..2fdf926292 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
@@ -26,7 +26,7 @@ SRC_URI:append:class-target =3D " \
            "
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbddeddfac80b2c9a882241d008bb41c=
3"
-SRC_URI[sha256sum] =3D "d0bbd1121a57b5f2a6ff92d7b96f8050c5a45d3f14db118f64=
979d525858db63"
+SRC_URI[sha256sum] =3D "eb397feeefccaf254f8d45de3768d9d68e8e73851c49afd5b7=
176d1ecf80c340"
=20
 S =3D "${WORKDIR}/httpd-${PV}"
=20
--=20
2.25.1


