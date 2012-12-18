Received: from mail-gg0-f177.google.com ([209.85.161.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tl4kU-00043J-R0
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2012 22:30:53 +0100
Received: by mail-gg0-f177.google.com with SMTP id y3so275066ggc.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2012 13:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=jBNPQBOuOXK5aEVWkjwQwIZ+QXzrue4Db7D9i391zD8=;
	b=nHf2J2joyd/fluBb8ao38d7y3av/KoUOZ7+VIcXZZS75xYl/1OPM8tb5rlK8sZ+YZX
	nO+p9lfxaJ05xTI2EtdPLyk+bAUYQfP5iigEoi0PUabvIYF9/dQR7wB4c4lfhTwJMkxx
	xVwcl1YTZauBV26W1leyYbUM8CsxLzPs3zer6CcI8CX3RrP8p19d3t/k5UtYOHHVsWyf
	O7qD/2rQKk3YDJmhbpbGB9vDBCe0VOf8MnF7s4o0WHrhhQMXRDj2JGJMeZxeeoKUpFdh
	Y6tN3V4ywzCE5++I3641GU4r0slLDLqBzJmv7QAE02RpssYOuhX8ymP9TeFg4f9lFyMa
	5mZg==
X-Received: by 10.236.126.102 with SMTP id a66mr3423194yhi.82.1355865367805;
	Tue, 18 Dec 2012 13:16:07 -0800 (PST)
Received: from localhost.localdomain ([187.23.144.59])
	by mx.google.com with ESMTPS id h37sm2441909anm.10.2012.12.18.13.16.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 13:16:07 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Dec 2012 19:15:56 -0200
Message-Id: <1355865358-21642-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/3] openmotif: Update SRC_URI and add libxft in depends
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
X-List-Received-Date: Tue, 18 Dec 2012 21:30:54 -0000

The file couldn't be found in the official repository and it seems
unmaintained as it had processing errors when trying to register to be
able to download the last release. Researching in the web a mirror has
been found and than we're using now this mirror so fetch works again.

During build test, from a clean tmp directory we found that libxft is
a hard dependency so we add it to depends list.

Change-Id: If486a40718af688dfad6768d56432afb573cf8d8
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-support/openmotif/openmotif_2.3.3.bb   |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
index 2e9c2de..e7a0220 100644
--- a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
+++ b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
@@ -1,11 +1,13 @@
 SECTION = "libs"
 DESCRIPTION = "OSM/Motif implementation."
 LICENSE = "OGPL"
-DEPENDS = "xbitmaps virtual/libx11 libxt libxp"
+DEPENDS = "xbitmaps virtual/libx11 libxt libxp libxft"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=14f692c82491db3d52419929d2f3b343"
 
-SRC_URI = "http://openmotif.com/files/public_downloads/openmotif/2.3/2.3.3/openmotif-2.3.3.tar.gz \
+PR = "r1"
+
+SRC_URI = "http://fossies.org/unix/misc/openmotif-2.3.3.tar.gz \
            file://configure.patch;patch=1"
 
 SRC_URI[md5sum] = "fd27cd3369d6c7d5ef79eccba524f7be"
-- 
1.7.2.5



