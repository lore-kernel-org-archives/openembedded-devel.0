Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 64FE776719
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2015 19:46:45 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so59410513wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2015 12:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=h9wp3AaTMwyvjyfTe9zl5stq/+Q+Up3I1Zj+nKCM8RQ=;
	b=Fl9NSTg61YYg8awDgjQiDxssPjkL1mX3DrxRvgXoIzWsp8J1Fx+YXAun5gI/fwaiEK
	1xuGvVly8fXO3Katyb5b1NErgtASsNh86lwjYX8GlGYyVT/0lPURzv9MFXJA6ZiVqCwF
	9ZUXZ0RgcuO7/hG6M8xslbhi2Y+80BDUhP85PSUzBAzJu9Icp0qZV61vqrF4uF5PbL49
	BfYsExWcfKSIFY5W27RHuUhkiPvsaNgiBuMwskD1Cl9pEtl9Ax9Gi+XX0D1qHrkpUdyy
	nPR/avGwC8N4pXK8UBQhaTQvbdv1HW0YsFtNU7z5dyAlg4VBtJTl56sYaFDCvqu2GG3f
	PdEA==
X-Received: by 10.194.103.130 with SMTP id fw2mr22245908wjb.121.1439754405524; 
	Sun, 16 Aug 2015 12:46:45 -0700 (PDT)
Received: from Saturn.local.all (212-41-85-106.adsl.solnet.ch. [212.41.85.106])
	by smtp.gmail.com with ESMTPSA id
	p1sm18490730wjq.28.2015.08.16.12.46.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Aug 2015 12:46:45 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Aug 2015 21:40:22 +0200
Message-Id: <1439754023-13290-8-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1439754023-13290-1-git-send-email-max.oss.09@gmail.com>
References: <1439754023-13290-1-git-send-email-max.oss.09@gmail.com>
Cc: gary@mlbassoc.com
Subject: [meta-browser][PATCH 7/8] firefox: Update to 10.0.12esr
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Aug 2015 19:46:45 -0000

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 recipes-mozilla/firefox/firefox_10.0.11esr.bb | 156 --------------------------
 recipes-mozilla/firefox/firefox_10.0.12esr.bb | 156 ++++++++++++++++++++++++++
 2 files changed, 156 insertions(+), 156 deletions(-)
 delete mode 100644 recipes-mozilla/firefox/firefox_10.0.11esr.bb
 create mode 100644 recipes-mozilla/firefox/firefox_10.0.12esr.bb

