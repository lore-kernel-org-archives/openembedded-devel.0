Return-Path: <anders@chargestorm.se>
X-Greylist: delayed 336 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 29 Sep 2014 13:16:28 UTC
Received: from stoexhub03.domain01.net (STOEXHUB03.domain01.net
	[83.145.59.144])
	by mail.openembedded.org (Postfix) with ESMTP id 403EC71685
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 13:16:28 +0000 (UTC)
Received: from localhost (213.114.64.43) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server id 8.3.279.1; Mon, 29 Sep 2014
	15:10:52 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 29 Sep 2014 15:10:30 +0200
Message-ID: <c3982a9e7a7182cfb3f0147477202f0c7b15858a.1411996185.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <cover.1411996185.git.anders@chargestorm.se>
References: <cover.1411996185.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-oe] [PATCH 1/1] breakpad: install static library
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
X-List-Received-Date: Mon, 29 Sep 2014 13:16:30 -0000
Content-Type: text/plain

In order to build against breakpad when using an SDK, we need to also package
libbreakpad_client.a.

The SDK will then need to add breakpad-staticdev to TOOLCHAIN_TARGET_TASK.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-oe/recipes-devtools/breakpad/breakpad_svn.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb b/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
index 2c5941d..571e1d3 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
@@ -56,6 +56,9 @@ do_install_append() {
 
         install -d ${D}${includedir}/breakpad/third_party/lss
         install -m 0644 ${S}/src/third_party/lss/linux_syscall_support.h ${D}${includedir}/breakpad/third_party/lss/linux_syscall_support.h
+
+        install -d ${D}${libdir}
+        install -m 0644 ${S}/src/client/linux/libbreakpad_client.a ${D}${libdir}/libbreakpad_client.a
 }
 
 PACKAGES =+ "${PN}-minidump-upload ${PN}-sym-upload"
-- 
2.1.1


