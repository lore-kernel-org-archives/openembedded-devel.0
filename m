Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58770C433F5
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 13:17:06 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.86])
 by mx.groups.io with SMTP id smtpd.web08.5051.1646486224113439982
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 05:17:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com
 header.s=selector2 header.b=Otg1l9Hz;
 spf=pass (domain: siemens.com, ip: 40.107.2.86,
 mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pen+TGmkkMyImozNSHD+YDTvFMwAdYr9jznWAyu763g2fjjGatCq+KuU3dUlZy3D+5VMGU8NqTaKnYWAneZzrBmxprDeDjiSrmSMHuoaGUOr5DFTpBY9dPCmuBP0SRIce+aEvUcWiIttwP94Ep0CZdf5Wje8PVajdwxw1Wzyw5T5r/vSS89iHbH3XFvh1Ffklq4fwtUb64Rq7+afvXLu9OLFNHm9idgh0y25+Dv7xn2IvpPtiZvxaoe3fAWsHRHGLJ86nGBpGbzdTa2byUMfkn05G+eqD7bUv7lFOPmECWSaNYYLyBLz/S0HuXyt3+cdfHjkWQrgKyhQ2kx3ik0d2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziEgEd07LRsrXkXB3gOVPu6x6ULJrGikN5ilVkAq3GM=;
 b=Du6QQt65/5vwGB1Ry4aLwpHBiTdSeE5soPqTV85vO82cuzAvpNYrNOentfhNuMK1U5vwGnFsTu9k4tnX9ASIFPlmbEotx/NV6RBb0zmGEfPMDda5YKGy0VZah4nIzXJkxaGvE4WrxawBI3ltx5HCH8EjX6n9SYT0cpXbgbCLOO2oe3dWseirCjHRoR3EVJ277X6py3IHZEQiyleqK2QdhjcHGdalayZexPZTyPNw7Yz96YZHvXW8R9Sxqw4U/5vcTwNxJ2zfniVbF2dSFDhMfurSDtsT9fOxTIR+XLw9VVvCmzVB2e+nN+PrnK6ZCSIxeMLsLjcFF92CzlA9rxrLxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziEgEd07LRsrXkXB3gOVPu6x6ULJrGikN5ilVkAq3GM=;
 b=Otg1l9HzwJ/lcD3RL5zcaXQDcBiDIHDVG16eP2qBUSb69HymRFxBEeFG13zeFUM74+9aG29y93pnNOnG2IdX5OM5uPZWMfCeugmjEoBDMSFRBqb9LJ4IWJvR65x2g0IOwmoELDGFg4z1XkunJnOH4bXb6x9jwQZ1+C0s1LuV2AdNUx4Kny8WU9JEoix5k+B5DJpvK00XP7TVbZu4V8C+zeetioBR6XibFuDgrnw2gxLhobQRe46WR4c7yQ8hB7j9y/Wc59KcXNG8ofJaScIqSvsoRrQcoHuET3vcD/Kd+KNz7ZjvVxEnl2UMkgzFoDo2GA5IOF1Q4ahjlw+r11RqNw==
Received: from DU2PR04CA0279.eurprd04.prod.outlook.com (2603:10a6:10:28c::14)
 by AS4PR10MB5248.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4b7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Sat, 5 Mar
 2022 13:16:59 +0000
Received: from DB5EUR01FT042.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::c6) by DU2PR04CA0279.outlook.office365.com
 (2603:10a6:10:28c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13 via Frontend
 Transport; Sat, 5 Mar 2022 13:16:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.71) by
 DB5EUR01FT042.mail.protection.outlook.com (10.152.5.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Sat, 5 Mar 2022 13:16:59 +0000
Received: from DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Sat, 5 Mar 2022 14:16:59 +0100
Received: from md3hr6tc.ad001.com (139.22.142.58) by
 DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Sat, 5 Mar 2022 14:16:58 +0100
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>, <zboszor@gmail.com>, Andrej Valek
	<andrej.valek@siemens.com>
Subject: [meta-oe][PATCH v2] nodejs: add option to use openssl legacy
 providers again
Date: Sat, 5 Mar 2022 14:16:25 +0100
Message-ID: <20220305131625.16138-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218133121.222269-1-andrej.valek@siemens.com>
References: <20220218133121.222269-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.22.142.58]
X-ClientProxiedBy: DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) To
 DEMCHDC8A1A.ad011.siemens.net (139.25.226.107)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c357ca2a-8bbc-4a50-9d19-08d9feaa6e1f
