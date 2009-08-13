Received: from [128.178.224.226] (helo=smtp3.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1MbWbc-0001XD-Ry
	for openembedded-devel@openembedded.org; Thu, 13 Aug 2009 11:28:21 +0200
Received: (qmail 29247 invoked by uid 107); 13 Aug 2009 09:11:49 -0000
X-Virus-Scanned: ClamAV
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp3.epfl.ch (AngelmatoPhylax SMTP proxy);
	Thu, 13 Aug 2009 11:11:49 +0200
Message-ID: <4A83D8D4.7060206@epfl.ch>
Date: Thu, 13 Aug 2009 11:11:48 +0200
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
User-Agent: Thunderbird 2.0.0.22 (X11/20090608)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Cross-compiling qt based programs with cmake
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
X-List-Received-Date: Thu, 13 Aug 2009 09:28:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I am trying to build cmake based programs that use QT with Openembedded.
The actual support for cmake in OE worked until now because I only had
"simple" dependencies. Now with QT as as dependency, I use the cmake
FindQt4 Module that strongly relies on qmake to find the different QT
cmake variables (try to run ${STAGINGBINDIR}/qmake2 -query). The cmake 
FindQt4 Module uses the values given by qmake to determine where all the 
libraries and tools are installed (and if installed).

The problem is that all the variables defined by qmake2 -query point to 
the ${STAGING_DIR}/${HOST_SYS}/ as you can se below:

> valentin@lsro1arena:~/OE/angstrom/staging$ x86_64-linux/usr/bin/qmake2 -query
> QT_INSTALL_PREFIX:/home/valentin/OE/angstrom/staging/x86_64-linux/usr
> QT_INSTALL_DATA:/home/valentin/OE/angstrom/staging/x86_64-linux/usr
> QT_INSTALL_DOCS:/home/valentin/OE/angstrom/staging/x86_64-linux/usr/doc
> QT_INSTALL_HEADERS:/home/valentin/OE/angstrom/staging/x86_64-linux/usr/include
> QT_INSTALL_LIBS:/home/valentin/OE/angstrom/staging/x86_64-linux/usr/lib
> QT_INSTALL_BINS:/home/valentin/OE/angstrom/staging/x86_64-linux/usr/bin
> QT_INSTALL_PLUGINS:/home/valentin/OE/angstrom/staging/x86_64-linux/usr/plugins
> QT_INSTALL_TRANSLATIONS:/home/valentin/OE/angstrom/staging/x86_64-linux/usr/translations
> QT_INSTALL_CONFIGURATION:/etc/xdg
> QT_INSTALL_EXAMPLES:/home/valentin/OE/angstrom/staging/x86_64-linux/usr/examples
> QT_INSTALL_DEMOS:/home/valentin/OE/angstrom/staging/x86_64-linux/usr/demos
> QMAKE_MKSPECS:/home/valentin/OE/angstrom/staging/x86_64-linux/usr/mkspecs
> QMAKE_VERSION:2.01a
> QT_VERSION:4.5.1


But in order to be used, these values should point to a place that is 
more like ${STAGING_INCDIR}. If we take the includes example, 
QT_INSTALL_HEADERS is 
/home/valentin/OE/angstrom/staging/x86_64-linux/usr/include ( 
${STAGING_DIR}/${HOST_SYS}/include) but it should be 
/home/valentin/OE/angstrom/staging/armv6-angstrom-linux-gnueabi/usr/include/qtopia/ 
(that corresponds to ${STAGING_INCDIR}/qtopia) as you can see below.

> valentin@lsro1arena:~/OE/angstrom$ ll staging/armv6-angstrom-linux-gnueabi/usr/include/qtopia/
> total 160K
> drwxr-xr-x 2 valentin valentin 4.0K 2009-06-17 20:43 phonon
> drwxr-xr-x 2 valentin valentin  32K 2009-06-17 20:43 Qt
> drwxr-xr-x 2 valentin valentin  16K 2009-06-17 20:43 Qt3Support
> drwxr-xr-x 2 valentin valentin 4.0K 2009-06-17 20:43 QtAssistant
> drwxr-xr-x 2 valentin valentin  20K 2009-06-17 20:43 QtCore
> drwxr-xr-x 2 valentin valentin 4.0K 2009-06-17 20:43 QtDBus
> drwxr-xr-x 2 valentin valentin 4.0K 2009-06-17 20:43 QtDesigner
> drwxr-xr-x 2 valentin valentin  36K 2009-06-17 20:43 QtGui
> drwxr-xr-x 2 valentin valentin 4.0K 2009-06-17 20:43 QtHelp
> drwxr-xr-x 2 valentin valentin 4.0K 2009-06-17 20:43 QtNetwork
> drwxr-xr-x 2 valentin valentin 4.0K 2009-06-17 20:43 QtScript
> drwxr-xr-x 2 valentin valentin 4.0K 2009-06-17 20:43 QtScriptTools
> drwxr-xr-x 2 valentin valentin 4.0K 2009-06-17 20:43 QtSql
> drwxr-xr-x 2 valentin valentin 4.0K 2009-06-17 20:43 QtSvg
> drwxr-xr-x 2 valentin valentin 4.0K 2009-06-17 20:43 QtTest
> drwxr-xr-x 2 valentin valentin 4.0K 2009-06-17 20:43 QtUiTools
> drwxr-xr-x 2 valentin valentin 4.0K 2009-06-17 20:43 QtWebKit
> drwxr-xr-x 2 valentin valentin 4.0K 2009-06-17 20:43 QtXml

The problem is that these QT_INSTALL_* values are determined at 
configure time, and it is hard to change them.

An inelegant but efficient way to resolve this problem would be to 
"double install" the headers and libs of qt (or qtopia) also in 
${STAGING_DIR}/${HOST_SYS}.

But I am pretty sure there is a more elegant way to do it, especially 
using qt4e.bbclass where all the releveant paths are used.

Is there a qt4 wizard in OE that could help me ?

Val

-- 
Valentin Longchamp, PhD Student, EPFL-STI-LSRO1
valentin.longchamp@epfl.ch, Phone: +41216937827
http://people.epfl.ch/valentin.longchamp
MEA3485, Station 9, CH-1015 Lausanne


