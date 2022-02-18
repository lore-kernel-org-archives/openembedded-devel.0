Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F47C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 13:31:57 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.46])
 by mx.groups.io with SMTP id smtpd.web11.10808.1645191115766136182
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Feb 2022 05:31:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com
 header.s=selector2 header.b=t0IFkF+I;
 spf=pass (domain: siemens.com, ip: 40.107.5.46,
 mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtjJOrK/DuuG66hJ8OtS0el/VdXHgJFaRzUkT1LrUWT3b7fGLJHx8lX+uef7pY1AysjWnqe+WBJDFjQyFWQ6L49k4YJbBF9zJHfjBvlFe2hxuB1IeX9oM3Db/Eq6LePjaBuzRknf3ZAfwFZgYt2wXVoikrXcl3wQ4WTdwx2UKsOiww8C9700CQPDhqiNs7iYPRHw+/iCh6YeXyjNnKJqcr7aT80zSvvYz2AxF/VcpxYM2RzdcA1HBUlyBsQZik5XOIdzEtEgpL7e8qSmHXXISzHonkjd9fzhl/39b2egJSwvKMyogDUkEmuXem6yH6Eth0rF90QjjqgolN2ra76XXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjAiqnAuAKpVoPDWDRsihxVEy6bb4OnRp1O+qNypTo8=;
 b=it1P377eACSdpyf6A+W78Trb9CrDtS3iQuNcRAgMvX87z1t80Oq6JmJZzxRPMkmxeHpU1JzpWVHQn4XKUl/yVa88sG4y/Fg+2avOwboPK+CU7OCQcU2VT1rsQHKGXZU9pOX4oWevB/WCzEC4CoLEEz8VFFRpuaW94RehnIvL80T3YhI0BXEro3yo3y01e13xoypjcmdV0nkjgdYc7xecjZOnFLWXWaPdG6P6hJ3NG7NnJm3A/1tWzbzDuEweUtrQ3G2dTQ6VxDjnyoFpDzGcRjP4SkRc3+tjPZFkjcex5VerdXtSiaoPlxaVMU2gMw5guEf4Ein2+GO2g+eaeyQXaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjAiqnAuAKpVoPDWDRsihxVEy6bb4OnRp1O+qNypTo8=;
 b=t0IFkF+IxpOqQB1pxH58YwptBT3ZlkAZH9ktsXmpZdNmE9dSZXwm0Xc7+Ppo1Kco+zAMKlE5cIGmkJHdiV/pxr96bLLB/esryitPT/MDDh12FkgZ29rUbmlFF6IsveP+bB+wHMVhhEMYSHHlITgNZMx3EOOuyudEyqBY7igbBZ1SohK56J1qnyfQcgMi3P81jPwZMcK4wmisIyQJWYiS9TZgcNk42fJnoJCJqkwgMc19qMuzlWr234PRTUUNtezrFkAE3WZjFpVEY46YGwQqbskTd6inVl+T2cqF3gCkgk1POycY0vE419ygqP1eoR/O5z/TT8aSBDYWvzEzqbVVKQ==
Received: from AM6P192CA0079.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::20)
 by DB8PR10MB3435.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:e7::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 18 Feb
 2022 13:31:52 +0000
