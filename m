Received: from mail-ea0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UKnWu-0003zz-Bx
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Mar 2013 11:24:32 +0100
Received: by mail-ea0-f170.google.com with SMTP id a15so3242870eae.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2013 03:07:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=RCHr95zJk4JlVcNCD+WF/gMQ9QwqpiS0OkhUUsU2vUY=;
	b=b3mkkLwBPcgNLO0MKKkVUrQaqHLNHakV1RQOOmf+FzSEnVMxLPIUx11OfP7c7XLScc
	DJH4clxLGEhIC8hqI0L3Mlt929p8sISt43o5ztTq7/C9nxLtZWEYWiYy/+Oq7nXMRcJU
	l6l7/W5J/BA0iSQQm/O3bXVZlHEggoipX21UuaCocJW9RpcfsDvEcWVZD8+uWAg+11ZC
	saLc88Py+2tyCDbXJjcGWTOoBPlZm6IyGRxJHMced4PcktQGmt8Fd85YN8PoRaaQ4F3n
	la7DpJAtlLvmPYm7wHG+UDV5mgx9a7hnMwJMOrORd6oHZvANgu5BzTbHc3g398JjwG1k
	c+qA==
X-Received: by 10.14.5.137 with SMTP id 9mr41798858eel.30.1364378847293;
	Wed, 27 Mar 2013 03:07:27 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id h5sm30233443eem.1.2013.03.27.03.07.25
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 27 Mar 2013 03:07:26 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Mar 2013 11:07:13 +0100
Message-Id: <1364378833-16237-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQnn2xD5WFGknS66+vSDznt01Eog0KW+v9ZNrJeT1vMJvHBzXyBB7aSbPRhzMLhifBEKL+4N
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] multipath-tools: add recipe for git version
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
X-List-Received-Date: Wed, 27 Mar 2013 10:24:37 -0000

Multipath-tools hasn't seen a release in 3 years, so grab latest git.

'kpartx' is subpackaged since that's the tool most people want.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../multipath-tools/multipath-tools_git.bb         | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 recipes-support/multipath-tools/multipath-tools_git.bb

diff --git a/recipes-support/multipath-tools/multipath-tools_git.bb b/recipes-support/multipath-tools/multipath-tools_git.bb
new file mode 100644
index 0000000..1b83f49
--- /dev/null
+++ b/recipes-support/multipath-tools/multipath-tools_git.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "The upstream project used to drive the Device Mapper multipathing driver."
+
+DEPENDS = "lvm2 libaio"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7be2873b6270e45abacc503abbe2aa3d"
+
+
+SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http"
+SRCREV = "15fc23ffb2bd1bac6990eda3e23c3e8980e6cfa5"
+
+S = "${WORKDIR}/git"
+
+PV = "0.4.9+git"
+
+EXTRA_OEMAKE = "MULTIPATH_VERSION=${PV} DESTDIR=${D} syslibdir=${base_libdir} libdir=${base_libdir}/multipath"
+
+do_compile() {
+	oe_runmake
+}
+
+do_install() {
+	oe_runmake install
+}
+
+FILES_${PN}-dbg += "${base_libdir}/multipath/.debug"
+FILES_${PN} += "${base_libdir}/multipath \
+                ${base_libdir}/systemd"
+
+PACKAGES =+ "kpartx"
+FILES_kpartx = "${base_sbindir}/kpartx \
+                ${base_libdir}/udev/kpartx_id"
+
+RDEPENDS_${PN} += "kpartx"
-- 
1.8.1.4