X-MS-TrafficTypeDiagnostic: AS4PR10MB5248:EE_
X-Microsoft-Antispam-PRVS: 
	<AS4PR10MB52480327B377464F103D40C792069@AS4PR10MB5248.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+Jv97fcDmgjuTIpPaer/mjU/A1IOy27xLkfze3K0py6mASeU5i49+rcH+dr3QdPBnQWbiamNMCRG0HVwwsI54fMlfpOVU47LROIWwo2x87ICupqp85YEYEYippr34/6z5mtUy6DQXhwCxcpjaRkolXboLiIEOwJeU62qfEnNeaZApPiVje1gdJYoNjFMHPWQdVLfmsCD/3ORfkXLssmLwzwoZHLbyMvrDbtyMWdX8Ov7qYQBi7H13klngMpgT9in9srDATfkb5NaPTG/1ZMzJMoycwvF8eTFR/isr5Vbcbz6Zz0nbI+k3UxLDedHxpcH+sK5LHTqoYTddk9VNyOBFaXGGcRsrHiJcZ/K9T6FGMjDwyNkYNgVkz9D2bFXU3RtFgWx9jtQGItoQxMd1fX5KxdLdj45wWODgys/tf7otwQJqPTJIk9oSOhL9s1K4+yj5ncZPam93Ci3sGE89Vzi6hX7qY8NQ9Po+yBpli5c3pCHs8F5SjB0vNINydRt+MxG1bbBPqsKYgu1PXBiBCj+0gr9utBSBr3Mi1BGe8cDYBBa72Q4MW8+ybERrSySV6By/HE9jo/7vL0hqU00mYkG974RFIUbL4CsWa2vVJTqDM5A3D/qBuoB8JqQm3IqPap0VeIuPaokFWTlLUPF6CEw3L6b7JrRM4yh8sE1eitthf0TUgqlR5Jpiio54pXeAsCqt94mG2ZOP8gUQOteu5lz5CO93t+ubEvcdDwAHfB3jJz5CCIFPiyITc7TUpzfx6OKv7Pi+/Kv7mvsmC4dIqSYQjmFEnYG2yfW/BEZ6Pe+A289koLQGXxY6knRiA84R1JTWmhYc82G1XxCycvpEUwc3E53S8Rjt4uSAc0nW7J6vmU=
X-Forefront-Antispam-Report: 
	CIP:194.138.21.71;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(508600001)(82960400001)(8676002)(2616005)(26005)(336012)(956004)(1076003)(16526019)(186003)(107886003)(8936002)(356005)(6666004)(81166007)(40460700003)(16799955002)(2906002)(86362001)(70586007)(70206006)(6916009)(36860700001)(36756003)(44832011)(316002)(54906003)(82310400004)(4326008)(83380400001)(966005)(47076005)(5660300002)(19627235002)(36900700001)(19607625012);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2022 13:16:59.4471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c357ca2a-8bbc-4a50-9d19-08d9feaa6e1f
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.71];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT042.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5248
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Mar 2022 13:17:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95799

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
 ...5-add-openssl-legacy-provider-option.patch | 151 ++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_16.14.0.bb |   1 +
 2 files changed, 152 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl=
-legacy-provider-option.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy=
-provider-option.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-op=
enssl-legacy-provider-option.patch
new file mode 100644
index 000000000..5af6c6114
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provid=
er-option.patch
@@ -0,0 +1,151 @@
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
+@@ -687,6 +687,14 @@ Load an OpenSSL configuration file on startup. Among =
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
+=20
+ <!-- YAML
+@@ -1544,6 +1552,7 @@ Node.js options that are allowed are:
+ * `--no-warnings`
+ * `--node-memory-debug`
+ * `--openssl-config`
++* `--openssl-legacy-provider`
+ * `--pending-deprecation`
+ * `--policy-integrity`
+ * `--preserve-symlinks-main`
+@@ -1933,6 +1942,7 @@ $ node --max-old-space-size=3D1536 index.js
+ [emit_warning]: process.md#processemitwarningwarning-options
+ [jitless]: https://v8.dev/blog/jitless
+ [libuv threadpool documentation]: https://docs.libuv.org/en/latest/thread=
pool.html
++[providers readme]: https://github.com/openssl/openssl/blob/openssl-3.0.0=
/README-PROVIDERS.md
+ [remote code execution]: https://www.owasp.org/index.php/Code_Injection
+ [security warning]: #warning-binding-inspector-to-a-public-ipport-combina=
tion-is-insecure
+ [timezone IDs]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zo=
nes
+diff --git a/src/crypto/crypto_util.cc b/src/crypto/crypto_util.cc
+index 7e0c8ba3eb60..796ea3025e41 100644
+--- a/src/crypto/crypto_util.cc
++++ b/src/crypto/crypto_util.cc
+@@ -148,6 +148,16 @@ void InitCryptoOnce() {
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
+@@ -43,6 +43,10 @@ for (const line of [...nodeOptionsLines, ...v8OptionsLi=
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
+@@ -50,6 +54,7 @@ const conditionalOpts =3D [
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


