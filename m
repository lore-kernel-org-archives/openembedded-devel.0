Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 09F136B5B0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 14:55:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,695,1389740400"; d="scan'208";a="43025674"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 20 Mar 2014 15:55:13 +0100
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Thu, 20 Mar 2014 15:55:13 +0100
Received: from u85.usr.ingenico.loc (10.23.7.85) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Thu, 20 Mar 2014 15:55:13 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Mar 2014 15:47:58 +0100
Message-ID: <1395326878-6726-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.5.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] open-vcdiff: add new recipe for version 0.8.3
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
X-List-Received-Date: Thu, 20 Mar 2014 14:55:13 -0000
Content-Type: text/plain

This is Google's implementation of VCDIFF (RFC 3284) delta compression.
It's more flexible than Xdelta3 (as a developer point of view).

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 .../recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb

diff --git a/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb b/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb
new file mode 100644
index 0000000..ee08102
--- /dev/null
+++ b/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb
@@ -0,0 +1,20 @@
+SUMMARY = "An encoder/decoder for the VCDIFF (RFC3284) format"
+DESCRIPTION = "A library with a simple API is included, as well as a \
+               command-line executable that can apply the encoder and \
+               decoder to source, target, and delta files. \
+               A slight variation from the draft standard is defined \
+               to allow chunk-by-chunk decoding when only a partial \
+               delta file window is available."
+HOMEPAGE = "http://code.google.com/p/open-vcdiff/"
+SECTION = "console/utils"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b2c8309843bc5297cfb4dc84f43f3ccc"
+
+SRC_URI = "http://open-vcdiff.googlecode.com/files/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "5f848e4916b407879f55e0ca74c3f6af"
+SRC_URI[sha256sum] = "b7e47db78866082e9e8b5782f5491092c8414f0acc0440aea03b14c7d1d3c371"
+
+inherit autotools
+
+EXTRA_AUTORECONF += " -I ${S}/gflags/m4"
-- 
1.8.5.4


