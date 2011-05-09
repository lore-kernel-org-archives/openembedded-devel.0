Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJVzp-0002rv-22
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 21:19:57 +0200
Received: by gyf1 with SMTP id 1so2074894gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 12:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=V0irjuScIC+PPvFDz4xr7mKWk2u7bZJ8mRMqZ0xTxQU=;
	b=PoNEMaGSxfTw7U4P/++Q+J2cZoSN4Uf3+yZlbgZGTFEmHsQkoN9472Df54dhXQbTyy
	aaf5GA1bh/JUmXpYbHUJExYODtN9jc2MdumQ2hAe1QFpgZEvc0U82e+rLlNEknCXptYr
	PmC6GkpHuJSE2MhA8HZedZZzcAca+42BH1jXY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=WpQhz6pQMBANDIwGFqEy2oD1yRv78/FryFiyosUNRyJMabO9CH3KwpyZGuLRSHttor
	P+eNr8jSghOemnBn2jc5Udzl9I4O9AHrEuaJot4D8fWCwkDxUMDHgKdUkLm87bJht9kV
	JMSf1r0b7m/DQOO9SOQHIbplRkrW8D9NYws/k=
Received: by 10.150.236.15 with SMTP id j15mr5484048ybh.294.1304968631684;
	Mon, 09 May 2011 12:17:11 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c3sm1123219ybn.24.2011.05.09.12.17.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2011 12:17:10 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 May 2011 19:16:46 +0000
Message-Id: <1304968617-4949-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v4 01/12] fuse: add version 2.8.5
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
X-List-Received-Date: Mon, 09 May 2011 19:19:57 -0000

This recipes is required by ntfs-3g-ntfsprogs.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/fuse/fuse_2.8.5.bb |   34 ++++++++++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/fuse/fuse_2.8.5.bb

diff --git a/meta-oe/recipes-support/fuse/fuse_2.8.5.bb b/meta-oe/recipes-support/fuse/fuse_2.8.5.bb
new file mode 100644
index 0000000..65b114b
--- /dev/null
+++ b/meta-oe/recipes-support/fuse/fuse_2.8.5.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "With FUSE it is possible to implement a fully functional filesystem in a userspace program"
+HOMEPAGE = "http://fuse.sf.net"
+SECTION = "libs"
+LICENSE = "GPLv2&LGPLv2"
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
+RRECOMMENDS_${PN} = "kernel-module-fuse""
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



