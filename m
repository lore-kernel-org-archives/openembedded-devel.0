Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 61A9A7601F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jun 2018 06:45:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="40748367"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Jun 2018 14:45:06 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 47AC34B41E7C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jun 2018 14:45:02 +0800 (CST)
Received: from localhost.localdomain (10.167.225.27) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 5 Jun 2018 14:45:02 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 26 May 2018 14:36:00 -0700
Message-ID: <1527370560-622-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.27]
X-yoursite-MailScanner-ID: 47AC34B41E7C.AC2B8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] samba:Deleted config for lsb, since this part has been deleted from samba upstream.
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
X-List-Received-Date: Tue, 05 Jun 2018 06:45:09 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../recipes-connectivity/samba/samba_4.7.6.bb      | 25 ++++++++--------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.7.6.bb b/meta-networking/recipes-connectivity/samba/samba_4.7.6.bb
index a8517c5..b570e4b 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.7.6.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.7.6.bb
@@ -46,8 +46,6 @@ DEPENDS_append_libc-musl = " libtirpc"
 CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
 LDFLAGS_append_libc-musl = " -ltirpc"
 
-LSB = ""
-LSB_linuxstdbase = "lsb"
 
 INITSCRIPT_NAME = "samba"
 INITSCRIPT_PARAMS = "start 20 3 5 . stop 20 0 1 6 ."
@@ -68,7 +66,6 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd zeroconf', d)}
                    acl ad-dc cups gnutls ldap mitkrb5 \
 "
 
-RDEPENDS_${PN}-base += "${LSB}"
 RDEPENDS_${PN}-ctdb-tests += "bash util-linux-getopt"
 
 PACKAGECONFIG[acl] = "--with-acl-support,--without-acl-support,acl"
@@ -150,19 +147,15 @@ do_install_append() {
     install -m644 packaging/systemd/samba.conf.tmp ${D}${sysconfdir}/tmpfiles.d/samba.conf
     echo "d ${localstatedir}/log/samba 0755 root root -" \
         >> ${D}${sysconfdir}/tmpfiles.d/samba.conf
-    if [ "${LSB}" = "lsb" ]; then
-        install -d ${D}${sysconfdir}/init.d
-        install -m 0755 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d/samba
-    else
-        install -d ${D}${sysconfdir}/init.d
-        install -m 0755 packaging/sysv/samba.init ${D}${sysconfdir}/init.d/samba
-        sed -e 's,/opt/samba/bin,${sbindir},g' \
-            -e 's,/opt/samba/smb.conf,${sysconfdir}/samba/smb.conf,g' \
-            -e 's,/opt/samba/log,${localstatedir}/log/samba,g' \
-            -e 's,/etc/init.d/samba.server,${sysconfdir}/init.d/samba,g' \
-            -e 's,/usr/bin,${base_bindir},g' \
-            -i ${D}${sysconfdir}/init.d/samba
-    fi
+        
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 packaging/sysv/samba.init ${D}${sysconfdir}/init.d/samba
+    sed -e 's,/opt/samba/bin,${sbindir},g' \
+        -e 's,/opt/samba/smb.conf,${sysconfdir}/samba/smb.conf,g' \
+        -e 's,/opt/samba/log,${localstatedir}/log/samba,g' \
+        -e 's,/etc/init.d/samba.server,${sysconfdir}/init.d/samba,g' \
+        -e 's,/usr/bin,${base_bindir},g' \
+        -i ${D}${sysconfdir}/init.d/samba 
 
     install -d ${D}${sysconfdir}/samba
     echo "127.0.0.1 localhost" > ${D}${sysconfdir}/samba/lmhosts
-- 
1.9.1




