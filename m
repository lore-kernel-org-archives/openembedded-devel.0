Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Td3MA-0005kp-RT
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 19:24:36 +0100
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 25CD9A629D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2012 19:10:20 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Nov 2012 19:10:15 +0100
Message-Id: <1353953415-2602-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1353953415-2602-1-git-send-email-eric@eukrea.com>
References: <1353953415-2602-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] gammu: import from OE-classic and upgrade to 1.32.0
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
X-List-Received-Date: Mon, 26 Nov 2012 18:24:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

- provide default configuration files for both gammu and
gammu-smsd
- enable MySQL support
- enable libdbi support

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 .../recipes-connectivity/gammu/gammu/gammu-smsdrc  |  80 ++++++++++
 meta-oe/recipes-connectivity/gammu/gammu/gammurc   | 173 +++++++++++++++=
++++++
 meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb |  55 +++++++
 3 files changed, 308 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/gammu/gammu/gammu-smsdrc
 create mode 100644 meta-oe/recipes-connectivity/gammu/gammu/gammurc
 create mode 100644 meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb

diff --git a/meta-oe/recipes-connectivity/gammu/gammu/gammu-smsdrc b/meta=
-oe/recipes-connectivity/gammu/gammu/gammu-smsdrc
new file mode 100644
index 0000000..da413c2
--- /dev/null
+++ b/meta-oe/recipes-connectivity/gammu/gammu/gammu-smsdrc
@@ -0,0 +1,80 @@
+# This is a sample Gammu SMSD configuration file. It's required for gamm=
u-smsd,
+# see gammu-smsdrc(5) for documentation.
+
+# Gammu configuration, this section is like section "gammu" in "gammurc"=
 file,
