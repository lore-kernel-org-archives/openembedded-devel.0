Received: from [212.227.126.188] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <christian@poessinger.com>) id 1LiCwE-0003gx-Ln
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 20:20:58 +0100
Received: from tardis (vpn-001.wueI.gefoekom.org [194.145.151.130])
	by mrelayeu.kundenserver.de (node=mreu1) with ESMTP (Nemesis)
	id 0MKv1o-1LiCvp3l70-000jR6; Fri, 13 Mar 2009 20:20:35 +0100
From: =?iso-8859-1?Q?Christian_P=F6ssinger?= <christian@poessinger.com>
To: <openembedded-devel@lists.openembedded.org>
References: <000801c99992$45c23440$d1469cc0$@com>	<87myc57vz3.fsf@neumann.lab.ossystems.com.br>	<000401c99f26$ddb43c00$991cb400$@com>	<be7a9f3d0903090954m72f9cafbw8f03af0906bf74ca@mail.gmail.com>	<001401c9a335$eec4f850$cc4ee8f0$@com>
	<20090312185731.GB1109@denix.org>
In-Reply-To: <20090312185731.GB1109@denix.org>
Date: Fri, 13 Mar 2009 20:20:30 +0100
Message-ID: <000501c9a410$c7f03510$57d09f30$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcmjSCFkctZjNbPcQzWj3mS/5t06KQAyF1bg
X-Provags-ID: V01U2FsdGVkX19JrzxNzenvSNPRjL6TRe93UHxRhbHvNMdXt52
	nFKrZPWiVnULENKxaVhwWOX1LkVXE3zXG0AVzjk68STSN7L+GZ
	knIJZ/le5gJAQ4AaL3RDVyPOsPFJ7suPIk6m0JJYvJjuVPTOq+ CCA==
Subject: Re: [PATCH] Added new recipe for a newer version of the	Asterisk Soft-PBX
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
X-List-Received-Date: Fri, 13 Mar 2009 19:20:59 -0000
X-Groupsio-MsgNum: 8426
Content-Language: de
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=SHA1; boundary="----=_NextPart_000_0000_01C9A419.271428A0"

------=_NextPart_000_0000_01C9A419.271428A0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Denys Dmytriyenko on March 12, 2009 7:58 PM wrote:
> 
> The checksums.ini patch is not correct:
> 1. the closing square bracket is misplaced
> 2. the entry is not sorted (use contrib/source-checker/oe-checksums-
> sorter.py)
> 

Hopefully this is now my last attempt.

---
 conf/checksums.ini                                 |    4 +
 packages/asterisk/asterisk-1.4.23.1/Makefile.patch |   21 +++
 packages/asterisk/asterisk-1.4.23.1/init           |   77 +++++++++
 packages/asterisk/asterisk-1.4.23.1/logrotate      |   12 ++
 .../asterisk/asterisk-1.4.23.1/sounds.xml.patch    |   19 +++
 packages/asterisk/asterisk-1.4.23.1/volatiles      |    7 +
 packages/asterisk/asterisk_1.4.23.1.bb             |  165
++++++++++++++++++++
 7 files changed, 305 insertions(+), 0 deletions(-)
 create mode 100644 packages/asterisk/asterisk-1.4.23.1/Makefile.patch
 create mode 100644 packages/asterisk/asterisk-1.4.23.1/init
 create mode 100644 packages/asterisk/asterisk-1.4.23.1/logrotate
 create mode 100644 packages/asterisk/asterisk-1.4.23.1/sounds.xml.patch
 create mode 100644 packages/asterisk/asterisk-1.4.23.1/volatiles
 create mode 100644 packages/asterisk/asterisk_1.4.23.1.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 9d578c1..463c58b 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -1754,6 +1754,10 @@
sha256=85331e63c90370c305121f134358e76cbb06846a12c04a7825d5869f331ee00d
 md5=3b416557d2c395a36b97a819812e99b0
 sha256=2bcc5d5620f8533eb4300ba1b48c9d2a00092ce04588e32f7074cf2aadc34259

+[http://downloads.digium.com/pub/asterisk/releases/asterisk-1.4.23.1.tar.gz
]
+md5=4788954a93f5fbf78e55e2aa6e03329f
+sha256=03e2cf43ffe9935d56fa0ea3663fc9bd23ce9720682c79d6269e78a9a1629d63
+
 
