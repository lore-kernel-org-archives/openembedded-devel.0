Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B8BEB71984
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 14:09:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5IE9AUF003275
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 07:09:10 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 18 Jun 2018 07:09:09 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Jun 2018 07:09:09 -0700
Message-ID: <20180618140909.40174-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] spice: Uprev to latest and add opus PKGCONFIG
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
X-List-Received-Date: Mon, 18 Jun 2018 14:09:09 -0000
Content-Type: text/plain

In the uprev, spice now expects to compile with libopus by
default. This patch adds a PKGCONFIG option for libopus such that it
will still compile as it has in the past.

Compilation has been tested with and without opus support.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta-networking/recipes-support/spice/spice_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index bf4b08346..38b8bf306 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -15,8 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 PV = "0.14.0+git${SRCPV}"
 
-SRCREV_spice = "33d9c38554b41dab1390914ef79594b57218b06b"
-SRCREV_spice-common = "4c2d0e977272c5540634d24f485dd64c424f6748"
+SRCREV_spice = "f1050bfc76c9c4146257e087baf74e0b62d7d218"
+SRCREV_spice-common = "95743f40a2da39e0a19859c305e69e2c99d39e42"
 
 SRCREV_FORMAT = "spice_spice-common"
 
@@ -48,6 +48,7 @@ PACKAGECONFIG[smartcard] = "--enable-smartcard,--disable-smartcard,libcacard,"
 PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl,"
 PACKAGECONFIG[client] = "--enable-client,--disable-client,,"
 PACKAGECONFIG[gui] = "--enable-gui,--disable-gui,,"
+PACKAGECONFIG[opus] = "--enable-opus,--disable-opus,libopus,"
 PACKAGECONFIG[opengl] = "--enable-opengl,--disable-opengl,,"
 PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama,"
 
-- 
2.17.1


