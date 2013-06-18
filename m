Return-Path: <net147@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id CCE776077E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 07:35:37 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz11so3723956pad.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 00:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=yvzW5twnogHWo8VPZVdZmc20ZvXnuRRD7zl/xtYabY8=;
	b=dwQz2ejvaJ30boxvjtg4HOsg5sEAT1CBNReCUdhS+vpexieSlDKVsLEGwopjMh6DeT
	EBgJiRTKqq6vLjBH0HGSS7mj3kOUsmX9HfEaBAezyJvFcJhnb4j+xcqy4UAKxIXmuqIG
	i1BSvuAaarwauOsjgNdeVN0xQWLpXVhzqsi039z6kKUhJiKf3q4UptbTfYTAEgW78DFa
	Tb7O2Ejej5qTZNjvhL4xuhkYm9+LIl5r02siq91iCRIwcCaAIwLAnzII+QSZFKjPpaYk
	Xat08ehBW6qkiYdostb323ml9mkg/EiJsuDN4SYqO3NLxZmZnapUneFXKZig21csIupu
	OiFQ==
X-Received: by 10.68.203.103 with SMTP id kp7mr8158743pbc.165.1371540939134;
	Tue, 18 Jun 2013 00:35:39 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	ot10sm17113977pbb.12.2013.06.18.00.35.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Jun 2013 00:35:38 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jun 2013 17:49:56 +1000
Message-Id: <1371541796-3895-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
Subject: [meta-networking][PATCH] cyrus-sasl: move plugin *.so symbolic links to cyrus-sasl package
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
X-List-Received-Date: Tue, 18 Jun 2013 07:35:37 -0000

The Cyrus SASL plugins are loaded without their version number so the
plugin *.so symbolic links need to be placed in the cyrus-sasl package
rather than the cyrus-sasl-dev package.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
index 0113025..bf6f95c 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
@@ -36,8 +36,10 @@ SRC_URI[sha256sum] = "8fbc5136512b59bb793657f36fadda6359cae3b08f01fd16b3d406f134
 
 PACKAGES =+ "${PN}-bin"
 
-FILES_${PN}           += "${libdir}/sasl2/*.so.*"
+FILES_${PN}           += "${libdir}/sasl2/*.so*"
 FILES_${PN}-bin       += "${bindir}"
-FILES_${PN}-dev       += "${libdir}/sasl2/*.so ${libdir}/sasl2/*.la"
+FILES_${PN}-dev       += "${libdir}/sasl2/*.la"
 FILES_${PN}-dbg       += "${libdir}/sasl2/.debug"
 FILES_${PN}-staticdev += "${libdir}/sasl2/*.a"
+
+INSANE_SKIP_${PN} += "dev-so"
-- 
1.8.3


