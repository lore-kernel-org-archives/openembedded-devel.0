Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.14039.1591191761732389211
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2020 06:42:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47258 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jgTfD-00009o-CK; Wed, 03 Jun 2020 16:42:39 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-editor: Consolidate in a single file
Date: Wed,  3 Jun 2020 16:42:30 +0300
Message-Id: <20200603134232.22336-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.7
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

Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-python/recipes-devtools/python/python-editor.inc  |  9 ---------
 .../recipes-devtools/python/python3-editor_1.0.4.bb    | 10 +++++++++-
 2 files changed, 9 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-editor.inc

diff --git a/meta-python/recipes-devtools/python/python-editor.inc b/meta-python/recipes-devtools/python/python-editor.inc
deleted file mode 100644
index 734ce2bd7..000000000
--- a/meta-python/recipes-devtools/python/python-editor.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-DESCRIPTION = "Programmatically open and editor, capture the result"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
-
-SRC_URI[md5sum] = "0e52648a4a6e7c89e3be44e9456530b4"
-SRC_URI[sha256sum] = "51fda6bcc5ddbbb7063b2af7509e43bd84bfc32a4ff71349ec7847713882327b"
-
-PYPI_PACKAGE = "python-editor"
-
diff --git a/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb b/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
index 8ad2b869d..c7a6cd8f0 100644
--- a/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-editor_1.0.4.bb
@@ -1,2 +1,10 @@
+DESCRIPTION = "Programmatically open and editor, capture the result"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
+
+SRC_URI[md5sum] = "0e52648a4a6e7c89e3be44e9456530b4"
+SRC_URI[sha256sum] = "51fda6bcc5ddbbb7063b2af7509e43bd84bfc32a4ff71349ec7847713882327b"
+
+PYPI_PACKAGE = "python-editor"
+
 inherit pypi setuptools3
-require python-editor.inc
-- 
2.17.1

