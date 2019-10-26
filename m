Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9668F7FC3B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 09:34:19 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 6so5936164wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 02:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=fPX3IDJ0B0w1KMxo0trqTePe27zB0Qd+Q4+iw5WjMYw=;
	b=pzvPUNd2SwwyS99z62gCdRHLh5Ktg1LcK22b4pyJJ5VBJKXeTNthC/PCKkbJkm+0Hf
	WsLCj4Vfu78oCyZFbheOskNcWlZwzBuFumD2QWO3IWIL7M2EkOJAsqfR9sC9vMM0id91
	+BsI/j3qGsqbJ0/tMqZkOanC1IgDY4FCuLKHetThb8/IXvlJHiaAEOHEBqDlVNDno0sd
	3T1OO+KDPVf2nP6EFknCAcu+BO77GQxL/Y4F5BtKoBb5ZVfwhQ0joQL5xLNu2tT72ldV
	a76BodE/8nF7g9HIY8sqof+ClOSNgnlQFwCMgaznrgeeoY06baanOTpg+bzPV+d+Ic7G
	zxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fPX3IDJ0B0w1KMxo0trqTePe27zB0Qd+Q4+iw5WjMYw=;
	b=AuQfyOc/fRLNRODX4CZptuC/d2bqO12ohNPzCQBQg6RskjDvkYA7LRe296ZbppC2mC
	gi4cR3xADmOsZtGCJ9M0qlcjncR6xUkPzQStNkxpu6hI81CoHhs/KgNZVKOGChf3/uN4
	QfPnEylI9ha5rh67o1bvJx79zQ0FnSneWSS2rcFbwfX7l/6SGWGf3+EOvTZnPUuKK8Gm
	LKqfk/9paHKJE5OYglN+LdR7yWzM7XkMtIoGFI7tDnHts7JKHD2HF4N+Re3Oj4Kn/XRh
	sPRglhSwWFR1w1x8uGiO3kY0p7/IOp8iDTGcBQBth5DrRimdpntE18m4Pb5X8xhubRqn
	KFMw==
X-Gm-Message-State: APjAAAWn56ejsrUzYLcaYES2OuqXTtWBegLgddUV3b+SUA9ndZGH1MIY
	BDXfqlmgrXAgLJ6vdG6ux48Tc0JW
X-Google-Smtp-Source: APXvYqxAJ9Rzhhgyn6zjIRpSOlXKqt//UZMJmKTFT/kWj2l+S681S5OTzA17J46MY/2L6tyHTSBZuw==
X-Received: by 2002:a1c:5641:: with SMTP id k62mr7245438wmb.97.1572082460078; 
	Sat, 26 Oct 2019 02:34:20 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F3206021D85A12E97BB69DE.dip0.t-ipconnect.de.
	[2003:f0:7f32:602:1d85:a12e:97bb:69de])
	by smtp.gmail.com with ESMTPSA id
	w15sm6281482wro.65.2019.10.26.02.34.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 26 Oct 2019 02:34:18 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Oct 2019 11:34:03 +0200
Message-Id: <20191026093404.19659-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191026093404.19659-1-schnitzeltony@gmail.com>
References: <20191026093404.19659-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] gnome-help.bbclass: Handle gnome-help files with new distro feature 'helpfiles'
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
X-List-Received-Date: Sat, 26 Oct 2019 09:34:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that we can build gnome help files, let our users decide what to do with
them:

if 'helpfiles' not in DISTRO_FEATURES
    delete all help contents during install
else
  if PACKAGE_NO_HELP_SPLIT == 1
      pack all help files to ${PN}-help
  else
      pack help files to ${PN}-help-<lingua>

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/classes/gnome-help.bbclass | 69 +++++++++++++++++++++++++++
 meta-gnome/conf/layer.conf            |  3 ++
 2 files changed, 72 insertions(+)
 create mode 100644 meta-gnome/classes/gnome-help.bbclass

diff --git a/meta-gnome/classes/gnome-help.bbclass b/meta-gnome/classes/gnome-help.bbclass
new file mode 100644
index 000000000..967091ba4
--- /dev/null
+++ b/meta-gnome/classes/gnome-help.bbclass
@@ -0,0 +1,69 @@
+# Class to pack gnome help files or delete them during install
+# There are the following cases:
+#
+# if 'helpfiles' not in DISTRO_FEATURES
+#     delete all help contants during install
+# else
+#   if PACKAGE_NO_HELP_SPLIT == 1
+#       pack all help files to ${PN}-help
+#   else
+#       pack all help files to ${PN}-help-<lingua>
+
+FILES_${PN}-help = "${datadir}/*/translations"
+
+# Dummy to get yelp build & PACKAGE_NO_HELP_SPLIT set 1
+PACKAGES_append = " ${PN}-help"
+FILES_${PN}-help = "${datadir}/help"
+RRECOMMENDS_${PN}-help = "${@bb.utils.contains('DISTRO_FEATURES','helpfiles','yelp','',d)}"
+
+do_install_append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES','helpfiles','false','true',d)}; then
+        rm -rf ${D}${datadir}/help/*
+    fi
+}
+
+python gnome_do_split_help() {
+    if bb.utils.contains('DISTRO_FEATURES', 'helpfiles', False, True, d):
+        return
+
+    if (d.getVar('PACKAGE_NO_HELP_SPLIT') == '1'):
+        # all help files go to ${
+        bb.debug(1, "package requested not splitting help-files")
+        return
+
+    packages = (d.getVar('PACKAGES') or "").split()
+    datadir = d.getVar('datadir')
+    dvar = d.getVar('PKGD')
+    pn = d.getVar('PN')
+
+    if pn + '-help' in packages:
+        packages.remove(pn + '-help')
+
+    helpdir = os.path.join(dvar + datadir, 'help')
+
+    if not cpath.isdir(helpdir):
+        bb.warn("No help files in this package - remove gnome-help from inherit?")
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
+}
+
+PACKAGESPLITFUNCS_prepend = "gnome_do_split_help "
+
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 862d622ee..c4d4574bc 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -15,3 +15,6 @@ LAYERVERSION_gnome-layer = "1"
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
 
 LAYERSERIES_COMPAT_gnome-layer = "thud warrior zeus"
+
+# GNOME Help files
+PACKAGES_DYNAMIC_append = " ^${PN}-help-.*"
-- 
2.21.0


