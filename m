Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi1g-0001w5-EM
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:14:27 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377424eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=JerGqH888rAQkvYhPvnO9s0vM+NP+DTsgSIU2an7vDE=;
	b=x6KTZ+qUeBLlHBObx9YOM7v+TzoXecSJqmCqnP8tF8VN3ailXdYJB+unTEjMmKCWsB
	PAbaeQ54IzZtaYWB02n9Eu/Kvn34XFB9/5TE+7EIzNyJ+tPQnLgoPL4qA6ZiY9J+6UnC
	bUu2pFq1070Av+6+heSAGHaOfbB1S++bG3L/AJHAT+kIIO6EBoyYafZQKSnzxyBdJ2aA
	L3AwKfe2VmF+drWoydxVOYhHEgsVrRh0SeYcsRdDPQNUlrrAG7TgRRRDzW4IEBe34naZ
	mV1m71DNCfA8w9lXUNmbBUT2KewwBMZ0oktqDdByWINHyUvWEbDPsoqT1uZQid2s6GsR
	e7Wg==
Received: by 10.14.0.133 with SMTP id 5mr17083604eeb.29.1354586404629;
	Mon, 03 Dec 2012 18:00:04 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w3sm34820382eel.17.2012.12.03.18.00.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:00:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:36 +0100
Message-Id: <870d29f2ad7a441049f6d68d61f30a5fd0d03af6.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 03/58] vpnc: import from OE-classic
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
X-List-Received-Date: Tue, 04 Dec 2012 02:14:28 -0000

* needed for exalt
* fix LICENSE
* add LIC_FILES_CHKSUM
* .inc merged to .bb and cleaned files

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-connectivity/vpnc/vpnc/default.conf    |  19 +++
 .../recipes-connectivity/vpnc/vpnc/long-help       | 168 +++++++++++++++++++++
 .../recipes-connectivity/vpnc/vpnc/makeman.patch   |  11 ++
 .../vpnc/vpnc/vpnc-install.patch                   |  35 +++++
 .../recipes-connectivity/vpnc/vpnc_0.5.3.bb        |  30 ++++
 5 files changed, 263 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/vpnc/vpnc/default.conf
 create mode 100644 meta-networking/recipes-connectivity/vpnc/vpnc/long-help
 create mode 100644 meta-networking/recipes-connectivity/vpnc/vpnc/makeman.patch
 create mode 100644 meta-networking/recipes-connectivity/vpnc/vpnc/vpnc-install.patch
 create mode 100644 meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb

diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc/default.conf b/meta-networking/recipes-connectivity/vpnc/vpnc/default.conf
new file mode 100644
index 0000000..48b15ec
--- /dev/null
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc/default.conf
@@ -0,0 +1,19 @@
+# Comment out the options you need.
+# Verify your config with "vpnc --print-config".
+# You might also try "vpnc --long-help" or look into the documentation.
+
+# Needed (you will be prompted if this is missing):
+#IPSec gateway 10.1.2.3
+#IPSec ID YOURPEERSID
+#IPSec secret YOURPEERSSECRET
+#Xauth username YOURUSERNAME
+#Xauth password YOURPASSWORD
+
+# Optional:
+#UDP Encapsulate
+#UDP Encapsulation Port 10000
+#Noninteractive
+#No Detach
+#Debug 99
+#Interface name tun0
+#Script /etc/vpnc/vpnc-script
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc/long-help b/meta-networking/recipes-connectivity/vpnc/vpnc/long-help
new file mode 100644
index 0000000..fbec254
--- /dev/null
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc/long-help
@@ -0,0 +1,168 @@
+Usage: vpnc [--version] [--print-config] [--help] [--long-help] [options] [config files]
+
+Options:
+  --gateway <ip/hostname>
+      IP/name of your IPSec gateway
+  conf-variable: IPSec gateway <ip/hostname>
+
+  --id <ASCII string>
+      your group name
+  conf-variable: IPSec ID <ASCII string>
+
+  (configfile only option) 
+      your group password (cleartext)
+  conf-variable: IPSec secret <ASCII string>
+
+  (configfile only option) 
+      your group password (obfuscated)
+  conf-variable: IPSec obfuscated secret <hex string>
+
+  --username <ASCII string>
+      your username
+  conf-variable: Xauth username <ASCII string>
+
+  (configfile only option) 
+      your password (cleartext)
+  conf-variable: Xauth password <ASCII string>
+
+  (configfile only option) 
+      your password (obfuscated)
+  conf-variable: Xauth obfuscated password <hex string>
+
+  --domain <ASCII string>
+      (NT-) Domain name for authentication
+  conf-variable: Domain <ASCII string>
+
+  --xauth-inter 
+      enable interactive extended authentication (for challenge response auth)
+  conf-variable: Xauth interactive
+
+  --vendor <cisco/netscreen>
+      vendor of your IPSec gateway
+    Default: cisco
+  conf-variable: Vendor <cisco/netscreen>
+
+  --natt-mode <natt/none/force-natt/cisco-udp>
+      Which NAT-Traversal Method to use:
+       * natt -- NAT-T as defined in RFC3947
+       * none -- disable use of any NAT-T method
+       * force-natt -- always use NAT-T encapsulation even
+                       without presence of a NAT device
+                       (useful if the OS captures all ESP traffic)
+       * cisco-udp -- Cisco proprietary UDP encapsulation, commonly over Port 10000
+      Note: cisco-tcp encapsulation is not yet supported
+    Default: natt
+  conf-variable: NAT Traversal Mode <natt/none/force-natt/cisco-udp>
+
+  --script <command>
+      command is executed using system() to configure the interface,
+      routing and so on. Device name, IP, etc. are passed using enviroment
+      variables, see README. This script is executed right after ISAKMP is
+      done, but before tunneling is enabled. It is called when vpnc
+      terminates, too
+    Default: /etc/vpnc/vpnc-script
+  conf-variable: Script <command>
+
+  --dh <dh1/dh2/dh5>
+      name of the IKE DH Group
+    Default: dh2
+  conf-variable: IKE DH Group <dh1/dh2/dh5>
+
+  --pfs <nopfs/dh1/dh2/dh5/server>
+      Diffie-Hellman group to use for PFS
+    Default: server
+  conf-variable: Perfect Forward Secrecy <nopfs/dh1/dh2/dh5/server>
+
+  --enable-1des 
+      enables weak single DES encryption
+  conf-variable: Enable Single DES
+
+  --enable-no-encryption 
+      enables using no encryption for data traffic (key exchanged must be encrypted)
+  conf-variable: Enable no encryption
+
+  --application-version <ASCII string>
+      Application Version to report. Note: Default string is generated at runtime.
+    Default: Cisco Systems VPN Client 0.5.3-394:Linux
+  conf-variable: Application version <ASCII string>
+
+  --ifname <ASCII string>
+      visible name of the TUN/TAP interface
+  conf-variable: Interface name <ASCII string>
+
+  --ifmode <tun/tap>
+      mode of TUN/TAP interface:
+       * tun: virtual point to point interface (default)
+       * tap: virtual ethernet interface
+    Default: tun
+  conf-variable: Interface mode <tun/tap>
+
+  --debug <0/1/2/3/99>
+      Show verbose debug messages
+       *  0: Do not print debug information.
+       *  1: Print minimal debug information.
+       *  2: Show statemachine and packet/payload type information.
+       *  3: Dump everything exluding authentication data.
+       * 99: Dump everything INCLUDING AUTHENTICATION data (e.g. PASSWORDS).
+  conf-variable: Debug <0/1/2/3/99>
+
+  --no-detach 
+      Don't detach from the console after login
+  conf-variable: No Detach
+
+  --pid-file <filename>
+      store the pid of background process in <filename>
+    Default: /var/run/vpnc/pid
+  conf-variable: Pidfile <filename>
+
+  --local-addr <ip/hostname>
+      local IP to use for ISAKMP / ESP / ... (0.0.0.0 == automatically assign)
+    Default: 0.0.0.0
+  conf-variable: Local Addr <ip/hostname>
+
+  --local-port <0-65535>
+      local ISAKMP port number to use (0 == use random port)
+    Default: 500
+  conf-variable: Local Port <0-65535>
+
+  --udp-port <0-65535>
+      Local UDP port number to use (0 == use random port).
+      This is only relevant if cisco-udp nat-traversal is used.
+      This is the _local_ port, the remote udp port is discovered automatically.
+      It is especially not the cisco-tcp port.
+    Default: 10000
+  conf-variable: Cisco UDP Encapsulation Port <0-65535>
+
+  --dpd-idle <0,10-86400>
+      Send DPD packet after not receiving anything for <idle> seconds.
+      Use 0 to disable DPD completely (both ways).
+    Default: 300
+  conf-variable: DPD idle timeout (our side) <0,10-86400>
+
+  --non-inter 
+      Don't ask anything, exit on missing options
+  conf-variable: Noninteractive
+
+  --auth-mode <psk/cert/hybrid>
+      Authentication mode:
+       * psk:    pre-shared key (default)
+       * cert:   server + client certificate (not implemented yet)
+       * hybrid: server certificate + xauth (if built with openssl support)
+    Default: psk
+  conf-variable: IKE Authmode <psk/cert/hybrid>
+
+  --ca-file <filename>
+      filename and path to the CA-PEM-File
+  conf-variable: CA-File <filename>
+
+  --ca-dir <directory>
+      path of the trusted CA-Directory
+    Default: /etc/ssl/certs
+  conf-variable: CA-Dir <directory>
+
+  --target-network <target network/netmask>
+      Target network in dotted decimal or CIDR notation
+    Default: 0.0.0.0/0.0.0.0
+  conf-variable: IPSEC target network <target network/netmask>
+
+Report bugs to vpnc@unix-ag.uni-kl.de
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc/makeman.patch b/meta-networking/recipes-connectivity/vpnc/vpnc/makeman.patch
new file mode 100644
index 0000000..f394e6a
--- /dev/null
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc/makeman.patch
@@ -0,0 +1,11 @@
+--- vpnc-0.5.1/makeman.pl.old	2008-03-16 02:17:59.000000000 -0500
++++ vpnc-0.5.1/makeman.pl	2008-03-16 02:29:34.000000000 -0500
+@@ -29,7 +29,7 @@ my $vpnc = './vpnc';
+ # indenting lists (those originally starting with an asterisk). I hope
+ # this pays off when converting the manpage to HTML or such.
+ 
+-open my $LONGHELP, '-|', "$vpnc --long-help";
++open my $LONGHELP, '-|', "cat ../long-help";
+ my $vpnc_options    = '';
+ my $relative_indent = 0;
+ my $indent_needed   = 0;
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc/vpnc-install.patch b/meta-networking/recipes-connectivity/vpnc/vpnc/vpnc-install.patch
new file mode 100644
index 0000000..3de65ec
--- /dev/null
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc/vpnc-install.patch
@@ -0,0 +1,35 @@
+--- a/Makefile~	2009-01-20 18:44:30.000000000 +0100
++++ b/Makefile	2009-01-20 18:44:30.000000000 +0100
+@@ -119,21 +119,21 @@
+ 	else \
+ 		install vpnc-script $(DESTDIR)$(ETCDIR); \
+ 	fi
+-	install -m600 vpnc.conf $(DESTDIR)$(ETCDIR)/default.conf
+-	install -m755 vpnc-disconnect $(DESTDIR)$(SBINDIR)
+-	install -m755 pcf2vpnc $(DESTDIR)$(BINDIR)
+-	install -m644 vpnc.8 $(DESTDIR)$(MANDIR)/man8
+-	install -m644 pcf2vpnc.1 $(DESTDIR)$(MANDIR)/man1
+-	install -m644 cisco-decrypt.1 $(DESTDIR)$(MANDIR)/man1
+-	install -m644 COPYING $(DESTDIR)$(DOCDIR)
++	install -m 600 vpnc.conf $(DESTDIR)$(ETCDIR)/default.conf
++	install -m 755 vpnc-disconnect $(DESTDIR)$(SBINDIR)
++	install -m 755 pcf2vpnc $(DESTDIR)$(BINDIR)
++	install -m 644 vpnc.8 $(DESTDIR)$(MANDIR)/man8
++	install -m 644 pcf2vpnc.1 $(DESTDIR)$(MANDIR)/man1
++	install -m 644 cisco-decrypt.1 $(DESTDIR)$(MANDIR)/man1
++	install -m 644 COPYING $(DESTDIR)$(DOCDIR)
+ 
+ install : install-common
+-	install -m755 vpnc $(DESTDIR)$(SBINDIR)
+-	install -m755 cisco-decrypt $(DESTDIR)$(BINDIR)
++	install -m 755 vpnc $(DESTDIR)$(SBINDIR)
++	install -m 755 cisco-decrypt $(DESTDIR)$(BINDIR)
+ 
+ install-strip : install-common
+-	install -s -m755 vpnc $(DESTDIR)$(SBINDIR)
+-	install -s -m755 cisco-decrypt $(DESTDIR)$(BINDIR)
++	install -s -m 755 vpnc $(DESTDIR)$(SBINDIR)
++	install -s -m 755 cisco-decrypt $(DESTDIR)$(BINDIR)
+ 
+ uninstall :
+ 	rm -f $(DESTDIR)$(SBINDIR)/vpnc \
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
new file mode 100644
index 0000000..1b2b8bf
--- /dev/null
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "A client for the Cisco3000 VPN Concentrator"
+HOMEPAGE = "http://www.unix-ag.uni-kl.de/~massar/vpnc/"
+AUTHOR = "Maurice Massar vpnc@unix-ag.uni-kl.de"
+SECTION = "console/network"
+PRIORITY = "optional"
+LICENSE = "GPL-2.0+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=173b74cb8ac640a9992c03f3bce22a33"
+DEPENDS = "libgcrypt"
+RDEPENDS_${PN} = "kernel-module-tun"
+
+CFLAGS_append = ' -DVERSION=\\"${PV}\\"'
+LDFLAGS_append = " -lgcrypt -lgpg-error"
+
+do_install () {
+	sed -i s:m600:m\ 600:g Makefile	
+	oe_runmake 'DESTDIR=${D}' 'PREFIX=/usr' install
+	rm -f ${D}${sysconfdir}/vpnc/vpnc.conf #This file is useless
+	install ${WORKDIR}/default.conf ${D}${sysconfdir}/vpnc/default.conf
+}
+
+CONFFILES_${PN} = "${sysconfdir}/vpnc/default.conf"
+
+SRC_URI = "http://www.unix-ag.uni-kl.de/~massar/vpnc/vpnc-${PV}.tar.gz \
+           file://makeman.patch \
+           file://vpnc-install.patch \
+           file://long-help \
+           file://default.conf"
+
+SRC_URI[md5sum] = "4378f9551d5b077e1770bbe09995afb3"
+SRC_URI[sha256sum] = "46cea3bd02f207c62c7c6f2f22133382602baeda1dc320747809e94881414884"
-- 
1.8.0



