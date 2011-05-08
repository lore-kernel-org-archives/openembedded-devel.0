Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJ760-0001Wy-HD
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 18:44:40 +0200
Received: by yia13 with SMTP id 13so1745003yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 09:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=5reCCe3DpmGl7VQTY7u4u5/xj6y/cr9OJuT7ruWckYg=;
	b=aIJ7HSnvr32bYfIch+Iihj3ZD5OY4kn8qO3EiphX9vDcp2DN67C+mXwRR8mvj7qrqk
	K7qfXTzN7m92ZfxPLbYwUC5I+CuLAVJr4H87RhuHCb6YpUslQs5K67FEJG5H5JqTK1pC
	aqi/0CKar+JmJ1wYO417GWSkODgKxY0xRAGsA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=oOg/03F5hYIasAcS4qsKUkYUl32jcHQqxRCJGzFqnU+73TOcqGOrO9wvPAuw8EBoG6
	/pCGd70qEgP8a5Aj0fUYUNKmsvjBGvCtfazPWfdM6tWpaDL6RJpNKAh92uguqZ9tEMv/
	3TqqpcQxMEuT4KBItzGHzvsDWOHcwD/deBlUs=
Received: by 10.236.109.161 with SMTP id s21mr7083713yhg.124.1304872916082;
	Sun, 08 May 2011 09:41:56 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l74sm2245064yhn.96.2011.05.08.09.41.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 May 2011 09:41:55 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 May 2011 16:41:28 +0000
Message-Id: <1304872895-21596-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304872895-21596-1-git-send-email-otavio@ossystems.com.br>
References: <1304872895-21596-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v3 04/11] freerdp: add recipe based on GIT from 2009-03-29
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
X-List-Received-Date: Sun, 08 May 2011 16:44:40 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/freerdp/freerdp.inc    |   24 ++++++++++++++++++++++++
 meta-oe/recipes-support/freerdp/freerdp_git.bb |   15 +++++++++++++++
 2 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp.inc
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp_git.bb

diff --git a/meta-oe/recipes-support/freerdp/freerdp.inc b/meta-oe/recipes-support/freerdp/freerdp.inc
new file mode 100644
index 0000000..f8402c7
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp.inc
@@ -0,0 +1,24 @@
+# Copyright (C) 2010, 2011 O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license
+
+DESCRIPTION = "FreeRDP RDP client"
+HOMEPAGE = "http://freerdp.sourceforge.net"
+DEPENDS = "virtual/libx11 openssl libxcursor cups alsa-lib"
+SECTION = "x11/network"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+INC_PR = "r0"
+
+inherit pkgconfig autotools
+
+do_configure_prepend() {
+	# workaround gcc linking bug
+	find ${S} -name 'Makefile.am' | xargs -n 1 sed 's,-pthread,-lpthread -D_REENTRANT,g' -i
+}
+
+do_install_append() {
+	rm ${D}${libdir}/freerdp/*.a ${D}${libdir}/freerdp/*.la
+}
+
+RDEPENDS_${PN} += "xprop"
diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
new file mode 100644
index 0000000..fa4ba9a
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -0,0 +1,15 @@
+# Copyright (C) 2010, 2011, O.S. Systems Software Ltda.
+# Released under the MIT license
+
+include freerdp.inc
+
+inherit gitpkgv
+
+PV = "gitr${SRCPV}"
+PKGV = "${GITPKGVTAG}"
+PR = "${INC_PR}.0"
+
+SRCREV = "7bbde4fb3bc3a781364d0a626c49bc165cc507fd"
+SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;protocol=git"
+
+S = "${WORKDIR}/git"
-- 
1.7.2.5



