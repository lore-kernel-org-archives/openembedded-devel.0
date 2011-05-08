Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJ75u-0001WS-FN
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 18:44:34 +0200
Received: by gyf1 with SMTP id 1so1741699gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 09:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=a7o15dLW4R4rT54NsZZjnxvC82zB0OQCQlhesr2XexU=;
	b=dli7GikLeDP1b4Ka7Us1PLUqjc1uds9+Bs3ncAivUCdV6N+yx4jnUUgDPlapV09yCg
	H8yfmiFSk1Ax53ji4XPooeDmBA19m3qp2JAypeT+kMKX1iONicgRfop+wSF746sGJqkg
	y+AcxRZjNHZqzz0HngUMw8j1InzORry9gleCE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=Jja2rWpwrNr9dY5nTT7v1wCl27xPpQafZp5dO54IXfXTAdkD7MM7sIFmzPL4PKXULd
	8uyJWmbcBenX+FWYVWiobcFFl3UwxByKowF4xlHBbmpytZhMCO3kYh9HjGws/mLXaFjd
	cJoeQUddqF8uekLwNO5KqEgS9CzFwzgL+ai+Q=
Received: by 10.236.193.100 with SMTP id j64mr7224756yhn.294.1304872909397;
	Sun, 08 May 2011 09:41:49 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l74sm2245064yhn.96.2011.05.08.09.41.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 May 2011 09:41:48 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 May 2011 16:41:25 +0000
Message-Id: <1304872895-21596-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v3 01/11] fuse: add version 2.8.5
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
X-List-Received-Date: Sun, 08 May 2011 16:44:34 -0000

This recipes is required by ntfs-3g-ntfsprogs.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/fuse/fuse_2.8.5.bb |   33 ++++++++++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/fuse/fuse_2.8.5.bb

diff --git a/meta-oe/recipes-support/fuse/fuse_2.8.5.bb b/meta-oe/recipes-support/fuse/fuse_2.8.5.bb
new file mode 100644
index 0000000..3176536
--- /dev/null
+++ b/meta-oe/recipes-support/fuse/fuse_2.8.5.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "With FUSE it is possible to implement a fully functional filesystem in a userspace program"
+HOMEPAGE = "http://fuse.sf.net"
+SECTION = "libs"
+LICENSE = "GPLv2"
+RRECOMMENDS_${PN} = "kernel-module-fuse""
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
+
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "8aa2fd689de00b73963620483084ae3b"
+SRC_URI[sha256sum] = "bec80e66ae8ee60dfdf67b2ca291266a45dcfe6bc20c64f3acfceaa38ed29a84"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--disable-kernel-module"
+
+PACKAGES =+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev libulockmgr-dbg"
+
+FILES_${PN} += "${libdir}/libfuse.so.*"
+FILES_${PN}-dev += "${libdir}/libfuse*.la"
+
+FILES_libulockmgr = "${libdir}/libulockmgr.so.*"
+FILES_libulockmgr-dev += "${libdir}/libulock*.la"
+FILES_libulockmgr-dbg += "${libdir}/.debug/libulock*"
+
+# Forbid auto-renaming to libfuse-utils
+FILES_fuse-utils = "${bindir} ${base_sbindir}"
+FILES_fuse-utils-dbg = "${bindir}/.debug ${base_sbindir}/.debug"
+DEBIAN_NOAUTONAME_fuse-utils = "1"
+DEBIAN_NOAUTONAME_fuse-utils-dbg = "1"
-- 
1.7.2.5



