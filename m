Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id E4F277FA89
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 23:36:02 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id g24so7545930wmh.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 16:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=z5e+7XGg/DjmwtXViVHZIOI5+VccF3gO19m549J/6dc=;
	b=kF8xoc2Nh2JguB2ZlWZx5YUhIxMKA01vJxOJRVhZP87kQEle5UhMtGF/r4v3OYvc8i
	z5+vTYEikp87wbY6a/0bzGv+M6GdS8rn6ZtOzP+dRcA8UhIlyfHpmH8jf74EK5yXaXzU
	gI3ltMHdiig+HS72UJlK+we3vR+t1M5EN5YSOrDgdzQarH1tY+YBY+GVP2gKQPQpUox8
	+/UAHwOuqXgOohavbYMBJSDCd+7C3BsRFe0g9cUU722Y7rL9X1F1sWKM6dSskjpIjtgK
	UYpWAovP4FEO+0wlgWfuhclu/XLfan/yNqTNiyw1TI6BsQyg4Fohp6SBR9Gn8x1GxPQ/
	zKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=z5e+7XGg/DjmwtXViVHZIOI5+VccF3gO19m549J/6dc=;
	b=DUt10cxSB15ukmBqDs3EYM64mLU7nnQQlkAZD9G6lv0COQu+Og0OoVzfnMou/JCXOQ
	oXJh/08cQB2zPKsvbC/+6YgLmEtcz6KJkDYKCqfvdEQ4gdLixQGbdYDcEj4/OQOlaxUb
	N8zzFpL1apQpVL6YO6ktAWh6wGoZuHE74RMWPZ+UY+/pIiP3dKDfHxUhHEZsMAiIK0VL
	c7rqXunbjrWbKlOtiaXASkr5rEJNpkfHFa78Fpsde/iPMZ1LTerFrgBqOlKrROlZNsZY
	SqqnNVXxRUiyR6y+WCUG45sZzJ73BcZ8uJC24/ny0EaR9fb1vwki2Nn6tma1k86qP1vT
	dQjA==
X-Gm-Message-State: APjAAAXo38+doIDlLhSInzqCBbkoizlfptaCHD93MxkPsbIbl4fJDJ7H
	4CqpJok1JfIHyjBAAtOvdob6Sdmj
X-Google-Smtp-Source: APXvYqy9QVNbsXXVMWMM+donjzfk2kyvcMkAPBArhPxTa38DTDYfrrkPfwh1Edons1rLK3d7yKDHnw==
X-Received: by 2002:a1c:3c43:: with SMTP id j64mr11525287wma.13.1572219363438; 
	Sun, 27 Oct 2019 16:36:03 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F320614DE89D4DE1A96B15C.dip0.t-ipconnect.de.
	[2003:f0:7f32:614:de89:d4de:1a96:b15c])
	by smtp.gmail.com with ESMTPSA id a17sm8699929wmb.8.2019.10.27.16.36.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 16:36:02 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 00:35:31 +0100
Message-Id: <20191027233545.4146-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191027233545.4146-1-schnitzeltony@gmail.com>
References: <20191027233545.4146-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/19] gnome-help.bbclass: Handle gnome-help files with new distro feature 'helpfiles'
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
X-List-Received-Date: Sun, 27 Oct 2019 23:36:03 -0000
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
 1 file changed, 69 insertions(+)
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
-- 
2.21.0


