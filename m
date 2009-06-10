Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MEPMc-0003cC-9E
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Jun 2009 17:05:18 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MEPDE-0000sq-AP
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Jun 2009 15:55:36 +0100
Received: from mill.internal.reciva.com ([192.168.106.87])
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MEPDA-00013n-Ry
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Jun 2009 15:55:36 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jun 2009 15:55:27 +0100
Message-Id: <1244645727.21585.66.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: uclibc.inc oddities
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
X-List-Received-Date: Wed, 10 Jun 2009 15:05:18 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I discovered the following fragment in uclibc.inc:

# do_stage barfs on a CC with whitepspace, therefore put the
'HOST_CC_ARCH' in
# the CFLAGS (for when building the utils).
OEMAKE_NO_CC = "'STRIPTOOL=true' 'LD=${LD}' \
		'LOCALE_DATA_FILENAME=${UCLIBC_LOCALE_FILE}'"
EXTRA_OEMAKE = "${OEMAKE_NO_CC} 'CC=${CC}' \
		'HOSTCFLAGS=-I${STAGING_INCDIR_NATIVE}'"
EXTRA_OEMAKE_task_do_package = "${OEMAKE_NO_CC}"
EXTRA_OEMAKE_task_do_populate_staging = "${OEMAKE_NO_CC}"

The intent seems to be to avoid passing ${CC} to do_package or do_stage
in order to work around what I guess is a build system limitation.
However, this is breaking uclibc-initial for me because of a second
quirk, namely that this recipe has a blank do_compile() and builds
everything inside do_stage():

do_stage() {
	# Install initial headers into the cross dir
	oe_runmake V=1 PREFIX= DEVEL_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
		RUNTIME_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
		pregen install_dev
	oe_runmake V=1 PREFIX= DEVEL_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
		RUNTIME_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
		lib/crt1.o lib/crti.o lib/crtn.o

	install -d ${CROSS_DIR}/${TARGET_SYS}	
	ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include

	# This conflicts with the c++ version of this header
	rm -f ${UCLIBC_STAGE_PREFIX}/include/bits/atomicity.h
	install -m 644 lib/crt[1in].o ${UCLIBC_STAGE_PREFIX}/lib
	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
		-o ${UCLIBC_STAGE_PREFIX}/lib/libc.so

}

In my configuration, ${CC} contains some flags that are required for
correct compilation: trying to build without them just results in a
final link failure.

Deleting the assignment to EXTRA_OEMAKE_task_do_populate_staging allows
my uclibc-initial build to succeed, and doesn't seem to have introduced
any other obvious problems.  However, since I'm not sure exactly what
the original problem was that this code was trying to avoid, I can't
tell whether reinstating ${CC} is going to cause trouble for some other
configuration.

I'm also not entirely sure whether the behaviour of uclibc-initial is
deliberate, or whether this "compile the entire library inside do_stage"
thing has been introduced by mistake.

Can anybody shed any light on either of those two issues?

thanks

p.




