Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QIpmG-0000EF-AZ
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 00:15:08 +0200
Received: by ywg8 with SMTP id 8so1647057ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 15:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=dRZ/A3qvDy9VlAKFwDP3zwf9iHIucT09sPvQFAVbLA8=;
	b=x/7H9qNoz3OwhHEBVfCh1Px4NavrBMuIDHaDtA28SP0oXmdpHmxAf3TVuNA33czdme
	Ac6debQKsFrkL4E2IRLu3y3TlAPWnBMW+e2sWEV/6BoUtggGevKDLy1LgiHPyw1zGr4Y
	f+nO4mrNtdXJ//Tj22gQMHTRCVoMNRrAT7tOk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=gOxgWkF1JSWZgoTJzjnikrQ1JEeD0mFX41ufc2OCpl+i3gCSRGQsNpCpJjyhy/vn+v
	KheKcJF6bCanaFE2Zefnx5zztDfFiEcNhAWwLo6WlhVsQYxcWzHw3PO0kAAlIiPC630p
	ud95LrYbB+K9RVuXZK06E4jnYXYHztHtCiIQ8=
Received: by 10.236.138.136 with SMTP id a8mr6047923yhj.467.1304806345544;
	Sat, 07 May 2011 15:12:25 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id g2sm2005922yhc.76.2011.05.07.15.12.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 15:12:24 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 May 2011 22:11:52 +0000
Message-Id: <1304806316-9716-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304806316-9716-3-git-send-email-otavio@ossystems.com.br>
References: <BANLkTi=UexRucCByH0SrL-j0_+dB4DCC7Q@mail.gmail.com>
	<1304806316-9716-1-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-2-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-3-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 4/8] freerdp: add recipe based on GIT from 2009-03-29
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
X-List-Received-Date: Sat, 07 May 2011 22:15:08 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/freerdp/freerdp.inc    |   23 +++++++++++++++++++++++
 meta-oe/recipes-support/freerdp/freerdp_git.bb |   15 +++++++++++++++
 2 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp.inc
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp_git.bb

diff --git a/meta-oe/recipes-support/freerdp/freerdp.inc b/meta-oe/recipes-support/freerdp/freerdp.inc
new file mode 100644
index 0000000..094f9c6
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp.inc
@@ -0,0 +1,23 @@
+# Copyright (C) 2010, 2011 O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license
+
+DESCRIPTION = "FreeRDP RDP client"
+HOMEPAGE = "http://freerdp.sourceforge.net"
+DEPENDS = "virtual/libx11 openssl libxcursor cups alsa-lib"
+RDEPENDS_${PN} += "xprop"
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



