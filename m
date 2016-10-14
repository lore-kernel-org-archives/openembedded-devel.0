Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 52BAD71989
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2016 16:22:15 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n189so8971968qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2016 09:22:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6L0gGLFAUkZAsCviMottcSHtZ0l2ZERzjModD5w+qyU=;
	b=DTO8WCCxHTm+eI/CtpvIxLVTICJ5ATdk3H9adX1lvpD7fu30RhlwPmSmVPyQjgoocQ
	Uix44fQtOwzgH3Qu/BgF+PYwDIP4psY2uRSr5aDYzwbcYDrc7A5RCYLtBXHkkMRN7adX
	kVqUnlpLNhag6HleYlkLR7/hPHSzRL1SQAhMZbw2Bx2QTKl0ApTghbSplzMqpeK+d1i7
	wG5lFjkiNlNyfr/iL4qCRL98tSKsjK16PAvk0ocOaTV+2HCemYfFnNKddzIecxdZAvI3
	2OqMYHeDAwFEHJ2rCTZ/dmUm7Hzhd6nEkvOkTSqe21YsKDViKWblcpRSU4bXVqJ3jRfZ
	RCvQ==
X-Gm-Message-State: AA6/9RlcMEWUgB49bZGrPRz+EsA16pfmFo1u+w9cDm2uw3j2Z3iExj8zgxPCLZOahqVFYw==
X-Received: by 10.55.41.76 with SMTP id p73mr14690491qkh.98.1476462137165;
	Fri, 14 Oct 2016 09:22:17 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	d27sm7899675qtd.37.2016.10.14.09.22.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Oct 2016 09:22:16 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Oct 2016 12:21:45 -0400
Message-Id: <1476462105-7095-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] libsodium: update to version 1.0.11
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Oct 2016 16:22:17 -0000

 * Verified license remains the same (copyright updated)

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb | 10 ----------
 meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb
 create mode 100644 meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb

diff --git a/meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb b/meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb
deleted file mode 100644
index 370f553..0000000
--- a/meta-oe/recipes-support/libsodium/libsodium_1.0.10.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "The Sodium crypto library"
-HOMEPAGE = "http://libsodium.org/"
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2278eb2755b451372dde7ffeae8cde98"
-
-SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "ea89dcbbda0b2b6ff6a1c476231870dd"
-SRC_URI[sha256sum] = "71b786a96dd03693672b0ca3eb77f4fb08430df307051c0d45df5353d22bc4be"
-
-inherit autotools
diff --git a/meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb b/meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb
new file mode 100644
index 0000000..22d3155
--- /dev/null
+++ b/meta-oe/recipes-support/libsodium/libsodium_1.0.11.bb
@@ -0,0 +1,10 @@
+SUMMARY = "The Sodium crypto library"
+HOMEPAGE = "http://libsodium.org/"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c9f00492f01f5610253fde01c3d2e866"
+
+SRC_URI = "https://download.libsodium.org/libsodium/releases/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "b58928d035064b2a46fb564937b83540"
+SRC_URI[sha256sum] = "a14549db3c49f6ae2170cbbf4664bd48ace50681045e8dbea7c8d9fb96f9c765"
+
+inherit autotools
-- 
2.7.4


