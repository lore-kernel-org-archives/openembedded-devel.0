Return-Path: <freesilicon@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4A93772F2D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Apr 2017 13:58:12 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id l44so7660250wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Apr 2017 06:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6hp3FHKh2GvuF39TriVBeliRtFacnrk63ecmWYoZIEE=;
	b=B76ugtYryj+6mI2yTbR60rOA56E3wpbdpBukqom2c5BiJk3+6tOpzay3acRoNUP2xG
	G93/bw7QxqBhVkjOmPX5DGh6euckTxmn8pNtHIWxyp8JbSm7qtBNkwWu2QWtNXkh7DfD
	zMNfzBQpAAqD6OQ8AHNbUvQKe5c2t9kxbu4oJFgPnnSAJkjDqnzRSpLZqp/W6DSLuWmS
	qw1/Iv8XWSNdnXhmJY5E7F0BUuvCJdO76+PMrbuwvNMcciiK+xR3e9Q8KACe1sNGvAjK
	9H3KobY42N5kw9nYIsoOdxlUvO19BSS+ebnY9efb/WgbJ/wwbLpK7LicFdP/1ygi5iMX
	YkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6hp3FHKh2GvuF39TriVBeliRtFacnrk63ecmWYoZIEE=;
	b=GAjK3xT64bpB4bsGXcO5Jg3w4igVhKkgG2WqoKEmU55aRaFTHzWTiLNUeY0mAtp2sT
	wc2OZHJY/OYU/npXtuosr41rW0+B4iGThB8hZoqNfLwxvdR9848LN2xBMfLbY/2Gmdwl
	+X8dpItIaIbet8dceo+5oU3gZRMysBjK+OFwlJmpXhJPcATDGGzT/rKe5gmibEpcNC0F
	UvElXXtJMXaZFohTeqPOeTkVmuB4CfOckm6Is116nd0G14IQqdGirZp5zKjPU/OaSDAO
	k/bhiUfF8WurU5oiIFynPsm54VY/FJxidVwRId2OgK/NxB2wwZKZwtvzFI/v1wIyXPvD
	gd5A==
X-Gm-Message-State: AN3rC/7o6zmbA//k3YCLHl4Wyvps/0kCaQq7ygrXyOmK0Mc1cHcmg6I/
	sZPJoK1FFKPyRs+i
X-Received: by 10.223.138.178 with SMTP id y47mr8458518wry.22.1492696693701;
	Thu, 20 Apr 2017 06:58:13 -0700 (PDT)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id k26sm7699900wre.9.2017.04.20.06.58.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Apr 2017 06:58:13 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Apr 2017 15:57:35 +0200
Message-Id: <20170420135735.25958-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [meta-networking][PATCH] strongswan: Split plugins
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
X-List-Received-Date: Thu, 20 Apr 2017 13:58:13 -0000

strongSwan offers a plugin mechanism therefore it should not be
mandatory to install all of them when installing the package. Each
plugin is now a self-contained package with the library and its
configuration.

