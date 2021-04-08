Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.7071.1617882820933428646
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 04:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35416 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lUTEB-0002Qi-34; Thu, 08 Apr 2021 14:53:39 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-grpcio-tools: Upgrade 1.36.1 -> 1.37.0
Date: Thu,  8 Apr 2021 14:53:30 +0300
Message-Id: <20210408115330.7708-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210408115330.7708-1-leon.anavi@konsulko.com>
References: <20210408115330.7708-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.37.0:

- use boringssl asm optimizations in aarch64 wheel source build.
- Clarify Guarantees about grpc.Future Interface.
- Use crosscompilation to build python armv7 wheels.
- [Aio] Add time_remaining method to ServicerContext.
- Standardize all environment variable boolean configuration in
  python's setup.py.
- Crosscompile python aarch64 wheels with dockcross.
- Fix Signal Safety Issue.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-grpcio-tools_1.36.1.bb => python3-grpcio-tools_1.37.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.36.1.bb => python3-grpcio-tools_1.37.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.36.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.37.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.36.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.37.0.bb
index da571d3a2..d1b934bd0 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.36.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.37.0.bb
@@ -11,7 +11,7 @@ DEPENDS += "${PYTHON_PN}-grpcio"
 
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
 
-SRC_URI[sha256sum] = "80ef584f7b917f575e4b8f2ec59cd4a4d98c2046e801a735f3136b05742a36a6"
+SRC_URI[sha256sum] = "3ec510c1b6bfc32effc639acf9a055e72dab7a7b6757bf72f2132790d6a7cf1c"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-grpcio"
 
-- 
2.17.1

