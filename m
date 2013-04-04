Received: from mail-bk0-f43.google.com ([209.85.214.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1UNfeT-0004W8-VH
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 10:36:10 +0200
Received: by mail-bk0-f43.google.com with SMTP id jm2so1350127bkc.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Apr 2013 01:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Nr/xcdeK2nVTHEX0L1fJhxT13iAtSWQ22n6wGY9rmiI=;
	b=aOP9IRhY4e32Y53J/dourW449eT4hNNzcM16c+UONB5XqzKcnx/75G0KbFTAqdkFK3
	BCYNNJqOPZ72sHUuZT4o5TEAvYiE/NrUqBalFkw+VqFP2K/e2N1eVjXcbGJG8OpjFfqn
	lW8KK4Zp0XEwQpYFvC+6hdrQ2onjx8dRMmzlOoFyNDFP1rQtJEoHqOBqP3VyHDKLAOgV
	ADPnSKAT5ud1uFz+HmsuWnM+tVxjeDteiYNq7TIWlMpmR7zEclGCYde4RUCQAai4by7s
	hmQwY3QL3kkG6VilZeJS3oMy7UvKGNdAK/JHKfy84djqXzMxtj6t5riA9HzILSjTDmwx
	fLCg==
X-Received: by 10.205.112.80 with SMTP id er16mr3638078bkc.12.1365063537657;
	Thu, 04 Apr 2013 01:18:57 -0700 (PDT)
Received: from s-stirtzel-linux.zera.local
	(ip-109-91-251-14.unitymediagroup.de. [109.91.251.14])
	by mx.google.com with ESMTPS id s10sm5172598bkt.10.2013.04.04.01.18.56
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 01:18:56 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Apr 2013 10:18:47 +0200
Message-Id: <1365063527-14328-2-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1365063527-14328-1-git-send-email-s.stirtzel@googlemail.com>
References: <1365063527-14328-1-git-send-email-s.stirtzel@googlemail.com>
Subject: [meta-oe][PATCH 2/2] maliit-framework: enable autostart
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
X-List-Received-Date: Thu, 04 Apr 2013 08:36:10 -0000
X-List-Received-Date: Thu, 04 Apr 2013 08:36:10 -0000

maliit-server will start via xdg autostart

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 .../maliit/maliit-framework/maliit-server.desktop  |    6 ++++++
 .../recipes-support/maliit/maliit-framework_git.bb |    8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/maliit/maliit-framework/maliit-server.desktop

diff --git a/meta-oe/recipes-support/maliit/maliit-framework/maliit-server.desktop b/meta-oe/recipes-support/maliit/maliit-framework/maliit-server.desktop
new file mode 100644
index 0000000..24bdf9b
--- /dev/null
+++ b/meta-oe/recipes-support/maliit/maliit-framework/maliit-server.desktop
@@ -0,0 +1,6 @@
+[Desktop Entry]
+Name=Maliit server
+Exec=/usr/bin/maliit-server
+Icon=
+Type=Application
+Categories=Utility;
diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bb b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
index e61cca0..2c4b0f8 100644
--- a/meta-oe/recipes-support/maliit/maliit-framework_git.bb
+++ b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://gitorious.org/maliit/maliit-framework.git;branch=master \
     file://0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch \
     file://0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch \
     file://0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch \
+    file://maliit-server.desktop \
     "
 
 SRCREV = "750842dec74a9b17dca91ef779c4fc5a43c4d9dc"
@@ -28,6 +29,7 @@ RRECOMMENDS_${PN} = "maliit-plugins"
 FILES_${PN} += "\
     ${libdir}/maliit/plugins-*/factories/libmaliit-plugins-quick-factory-*.so \
     ${libdir}/qt4/plugins/inputmethods/*.so \
+    ${datadir}/applications/maliit-server.desktop \
     "
 
 FILES_${PN}-dbg += "\
@@ -64,6 +66,9 @@ do_install_append() {
     #Fix absolute paths
     sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${datadir}/qt4/mkspecs/features/maliit-framework.prf
     sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${datadir}/qt4/mkspecs/features/maliit-plugins.prf
+
+    install -d ${D}${datadir}/applications
+    install -m 644 ${WORKDIR}/maliit-server.desktop ${D}${datadir}/applications
 }
 
 pkg_postinst_${PN} () {
@@ -73,6 +78,7 @@ if [ "x$D" != "x" ]; then
     exit 1
 fi
 echo "export QT_IM_MODULE=Maliit" >> /etc/xprofile
+ln -s /usr/share/applications/maliit-server.desktop /etc/xdg/autostart/maliit-server.desktop
 }
 
 pkg_postrm_${PN} () {
@@ -84,7 +90,7 @@ fi
 if [ -e "/etc/xprofile" ]; then
     sed -i -e "g|export QT_IM_MODULE=Maliit|d" /etc/xprofile
 fi
-
+rm -f /etc/xdg/autostart/maliit-server.desktop
 }
 
 S = "${WORKDIR}/git"
-- 
1.7.9.5



