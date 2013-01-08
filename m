Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TsanM-0001cM-IW
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2013 16:08:53 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 286D9D22E9; Tue,  8 Jan 2013 15:53:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 4C13BD22CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jan 2013 15:53:19 +0100 (CET)
Message-ID: <50EC32DC.60801@linaro.org>
Date: Tue, 08 Jan 2013 15:53:16 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Problem with libtoolize in libmcrypt
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
X-List-Received-Date: Tue, 08 Jan 2013 15:08:53 -0000
X-Groupsio-MsgNum: 42576
Content-Type: multipart/mixed; boundary="------------080407030002000700000904"

--------------080407030002000700000904
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I have to build libmcrypt. Wrote first version of recipe (attached) and got into libtool problem:

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Tainting hash to force rebuild of task /home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/meta-aarch64/recipes/libmcrypt/libmcrypt_2.5.8.bb, do_configure
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_configure (see /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/work/aarch64-oe-linux/libmcrypt/2.5.8-r0/temp/log.do_configure.24548 for further information)
ERROR: Logfile of failure stored in: /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/work/aarch64-oe-linux/libmcrypt/2.5.8-r0/temp/log.do_configure.24548
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-little', 'bit-64', 'arm-common', 'common-linux', 'common-glibc', 'aarch64-linux', 'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.12.6
| Copyright (C) 2012 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| | Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.12
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/work/aarch64-oe-linux/libmcrypt/2.5.8-r0/libmcrypt-2.5.8/aclocal-copy/ --automake-acdir=/home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sysroots/x86_64-linux/usr/share/aclocal-1.12" autoreconf --verbose --install --force --exclude=autopoint -I /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/work/aarch64-oe-linux/libmcrypt/2.5.8-r0/libmcrypt-2.5.8/lib/
| autoreconf: Entering directory `.'
| autoreconf: configure.in: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/work/aarch64-oe-linux/libmcrypt/2.5.8-r0/libmcrypt-2.5.8/aclocal-copy/ --automake-acdir=/home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sysroots/x86_64-linux/usr/share/aclocal-1.12 -I /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/work/aarch64-oe-linux/libmcrypt/2.5.8-r0/libmcrypt-2.5.8/lib/ -I /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/work/aarch64-oe-linux/libmcrypt/2.5.8-r0/libmcrypt-2.5.8/lib/ --force
| aclocal: warning: autoconf input should be named 'configure.ac', not 'configure.in'
| autoreconf: configure.in: tracing
| autoreconf: configure.in: adding subdirectory libltdl to autoreconf
| autoreconf: Entering directory `libltdl'
| aclocal: warning: autoconf input should be named 'configure.ac', not 'configure.in'
| acinclude.m4:3740: warning: the serial number must appear before any macro definition
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in `..'.
| libtoolize: copying file `../ltmain.sh'
| libtoolize: putting auxiliary files in `..'.
| libtoolize: `config/compile' not found in `/home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sysroots/genericarmv8/usr/share/libtool'
| autoreconf: libtoolize failed with exit status: 1
| ERROR: autoreconf execution failed.
| ERROR: Function failed: do_configure (see /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/work/aarch64-oe-linux/libmcrypt/2.5.8-r0/temp/log.do_configure.24548 for further information)
ERROR: Task 3 (/home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/meta-aarch64/recipes/libmcrypt/libmcrypt_2.5.8.bb, do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 253 tasks of which 252 didn't need to be rerun and 1 failed.


config/compile is only present in build-arch sysroot. Ideas what is wrong?


--------------080407030002000700000904
Content-Type: text/plain; charset=UTF-8;
 name="libmcrypt_2.5.8.bb"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="libmcrypt_2.5.8.bb"

TElDRU5TRSA9ICJMR1BMdjIuMSIKTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORy5M
SUI7bWQ1PWJiYjQ2MTIxMWEzM2IxMzRkNDJlZDVlZTgwMmIzN2ZmIgoKU1JDX1VSSSA9ICIke1NP
VVJDRUZPUkdFX01JUlJPUn0vcHJvamVjdC9tY3J5cHQvTGlibWNyeXB0LyR7UFZ9L2xpYm1jcnlw
dC0ke1BWfS50YXIuZ3oiCgpTUkNfVVJJW21kNXN1bV0gPSAiMDgyMTgzMGQ5MzBhODZhNWM2OTEx
MDgzN2M1NWI3ZGEiClNSQ19VUklbc2hhMjU2c3VtXSA9ICJlNGViNmMwNzRiYmFiMTY4YWM0N2I5
NDdjMTk1ZmY4Y2VmOWQ1MWEyMTFjZGQxOGNhOWM5ZWYzNGQyN2EzNzNlIgoKaW5oZXJpdCBhdXRv
dG9vbHMgZ2V0dGV4dCBiaW5jb25maWcK

--------------080407030002000700000904--
