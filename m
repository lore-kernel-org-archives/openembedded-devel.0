Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03FA5C433F5
	for <webhook@archiver.kernel.org>; Sun, 20 Feb 2022 08:48:23 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.19690.1645346901923874712
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 00:48:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cHUJwZjV;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id x5so23180403edd.11
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 00:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eY6x1XTLwJWl2HPiC3ejU5gnPY929cF0BDchcdsOrwY=;
        b=cHUJwZjVn7ELhnHuosE0l3Ms7XyI4gocHh4jbtz20hQ7WcHWFVkHDZvYNuqZ2hSmeB
         VwwHh+xZmG5++9FTcG8s1ux6nOLKxy2qjMDtlbUjt2buMM4IP+5BGgCh7mJ9glsBVTSA
         7ZeQJouv6Q6cL7YtoVCZKhmrQ6s1yq/iE3NNnY89D3AkTgkYFCnHkmuTfOCdhUxDDDQe
         YK6+07iiRZy69siP4aZtxG3e0T2ktyOjvCgsy/vcVcX4qVFqZdAujqAHzTneKnu3+3sf
         LMseMMMJuOA4IvPck/mHPcV5g8mslKDBrnWOFYCHzb8mGCq/VfxsRY1va7l6Ia1dy/zl
         /D8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eY6x1XTLwJWl2HPiC3ejU5gnPY929cF0BDchcdsOrwY=;
        b=Kt1HtNIuXYlCOQdZzSV2UvZ5hggHuSTIVrIAtdSPI5sKNZDxQksvc4j7gNxD8ab16g
         Hh00sV970CLY6bhUgye1YDuxHNoTdBrTo1h2cTY256nb2cp8fq1FcqJdRztwbUoEqEa4
         7pp8DiAkj172byOxQsjHlhZL2avV1HnQDiho8yiiC1pICmrkOfKjfymqPNB+YNdmyqcG
         J8DOh0zpO/m8HUT9L+lQL5/aeIIYAWvr3iuUS3XavjOHx1QjnM2nSyzz1U4GE1QGRqur
         wLvhRRQxh6E4J/Axck7uqQu/baW5YVPs0GxMqfwNOebmZCHrecg0dg5b23GGoJmhVFZY
         Hyyw==
X-Gm-Message-State: AOAM533eop14zyDZ4qzcUYMpDWAQGCkswpmCgKr13EVo9zsJnmoI6tEv
	C/gD7q6sRtFro+/SZWAVI9g7EuNavt/J6A==
X-Google-Smtp-Source: 
 ABdhPJz+D1QL3pCUBoib8uspNTh+bkTNM9S2Hdnuj0+QbMTiO0TSpnMSdSTc7pNcMzMGu52KQUFrqw==
X-Received: by 2002:a05:6402:50d0:b0:412:8f96:e5fa with SMTP id
 h16-20020a05640250d000b004128f96e5famr15906523edb.276.1645346900293;
        Sun, 20 Feb 2022 00:48:20 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 u27sm3912694ejc.220.2022.02.20.00.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 00:48:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] Fix DeprecationWarning about regexps
Date: Sun, 20 Feb 2022 09:48:12 +0100
Message-Id: <20220220084812.168541-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Feb 2022 08:48:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95392