To remain compatible with the current configuration, a default set of
plugins has been selected as RDEPENDS of the main package. This default
list is based on the default strongSwan list minus some plugins enabled
via PACKAGECONFIG
(see https://wiki.strongswan.org/projects/strongswan/PluginList).

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 .../recipes-support/strongswan/strongswan_5.5.1.bb | 101 ++++++++++++++++++---
 1 file changed, 88 insertions(+), 13 deletions(-)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.5.1.bb b/meta-networking/recipes-support/strongswan/strongswan_5.5.1.bb
index f9e7ae3c1..d63214ba4 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.5.1.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.5.1.bb
@@ -24,17 +24,17 @@ EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-syst
 PACKAGECONFIG ??= "charon curl gmp openssl stroke sqlite3 \
         ${@bb.utils.filter('DISTRO_FEATURES', 'ldap', d)} \
 "
-PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,"
+PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,,${PN}-plugin-aesni"
 PACKAGECONFIG[charon] = "--enable-charon,--disable-charon,"
-PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
-PACKAGECONFIG[gmp] = "--enable-gmp,--disable-gmp,gmp,"
-PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,openldap,"
-PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,"
-PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl,"
+PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,${PN}-plugin-curl"
+PACKAGECONFIG[gmp] = "--enable-gmp,--disable-gmp,gmp,${PN}-plugin-gmp"
+PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,openldap,${PN}-plugin-ldap"
+PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,${PN}-plugin-mysql"
+PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl,${PN}-plugin-openssl"
 PACKAGECONFIG[scep] = "--enable-scepclient,--disable-scepclient,"
-PACKAGECONFIG[soup] = "--enable-soup,--disable-soup,libsoup-2.4,"
-PACKAGECONFIG[sqlite3] = "--enable-sqlite,--disable-sqlite,sqlite3,"
-PACKAGECONFIG[stroke] = "--enable-stroke,--disable-stroke,"
+PACKAGECONFIG[soup] = "--enable-soup,--disable-soup,libsoup-2.4,${PN}-plugin-soup"
+PACKAGECONFIG[sqlite3] = "--enable-sqlite,--disable-sqlite,sqlite3,${PN}-plugin-sqlite"
+PACKAGECONFIG[stroke] = "--enable-stroke,--disable-stroke,,${PN}-plugin-stroke"
 PACKAGECONFIG[swanctl] = "--enable-swanctl,--disable-swanctl,,libgcc"
 
 # requires swanctl
@@ -44,10 +44,85 @@ inherit autotools systemd pkgconfig
 
 RRECOMMENDS_${PN} = "kernel-module-ipsec"
 
-FILES_${PN} += "${libdir}/ipsec/lib*${SOLIBS} ${libdir}/ipsec/plugins/*.so"
-FILES_${PN}-dbg += "${libdir}/ipsec/.debug ${libdir}/ipsec/plugins/.debug ${libexecdir}/ipsec/.debug"
-FILES_${PN}-dev += "${libdir}/ipsec/lib*${SOLIBSDEV} ${libdir}/ipsec/*.la ${libdir}/ipsec/plugins/*.la"
-FILES_${PN}-staticdev += "${libdir}/ipsec/*.a ${libdir}/ipsec/plugins/*.a"
+FILES_${PN} += "${libdir}/ipsec/lib*${SOLIBS}"
+FILES_${PN}-dbg += "${bindir}/.debug ${libdir}/ipsec/.debug ${libexecdir}/ipsec/.debug"
+FILES_${PN}-dev += "${libdir}/ipsec/lib*${SOLIBSDEV} ${libdir}/ipsec/*.la"
+FILES_${PN}-staticdev += "${libdir}/ipsec/*.a"
+
+CONFFILES_${PN} = "${sysconfdir}/*.conf ${sysconfdir}/ipsec.d/*.conf ${sysconfdir}/strongswan.d/*.conf"
+
+PACKAGES += "${PN}-plugins"
+ALLOW_EMPTY_${PN}-plugins = "1"
+
+PACKAGES_DYNAMIC += "^${PN}-plugin-.*$"
+NOAUTOPACKAGEDEBUG = "1"
+
+python split_strongswan_plugins () {
+    sysconfdir = d.expand('${sysconfdir}/strongswan.d/charon')
+    libdir = d.expand('${libdir}/ipsec/plugins')
+    dbglibdir = os.path.join(libdir, '.debug')
+
+    def add_plugin_conf(f, pkg, file_regex, output_pattern, modulename):
+        dvar = d.getVar('PKGD', True)
+        oldfiles = d.getVar('CONFFILES_' + pkg, True)
+        newfile = '/' + os.path.relpath(f, dvar)
+
+        if not oldfiles:
+            d.setVar('CONFFILES_' + pkg, newfile)
+        else:
+            d.setVar('CONFFILES_' + pkg, oldfiles + " " + newfile)
+
+    split_packages = do_split_packages(d, libdir, 'libstrongswan-(.*)\.so', '${PN}-plugin-%s', 'strongSwan %s plugin', prepend=True)
+    do_split_packages(d, sysconfdir, '(.*)\.conf', '${PN}-plugin-%s', 'strongSwan %s plugin', prepend=True, hook=add_plugin_conf)
+
+    split_dbg_packages = do_split_packages(d, dbglibdir, 'libstrongswan-(.*)\.so', '${PN}-plugin-%s-dbg', 'strongSwan %s plugin - Debugging files', prepend=True, extra_depends='${PN}-dbg')
+    split_dev_packages = do_split_packages(d, libdir, 'libstrongswan-(.*)\.la', '${PN}-plugin-%s-dev', 'strongSwan %s plugin - Development files', prepend=True, extra_depends='${PN}-dev')
+    split_staticdev_packages = do_split_packages(d, libdir, 'libstrongswan-(.*)\.a', '${PN}-plugin-%s-staticdev', 'strongSwan %s plugin - Development files (Static Libraries)', prepend=True, extra_depends='${PN}-staticdev')
+
+    if split_packages:
+        pn = d.getVar('PN', True)
+        d.setVar('RRECOMMENDS_' + pn + '-plugins', ' '.join(split_packages))
+        d.appendVar('RRECOMMENDS_' + pn + '-dbg', ' ' + ' '.join(split_dbg_packages))
+        d.appendVar('RRECOMMENDS_' + pn + '-dev', ' ' + ' '.join(split_dev_packages))
+        d.appendVar('RRECOMMENDS_' + pn + '-staticdev', ' ' + ' '.join(split_staticdev_packages))
+}
+
+PACKAGESPLITFUNCS_prepend = "split_strongswan_plugins "
+
+# Install some default plugins based on default strongSwan ./configure options
+# See https://wiki.strongswan.org/projects/strongswan/wiki/Pluginlist
+RDEPENDS_${PN} += "\
+    ${PN}-plugin-aes \
+    ${PN}-plugin-attr \
+    ${PN}-plugin-cmac \
+    ${PN}-plugin-constraints \
+    ${PN}-plugin-des \
+    ${PN}-plugin-dnskey \
+    ${PN}-plugin-hmac \
+    ${PN}-plugin-kernel-netlink \
+    ${PN}-plugin-md5 \
+    ${PN}-plugin-nonce \
+    ${PN}-plugin-pem \
+    ${PN}-plugin-pgp \
+    ${PN}-plugin-pkcs1 \
+    ${PN}-plugin-pkcs7 \
+    ${PN}-plugin-pkcs8 \
+    ${PN}-plugin-pkcs12 \
+    ${PN}-plugin-pubkey \
+    ${PN}-plugin-random \
+    ${PN}-plugin-rc2 \
+    ${PN}-plugin-resolve \
+    ${PN}-plugin-revocation \
+    ${PN}-plugin-sha1 \
+    ${PN}-plugin-sha2 \
+    ${PN}-plugin-socket-default \
+    ${PN}-plugin-sshkey \
+    ${PN}-plugin-updown \
+    ${PN}-plugin-vici \
+    ${PN}-plugin-x509 \
+    ${PN}-plugin-xauth-generic \
+    ${PN}-plugin-xcbc \
+    "
 
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
-- 
2.12.2


