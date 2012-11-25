Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TcvbQ-0006Fg-1M
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 11:07:48 +0100
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 9919BCB2CB0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2012 18:25:38 +0100 (CET)
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 3CA54A62EE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2012 18:25:34 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Nov 2012 18:25:10 +0100
Message-Id: <1353864310-20097-7-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1353864310-20097-1-git-send-email-eric@eukrea.com>
References: <1353864310-20097-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 7/7] hiawatha: add CONFFILES and a php example
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Nov 2012 10:07:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

- add CONFFILES so that configuration files don't get overwritten
during upgrade
- add an example on how to launch php-cgi using php-fcgi

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb | 14 +++++++++++++=
-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb b/meta=
-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb
index 2e6955e..7dcbe9e 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_8.6.bb
@@ -4,6 +4,8 @@ LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa882=
bbe"
 DEPENDS =3D "libxml2 libxslt"
=20
+PR =3D "r1"
+
 SECTION =3D "net"
=20
 SRC_URI =3D "http://hiawatha-webserver.org/files/${PN}-${PV}.tar.gz \
@@ -36,10 +38,20 @@ EXTRA_OECMAKE =3D " -DENABLE_IPV6=3DOFF \
                   -DWORK_DIR=3D/var/lib/hiawatha "
=20
 do_install_append() {
-
     # Copy over init script and sed in the correct sbin path
     sed -i 's,sed_sbin_path,${sbindir},' ${WORKDIR}/hiawatha-init
     mkdir -p ${D}${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/hiawatha-init ${D}${sysconfdir}/init.d/hi=
awatha
=20
+    # configure php-fcgi to have a working configuration
+    # by default if php is installed
+    echo "Server =3D ${bindir}/php-cgi ; 2 ; 127.0.0.1:2005 ; nobody:nob=
ody ; ${sysconfdir}/php/hiawatha-php5/php.ini" >> ${D}${sysconfdir}/hiawa=
tha/php-fcgi.conf
 }
+
+CONFFILES_${PN} =3D " \
+    ${sysconfdir}/hiawatha/cgi-wrapper.conf \
+    ${sysconfdir}/hiawatha/hiawatha.conf \
+    ${sysconfdir}/hiawatha/index.xslt \
+    ${sysconfdir}/hiawatha/mimetype.conf \
+    ${sysconfdir}/hiawatha/php-fcgi.conf \
+    "
--=20
1.7.11.7



