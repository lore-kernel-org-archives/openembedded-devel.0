Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.17458.1627601823120607671
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 16:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nkbYUera;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id g23-20020a17090a5797b02901765d605e14so11826735pji.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jul 2021 16:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0OjhZ7HZoRemLSsW4y5RtjaqDKpKINIFiZIxgqUKW8U=;
        b=nkbYUeraIHGdghwJCg/SBhgzZIBer9R8SxJKtR2dp/15SS6WJGBeM78ZP7vH51vjGW
         SbDg8Z1Esy2+W7q2HoRHo3RywI3Vl83dissBzP/ufl63+nprhyOI6k8pbe0LquTZhhrH
         pujiUbLJfqycL8wTFOnSYsGiMnhrQpRLQVAP2Q4UynNpsVKwNrgDuAv/yRKhDUKpi9Yw
         NJMqHXEkxLM8frgCV4v4Ufvc6Ngt40eIi8XoDlU+0HbjvCfb7em11fwioVZWxQgsxB8m
         vriYp/GsGjc0Ryl37uxbWKWZrTD4H6pH2VupvSB4ilyFjUNN64E5MQyxFswx+VOPiMa9
         Xlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0OjhZ7HZoRemLSsW4y5RtjaqDKpKINIFiZIxgqUKW8U=;
        b=o7WdC/J5Bns0BR1/GrNFz1s6Op7WpMYdiz1DT8RgbpTX3ghzrjO6sMS81rQKfprODz
         /mamFrb59bfnnvrgsbDWnKdtIPVDq7vaODhIPOgI7se42v5UeN/rlERCl/0zCY1UhzdO
         c0pTctzceaJGCTIr322NFPKt+MHKVReqpftiKBRgWKy8rB/Una+pq0tHnt5WBj8VWD5k
         +lzXDKuaOALBrsssNHl8gCt6Ms6PNgM6madfgP6H0Xw+8lYhMlHYmT/446tzHSMTyYVZ
         S3wYJO6lOZMdMd7LONGwl4dJrX96CO5ErxudoQ9p0cFUiPFTF8bNOGj3Cf3DWYYT3ZVn
         2W4Q==
X-Gm-Message-State: AOAM5338U/FW5zPT46/4MfF2g34m0F2psJBNy77rMlxbljL3VSr16VTq
	cP5oi+5xqfDQki+YJ2jZ/q/F7iDf8285ag==
X-Google-Smtp-Source: ABdhPJwGxaHBh6WhJn4BbHYFfjrHBaKWEPI0cPEJj9+Qi5fbzPxz3Ls8L0idOJURT5DvzLQQOuCGHQ==
X-Received: by 2002:a62:e809:0:b029:32c:2dcf:60ed with SMTP id c9-20020a62e8090000b029032c2dcf60edmr7573040pfi.5.1627601822437;
        Thu, 29 Jul 2021 16:37:02 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:43fe:2e36:1546:5b06])
        by smtp.gmail.com with ESMTPSA id w15sm2360487pfu.89.2021.07.29.16.37.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 16:37:01 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 10/15] mariadb: fix failures to start install_db.service
Date: Thu, 29 Jul 2021 16:36:43 -0700
Message-Id: <d5c56d100dde5cd7bf4b82cc8e57399e7e76ac40.1627593245.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627593245.git.akuster808@gmail.com>
References: <cover.1627593245.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

It fails to start install_db.service when install mariadb-setupdb from a
package repo via dnf:

root@qemux86-64:~# systemctl status install_db
x install_db.service - Install MySQL Community Server Database
     Loaded: loaded (/lib/systemd/system/install_db.service; enabled; vendor preset: enabled)
     Active: failed (Result: exit-code) since Fri 2021-07-09 02:55:12 UTC; 5s ago
    Process: 504 ExecStart=/usr/bin/mysql-systemd-start pre (code=exited, status=203/EXEC)
   Main PID: 504 (code=exited, status=203/EXEC)

Jul 09 02:55:12 qemux86-64 systemd[1]: Starting Install MySQL Community Server Database...
Jul 09 02:55:12 qemux86-64 systemd[504]: install_db.service: Failed to locate executable /usr/bin/mysql-systemd-start: No such file or directo>
Jul 09 02:55:12 qemux86-64 systemd[504]: install_db.service: Failed at step EXEC spawning /usr/bin/mysql-systemd-start: No such file or direct>
Jul 09 02:55:12 qemux86-64 systemd[1]: install_db.service: Main process exited, code=exited, status=203/EXEC
Jul 09 02:55:12 qemux86-64 systemd[1]: install_db.service: Failed with result 'exit-code'.
Jul 09 02:55:12 qemux86-64 systemd[1]: Failed to start Install MySQL Community Server Database.

