Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.5825.1593170997714960684
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 04:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48362 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jomYN-000568-VJ; Fri, 26 Jun 2020 14:29:56 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/12] python3-kiwisolver: Upgrade 1.1.0 -> 1.2.0
Date: Fri, 26 Jun 2020 14:29:37 +0300
Message-Id: <20200626112944.25569-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200626112944.25569-1-leon.anavi@konsulko.com>
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 1.2.0:

- make the the c++ part of the code c++11 compliant
- use cppy for Python/C bindings

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-kiwisolver_1.1.0.bb        | 16 ---------------
 .../python/python3-kiwisolver_1.2.0.bb        | 20 +++++++++++++++++++
 2 files changed, 20 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-kiwisolver_1.1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-kiwisolver_1.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.1.0.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.1.0.bb
deleted file mode 100644
index a10830257..000000000
--- a/meta-python/recipes-devtools/python/python3-kiwisolver_1.1.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "A fast implementation of the Cassowary constraint solver"
-HOMEPAGE = "https://github.com/nucleic/kiwi"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://setup.py;endline=7;md5=1c177d169db050341d3b890c69fb80e3"
-
-SRC_URI[md5sum] = "fc8a614367f7ba0d34a02fd08c535afc"
-SRC_URI[sha256sum] = "53eaed412477c836e1b9522c19858a8557d6e595077830146182225613b11a75"
-
-inherit pypi setuptools3
-
-RDEPENDS_${PN} += "\
-    python3-core \
-    python3-setuptools \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.2.0.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.2.0.bb
new file mode 100644
index 000000000..94db61142
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-kiwisolver_1.2.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "A fast implementation of the Cassowary constraint solver"
+HOMEPAGE = "https://github.com/nucleic/kiwi"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://setup.py;endline=7;md5=e54bd74bd9d0a84ae3f8f6d21ada0ab4"
+
+SRC_URI[md5sum] = "9f53fabb361c04d76c5afc688652c814"
+SRC_URI[sha256sum] = "247800260cd38160c362d211dcaf4ed0f7816afb5efe56544748b21d6ad6d17f"
+
+inherit pypi setuptools3
+
+DEPENDS += "\
+    python3-cppy-native \
+"
+
+RDEPENDS_${PN} += "\
+    python3-core \
+    python3-setuptools \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

