Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQo1r-00039A-ON
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 00:00:12 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2550305fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 14:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=nvMy+JpSRpvHYr9F3or2qhp8kvkck4TZ4eRTin3EPFg=;
	b=t/XVzmAi2DmKyMokQRFKkjZz6PcfZ7IQFnAvatwbJbgczTXWHKIUC4/EwCqBkAdaEX
	iFFZTkAeCsaSb89GZqscSfOvOUYnpcJLpYXa/xv2UZuw63PvhD17O0pTVrMmgrI6g5u3
	g6LdhrP8UXMrkfuK022OR04Ewufrg3fCGgkgE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=XsbWUDbfQASDkINLYcinodVLOYGB7hVxDHfcytDcpiCJckdU9Fyl2mZTa2O2SYUfUV
	pX/cB5HTufjz5gWLyhaN8PehhUCwP/iLlF35EKz+BppHETbNMAhQoJR3pogioHl7t6JZ
	1KDpmWlIt57+ln9h6TJ/MzHBXPR+Mz/vDFlBE=
Received: by 10.223.13.69 with SMTP id b5mr4800447faa.140.1306706226368;
	Sun, 29 May 2011 14:57:06 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id g7sm527180fac.15.2011.05.29.14.57.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 14:57:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 23:56:31 +0200
Message-Id: <5770759059ca369818ce2afcd47c32b682f4a29a.1306706130.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
References: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306706130.git.Martin.Jansa@gmail.com>
References: <cover.1306706130.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 06/14] nmon: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Sun, 29 May 2011 22:00:12 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/nmon/nmon_13g.bb |   29 +++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/nmon/nmon_13g.bb

diff --git a/meta-oe/recipes-support/nmon/nmon_13g.bb b/meta-oe/recipes-support/nmon/nmon_13g.bb
new file mode 100644
index 0000000..ffe5d06
--- /dev/null
+++ b/meta-oe/recipes-support/nmon/nmon_13g.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "nmon performance monitor"
+HOMEPAGE = "http://nmon.sf.net"
+SECTION = "console/utils"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/Documentation.txt;md5=dbb13658cf55d687c4f2ff771a696d4a"
+DEPENDS = "ncurses"
+PR = "r1"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/nmon/lmon13g.c;name=lmon \
+           ${SOURCEFORGE_MIRROR}/nmon/Documentation.txt;name=doc \
+"
+
+SRC_URI[lmon.md5sum] = "b1b8e6c0123ad232394991f2d4f40494"
+SRC_URI[lmon.sha256sum] = "456ab2a342b31d1a352d0d940af5962fa65a12ae8757ff73e6e73210832ae8b5"
+SRC_URI[doc.md5sum] = "dbb13658cf55d687c4f2ff771a696d4a"
+SRC_URI[doc.sha256sum] = "1f7f83afe62a7210be5e83cd24157adb854c14599efe0b377a7ecca933869278"
+
+CFLAGS += "-D JFS -D GETUSER -Wall -D LARGEMEM"
+LDFLAGS += "-lncursesw"
+ASNEEDED_pn-nmon = ""
+
+do_compile() {
+	${CC} ${CFLAGS} ${LDFLAGS} ${WORKDIR}/lmon13g.c -o nmon
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 nmon ${D}${bindir}
+}
-- 
1.7.5.rc3



