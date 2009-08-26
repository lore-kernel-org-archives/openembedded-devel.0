Received: from [128.178.224.219] (helo=smtp0.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1MgMTX-0002dv-UY
	for openembedded-devel@openembedded.org; Wed, 26 Aug 2009 19:40:00 +0200
Received: (qmail 29534 invoked by uid 107); 26 Aug 2009 17:21:48 -0000
X-Virus-Scanned: ClamAV
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp0.epfl.ch (AngelmatoPhylax SMTP proxy);
	Wed, 26 Aug 2009 19:21:48 +0200
Message-ID: <4A956F2C.70301@epfl.ch>
Date: Wed, 26 Aug 2009 19:21:48 +0200
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A937831.2000304@4d-electronics.co.nz>
	<4A93A9E3.7090605@epfl.ch>	<4A9461C3.2000406@4d-electronics.co.nz>
	<4A94DA90.8090306@epfl.ch>
In-Reply-To: <4A94DA90.8090306@epfl.ch>
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
X-List-Received-Date: Wed, 26 Aug 2009 17:40:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Valentin Longchamp wrote:
> Matthew Dombroski wrote:
>>
>>> Although the toolchain file is the preferred value according to the
>>> cmake documentation, it has not been necessary to me.
>>
>> The effect of a toolchain file is the same as that of defining lots of 
>> options in EXTRA_OECMAKE.
>> personally, I think it is cleaner. The ability to use it outside of 
>> openembedded is really useful to me also.
> 
> I agree that it is the same. It's just that it was done until now like 
> that in OE, so I chose that way. However one advantage that I see of 
> defining things directly in the recipes and not in a toolchain file, is 
> that you can easily add definitions using EXTRA_OECMAKE in every recipe. 
> Is cmake able to take two toolchain files (one from cmake.bbclass and 
> one from the recipes with the needed libraries) without having to 
> rewrite the do_configure in the recipe ?
> 
> This comes back to the point above: do we need to define all the 
> libraries that could come with cmake-based programs in cmake.bbclass ? 
>  From my point of view, this is definitely something related to the 
> recipes.
> 

I have been thinking about this today I here is a proposition that takes 
the better of both our approaches. I agree that having the toolchain 
file is much cleaner, however it should be possible to add things to 
this toolchain file in the recipes according to what libraries are needed.

So I have added a task that generates a generic toolchain file, and the 
idea is to add all the needed defines for additionnal libraries in the 
recipe, in a do_generate_toolchain_file_append() function.

Here is my example recipe, sending the patch with git.

Val

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
> EXTRA_OECMAKE += "-DSHARED_LIBS:BOOL=ON -DCMD_LINE:BOOL=ON"
> 
> do_generate_toolchain_file_append() {
> 	echo "set( QT_HEADERS_DIR ${OE_QMAKE_INCDIR_QT} CACHE STRING \"Qt4 include dir\" )" >> ${WORKDIR}/toolchain.cmake
> 	echo "set( QT_LIBRARY_DIR ${OE_QMAKE_LIBDIR_QT} CACHE STRING \"Qt4 library dir\" )" >> ${WORKDIR}/toolchain.cmake
> 	echo "set( QT_QMAKE_EXECUTABLE ${OE_QMAKE_QMAKE} CACHE STRING \"qmake2 binary\" )" >> ${WORKDIR}/toolchain.cmake
> 	echo "set( QT_MOC_EXECUTABLE ${OE_QMAKE_MOC} CACHE STRING \"Qt4 moc binary\" )" >> ${WORKDIR}/toolchain.cmake
> 	echo "set( QT_UIC_EXECUTABLE ${OE_QMAKE_UIC} CACHE STRING \"Qt4 uic binary\" )" >> ${WORKDIR}/toolchain.cmake
> 	echo "set( QT_UIC3_EXECUTABLE ${OE_QMAKE_UIC3} CACHE STRING \"Qt4 uic3 binary\" )" >> ${WORKDIR}/toolchain.cmake
> 	echo "set( QT_RCC_EXECUTABLE ${OE_QMAKE_RCC} CACHE STRING \"Qt4 rcc binary\" )" >> ${WORKDIR}/toolchain.cmake
> 	echo "set( QT_DBUSXML2CPP_EXECUTABLE ${OE_QMAKE_QDBUSXML2CPP} CACHE STRING \"Qt4 dbus xml2cpp binary\" )" >> ${WORKDIR}/toolchain.cmake
> 	echo "set( QT_DBUSCPP2XML_EXECUTABLE ${OE_QMAKE_QDBUSCPP2XML} CACHE STRING \"Qt4 dbus cpp2xml binary\" )" >> ${WORKDIR}/toolchain.cmake
> 	echo "set( QT_LRELEASE_EXECUTABLE ${OE_QMAKE_LRELEASE} CACHE STRING \"Qt4 lrelease binary\" )" >> ${WORKDIR}/toolchain.cmake
> 	echo "set( QT_LUPDATE_EXECUTABLE ${OE_QMAKE_LUPDATE} CACHE STRING \"Qt4 lupdate binary\" )" >> ${WORKDIR}/toolchain.cmake 
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




