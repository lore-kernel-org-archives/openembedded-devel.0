Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 054C9738AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Feb 2016 20:49:42 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id g62so63739572wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Feb 2016 12:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=DrRq5ZxGPfEH5iHjcJHgPSejNnP452BwJRtJdf++Tsk=;
	b=LotQyyQmF+1kk2GotUMpGIPWlRKkcntTDRdSiRBWOkmFTwITEYRwBinek9/uk/T72d
	TO/m347jzxviI9+DG557ZP3e8qyRRUNtwVj4JQkR4xaAXbXVRDv8Ru/PHyexN16I/nxu
	5wgr9iAxM3l+eoGJeY1A+2TlzSx8p5sUbeYd+xhsuk/TIYW99bu3Mb9qqPN5q1yAZKeu
	M8DIuWfKQWwH3Rgdt6fE40w5Mtzrd7bnWfQX1e9dfmDm/iw7wSmtclelH61+DnXeRz79
	aelVbrViNAOzG/V4UZ4J6JdGCj1JN+UXm+FliPaT9itbcxpOxuJD/9whAdT7yy4Uv3f1
	qgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DrRq5ZxGPfEH5iHjcJHgPSejNnP452BwJRtJdf++Tsk=;
	b=dERs7c4E3UbIA7fgiZnr0fXG2aN8HVfNPoIm/f/vfaJhhxTS0OBXsMEJrD52Bak83r
	YKd1YpYm2vkITrzKqqpp9F1NFl8zJWZBWf9WEssHJiIwmpfkTsfOZ00gJRxYVFrCIXrS
	jaq5wXd7XpG+S1qruVMnPRIyENG/rdQ+IZUep273CWlhrLHCNwe8/AyJqU6Y0AksXegA
	ZHq4WFO3VigYFVhDHHZse7Dcem4vHNAb4HTfJtHAGQoc19UTbuCWwpAp0podqVqbihVX
	/uMTbTikreezVaTaxlkc7wYxOPfKGqQEbYZIM2F49njR/HiGny7aEEB7dLY7MFu0vW1c
	i4Cw==
X-Gm-Message-State: AG10YOSCP04htDWhKjbV4SJL6SLfw8zJBOeVDAyuazHkjSXnnrSXR+sDtxd/oewpZJTM/VqF
X-Received: by 10.28.73.136 with SMTP id w130mr14397281wma.36.1454705382705;
	Fri, 05 Feb 2016 12:49:42 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id c185sm337269wma.5.2016.02.05.12.49.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 12:49:42 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Feb 2016 20:49:40 +0000
Message-Id: <1454705380-22071-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] gtk-theme-torturer: add
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
X-List-Received-Date: Fri, 05 Feb 2016 20:49:43 -0000

Add this to meta-gnome as it's being removed from oe-core.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gtk-theme-torturer/gtk-theme-torturer_git.bb   | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb

diff --git a/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb b/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb
new file mode 100644
index 0000000..b67806d
--- /dev/null
+++ b/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "GTK+ Theme benchmark program"
+DEPENDS = "gtk+"
+HOMEPAGE = "http://wiki.laptop.org/go/GTK_for_OLPC"
+SECTION = "devel"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://appwindow.c;endline=13;md5=8c09920de460c7ea1f64ee56986aabd9"
+
+SRCREV = "99962ae39bb5aadb31929b25c58e1a053f9c9545"
+PV = "0.0.0+git${SRCPV}"
+
+SRC_URI = "git://dev.laptop.org/projects/soc-gtk/"
+S = "${WORKDIR}/git/gtk-theme-torturer"
+
+CFLAGS += "-Wl,-rpath-link,${STAGING_LIBDIR}"
+
+inherit distro_features_check
+ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 torturer ${D}${bindir}
+}
+
+
-- 
2.7.0


