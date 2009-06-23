Received: from [128.178.224.226] (helo=smtp3.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1MJ2Zc-00074Y-8r
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 11:45:52 +0200
Received: (qmail 18378 invoked by uid 107); 23 Jun 2009 09:34:38 -0000
X-Virus-Scanned: ClamAV
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp3.epfl.ch (AngelmatoPhylax SMTP proxy);
	Tue, 23 Jun 2009 11:34:38 +0200
Message-ID: <4A40A1AD.10903@epfl.ch>
Date: Tue, 23 Jun 2009 11:34:37 +0200
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: qt4-embedded and cmake
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
X-List-Received-Date: Tue, 23 Jun 2009 09:45:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I am struggling to cross-compile a cmake based recipe that has 
qt4-embedded as a dependance (but it is the same for qt4).

My problem is that qmake that is used by OE is the one built by 
qt4-tools-native and it has all the paths (that are determined at 
configure time with the -prefix option) set to 
${STAGING_DIR}/${BUILD_SYS}. Here is the output of 
{STAGING_DIR}/${BUILD_SYS}/usr/bin/qmake4 -query:

> valentin@thinkpad:/usr/local/OE/angstrom$ staging/i686-linux/usr/bin/qmake4 -query
> QT_INSTALL_PREFIX:/usr/local/OE/angstrom/staging/i686-linux
> QT_INSTALL_DATA:/usr/local/OE/angstrom/staging/i686-linux
> QT_INSTALL_DOCS:/usr/local/OE/angstrom/staging/i686-linux/doc
> QT_INSTALL_HEADERS:/usr/local/OE/angstrom/staging/i686-linux/include
> QT_INSTALL_LIBS:/usr/local/OE/angstrom/staging/i686-linux/lib
> QT_INSTALL_BINS:/usr/local/OE/angstrom/staging/i686-linux/bin
> QT_INSTALL_PLUGINS:/usr/local/OE/angstrom/staging/i686-linux/plugins
> QT_INSTALL_TRANSLATIONS:/usr/local/OE/angstrom/staging/i686-linux/translations
> QT_INSTALL_CONFIGURATION:/etc/xdg
> QT_INSTALL_EXAMPLES:/usr/local/OE/angstrom/staging/i686-linux/examples
> QT_INSTALL_DEMOS:/usr/local/OE/angstrom/staging/i686-linux/demos
> QMAKE_MKSPECS:/usr/local/OE/angstrom/staging/i686-linux/mkspecs
> QMAKE_VERSION:2.01a
> QT_VERSION:4.5.1


But, in cmake, when you want to use qt4 or qt4-embedded, you need to use 
the FindQt4 module. What this module does is querying qmake to find out 
where the QT libraries are installed. These should point to 
${STAGING_DIR_HOST}, because that's where the lib dir and headers that 
we aim at are. I changed a little bit the FindQt4.cmake module so that 
it is more verbose and here is the ouptut:

> QMAKE found : /usr/local/OE/angstrom/staging/i686-linux/usr/bin/qmake4
> QT_LIBRARY_DIR is /usr/local/OE/angstrom/staging/i686-linux/usr/lib
> QT_BINARY_DIR is /usr/local/OE/angstrom/staging/i686-linux/usr/bin
> QT_HEADERS_DIR is /usr/local/OE/angstrom/staging/i686-linux/usr/include
> Looking for QtCore in /usr/local/OE/angstrom/staging/i686-linux/usr/include/QtCore
> Looking for QtGui in /usr/local/OE/angstrom/staging/i686-linux/usr/include/QtGui
> Looking for Qt3Support in /usr/local/OE/angstrom/staging/i686-linux/usr/include/Qt3Support
> Looking for QtSvg in /usr/local/OE/angstrom/staging/i686-linux/usr/include/QtSvg
> Looking for QtScript in /usr/local/OE/angstrom/staging/i686-linux/usr/include/QtScript
> Looking for QtTest in /usr/local/OE/angstrom/staging/i686-linux/usr/include/QtTest
> Looking for QtUiTools in /usr/local/OE/angstrom/staging/i686-linux/usr/include/QtUiTools
> Looking for QtHelp in /usr/local/OE/angstrom/staging/i686-linux/usr/include/QtHelp
> Looking for QtWebKit in /usr/local/OE/angstrom/staging/i686-linux/usr/include/QtWebKit
> Looking for QtXmlPatterns in /usr/local/OE/angstrom/staging/i686-linux/usr/include/QtXmlPatterns
> Looking for phonon in /usr/local/OE/angstrom/staging/i686-linux/usr/include/phonon
> Looking for QtMotif in /usr/local/OE/angstrom/staging/i686-linux/usr/include/QtMotif
> Looking for QtNetwork in /usr/local/OE/angstrom/staging/i686-linux/usr/include/QtNetwork
> Looking for QtNsPlugin in /usr/local/OE/angstrom/staging/i686-linux/usr/include/QtNsPlugin
> Looking for QtOpenGL in /usr/local/OE/angstrom/staging/i686-linux/usr/include/QtOpenGL
> Looking for QtSql in /usr/local/OE/angstrom/staging/i686-linux/usr/include/QtSql
> Looking for QtXml in /usr/local/OE/angstrom/staging/i686-linux/usr/include/QtXml
> Looking for QtDesigner in /usr/local/OE/angstrom/staging/i686-linux/usr/include/QtDesigner
> Looking for QtDBus in /usr/local/OE/angstrom/staging/i686-linux/usr/include/QtDBus

Of course they are not found, because they are located in
/usr/local/OE/angstrom/staging/armv6-angstrom-linux-gnueabi/usr/include/qtopia/ 
(or ${STAGING_HOST_DIR}/usr/include/qtopia) (and it is the same for the 
library files, not only the headers).

I would like some input on how to handle this cleanly ? I see two solutions:

- we make qt4-tools-native point towards ${STAGING_DIR_HOST} 
(complicated, because qt4-tools-native inherits native, I did not succeed)
- we make the staging of qt4.inc copy the headers and libs to 
${STAGING_DIR}/${BUILD_SYS}

Your comments and help are greatly appreciated.

Best Regards

-- 
Valentin Longchamp, PhD Student, EPFL-STI-LSRO1
valentin.longchamp@epfl.ch, Phone: +41216937827
http://people.epfl.ch/valentin.longchamp
MEA3485, Station 9, CH-1015 Lausanne


