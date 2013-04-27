Received: from mail-ea0-f172.google.com ([209.85.215.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UWAE1-0004Yd-Eu
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Apr 2013 20:52:02 +0200
Received: by mail-ea0-f172.google.com with SMTP id z16so489392ead.31
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2013 11:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=qK3S29Hfgug/PaR9ERmXkKC3xm1zTOyeaV3ae0Ui4yQ=;
	b=uxHVmf73e+MmV3Oy68DVIHHSMqO4lZikQr9VwVgsA+NLWX5fcFL0SA+F6TeA4OAue0
	m4C0oH3aN2vYmT4iKyMaSnwLgInekEE3zYrWi2NbbvuoUI75XTSwjfgJOWoVK4hfvTDn
	Xqm7XfsWJKZ3LQgtSYgPbddv4xpGw5oqxlijk4zOEbZ3XJLcF8pbqKojfDNaE8+UChsK
	2VpgH202l6yhQltBYSiSTA7EctRDwV/MBv9im4iRiD6CuAGV1IjQZy2aYVfC2fHRTWmb
	Iiit9kWzVKV/PpwZzE4zHqbh7Pwn9czK6fQbbqB67YKEaI1Q8OB7ef/e67N3LeiUm5wy
	v1Fg==
X-Received: by 10.14.194.70 with SMTP id l46mr55272291een.28.1367087651021;
	Sat, 27 Apr 2013 11:34:11 -0700 (PDT)
Received: from localhost.localdomain (p5B0A212D.dip0.t-ipconnect.de.
	[91.10.33.45])
	by mx.google.com with ESMTPSA id f9sm23175879eeu.11.2013.04.27.11.34.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 27 Apr 2013 11:34:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Apr 2013 20:33:57 +0200
Message-Id: <1367087640-4264-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1367087640-4264-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367087640-4264-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-xfce 1/4] gdm: fix postinst-code to unbreak first boot issues
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
X-List-Received-Date: Sat, 27 Apr 2013 18:52:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Exiting postinst code leaves systemd.bbclass offline postinst code unexecuted,
causes postinst not to finish at first boot (gdm.service is not aliased to
display-manager.service -> started much too early) and is not neccesary:
language preparation can be done offline.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb |   31 ++++++++++-----------------
 1 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index 1e55dd9..87efc28 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "xinput gnome-panel tcp-wrappers libcanberra libxklavier grep consolekit libpam gnome-doc-utils gtk+ xrdb"
 
-PR = "r15"
+PR = "r16"
 
-inherit gnome update-rc.d systemd
+inherit gnome update-rc.d systemd useradd
 
 SRC_URI += " \
             file://cross-xdetection.diff \
@@ -33,8 +33,8 @@ do_configure_prepend() {
 }
 
 do_install_prepend() {
-    mkdir -p ${D}/var/lib/gdm/.gconf.mandatory
-    cp ${WORKDIR}/%gconf-tree.xml ${D}/var/lib/gdm/.gconf.mandatory/
+    install -d ${D}/${localstatedir}/lib/gdm/.gconf.mandatory
+    install ${WORKDIR}/%gconf-tree.xml ${D}/${localstatedir}/lib/gdm/.gconf.mandatory/
 }
 
 do_install_append() {
@@ -54,6 +54,9 @@ do_install_append() {
     sed -e 's,%sbindir%,${sbindir},g' \
         < ${WORKDIR}/gdm.service.in \
         > ${D}${systemd_unitdir}/system/gdm.service
+
+    chown -R gdm:gdm ${D}${localstatedir}/lib/gdm
+    chmod 0750 ${D}${localstatedir}/lib/gdm
 }
 
 FILES_${PN} += "${datadir}/icon* \
@@ -72,23 +75,13 @@ SYSTEMD_SERVICE_${PN} = "gdm.service"
 INITSCRIPT_NAME = "gdm"
 INITSCRIPT_PARAMS = "start 99 5 2 . stop 20 0 1 6 ."
 
-pkg_postinst_${PN} () {
-    # can't do this offline
-    if [ "x$D" != "x" ]; then
-        exit 1
-    fi
-    grep "^gdm:" /etc/group > /dev/null || addgroup gdm
-    grep "^gdm:" /etc/passwd > /dev/null || adduser --disabled-password --system --home /var/lib/gdm gdm --ingroup gdm -g gdm
-
-if [ -d /var/lib/gdm ]; then
-    chown -R gdm:gdm /var/lib/gdm
-    chmod 0750 /var/lib/gdm
-fi
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --no-create-home --home ${localstatedir}/lib/gdm --user-group gdm"
 
+pkg_postinst_${PN} () {
 # Register up as default dm
-mkdir -p ${sysconfdir}/X11/
-echo "${bindir}/gdm" > ${sysconfdir}/X11/default-display-manager
-
+mkdir -p $D${sysconfdir}/X11/
+echo "${bindir}/gdm" > $D${sysconfdir}/X11/default-display-manager
 }
 
 pkg_postrm_${PN} () {
-- 
1.7.4.4