* fixes:
meta-oe/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb:125: DeprecationWarning: invalid escape sequence \.
meta-oe/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb:126: DeprecationWarning: invalid escape sequence \.
meta-oe/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb:128: DeprecationWarning: invalid escape sequence \.
meta-oe/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb:129: DeprecationWarning: invalid escape sequence \.
meta-oe/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb:130: DeprecationWarning: invalid escape sequence \.
meta-oe/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb:18: DeprecationWarning: invalid escape sequence \.
meta-oe/meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+2.0.1.bb:21: DeprecationWarning: invalid escape sequence \.
meta-oe/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb:28: DeprecationWarning: invalid escape sequence \.
oe-core/meta/classes/package.bbclass:1342: DeprecationWarning: invalid escape sequence \.
oe-core/meta/classes/package.bbclass:1343: DeprecationWarning: invalid escape sequence \-
oe-core/meta/classes/package.bbclass:1343: DeprecationWarning: invalid escape sequence \.
oe-core/meta/classes/package.bbclass:1344: DeprecationWarning: invalid escape sequence \.
oe-core/meta/classes/package.bbclass:1345: DeprecationWarning: invalid escape sequence \.
oe-core/meta/classes/package.bbclass:1348: DeprecationWarning: invalid escape sequence \.
oe-core/meta/classes/package.bbclass:1350: DeprecationWarning: invalid escape sequence \.
oe-core/meta/classes/package.bbclass:1353: DeprecationWarning: invalid escape sequence \.
oe-core/meta/classes/package.bbclass:1355: DeprecationWarning: invalid escape sequence \.
oe-core/meta/classes/package.bbclass:1358: DeprecationWarning: invalid escape sequence \.
oe-core/meta/classes/package.bbclass:1360: DeprecationWarning: invalid escape sequence \.
oe-core/meta/classes/package.bbclass:1365: DeprecationWarning: invalid escape sequence \.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-connectivity/rygel/rygel_0.38.3.bb         |  4 ++--
 .../recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb      |  8 ++++----
 .../recipes-multimedia/libao/libao_1.2.0.bb            |  4 ++--
 .../recipes-connectivity/samba/samba_4.14.12.bb        | 10 +++++-----
 .../recipes-support/strongswan/strongswan_5.9.4.bb     | 10 +++++-----
 .../recipes-extended/lcdproc/lcdproc_git.bb            |  2 +-
 .../recipes-graphics/tesseract/tesseract-lang_4.1.0.bb |  2 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb    |  2 +-
 .../libcdio/libcdio-paranoia_10.2+2.0.1.bb             |  2 +-
 meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb    |  2 +-
 meta-oe/recipes-support/freerdp/freerdp_2.5.0.bb       |  8 ++++----
 .../recipes-support/libcanberra/libcanberra_0.30.bb    |  4 ++--
 meta-oe/recipes-support/opencv/opencv_4.5.5.bb         |  8 ++++----
 meta-oe/recipes-support/openldap/openldap_2.5.9.bb     |  4 ++--
 meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb        | 10 +++++-----
 meta-oe/recipes-support/poco/poco_1.11.0.bb            |  2 +-
 .../recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb     |  2 +-
 17 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.38.3.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.38.3.bb
