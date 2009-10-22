Received: from [128.178.224.219] (helo=smtp0.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1N0xSV-000150-RN
	for openembedded-devel@openembedded.org; Thu, 22 Oct 2009 15:12:06 +0200
Received: (qmail 6740 invoked by uid 107); 22 Oct 2009 13:11:00 -0000
X-Virus-Scanned: ClamAV
Received: from lsro1pc40.epfl.ch (128.178.145.86) (authenticated)
	by smtp0.epfl.ch (AngelmatoPhylax SMTP proxy);
	Thu, 22 Oct 2009 15:11:00 +0200
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Oct 2009 15:08:30 +0200
Message-Id: <1256216911-693-1-git-send-email-valentin.longchamp@epfl.ch>
X-Mailer: git-send-email 1.6.0.4
X-SA-Exim-Connect-IP: 128.178.224.219
X-SA-Exim-Mail-From: valentin.longchamp@epfl.ch
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Cmake cross-compile file
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
X-List-Received-Date: Thu, 22 Oct 2009 13:12:07 -0000

Hello,

I had already posted this patch earlier bit I got no comment. It allows cmake
to work with cross-compile files where the needed paths, options and programs
are given, which is the recommended way of doing cross-compilation with cmake
according to their documentation.

Furthermore, you can add additionnal path in individual recipes by writing into
the cross-compile file in the do_generate_toolchain_file_append() task as done 
below for qt4 for instance.

do_generate_toolchain_file_append() {
	echo "set( QT_HEADERS_DIR ${OE_QMAKE_INCDIR_QT} CACHE STRING \"Qt4 include dir\" )" >> ${WORKDIR}/toolchain.cmake
	echo "set( QT_LIBRARY_DIR ${OE_QMAKE_LIBDIR_QT} CACHE STRING \"Qt4 library dir\" )" >> ${WORKDIR}/toolchain.cmake
	echo "set( QT_QMAKE_EXECUTABLE ${OE_QMAKE_QMAKE} CACHE STRING \"qmake2 binary\" )" >> ${WORKDIR}/toolchain.cmake
	echo "set( QT_MOC_EXECUTABLE ${OE_QMAKE_MOC} CACHE STRING \"Qt4 moc binary\" )" >> ${WORKDIR}/toolchain.cmake
	echo "set( QT_UIC_EXECUTABLE ${OE_QMAKE_UIC} CACHE STRING \"Qt4 uic binary\" )" >> ${WORKDIR}/toolchain.cmake
	echo "set( QT_UIC3_EXECUTABLE ${OE_QMAKE_UIC3} CACHE STRING \"Qt4 uic3 binary\" )" >> ${WORKDIR}/toolchain.cmake
	echo "set( QT_RCC_EXECUTABLE ${OE_QMAKE_RCC} CACHE STRING \"Qt4 rcc binary\" )" >> ${WORKDIR}/toolchain.cmake
	echo "set( QT_DBUSXML2CPP_EXECUTABLE ${OE_QMAKE_QDBUSXML2CPP} CACHE STRING \"Qt4 dbus xml2cpp binary\" )" >> ${WORKDIR}/toolchain.cmake
	echo "set( QT_DBUSCPP2XML_EXECUTABLE ${OE_QMAKE_QDBUSCPP2XML} CACHE STRING \"Qt4 dbus cpp2xml binary\" )" >> ${WORKDIR}/toolchain.cmake
	echo "set( QT_LRELEASE_EXECUTABLE ${OE_QMAKE_LRELEASE} CACHE STRING \"Qt4 lrelease binary\" )" >> ${WORKDIR}/toolchain.cmake
	echo "set( QT_LUPDATE_EXECUTABLE ${OE_QMAKE_LUPDATE} CACHE STRING \"Qt4 lupdate binary\" )" >> ${WORKDIR}/toolchain.cmake 
}

I have been using it in my overlay for quite some time with various cmake based
recipes we have here and I definitely think it would deserve OE inlcusion.

Comment welcome

Val




