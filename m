Received: from [81.228.9.179] (helo=av6-1-sn3.vrr.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1KKhW1-0003Ff-6s
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jul 2008 00:36:29 +0200
Received: by av6-1-sn3.vrr.skanova.net (Postfix, from userid 502)
	id 11D5F37FC8; Mon, 21 Jul 2008 00:35:28 +0200 (CEST)
Received: from smtp3-2-sn3.vrr.skanova.net (smtp3-2-sn3.vrr.skanova.net
	[81.228.9.102])
	by av6-1-sn3.vrr.skanova.net (Postfix) with ESMTP id F157F37EC7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2008 00:35:27 +0200 (CEST)
Received: from [10.175.196.221] (213-67-42-101-no158.tbcn.telia.com
	[213.67.42.101])
	by smtp3-2-sn3.vrr.skanova.net (Postfix) with ESMTP id DEC6637E42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2008 00:35:27 +0200 (CEST)
Message-ID: <4883BCB1.7020102@atmel.com>
Date: Mon, 21 Jul 2008 00:31:13 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Thunderbird 2.0.0.14 (X11/20080421)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.6
Subject: binutils fails for AVR32
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sun, 20 Jul 2008 22:36:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


I managed to complete the AT91SAM9263 build, but
now I am caught in the configure hell when trying the AVR32.


I first got stuck in the binutils build since CC is defined as
"'CC=ccache" in the binutils Makefile, and this should be
"'CC=ccache gcc'"

(<OpenEmbedded>/build-avr32/tmp/work/avr32-angstrom-linux-uclibc/ \
binutils-cross-2.17-r6/binutils-2.17/ \
build.i686-linux.avr32-angstrom-linux-uclibc/Makefile)

The failure means that the initial quote character is dangling free.

I tried to check binutils "configure" where this is defined
but came to the conclusion that this was part of "$ac_arg"
and have not managed to dig any further.


Managed to fix that by patching binutils-avr32.inc
Added:

(cd ${B} && sed -i -e "s,'CC=ccache,'CC=ccache gcc'," Makefile)

to "do_avr32_configure_bfd" but then when making "intl", there
is a complaint that both the build and host is i686-linux.

| Configuring in ./intl
| configure: warning: build_alias=i686-linux: invalid host type
| configure: warning: host_alias=i686-linux: invalid host type
| configure: error: can only configure for one host and one target at a time
| make[1]: *** [configure-intl] Error 1
| make[1]: Leaving directory
`/mnt/home/ulf/OpenEmbedded/build-avr32/tmp/work/avr32-angstrom-linux-uclibc/binutils-cross-2.17-r6/binutils-2.17/build.i686-linux.avr32-angstrom-linux-uclibc'
| make: *** [all] Error 2
| FATAL: oe_runmake failed

These problems seems to be caused by build_alias, host_alias and
target_alias beeing passed to "configure", but these are only
supported by binutils-2.18 and not 2.17 which is used by the AVR32.

I am adding
~ (cd ${B} && sed -i -e "s,'host_alias=i686-linux',," Makefile)
~ (cd ${B} && sed -i -e "s,'build_alias=i686-linux',," Makefile)
~ (cd ${B} && sed -i -e "s,'target_alias=avr32-angstrom-linux-uclibc',,"
Makefile)

to the do_avr32_configure_bfd

host_alias etc. should not be generated in the first place for
binutils-2.17...

Anyone got the AVR32 toolchain to build properly using a recent version?

BR
Ulf Samuelsson

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIg7yxAyRRH5cXxqwRAiwtAJ9mgndjSDdeM/dgyHOR7wrjWOYMMACeNu/x
IK9zwA5tisI3ZSFeSkutq9Q=
=QY5Q
-----END PGP SIGNATURE-----


