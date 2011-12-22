Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RdenP-0008Jv-Ic for openembedded-devel@lists.openembedded.org;
	Thu, 22 Dec 2011 10:18:40 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RdegX-0006Cw-32 for openembedded-devel@lists.openembedded.org;
	Thu, 22 Dec 2011 10:11:33 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2011 10:11:33 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2011 10:11:33 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 22 Dec 2011 10:11:14 +0100
Message-ID: <jcus7i$5a2$1@dough.gmane.org>
References: <1324447304-4874-1-git-send-email-b19537@freescale.com>
	<1324447304-4874-7-git-send-email-b19537@freescale.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1324447304-4874-7-git-send-email-b19537@freescale.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [PATCH v3 meta-oe 7/7] xfsprogs: add version 3.1.7
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
X-List-Received-Date: Thu, 22 Dec 2011 09:18:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 21-12-11 07:01, b19537@freescale.com schreef:
> From: Zhenhua Luo <b19537@freescale.com>
> 
> xfsprogs provides XFS filesystem utilities.

I get:

NOTE: package xfsprogs-3.1.7-r0: task do_install: Started
ERROR: Function 'do_install' failed (see
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/xfsprogs-3.1.7-r0/temp/log.do_install.32411
for further information)
ERROR: Logfile of failure stored in:
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/xfsprogs-3.1.7-r0/temp/log.do_install.32411
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| ERROR: Function 'do_install' failed (see
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/xfsprogs-3.1.7-r0/temp/log.do_install.32411
for further information)
| + cd
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/xfsprogs-3.1.7-r0/xfsprogs-3.1.7
| + do_install
| + export
DIST_ROOT=/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/xfsprogs-3.1.7-r0/image
| +
DIST_ROOT=/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/xfsprogs-3.1.7-r0/image
| + oe_runmake install
| + '[' xmake = x ']'
| + bbnote make LIBTOOL=arm-angstrom-linux-gnueabi-libtool install
| + echo 'NOTE: make LIBTOOL=arm-angstrom-linux-gnueabi-libtool install'
| NOTE: make LIBTOOL=arm-angstrom-linux-gnueabi-libtool install
| + make LIBTOOL=arm-angstrom-linux-gnueabi-libtool install
| Installing include-install
| make[1]: Nothing to be done for `install'.
| Installing libxfs-install
| make[1]: Nothing to be done for `install'.
| Installing libxlog-install
| make[1]: Nothing to be done for `install'.
| Installing libxcmd-install
| make[1]: Nothing to be done for `install'.
| Installing libhandle-install
| cd ../libhandle/.libs; ../../install-sh -o koen -g koen -m 755 -d /lib;
../../install-sh -o koen -g koen -m 644 -T so_dot_version libhandle.lai
/lib; ../../install-sh -o koen -g koen -T so_dot_current libhandle.lai /lib
| chown: invalid user: `koen:koen'
| chown: invalid user: `koen:koen'
| Installing libdisk-install
| make[1]: Nothing to be done for `install'.
| Installing copy-install
| ../install-sh -o koen -g koen -m 755 -d /usr/sbin
| chown: invalid user: `koen:koen'
| make[1]: *** [install] Error 1
| make: *** [copy-install] Error 2
| + die 'oe_runmake failed'
| + bbfatal 'oe_runmake failed'
| + echo 'ERROR: oe_runmake failed'
| ERROR: oe_runmake failed
| + exit 1


I've pushed the other 6 patches.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7y9CoACgkQMkyGM64RGpFmDwCfU8GxakEJlbraZyyELIeApzzi
99MAoKaLUGwa5QvVnuxGsGIFqVW4+nPf
=SmzT
-----END PGP SIGNATURE-----



