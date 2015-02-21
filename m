Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0F247606E8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Feb 2015 09:52:54 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id h11so7502899wiw.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Feb 2015 01:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6jv7Qk8DWxJ/FXxi96tnchsB+ts6EheJrJOkjKc+eqk=;
	b=PZ6yfOfNyvcyTXn7ehder4C9WHIFmSq0h9qtLWrO+kYjbE8hhWb2PMd0prY0uxhU4S
	uy6+6+4KQVy17/M70y/lEaw2AHEQKLqQVk+9GHGiqVEJKogwe7EeZKpnHRXcNtbRHs4c
	GA/wEEwvrBV4LXvrbWfz+ogG9+XwkdHuKYtTNzWSAD5HJzmW1g+/8vUqDrqOdwp9ApMU
	ewswjYujlBwzb2bELxNJzuRGGmbt5qq1dawaPisPdCxewcBoO4uBpzCxfDGz/YwT0R4N
	3Jbz5/WPPu4st283yl2MCUAbdT5ncnLn/dXhZmDsJJ30JE3OJ5epil1aZoIAw4fe9lBs
	stdQ==
X-Received: by 10.180.77.40 with SMTP id p8mr2698272wiw.53.1424512375448;
	Sat, 21 Feb 2015 01:52:55 -0800 (PST)
Received: from localhost.localdomain (ip-84-119-96-251.unity-media.net.
	[84.119.96.251])
	by mx.google.com with ESMTPSA id dm6sm6232120wib.22.2015.02.21.01.52.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Feb 2015 01:52:54 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Feb 2015 10:52:13 +0100
Message-Id: <1424512336-47007-6-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1424512336-47007-1-git-send-email-sven.ebenfeld@gmail.com>
References: <1424512336-47007-1-git-send-email-sven.ebenfeld@gmail.com>
Subject: [meta-oe][PATCH 5/7] vala-dbus-binding-tool: Update to 0.4.1 and fix SRC_URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Feb 2015 09:52:57 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 .../vala-dbus-binding-tool/vala-dbus-binding-tool.inc                 | 4 +++-
 .../vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb            | 4 ----
 .../vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.1.bb            | 4 ++++
 3 files changed, 7 insertions(+), 5 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb
 create mode 100644 meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.1.bb

diff --git a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
index 7c8e341..976c087 100644
--- a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
+++ b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
@@ -9,8 +9,10 @@ INC_PR = "r3"
 
 export XDG_DATA_DIRS = "${STAGING_DATADIR}"
 
-SRC_URI = "http://downloads.freesmartphone.org/sources/${BPN}/${BP}.tar.bz2;name=archive"
+SRC_URI = "https://github.com/freesmartphone/vala-dbus-binding-tool/archive/vdbt-${PV}.tar.gz;name=archive"
 
 inherit autotools perlnative pkgconfig
 
 BBCLASSEXTEND = "native"
+
+S = "${WORKDIR}/vala-dbus-binding-tool-vdbt-${PV}"
\ No newline at end of file
diff --git a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb
deleted file mode 100644
index 3473971..0000000
--- a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require vala-dbus-binding-tool.inc
-
-SRC_URI[archive.md5sum] = "b7537a087f9f468e25170e81df0ed93f"
-SRC_URI[archive.sha256sum] = "6b0d3796e92b031839e2e2f484e294153ad9eaf9d32915056199a49ce8328722"
diff --git a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.1.bb b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.1.bb
new file mode 100644
index 0000000..c51298b
--- /dev/null
+++ b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.1.bb
@@ -0,0 +1,4 @@
+require vala-dbus-binding-tool.inc
+
+SRC_URI[archive.md5sum] = "76540eb575bef04d4250166208c0bb5b"
+SRC_URI[archive.sha256sum] = "656e8fedaac7ab783bbe4bcfb3584c785998792136d8e3fd83e4956613a6e728"
-- 
1.9.3