diff --git a/recipes-mozilla/firefox/firefox_10.0.11esr.bb b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
deleted file mode 100644
index 94bd4be..0000000
--- a/recipes-mozilla/firefox/firefox_10.0.11esr.bb
+++ /dev/null
@@ -1,156 +0,0 @@
-# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-DESCRIPTION ?= "Browser made by mozilla"
-DEPENDS += "alsa-lib curl startup-notification libevent cairo libnotify libvpx virtual/libgl nss nspr"
-
-LICENSE = "MPLv1 | GPLv2+ | LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://toolkit/content/license.html;endline=39;md5=9cb02f27e77e702043b827c9418bfbf8"
-
-SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}/source/firefox-${PV}.source.tar.bz2;name=archive \
-           file://mozilla-firefox.png \
-           file://mozilla-firefox.desktop \
-           file://fixes/Allow-.js-preference-files-to-set-locked-prefs-with-.patch \
-           file://fixes/Avoid-spurious-Run-items-in-application-handlers-con.patch \
-           file://fixes/Properly-launch-applications-set-in-HOME-.mailcap.patch \
-           file://fixes/Fix-some-tests-using-CurProcD-where-GreD-should-be-u.patch \
-           file://fixes/Bug-691898-Use-YARR-interpreter-instead-of-PCRE-on-p.patch \
-           file://fixes/Bug-722127-Bump-required-libvpx-version-to-1.0.0.-r-.patch \
-           file://fixes/Bug-728229-Allow-to-build-with-system-python-ply-lib.patch \
-           file://fixes/Bug-720682-Don-t-crash-an-app-using-libxul-because-o.patch \
-           file://fixes/Bug-696636-Block-OpenGL-1-drivers-explicitly-to-stee.patch \
-           file://fixes/Load-dependent-libraries-with-their-real-path-to-avo.patch \
-           file://fixes/Bug-515232-Try-getting-general.useragent.locale-as-a.patch \
-           file://fixes/Bug-729817-Block-the-Nouveau-3D-driver-as-it-s-insta.patch \
-           file://fixes/Bug-729817-Allow-the-Nouveau-driver-with-Mesa-8.0.1-.patch \
-           file://fixes/Bug-747322-Fix-jemalloc-mmap-wrapper-for-s390x.patch \
-           file://fixes/Bug-725655-gcc-4.7-build-failures-missing-headers-.-.patch \
-           file://fixes/Bug-734490-fix-build-failures-with-Clang-and-GCC-4.7.patch \
-           file://fixes/Bug-706724-Fix-for-error-ftruncate-was-not-declared-.patch \
-           file://fixes/Bug-709259-Try-creating-a-named-cursor-before-a-bitm.patch \
-           file://fixes/Bug-761082-Only-export-TabMessageUtils.h-in-mozilla-.patch \
-           file://fixes/bug-693343-a11y-disabled-in-Gnome-3-when-GNOME_ACCES.patch \
-           file://fixes/Allow-webGL-with-mesa-assuming-users-will-have-updat.patch \
-           file://iceweasel-branding/Use-MOZ_APP_DISPLAYNAME-to-fill-appstrings.propertie.patch \
-           file://iceweasel-branding/Determine-which-phishing-shavar-to-use-depending-on-.patch \
-           file://porting/Add-xptcall-support-for-SH4-processors.patch \
-           file://porting/Allow-ipc-code-to-build-on-GNU-kfreebsd.patch \
-           file://porting/Allow-ipc-code-to-build-on-GNU-Hurd.patch \
-           file://porting/Bug-698923-Don-t-require-16-bytes-alignment-for-VMFr.patch \
-           file://porting/Fix-GNU-non-Linux-failure-to-build-because-of-ipc-ch.patch \
-           file://porting/Bug-703531-Fix-ARMAssembler-getOp2RegScale-on-ARMv5.patch \
-           file://porting/Bug-703534-Fix-build-failure-on-platforms-without-YA.patch \
-           file://porting/Bug-703842-Avoid-R_SPARC_WDISP22-relocation-in-Tramp.patch \
-           file://porting/Bug-703833-Avoid-invalid-conversion-from-const-size_.patch \
-           file://porting/Bug-711353-Add-support-for-GNU-kFreeBSD-and-GNU-Hurd.patch \
-           file://porting/Bug-747870-Properly-align-XPCLazyCallContext-mData.-.patch \
-           file://porting/Bug-706787-Crash-on-s390x-nsXPCComponents-AttachNewC.patch \
-           file://prefs/Remove-general.useragent.locale-prefs-from-firefox-..patch \
-           file://prefs/Enable-intl.locale.matchOS-and-report-the-locale-cor.patch \
-           file://prefs/Set-javascript.options.showInConsole.patch \
-           file://prefs/Set-DPI-to-system-settings.patch \
-           file://prefs/Don-t-auto-disable-extensions-in-system-directories.patch \
-           file://debian-hacks/Check-less-things-during-configure-when-using-libxul.patch \
-           file://debian-hacks/Avoid-wrong-sessionstore-data-to-keep-windows-out-of.patch \
-           file://debian-hacks/Avoid-libxpcom-being-excluded-from-linked-libraries-.patch \
-           file://debian-hacks/Don-t-build-example-component.patch \
-           file://debian-hacks/Don-t-install-system-profile.patch \
-           file://debian-hacks/Ignore-system-libjpeg-libpng-and-zlib-version-checki.patch \
-           file://debian-hacks/Add-soname-to-appropriate-libraries.patch \
-           file://debian-hacks/Add-another-preferences-directory-for-applications-p.patch \
-           file://debian-hacks/Gross-workaround-to-avoid-installing-test-idl-and-in.patch \
-           file://debian-hacks/Don-t-register-plugins-if-the-MOZILLA_DISABLE_PLUGIN.patch \
-           file://debian-hacks/Install-missing-nanojit-and-.tbl-headers-from-js-src.patch \
-           file://debian-hacks/Use-a-variable-for-xulrunner-base-version-in-various.patch \
-           file://debian-hacks/Install-js-shell-when-running-make-install-from-js-s.patch \
-           file://debian-hacks/Don-t-error-out-when-run-time-libsqlite-is-older-tha.patch \
-           file://debian-hacks/Do-build-time-detection-of-2-bytes-wchar_t-and-char1.patch \
-           file://debian-hacks/pkg-config-files-don-t-need-to-require-the-version-o.patch \
-           file://debian-hacks/Add-a-2-minutes-timeout-on-xpcshell-tests.patch \
-           file://debian-hacks/Fix-tracejit-to-build-against-nanojit-headers-in-dis.patch \
-           file://debian-hacks/Load-distribution-search-plugins-from-etc-appname-se.patch \
-           file://debian-hacks/Handle-transition-to-etc-appname-searchplugins-more-.patch \
-           file://debian-hacks/Bug-508942-Use-Preprocessor.py-filters-in-defines-an.patch \
-           file://configure.patch \
-           file://powerpc_va_list.patch \
-           file://freetype-2.5.patch \
-           file://x86_64-fix.patch \
-           file://vendor.js \
-           file://alignment.patch \
-           file://Prevent-SIGILL-crashes-on-ARMv6-builds-built-with-the-NDK_10.0esr.patch"
-
-SRC_URI[archive.md5sum] = "2f0e3a1dd7480e03f374c0121b4155e2"
-SRC_URI[archive.sha256sum] = "94b4d5a339d97dc56fd349f93407c3af4f408a4a8409a64e3680d564d37594f8"
-
-S = "${WORKDIR}/mozilla-esr10"
-
-inherit mozilla
-
-EXTRA_OEMAKE = "installdir=${libdir}/${PN}"
-
-ARM_INSTRUCTION_SET = "arm"
-
-do_install() {
-	oe_runmake -C "${MOZ_OBJDIR}" DESTDIR="${D}" destdir="${D}" install
-	install -d ${D}${datadir}/applications
-	install -d ${D}${datadir}/pixmaps
-	install -m 0644 ${WORKDIR}/mozilla-firefox.desktop ${D}${datadir}/applications/
-	install -m 0644 ${WORKDIR}/mozilla-firefox.png ${D}${datadir}/pixmaps/
-	install -m 0644 ${WORKDIR}/vendor.js ${D}${libdir}/${PN}/defaults/pref/
-	rm -f ${D}${libdir}/${PN}/TestGtkEmbed
-	rm -f ${D}${libdir}/${PN}/defaults/pref/firefox-l10n.js
-
-	# use locale settings
-	grep -Rl intl.locale.matchOS ${D}${libdir}/${PN}/ \
-	   | grep '.js$' \
-	   | xargs sed -i 's/\(pref("intl.locale.matchOS",\s*\)false)/\1true)/g'
-
-	# disable application updating
-	grep -Rl app.update.enabled ${D}${libdir}/${PN}/ \
-	   | grep '.js$' \
-	   | xargs sed -i 's/\(pref("app.update.enabled",\s*\)true)/\1false)/g'
-}
-
-PACKAGES += "${PN}-inspector"
-
-FILES_${PN}-inspector = "${libdir}/${PN}/chrome/inspector* \
-                         ${libdir}/${PN}/components/*nspector* \
-                         ${libdir}/${PN}/extensions/inspector* \
-                         ${libdir}/${PN}/defaults/preferences/inspector*"
-FILES_${PN} = "${bindir}/${PN} \
-               ${datadir}/applications/ \
-               ${datadir}/pixmaps/ \
-               ${libdir}/${PN}/* \
-               ${libdir}/${PN}/.autoreg \
-               ${bindir}/defaults"
-FILES_${PN}-dev += "${datadir}/idl ${bindir}/${PN}-config ${libdir}/${PN}-devel-*"
-FILES_${PN}-staticdev += "${libdir}/${PN}-devel-*/sdk/lib/*.a"
-FILES_${PN}-dbg += "${libdir}/${PN}/.debug \
-                    ${libdir}/${PN}/*/.debug \
-                    ${libdir}/${PN}/*/*/.debug \
-                    ${libdir}/${PN}/*/*/*/.debug \
-                    ${libdir}/${PN}-devel-*/*/.debug \
-                    ${libdir}/${PN}-devel-*/*/*/.debug \
-                    ${libdir}/${PN}-devel-*/*/*/*/.debug \
-                    ${bindir}/.debug"
-
-# We don't build XUL as system shared lib, so we can mark all libs as private
-PRIVATE_LIBS = "libmozjs.so \
-                libxpcom.so \
-                libnspr4.so \
-                libxul.so \
-                libmozalloc.so \
-                libplc4.so \
-                libplds4.so"
-
-# mark libraries also provided by nss as private too
-PRIVATE_LIBS += " \
-    libfreebl3.so \
-    libnss3.so \
-    libnssckbi.so \
-    libsmime3.so \
-    libnssutil3.so \
-    libnssdbm3.so \
-    libssl3.so \
-    libsoftokn3.so \
-"
diff --git a/recipes-mozilla/firefox/firefox_10.0.12esr.bb b/recipes-mozilla/firefox/firefox_10.0.12esr.bb
new file mode 100644
index 0000000..8bd9ca4
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox_10.0.12esr.bb
@@ -0,0 +1,156 @@
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+DESCRIPTION ?= "Browser made by mozilla"
+DEPENDS += "alsa-lib curl startup-notification libevent cairo libnotify libvpx virtual/libgl nss nspr"
+
+LICENSE = "MPLv1 | GPLv2+ | LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://toolkit/content/license.html;endline=39;md5=9cb02f27e77e702043b827c9418bfbf8"
+
+SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}/source/firefox-${PV}.source.tar.bz2;name=archive \
+           file://mozilla-firefox.png \
+           file://mozilla-firefox.desktop \
+           file://fixes/Allow-.js-preference-files-to-set-locked-prefs-with-.patch \
+           file://fixes/Avoid-spurious-Run-items-in-application-handlers-con.patch \
+           file://fixes/Properly-launch-applications-set-in-HOME-.mailcap.patch \
+           file://fixes/Fix-some-tests-using-CurProcD-where-GreD-should-be-u.patch \
+           file://fixes/Bug-691898-Use-YARR-interpreter-instead-of-PCRE-on-p.patch \
+           file://fixes/Bug-722127-Bump-required-libvpx-version-to-1.0.0.-r-.patch \
+           file://fixes/Bug-728229-Allow-to-build-with-system-python-ply-lib.patch \
+           file://fixes/Bug-720682-Don-t-crash-an-app-using-libxul-because-o.patch \
+           file://fixes/Bug-696636-Block-OpenGL-1-drivers-explicitly-to-stee.patch \
+           file://fixes/Load-dependent-libraries-with-their-real-path-to-avo.patch \
+           file://fixes/Bug-515232-Try-getting-general.useragent.locale-as-a.patch \
+           file://fixes/Bug-729817-Block-the-Nouveau-3D-driver-as-it-s-insta.patch \
+           file://fixes/Bug-729817-Allow-the-Nouveau-driver-with-Mesa-8.0.1-.patch \
+           file://fixes/Bug-747322-Fix-jemalloc-mmap-wrapper-for-s390x.patch \
+           file://fixes/Bug-725655-gcc-4.7-build-failures-missing-headers-.-.patch \
+           file://fixes/Bug-734490-fix-build-failures-with-Clang-and-GCC-4.7.patch \
+           file://fixes/Bug-706724-Fix-for-error-ftruncate-was-not-declared-.patch \
+           file://fixes/Bug-709259-Try-creating-a-named-cursor-before-a-bitm.patch \
+           file://fixes/Bug-761082-Only-export-TabMessageUtils.h-in-mozilla-.patch \
+           file://fixes/bug-693343-a11y-disabled-in-Gnome-3-when-GNOME_ACCES.patch \
+           file://fixes/Allow-webGL-with-mesa-assuming-users-will-have-updat.patch \
+           file://iceweasel-branding/Use-MOZ_APP_DISPLAYNAME-to-fill-appstrings.propertie.patch \
+           file://iceweasel-branding/Determine-which-phishing-shavar-to-use-depending-on-.patch \
+           file://porting/Add-xptcall-support-for-SH4-processors.patch \
+           file://porting/Allow-ipc-code-to-build-on-GNU-kfreebsd.patch \
+           file://porting/Allow-ipc-code-to-build-on-GNU-Hurd.patch \
+           file://porting/Bug-698923-Don-t-require-16-bytes-alignment-for-VMFr.patch \
+           file://porting/Fix-GNU-non-Linux-failure-to-build-because-of-ipc-ch.patch \
+           file://porting/Bug-703531-Fix-ARMAssembler-getOp2RegScale-on-ARMv5.patch \
+           file://porting/Bug-703534-Fix-build-failure-on-platforms-without-YA.patch \
+           file://porting/Bug-703842-Avoid-R_SPARC_WDISP22-relocation-in-Tramp.patch \
+           file://porting/Bug-703833-Avoid-invalid-conversion-from-const-size_.patch \
+           file://porting/Bug-711353-Add-support-for-GNU-kFreeBSD-and-GNU-Hurd.patch \
+           file://porting/Bug-747870-Properly-align-XPCLazyCallContext-mData.-.patch \
+           file://porting/Bug-706787-Crash-on-s390x-nsXPCComponents-AttachNewC.patch \
+           file://prefs/Remove-general.useragent.locale-prefs-from-firefox-..patch \
+           file://prefs/Enable-intl.locale.matchOS-and-report-the-locale-cor.patch \
+           file://prefs/Set-javascript.options.showInConsole.patch \
+           file://prefs/Set-DPI-to-system-settings.patch \
+           file://prefs/Don-t-auto-disable-extensions-in-system-directories.patch \
+           file://debian-hacks/Check-less-things-during-configure-when-using-libxul.patch \
+           file://debian-hacks/Avoid-wrong-sessionstore-data-to-keep-windows-out-of.patch \
+           file://debian-hacks/Avoid-libxpcom-being-excluded-from-linked-libraries-.patch \
+           file://debian-hacks/Don-t-build-example-component.patch \
+           file://debian-hacks/Don-t-install-system-profile.patch \
+           file://debian-hacks/Ignore-system-libjpeg-libpng-and-zlib-version-checki.patch \
+           file://debian-hacks/Add-soname-to-appropriate-libraries.patch \
+           file://debian-hacks/Add-another-preferences-directory-for-applications-p.patch \
+           file://debian-hacks/Gross-workaround-to-avoid-installing-test-idl-and-in.patch \
+           file://debian-hacks/Don-t-register-plugins-if-the-MOZILLA_DISABLE_PLUGIN.patch \
+           file://debian-hacks/Install-missing-nanojit-and-.tbl-headers-from-js-src.patch \
+           file://debian-hacks/Use-a-variable-for-xulrunner-base-version-in-various.patch \
+           file://debian-hacks/Install-js-shell-when-running-make-install-from-js-s.patch \
+           file://debian-hacks/Don-t-error-out-when-run-time-libsqlite-is-older-tha.patch \
+           file://debian-hacks/Do-build-time-detection-of-2-bytes-wchar_t-and-char1.patch \
+           file://debian-hacks/pkg-config-files-don-t-need-to-require-the-version-o.patch \
+           file://debian-hacks/Add-a-2-minutes-timeout-on-xpcshell-tests.patch \
+           file://debian-hacks/Fix-tracejit-to-build-against-nanojit-headers-in-dis.patch \
+           file://debian-hacks/Load-distribution-search-plugins-from-etc-appname-se.patch \
+           file://debian-hacks/Handle-transition-to-etc-appname-searchplugins-more-.patch \
+           file://debian-hacks/Bug-508942-Use-Preprocessor.py-filters-in-defines-an.patch \
+           file://configure.patch \
+           file://powerpc_va_list.patch \
+           file://freetype-2.5.patch \
+           file://x86_64-fix.patch \
+           file://vendor.js \
+           file://alignment.patch \
+           file://Prevent-SIGILL-crashes-on-ARMv6-builds-built-with-the-NDK_10.0esr.patch"
+
+SRC_URI[archive.md5sum] = "ea6a9d240c271341eba014467b97e8ad"
+SRC_URI[archive.sha256sum] = "9f12cb7fd18fc51e995cd67b70a090f32fcd8dcf636be1b840281f2612d9db40"
+
+S = "${WORKDIR}/mozilla-esr10"
+
+inherit mozilla
+
+EXTRA_OEMAKE = "installdir=${libdir}/${PN}"
+
+ARM_INSTRUCTION_SET = "arm"
+
+do_install() {
+	oe_runmake -C "${MOZ_OBJDIR}" DESTDIR="${D}" destdir="${D}" install
+	install -d ${D}${datadir}/applications
+	install -d ${D}${datadir}/pixmaps
+	install -m 0644 ${WORKDIR}/mozilla-firefox.desktop ${D}${datadir}/applications/
+	install -m 0644 ${WORKDIR}/mozilla-firefox.png ${D}${datadir}/pixmaps/
+	install -m 0644 ${WORKDIR}/vendor.js ${D}${libdir}/${PN}/defaults/pref/
+	rm -f ${D}${libdir}/${PN}/TestGtkEmbed
+	rm -f ${D}${libdir}/${PN}/defaults/pref/firefox-l10n.js
+
+	# use locale settings
+	grep -Rl intl.locale.matchOS ${D}${libdir}/${PN}/ \
+	   | grep '.js$' \
+	   | xargs sed -i 's/\(pref("intl.locale.matchOS",\s*\)false)/\1true)/g'
+
+	# disable application updating
+	grep -Rl app.update.enabled ${D}${libdir}/${PN}/ \
+	   | grep '.js$' \
+	   | xargs sed -i 's/\(pref("app.update.enabled",\s*\)true)/\1false)/g'
+}
+
+PACKAGES += "${PN}-inspector"
+
+FILES_${PN}-inspector = "${libdir}/${PN}/chrome/inspector* \
+                         ${libdir}/${PN}/components/*nspector* \
+                         ${libdir}/${PN}/extensions/inspector* \
+                         ${libdir}/${PN}/defaults/preferences/inspector*"
+FILES_${PN} = "${bindir}/${PN} \
+               ${datadir}/applications/ \
+               ${datadir}/pixmaps/ \
+               ${libdir}/${PN}/* \
+               ${libdir}/${PN}/.autoreg \
+               ${bindir}/defaults"
+FILES_${PN}-dev += "${datadir}/idl ${bindir}/${PN}-config ${libdir}/${PN}-devel-*"
+FILES_${PN}-staticdev += "${libdir}/${PN}-devel-*/sdk/lib/*.a"
+FILES_${PN}-dbg += "${libdir}/${PN}/.debug \
+                    ${libdir}/${PN}/*/.debug \
+                    ${libdir}/${PN}/*/*/.debug \
+                    ${libdir}/${PN}/*/*/*/.debug \
+                    ${libdir}/${PN}-devel-*/*/.debug \
+                    ${libdir}/${PN}-devel-*/*/*/.debug \
+                    ${libdir}/${PN}-devel-*/*/*/*/.debug \
+                    ${bindir}/.debug"
+
+# We don't build XUL as system shared lib, so we can mark all libs as private
+PRIVATE_LIBS = "libmozjs.so \
+                libxpcom.so \
+                libnspr4.so \
+                libxul.so \
+                libmozalloc.so \
+                libplc4.so \
+                libplds4.so"
+
+# mark libraries also provided by nss as private too
+PRIVATE_LIBS += " \
+    libfreebl3.so \
+    libnss3.so \
+    libnssckbi.so \
+    libsmime3.so \
+    libnssutil3.so \
+    libnssdbm3.so \
+    libssl3.so \
+    libsoftokn3.so \
+"
-- 
1.8.4.5