[http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-core-sou
nds-en-alaw-1.4.8.tar.gz]
 md5=e708a5510a61217725b6ad663287dfa0
 sha256=5d5c305079eb9918d271fad28ac73248a7d2962347dbd80d16aac66fe35e2729
diff --git a/packages/asterisk/asterisk-1.4.23.1/Makefile.patch
b/packages/asterisk/asterisk-1.4.23.1/Makefile.patch
new file mode 100644
index 0000000..98345f4
--- /dev/null
+++ b/packages/asterisk/asterisk-1.4.23.1/Makefile.patch
@@ -0,0 +1,21 @@
+diff -Nurd asterisk-1.4.23.1.orig/Makefile asterisk-1.4.23.1/Makefile
+--- asterisk-1.4.23.1.orig/Makefile    2008-11-29 17:58:29.000000000 +0100
++++ asterisk-1.4.23.1/Makefile 2009-02-25 11:17:22.000000000 +0100
+@@ -125,7 +125,7 @@
+   ASTSBINDIR=$(sbindir)
+   ASTSPOOLDIR=$(localstatedir)/spool/asterisk
+   ASTLOGDIR=$(localstatedir)/log/asterisk
+-  ASTVARRUNDIR=$(localstatedir)/run
++  ASTVARRUNDIR=$(localstatedir)/run/asterisk
+   ASTMANDIR=$(mandir)
+ ifneq ($(findstring BSD,$(OSARCH)),)
+   ASTVARLIBDIR=$(prefix)/share/asterisk
+@@ -513,7 +513,7 @@
+       @exit 1
+ endif
+
+-install: badshell datafiles bininstall
++install: badshell datafiles bininstall samples
+       @if [ -x /usr/sbin/asterisk-post-install ]; then \
+               /usr/sbin/asterisk-post-install $(DESTDIR) . ; \
+       fi
diff --git a/packages/asterisk/asterisk-1.4.23.1/init
b/packages/asterisk/asterisk-1.4.23.1/init
new file mode 100644
index 0000000..d53a9a1
--- /dev/null
+++ b/packages/asterisk/asterisk-1.4.23.1/init
@@ -0,0 +1,77 @@
+#! /bin/sh
+#
+# This is an init script for openembedded
+# Copy it to /etc/init.d/callweaver and type
+# > update-rc.d asterisk defaults 60
+#
+asterisk=/usr/sbin/asterisk
+pidfile=/var/run/asterisk/asterisk.pid
+asterisk_args="-npqT -U asterisk -G asterisk"
+
+test -x "$asterisk" || exit 0
+
+case "$1" in
+  start)
+    echo -n "Starting Asterisk"
+    start-stop-daemon --start --quiet --exec $asterisk -- $asterisk_args
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping Asterisk"
+    $asterisk -rx "stop gracefully"
+    sleep 4
+    if [ -f $pidfile ]; then
+      start-stop-daemon --stop --quiet --pidfile $pidfile
+    fi
+    echo "."
+    ;;
+  force-stop)
+    echo -n "Stopping Asterisk"
+    $asterisk -rx "stop now"
+    sleep 2
+    if [ -f $pidfile ]; then
+      start-stop-daemon --stop --quiet --pidfile $pidfile
+    fi
+    echo "."
+    ;;
+  restart)
+    echo -n "Restarting Asterisk"
+    if [ -f $pidfile ]; then
+      $asterisk -rx "restart gracefully"
+      sleep 2
+    else
+      start-stop-daemon --start --quiet --exec $asterisk -- $asterisk_args
+    fi
+    echo "."
+    ;;
+  force-restart)
+    echo -n "Forcibly Restarting Asterisk"
+    if [ -f $pidfile ]; then
+      $asterisk -rx "restart now"
+      sleep 2
+    else
+      start-stop-daemon --start --quiet --exec $asterisk -- $asterisk_args
+    fi
+    echo "."
+    ;;
+  reload)
+    echo -n "Reloading Asterisk Configuration"
+    if [ -f $pidfile ]; then
+      $asterisk -rx "reload"
+    else
+      start-stop-daemon --start --quiet --exec $asterisk -- $asterisk_args
+    fi
+    echo "."
+    ;;
+  logger-reload)
+    if [ -f $pidfile ]; then
+      $asterisk -rx "logger reload"
+    fi
+    ;;
+  *)
+    echo "Usage: /etc/init.d/asterisk
{start|stop|force-stop|restart|force-restart|reload|logger-reload}"
+    exit 1
+esac
+
+exit 0
+
diff --git a/packages/asterisk/asterisk-1.4.23.1/logrotate
b/packages/asterisk/asterisk-1.4.23.1/logrotate
new file mode 100644
index 0000000..dfd25ee
--- /dev/null
+++ b/packages/asterisk/asterisk-1.4.23.1/logrotate
@@ -0,0 +1,12 @@
+/var/log/asterisk/cdr-csv/Master.csv
/var/log/asterisk/cdr-custom/Master.csv /var/log/asterisk/queue_log
/var/log/asterisk/event_log /var/log/asterisk/messages {
+    daily
+    missingok
+    compress
+    delaycompress
+    rotate 30
+    sharedscripts
+    postrotate
+      /etc/init.d/asterisk logger-reload
+    endscript
+}
+
diff --git a/packages/asterisk/asterisk-1.4.23.1/sounds.xml.patch
b/packages/asterisk/asterisk-1.4.23.1/sounds.xml.patch
new file mode 100644
index 0000000..2a02bf6
--- /dev/null
+++ b/packages/asterisk/asterisk-1.4.23.1/sounds.xml.patch
@@ -0,0 +1,19 @@
+diff -Nurd asterisk-1.4.23.1.orig/sounds/sounds.xml
asterisk-1.4.23.1/sounds/sounds.xml
+--- asterisk-1.4.23.1.orig/sounds/sounds.xml   2006-10-25
19:08:58.000000000 +0200
++++ asterisk-1.4.23.1/sounds/sounds.xml        2009-02-25
11:19:13.000000000 +0100
+@@ -6,7 +6,6 @@
+               <member name="CORE-SOUNDS-EN-ALAW" displayname="English,
a-Law format">
+               </member>
+               <member name="CORE-SOUNDS-EN-GSM" displayname="English, GSM
format" >
+-                      <defaultenabled>yes</defaultenabled>
+               </member>
+               <member name="CORE-SOUNDS-EN-G729" displayname="English,
G.729 format">
+               </member>
+@@ -39,7 +38,6 @@
+       </category>
+       <category name="MENUSELECT_MOH" displayname="Music On Hold File
Packages" positive_output="yes">
+               <member name="MOH-FREEPLAY-WAV" displayname="FreePlay Music
On Hold Files, WAV format" >
+-                      <defaultenabled>yes</defaultenabled>
+               </member>
+               <member name="MOH-FREEPLAY-ULAW" displayname="FreePlay Music
On Hold Files, mu-Law format" >
+               </member>
diff --git a/packages/asterisk/asterisk-1.4.23.1/volatiles
b/packages/asterisk/asterisk-1.4.23.1/volatiles
new file mode 100644
index 0000000..c68e786
--- /dev/null
+++ b/packages/asterisk/asterisk-1.4.23.1/volatiles
@@ -0,0 +1,7 @@
+d asterisk asterisk 0775 /var/run/asterisk none
+d asterisk asterisk 0775 /var/lib/asterisk none
+d asterisk asterisk 0775 /var/log/asterisk none
+d asterisk asterisk 0775 /var/log/asterisk/cdr-csv none
+d asterisk asterisk 0775 /var/log/asterisk/cdr-custom none
+d asterisk asterisk 0775 /var/spool/asterisk/outgoing none
+d asterisk asterisk 0775 /var/spool/asterisk/voicemail none
diff --git a/packages/asterisk/asterisk_1.4.23.1.bb
b/packages/asterisk/asterisk_1.4.23.1.bb
new file mode 100644
index 0000000..f9f8399
--- /dev/null
+++ b/packages/asterisk/asterisk_1.4.23.1.bb
@@ -0,0 +1,165 @@
+# Copyright (C) 2007-2008, Stelios Koroneos - Digital OPSiS, All Rights
Reserved
+# Released under the MIT license (see packages/COPYING)
+DESCRIPTION = "The Asterisk open source software PBX"
+HOMEPAGE = "http://www.asterisk.org"
+LICENSE = "GPLv2"
+PRIORITY = "optional"
+SECTION = "console/telephony"
+DEPENDS = "speex readline zlib openssl curl popt gnutls sqlite libogg
libvorbis"
+#RRECOMMENDS_${PN} = "logrotate"
+
+SRC_URI="http://downloads.digium.com/pub/asterisk/releases/asterisk-${PV}.t
ar.gz \
+       file://sounds.xml.patch;patch=1 \
+       file://Makefile.patch;patch=1 \
+       file://logrotate \
+       file://volatiles \
+       file://init"
+
+ARCH_efika="powerpc"
+ARCH_dht-walnut="powerpc"
+ARCH_magicbox="powerpc"
+ARCH_sequoia="powerpc"
+
+INITSCRIPT_NAME = "asterisk"
+INITSCRIPT_PARAMS = "defaults 60"
+
+inherit autotools update-rc.d
+
+EXTRA_OECONF =  "--with-ssl=${STAGING_EXECPREFIXDIR} \
+                       --with-z=${STAGING_EXECPREFIXDIR} \
+                       --with-curl=${STAGING_EXECPREFIXDIR} \
+                       --with-termcap=${STAGING_EXECPREFIXDIR} \
+                       --with-ogg=${STAGING_EXECPREFIXDIR} \
+                       --with-vorbis=${STAGING_EXECPREFIXDIR} \
+                       --with-sqlite=${STAGING_EXECPREFIXDIR} \
+                       --with-popt=${STAGING_EXECPREFIXDIR} \
+                       --with-gnutls=${STAGING_EXECPREFIXDIR} \
+                       --without-curses\
+                       --with-ncurses=${STAGING_EXECPREFIXDIR} \
+                       --without-imap\
+                       --without-netsnmp\
+                       --without-odbc\
+                       --without-osptk\
+                       --without-nbs\
+                       --without-pwlib\
+                       --without-radius\
+                       --without-tds\
+                       --without-postgres\
+                       --without-zaptel\
+                       "
+
+#export NOISY_BUILD=yes
+
+export ASTCFLAGS = "-fsigned-char -I${STAGING_INCDIR} -DPATH_MAX=4096"
+export ASTLDFLAGS="${LDFLAGS} -lpthread -ldl -lresolv "
+export PROC="${ARCH}"
+
+do_configure_prepend () {
+       sed -i 's:/var:${localstatedir}:' ${WORKDIR}/logrotate
+       sed -i 's:/etc/init.d:${sysconfdir}/init.d:' ${WORKDIR}/logrotate
+       sed -i 's:/var:${localstatedir}:' ${WORKDIR}/volatiles
+}
+
+do_configure () {
+       # Looks like rebuilding configure doesn't work, so we are skipping
+       # that and are just using the shipped one
+       # gnu-configize
+       # libtoolize --force
+       oe_runconf
+}
+
+
+do_compile() {
+        (
+         #make sure that menuselect gets build using host toolchain
+         unset CC LD CXX CCLD CFLAGS CPPFLAGS LDFLAGS CXXFLAGS RANLIB
+         cd menuselect
+         ./configure
+         oe_runmake
+         cd ../
+        ) || exit 1
+        oe_runmake
+}
+
+do_install_append() {
+        install -d ${D}${sysconfdir}/init.d/
+       install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/asterisk
+       install -c -D -m 644 ${WORKDIR}/logrotate
${D}${sysconfdir}/logrotate.d/asterisk
+       install -c -D -m 644 ${WORKDIR}/volatiles
${D}${sysconfdir}/default/volatiles/asterisk
+}
+
+pkg_postinst_prepend() {
+       grep -q asterisk  ${sysconfdir}/group || addgroup --system asterisk
+       grep -q asterisk ${sysconfdir}/passwd || adduser --system --home
${localstatedir}/run/asterisk --no-create-home --disabled-password --ingroup
asterisk -s ${base_bindir}/false asterisk
+       chown -R asterisk:asterisk ${libdir}/asterisk
${localstatedir}/lib/asterisk ${localstatedir}/spool/asterisk
${localstatedir}/log/asterisk ${localstatedir}/run/asterisk
${sysconfdir}/asterisk
+}
+
+do_stage() {
+        autotools_stage_all
+}
+
+FILES_${PN} += "${libdir}/asterisk/modules/*"
+FILES_${PN}-dbg += "${libdir}/asterisk/modules/.debug \
+                    ${localstatedir}/lib/asterisk/*/.debug"
+
+CONFFILES_${PN} += "${sysconfdir}/asterisk/adsi.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/adtranvofr.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/agents.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/alarmreceiver.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/alsa.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/amd.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/asterisk.adsi"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/asterisk.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr_custom.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr_manager.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr_odbc.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr_pgsql.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/cdr_tds.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/codecs.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/dnsmgr.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/dundi.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/enum.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/extconfig.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/extensions.ael"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/extensions.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/features.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/festival.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/followme.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/func_odbc.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/gtalk.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/h323.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/http.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/iax.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/iaxprov.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/indications.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/jabber.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/logger.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/manager.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/meetme.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/mgcp.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/misdn.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/modules.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/musiconhold.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/muted.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/osp.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/oss.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/phone.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/privacy.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/queues.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/res_odbc.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/res_snmp.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/rpt.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/rtp.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/say.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/sip.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/sip_notify.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/skinny.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/sla.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/smdi.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/telcordia-1.adsi"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/udptl.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/users.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/voicemail.conf"
+CONFFILES_${PN} += "${sysconfdir}/asterisk/vpb.conf"
+CONFFILES_${PN} += "${sysconfdir}/logrotate.d/asterisk"
--
1.5.4.3