index c08ab11b24..9633cab530 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.38.3.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.38.3.bb
@@ -64,8 +64,8 @@ python populate_packages:prepend () {
     postinst = d.getVar('plugin_postinst')
     pkgs = []
 
-    pkgs += do_split_packages(d, oe.path.join(rygel_libdir, "plugins"), 'librygel-(.*)\.so$', d.expand('${PN}-plugin-%s'), 'Rygel plugin for %s', postinst=postinst, extra_depends=d.expand('${PN}'))
-    pkgs += do_split_packages(d, oe.path.join(rygel_libdir, "plugins"), '(.*)\.plugin$', d.expand('${PN}-plugin-%s'), 'Rygel plugin for %s', postinst=postinst, extra_depends=d.expand('${PN}'))
+    pkgs += do_split_packages(d, oe.path.join(rygel_libdir, "plugins"), r'librygel-(.*)\.so$', d.expand('${PN}-plugin-%s'), 'Rygel plugin for %s', postinst=postinst, extra_depends=d.expand('${PN}'))
+    pkgs += do_split_packages(d, oe.path.join(rygel_libdir, "plugins"), r'(.*)\.plugin$', d.expand('${PN}-plugin-%s'), 'Rygel plugin for %s', postinst=postinst, extra_depends=d.expand('${PN}'))
 
     metapkg = d.getVar('PN') + '-meta'
     d.setVar('RDEPENDS:' + metapkg, ' '.join(pkgs))
diff --git a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb
index adaa552ed8..3cf0ca4eb8 100644
--- a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb
+++ b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb
@@ -91,10 +91,10 @@ FILES:dvb-zap-data = "${docdir}/dvb-apps/szap"
 
 python populate_packages:prepend () {
     dvb_libdir = bb.data.expand('${libdir}', d)
-    do_split_packages(d, dvb_libdir, '^lib(.*)\.so$', 'lib%s', 'DVB %s package', extra_depends='', allow_links=True)
-    do_split_packages(d, dvb_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'DVB %s development package', extra_depends='${PN}-dev')
-    do_split_packages(d, dvb_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'DVB %s development package', extra_depends='${PN}-dev')
-    do_split_packages(d, dvb_libdir, '^lib(.*)\.so\.*', 'lib%s', 'DVB %s library', extra_depends='', allow_links=True)
+    do_split_packages(d, dvb_libdir, r'^lib(.*)\.so$', 'lib%s', 'DVB %s package', extra_depends='', allow_links=True)
+    do_split_packages(d, dvb_libdir, r'^lib(.*)\.la$', 'lib%s-dev', 'DVB %s development package', extra_depends='${PN}-dev')
+    do_split_packages(d, dvb_libdir, r'^lib(.*)\.a$', 'lib%s-dev', 'DVB %s development package', extra_depends='${PN}-dev')
+    do_split_packages(d, dvb_libdir, r'^lib(.*)\.so\.*', 'lib%s', 'DVB %s library', extra_depends='', allow_links=True)
 }
 
 INSANE_SKIP:${PN} = "ldflags"
diff --git a/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb b/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
index dc09d9413a..e6a9b7d250 100644
--- a/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
@@ -23,8 +23,8 @@ do_install:append () {
 python populate_packages:prepend () {
     rootdir = bb.data.expand('${libdir}/ao/plugins-4', d)
     rootdir_dbg = bb.data.expand('${libdir}/ao/plugins-4/.debug', d)
-    do_split_packages(d, rootdir, '^(.*)\.so$', output_pattern='${BPN}-plugin-%s', description='AO %s plugin')
-    do_split_packages(d, rootdir_dbg, '^(.*)\.so$', output_pattern='${BPN}-plugin-%s-dbg', description='AO %s plugin debug data')
+    do_split_packages(d, rootdir, r'^(.*)\.so$', output_pattern='${BPN}-plugin-%s', description='AO %s plugin')
+    do_split_packages(d, rootdir_dbg, r'^(.*)\.so$', output_pattern='${BPN}-plugin-%s-dbg', description='AO %s plugin debug data')
 }
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio', d)}"
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb
index 5be4d2d51e..099d99c824 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.12.bb
@@ -224,16 +224,16 @@ python samba_populate_packages() {
     mlprefix = d.getVar('MLPREFIX') or ''
     pam_libdir = d.expand('${base_libdir}/security')
     pam_pkgname = mlprefix + 'pam-plugin%s'
-    do_split_packages(d, pam_libdir, '^pam_(.*)\.so$', pam_pkgname, 'PAM plugin for %s', extra_depends='', prepend=True)
+    do_split_packages(d, pam_libdir, r'^pam_(.*)\.so$', pam_pkgname, 'PAM plugin for %s', extra_depends='', prepend=True)
 
     libdir = d.getVar('libdir')
-    do_split_packages(d, libdir, '^lib(.*)\.so\..*$', 'lib%s', 'Samba %s library', extra_depends='${PN}-common', prepend=True, allow_links=True)
+    do_split_packages(d, libdir, r'^lib(.*)\.so\..*$', 'lib%s', 'Samba %s library', extra_depends='${PN}-common', prepend=True, allow_links=True)
     pkglibdir = '%s/samba' % libdir
-    do_split_packages(d, pkglibdir, '^lib(.*)\.so$', 'lib%s', 'Samba %s library', extra_depends='${PN}-common', prepend=True)
+    do_split_packages(d, pkglibdir, r'^lib(.*)\.so$', 'lib%s', 'Samba %s library', extra_depends='${PN}-common', prepend=True)
     moduledir = '%s/samba/auth' % libdir
-    do_split_packages(d, moduledir, '^(.*)\.so$', 'samba-auth-%s', 'Samba %s authentication backend', hook=module_hook, extra_depends='', prepend=True)
+    do_split_packages(d, moduledir, r'^(.*)\.so$', 'samba-auth-%s', 'Samba %s authentication backend', hook=module_hook, extra_depends='', prepend=True)
     moduledir = '%s/samba/pdb' % libdir
-    do_split_packages(d, moduledir, '^(.*)\.so$', 'samba-pdb-%s', 'Samba %s password backend', hook=module_hook, extra_depends='', prepend=True)
+    do_split_packages(d, moduledir, r'^(.*)\.so$', 'samba-pdb-%s', 'Samba %s password backend', hook=module_hook, extra_depends='', prepend=True)
 }
 
 PACKAGESPLITFUNCS:prepend = "samba_populate_packages "
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
index 2b7a7a2410..686cdb677e 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
@@ -122,12 +122,12 @@ python split_strongswan_plugins () {
         else:
             d.setVar('CONFFILES:' + pkg, oldfiles + " " + newfile)
 
-    split_packages = do_split_packages(d, libdir, 'libstrongswan-(.*)\.so', '${PN}-plugin-%s', 'strongSwan %s plugin', prepend=True)
-    do_split_packages(d, sysconfdir, '(.*)\.conf', '${PN}-plugin-%s', 'strongSwan %s plugin', prepend=True, hook=add_plugin_conf)
+    split_packages = do_split_packages(d, libdir, r'libstrongswan-(.*)\.so', '${PN}-plugin-%s', 'strongSwan %s plugin', prepend=True)
+    do_split_packages(d, sysconfdir, r'(.*)\.conf', '${PN}-plugin-%s', 'strongSwan %s plugin', prepend=True, hook=add_plugin_conf)
 
-    split_dbg_packages = do_split_packages(d, dbglibdir, 'libstrongswan-(.*)\.so', '${PN}-plugin-%s-dbg', 'strongSwan %s plugin - Debugging files', prepend=True, extra_depends='${PN}-dbg')
-    split_dev_packages = do_split_packages(d, libdir, 'libstrongswan-(.*)\.la', '${PN}-plugin-%s-dev', 'strongSwan %s plugin - Development files', prepend=True, extra_depends='${PN}-dev')
-    split_staticdev_packages = do_split_packages(d, libdir, 'libstrongswan-(.*)\.a', '${PN}-plugin-%s-staticdev', 'strongSwan %s plugin - Development files (Static Libraries)', prepend=True, extra_depends='${PN}-staticdev')
+    split_dbg_packages = do_split_packages(d, dbglibdir, r'libstrongswan-(.*)\.so', '${PN}-plugin-%s-dbg', 'strongSwan %s plugin - Debugging files', prepend=True, extra_depends='${PN}-dbg')
+    split_dev_packages = do_split_packages(d, libdir, r'libstrongswan-(.*)\.la', '${PN}-plugin-%s-dev', 'strongSwan %s plugin - Development files', prepend=True, extra_depends='${PN}-dev')
+    split_staticdev_packages = do_split_packages(d, libdir, r'libstrongswan-(.*)\.a', '${PN}-plugin-%s-staticdev', 'strongSwan %s plugin - Development files (Static Libraries)', prepend=True, extra_depends='${PN}-staticdev')
 
     if split_packages:
         pn = d.getVar('PN')
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb
index 5257ee3477..46ca77f208 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc_git.bb
@@ -100,7 +100,7 @@ INITSCRIPT_PARAMS:lcdproc = "defaults 71 20"
 
 python populate_packages:prepend() {
     plugindir = d.expand('${libdir}/lcdproc')
-    do_split_packages(d, plugindir, '(.*)\.so$', 'lcdd-driver-%s', 'LCDd driver for %s', prepend=True)
+    do_split_packages(d, plugindir, r'(.*)\.so$', 'lcdd-driver-%s', 'LCDd driver for %s', prepend=True)
 }
 
 PACKAGES_DYNAMIC += "^lcdd-driver-.*"
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
index 3a3068f73a..2f7fcac784 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
@@ -17,7 +17,7 @@ do_install() {
 
 python populate_packages:prepend () {
     tessdata_dir= d.expand('${datadir}/tessdata')
-    pkgs = do_split_packages(d, tessdata_dir, '^([a-z_]*)\.*', '${BPN}-%s', 'tesseract-ocr language files for %s', extra_depends='')
+    pkgs = do_split_packages(d, tessdata_dir, r'^([a-z_]*)\.*', '${BPN}-%s', 'tesseract-ocr language files for %s', extra_depends='')
     pn = d.getVar('PN')
     d.appendVar('RDEPENDS:' + pn, ' '+' '.join(pkgs))
 }
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
index 31e710a95e..d8236ce434 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
@@ -15,7 +15,7 @@ PACKAGESPLITFUNCS:prepend = "split_ttf_mplus_packages "
 
 python split_ttf_mplus_packages() {
     plugindir = d.expand('${datadir}/fonts/ttf-mplus/')
-    packages = do_split_packages(d, plugindir, '^(.*)\.ttf$', 'ttf-%s', 'TTF Font %s')
+    packages = do_split_packages(d, plugindir, r'^(.*)\.ttf$', 'ttf-%s', 'TTF Font %s')
     d.setVar('FONT_PACKAGES', ' '.join(packages))
 }
 
diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+2.0.1.bb b/meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+2.0.1.bb
index 441defea43..3ca91f64a3 100644
--- a/meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+2.0.1.bb
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+2.0.1.bb
@@ -18,7 +18,7 @@ FILES:${PN}-utils = "${bindir}/*"
 
 python libcdio_split_packages() {
     libdir = d.expand('${libdir}')
-    do_split_packages(d, libdir, '^lib(.*)\.so\..*', 'lib%s', 'libcdio %s library', extra_depends='', allow_links=True)
+    do_split_packages(d, libdir, r'^lib(.*)\.so\..*', 'lib%s', 'libcdio %s library', extra_depends='', allow_links=True)
 }
 
 PACKAGESPLITFUNCS =+ "libcdio_split_packages"
diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb b/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb
index 2becafb2a4..170a555b9e 100644
--- a/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb
@@ -25,7 +25,7 @@ FILES:${PN}-utils = "${bindir}/*"
 
 python libcdio_split_packages() {
     libdir = d.expand('${libdir}')
-    do_split_packages(d, libdir, '^lib(.*)\.so\..*', 'lib%s', 'libcdio %s library', extra_depends='', allow_links=True)
+    do_split_packages(d, libdir, r'^lib(.*)\.so\..*', 'lib%s', 'libcdio %s library', extra_depends='', allow_links=True)
 }
 
 PACKAGESPLITFUNCS =+ "libcdio_split_packages"
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.5.0.bb b/meta-oe/recipes-support/freerdp/freerdp_2.5.0.bb
index 3dbc87686a..a272cb0991 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.5.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.5.0.bb
@@ -63,22 +63,22 @@ do_install:append () {
 python populate_packages:prepend () {
     freerdp_root = d.expand('${libdir}/freerdp')
 
-    do_split_packages(d, freerdp_root, '^(audin_.*)\.so$',
+    do_split_packages(d, freerdp_root, r'^(audin_.*)\.so$',
         output_pattern='libfreerdp-plugin-%s',
         description='FreeRDP plugin %s',
         prepend=True, extra_depends='libfreerdp-plugin-audin')
 
-    do_split_packages(d, freerdp_root, '^(rdpsnd_.*)\.so$',
+    do_split_packages(d, freerdp_root, r'^(rdpsnd_.*)\.so$',
         output_pattern='libfreerdp-plugin-%s',
         description='FreeRDP plugin %s',
         prepend=True, extra_depends='libfreerdp-plugin-rdpsnd')
 
-    do_split_packages(d, freerdp_root, '^(tsmf_.*)\.so$',
+    do_split_packages(d, freerdp_root, r'^(tsmf_.*)\.so$',
         output_pattern='libfreerdp-plugin-%s',
         description='FreeRDP plugin %s',
         prepend=True, extra_depends='libfreerdp-plugin-tsmf')
 
-    do_split_packages(d, freerdp_root, '^([^-]*)\.so$',
+    do_split_packages(d, freerdp_root, r'^([^-]*)\.so$',
         output_pattern='libfreerdp-plugin-%s',
         description='FreeRDP plugin %s',
         prepend=True, extra_depends='')
diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb b/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
index 0b85862bb5..37e2376b16 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
@@ -34,8 +34,8 @@ PACKAGECONFIG[gtk3] = "--enable-gtk3, --disable-gtk3, gtk+3"
 
 python populate_packages:prepend() {
     plugindir = d.expand('${libdir}/${BPN}-${PV}/')
-    do_split_packages(d, plugindir, '^libcanberra-(.*)\.so$', 'libcanberra-%s', '%s support library', extra_depends='' )
-    do_split_packages(d, plugindir, '^libcanberra-(.*)\.la$', 'libcanberra-%s', '%s support library', extra_depends='' )
+    do_split_packages(d, plugindir, r'^libcanberra-(.*)\.so$', 'libcanberra-%s', '%s support library', extra_depends='' )
+    do_split_packages(d, plugindir, r'^libcanberra-(.*)\.la$', 'libcanberra-%s', '%s support library', extra_depends='' )
 }
 
 PACKAGES =+ "${PN}-gnome ${PN}-gtk2 ${PN}-gtk3 ${PN}-systemd"
diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.5.bb b/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
index a3affa701d..4449596dae 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.5.bb
@@ -162,10 +162,10 @@ PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'samples', '${PN}-samples', '
 
 python populate_packages:prepend () {
     cv_libdir = d.expand('${libdir}')
-    do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev', allow_links=True)
-    do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
-    do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
-    do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s library', extra_depends='', allow_links=True)
+    do_split_packages(d, cv_libdir, r'^lib(.*)\.so$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev', allow_links=True)
+    do_split_packages(d, cv_libdir, r'^lib(.*)\.la$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
+    do_split_packages(d, cv_libdir, r'^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
+    do_split_packages(d, cv_libdir, r'^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s library', extra_depends='', allow_links=True)
 
     pn = d.getVar('PN')
     metapkg =  pn + '-dev'
diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb b/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
index b80bde8490..e5e9e5a6de 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
@@ -219,8 +219,8 @@ INSANE_SKIP:${PN}-backend-passwd     += "dev-so"
 
 python populate_packages:prepend () {
     backend_dir    = d.expand('${libexecdir}/openldap')
-    do_split_packages(d, backend_dir, 'back_([a-z]*)\.so$', 'openldap-backend-%s', 'OpenLDAP %s backend', prepend=True, extra_depends='', allow_links=True)
-    do_split_packages(d, backend_dir, 'back_([a-z]*)\-.*\.so\..*$', 'openldap-backend-%s', 'OpenLDAP %s backend', extra_depends='', allow_links=True)
+    do_split_packages(d, backend_dir, r'back_([a-z]*)\.so$', 'openldap-backend-%s', 'OpenLDAP %s backend', prepend=True, extra_depends='', allow_links=True)
+    do_split_packages(d, backend_dir, r'back_([a-z]*)\-.*\.so\..*$', 'openldap-backend-%s', 'OpenLDAP %s backend', extra_depends='', allow_links=True)
 
     metapkg = "${PN}-backends"
     d.setVar('ALLOW_EMPTY:' + metapkg, "1")
diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb b/meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb
index b2e6d9ac10..17a2adfc14 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb
@@ -83,27 +83,27 @@ python populate_packages:prepend () {
     purple   = d.expand('${libdir}/purple-2')
     finch    = d.expand('${libdir}/finch')
 
-    do_split_packages(d, pidgroot, '^([^l][^i][^b].*)\.so$',
+    do_split_packages(d, pidgroot, r'^([^l][^i][^b].*)\.so$',
         output_pattern='pidgin-plugin-%s',
         description='Pidgin plugin %s',
         prepend=True, extra_depends='')
 
-    do_split_packages(d, purple, '^lib(.*)\.so$',
+    do_split_packages(d, purple, r'^lib(.*)\.so$',
         output_pattern='libpurple-protocol-%s',
         description='Libpurple protocol plugin for %s',
         prepend=True, extra_depends='')
 
-    do_split_packages(d, purple, '^(ssl-.*)\.so$',
+    do_split_packages(d, purple, r'^(ssl-.*)\.so$',
         output_pattern='libpurple-plugin-%s',
         description='libpurple plugin %s',
         prepend=True, extra_depends='libpurple-plugin-ssl')
 
-    do_split_packages(d, purple, '^([^l][^i][^b].*)\.so$',
+    do_split_packages(d, purple, r'^([^l][^i][^b].*)\.so$',
         output_pattern='libpurple-plugin-%s',
         description='libpurple plugin %s',
         prepend=True, extra_depends='')
 
-    do_split_packages(d, finch, '^([^l][^i][^b].*)\.so$',
+    do_split_packages(d, finch, r'^([^l][^i][^b].*)\.so$',
         output_pattern='finch-plugin-%s',
         description='Finch plugin %s',
         prepend=True, extra_depends='')
diff --git a/meta-oe/recipes-support/poco/poco_1.11.0.bb b/meta-oe/recipes-support/poco/poco_1.11.0.bb
index c364f7220b..027ff64692 100644
--- a/meta-oe/recipes-support/poco/poco_1.11.0.bb
+++ b/meta-oe/recipes-support/poco/poco_1.11.0.bb
@@ -72,7 +72,7 @@ python populate_packages:prepend () {
         packages.append(pkg)
         testrunners.append(modulename)
 
-    do_split_packages(d, poco_libdir, '^libPoco(.*)\.so\..*$',
+    do_split_packages(d, poco_libdir, r'^libPoco(.*)\.so\..*$',
                     'poco-%s', 'Poco %s component', extra_depends='', prepend=True, hook=hook)
 
     d.setVar("RRECOMMENDS:%s" % pn, " ".join(packages))
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
index c9e65400d2..3c1864a802 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
@@ -17,7 +17,7 @@ SRC_URI += " \
 python populate_packages:prepend() {
     plugin_dir = d.expand('${libdir}/xfce4/panel/plugins/')
     plugin_name = d.expand('${PN}-plugin-%s')
-    do_split_packages(d, plugin_dir, '^lib(.*).so$', plugin_name,
+    do_split_packages(d, plugin_dir, r'^lib(.*)\.so$', plugin_name,
                       '${PN} plugin for %s', extra_depends='', prepend=True,
                       aux_files_pattern=['${datadir}/xfce4/panel/plugins/%s.desktop',
                                          '${sysconfdir}/xdg/xfce/panel/%s-*',
-- 
2.35.1


