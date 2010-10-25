Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1PAKDZ-0007Qq-UO
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 12:23:55 +0200
X-Envelope-From: sledz@dresearch.de
Received: from mobil-400-586.intern.dresearch.de
	(p57A229F5.dip0.t-ipconnect.de [87.162.41.245])
	(authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	o9P9tbd3015570
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Mon, 25 Oct 2010 11:55:37 +0200
Received: by mobil-400-586.intern.dresearch.de (Postfix, from userid 1000)
	id AEEB129EB4; Mon, 25 Oct 2010 11:55:36 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Oct 2010 11:55:24 +0200
Message-Id: <1288000524-18800-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <DB561678F08F554EB0D9F21B70E268A505AF5C@exchange.intern.dresearch.de>
References: <DB561678F08F554EB0D9F21B70E268A505AF5C@exchange.intern.dresearch.de>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
X-SA-Exim-Connect-IP: 192.109.42.8
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] epiphany-2.30.2: unbreak do_configure by setting ca-file path
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
X-List-Received-Date: Mon, 25 Oct 2010 10:23:56 -0000

* Disable existence check for ca-bundle file in configure.ac because
  it does not work in OE cross compile environment (location at build
  host may differ from location at target).
* Explicitely set ca-bundle file path according to the one used by
  ca-certificates package.

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/gnome/epiphany/ca-file-configure.patch |   17 +++++++++++++++++
 recipes/gnome/epiphany_2.30.2.bb               |    6 ++++--
 2 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100644 recipes/gnome/epiphany/ca-file-configure.patch

diff --git a/recipes/gnome/epiphany/ca-file-configure.patch b/recipes/gnome/epiphany/ca-file-configure.patch
new file mode 100644
index 0000000..b77d441
--- /dev/null
+++ b/recipes/gnome/epiphany/ca-file-configure.patch
@@ -0,0 +1,17 @@
+--- epiphany-2.30.2.orig/configure.ac	2010-10-25 11:10:31.316864572 +0200
++++ epiphany-2.30.2/configure.ac	2010-10-25 11:12:29.562614607 +0200
+@@ -272,9 +272,11 @@
+     fi
+ 
+     AC_MSG_RESULT($with_ca_file)
+-    if ! test -f "$with_ca_file"; then
+-        AC_MSG_ERROR([No such file '$with_ca_file'. Use --with-ca-file=path to set, or --without-ca-file to disable])
+-    fi
++# disable this check because it does not work in all environments
++# (location at build host may differ from target)
++#    if ! test -f "$with_ca_file"; then
++#        AC_MSG_ERROR([No such file '$with_ca_file'. Use --with-ca-file=path to set, or --without-ca-file to disable])
++#    fi
+     GTLS_SYSTEM_CA_FILE="$with_ca_file"
+ 
+     AC_DEFINE_UNQUOTED([GTLS_SYSTEM_CA_FILE], ["$GTLS_SYSTEM_CA_FILE"], [path to system Certificate Authority list])
diff --git a/recipes/gnome/epiphany_2.30.2.bb b/recipes/gnome/epiphany_2.30.2.bb
index 57a5d9a..5a0a5eb 100644
--- a/recipes/gnome/epiphany_2.30.2.bb
+++ b/recipes/gnome/epiphany_2.30.2.bb
@@ -3,15 +3,17 @@ LICENSE = "GPLv2+"
 DEPENDS = "libsoup-2.4 gnome-desktop gnome-vfs libgnomeui webkit-gtk iso-codes startup-notification ca-certificates"
 RDEPENDS_${PN} = "gnome-vfs-plugin-http iso-codes"
 RRECOMMENDS_${PN} = "ca-certificates"
-PR = "r4"
+PR = "r5"
 
 inherit gnome
 
+SRC_URI += " file://ca-file-configure.patch "
+
 SRC_URI[archive.md5sum] = "29b084acfa016540d91d3601ec3dff5c"
 SRC_URI[archive.sha256sum] = "cd0124e71e72142593cfeb442d58d97e99ba94ace6e31d94717fe977c0bfb98a"
 
 
-EXTRA_OECONF += "--disable-nss --with-engine=webkit --with-distributor-name=${DISTRO}"
+EXTRA_OECONF += "--disable-nss --with-engine=webkit --with-distributor-name=${DISTRO} --with-ca-file=/etc/ssl/certs/ca-certificates.crt"
 
 do_configure_prepend() {
         touch ${S}/gnome-doc-utils.make
-- 
1.7.1