Received: from VE1EUR01FT017.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::83) by AM6P192CA0079.outlook.office365.com
 (2603:10a6:209:8d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Fri, 18 Feb 2022 13:31:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.70) by
 VE1EUR01FT017.mail.protection.outlook.com (10.152.2.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Fri, 18 Feb 2022 13:31:44 +0000
Received: from DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Fri, 18 Feb 2022 14:31:44 +0100
Received: from md3hr6tc.ad001.com (167.87.0.184) by
 DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Fri, 18 Feb 2022 14:31:43 +0100
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [meta-oe][PATCH] nodejs: add option to use openssl legacy providers
Date: Fri, 18 Feb 2022 14:31:21 +0100
Message-ID: <20220218133121.222269-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [167.87.0.184]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC8A1A.ad011.siemens.net (139.25.226.107)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4e26a73-b8d0-4f46-2770-08d9f2e3016a
X-MS-TrafficTypeDiagnostic: DB8PR10MB3435:EE_
X-Microsoft-Antispam-PRVS: 
	<DB8PR10MB34356D890EEB72DE9A6843F992379@DB8PR10MB3435.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Gan+pOcABwnMfWl6Mxet3IlEJ6ewXoCC8SNxCUbeMoR0/Ze1WIMFPn8DvrtOQ0W9KdwwH98Ay5gKme6oGmcdKcAzRdP/ANyvB7ipGRCXa1G5TXnlHofDbAndMeLUP59VTkzb3DbKfuXfI25BDbIrwbp7Fmp1nWFEXj5ibdZigc8muIUoViUy03ncjoAp2id+Iqdec/4UCuYP1ie424FfbMzDu4hLa7Eacg6kfLhJNmiYIsP+NCEdGqC+jOAN1E2P6D5e89dnAjBdsKJWxfyGspo7EKSAWGujRPcVR5FEaLtkviMk1fbAnAFsDxsvbmpe+axPkUeZZo0hxFCkU0fnUaYpUoPvLRm6tXKkmPrSoGnA1OGuEJL2rji6vyDkeFRBw/M9i5n1sFdUnS+c3KQ3LbF64qaBOUkZCxDDjZG0ej4tIJrpSKUNSSJHraehzx5xWx2cSPAMIoShisyXnEUJXpK5gMVIGNmO/llLncDU50WobA926as9nHWnE7g3eGuvYKJpCDsyYADs84wyDuFauHUPLGqP1Kfk7FD+BdEjpt5Kp6y5ECLs3LrGpsTfC93KtJe3yz80Kw1Tgh9tr8kngAlUFwgP6a8aof+OnX0Ba0oLC4sw8M36B+2yE9sNIX4MoRuiAiXIofUG254QGdTZimXGTgz3hmrV3I6G+G3CSXtMK8aMONnnaoXDKB3GyY0POXrLimWjn0+ACmrMQmRZyHYpi2OcEm2jxuI9t/cLT+b4afhL6BMdhoopajj//aXhdkJxAVk+xE5rGMmH8U0WSQD0c1By60jFY0aMBxHkeJ94G847aobtxpSdG92CvGdujqNNzW0uWMQUepH5uPNyaw==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.70;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(16526019)(508600001)(83380400001)(82960400001)(44832011)(2906002)(966005)(956004)(70586007)(19627235002)(40460700003)(1076003)(2616005)(82310400004)(8676002)(70206006)(8936002)(4326008)(107886003)(316002)(6916009)(5660300002)(86362001)(47076005)(26005)(186003)(7596003)(7636003)(356005)(36756003)(336012)(16799955002)(6666004)(36860700001)(19607625012);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 13:31:44.4399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b4e26a73-b8d0-4f46-2770-08d9f2e3016a
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.70];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT017.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3435
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Feb 2022 13:31:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95374

Current nodejs version does not fully support new OpenSSL, so add option
to use legacy provider.

