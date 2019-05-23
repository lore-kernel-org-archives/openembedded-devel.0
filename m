Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9D7E57E405
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:13 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 7so4506991wmo.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=PX+AUri3Zonwm5FVer3Oq4pgPDvo3jZGe+aSgJCjOkI=;
	b=EN0694u+vRqZe489Dm6sg5S1W1rep5/PUBZwcDJ+QpCYtx46SOO6fge0Wl2l9nazV1
	8SmfLZx8ivKaa6q6FK4gMVzEWOYuJIiWA+GY0ntGDobOw+fpZb9sToDtBgBryVUhVbAU
	O6TG6kS7rG473WvrEGqNnisWz69jLYlI8EWt1OTB7G6Hb5SyZuIzhFnIoOohiaVlR8Uf
	rN8PIYbCB/zEAKSU5urMHAoblf+kUe6ZM+kvsqpDlbbUHeFN0EIV7LwzUnzcUvbKZ3NE
	isZ+argXVSnXSZcNPLCoicCxwyMsyBEdk2vsnnErWQ4k6tPnfWZdIAsF0TYtXPtIpgTK
	67gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PX+AUri3Zonwm5FVer3Oq4pgPDvo3jZGe+aSgJCjOkI=;
	b=VxraalE7sv1Iz9DMRrSmNuG2K6t/4B003y7UnmX2eHRrOt16ItXNwAqAPIWcNwBY7c
	+eLd+HnJmsuswgxkIl3EuW9xGWQa0g0rJUO4WRa1x+3zPZrComr6UWvsjUyytkxYME0b
	WnSV8Fp9LaJvtwU7taQTBBnqeUCk4XwMdMXuIK83tLgya441/wIYnyI3qjxDSp2XsWpV
	xeA88T4O8s2abvasS7ruRPvowQhg59EJjKhid365nPM2nszw9qZs0InqYsipkP7Lfoi2
	SanbBKJ/KiOQCCOOueGKL3DYOKDQGDV8LBS4wN77yd+h0BjQ4SmfHIOLDyRCoyuIkrln
	Ui4Q==
X-Gm-Message-State: APjAAAW18ULFR2SN2+jcR58/YlGxn+yjMyDz4j6ewXIFSgqtDFy5jUbn
	M1cEso42KyEX7/8+tnpUSuBaSL4955g=
X-Google-Smtp-Source: APXvYqyQ+s0GXfs1D83BUYga+m9cqM7RwGOaMCdyO3aBA9bMZ47w/dllMezc6kF1oecwyGXHjq6l/g==
X-Received: by 2002:a1c:e3d7:: with SMTP id a206mr10491356wmh.7.1558594154053; 
	Wed, 22 May 2019 23:49:14 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:25 +0200
Message-Id: <20190523064859.24336-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/41] gnome-help.bbclass: Handle gnome-help files with new distro feature 'helpfiles'
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 May 2019 06:49:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Gnome help file generation cannot be configured so handle files properly

* Add a new distro feature 'helpfiles':
   If set: split help file into ${PN}-help-*
   If not set: delete help files on installation
* Append ${PN}-help-.* to PACKAGES_DYNAMIC

Once accepted / applied it takes a on-line patch to add help files based on
IMAGE_LINGUAS.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/classes/gnome-help.bbclass | 71 +++++++++++++++++++++++++++
 meta-gnome/conf/layer.conf            |  3 ++
 2 files changed, 74 insertions(+)
 create mode 100644 meta-gnome/classes/gnome-help.bbclass

diff --git a/meta-gnome/classes/gnome-help.bbclass b/meta-gnome/classes/gnome-help.bbclass
new file mode 100644
index 000000000..3d45465fc
--- /dev/null
+++ b/meta-gnome/classes/gnome-help.bbclass
@@ -0,0 +1,71 @@
+# Class to pack or delete gnome help files
+# For 'helpfiles' not in DISTRO_FEATURES: delete help files
+# else pack help files in ${PN}-help-<lingua>
+
+# default location
+GNOME_HELP_FILES ??= "${datadir}/help"
+
+FILES_${PN}-help = "${datadir}/*/translations"
+
+HELPBASEPN ??= "${PN}"
+
+# Dummy to get yelp build
+PACKAGES_append = " ${HELPBASEPN}-help"
+RRECOMMENDS_${HELPBASEPN}-help = "${@bb.utils.contains('DISTRO_FEATURES','helpfiles','yelp','',d)}"
+
+do_install_append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES','helpfiles','false','true',d)}; then
+        rm -rf ${D}${datadir}/help*
+    fi
+}
+
+python gnome_do_split_help() {
+    if bb.utils.contains('DISTRO_FEATURES', 'helpfiles', False, True, d):
+        return
+
+    if (d.getVar('PACKAGE_NO_LOCALE') == '1'):
+        bb.debug(1, "package requested not splitting locales")
+        return
+
+    packages = (d.getVar('PACKAGES') or "").split()
+
+    datadir = d.getVar('datadir')
+    if not datadir:
+        bb.note("datadir not defined")
+        return
+
+    dvar = d.getVar('PKGD')
+    pn = d.getVar('HELPBASEPN')
+
+    if pn + '-help' in packages:
+        packages.remove(pn + '-help')
+
+    helpdir = os.path.join(dvar + datadir, 'help')
+
+    if not cpath.isdir(helpdir):
+        bb.debug(1, "No help files in this package")
+        return
+
+    helps = os.listdir(helpdir)
+
+    summary = d.getVar('SUMMARY') or pn
+    description = d.getVar('DESCRIPTION') or ""
+    locale_section = d.getVar('LOCALE_SECTION')
+    mlprefix = d.getVar('MLPREFIX') or ""
+    for l in sorted(helps):
+        ln = legitimize_package_name(l)
+        pkg = pn + '-help-' + ln
+        packages.append(pkg)
+        d.setVar('FILES_' + pkg, os.path.join(datadir, 'help', l))
+        d.setVar('RRECOMMENDS_' + pkg, '%syelp' % mlprefix)
+        d.setVar('SUMMARY_' + pkg, '%s - %s help' % (summary, l))
+        d.setVar('DESCRIPTION_' + pkg, '%s  This package contains language help files for the %s locale.' % (description, l))
+        if locale_section:
+            d.setVar('SECTION_' + pkg, locale_section)
+
+    d.setVar('PACKAGES', ' '.join(packages))
+
+}
+
+PACKAGESPLITFUNCS_prepend = "gnome_do_split_help "
+
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 0b68232de..75e8d3225 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -19,3 +19,6 @@ LAYERSERIES_COMPAT_gnome-layer = "thud warrior"
 # Sanity check for meta-gnome layer.
 # Setting SKIP_META_GNOME_SANITY_CHECK to "1" would skip the bbappend files check.
 INHERIT += "sanity-meta-gnome"
+
+# Help files
+PACKAGES_DYNAMIC_append = " ^${PN}-help-.*"
-- 
2.20.1


