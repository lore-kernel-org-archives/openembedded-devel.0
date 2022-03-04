Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7773C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 13:38:56 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.63])
 by mx.groups.io with SMTP id smtpd.web08.6870.1646401135291730110
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 05:38:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com
 header.s=selector2 header.b=Dftj+gsY;
 spf=pass (domain: siemens.com, ip: 40.107.6.63,
 mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBcPmoWjz7/0B0xe/+WKXQ1JLCF6DVGU37YrC1mZEuD5Pv6IJiXjbmDIA+P3HevMmGnoQFAPuUkbtUAaUPFQbxpj4R/UGR+Ag8AtBccuKyP+H5LxUANOjYFyxjkaB3eD9VZ14Al1XlPEqLRnmAJPMeWCjXjuiQbKtPyIuymeNVt9bGIcKSuNRbirPsIIy9gn+5mJaSRdvmoriR+AByHJO+I3hJ07+LzGKZWthqlGaQLxuuVKl7tUdjxLzeA2pw1MUE5W0YxnotH5iGFU6Q3RIyBfhr26LmHIw1QXQx3pHjlcT9RIOlhp75K8wXX9+1IzWNYwPiLK/fYUS4XEgwB2Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hy4tx9Cy/YjZ0REv3tymxLhfgbAwUofUS+wVQRr0Cw0=;
 b=FnEli1FraW2xo0f3Lk+IibGRLJsIOMS/6UvIhLDG9Bp/f+9kRBv6lmclXRr43YuhgzoKmLkxLhUrbE4yZEUFol5e6LAHNwX4J10lnXWXk0XI5PpVNzwVnvGXoH6354crtugd2xSiOxE22XIrJ6h4KAeU1DUfSZ6TXwuTW3tzv9T2GKdsqOCwE96B1+E/LnVZ4TPzb7khKD7a3jc5XryVJ0F1aIlPAOsi0vJnDqOgY8UpyQ1/Rjz6c8H4A3qKXNTVImz67WvDjBsD9iGJVdXuX8+kuSk2Mup2ZvTCo0/6X0HYK9nk8PZC73QqlY77lYZtHs/soPDB6HPNqBlpX8oASw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.72) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hy4tx9Cy/YjZ0REv3tymxLhfgbAwUofUS+wVQRr0Cw0=;
 b=Dftj+gsYa90139kx2zfxo4gJqJDrVlhB/oEMJdgYsR8Msttcl6BZ/bPPeqaRnbNBgTvdMscys7Rqg53xoM1H5AYFTl+nBmPZLPKD7qjEJc8tcuM0dbUnZK5Apwni7LXDOV1qmiRI79BBdC6AcbKL1J19htkBU2wBsHb1hhAa69F7Swwzbd0XXL5mfa+6QbDu+9d1i/iADwOGW9GtmD04ahVBkhO48l0Qz6vXxkp5/xJgnQBKfDJQUtCVZvgD3qAcQkfgNpOA6Xga/Mm2beWt1Ppx+omfhc6kK7ozmKlvXPDKs3xahp5uzv785OzwJXTo24NqbS2Na/6WJaZlss7MTA==
Received: from DB6PR07CA0093.eurprd07.prod.outlook.com (2603:10a6:6:2b::31) by
 VI1PR10MB1870.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:2b::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14; Fri, 4 Mar 2022 13:38:51 +0000
Received: from DB5EUR01FT058.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::bd) by DB6PR07CA0093.outlook.office365.com
 (2603:10a6:6:2b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.4 via Frontend
 Transport; Fri, 4 Mar 2022 13:38:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.72)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.72 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.72; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.72) by
 DB5EUR01FT058.mail.protection.outlook.com (10.152.5.46) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Fri, 4 Mar 2022 13:38:51 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SMA.ad011.siemens.net (194.138.21.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Fri, 4 Mar 2022 14:38:50 +0100
Received: from md3hr6tc.lan (139.22.142.58) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 4 Mar
 2022 14:38:50 +0100
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <zboszor@gmail.com>, Andrej Valek <andrej.valek@siemens.com>
Subject: [meta-oe][PATCH] nodejs: add option to use openssl legacy providers
 again
Date: Fri, 4 Mar 2022 14:38:21 +0100
Message-ID: <20220304133822.68214-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.22.142.58]
X-ClientProxiedBy: DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--26.485300-8.000000
X-TMASE-MatchedRID: j3YPZbzJawm2x2RCqMUOG8YIEjovlnI0/0dTUjHNqgnwbwIBMSBLpheK
	/B+WKxKsvn1ivDdpAIfEI0HXRl4Jiw2uUFCwSsFl64qbK8yD9G+PIr9Wpu0YXEk+SUI1oSQGTJD
	l9FKHbrn5+tteD5RzhUwSeVQnSS/FKtCISd3FwWNU3OGdAGcyuqo9NRZVgWnaJxGpoclVv6cyGi
	aSs0n67DalbI4VqH1T0u5faGP8ztR6cjX782n8TZXWdqLuuHMJS59K/m7KmMXfhvTQ/n1nGVBij
	jE0XjY+QqrdMz6+UQJjaJHsrxZyzMZTkhkQFUsT6hyvCHatgOkF8yB8hg5rpcYv//yaWh0DtjHG
	WON8yeN8vx8dQICa6yo2silMysLZ6wuiPvGSm820iW0GEhnvo3jxgHkp9duCi3TrOhAURKHAmOf
	zKotTomNDqjXOO0Ye6FzXElHDDuYGdeQ1ijC40krvE+SXHe+U3H7LcTAG9qvvZFvZsQkL7ds4cz
	eOsnG0B0L0/Ut7x1AzQRjuLeyE5VumfMJYVWq73MvMzyAFeBsNSMRUTa6L+JN65fjGjYMQNLtjs
	6Z/hp4gUEQTkIWiYrTs1mMviNKd49sgdKeRE1Xrspb/UL64oq9cn4VoImQ2GjzBgnFZvQ4gT/sX
	tGXrfz2TeeJyPHRMmUDgikHuA05WvUGuvanYAUcfJLLjzTpxe59kLQ/P5aQCLBN7QiqNl5cE9F6
	aLBE1YTe8VvsL0BLdv5daCe1kp6jsmP7u2o7Nhk0KaeD0Gl8vW+23dfanRZ4CIKY/Hg3Am4n49v
	yf9XHQBQ8SBUzMX4v4ihlXSKxevECLuM+h4RB+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--26.485300-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 
 5AE048559C451ECF89CC9324EAA12833F883276E3DF798788AF60931FAB66CEE2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbdaff55-f48d-4d9a-0bb6-08d9fde45181
