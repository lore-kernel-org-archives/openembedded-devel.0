Return-Path: <tugrul.kukul@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B573CC53219
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 07:31:55 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6136.1785310310275458201
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2026 00:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=kqAJIJTY;
 spf=pass (domain: est.tech, ip: 40.107.162.18, mailfrom: tugrul.kukul@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOS0jfj4gPTzdZzJ5oyNB7EtxU8Or8uHz5n7rXcdxCLk/pgZLvHPY0BQjePil27Em7hpG1BisAZSGwY28iho9uBxjpx0bbsYQtnBcwDs111wSieIkj69oiK5uZUz6tV3Kt/qEYUJZMt7e4StK0NWeqk9j7cXdwdcwmre8QM0Ce7Y308ANs6MMeSdggLFK9U1VPTR3EmZQMTgkFXBTXMw8HCArnNJFuNIbK1AELE3H0wqvF0l7n1jcyqhY7SBg8KA2xDAdOXLf1BOYMYUmUxKG+uG00Z7h5z7PtFMXLub7ku0GEh8KScUXidTZ/x/P0fG2JhUWyOogHmXCVlYElscMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlq1yUkSCI/QI0XYAAA+0afA5yN5FrCgX04pGHKkhBs=;
 b=OUII9JtgjBgn7YXqDMIG3GfDy8DfxAJXlTTkDjDG4B2AQuVIR7dzIvXGNlglO1+ZAXjinIgRuZQ9gBXukZ6YPizmarIO+dTDgLscbb6gWkro61yZvKR0e5X+TI/TmGPMpDtXOtxmU7qYYZZJ/RZKQKwjFArT/LX/LdI70MhIKhRhn4n+5BjIVq8G01ANP5Jqx48h6MumtEWO0PAljZxOEZ2vxcDQvGpCLVH8IDBg4cSRlPu5K50N8fLSUkH2QRxPT6Fc5XFhfQNinVR2SNMcw5oWd8Jmrtx7i8qyiVldP6RH1veGNHxM/O+5u+HQKWs0NAjhB6+KEF+JOF3BKyve4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlq1yUkSCI/QI0XYAAA+0afA5yN5FrCgX04pGHKkhBs=;
 b=kqAJIJTYEdplh8mhkKnwHZFQz4V1C+HKqeUwZvwvIEWR5LyZXRwfmdyc3MSV3MIOQkD/Xrm5XdzawgvlGtvpdKFEahH1gORqc4F5sFP6zfZWbf6CYHqVB0uK8keUgSVxxFK5N5/mrOT13R6wGL4STg/INVtDZgyqDp2s9aQL8asCFxwQwzf6TLSruiZiXAzq764JlcEA5AFaPtQ2YHxOXh9KMQ2EJulOhFmZRtrzEjNfx3RGL44BXof+qyBBHy0oLA0RSOQhtr6x0g+Fdnl3aKYVObwiMwPChilXtX3NryqiUrqrr4bdij89wXaVRv9xLljj92B4QVV9MAhh6YKtVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB8P189MB0966.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:16b::8) by
 FRWP189MB3228.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:182::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.7; Wed, 29 Jul 2026 07:31:46 +0000
Received: from DB8P189MB0966.EURP189.PROD.OUTLOOK.COM
 ([fe80::48c:33b2:d870:d0ca]) by DB8P189MB0966.EURP189.PROD.OUTLOOK.COM
 ([fe80::48c:33b2:d870:d0ca%6]) with mapi id 15.21.0292.005; Wed, 29 Jul 2026
 07:31:46 +0000