------=_NextPart_000_0000_01C9A419.271428A0
Content-Type: application/x-pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIILgTCCA1ww
ggLFoAMCAQICAgPpMA0GCSqGSIb3DQEBBAUAMIG8MQswCQYDVQQGEwJERTEQMA4GA1UECBMHSGFt
YnVyZzEQMA4GA1UEBxMHSGFtYnVyZzE6MDgGA1UEChMxVEMgVHJ1c3RDZW50ZXIgZm9yIFNlY3Vy
aXR5IGluIERhdGEgTmV0d29ya3MgR21iSDEiMCAGA1UECxMZVEMgVHJ1c3RDZW50ZXIgQ2xhc3Mg
MSBDQTEpMCcGCSqGSIb3DQEJARYaY2VydGlmaWNhdGVAdHJ1c3RjZW50ZXIuZGUwHhcNOTgwMzA5
MTE1OTU5WhcNMTEwMTAxMTE1OTU5WjCBvDELMAkGA1UEBhMCREUxEDAOBgNVBAgTB0hhbWJ1cmcx
EDAOBgNVBAcTB0hhbWJ1cmcxOjA4BgNVBAoTMVRDIFRydXN0Q2VudGVyIGZvciBTZWN1cml0eSBp
biBEYXRhIE5ldHdvcmtzIEdtYkgxIjAgBgNVBAsTGVRDIFRydXN0Q2VudGVyIENsYXNzIDEgQ0Ex
KTAnBgkqhkiG9w0BCQEWGmNlcnRpZmljYXRlQHRydXN0Y2VudGVyLmRlMIGfMA0GCSqGSIb3DQEB
AQUAA4GNADCBiQKBgQCwKeu0drOu17ZbtF7nveOxnEkEV1uhq9l/Exv9umGr2Odx3y0AlF1RSH0j
73VihJA8Ch9ZEXQvjoCl/TACPSlSzXIaSSGcvMtSjkihY5bIEIUwaVd0RcBahsbVPeBoV30xaiSN
RZc+MX5oZjJuJG3sMjbJQcrwMUTIo2HKG6A2HwIDAQABo2swaTAPBgNVHRMBAf8EBTADAQH/MA4G
A1UdDwEB/wQEAwIBhjAzBglghkgBhvhCAQgEJhYkaHR0cDovL3d3dy50cnVzdGNlbnRlci5kZS9n
dWlkZWxpbmVzMBEGCWCGSAGG+EIBAQQEAwIABzANBgkqhkiG9w0BAQQFAAOBgQBPmVmFyGRWgsVv
PdhGCS88UcGncFiBkhLq9NQWAJZecijn1jZfGpyvH8KDGrQFVZmmWFw3KPJXHutdv7HTRQ9yHAPS
AMcsVdr+X4l2i+LUd/VNCRevxLqrMCtPuB3q2f9Z8FB0Rrpe6jaw65J7D1jaMuFSvSM3D/XzAEqu
sF7ebjCCA+wwggNVoAMCAQICDwDENwABAALlou1Djx5XszANBgkqhkiG9w0BAQUFADCBvDELMAkG
A1UEBhMCREUxEDAOBgNVBAgTB0hhbWJ1cmcxEDAOBgNVBAcTB0hhbWJ1cmcxOjA4BgNVBAoTMVRD
IFRydXN0Q2VudGVyIGZvciBTZWN1cml0eSBpbiBEYXRhIE5ldHdvcmtzIEdtYkgxIjAgBgNVBAsT
GVRDIFRydXN0Q2VudGVyIENsYXNzIDEgQ0ExKTAnBgkqhkiG9w0BCQEWGmNlcnRpZmljYXRlQHRy
dXN0Y2VudGVyLmRlMB4XDTA3MDkyNjA3MjQwOVoXDTEwMTIzMTIyNTk1OVowfTELMAkGA1UEBhMC
REUxHDAaBgNVBAoTE1RDIFRydXN0Q2VudGVyIEdtYkgxJTAjBgNVBAsTHFRDIFRydXN0Q2VudGVy
IENsYXNzIDEgTDEgQ0ExKTAnBgNVBAMTIFRDIFRydXN0Q2VudGVyIENsYXNzIDEgTDEgQ0EgSUlJ
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDt9kYre5b9JKbNj5LffhGsiGlfobkfluO2XqPL
zKoMOnduw9+sfHUINrW76Y9B02KC9vF3SDmxbIM4fKM3+7k/dKzb0zI4w66PBHx+5CqeykhMm8sQ
aI4EpOUu7tWVfH8ZGHT9UpbVG17+Gi4znxxb/T9+IuB2Q/qr0ZJ5tR/7hwIDAQABo4IBLDCCASgw
VwYIKwYBBQUHAQEESzBJMEcGCCsGAQUFBzAChjtodHRwOi8vd3d3LnRydXN0Y2VudGVyLmRlL2Nl
cnRzZXJ2aWNlcy9jYWNlcnRzL3RjY2xhc3MxLmNydDASBgNVHRMBAf8ECDAGAQH/AgEAMEoGA1Ud
IARDMEEwPwYJKoIUACwBAQEBMDIwMAYIKwYBBQUHAgEWJGh0dHA6Ly93d3cudHJ1c3RjZW50ZXIu
ZGUvZ3VpZGVsaW5lczAOBgNVHQ8BAf8EBAMCAQYwHQYDVR0OBBYEFP2u3ZGgztA5KkvvKMwSnk9+
FKp1MD4GA1UdHwQ3MDUwM6AxoC+GLWh0dHA6Ly93d3cudHJ1c3RjZW50ZXIuZGUvY3JsL3YyL3Rj
Y2xhc3MxLmNybDANBgkqhkiG9w0BAQUFAAOBgQBe8NTmpp39KWyazqfbPAUwvRv/TEpem4Xy4Gsr
8t4RGG9ExKT/ktfFi2tXO+7LpTmJTbvQ+qHoxkBlmhD1oVVUn2zSIq372vfPvFoFtkvFatpmHDVu
cTm1vVfeq1t3yDsvs3WLicz5jT4MSV5EFBaGMgaKjgAIU0NOMXSadvg1FDCCBC0wggOWoAMCAQIC
DwDGeQABAAJleOfDDs0k2jANBgkqhkiG9w0BAQUFADB9MQswCQYDVQQGEwJERTEcMBoGA1UEChMT
VEMgVHJ1c3RDZW50ZXIgR21iSDElMCMGA1UECxMcVEMgVHJ1c3RDZW50ZXIgQ2xhc3MgMSBMMSBD
QTEpMCcGA1UEAxMgVEMgVHJ1c3RDZW50ZXIgQ2xhc3MgMSBMMSBDQSBJSUkwHhcNMDgwNjAyMTk1
OTE0WhcNMDkwNjAzMTk1OTE0WjBVMQswCQYDVQQGEwJERTEdMBsGA1UEAwwUQ2hyaXN0aWFuIFDD
tnNzaW5nZXIxJzAlBgkqhkiG9w0BCQEWGGNocmlzdGlhbkBwb2Vzc2luZ2VyLmNvbTCBnzANBgkq
hkiG9w0BAQEFAAOBjQAwgYkCgYEAuguFcdn+JUOZE1zrf7pNe49W/VOCLZ5qMl4oadEeC2gQEphG
9arX0oBpkpGvvHnZUPDk7YRgQvJCOKQAKpZl4s5yEHFzeT7TIrslx0gCvZTnz2/irp91OdTM/ODf
IFLVm6y/9zUwqhE8xjOANKlKJjGWb1MZQa3OxVt0bAzx2aECAwEAAaOCAdUwggHRMIGZBggrBgEF
BQcBAQSBjDCBiTBSBggrBgEFBQcwAoZGaHR0cDovL3d3dy50cnVzdGNlbnRlci5kZS9jZXJ0c2Vy
dmljZXMvY2FjZXJ0cy90Y19jbGFzczFfTDFfQ0FfSUlJLmNydDAzBggrBgEFBQcwAYYnaHR0cDov
L29jc3AuSUlJLnRjY2xhc3MxLnRydXN0Y2VudGVyLmRlMB8GA1UdIwQYMBaAFP2u3ZGgztA5Kkvv
KMwSnk9+FKp1MEoGA1UdIARDMEEwPwYJKoIUACwBAQEBMDIwMAYIKwYBBQUHAgEWJGh0dHA6Ly93
d3cudHJ1c3RjZW50ZXIuZGUvZ3VpZGVsaW5lczAOBgNVHQ8BAf8EBAMCBeAwHQYDVR0OBBYEFFsT
sBwLENTiHhGnFoxQdRHfWH5kMEkGA1UdHwRCMEAwPqA8oDqGOGh0dHA6Ly93d3cudHJ1c3RjZW50
ZXIuZGUvY3JsL3YyL3RjX2NsYXNzMV9MMV9DQV9JSUkuY3JsMCcGA1UdJQQgMB4GCCsGAQUFBwMC
BggrBgEFBQcDBAYIKwYBBQUHAwcwIwYDVR0RBBwwGoEYY2hyaXN0aWFuQHBvZXNzaW5nZXIuY29t
MA0GCSqGSIb3DQEBBQUAA4GBAO125wEI0aBufMa0kTLKOucyyMuu5imnJR39B/Ujbbivd9TR1NV1
JASrmgipzCxIL1GyaBL+ctUGbCyjxNd5C9NGdNBbdMQ/flcQEG7jWfDYpOCR3krSiRKFbsVXMhgh
mn6iHbG2bzzj76IFqhKHvFS4OP5Hi79A9MGt4DATcm6JMYIDSzCCA0cCAQEwgZAwfTELMAkGA1UE
BhMCREUxHDAaBgNVBAoTE1RDIFRydXN0Q2VudGVyIEdtYkgxJTAjBgNVBAsTHFRDIFRydXN0Q2Vu
dGVyIENsYXNzIDEgTDEgQ0ExKTAnBgNVBAMTIFRDIFRydXN0Q2VudGVyIENsYXNzIDEgTDEgQ0Eg
SUlJAg8AxnkAAQACZXjnww7NJNowCQYFKw4DAhoFAKCCAhAwGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMDkwMzEzMTkyMDI5WjAjBgkqhkiG9w0BCQQxFgQUiEU3Ieuz
FXoJzL52O75S/kfFPJEwZwYJKoZIhvcNAQkPMVowWDAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgIC
AIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwBwYFKw4DAhowCgYIKoZI
hvcNAgUwgaEGCSsGAQQBgjcQBDGBkzCBkDB9MQswCQYDVQQGEwJERTEcMBoGA1UEChMTVEMgVHJ1
c3RDZW50ZXIgR21iSDElMCMGA1UECxMcVEMgVHJ1c3RDZW50ZXIgQ2xhc3MgMSBMMSBDQTEpMCcG
A1UEAxMgVEMgVHJ1c3RDZW50ZXIgQ2xhc3MgMSBMMSBDQSBJSUkCDwDGeQABAAJleOfDDs0k2jCB
owYLKoZIhvcNAQkQAgsxgZOggZAwfTELMAkGA1UEBhMCREUxHDAaBgNVBAoTE1RDIFRydXN0Q2Vu
dGVyIEdtYkgxJTAjBgNVBAsTHFRDIFRydXN0Q2VudGVyIENsYXNzIDEgTDEgQ0ExKTAnBgNVBAMT
IFRDIFRydXN0Q2VudGVyIENsYXNzIDEgTDEgQ0EgSUlJAg8AxnkAAQACZXjnww7NJNowDQYJKoZI
hvcNAQEBBQAEgYBVsPCeHnnkal99ccUNZ9wEAmEmEODoNZ6vm7zIes0RwG+62o8UGrp+Y4Od8ahb
lC+k7AFXlUIqDIls/laFU9JCW2pJEk9/mjLu+LW4Bmg3fBfKp1vjZQFiFS8awqM5k9YRhTlwReo6
64y7ac3AsRTYC/ic4iPqdbsmoOXAz09GFgAAAAAAAA==

------=_NextPart_000_0000_01C9A419.271428A0--
