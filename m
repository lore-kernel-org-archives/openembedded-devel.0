Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RK6Gv-0006fd-Ca
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 12:36:17 +0200
Received: by mail-fx0-f47.google.com with SMTP id s16so4799631faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Oct 2011 03:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=114Od1z19CCCbTF1F1delONlswFkvV1DxZM7U6wZUD4=;
	b=AeHVCvx7cVwST0L0jtvHnHu9AFvxgGUavsxDC33HySxGhSNm/gAtNJVIYwCzTeym/A
	OhfYVr4AQVxBYfp750JQ70BdB4ekfhu5bQWuK5n3esiHUMLR9dQWz2CPTUdQcal+V3iN
	y78IX97KnHMhd1dAYaNki47noY0Xx7/ERqhJc=
Received: by 10.223.92.135 with SMTP id r7mr13336179fam.35.1319884217315;
	Sat, 29 Oct 2011 03:30:17 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y2sm23359466fag.12.2011.10.29.03.30.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Oct 2011 03:30:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Oct 2011 12:29:05 +0200
Message-Id: <941836c79ce4b08c62672c36c77f47d3a8b89b83.1319884094.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1319884094.git.Martin.Jansa@gmail.com>
References: <cover.1319884094.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][meta-oe 09/12] task-x11-server: import from Angstrom
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
X-List-Received-Date: Sat, 29 Oct 2011 10:36:17 -0000

* from meta-angstrom revision 8aa9581a920abae8878df2f3faf9857474edd1f8
* added RPROVIDES to be able to drop server part from task-x11
* updated DESCRIPTION to match
* renamed to task-x11-server for upgradeable path

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/tasks/task-x11-server_1.0.bb |   24 +++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-core/tasks/task-x11-server_1.0.bb

diff --git a/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb b/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
new file mode 100644
index 0000000..86de1ec
--- /dev/null
+++ b/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Task for a image with Xserver"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+PR = "r9"
+
+inherit task
+
+# for backwards compatibility
+RPROVIDES_${PN} = "task-x11-server"
+
+XSERVER ?= "xserver-xorg \
+           xf86-input-evdev \
+           xf86-input-mouse \
+           xf86-video-fbdev \
+           xf86-input-keyboard \
+"
+
+
+RDEPENDS_${PN} = " \
+  ${XSERVER} \
+"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
-- 
1.7.7.1