From: tugrul.kukul@est.tech
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH] jq: fix CVE-2026-39956
Date: Wed, 29 Jul 2026 09:31:45 +0200
Message-ID: <20260729073145.25221-1-tugrul.kukul@est.tech>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P250CA0004.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:54f::19) To DB8P189MB0966.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:16b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8P189MB0966:EE_|FRWP189MB3228:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f76b0db-3226-413d-3092-08deed437236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|6133799003|3023799007|56012099006|11063799006|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	hb92U9kB3PK5WhMzF0xNIsQFQum8w45dqWqwkO5nQiPugsMN9Ap+0QuQg4HNj1HezFcknCppVJTuglgiLvK0uBNL5z9sJOz+UkfvlsDsyEw74LeA5wbVGw9cUsjkFRZ1thmA53vE6Nd0FIYD4cwd+hiVDG7GeAyy/xJkraaN48q94gMBnWEkj4PmXtHLBEWzh2RGeo+5LBZwI37xV5FydgzeqioD+U9jmmUPpjvUfXf/bac28u0kg0Zc8p2gXSuBmByxtJVly9ZMuIhm5HQHGJxwq4qMBH2rPvs8WsjDmEgORqqxS2THQeBAw4qXAm4QCSodu30EgA7/AXKv/JNwQJATnVhYuiqY2WofG3Qrpuaaiy698kvP2zbzj4eOrY0YoI45xLOYKOXYxFJe5459+VN6oJXw+ci2d6j2Oc3nbEY+w6FImnhnxCAP9ddNzHw/EaOsdH5qUq5Kn3fUSJlHHjH8zJtR44G8g4pkWhE/uSHtjBtw7xhyftWYqvWmWrEAFdnk25OXDucycjpA2gc1oT9w7aeJR/Q5ipstBxhTRnaPDGU1lnoOvbjxVNSumedr4v6tbaBPlGxUTDUx5s+Ps/zPzbaejCpdDRDqxGASqRabou8c0Ae4PgYHkOxXsK2p
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P189MB0966.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(3023799007)(56012099006)(11063799006)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cYHHmJVGjszrFpxBYUGrW8BQHjBSHLS6MUXffWqgT+zePIHlpGPlClg11Gxt?=
 =?us-ascii?Q?pSG56qniHoYIuwGsTitifqZjzfxkfEHzYFXvfIDmABQoS/DUfJrmFN4otYlG?=
 =?us-ascii?Q?sjClfie4I14gD4YyXn6uF/FfsqWgC390r/Mi9iRwnQLyD1yjT7+M9JEDBzsW?=
 =?us-ascii?Q?ubnl9PXigEpXtD61LmK/X5q+ZmBVFpVkfn8jRXLYNK2nSE1kA+klckY5HMu0?=
 =?us-ascii?Q?EuNg3gTNELhEenhhzTUEn9w45u+CO50gFl+6TWyPPDt5XU5EWTKFj0fqGpbK?=
 =?us-ascii?Q?VDKdzjgjIwqIdMsQXyzxqnCgGwEu2n2bH0UbX7u6+A5xXay0ozxngZQC45JL?=
 =?us-ascii?Q?t8fFPZ5e5iAOax0/TCTdPikCMUcAPnEzd/eyHnEsg/Jb3TCW/VZDDFGjAo9K?=
 =?us-ascii?Q?F3wAczY2OJv3r9MsFd+pSrF4Rtyt8krtAmvCVXZZVEDVNqCi5QWp1crdM29y?=
 =?us-ascii?Q?57xLD9GuBlMr3mWPjfchkGnW/HGIvwpOnLXKh5nNRMeht/it9p2kK6cuSpiR?=
 =?us-ascii?Q?XoHnC8UruQEIgFGkNnxgCo516g+/TqH6SehDnSseExBJnKKCaZeAp/3k0fGD?=
 =?us-ascii?Q?L5ufHWkU5JSBBIfNE1hYlQRhnTVBnf/CeoAuGHKb4PYvscxxxJ+h6okY7Ffh?=
 =?us-ascii?Q?Lz8r9J8nEzausO03VwWSuhoTMJi3Ux2ehVY+ji6WeAdhrld/o9bCKFZaqXbo?=
 =?us-ascii?Q?iF+XOo6+rSfSEEfRkiWGZEzITmHE/bE3f/vUo2DNyWmWv/KyeEnFQLAUYz+2?=
 =?us-ascii?Q?4JeOsMDLrlMAXjquQEGAoLs+CRFc7G9HkA+ulgmkG7jsNld9FfSIqvvEuI9z?=
 =?us-ascii?Q?8CNJTRrT+MLzsUH9cu1Mv/sfdckbGZYi75sZ6P3kLVk8XhEv6PJBJs0SLmqT?=
 =?us-ascii?Q?Fhcl84awnHReiwOY2vNWxvXPlxAOjKwGnI1spxavTwXETuP0tHtibIwDQSzn?=
 =?us-ascii?Q?K3hoztvWDs0GEFt1v2JkSLJm3cdANLCmIDH/EUbhS4I8/gPxR08FnUtNwYpL?=
 =?us-ascii?Q?+u/Rej3H0FSGVuxWU0Lv8kV3p+tJ6XIgjU4zcUCqBd1xqftGy1FZyT+Vq3Hq?=
 =?us-ascii?Q?idZbxqW+Ld8YLNabMZRFXmudUVEt8+pciosXDG0uYZPyIlF5VDpA4Y2J/agA?=
 =?us-ascii?Q?QFe3Dqs6GynlDMu4D89NizGRIt2lbQTI2N91mEtcFPOh/S5HSmOCRsMI98rD?=
 =?us-ascii?Q?6m2ojrs+7jjuLMwfb3XAZL/zek1u/2yWdBId4avnRmRnSPyz+JjB96vyqnc2?=
 =?us-ascii?Q?JqXGI956V2WsKQ0pFx2ldh2QmAB+4pWdcdKJ475CDTidRGy8cIUZqYahkuZg?=
 =?us-ascii?Q?FL4WwTF+wihTCvlMGmkhjNJPCofLLzjR3dAhn/LOzNObu6Z4nm+xFxycmkWU?=
 =?us-ascii?Q?byfdki3v2VwL45quSnllhEc9ux7R+6xWSBjIPA7OQyWFBVr7N/rikunCTrp8?=
 =?us-ascii?Q?+NHMemvrW8tEaZGkghqTSlESaDbFinrn78pYar71b6mc6c+oD++pdfVcyGzf?=
 =?us-ascii?Q?x7PkOBKlVnCV9AMA0EoiAy3L4yl5l/Q+C80y0ENROR9YYvVJ3uU+RhNM/vTR?=
 =?us-ascii?Q?KoZBZNGZaJ9Y8s4pU8XqYMYbuTqrg6gYs45+CJ1STwce0CNb2Zrn7OLSYCbY?=
 =?us-ascii?Q?vc43KC1sm4xQpIMdrvn2TQIY4qUW8uGfLs7cokYeTQgWtdOxqPJ+ouymicbi?=
 =?us-ascii?Q?7yWunnWf/NLe+fr8LCzbdYIvr0EhX/ShwQImC7pnq616c4UuQddOfoqmQced?=
 =?us-ascii?Q?xYQcJHLFTg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f76b0db-3226-413d-3092-08deed437236