+# see gammurc(5) for documentation.
+[gammu]
+device =3D /dev/ttyUSB0
+model =3D at115200
+#connection =3D dlr3
+#synchronizetime =3D yes
+#logfile =3D gammulog # this is not used at all in SMSD mode
+#logformat =3D textall
+#use_locking =3D yes
+#gammuloc =3D gammu.us
+#startinfo =3D yes
+
+# When uncomment this section and insert numbers here, smsd will process
+# incoming sms only from numbers written here (incoming sms from all oth=
er
+# numbers will be deleted)
+#[include_numbers]
+#number1 =3D 1234
+
+# When uncomment this section and insert numbers here, smsd will process
+# incoming sms from all numbers not written here (incoming sms from numb=
ers
+# written here will be deleted). This is "black" list.
+# Note: after using "include_numbers" section this one will be ignored
+#[exclude_numbers]
+#number1 =3D 1234
+
+# General SMSD settings, see gammu-smsdrc(5) for detailed description.
+[smsd]
+# SMSD service to use, one of FILES, MYSQL, PGSQL, DBI
+service =3D files
+# PIN for SIM card
+PIN =3D 0000
+# File (or stderr, syslog, eventlog) where information will be logged
+logfile =3D smsdlog
+# Amount of information being logged, each bit mean one level
+debuglevel =3D 0
+# Configuration for using more phones on same database
+#phoneid =3D MyPhone1
+# Script to be executed when new message has been received
+#runonreceive =3D /some/script
+# Commication frequency settings
+commtimeout =3D 30
+sendtimeout =3D 30
+#receivefrequency =3D 0
+
+# Phone communication settings
+#checksecurity =3D 1
+#resetfrequency =3D 0
+
+# Delivery report configuration
+#deliveryreport =3D no
+#deliveryreportdelay =3D 10
+
+# Ignoring broken SMSC
+#skipsmscnumber =3D +48602123456
+
+# Database backends congfiguration
+user =3D gammu
+password =3D gammupassword
+pc =3D localhost
+# pc can also contain port or socket path after colon (eg. localhost:/pa=
th/to/socket)
+database =3D sms
+
+# DBI configuration
+driver =3D sqlite
+# driverspath =3D /usr/lib/dbd/
+# Database directory for sqlite
+# dbdir =3D /var/lib/smsd
+
+# Files backend configuration
+inboxpath =3D /var/spool/sms/inbox/
+outboxpath =3D /var/spool/sms/outbox/
+sentsmspath =3D /var/spool/sms/sent/
+errorsmspath =3D /var/spool/sms/error/
+inboxformat =3D detail
+transmitformat =3D auto
+outboxformat =3D detail
diff --git a/meta-oe/recipes-connectivity/gammu/gammu/gammurc b/meta-oe/r=
ecipes-connectivity/gammu/gammu/gammurc
new file mode 100644
index 0000000..b55d739
--- /dev/null
+++ b/meta-oe/recipes-connectivity/gammu/gammu/gammurc
@@ -0,0 +1,173 @@
+; This is a sample ~/.gammurc file.
+; In Unix/Linux  copy it into your home directory and name it .gammurc
+;                or into /etc and name it gammurc
+; In Win32       copy it into directory with Gammu.exe and name gammurc
+; More about parameters later
+; Anything behind ; or # is comment.
+; ----------------------------------------------------------------------=
-------
+
+[gammu]
+
+device =3D /dev/ttyUSB0
+connection =3D at115200
+; Do not use model configuration unless you really need it
+;model =3D 6110
+;synchronizetime =3D yes
+;logfile =3D gammulog
+;logformat =3D textall
+;use_locking =3D yes
+;gammuloc =3D locfile
+;startinfo =3D yes
+;gammucoding =3D utf8
+;usephonedb =3D yes
+
+;[gammu1]
+
+;device =3D com8:
+;model =3D 6110
+;connection =3D fbusblue
+;synchronizetime =3D yes
+;logfile =3D gammulog
+;logformat =3D textall
+;use_locking =3D yes
+;gammuloc =3D locfile
+;startinfo =3D yes
+;gammucoding =3D utf8
+
+; Step 1. Please find required Connection parameter and look into assign=
ed=20
+; with it device type. With some Connection you must set concrete model
+
+; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D cables =3D=3D=3D=3D=3D
+; New Nokia protocol for FBUS/DAU9P
+;    Connection "fbus", device type serial
+; New Nokia protocol for DLR3/DLR3P
+;    Connection "fbusdlr3"/"dlr3", device type serial=20
+; New Nokia protocol for DKU2 (and phone with USB converter on phone mai=
nboard
+;                              like 6230)
+;    Connection "dku2phonet"/"dku2", device type dku2 on Windows
+;    Connection "fbususb" on Linux
+; New Nokia protocol for DKU5 (and phone without USB converter on phone
+;                              mainboard like 5100)
+;    Connection "dku5fbus"/"dku5", device type dku5
+; New Nokia protocol for PL2303 USB cable (and phone without USB convert=
er
+;                                          on phone mainboard like 5100)
+;    Connection "fbuspl2303", device type usb
+; Old Nokia protocol for MBUS/DAU9P
+;    Connection "mbus", device type serial
+; Variants:=20
+; You can modify a bit behaviour of connection using additional flags
+; specified just after connection name like connection-variant.
+; If you're using ARK3116 cable (or any other which does not like dtr=20
+; handling), you might need -nodtr variant of connection, eg. dlr3-nodtr=
.
+; If cable you use is not powered over DTR/RTS, try using -nopower varia=
nt of=20
+; connection, eg. fbus-nopower.
+; ----------------------------------------------------------------------=
-------
+; AT commands for DLR3, DKU5 or other AT compatible cable (8 bits, None
+; parity, no flow control, 1 stop bit). Used with Nokia, Alcatel, Siemen=
s, etc.
+;    Connection "at19200"/"at115200"/.., device type serial
+; AT commands for DKU2 cable
+;    Connection "dku2at", device type dku2
+; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D infrared =3D=3D=3D=3D=3D
+; Nokia protocol for infrared with Nokia 6110/6130/6150
+;    Connection "fbusirda"/"infrared", device type serial
+; Nokia protocol for infrared with other Nokia models
+;    Connection "irdaphonet"/"irda", device type irda
+; ----------------------------------------------------------------------=
-------
+; AT commands for infrared. Used with Nokia, Alcatel, Siemens, etc.
+;    Connection "irdaat", device type irda
+; ----------------------------------------------------------------------=
-------
+; OBEX for infrared
+;    Connection "irdaobex", device type irda.
+; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Bluetooth =3D=3D=3D=3D=3D
+; Nokia protocol with serial device set in BT stack (WidComm, other) fro=
m
+; adequate service and Nokia 6210
+;    Connection "fbusblue", device type serial
+; Nokia protocol with serial device set in BT stack (WidComm, other) fro=
m
+; adequate service and other Nokia models
+;    Connection "phonetblue", device type serial
+; ----------------------------------------------------------------------=
-------
+; Nokia protocol for Bluetooth stack with Nokia 6210
+;    Connection "bluerffbus", device type BT
+; Nokia protocol for Bluetooth stack with DCT4 Nokia models, which don't=
 inform
