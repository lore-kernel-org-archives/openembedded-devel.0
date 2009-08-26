Received: from [128.178.224.226] (helo=smtp3.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1MgGa4-0003cJ-B6
	for openembedded-devel@openembedded.org; Wed, 26 Aug 2009 13:22:24 +0200
Received: (qmail 16155 invoked by uid 107); 26 Aug 2009 11:04:21 -0000
X-Virus-Scanned: ClamAV
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp3.epfl.ch (AngelmatoPhylax SMTP proxy);
	Wed, 26 Aug 2009 13:04:21 +0200
Message-ID: <4A9516B5.9000602@epfl.ch>
Date: Wed, 26 Aug 2009 13:04:21 +0200
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 26 Aug 2009 11:22:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Valentin Longchamp wrote:
> Matthew Dombroski wrote: 
>>
>> Setting Qt environment data in cmake.bbclass may seem a bit out of 
>> place.  When you consider that cmake is distributed with scripts for 
>> configuring/detecting Qt it doesn't seem too bad.
>> It is definitly tidier than generating a qt.conf in every recipe. 
>> Adding all the Qt info in EXTRA_OECMAKE is doing the same work twice.
> 
> Well that's a point of view. From my point of view, not all cmake based 
> programs need that qt info, that's why I find it's cleaner to enable it 
> in the recipes that need these libraries.
> 
> About adding the EXTRA_OECMAKE, I have to check, but I think I needed to 
> define some so that the right qmake is found. I will try without or by 
> adding only the needed definitions.
> 

I have tried it, and the only thing I now have in the EXTRA_OECMAKE is 
QT_QMAKE_EXECUTABLE to be sure that it takes the one from staging and 
not the one from my system.

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
> 		-DQT_QMAKE_EXECUTABLE=${OE_QMAKE_QMAKE} \
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