X-MS-Exchange-CrossTenant-AuthSource: DB8P189MB0966.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 07:31:46.8774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zj2PXQPhUrE6WR0fPnCPw7A5l/T/3/B14HYtf/2JwUVT5QPzG3KUT4Xpqci1UuSyCleQEzR3wvnekJ2eic4kMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3228
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 07:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128550

From: Tugrul Kukul <tugrul.kukul@est.tech>

Backport patch to fix CVE-2026-39956.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-39956
  https://www.cve.org/CVERecord?id=3DCVE-2026-39956
  https://security-tracker.debian.org/tracker/CVE-2026-39956
  https://osv.dev/list?q=3DCVE-2026-39956

Upstream fix:
  https://github.com/jqlang/jq/commit/fdf8ef0f0810e3d365cdd5160de43db46f57e=
d03 [nvd]

Tested with ptest:
Before: PASSED: 7, FAILED: 0, SKIPPED: 0
After: PASSED: 7, FAILED: 0, SKIPPED: 0

Signed-off-by: Tugrul Kukul <tugrul.kukul@est.tech>
---
 .../jq/jq/CVE-2026-39956.patch                | 50 +++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-39956.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-39956.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2026-39956.patch
new file mode 100644
index 0000000000..da41b1168f
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-39956.patch
@@ -0,0 +1,50 @@
+From 8e7a4a3c01da36e0b9509b0e93a005649318e0f7 Mon Sep 17 00:00:00 2001
+From: tlsbollei <170938166+tlsbollei@users.noreply.github.com>
+Date: Wed, 8 Apr 2026 21:43:46 +0200
+Subject: [PATCH] Add runtime type checks to f_string_indexes
+
+This fixes CVE-2026-39956.
+---
+ src/builtin.c | 8 ++++++++
+ tests/jq.test | 9 +++++++++
+ 2 files changed, 17 insertions(+)
+
+diff --git a/src/builtin.c b/src/builtin.c
+index 52fe77c..ac56f9f 100644
+--- a/src/builtin.c
++++ b/src/builtin.c
+@@ -1286,6 +1286,14 @@ static jv f_string_explode(jq_state *jq, jv a) {
+ }
+=20
+ static jv f_string_indexes(jq_state *jq, jv a, jv b) {
++  if (jv_get_kind(a) !=3D JV_KIND_STRING) {
++    jv_free(b);
++    return type_error(a, "cannot be searched, as it is not a string");
++  }
++  if (jv_get_kind(b) !=3D JV_KIND_STRING) {
++    jv_free(a);
++    return type_error(b, "is not a string");
++  }
+   return jv_string_indexes(a, b);
+ }
+=20
+diff --git a/tests/jq.test b/tests/jq.test
+index 4ecf72f..07aa0cf 100644
+--- a/tests/jq.test
++++ b/tests/jq.test
+@@ -1520,6 +1520,15 @@ split("")
+ "xababababax"
+ [1,7,[1,3,5,7]]
+=20
++# _strindices is used by indices/1 but is callable
++try _strindices("abc") catch .
++123
++"number (123) cannot be searched, as it is not a string"
++
++try _strindices(123) catch .
++"abc"
++"number (123) is not a string"
++
+ # trim
+ # \u000b is vertical tab (\v not supported by json)
+ map(trim), map(ltrim), map(rtrim)
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.8.1.bb
index b213e21c57..5d2a1be398 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -27,6 +27,7 @@ SRC_URI =3D "git://github.com/jqlang/jq.git;protocol=3Dht=
tps;branch=3Dmaster;tag=3Djq-${
            file://CVE-2026-43895.patch \
            file://CVE-2026-49839.patch \
            file://CVE-2026-54679.patch \
+           file://CVE-2026-39956.patch \
            "
=20
 inherit autotools ptest

