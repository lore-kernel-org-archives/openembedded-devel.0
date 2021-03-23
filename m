Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.185.1616517218435786735
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Mar 2021 09:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60894 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lOjyI-0000KS-R9; Tue, 23 Mar 2021 18:33:38 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/10] python3-grpcio-tools: Upgrade 1.35.0 -> 1.36.1
Date: Tue, 23 Mar 2021 18:33:11 +0200
Message-Id: <20210323163317.26664-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210323163317.26664-1-leon.anavi@konsulko.com>
References: <20210323163317.26664-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 1.36.1:

- back-port: add env var protection for google-c2p resolver
- Backport "Fix implicit declaration error in zlib + macOS
- xDS features doc update for case insensitive prefix/full path
  matching
- Add darwin_arm64 and darwin_arm64e to c-ares config settings
- Add FileWatcher CertificateProvider
- Protect xds security code with the environment variable
  "GRPC_XDS_EXPERIMENTAL_SECURITY_SUPPORT"
- Fix visibility of libprotobuf symbols in protoc_compiler.so on
  Mac
- [Aio] Correct type annotation of grpc.aio.ServicerContext.abort
- Add limit concurrent RPC feature to asyncio server
- [Aio] Fix the emtpy response handling in streaming RPC
- [Backport] Implement grpc.Future interface in
  SingleThreadedRendezvous
- [Backport] Make Python 2 an optional dependency for Bazel build

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-grpcio-tools_1.35.0.bb => python3-grpcio-tools_1.36.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.35.0.bb => python3-grpcio-tools_1.36.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.36.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.36.1.bb
index 6758429ae..da571d3a2 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.35.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.36.1.bb
@@ -11,7 +11,7 @@ DEPENDS += "${PYTHON_PN}-grpcio"
 
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
 
-SRC_URI[sha256sum] = "9e2a41cba9c5a20ae299d0fdd377fe231434fa04cbfbfb3807293c6ec10b03cf"
+SRC_URI[sha256sum] = "80ef584f7b917f575e4b8f2ec59cd4a4d98c2046e801a735f3136b05742a36a6"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-grpcio"
 
-- 
2.17.1

