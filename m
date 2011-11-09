Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROCLr-0008HM-KR
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Nov 2011 18:54:19 +0100
Received: by mail-fx0-f47.google.com with SMTP id t2so2009238faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Nov 2011 09:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=TGF1Jomc6qoqpwM4mhrac1uRBb9fEbs/j9kqWfTMCOg=;
	b=c8p6t41b+vII3d0Hss0j+c8AEukQQYgSH8Z5nB5Dn+2PHMqjfS7s/QdfGUHTXdHToD
	Qg3bgdKztOkO1W2wAHTxfgjlprk24ldK6GVHbfB6lanbPtRbzOWDMLiMlPyf31Iclcqx
	G11JWPbys74L6OpQ5FzMR1lSuRmlWsO2Cnkq4=
Received: by 10.223.58.8 with SMTP id e8mr6181070fah.27.1320860886295;
	Wed, 09 Nov 2011 09:48:06 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w11sm7452767fad.7.2011.11.09.09.48.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 09:48:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Nov 2011 18:47:53 +0100
Message-Id: <31a2761c1b9ca9e31445017b8180474813aecef4.1320860740.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <cover.1320860740.git.Martin.Jansa@gmail.com>
References: <cover.1320860740.git.Martin.Jansa@gmail.com>
Subject: [meta-oe 1/4] mplayer-common: import from OE-classic
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
X-List-Received-Date: Wed, 09 Nov 2011 17:54:19 -0000

From: Martin Jansa <martin.jansa@gmail.com>

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
1.7.8.rc1



