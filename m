Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QIu0f-0007mt-Eh
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 04:46:17 +0200
Received: by ywg8 with SMTP id 8so1673094ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 19:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=5reCCe3DpmGl7VQTY7u4u5/xj6y/cr9OJuT7ruWckYg=;
	b=M5phaRlMbhAqwdbaSHKfC6OiUC6LyVeIuB153JYOpY/IupZEbQhi+K2rXeR3/gi87p
	ooG/+fSzkCGoQrn/NSMJ50XV8xu7svMKSIkEll27wCKkDfoUpGXOKkfv6KL7B1HGzqKh
	WBTNwsi2W8Zi/v9aqV6gd8P52Bv2kIgOgYbWQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=dThZFIQUlPcoBZl6QnMtDqFL/Jy8FHlxq5Z4GtvGwJPbbP/CmZBMtlRilVkrNiMfzf
	K+TQCahq0Ovp+OuckcZT7XKx1iOQTrUE9/BxgJmfLv+2OJ7H5PRq7lSPWNW3wqlh2WJM
	dHtjCbfFwUvmAvRyRbfluiNE1j3ZbHkrO8pnE=
Received: by 10.150.14.21 with SMTP id 21mr4445875ybn.200.1304822612696;
	Sat, 07 May 2011 19:43:32 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id v1sm4837128anh.25.2011.05.07.19.43.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 19:43:31 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 May 2011 02:42:59 +0000
Message-Id: <1304822586-14872-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304822586-14872-1-git-send-email-otavio@ossystems.com.br>
References: <1304822586-14872-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 04/11] freerdp: add recipe based on GIT from 2009-03-29
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
X-List-Received-Date: Sun, 08 May 2011 02:46:17 -0000

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



