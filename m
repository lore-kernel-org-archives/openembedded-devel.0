Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QvWfi-0001ha-Tt
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Aug 2011 17:44:19 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QvWb9-00003c-85 from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Aug 2011 08:39:35 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 22 Aug 2011 17:39:31 +0200
Message-ID: <989A078976CDAD4CB2DC976EEF70E2A5068A5487@eu2-mail.mgc.mentorg.com>
In-Reply-To: <1314023559-15827-1-git-send-email-noor_ahsan@mentor.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [PATCH][meta-oe] lmbench: Added 3.0-a9 version recipe files
Thread-Index: Acxg2F5eALlf56ZsTS61/Yff9K22tgACTg5Q
References: <1314023559-15827-1-git-send-email-noor_ahsan@mentor.com>
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "Ahsan, Noor" <Noor_Ahsan@mentor.com>,
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] lmbench: Added 3.0-a9 version recipe files
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
X-List-Received-Date: Mon, 22 Aug 2011 15:44:19 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Kindly ignore this patch I missed some stuff in this patch .... I'll
resent the patch again.

> -----Original Message-----
> From: Ahsan, Noor
> Sent: Monday, August 22, 2011 7:33 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Ahsan, Noor
> Subject: [PATCH][meta-oe] lmbench: Added 3.0-a9 version recipe files
>=20
> From: Noor Ahsan <noor_ahsan@mentor.com>
>=20
> * Added recipe file to build 3.0-a9 version.
>=20
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
>  .../lmbench-3.0-a9/update-results-script.patch     |  155
> ++++++++++++++++++++
>  meta-oe/recipes-support/lmbench/lmbench_3.0-a9.bb  |   75 ++++++++++
>  2 files changed, 230 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/lmbench/lmbench-3.0-a9/update-
> results-script.patch b/meta-oe/recipes-support/lmbench/lmbench-3.0-
> a9/update-results-script.patch
> new file mode 100644
> index 0000000..3feb657
> --- /dev/null
> +++ b/meta-oe/recipes-support/lmbench/lmbench-3.0-a9/update-results-
> script.patch
> @@ -0,0 +1,155 @@
> +Now that we have our binaries in /usr/bin rather than the normal
> +lmbench hierarchy we need to update the scripts as well to bave well
> here.
> +Index: lmbench-3.0-a9/scripts/results
> =
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- lmbench-3.0-a9.orig/scripts/results
> ++++ lmbench-3.0-a9/scripts/results
> +@@ -8,11 +8,11 @@ RESULTS=3Dresults/$OS
> + BASE=3D../$RESULTS/`uname -n`
> + EXT=3D0
> +
> +-if [ ! -f "../bin/$OS/$CONFIG" ]
> ++if [ ! -f "$CONFIG" ]
> + then	echo "No config file?"
> + 	exit 1
> + fi
> +-. ../bin/$OS/$CONFIG
> ++. $CONFIG
> +
> + if [ ! -d ../$RESULTS ]
> + then	mkdir -p ../$RESULTS
> +@@ -23,11 +23,9 @@ do      EXT=3D`expr $EXT + 1`
> + 	RESULTS=3D$BASE.$EXT
> + done
> +
> +-cd ../bin/$OS
> +-PATH=3D.:${PATH}; export PATH
> + export SYNC_MAX
> + export OUTPUT
> +-lmbench $CONFIG 2>../${RESULTS}
> ++lmbench $CONFIG 2>${RESULTS}
> +
> + if [ X$MAIL =3D Xyes ]
> + then	echo Mailing results
> +Index: lmbench-3.0-a9/scripts/config-run
> =
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- lmbench-3.0-a9.orig/scripts/config-run
> ++++ lmbench-3.0-a9/scripts/config-run
> +@@ -132,20 +132,20 @@ export LMBENCH_SCHED
> +
>
#######################################################################
> #####
> + echo $L; echo "";
> + echo "Hang on, we are calculating your timing granularity."
> +-../bin/$OS/msleep 250
> +-ENOUGH=3D`../bin/$OS/enough`
> ++msleep 250
> ++ENOUGH=3D`enough`
> + export ENOUGH
> + echo "OK, it looks like you can time stuff down to $ENOUGH usec
> resolution."
> + echo ""
> + echo "Hang on, we are calculating your timing overhead."
> +-../bin/$OS/msleep 250
> +-TIMING_O=3D`../bin/$OS/timing_o`
> ++msleep 250
> ++TIMING_O=3D`timing_o`
> + export TIMING_O
> + echo "OK, it looks like your gettimeofday() costs $TIMING_O usecs."
> + echo ""
> + echo "Hang on, we are calculating your loop overhead."
> +-../bin/$OS/msleep 250
> +-LOOP_O=3D`../bin/$OS/loop_o`
> ++msleep 250
> ++LOOP_O=3D`loop_o`
> + export LOOP_O
> + echo "OK, it looks like your benchmark loop costs $LOOP_O usecs."
> + echo ""
> +@@ -177,7 +177,7 @@ then
> + fi
> + if [ X$MB =3D X ]
> + then	$ECHON "Probing system for available memory: $ECHOC"
> +-	MB=3D`../bin/$OS/memsize 4096`
> ++	MB=3D`memsize 4096`
> + fi
> + TOTAL_MEM=3D$MB
> + MB=3D`echo \( $MB \* 7 \) / 10 | bc 2>/dev/null`
> +@@ -205,9 +205,9 @@ fi
> + # Certain machines tend to barf when you try and bcopy 8MB.
> + # Figure out how much we can use.
> + echo "Checking to see if you have $MB MB; please wait for a
> moment..."
> +-MB=3D`../bin/$OS/memsize $MB`
> +-MB=3D`../bin/$OS/memsize $MB`
> +-MB=3D`../bin/$OS/memsize $MB`
> ++MB=3D`memsize $MB`
> ++MB=3D`memsize $MB`
> ++MB=3D`memsize $MB`
> + if [ `expr $SYNC_MAX \* $MB` -gt `expr $TOTAL_MEM` ]
> + then
> + 	MB=3D`expr $TOTAL_MEM / $SYNC_MAX`
> +@@ -223,8 +223,8 @@ then	echo Warning: you have only ${MB}MB
> + fi
> +
> + echo "Hang on, we are calculating your cache line size."
> +-../bin/$OS/msleep 250
> +-LINE_SIZE=3D`../bin/$OS/lm_line -M ${MB}M`
> ++msleep 250
> ++LINE_SIZE=3D`lm_line -M ${MB}M`
> + export LINE_SIZE
> + echo "OK, it looks like your cache line is $LINE_SIZE bytes."
> + echo ""
> +@@ -479,7 +479,7 @@ EOF
> + 	then
> + 		for i in $disks
> + 		do	if [ -r $i ]
> +-			then	../bin/$OS/flushdisk $i
> ++			then	flushdisk $i
> + 				if [ $? -eq 1 ]
> + 				then	echo "Must be root to run disk
> benchmarks."
> + 					echo "Root is needed to flush
the buffer
> cache"
> +@@ -584,7 +584,7 @@ fi
> + echo $L
> + echo ""
> + echo "Calculating mhz, please wait for a moment..."
> +-MHZ=3D`../bin/$OS/mhz`
> ++MHZ=3D`mhz`
> + cat<<EOF
> + I think your CPU mhz is
> +
> +@@ -689,9 +689,9 @@ esac
> +
> + INFO=3D`../scripts/info`
> + if [ $MAIL =3D yes ]
> +-then	if [ ! -f ../bin/$OS/$INFO ]
> +-	then	cp ../scripts/info-template ../bin/$OS/$INFO
> +-		chmod +w ../bin/$OS/$INFO
> ++then	if [ ! -f $INFO ]
> ++	then	cp ../scripts/info-template $INFO
> ++		chmod +w $INFO
> + 		REUSE=3Dno
> + 	else
> + 		REUSE=3Dview
> +@@ -705,7 +705,7 @@ then	if [ ! -f ../bin/$OS/$INFO ]
> + 				;;
> + 			[Vv]*)	REUSE=3Dview
> + 				echo $L
> +-				more ../bin/$OS/$INFO
> ++				more $INFO
> + 				echo $L
> + 				;;
> + 	    		*)	REUSE=3Dyes
> +@@ -733,7 +733,7 @@ EOF
> + 		then	EDITOR=3D$TMP
> + 		fi
> + 		if [ X$EDITOR !=3D "none" ]
> +-		then	$EDITOR ../bin/$OS/`../scripts/info`
> ++		then	$EDITOR `../scripts/info`
> + 		fi
> + 	fi
> + fi
> +@@ -750,7 +750,7 @@ EOF
> +
> + VERSION=3D`../scripts/version`
> +
> +-C=3D../bin/$OS/`../scripts/config`
> ++C=3D`../scripts/config`
> + echo DISKS=3D\"$DISKS\" > $C
> + echo DISK_DESC=3D\"$DISK_DESC\" >> $C
> + echo OUTPUT=3D$OUTPUT >> $C
> diff --git a/meta-oe/recipes-support/lmbench/lmbench_3.0-a9.bb b/meta-
> oe/recipes-support/lmbench/lmbench_3.0-a9.bb
> new file mode 100644
> index 0000000..1076eeb
> --- /dev/null
> +++ b/meta-oe/recipes-support/lmbench/lmbench_3.0-a9.bb
> @@ -0,0 +1,75 @@
> +SECTION =3D "console/utils"
> +DESCRIPTION =3D "Tools for performance analysis."
> +LICENSE =3D "GPL"
> +LICENSE =3D "GPLv2+ & LGPLv2.1+"
> +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c28b \
> +                    file://COPYING-
> 2;md5=3D8e9aee2ccc75d61d107e43794a25cdf9"
> +RDEPENDS_${PN} =3D "debianutils"
> +
> +PR =3D "r0"
> +
> +inherit autotools
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
> +	   file://lmbench-run \
> +	   file://rename-line-binary.patch \
> +	   file://update-results-script.patch \
> +	   file://obey-ranlib.patch"
> +SRC_URI[md5sum] =3D "b3351a3294db66a72e2864a199d37cbf"
> +SRC_URI[sha256sum] =3D
> "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
> +
> +S =3D "${WORKDIR}/lmbench-${PV}"
> +
> +EXTRA_OEMAKE =3D 'CC=3D"${CC}" AR=3D"${AR}" RANLIB=3D"${RANLIB}"
> CFLAGS=3D"${CFLAGS}" \
> +		LDFLAGS=3D"${LDFLAGS}" LD=3D"${LD}" OS=3D"${TARGET_SYS}" \
> +		TARGET=3D"${TARGET_OS}" BASE=3D"${prefix}"'
> +
> +
> +python do_unpack () {
> +	bb.build.exec_func('base_do_unpack', d)
> +	bb.build.exec_func('byebk_do_unpack', d)
> +}
> +
> +byebk_do_unpack () {
> +	find ${S}/.. -name BitKeeper -o -name SCCS | xargs rm -rf
> +}
> +
> +do_configure() {
> +	:
> +}
> +
> +do_compile () {
> +	. ${CONFIG_SITE}
> +	if [ X"$ac_cv_uint" =3D X"yes" ]; then
> +		CFLAGS=3D"${CFLAGS} -DHAVE_uint"
> +	fi
> +	install -d ${S}/bin/${TARGET_SYS}
> +	oe_runmake -C src
> +}
> +
> +do_install () {
> +	install -d ${D}${localstatedir}/run/lmbench \
> +		   ${D}${bindir} ${D}${mandir} ${D}${libdir}/lmbench \
> +		   ${D}${datadir}/lmbench/scripts
> +	oe_runmake 'BASE=3D${D}${prefix}' \
> +		    -C src install
> +	mv ${D}${bindir}/line ${D}${bindir}/lm_line
> +	mv ${D}${prefix}/man/* ${D}${mandir}/
> +	install -m 0755 ${WORKDIR}/lmbench-run ${D}${bindir}/
> +	sed -i -e 's,^SHAREDIR=3D.*$,SHAREDIR=3D${datadir}/${PN},;' \
> +	       -e 's,^BINDIR=3D.*$,BINDIR=3D${libdir}/${PN},;' \
> +	       -e
's,^CONFIG=3D.*$,CONFIG=3D$SHAREDIR/`$SCRIPTSDIR/config`,;'
> \
> +	       ${D}${bindir}/lmbench-run
> +	install -m 0755 ${S}/scripts/lmbench ${D}${bindir}
> +	install -m 0755 ${S}/scripts/* ${D}${datadir}/lmbench/scripts
> +
> +        if [ -f ${WORKDIR}/CONFIG.${MACHINE} ]; then
> +                install -d ${D}${localstatedir}/lib/lmbench/config
> +                mkdir -p ${D}/${datadir}/lmbench/bin/${TARGET_PREFIX}
> +                install -m 0644 ${WORKDIR}/CONFIG.${MACHINE} \
> +
> 	${D}/${datadir}/lmbench/bin/${TARGET_PREFIX}/CONFIG.${MACHINE}
> +        fi
> +
> +}
> +
> +FILES_${PN} +=3D "${datadir}/lmbench"
> --
> 1.7.0.4