+; about services correctly (6310, 6310i with firmware lower than 5.50, 8=
910,..)
+;    Connection "bluerfphonet", device type BT
+; Nokia protocol for Bluetooth stack with other DCT4 Nokia models
+;    Connection "bluephonet", device type BT
+; ----------------------------------------------------------------------=
-------
+; AT commands for Bluetooth stack and 6210 / DCT4 Nokia models, which do=
n't
+; inform about BT services correctly (6310, 6310i with firmware lower=20
+; than 5.50, 8910,..)
+;    Connection "bluerfat", device type BT
+; AT commands for Bluetooth stack with other phones (Siemens, other Noki=
a,etc.)
+;    Connection "blueat", device type BT
+; ----------------------------------------------------------------------=
-------
+; OBEX for Bluetooth stack with DCT4 Nokia models, which don't inform ab=
out
+; BT services correctly (6310, 6310i with firmware lower than 5.50, 8910=
,...)
+;    Connection "bluerfobex", device type BT
+; OBEX for Bluetooth stack with other phones (Siemens, other Nokia, etc.=
)
+;    Connection "blueobex", device type BT.
+; ----------------------------------------------------------------------=
-------
+;    Connection "bluerfgnapbus", device type BT, model "gnap"
+;    Connection "irdagnapbus", device type irda, model "gnap"
+
+; Step2. According to device type from Step1 and used OS set Port parame=
ter
+
+; ----------------------------------------------------------------------=
-------
+; Port type | "Port" parameter in Windows/DOS | "Port" parameter in Linu=
x/Unix
+; ----------|---------------------------------|-------------------------=
-------
+; serial    | "com*:"                         | "/dev/ttyS*"
+;           | (example "com1:")               | (example "/dev/ttyS1")
+;           |                                 | or "/dev/tts/**" (with D=
evFS)
+;           |                                 | virtual serial ports lik=
e
+;           |                                 | "/dev/ircomm*" or "/dev/=
rfcomm*"
+; ----------|---------------------------------|-------------------------=
-------
+; irda      | ignored (can be empty)          | ignored (can be empty)
+; ----------|---------------------------------|-------------------------=
-------
+; BT        | Bluetooth device address (example "00:11:22:33:44:55").
+;           | Optionally you can also include channel after slash
+;           | (example "00:11:22:33:44:55/12"). Can be also empty.
+; ----------|---------------------------------|-------------------------=
-------
+; dku2      | ignored (can be empty)          | /dev/ttyUSB* or /dev/tty=
ACM*
+; ----------|---------------------------------|-------------------------=
-------
+; dku5      | ignored (can be empty)          | connection with it not p=
ossible
+; ----------|---------------------------------|-------------------------=
-------
+; usb       | connection with it not possible | "/dev/ttyUSB*"
+
+; Step3. Set other config parameters
+
+; ----------------------------------------------------------------------=
-------
+; Parameter name  | Description
+; ----------------|-----------------------------------------------------=
-------
+; Model           | Should not be used unless you have a good reason to =
do so.
+;                 | If Gammu doesn't recognize your phone model, put it =
here.=20
+;                 | Example values: "6110", "6150", "6210", "8210"
+; SynchronizeTime | if you want to set time from computer to phone durin=
g
+;                 | starting connection. Do not rather use this option w=
hen
+;                 | when to reset phone during connection (in some phone=
s need
+;                 | to set time again after restart)
+; GammuLoc        | name of localisation file
+; StartInfo       | this option allow to set, that you want (setting "ye=
s")
+;                 | to see message on the phone screen or phone should e=
nable
+;                 | light for a moment during starting connection. Phone
+;                 | WON'T beep during starting connection with this opti=
on.
+; GammuCoding     | forces using specified codepage (in win32 - for exam=
ple
+;                 | "1250" will force CP1250) or UTF8 (in Linux - "utf8"=
)
+; ----------------|-----------------------------------------------------=
-------
+; Logfile         | Use, when want to have logfile from communication.
+; Logformat       | What debug info and format should be used:
+;                 |   "nothing" - no debug level (default)
+;                 |   "text"    - transmission dump in text format
+;                 |   "textall" - all possible info in text format
+;                 |   "errors"  - errors in text format
+;                 |   "binary"  - transmission dump in binary format
+; ----------------|-----------------------------------------------------=
-------
+; Features        | Custom features for phone. This can be used as overr=
ide
+;                 | when values coded in common/gsmphones.c are bad or
+;                 | missing. Consult include/gammu-info.h for possible v=
alues
+;                 | (all Feature values without leading F_ prefix).
+;                 | Please report correct values to Gammu authors.
+; ----------------|-----------------------------------------------------=
-------
+; Use_Locking     | under Unix/Linux use "yes", if want to lock used dev=
ice
+;                 | to prevent using it by other applications. In win32 =
ignored
+
+; vim: et ts=3D4 sw=3D4 sts=3D4 tw=3D78 spell spelllang=3Den_us
diff --git a/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb b/meta-oe=
/recipes-connectivity/gammu/gammu_1.32.0.bb
new file mode 100644
index 0000000..3a2da3e
--- /dev/null
+++ b/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
@@ -0,0 +1,55 @@
+DESCRIPTION =3D "GNU All Mobile Managment Utilities"
+SECTION =3D "console/network"
+DEPENDS =3D "cmake-native virtual/libiconv libdbi mysql5"
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da17cb0a873d252440acfdf9b3d0e7=
fbf"
+HOMEPAGE =3D "http://www.gammu.org/"
+
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/${PN}/${PN}/${PV}/${PN}-${PV}.tar.bz2=
 \
+     file://gammurc \
+     file://gammu-smsdrc \
+     "
+
+SRC_URI[md5sum] =3D "8ea16c6b3cc48097a8e62311fe0e25b9"
+SRC_URI[sha256sum] =3D "de67caa102aa4c8fbed5300e5a0262e40411c4cc79f4379a=
8d34eed797968fc3"
+
+inherit distutils cmake gettext
+
+do_install_append() {
+     # these files seem to only be used by symbian and trigger QA warnin=
gs
+     rm -rf ${D}/usr/share/gammu
+     #install default configuration files
+     install -d ${D}${sysconfdir}
+     install -m 0644 ${WORKDIR}/gammurc ${D}${sysconfdir}/gammurc
+     install -m 0644 ${WORKDIR}/gammu-smsdrc ${D}${sysconfdir}/gammu-sms=
drc
+}
+
+EXTRA_OECONF =3D " \
+     --enable-shared \
+     --enable-backup \
+     --enable-protection \
+     "
+
+EXTRA_OECMAKE =3D " \
+     -DWITH_CURL=3DOFF \
+     -DWITH_BLUETOOTH=3DOFF \
+     -DWITH_NOKIA_SUPPORT=3DOFF \
+     -DWITH_IRDA=3DOFF \
+     -DWITH_PYTHON=3DOFF \
+     -DWITH_MySQL=3DON \
+     -DWITH_Postgres=3DOFF \
+     "
+
+PACKAGES =3D+ "${PN}-smsd libgammu libgsmsd python-${PN}"
+
+FILES_${PN} =3D "${bindir}/gammu ${bindir}/jadmaker ${sysconfdir}/bash_c=
ompletion.d/gammu \
+     ${bindir}/gammu-detect ${sysconfdir}/gammurc"
+CONFFILES_${PN} =3D "${sysconfdir}/gammurc"
+FILES_${PN}-smsd =3D "${bindir}/gammu-smsd* ${sysconfdir}/gammu-smsdrc"
+CONFFILES_${PN}-smsd =3D "${sysconfdir}/gammu-smsdrc"
+FILES_${PN}-dev +=3D "${bindir}/gammu-config ${libdir}/*.so"
+FILES_${PN}-dbg +=3D "${bindir}/.debug ${libdir}/.debug ${PYTHON_SITEPAC=
KAGES_DIR}/gammu/.debug"
+FILES_libgammu =3D "${libdir}/libGammu.so.*"
+FILES_libgsmsd =3D "${libdir}/libgsmsd.so.*"
+FILES_python-${PN} =3D "${PYTHON_SITEPACKAGES_DIR}/gammu/*.??"
+
--=20
1.7.11.7



