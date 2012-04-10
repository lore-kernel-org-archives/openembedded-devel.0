Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SHUGN-0007dp-Kr
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2012 08:09:11 +0200
Received: by wibhj13 with SMTP id hj13so2591729wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2012 22:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=fgvoDFOsaI7WPeOtXGPM0mzdVnUyRSBTgzjm7sULKN8=;
	b=HsCOcMa4TfaRT1uSvEtWFAG8VXF/vQyTw5IMwp7/XTWqzCHTeecmVbUBctPaCk2wyK
	OEHxUTEGZf8JRx75LeTxbTfgsx4ZEcCbZULuFe0VVFQPodJSdQ4+Qpfwb7YDZ4fTqepQ
	+o3iCaFNffZY/wHT2NI266vwqmPT+brB9P+63r5b9+WKsutimEQ6xV4PtWnbGS6+pDUP
	ZGKLtbSjIaGLkiXzOs8IVZdJThGCuFTuHNCs6qLbf/xCD+3z7usZIUyvjejBdm4VCCU5
	8kJV4io5rSZh8jYq7KnKgK5ptvZeyD4sfSD23/xmWw8RCXceABiUfnFNIoGCzuayTAAL
	WeDA==
Received: by 10.180.95.74 with SMTP id di10mr4535428wib.1.1334037594557;
	Mon, 09 Apr 2012 22:59:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gd4sm57484887wib.6.2012.04.09.22.59.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 22:59:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Apr 2012 07:59:39 +0200
Message-Id: <c55ca91ae7203a1fe164a1a91230b970fc075759.1334037469.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <447016b1ed3811830299ad0145a8e3216abd50c4.1334037469.git.Martin.Jansa@gmail.com>
References: <447016b1ed3811830299ad0145a8e3216abd50c4.1334037469.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1334037469.git.Martin.Jansa@gmail.com>
References: <cover.1334037469.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] xserver-nodm-init: add EnvironmentFile
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
X-List-Received-Date: Tue, 10 Apr 2012 06:09:11 -0000

* used to set HOME variable before /etc/X11/Xsession is started
* e.g. enlightenment is creating ${HOME}/.e and without this it ends in
  /tmp/.e and during startup HOME gets defined and switched to
  /home/root/.e

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xserver-nodm-init-2.0/xserver-nodm.conf        |    1 +
 .../xserver-nodm-init-2.0/xserver-nodm.service     |    1 +
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |    7 ++++++-
 3 files changed, 8 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.conf

diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.conf b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.conf
new file mode 100644
index 0000000..3c0582a
--- /dev/null
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.conf
@@ -0,0 +1 @@
+HOME=/home/root
diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.service b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.service
index a35d70e..c15a772 100644
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.service
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0/xserver-nodm.service
@@ -2,6 +2,7 @@
 Description=Xserver startup with a display manager
 
 [Service]
+EnvironmentFile=/etc/default/xserver-nodm
 ExecStart=/usr/bin/xinit /etc/X11/Xsession -- /etc/X11/Xserver
 
 [Install]
diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
index 36d9bfc..62c33c9 100644
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
@@ -3,10 +3,11 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
 
-PR = "r14"
+PR = "r16"
 
 SRC_URI = "file://xserver-nodm \
            file://xserver-nodm.service \
+           file://xserver-nodm.conf \
            file://gplv2-license.patch \
 "
 S = "${WORKDIR}"
@@ -25,7 +26,11 @@ SYSTEMD_SERVICE_${PN}-systemd = "xserver-nodm.service"
 do_install() {
 	install -d ${D}${sysconfdir}/init.d
 	install xserver-nodm ${D}${sysconfdir}/init.d
+	install -d ${D}${sysconfdir}/default
+	install xserver-nodm.conf ${D}${sysconfdir}/default/xserver-nodm
 }
 
+FILES_${PN}-systemd += "${sysconfdir}/default/xserver-nodm"
+
 RDEPENDS_${PN} = "xserver-common (>= 1.30) xinit"
 RDEPENDS_${PN}-systemd += "xserver-common (>= 1.30) xinit"
-- 
1.7.8.5