X-MS-TrafficTypeDiagnostic: VI1PR10MB1870:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR10MB187075A6F1610DB9821B7D5C92059@VI1PR10MB1870.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ED3PDz91sCqwBQyTV5+/of/tI+2kslJuHx0AND+wr0j5QOP2MSdN9NLTBs9R/EzcIOu2jF96HXJnlLVlZPyOhIJB4DY9c4qRpM5IvwDGiIcPRTc4q7gdQ07LcvH5jdxSW2SGrJngK2X220uwxwDtV5GfiZgTlkQ+FY8UNnE+O0COnQaDXbUmEYdIqWBuZDespewtIVn/qT1bZlOAHcwU0ukSB+zS4z8HWDVZInuA7L5S0cfNziyonk5XK8bI06Q4VQK/OOy7EUjy/1dh3rqtb7thPk0UjFi8x49PM8muJn6hqAzyo7EjoZAiScHcKU4fNJ35Q+ePAe5kfz8tFCmTM4CBSbPORa+ambVI0lY8IHraoDEmeyw4l0hqZehyGIUERSEg7FPg3qZvQlx88q9nxBror85IfQpTFl7G2TK8pS+ikBcbkyXCveYmvlbuwKr1hQTsIFxBk6qLzaRJj7wvNapdSDqC5cQeEJjJKtQyud9ahsrXMvXCQJWTfmzAwhfEMzqqGf91LRuJI0FV8QKkj3lgDdN3x2rWqCLetwsAUm1w+VSo4yCo21KjI04iit+c1iiVlPkxeZt90BTb1bySgHu/vfo11v/joRaVuNmnLvuvfyXiMgP7ET09ZQ9c8nUmY74X1MGmiTSfWWBzjlo4Sj9tkxUMlGWw3/vg6KgUbkwbfVDKoz5Lff/1VF5DfNxmKItSUZ1vLwMsmLsI7E+ZYKHcvV7i+eMnFiLc9n0SdA6KVsRw/oqMBeA/g+kZDe4LmpokuiwPvQzruuoSW1mm26p2XL7sVkMuEfTw6jO9/Luh4b0VDtTv0XrZFnaVcyZ9SsXmHjCMrXRKYI7xjudlBwdtCMT+XrG/ETOso/fJ/wk=
X-Forefront-Antispam-Report: 
	CIP:194.138.21.72;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(508600001)(6666004)(16799955002)(36756003)(47076005)(966005)(54906003)(40460700003)(336012)(6916009)(8676002)(316002)(83380400001)(70206006)(70586007)(4326008)(36860700001)(5660300002)(82960400001)(8936002)(356005)(81166007)(82310400004)(2906002)(86362001)(26005)(186003)(44832011)(1076003)(107886003)(2616005)(16526019)(956004)(19627235002)(36900700001)(19607625012);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 13:38:51.0637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cbdaff55-f48d-4d9a-0bb6-08d9fde45181
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.72];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT058.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB1870
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 13:38:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95782

Current nodejs version v16 does not fully support new OpenSSL, so add optio=
n
to use legacy provider.

|   opensslErrorStack: [ 'error:03000086:digital envelope routines::initial=
ization error' ],
|   library: 'digital envelope routines',
|   reason: 'unsupported',
|   code: 'ERR_OSSL_EVP_UNSUPPORTED'

It was blindly removed by upgrade to 16.14.0 version

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 ...5-add-openssl-legacy-provider-option.patch | 165 ++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_16.14.0.bb |   1 +
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
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb b/meta-oe/re=
cipes-devtools/nodejs/nodejs_16.14.0.bb
index 9514ec499..7b9644ec8 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.14.0.bb
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