The scripts required by install_db.service are packaged in
mariadb-server which depends on mariadb-setupdb already. So move the
scripts to mariadb-setupdb to make sure start install_db.service
successfully. And move creating user 'mysql' in mariadb-setupdb as well.
Packageconfig 'setupdb' has been useless from last upgrade, so remove it
at same time.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b7554ae2855483edc0a7d4c533d7d818bbc9e4f8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 71978740ba..5787ae4bd7 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -36,15 +36,15 @@ BINCONFIG_GLOB = "mysql_config"
 inherit cmake gettext binconfig update-rc.d useradd systemd multilib_script
 
 MULTILIB_SCRIPTS = "${PN}-server:${bindir}/mariadbd-safe \
-                    ${PN}-server:${bindir}/mariadb-install-db"
+                    ${PN}-setupdb:${bindir}/mariadb-install-db"
 
 INITSCRIPT_PACKAGES = "${PN}-server ${PN}-setupdb"
 INITSCRIPT_NAME_${PN}-server = "mysqld"
 INITSCRIPT_PARAMS_${PN}-server ?= "start 45 5 . stop 45 0 6 1 ."
 
-USERADD_PACKAGES = "${PN}-server"
-USERADD_PARAM_${PN}-server = "--system --home-dir /var/mysql -g mysql --shell /bin/false mysql"
-GROUPADD_PARAM_${PN}-server = "--system mysql"
+USERADD_PACKAGES = "${PN}-setupdb"
+USERADD_PARAM_${PN}-setupdb = "--system --home-dir /var/mysql -g mysql --shell /bin/false mysql"
+GROUPADD_PARAM_${PN}-setupdb = "--system mysql"
 
 INITSCRIPT_NAME_${PN}-setupdb = "install_db"
 INITSCRIPT_PARAMS_${PN}-setupdb ?= "defaults 44 44"
@@ -56,14 +56,18 @@ SYSTEMD_AUTO_ENABLE_${PN}-server ?= "disable"
 SYSTEMD_SERVICE_${PN}-setupdb = "install_db.service"
 SYSTEMD_AUTO_ENABLE_${PN}-setupdb ?= "enable"
 ALLOW_EMPTY_${PN}-setupdb ?= "1"
-FILES_${PN}-setupdb = "${sysconfdir}/init.d/install_db"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} setupdb"
+FILES_${PN}-setupdb = "${sysconfdir}/init.d/install_db \
+                       ${bindir}/mariadb-install-db \
+                       ${bindir}/my_print_defaults \
+                       ${bindir}/mysql_install_db \
+                       ${bindir}/mysql-systemd-start \
+                       "
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG_class-native = ""
 PACKAGECONFIG[pam] = ",-DWITHOUT_AUTH_PAM=TRUE,libpam"
 PACKAGECONFIG[valgrind] = "-DWITH_VALGRIND=TRUE,-DWITH_VALGRIND=FALSE,valgrind"
 PACKAGECONFIG[krb5] = ", ,krb5"
-PACKAGECONFIG[setupdb] = ", ,,${PN}-setupdb"
 PACKAGECONFIG[zstd] = "-DWITH_ROCKSDB_ZSTD=ON,-DWITH_ROCKSDB_ZSTD=OFF,zstd"
 
 # MariaDB doesn't link properly with gold
@@ -185,10 +189,10 @@ do_install() {
     fi
 }
 
-PACKAGES = "${PN}-dbg ${PN} \
+PACKAGES = "${PN}-dbg ${PN}-setupdb ${PN} \
     libmysqlclient-r libmysqlclient-r-dev libmysqlclient-r-staticdev \
     libmysqlclient libmysqlclient-dev libmysqlclient-staticdev \
-    libmysqld libmysqld-dev ${PN}-client ${PN}-server ${PN}-setupdb ${PN}-leftovers"
+    libmysqld libmysqld-dev ${PN}-client ${PN}-server ${PN}-leftovers"
 CONFFILES_${PN}-server += "${sysconfdir}/my.cnf ${sysconfdir}/my.cnf.d/server.cnf"
 CONFFILES_${PN}-client += "${sysconfdir}/my.cnf.d/mysql-clients.cnf"
 CONFFILES_libmysqlclient += "${sysconfdir}/my.cnf.d/client.cnf"
@@ -291,7 +295,6 @@ FILES_${PN}-server = "\
     ${bindir}/mysql_convert_table_format \
     ${bindir}/mariadb-convert-table-format \
     ${bindir}/mysql_install_db \
-    ${bindir}/mariadb-install-db \
     ${bindir}/mysql_secure_installation \
     ${bindir}/mariadb-secure-installation \
     ${bindir}/mysql_setpermission \
-- 
2.25.1

