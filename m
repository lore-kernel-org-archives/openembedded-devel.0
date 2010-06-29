Received: from mail-dotnet1.eads.net ([80.156.45.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1OTbW2-0007dq-Q1 for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jun 2010 16:10:24 +0200
Received: from unknown (HELO de-gate2.mailhub.intra.corp) ([53.154.243.34])
	by mail-dotnet1.eads.net with ESMTP; 29 Jun 2010 15:56:57 +0200
Received: from gateinet1.mail.ds.corp ([149.207.23.241]) by
	de-gate2.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Tue, 29 Jun 2010 16:04:18 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet1.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 29 Jun 2010 16:04:17 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 29 Jun 2010 16:04:07 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819743@deimsg40.de.net.world>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Creating a Own Tool chain,
	some referenced packages are not included into the SDK archive
Thread-Index: AcsXk/CXXc/IwuivT4i7L/vEgPsxJg==
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 29 Jun 2010 14:04:17.0440 (UTC)
	FILETIME=[F68F2A00:01CB1793]
X-SA-Exim-Connect-IP: 80.156.45.103
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Creating a Own Tool chain, some referenced packages are not included into the SDK archive
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
X-List-Received-Date: Tue, 29 Jun 2010 14:10:24 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,=20

I tried to build my own tool chain, using the target task listed below.

The bitbake of the tool chain run w/o errors, but the referenced
packages will be installed partly only into the SDK archive.
(e.g. libqt-embeddedcore4-dev and libqt-embeddedphonon4-dev reside in
the SDK archive, the other packages are missing)

I use an private overlay, referencing org.openembedded.dev and using
DISTRO =3D "angstrom-2008.1" and MACHINE =3D "omap3evm"=20
The meta-toolchain-xxx is derived from meta-toolchain-qte.=20

What may going wrong here ?

Regards
Wolfgang Hauser

meta-toolchain-xxx.bb >>>
# xxx Qt Embedded toolchain
PR =3D "r3"
TOOLCHAIN_HOST_TASK =3D "task-xxx-toolchain-host"
TOOLCHAIN_TARGET_TASK =3D "task-xxx-toolchain-target"

require recipes/meta/meta-toolchain.bb
SDK_SUFFIX =3D "toolchain-xxx"
SDK_SUFFIX_angstrom =3D "toolchain-xxx-${ANGSTROM_QT_VERSION}"

QT_DIR_NAME =3D "qtopia"

do_populate_sdk_append() {
       script =3D "${SDK_OUTPUT}/${SDKPATH}/environment-setup"
       touch $script
       echo 'export OE_QMAKE_CC=3D${TARGET_SYS}-gcc' >> $script
       echo 'export OE_QMAKE_CXX=3D${TARGET_SYS}-g++' >> $script
       echo 'export OE_QMAKE_LINK=3D${TARGET_SYS}-g++' >> $script
       echo 'export
OE_QMAKE_LIBDIR_QT=3D${SDKPATH}/${TARGET_SYS}/${libdir}' >> $script
       echo 'export
OE_QMAKE_INCDIR_QT=3D${SDKPATH}/${TARGET_SYS}/${includedir}/${QT_DIR_NAME=
}
' >> $script
       echo 'export OE_QMAKE_MOC=3D${SDKPATH}/bin/moc4' >> $script
       echo 'export OE_QMAKE_UIC=3D${SDKPATH}/bin/uic4' >> $script
       echo 'export OE_QMAKE_UIC3=3D${SDKPATH}/bin/uic34' >> $script
       echo 'export OE_QMAKE_RCC=3D${SDKPATH}/bin/rcc4' >> $script
       echo 'export =
OE_QMAKE_QDBUSCPP2XML=3D${SDKPATH}/bin/qdbuscpp2xml4'
>> $script
       echo 'export =
OE_QMAKE_QDBUSXML2CPP=3D${SDKPATH}/bin/qdbusxml2cpp4'
>> $script
       echo 'export
OE_QMAKE_QT_CONFIG=3D${SDKPATH}/${TARGET_SYS}/${datadir}/${QT_DIR_NAME}/m=
k
specs/qconfig.pri' >> $script
       echo 'export
QMAKESPEC=3D${SDKPATH}/${TARGET_SYS}/${datadir}/${QT_DIR_NAME}/mkspecs/li=
n
ux-g++' >> $script

       # Repack SDK with new environment-setup
       cd ${SDK_OUTPUT}
       fakeroot tar cfj ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
}
<<<<<

task-xxx-toolchain-target.bb >>>>

DESCRIPTION =3D "Target packages for xxx Qt Embedded SDK"
LICENSE =3D "MIT"
ALLOW_EMPTY =3D "1"

PR =3D "r2"

PACKAGES =3D "${PN}"

DEPENDS =3D "task-sdk-bare"

RDEPENDS_${PN} +=3D " \
        task-sdk-bare \
        alsa-lib-dev \
        libpng-dev \
        net-snmp-dev \
        ftplib-dev \
        libgles-omap3-dev \
        qt4-embedded-mkspecs \
        libqt-embeddedphonon4-dev \
        libqt-embedded3support4-dev \
        libqt-embeddedassistantclient4-dev \
        libqt-embeddedcore4-dev \
        libqt-embeddeddbus4-dev \
        libqt-embeddeddesignercomponents4-dev \
        libqt-embeddeddesigner4-dev \
        libqt-embeddeduitools4-dev \
        libqt-embeddedgui4-dev \
        libqt-embeddedhelp4-dev \
        libqt-embeddednetwork4-dev \
        libqt-embeddedsvg4-dev \
        libqt-embeddedtest4-dev \
        libqt-embeddedxml4-dev \
        libts-dev \
        "
<<<<


