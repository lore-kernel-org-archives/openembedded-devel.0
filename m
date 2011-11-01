Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RL9oa-0008NW-JJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 09:35:24 +0100
Received: by mail-fx0-f47.google.com with SMTP id s16so6983585faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 01:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=N+4qfuy4okVm8W83fnzH+rVKDX8jIeFwYKYKY3XLws4=;
	b=CIGcbSIKAmsSWt5C5DrYRzPRP16D8co6K2JDLl/2Pa2/1LIJHmBaLk9PeN+Smj8qhf
	58dAkHnvgDUYvLWcFu/5sSGSeuGETXHh/UeWD9qO/GAyqKfG4Q0SyWIoUtsVhYh856dn
	MbswqdSALSLfrKTXYOjXGenRhGreEeJv0aMm8=
Received: by 10.223.75.150 with SMTP id y22mr6488792faj.29.1320136161099;
	Tue, 01 Nov 2011 01:29:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w11sm43359074fad.7.2011.11.01.01.29.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 01:29:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Nov 2011 09:27:46 +0100
Message-Id: <0cae72ec56112acf638226581286c8495bb90f87.1320135926.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <58fda822fdf64f38e5d75e75c5cf4a196a37e47e.1320135926.git.Martin.Jansa@gmail.com>
References: <58fda822fdf64f38e5d75e75c5cf4a196a37e47e.1320135926.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320135926.git.Martin.Jansa@gmail.com>
References: <cover.1320135926.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][meta-oe 12/15] task-x11-server: import from Angstrom
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
X-List-Received-Date: Tue, 01 Nov 2011 08:35:24 -0000

* from meta-angstrom revision 8aa9581a920abae8878df2f3faf9857474edd1f8
* added RPROVIDES to be able to drop server part from task-x11
* updated DESCRIPTION to match
* renamed to task-x11-server for upgradeable path

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/tasks/task-x11-server_1.0.bb |   23 +++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-core/tasks/task-x11-server_1.0.bb

diff --git a/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb b/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
new file mode 100644
index 0000000..7e43d55
--- /dev/null
+++ b/meta-oe/recipes-core/tasks/task-x11-server_1.0.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Task for an image with Xserver"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+PR = "r9"
+
+inherit task
+
+# for backwards compatibility
+RPROVIDES_${PN} += "task-xserver"
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
-- 
1.7.7.1



