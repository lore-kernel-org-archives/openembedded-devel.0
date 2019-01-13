Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5EBF27C0E4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2019 10:55:13 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id y20so16426210edw.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2019 02:55:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0+fyhsKNOJm1hR7TO/TUK9D62ggQQDDqK2WnG1EAZV4=;
	b=HGjefthVWac73zcYA/J8zVqvWqSjKoS7EkZ+Vo3qlcGbTbiF5L1aXLe+gGJlkXRG9K
	QmAZXAOMZxYw4B81n8J1pPQMHHhiKVr+38xzChbb1u1lwL0YbcaqMPn4C2vR66Ypqkb9
	Jsw9yQMpdi0qDiFPhFLJpA82pSEQ/f8v/SIbnbrloOSt4ybDIb6P3E6VxlFox6/oNUvs
	3uOmbl8xs0q0IZEls3hM9ya2WZIo7e2BvO+jLpSAOHlAhb3beY2gUmDd2a12XGewEvBm
	8EGUzqD8tIS8YK26Rg/15RZ+oiiAJVe4vUyG1fu/hLBKkp7w1Ux5Bi5QccQqnoCb01ba
	mHAQ==
X-Gm-Message-State: AJcUukc/5PYqPu4icvBwgzyWXGweatlh6N+43xJlx39S7OeUaekWAVWE
	7x8tNFHo5oyiMtMhFupt6dYed9+l
X-Google-Smtp-Source: ALg8bN4gJQc4pvesxnhfw8eSWxVqJWe+1J8RRsSIm9/Uhfl7O0ZUpW+msrj+bp7nAr7F1xqNYA4zhQ==
X-Received: by 2002:a17:906:94c3:: with SMTP id
	d3-v6mr16923672ejy.104.1547376913488; 
	Sun, 13 Jan 2019 02:55:13 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	e35sm3584871eda.13.2019.01.13.02.55.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 13 Jan 2019 02:55:12 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Jan 2019 10:55:11 +0000
Message-Id: <20190113105511.11946-1-git@andred.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] meta-networking: remove True option to getVar calls (again)
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
X-List-Received-Date: Sun, 13 Jan 2019 10:55:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

A couple have still been missed in the past despite multiple
attempts at doing so (or simply have re-appeared?).

Search & replace made using the following command:
    sed -e 's|\(d\.getVar \?\)( \?\([^,()]*\), \?True)|\1(\2)|g' \
        -i $(git grep -E 'getVar ?\( ?([^,()]*), ?True\)' \
             | cut -d':' -f1 \
             | sort -u)

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 .../recipes-connectivity/mosquitto/mosquitto_1.5.4.bb       | 2 +-
 meta-networking/recipes-connectivity/samba/samba_4.8.4.bb   | 6 +++---
 meta-networking/recipes-support/nis/nis.inc                 | 2 +-
 .../recipes-support/strongswan/strongswan_5.7.1.bb          | 6 +++---
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.4.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.4.bb
index 01562aad1..8f406ff9c 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.4.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.4.bb
@@ -39,7 +39,7 @@ EXTRA_OEMAKE = " \
     WITH_BUNDLED_DEPS=no \
 "
 
-export LIB_SUFFIX = "${@d.getVar('baselib', True).replace('lib', '')}"
+export LIB_SUFFIX = "${@d.getVar('baselib').replace('lib', '')}"
 
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.8.4.bb b/meta-networking/recipes-connectivity/samba/samba_4.8.4.bb
index f1aaeb83d..e86ed96a5 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.8.4.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.8.4.bb
@@ -193,15 +193,15 @@ PACKAGES =+ "${PN}-python ${PN}-pidl \
 
 python samba_populate_packages() {
     def module_hook(file, pkg, pattern, format, basename):
-        pn = d.getVar('PN', True)
+        pn = d.getVar('PN')
         d.appendVar('RRECOMMENDS_%s-base' % pn, ' %s' % pkg)
 
-    mlprefix = d.getVar('MLPREFIX', True) or ''
+    mlprefix = d.getVar('MLPREFIX') or ''
     pam_libdir = d.expand('${base_libdir}/security')
     pam_pkgname = mlprefix + 'pam-plugin%s'
     do_split_packages(d, pam_libdir, '^pam_(.*)\.so$', pam_pkgname, 'PAM plugin for %s', extra_depends='', prepend=True)
 
-    libdir = d.getVar('libdir', True)
+    libdir = d.getVar('libdir')
     do_split_packages(d, libdir, '^lib(.*)\.so\..*$', 'lib%s', 'Samba %s library', extra_depends='${PN}-common', prepend=True, allow_links=True)
     pkglibdir = '%s/samba' % libdir
     do_split_packages(d, pkglibdir, '^lib(.*)\.so$', 'lib%s', 'Samba %s library', extra_depends='${PN}-common', prepend=True)
diff --git a/meta-networking/recipes-support/nis/nis.inc b/meta-networking/recipes-support/nis/nis.inc
index 200eaf74d..a968af174 100644
--- a/meta-networking/recipes-support/nis/nis.inc
+++ b/meta-networking/recipes-support/nis/nis.inc
@@ -25,7 +25,7 @@ do_install() {
 # so force the package to be skipped here (this will cause a
 # 'nothing provides' error)
 python () {
-    os = d.getVar("TARGET_OS", True)
+    os = d.getVar("TARGET_OS")
     if os == "linux-uclibc":
         raise bb.parse.SkipRecipe("NIS functionality requires rpcsvc/yp.h, uClibC does not provide this")
 }
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.7.1.bb b/meta-networking/recipes-support/strongswan/strongswan_5.7.1.bb
index c8bb17c5b..5a4e2d36f 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.7.1.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.7.1.bb
@@ -66,8 +66,8 @@ python split_strongswan_plugins () {
     dbglibdir = os.path.join(libdir, '.debug')
 
     def add_plugin_conf(f, pkg, file_regex, output_pattern, modulename):
-        dvar = d.getVar('PKGD', True)
-        oldfiles = d.getVar('CONFFILES_' + pkg, True)
+        dvar = d.getVar('PKGD')
+        oldfiles = d.getVar('CONFFILES_' + pkg)
         newfile = '/' + os.path.relpath(f, dvar)
 
         if not oldfiles:
@@ -83,7 +83,7 @@ python split_strongswan_plugins () {
     split_staticdev_packages = do_split_packages(d, libdir, 'libstrongswan-(.*)\.a', '${PN}-plugin-%s-staticdev', 'strongSwan %s plugin - Development files (Static Libraries)', prepend=True, extra_depends='${PN}-staticdev')
 
     if split_packages:
-        pn = d.getVar('PN', True)
+        pn = d.getVar('PN')
         d.setVar('RRECOMMENDS_' + pn + '-plugins', ' '.join(split_packages))
         d.appendVar('RRECOMMENDS_' + pn + '-dbg', ' ' + ' '.join(split_dbg_packages))
         d.appendVar('RRECOMMENDS_' + pn + '-dev', ' ' + ' '.join(split_dev_packages))
-- 
2.20.1


