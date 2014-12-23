Return-Path: <philip.balister@gmail.com>
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id BC9A972712
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Dec 2014 20:47:03 +0000 (UTC)
Received: by mail-yk0-f180.google.com with SMTP id 9so3380636ykp.25
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Dec 2014 12:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=f70+vu+nF4xcmeb4+aMepd3M0so+/65gTaebecaTC4M=;
	b=B/rNB+fpoj9llMHNyZ1Y88eEvg2mOu2RXwDNw1pG3R4mnEiG917KXNOFbhaE/JFBvo
	FfRKpfKt1Bl2Zcljarzc+VIRGIENjvsHSZX1ACBTduXkQK5Ax6Ray0kYYyj8Yp0GrKvB
	tktB1QzZ/WFMATncklTUaUNAPJkEqObQolzQX6gwSJKFprBYHehojlE2Nt4B5JxHsY9O
	leomGnx0wQLrHNmOvYrPEkvsiIffoh1rCoe+FthdHzTtYdIAbZhngtydHaXWuz1Aa9lR
	8dDwQikkYARQth3g2uygE1ulDWTSFF68S/yT33GW0LP32djZDgGuT5R/4WGmG1PtaWSD
	qyzg==
X-Received: by 10.236.109.166 with SMTP id s26mr23334753yhg.67.1419367624401; 
	Tue, 23 Dec 2014 12:47:04 -0800 (PST)
Received: from thuvia.localdomain (pool-71-171-45-99.ronkva.east.verizon.net.
	[71.171.45.99]) by mx.google.com with ESMTPSA id
	s29sm14635321yha.28.2014.12.23.12.47.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Dec 2014 12:47:03 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Dec 2014 15:46:59 -0500
Message-Id: <1419367619-3158-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][PATCH] log4cpp : Add new recipe.
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
X-List-Received-Date: Tue, 23 Dec 2014 20:47:04 -0000

Built for armv7a basad machine.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb

diff --git a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb
new file mode 100644
index 0000000..1e0a44c
--- /dev/null
+++ b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "A library of C++ classes for flexible logging to files, syslog, IDSA and other destinations."
+HOMEPAGE = "http://sourceforge.net/projects/log4cpp/"
+PRIORITY = "optional"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+
+SRC_URI[md5sum] = "1e173df8ee97205f412ff84aa93b8fbe"
+SRC_URI[sha256sum] = "35abf332630a6809c969276b1d60b90c81a95daf24c86cfd7866ffef72f9bed0"
+
+SRC_URI = "http://downloads.sourceforge.net/log4cpp/log4cpp-${PV}.tar.gz \
+          "
+
+S="${WORKDIR}/log4cpp"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "\
+    --enable-doxygen=no \
+    --enable-dot=no \
+    --enable-html-docs=no \
+    --enable-latex-docs=no \
+    LDFLAGS=-lpthread \
+"
-- 
2.1.0


