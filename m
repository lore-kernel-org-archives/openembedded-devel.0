Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RMMgq-0005xd-4C
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Nov 2011 17:32:24 +0100
Received: by faat2 with SMTP id t2so147048faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Nov 2011 09:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=THUzoKFGYEuy/R8pMUQJg3kL2nB3ctm7xR+Cz9RrfQA=;
	b=wPOlrBqNFxznAhQUx8atIe2zBzWKWOegYonqLDEJsjfM6e1ogm3DiPdbXUiq8JKf3A
	6RxC5Js4T0+ZHkDHgHM7RNRzQWu7xHs3b1Sj7BL+e7vLpD7DbLf1dWyFKRcCpCJk14Fq
	3UkI35hOBvPmI/1S3t4of7s7ssLmqsISJaP8k=
Received: by 10.223.30.149 with SMTP id u21mr25388346fac.18.1320423974459;
	Fri, 04 Nov 2011 09:26:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y10sm14313152fal.10.2011.11.04.09.26.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Nov 2011 09:26:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Nov 2011 17:26:06 +0100
Message-Id: <1320423966-7492-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.2
Subject: [PATCH] mplayer-common: import from OE-classic
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
X-List-Received-Date: Fri, 04 Nov 2011 16:32:24 -0000

* commit b28081b6039db85f18bf9e722fece59bff6e7b0f

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/mplayer/mplayer-common.bb   |   22 ++++++++++++++++++++
 .../mplayer/mplayer-common/mplayer.conf            |   15 +++++++++++++
 2 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer-common.bb
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer-common/mplayer.conf

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb b/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb
new file mode 100644
index 0000000..889bb95
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb
@@ -0,0 +1,22 @@
+# Copyright Matthias Hentges <devel@hentges.net> (c) 2006
+# License: MIT (see COPYING.MIT)
+
+DESCRIPTION = "Preconfigured mplayer preferences"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PV = "0.0.1"
+
+SRC_URI = "file://mplayer.conf"
+
+# Yes, really /usr/etc!!!
+do_install() {
+	install -d "${D}/usr${sysconfdir}/mplayer"
+
+	install -m 0644 ${WORKDIR}/mplayer.conf "${D}/usr${sysconfdir}/mplayer"
+}
+
+FILES_${PN} = "/usr${sysconfdir}/mplayer"
+
+inherit allarch
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer-common/mplayer.conf b/meta-oe/recipes-multimedia/mplayer/mplayer-common/mplayer.conf
new file mode 100644
index 0000000..92aeb15
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer-common/mplayer.conf
@@ -0,0 +1,15 @@
+
+# You probably shouldn't touch these
+ac=mad,
+ao=oss,
+
+# Required on SL-Cxxxx for correct rotation in the *VT*,
+# breaks rotation in X!
+# vf=rotate=1
+
+# Enable fullscreen display by default
+# fs=true
+
+# Drop frames to keep audio and video in sync
+framedrop=true
+
-- 
1.7.7.2



