Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IWT5U-0003OG-4t
	for openembedded-devel@openembedded.org; Sat, 15 Sep 2007 10:33:12 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8F8TdxW005692 for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Sep 2007 10:29:40 +0200
Message-ID: <46EB97FE.1030906@student.utwente.nl>
Date: Sat, 15 Sep 2007 10:29:50 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <200709111318.52432.openembedded@haerwu.biz>	<46E78180.1050907@student.utwente.nl>	<46EA3685.2040809@student.utwente.nl>	<200709141122.31734.openembedded@haerwu.biz>
	<46EA57E9.4020202@dominion.kabel.utwente.nl>
In-Reply-To: <46EA57E9.4020202@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: Splitting up bluez in a sane way, was Re: Task-base is big :(
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Sep 2007 08:33:12 -0000
Content-Type: multipart/mixed; boundary="------------040806010608090701090308"

--------------040806010608090701090308
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id l8F8TdxW005692

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Marcin Juszkiewicz schreef:
>> Dnia pi=C4=85tek, 14 wrze=C5=9Bnia 2007, Koen Kooi napisa=C5=82:
>>
>>> What can be done is to make the default bluez-utils build only build
>>> bluez-utils* and have seperate recipes for all the 3rdparty stuff it
>>> builds:
>>> That would solve both buildtime and runtime issues.
>>>
>>> What do you think?
>> bluez-utils-cups, bluez-utils-gstreamer, bluez-utils-alsa? Sounds good =
for=20
>> me - especially first both.
>=20
>=20
> bluez-utils-cups and bluez-utils-alsa can be done for sure, but I haven'=
t looked at where
> gstreamer comes in and if it can be a seperate package.

What do you think of this patch?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG65f+MkyGM64RGpERAjykAKC6h9p8EPGj2e1bLRZVyVUWM3d/ZQCePdiE
K2akk6htq346s6KfG250gYs=3D
=3DdAPx
-----END PGP SIGNATURE-----
#
# old_revision [ed2dc1d95bc34057f0b86292d7754ebbccb01504]
#
# add_file "packages/bluez/bluez-cups-backend_3.18.bb"
#  content [6d3dd18f0576378f8bae0c3e251bce0ca132176e]
#=20
# add_file "packages/bluez/bluez-libs_3.18.bb"
#  content [dc7c9ab3cf4931c0678271b1a5ef7511ebb7b82d]
#=20
# add_file "packages/bluez/bluez-utils-alsa_3.18.bb"
#  content [b7eb82c734b71cf61ac35a052d87da836df665d4]
#=20
# add_file "packages/bluez/bluez-utils3.inc"
#  content [67f1049d4efcca0d1468bbd4b8a4773c40c05d2f]
#=20
# add_file "packages/bluez/bluez-utils_3.18.bb"
#  content [6eab1b4ae54ca017408988788320c718efedc784]
#
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/bluez/bluez-cups-backend_3.18.bb	6d3dd18f0576378f8bae0c3e251b=
ce0ca132176e
+++ packages/bluez/bluez-cups-backend_3.18.bb	6d3dd18f0576378f8bae0c3e251b=
ce0ca132176e
@@ -0,0 +1,26 @@
+require bluez-utils3.inc
+
+DEPENDS +=3D "cups"
+
+# see bluez-utils3.inc for the explanation of these option
+EXTRA_OECONF =3D " \
+                 --enable-bccmd \
+	=09 --enable-hid2hci \
+                 --disable-alsa \=20
+	=09 --enable-cups \
+	=09 --enable-glib \
+	=09 --disable-sdpd \
+	         --enable-network \
+	         --enable-serial \
+	         --enable-input \
+	         --enable-audio \
+	         --enable-echo \
+                 --enable-configfile \
+	         --enable-initscripts \
+	=09 --enable-test \
+	=09"=20
+
+PACKAGES =3D "${PN}"
+
+FILES_${PN} =3D "${libdir}/cups/backend/bluetooth"
+RDEPENDS_${PN} =3D "cups"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/bluez/bluez-libs_3.18.bb	dc7c9ab3cf4931c0678271b1a5ef7511ebb7=
b82d
+++ packages/bluez/bluez-libs_3.18.bb	dc7c9ab3cf4931c0678271b1a5ef7511ebb7=
b82d
@@ -0,0 +1 @@
+require bluez-libs.inc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/bluez/bluez-utils-alsa_3.18.bb	b7eb82c734b71cf61ac35a052d87da=
836df665d4
+++ packages/bluez/bluez-utils-alsa_3.18.bb	b7eb82c734b71cf61ac35a052d87da=
836df665d4
@@ -0,0 +1,24 @@
+require bluez-utils3.inc
+
+DEPENDS +=3D "alsa-lib"
+
+# see bluez-utils3.inc for the explanation of these option
+EXTRA_OECONF =3D " \
+                 --enable-bccmd \
+	=09 --disable-hid2hci \
+                 --enable-alsa \=20
+	=09 --disable-cups \
+	=09 --enable-glib \
+	=09 --disable-sdpd \
+	         --enable-network \
+	         --enable-serial \
+	         --enable-input \
+	         --enable-audio \
+	         --enable-echo \
+                 --enable-configfile \
+	         --enable-initscripts \
+	=09 --enable-test \
+	=09"=20
+
+PACKAGES =3D "${PN}"
+FILES_${PN} =3D "${libdir}/alsa-lib/libasound*"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/bluez/bluez-utils3.inc	67f1049d4efcca0d1468bbd4b8a4773c40c05d=
2f
+++ packages/bluez/bluez-utils3.inc	67f1049d4efcca0d1468bbd4b8a4773c40c05d=
2f
@@ -0,0 +1,143 @@
+DESCRIPTION =3D "Linux Bluetooth Stack Userland Utilities."
+SECTION =3D "console"
+PRIORITY =3D "optional"
+DEPENDS =3D "gstreamer gst-plugins-base bluez-libs-${PV} libusb dbus glib=
-2.0"
+PROVIDES =3D "bluez-utils-dbus"
+RPROVIDES_${PN} =3D "bluez-pan bluez-sdp bluez-utils-dbus"
+RREPLACES =3D "bluez-utils-dbus"
+RCONFLICTS_${PN} =3D "bluez-utils-nodbus"
+LICENSE =3D "GPL"
+
+# ti patch doesn't apply, people using it should rediff it and send it up=
stream
+SRC_URI =3D "http://bluez.sourceforge.net/download/bluez-utils-${PV}.tar.=
gz \
+           file://hcid.conf \
+#           file://hciattach-ti-bts.patch;patch=3D1 \
+
+S =3D "${WORKDIR}/bluez-utils-${PV}"
+
+inherit autotools update-rc.d
+
+EXTRA_OECONF =3D " \
+                 --enable-bccmd \
+	=09 --enable-hid2hci \
+                 --enable-alsa \=20
+	=09 --enable-cups \
+	=09 --enable-glib \
+	=09 --disable-sdpd \
+	         --enable-network \
+	         --enable-serial \
+	         --enable-input \
+	         --enable-audio \
+	         --enable-echo \
+                 --enable-configfile \
+	         --enable-initscripts \
+	=09 --enable-test \
+	=09"=20
+
+# The config options are explained below:
+
+#  --enable-obex           enable OBEX support
+#  --enable-alsa           enable ALSA support, not needed for nokia770, =
nokia800 and fic-gtao1
+#  --enable-cups           install CUPS backend support
+#  --enable-bccmd          install BCCMD interface utility
+#  --enable-avctrl         install Audio/Video control utility
+#  --enable-hid2hci        install HID mode switching utility
+#  --enable-dfutool        install DFU firmware upgrade utility
+
+#  --enable-glib           For systems that use and install GLib anyway
+#  --disable-sdpd          The sdpd is obsolete and should no longer be u=
sed. This of course requires that hcid will be started with -s to enable th=
e SDP server
+
+#Following services can be enabled so far:
+#	--enable-network
+#	--enable-serial
+#	--enable-input
+#	--enable-audio
+#	--enable-echo
+
+#There is no need to modify any init script. They will be started
+#automatically or on demand. Only /etc/bluetooth/*.service files should
+#be patched to change name or the autostart value.
+#	--enable-configfile
+#	--enable-initscripts
+
+#For even smaller -doc packages
+#	--disable-manpages
+#	--disable-pcmciarules
+
+#I haven't seen any embedded device with HID proxy support. So simply
+#disable it:
+#	--disable-hid2hci
+
+
+do_install_append() {
+	install -d ${D}${base_sbindir} ${D}${base_bindir}/  ${D}${sysconfdir}/ap=
m/event.d/
+	mv ${D}${sbindir}/* ${D}${base_sbindir}/
+	mv ${D}${bindir}/* ${D}${base_bindir}/
+	rmdir ${D}${bindir} ${D}${sbindir}
+	chmod u+s ${D}${base_sbindir}/hciattach ${D}${base_sbindir}/hciconfig
+	install -m 0644 ${WORKDIR}/hcid.conf ${D}${sysconfdir}/bluetooth/
+        install -m 0755 ${S}/daemon/.libs/passkey-agent ${D}${base_bindir=
}/
+}
+
+
+INITSCRIPT_NAME =3D "bluetooth"
+INITSCRIPT_PARAMS =3D "defaults 23 19"
+
+
+PACKAGES =3D+ "${PN}-compat"
+
+CONFFILES_${PN} =3D " \
+                   ${sysconfdir}/bluetooth/hcid.conf \
+                   ${sysconfdir}/default/bluetooth \
+                  "
+
+CONFFILES_${PN}-compat =3D " \
+                          ${sysconfdir}/bluetooth/rfcomm.conf \
+	=09	 "=20
+
+FILES_${PN} =3D " \
+               ${base_sbindir}/hcid \
+               ${libdir}/bluetooth \
+               ${sysconfdir}/init.d/bluetooth \
+               ${sysconfdir}/bluetooth/*.service \
+               ${sysconfdir}/bluetooth/hcid.conf \
+               ${sysconfdir}/default \
+               ${sysconfdir}/dbus-1 \
+	       ${base_sbindir}/hciattach \
+              "
+
+FILES_${PN}-dbg +=3D " \
+                   ${libdir}/bluetooth/.debug \
+	=09   ${libdir}/cups/backend/.debug \
+	=09   ${libdir}/alsa-lib/.debug \
+	=09  "=20
+
+FILES_${PN}-compat =3D " \
+                    ${base_bindir}/sdptool \
+                    ${base_bindir}/dund \
+	=09    ${base_bindir}/rctest \
+	=09    ${base_bindir}/ciptool \
+	=09    ${base_bindir}/l2test \
+	=09    ${base_bindir}/rfcomm \
+	=09    ${base_bindir}/hcitool \
+	=09    ${base_bindir}/pand \
+	=09    ${base_bindir}/hidd \
+	=09    ${base_bindir}/l2ping \
+	=09    ${base_sbindir}/hciconfig \
+                    ${base_sbindir}/bccmd \
+	=09    ${base_sbindir}/hciemu \
+	=09    ${base_sbindir}/hid2hci \
+	=09    ${base_bindir}/passkey-agent \
+	=09    ${sysconfdir}/bluetooth/rfcomm.conf \
+	=09   "=20
+
+
+
+
+
+
+
+
+
+
+
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/bluez/bluez-utils_3.18.bb	6eab1b4ae54ca017408988788320c718efe=
dc784
+++ packages/bluez/bluez-utils_3.18.bb	6eab1b4ae54ca017408988788320c718efe=
dc784
@@ -0,0 +1,23 @@
+require bluez-utils3.inc
+
+# see bluez-utils3.inc for the explanation of these option
+EXTRA_OECONF =3D " \
+                 --enable-bccmd \
+	=09 --enable-hid2hci \
+                 --disable-alsa \=20
+	=09 --disable-cups \
+	=09 --enable-glib \
+	=09 --disable-sdpd \
+	         --enable-network \
+	         --enable-serial \
+	         --enable-input \
+	         --enable-audio \
+	         --enable-echo \
+                 --enable-configfile \
+	         --enable-initscripts \
+	=09 --enable-test \
+	=09"=20
+
+
+CONFFILES_${PN} =3D "${sysconfdir}/bluetooth/hcid.conf ${sysconfdir}/blue=
tooth/rfcomm.conf \
+	${sysconfdir}/default/bluetooth"

--------------040806010608090701090308--
