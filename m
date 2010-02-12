Received: from qmta11.emeryville.ca.mail.comcast.net ([76.96.27.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enelson1000@comcast.net>) id 1Ng0X5-00087p-Mo
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 19:46:31 +0100
Received: from omta11.emeryville.ca.mail.comcast.net ([76.96.30.36])
	by qmta11.emeryville.ca.mail.comcast.net with comcast
	id h4aT1d00C0mlR8UAB6gMcU; Fri, 12 Feb 2010 18:40:21 +0000
Received: from [192.168.1.217] ([173.13.189.149])
	by omta11.emeryville.ca.mail.comcast.net with comcast
	id h6ip1d0063DqXwV8X6ipLN; Fri, 12 Feb 2010 18:42:49 +0000
From: ed <enelson1000@comcast.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Feb 2010 10:42:47 -0800
Message-Id: <1266000167.3645.9.camel@ed-hp-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-SA-Exim-Connect-IP: 76.96.27.211
X-SA-Exim-Mail-From: enelson1000@comcast.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Python-sip message in build log
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
X-List-Received-Date: Fri, 12 Feb 2010 18:46:31 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I am building an image for mini2440 which includes qt4-embedded and
pyqt.  The image built with no errors.  When I try and run a pyqt
program on the mini2440 it complains that SIP is not installed.

Looking at the build log file I see the following.  Is this a problem?

===============================

NOTE: Running task 1326 of 2849 (ID:
1532, /home/ed/mini2440/OE/openembedded/recipes/python/python-sip_4.7.9.bb, do_setscene)
NOTE: <type 'exceptions.TypeError'>:exceptions must be classes or
instances, not str while evaluating:
${@python_dir(d)}
NOTE: <type 'exceptions.TypeError'>:exceptions must be classes or
instances, not str while evaluating:
	install -d ${D}${libdir}/${PYTHON_DIR}/site-packages/
	install -m 0755 libsip.so.1.0.0
${D}${libdir}/${PYTHON_DIR}/site-packages/sip.so

NOTE: <type 'exceptions.TypeError'>:exceptions must be classes or
instances, not str while evaluating:
${@python_dir(d)}
NOTE: <type 'exceptions.TypeError'>:exceptions must be classes or
instances, not str while evaluating:
	install -d ${STAGING_LIBDIR_NATIVE}/${PYTHON_DIR}/site-packages/
	# sipconfig.py sipdistutils.py
	install -m 0644 sip.h ${STAGING_INCDIR}/sip.h

NOTE: <type 'exceptions.TypeError'>:exceptions must be classes or
instances, not str while evaluating:
${@python_dir(d)}
NOTE: <type 'exceptions.TypeError'>:exceptions must be classes or
instances, not str while evaluating:
  TEMPLATE=lib                          CONFIG=console
DESTDIR=                          VERSION=1.0.0
TARGET=sip                          DEFINES=SIP_QT_SUPPORT
INCLUDEPATH+=.                          INCLUDEPATH+=
${STAGING_INCDIR}/${PYTHON_DIR}                          INCLUDEPATH+=
${STAGING_INCDIR}
NOTE: <type 'exceptions.TypeError'>:exceptions must be classes or
instances, not str while evaluating:
	case ${QMAKESPEC} in
	*linux-oe-g++|*linux-uclibc-oe-g++|*linux-gnueabi-oe-g++|
*linux-uclibcgnueabi-oe-g++)
		;;
	*-oe-g++)
		die Unsupported target ${TARGET_OS} for oe-g++ qmake spec
		;;
	*)
		oenote Searching for qmake spec file
		paths="${QMAKE_MKSPEC_PATH}/qws/${TARGET_OS}-${TARGET_ARCH}-g++"
		paths="${QMAKE_MKSPEC_PATH}/${TARGET_OS}-g++ $paths"

		if (echo "${TARGET_ARCH}"|grep -q 'i.86'); then
			paths="${QMAKE_MKSPEC_PATH}/qws/${TARGET_OS}-x86-g++ $paths"
		fi
		for i in $paths; do
			if test -e $i; then
				export QMAKESPEC=$i
				break
			fi
		done
		;;
	esac

	oenote "using qmake spec in ${QMAKESPEC}, using profiles
'${QMAKE_PROFILES}'"

	if [ -z "${QMAKE_PROFILES}" ]; then
		PROFILES="`ls *.pro`"
	else
		PROFILES="${QMAKE_PROFILES}"
	fi

	if [ -z "$PROFILES" ]; then
		die "QMAKE_PROFILES not set and no profiles found in $PWD"
        fi

	if [ ! -z "${EXTRA_QMAKEVARS_POST}" ]; then
		AFTER="-after"
		QMAKE_VARSUBST_POST="${EXTRA_QMAKEVARS_POST}"
		oenote "qmake postvar substitution: ${EXTRA_QMAKEVARS_POST}"
	fi

	if [ ! -z "${EXTRA_QMAKEVARS_PRE}" ]; then
		QMAKE_VARSUBST_PRE="${EXTRA_QMAKEVARS_PRE}"
		oenote "qmake prevar substitution: ${EXTRA_QMAKEVARS_PRE}"
	fi

#oenote "Calling '${OE_QMAKE_QMAKE} -makefile -spec ${QMAKESPEC} -o
Makefile $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST'"
	unset QMAKESPEC || true
	${OE_QMAKE_QMAKE} -makefile -spec ${QMAKESPEC} -o Makefile
$QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST || die "Error
calling ${OE_QMAKE_QMAKE} on $PROFILES"

NOTE: Running task 1327 of 2849 (ID:
1533, /home/ed/mini2440/OE/openembedded/recipes/python/python-sip_4.7.9.bb, do_fetch)

=====================================





