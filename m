Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi7v-00040y-Ds
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:20:51 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1926936eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=pxk3NLZkKvczpT/uEDjlWJ5I+UqGaAFHx+csHCZlxXw=;
	b=Hq94WgMp3AlYpOFxbhaFiSZnhNS7ijHUhjMldG0zx0ZjTylMaLKwsjAiw/Dce1IsTX
	h+b3CDWOTxGWzZrfQ+zSQvR57QJdWnVc/bbrsqnoCx0rbWpQx3IIfZO4OP409DqR5KRG
	G+x19eIXrtAGWFHcPyzmHQEBEpSn6J3Y+NXaNvlHel/M/NwO26xMSUBE+NZG7DhRsJYY
	vJn+BR71/7laa//g1LGsLPzuGrNi1iP2Xk9KwwBeS3XUAYXvdc5gr2FZt8B0FsP86Gby
	2x9/49qzGs8yhbuzgdI46YQjz4D6u+xwD9jz7y2rBQumTIZvJ5T2uOpuFSR4rafesLzz
	L3Zw==
Received: by 10.14.207.6 with SMTP id m6mr42851243eeo.10.1354586791839;
	Mon, 03 Dec 2012 18:06:31 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q44sm34819924eep.5.2012.12.03.18.06.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:06:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:23 +0100
Message-Id: <bf00f9c9f266101a69263959523a278ef8e69d2a.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 50/58] lightmediascaner: move .a files from PN-dev to PN-staticdev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 02:20:51 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
index 905f39e..8fdce18 100644
--- a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
+++ b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 DEPENDS = "sqlite3 flac virtual/libiconv"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://git.profusion.mobi/cgit.cgi/lightmediascanner.git/snapshot/release_${PV}.tar.bz2 \
 "
@@ -27,6 +27,7 @@ PACKAGES =+ "${PN}-test"
 FILES_${PN}-test = "${bindir}/test-lms"
 
 FILES_${PN}-dbg += "${libdir}/${PN}/plugins/.debug"
+FILES_${PN}-staticdev += "${libdir}/${PN}/plugins/*.a"
 
 # otherwise fails with ERROR: could not add conversion charset 'UTF-16BE': Invalid argument
 RDEPENDS_${PN}-test_append_libc-glibc = " glibc-gconv-utf-16"
-- 
1.8.0



