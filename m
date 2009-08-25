Received: from [128.178.224.219] (helo=smtp0.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1MfsHa-00049S-Lt
	for openembedded-devel@openembedded.org; Tue, 25 Aug 2009 11:25:39 +0200
Received: (qmail 2805 invoked by uid 107); 25 Aug 2009 09:07:47 -0000
X-Virus-Scanned: ClamAV
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp0.epfl.ch (AngelmatoPhylax SMTP proxy);
	Tue, 25 Aug 2009 11:07:47 +0200
Message-ID: <4A93A9E3.7090605@epfl.ch>
Date: Tue, 25 Aug 2009 11:07:47 +0200
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A937831.2000304@4d-electronics.co.nz>
In-Reply-To: <4A937831.2000304@4d-electronics.co.nz>
Subject: Re: [PATCH] Add toolchain file generation to cmake bbclass
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
X-List-Received-Date: Tue, 25 Aug 2009 09:25:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Matthew Dombroski wrote:
> It is possible to make cmake use a toolchain file that defines flags, 
> search
> paths and any other cmake options.
> 
> The main reason for making openembedded generate a toolchain file is
> to enable the building of complex packages. Without it a package
> requiring Qt4 or boost (or one of many other packages) probably wont find
> the right libs and won't build properly.

I have had no problem with boost and with Qt4, I have been able to
achieve similar results without the toolchain file, only by using a
qt.conf file as Zecke had suggested to me.

Although the toolchain file is the preferred value according to the
cmake documentation, it has not been necessary to me.

I attach the recipe I use below (and have added a small comment in your
patch inline):

> DESCRIPTION = "aseba is an event-based architecture for distributed robots control"
> HOMEPAGE = "http://mobots.epfl.ch/aseba.html"
> LICENCE = "GPL"
> PR = "r1"
> 
> PV = "svn${SRCDATE}"
> DEPENDS = "dashel qt4-embedded"
> LEAD_SONAME = "libasebacore.so"
> 
> SRC_URI = "svn://svn.gna.org/svn/aseba;module=trunk"
> 
> S = "${WORKDIR}/trunk"
> 
> inherit qt4e cmake 
> 
> EXTRA_OECMAKE += "-DSHARED_LIBS:BOOL=ON -DCMD_LINE:BOOL=ON \
> 		-DQT_LIBRARY_DIR=${OE_QMAKE_LIBDIR_QT} \
> 		-DQT_INSTALL_LIBS=${OE_QMAKE_LIBDIR_QT} \
> 		-DQT_INCLUDE_DIR=${OE_QMAKE_INCDIR_QT} \
> 		-DQT_MOC_EXECUTABLE=${OE_QMAKE_MOC} \
> 		-DQT_UIC_EXECUTABLE=${OE_QMAKE_UIC} \
> 		-DQT_UIC3_EXECUTABLE=${OE_QMAKE_UIC3} \
> 		-DQT_RCC_EXECUTABLE=${OE_QMAKE_RCC} \
> 		-DQT_QMAKE_EXECUTABLE=${OE_QMAKE_QMAKE} \
> 		-DQT_QTCORE_INCLUDE_DIR=${OE_QMAKE_INCDIR_QT}/QtCore \ 
> 		-DQT_DBUSXML2CPP_EXECUTABLE=/usr/bin/qdbusxml2cpp \
> 		-DQT_DBUSCPP2XML_EXECUTABLE=/usr/bin/qdbuscpp2xml \
> 		"
> 
> export QT_CONF_PATH="${WORKDIR}/trunk/qt.conf"
> 
> do_configure_prepend() {
> 	echo "[Paths]"                                 > $QT_CONF_PATH
> 	echo "Prefix=${STAGING_DIR}/${HOST_SYS}/usr"  >> $QT_CONF_PATH
> 	echo "Documentation=${docdir}/${QT_DIR_NAME}" >> $QT_CONF_PATH
> 	echo "Headers=${STAGING_INCDIR}/${QT_DIR_NAME}" >> $QT_CONF_PATH
> 	echo "Libraries=${STAGING_LIBDIR}"            >> $QT_CONF_PATH
> 	echo "Binaries=${STAGING_BINDIR_NATIVE}"      >> $QT_CONF_PATH
> 	echo "Plugins=${libdir}/${QT_DIR_NAME}/plugins" >> $QT_CONF_PATH
> 	echo "Data=${datadir}/${QT_DIR_NAME}"         >> $QT_CONF_PATH
> 	echo "Translations=${datadir}/${QT_DIR_NAME}/translations" >> $QT_CONF_PATH
> 	echo "Settings=${sysconfdir}/${QT_DIR_NAME}"  >> $QT_CONF_PATH
> 	echo "Examples=${bindir}/${QT_DIR_NAME}/examples" >> $QT_CONF_PATH
> 	echo "Demos=${bindir}/${QT_DIR_NAME}/demos"   >> $QT_CONF_PATH
> }
> 
> do_stage() {
> 	oe_libinstall -so libasebacore ${STAGING_LIBDIR}
> 	oe_libinstall -so libasebacompiler ${STAGING_LIBDIR}
> 	oe_libinstall -so libasebavm ${STAGING_LIBDIR}
> 
> 	install -d ${STAGING_INCDIR}/aseba
> 	install -d ${STAGING_INCDIR}/aseba/common
> 	install -m 0644 common/consts.h ${STAGING_INCDIR}/aseba/common
> 	install -m 0644 common/types.h ${STAGING_INCDIR}/aseba/common
> 	install -d ${STAGING_INCDIR}/aseba/msg
> 	install -m 0644 msg/descriptions-manager.h ${STAGING_INCDIR}/aseba/msg
> 	install -m 0644 msg/msg.h ${STAGING_INCDIR}/aseba/msg
> 	install -d ${STAGING_INCDIR}/aseba/utils
> 	install -m 0644 utils/FormatableString.h ${STAGING_INCDIR}/aseba/utils
> 	install -m 0644 utils/utils.h ${STAGING_INCDIR}/aseba/utils
> }
> 
> FILES_${PN} += "${libdir}/libasebacore.so"
> FILES_${PN} += "${libdir}/libasebacompiler.so"
> FILES_${PN} += "${libdir}/libasebavm.so"


> 
> I have added compiler flags mainly for use outside of openembedded, so I
> can copy the generated toolchain file and use it manually.
> ---
>  classes/cmake.bbclass |   67 
> ++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 files changed, 66 insertions(+), 1 deletions(-)
> 
> diff --git a/classes/cmake.bbclass b/classes/cmake.bbclass
> index b5b7b86..38bed63 100644
> --- a/classes/cmake.bbclass
> +++ b/classes/cmake.bbclass
> @@ -11,6 +11,67 @@ OECMAKE_SOURCEPATH ?= "."
>  # "-C ${OECMAKE_BUILDPATH}". So it will run the right makefiles.
>  OECMAKE_BUILDPATH ?= ""
> 
> +# C/C++ Compiler (without cpu arch/tune arguments)
> +OECMAKE_C_COMPILER ?= "`echo ${CC} | sed 's/^\([^ ]*\).*/\1/'`"
> +OECMAKE_CXX_COMPILER ?= "`echo ${CXX} | sed 's/^\([^ ]*\).*/\1/'`"
> +
> +# Compiler flags
> +OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} 
> ${BUILD_CPPFLAGS}"
> +OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} 
> ${BUILD_CPPFLAGS} -fpermissive"
> +OECMAKE_C_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} -DNDEBUG"
> +OECMAKE_CXX_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} -DNDEBUG"
> +
> +
> +#
> +# Generate cmake toolchain file
> +#
> +cmake_generate_toolchain_file() {
> +  rm -f ${WORKDIR}/toolchain.cmake
> +  touch ${WORKDIR}/toolchain.cmake
> +
> +# CMake system name must be something like "Linux".
> +# This is important for cross-compiling.
> +  echo "set( CMAKE_SYSTEM_NAME" `echo ${SDK_OS} | sed 's/^./\u&/'` ")" 
>  >> ${WORKDIR}/toolchain.cmake
> +  echo "set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )" >> 
> ${WORKDIR}/toolchain.cmake
> +  echo "set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )" >> 
> ${WORKDIR}/toolchain.cmake
> +  echo "set( CMAKE_C_FLAGS \"${OECMAKE_C_FLAGS}\" CACHE STRING 
> \"OpenEmbedded CFLAGS\" )" >> ${WORKDIR}/toolchain.cmake
> +  echo "set( CMAKE_CXX_FLAGS \"${OECMAKE_CXX_FLAGS}\" CACHE STRING 
> \"OpenEmbedded CXXFLAGS\" )" >> ${WORKDIR}/toolchain.cmake
> +  echo "set( CMAKE_C_FLAGS_RELEASE \"${OECMAKE_C_FLAGS_RELEASE}\" CACHE 
> STRING \"CFLAGS for release\" )" >> ${WORKDIR}/toolchain.cmake
> +  echo "set( CMAKE_CXX_FLAGS_RELEASE \"${OECMAKE_CXX_FLAGS_RELEASE}\" 
> CACHE STRING \"CXXFLAGS for release\" )" >> ${WORKDIR}/toolchain.cmake
> +
> +# only search in the paths provided (from openembedded) so cmake doesnt 
> pick
> +# up libraries and tools from the native build machine
> +  echo "set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} 
> ${STAGING_DIR_NATIVE} ${CROSS_DIR} )" >> ${WORKDIR}/toolchain.cmake
> +  echo "set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )" >> 
> ${WORKDIR}/toolchain.cmake
> +  echo "set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )" >> 
> ${WORKDIR}/toolchain.cmake
> +  echo "set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )" >> 
> ${WORKDIR}/toolchain.cmake
> +# Use native cmake modules
> +  echo "set( CMAKE_MODULE_PATH 
> ${STAGING_DIR_NATIVE}/usr/share/cmake-2.6/Modules/ )" >> 
> ${WORKDIR}/toolchain.cmake
> +
> +# Boost libraries have an unusual naming convention thanks to bjam
> +  echo "set( Boost_COMPILER \"-gcc\" CACHE STRING \"Boost gcc string\" 
> )" >> ${WORKDIR}/toolchain.cmake
> +
> +# Qt4 support is complex because FindQt4.cmake requires a lot of 
> information
> +# about the Qt environment.
> +  if [ ${QMAKESPEC} ]
> +  then
> +# In the bbfile inherit one of qmake2/qt4e/qt4x11 and this section will be
> +# filled out
> +    echo "set( QT_HEADERS_DIR ${OE_QMAKE_INCDIR_QT} CACHE STRING \"Qt4 
> include dir\" )" >> ${WORKDIR}/toolchain.cmake
> +    echo "set( QT_LIBRARY_DIR ${OE_QMAKE_LIBDIR_QT} CACHE STRING \"Qt4 
> library dir\" )" >> ${WORKDIR}/toolchain.cmake
> +    echo "set( QT_QMAKE_EXECUTABLE ${OE_QMAKE_QMAKE} CACHE STRING 
> \"qmake2 binary\" )" >> ${WORKDIR}/toolchain.cmake
> +    echo "set( QT_MOC_EXECUTABLE ${OE_QMAKE_MOC} CACHE STRING \"Qt4 moc 
> binary\" )" >> ${WORKDIR}/toolchain.cmake
> +    echo "set( QT_UIC_EXECUTABLE ${OE_QMAKE_UIC} CACHE STRING \"Qt4 uic 
> binary\" )" >> ${WORKDIR}/toolchain.cmake
> +    echo "set( QT_UIC3_EXECUTABLE ${OE_QMAKE_UIC3} CACHE STRING \"Qt4 
> uic3 binary\" )" >> ${WORKDIR}/toolchain.cmake
> +    echo "set( QT_RCC_EXECUTABLE ${OE_QMAKE_RCC} CACHE STRING \"Qt4 rcc 
> binary\" )" >> ${WORKDIR}/toolchain.cmake
> +    echo "set( QT_DBUSXML2CPP_EXECUTABLE ${OE_QMAKE_QDBUSXML2CPP} CACHE 
> STRING \"Qt4 dbus xml2cpp binary\" )" >> ${WORKDIR}/toolchain.cmake
> +    echo "set( QT_DBUSCPP2XML_EXECUTABLE ${OE_QMAKE_QDBUSCPP2XML} CACHE 
> STRING \"Qt4 dbus cpp2xml binary\" )" >> ${WORKDIR}/toolchain.cmake
> +    echo "set( QT_LRELEASE_EXECUTABLE ${OE_QMAKE_LRELEASE} CACHE STRING 
> \"Qt4 lrelease binary\" )" >> ${WORKDIR}/toolchain.cmake
> +    echo "set( QT_LUPDATE_EXECUTABLE ${OE_QMAKE_LUPDATE} CACHE STRING 
> \"Qt4 lupdate binary\" )" >> ${WORKDIR}/toolchain.cmake
> +  fi
> +}
> +
> +
>  cmake_do_configure() {
>    if [ ${OECMAKE_BUILDPATH} ]
>    then
> @@ -18,9 +79,13 @@ cmake_do_configure() {
>      cd ${OECMAKE_BUILDPATH}
>    fi
> 
> +  cmake_generate_toolchain_file
> +
>    cmake ${OECMAKE_SOURCEPATH} \
> +    -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
>      -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
> -    -DCMAKE_FIND_ROOT_PATH=${STAGING_DIR_HOST} \
> +    -DCMAKE_VERBOSE_MAKEFILE=1 \
> +    -DCMAKE_BUILD_TYPE=Release \
>      ${EXTRA_OECMAKE} \
>      -Wno-dev


With my above config file, here is what I have to the cmake command:

>   cmake ${OECMAKE_SOURCEPATH} \
>     -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
>     -DCMAKE_FIND_ROOT_PATH="${STAGING_DIR_HOST};${STAGING_DIR_NATIVE}" \
>     -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=BOTH \
>     -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=ONLY \
>     -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY \
>     ${EXTRA_OECMAKE} \
>     -Wno-dev

which is similar to what you had in your toolchain.cmake file.

>  }
> -- 
> 1.6.3.3