|   opensslErrorStack: [ 'error:03000086:digital envelope routines::initial=
ization error' ],
|   library: 'digital envelope routines',
|   reason: 'unsupported',
|   code: 'ERR_OSSL_EVP_UNSUPPORTED'

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 ...5-add-openssl-legacy-provider-option.patch | 165 ++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_16.11.1.bb |   1 +
 2 files changed, 166 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl=
-legacy-provider-option.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy=
-provider-option.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-op=
enssl-legacy-provider-option.patch
new file mode 100644
index 000000000..2e66a0282
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provid=
er-option.patch
@@ -0,0 +1,165 @@
+From 86d1c0cc6a5dcf57e413a1cc1c29203e87cf9a14 Mon Sep 17 00:00:00 2001
+From: Daniel Bevenius <daniel.bevenius@gmail.com>
+Date: Sat, 16 Oct 2021 08:50:16 +0200
+Subject: [PATCH] src: add --openssl-legacy-provider option
+
+This commit adds an option to Node.js named --openssl-legacy-provider
+and if specified will load OpenSSL 3.0 Legacy provider.
+
+$ ./node --help
+...
+--openssl-legacy-provider  enable OpenSSL 3.0 legacy provider
+
+Example usage:
+
+$ ./node --openssl-legacy-provider  -p 'crypto.createHash("md4")'
+Hash {
+  _options: undefined,
+  [Symbol(kHandle)]: Hash {},
+  [Symbol(kState)]: { [Symbol(kFinalized)]: false }
+}
+
+Co-authored-by: Richard Lau <rlau@redhat.com>
+
+Refs: https://github.com/nodejs/node/issues/40455
+---
+ doc/api/cli.md                                         | 10 ++++++++++
+ src/crypto/crypto_util.cc                              | 10 ++++++++++
+ src/node_options.cc                                    | 10 ++++++++++
+ src/node_options.h                                     |  7 +++++++
+ .../test-process-env-allowed-flags-are-documented.js   |  5 +++++
+ 5 files changed, 42 insertions(+)
+
+diff --git a/doc/api/cli.md b/doc/api/cli.md
+index 74057706bf8d..608b9cdeddf1 100644
+--- a/doc/api/cli.md
++++ b/doc/api/cli.md
+@@ -652,6 +652,14 @@ Load an OpenSSL configuration file on startup. Among =
other uses, this can be
+ used to enable FIPS-compliant crypto if Node.js is built
+ against FIPS-enabled OpenSSL.
+=20
++### `--openssl-legacy-provider`
++<!-- YAML
++added: REPLACEME
++-->
++
++Enable OpenSSL 3.0 legacy provider. For more information please see
++[providers readme][].
++
+ ### `--pending-deprecation`
+ <!-- YAML
+ added: v8.0.0
+@@ -1444,6 +1452,7 @@ Node.js options that are allowed are:
+ * `--no-warnings`
+ * `--node-memory-debug`
+ * `--openssl-config`
++* `--openssl-legacy-provider`
+ * `--pending-deprecation`
+ * `--policy-integrity`
+ * `--preserve-symlinks-main`
+@@ -1814,6 +1823,7 @@ $ node --max-old-space-size=3D1536 index.js
+ [emit_warning]: process.md#process_process_emitwarning_warning_type_code_=
ctor
+ [jitless]: https://v8.dev/blog/jitless
+ [libuv threadpool documentation]: https://docs.libuv.org/en/latest/thread=
pool.html
++[providers readme]: https://github.com/openssl/openssl/blob/openssl-3.0.0=
/README-PROVIDERS.md
+ [remote code execution]: https://www.owasp.org/index.php/Code_Injection
+ [timezone IDs]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zo=
nes
+ [ways that `TZ` is handled in other environments]: https://www.gnu.org/so=
ftware/libc/manual/html_node/TZ-Variable.html
+diff --git a/src/crypto/crypto_util.cc b/src/crypto/crypto_util.cc
+index 7e0c8ba3eb60..796ea3025e41 100644
+--- a/src/crypto/crypto_util.cc
++++ b/src/crypto/crypto_util.cc
+@@ -136,6 +136,16 @@ void InitCryptoOnce() {
+   }
+ #endif
+=20
++#if OPENSSL_VERSION_MAJOR >=3D 3
++  // --openssl-legacy-provider
++  if (per_process::cli_options->openssl_legacy_provider) {
++    OSSL_PROVIDER* legacy_provider =3D OSSL_PROVIDER_load(nullptr, "legac=
y");
++    if (legacy_provider =3D=3D nullptr) {
++      fprintf(stderr, "Unable to load legacy provider.\n");
++    }
++  }
++#endif
++
+   OPENSSL_init_ssl(0, settings);
+   OPENSSL_INIT_free(settings);
+   settings =3D nullptr;
+diff --git a/src/node_options.cc b/src/node_options.cc
+index 00bdc6688a4c..3363860919a9 100644
+--- a/src/node_options.cc
++++ b/src/node_options.cc
+@@ -4,6 +4,9 @@
+ #include "env-inl.h"
+ #include "node_binding.h"
+ #include "node_internals.h"
++#if HAVE_OPENSSL
++#include "openssl/opensslv.h"
++#endif
+=20
+ #include <errno.h>
+ #include <sstream>
+@@ -809,6 +812,13 @@ PerProcessOptionsParser::PerProcessOptionsParser(
+             &PerProcessOptions::secure_heap_min,
+             kAllowedInEnvironment);
+ #endif
++#if OPENSSL_VERSION_MAJOR >=3D 3
++  AddOption("--openssl-legacy-provider",
++            "enable OpenSSL 3.0 legacy provider",
++            &PerProcessOptions::openssl_legacy_provider,
++            kAllowedInEnvironment);
++
++#endif  // OPENSSL_VERSION_MAJOR
+   AddOption("--use-largepages",
+             "Map the Node.js static code to large pages. Options are "
+             "'off' (the default value, meaning do not map), "
+diff --git a/src/node_options.h b/src/node_options.h
+index fd772478d04d..1c0e018ab16f 100644
+--- a/src/node_options.h
++++ b/src/node_options.h
+@@ -11,6 +11,10 @@
+ #include "node_mutex.h"
+ #include "util.h"
+=20
++#if HAVE_OPENSSL
++#include "openssl/opensslv.h"
++#endif
++
+ namespace node {
+=20
+ class HostPort {
+@@ -251,6 +255,9 @@ class PerProcessOptions : public Options {
+   bool enable_fips_crypto =3D false;
+   bool force_fips_crypto =3D false;
+ #endif
++#if OPENSSL_VERSION_MAJOR >=3D 3
++  bool openssl_legacy_provider =3D false;
++#endif
+=20
+   // Per-process because reports can be triggered outside a known V8 cont=
ext.
+   bool report_on_fatalerror =3D false;
+diff --git a/test/parallel/test-process-env-allowed-flags-are-documented.j=
s b/test/parallel/test-process-env-allowed-flags-are-documented.js
+index 64626b71f019..8a4e35997907 100644
+--- a/test/parallel/test-process-env-allowed-flags-are-documented.js
++++ b/test/parallel/test-process-env-allowed-flags-are-documented.js
+@@ -40,6 +40,10 @@ for (const line of [...nodeOptionsLines, ...v8OptionsLi=
nes]) {
+   }
+ }
+=20
++if (!common.hasOpenSSL3) {
++  documented.delete('--openssl-legacy-provider');
++}
++
+ // Filter out options that are conditionally present.
+ const conditionalOpts =3D [
+   {
+@@ -47,6 +51,7 @@ const conditionalOpts =3D [
+     filter: (opt) =3D> {
+       return [
+         '--openssl-config',
++        common.hasOpenSSL3 ? '--openssl-legacy-provider' : '',
+         '--tls-cipher-list',
+         '--use-bundled-ca',
+         '--use-openssl-ca',
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb b/meta-oe/re=
cipes-devtools/nodejs/nodejs_16.11.1.bb
index 72fbecb8f..7d8f08a38 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.11.1.bb
@@ -20,6 +20,7 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.ta=
r.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
            file://0002-Install-both-binaries-and-use-libdir.patch \
            file://0004-v8-don-t-override-ARM-CFLAGS.patch \
+           file://0005-add-openssl-legacy-provider-option.patch \
            file://big-endian.patch \
            file://mips-less-memory.patch \
            file://system-c-ares.patch \
--=20
2.34.1


