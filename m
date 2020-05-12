Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.10631.1589304266307510803
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 10:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=jSFeusTk;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49M4RV4Dspz4y
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 19:24:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589304262;
	bh=Z5E6XDWHlY2yOo78l/GXiLnyxuu8xIirjMftVm/IQz8=;
	h=From:To:Subject:Date:From;
	b=jSFeusTkQd6oCKqqyv5K5vHE0y8zE7d4fzTsdd4TXsdKpMvRWMqUUn19kLCJqWnOT
	 qX2t+8KEd1nt4sv7uFa6EJ3DtNnOf9pZ7OqQDe2b4Ht6sGFXnkqr7KXlEhn/omcTlc
	 IWTYeHFR1JMNL3yzwwb+UXw2R3Gr0mhAP62rYqaabKzIoLQRnqewcGfyeq8MtkZcD+
	 5w0pJ5cWhIs9vwvI5z/iEJpQMK7a+wGWy7AUTH7R26C8KNCkGnsu/7A9V7q0OJ95lb
	 +RHpnlkK8mSJysKwSjf7GH4evQJa5k2fsMVU5ugLft6VWQjHrmoJ0hV88hkatE8Ehr
	 kNJMPoPYt5EBMfqVBw73mOCFb7odZQ5G8sAidWsttqH1wYxwJQYhA1V4WOMr953jXE
	 6OPADLtWj0r+LTPS1lm+1t1GzcoeWPcNzKMzzeeLwV5mVoYBRmyNgD+9XGSvv1QYkF
	 nAxFuTQgC8el8RmlYUq3dp7GcbdTtzgb2A9SN36GWRrMGl28p4qI3n4DZuzgboNILP
	 uQ/U3bAAEeiyRlidi9P8bsWO7FQTRBfoIjTiafWbKOYOMzHXQcxjA37r+M1RjjbElm
	 CopdpYrKCMJhONJqCnc+FiO/fsDRZ4NiBj9gPsJuL+dofdn3zS2xyHmHYNWwcoGctY
	 GhwFdv2aXdBaxfdqflMLUUtI=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mraa: Replace -fcommon with fix
Date: Tue, 12 May 2020 20:24:21 +0300
Message-Id: <20200512172421.8874-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...de-Declare-gVERSION-global-as-extern.patch | 31 +++++++++++++++++++
 meta-oe/recipes-extended/mraa/mraa_git.bb     |  3 +-
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/mraa/mraa/0001-include-Declare-gVERSION-global-as-extern.patch

diff --git a/meta-oe/recipes-extended/mraa/mraa/0001-include-Declare-gVERSION-global-as-extern.patch b/meta-oe/recipes-extended/mraa/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
new file mode 100644
index 000000000..d1152ed64
--- /dev/null
+++ b/meta-oe/recipes-extended/mraa/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
@@ -0,0 +1,31 @@
+From dbb5961f106ec42cd70689d933674c9c37aedfe1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bj=C3=B6rn=20Esser?= <besser82@fedoraproject.org>
+Date: Mon, 13 Apr 2020 20:12:11 +0200
+Subject: include: Declare gVERSION global as 'extern'.
+
+Fixes build with '-fno-common'.
+
+Upstream-Status: Submitted [https://github.com/eclipse/mraa/pull/1012]
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+---
+ include/version.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/version.h b/include/version.h
+index 47366ef..3a567a1 100644
+--- a/include/version.h
++++ b/include/version.h
+@@ -11,8 +11,8 @@
+ extern "C" {
+ #endif
+ 
+-const char* gVERSION;
+-const char* gVERSION_SHORT;
++extern const char* gVERSION;
++extern const char* gVERSION_SHORT;
+ 
+ #ifdef __cplusplus
+ }
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
index 403d641ee..7c2441632 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -10,6 +10,7 @@ PV = "2.1.0+git${SRCPV}"
 
 SRC_URI = "git://github.com/eclipse/${BPN}.git;protocol=http \
            file://0001-cmake-Use-a-regular-expression-to-match-x86-architec.patch \
+           file://0001-include-Declare-gVERSION-global-as-extern.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -27,8 +28,6 @@ EXTRA_OECMAKE_append = " -DINSTALLTOOLS:BOOL=ON -DFIRMATA=ON -DCMAKE_SKIP_RPATH=
                          -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} \
                        "
 
-CFLAGS += "-fcommon"
-
 # Prepend mraa-utils to make sure bindir ends up in there
 PACKAGES =+ "${PN}-utils"
 
-- 
2.17.1

