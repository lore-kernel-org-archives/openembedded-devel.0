Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RWGWc-0007rn-DG
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 00:58:46 +0100
Received: by bkbzv15 with SMTP id zv15so2397001bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2011 15:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=h8pOT4XCfKNQ+3hfQMNq2SWIqZ4lUflLgT+FkeveP8Q=;
	b=uiPjQ3gBFj3Zq0nrqbKtpqHFnW70nKVf7uSckIrzg1/roxxCdfl9k8dBos5noJaxTR
	sMxVNSsFbgFduYW1IerMhFK5iVqhNk2J6DCwo+pzPvEgOHz2MdC7vOwstwfbdoUnKEO+
	3Vi2D9CF3metIc327oWq7DokY4XkamKBsUFs4=
Received: by 10.204.153.23 with SMTP id i23mr1425540bkw.57.1322783524058;
	Thu, 01 Dec 2011 15:52:04 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c4sm14922077bkk.13.2011.12.01.15.51.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 15:51:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Dec 2011 00:51:50 +0100
Message-Id: <1322783510-11021-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
Cc: Norman Schleicher <NormanSchleicher@gmx.de>
Subject: [PATCH][meta-oe] nmon_13g: add -ltinfo linker flag
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
X-List-Received-Date: Thu, 01 Dec 2011 23:58:46 -0000

From: Norman Schleicher <NormanSchleicher@gmx.de>

* ld in latest binutils-2.22 from oe-core doesn't have
  --copy-dt-needed-entries enabled by default anymore see:
  http://sourceware.org/cgi-bin/cvsweb.cgi/~checkout~/src/ld/NEWS?rev=1.121&content-type=text/plain&cvsroot=src&only_with_tag=binutils-binutils-2_22
  so we have to be more carefull which libs are specified on linker
  command line, similar issue is in mplayer2 and aurora-daemon (qt4)

Signed-off-by: Norman Schleicher <NormanSchleicher@gmx.de>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/nmon/nmon_13g.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/nmon/nmon_13g.bb b/meta-oe/recipes-support/nmon/nmon_13g.bb
index ffe5d06..bc82c0a 100644
--- a/meta-oe/recipes-support/nmon/nmon_13g.bb
+++ b/meta-oe/recipes-support/nmon/nmon_13g.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/Documentation.txt;md5=dbb13658cf55d687c4f2ff771a696d4a"
 DEPENDS = "ncurses"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/nmon/lmon13g.c;name=lmon \
            ${SOURCEFORGE_MIRROR}/nmon/Documentation.txt;name=doc \
@@ -16,7 +16,7 @@ SRC_URI[doc.md5sum] = "dbb13658cf55d687c4f2ff771a696d4a"
 SRC_URI[doc.sha256sum] = "1f7f83afe62a7210be5e83cd24157adb854c14599efe0b377a7ecca933869278"
 
 CFLAGS += "-D JFS -D GETUSER -Wall -D LARGEMEM"
-LDFLAGS += "-lncursesw"
+LDFLAGS += "-ltinfo -lncursesw"
 ASNEEDED_pn-nmon = ""
 
 do_compile() {
-- 
1.7.8.rc4



