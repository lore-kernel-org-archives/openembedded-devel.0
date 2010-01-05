Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dothemango@gmail.com>) id 1NSCnP-00048Z-I3
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 18:02:18 +0100
Received: by pwi18 with SMTP id 18so10266243pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2010 09:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=NG6Pgj7C3sGJyOqVheIn7Xv7UZvFjYpCTxBinmRZGDo=;
	b=VZhoUoobjpzCtvDtKe/mLTAExO7Dz5E8Xt68CpOO4bRBYTdL7f0EG7d+Onb933iAgD
	nuBUXiyTzklXWkYIe2FbUn8PYX5cktL00oSrXWHKBEbvv/vFVHWmMP+qM6BdRlpmCM1+
	lzUiN8BP6S9S2q1IHBr2v3pjRnOl6MV47OAIk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=A9DJbvJ4GhTZZHNHAcqLP0cYhoc8IosYt0RRYnwKalPGO63pB9FsPQy+JRUt6vqdj2
	hCcrgABX3KHquxh0D2TVUAjK+n6pjcx/X0t0unE3b6wb1YnZVP1mDqwiu1WO32egyOmn
	zuTKX70u0Yj6lRT3gGxjWQXBndjX0F7sG/Q1g=
MIME-Version: 1.0
Sender: dothemango@gmail.com
Received: by 10.141.91.9 with SMTP id t9mr12151497rvl.127.1262710810143; Tue, 
	05 Jan 2010 09:00:10 -0800 (PST)
Date: Tue, 5 Jan 2010 18:00:10 +0100
X-Google-Sender-Auth: b6cb27f14525de88
Message-ID: <325d766d1001050900y3eef724eu5eb68fc04ec969d7@mail.gmail.com>
From: martin mangard <martin@mangard.at>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: dothemango@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Error building gcc-cross
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
X-List-Received-Date: Tue, 05 Jan 2010 17:02:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

hello

I wanna run an application which depends on libstdc++.so.5.   I use
the default x86-machine configuration (i486) of the
"org.openembedded.dev" branch  to build the image. The default
provider for the libstdc++ is in my case "gcc-cross_4.3.4.bb" which
successfully builds "libstdc++.so.6"

I would like to create a  libstdc++ -compatibility package which
provides an additional  binary of the older version of libstdc++.
I started to play with the gcc-cross recipe.   "bitbake -b
gcc-cross_3.4.4.bb"  leaded to the following error.


.
.

| ccache gcc  -DPACKAGE=\"zlib\" -DVERSION=\"1.1.4\" -DHAVE_UNISTD_H=1
-DHAVE_GETPAGESIZE=1 -DHAVE_MMAP=1 -DHAVE_MEMCPY=1 -DHAVE_STRERROR=1
-DHAVE_UNISTD_H=1  -I.
-I/media/disk/mydistro/output_mangard/work/i486-angstrom-linux/gcc-cross-3.4.4-r14.1/gcc-3.4.4/zlib
     -isystem/media/disk/mydistro/output_mangard/staging/i686-linux/usr/include
-O2 -g  -m64 -c
/media/disk/mydistro/output_mangard/work/i486-angstrom-linux/gcc-cross-3.4.4-r14.1/gcc-3.4.4/zlib/adler32.c
| In file included from /usr/include/features.h:354,
|                  from /usr/include/sys/types.h:27,
|                  from
/media/disk/mydistro/output_mangard/work/i486-angstrom-linux/gcc-cross-3.4.4-r14.1/gcc-3.4.4/zlib/zconf.h:239,
|                  from
/media/disk/mydistro/output_mangard/work/i486-angstrom-linux/gcc-cross-3.4.4-r14.1/gcc-3.4.4/zlib/zlib.h:34,
|                  from
/media/disk/mydistro/output_mangard/work/i486-angstrom-linux/gcc-cross-3.4.4-r14.1/gcc-3.4.4/zlib/adler32.c:8:
| /usr/include/gnu/stubs.h:9:27: error: gnu/stubs-64.h: No such file
or directory
| make[3]: *** [adler32.o] Error 1
.
.
.



I disabled  FORTRAN and JAVA which is also disabled for higher
versions of the gcc recipes and this error disappeared but the build
process stopped again with another error :

.
.
.
.
| make[1]: Leaving directory
`/media/disk/mydistro/output_mangard/work/i486-angstrom-linux/gcc-cross-3.4.4-r14.1/gcc-3.4.4/build.i686-linux.i486-angstrom-linux/gcc'
| Checking multilib configuration...
| /bin/sh /media/disk/mydistro/output_mangard/work/i486-angstrom-linux/gcc-cross-3.4.4-r14.1/gcc-3.4.4/mkinstalldirs
i486-angstrom-linux/libstdc++-v3 ; \
| 	rm -f i486-angstrom-linux/libstdc++-v3/Makefile || : ; \
| 	cp multilib.out i486-angstrom-linux/libstdc++-v3/multilib.out
| mkdir -p -- i486-angstrom-linux/libstdc++-v3
| i486-angstrom-linux-gcc: No such file or directory
| i486-angstrom-linux-gcc: No such file or directory
| i486-angstrom-linux-gcc: No such file or directory
| Configuring in i486-angstrom-linux/libstdc++-v3
| configure: creating cache ./config.cache
| checking build system type... i686-pc-linux-gnu
| checking host system type... i486-angstrom-linux-gnu
| checking target system type... i486-angstrom-linux-gnu
| checking for a BSD-compatible install...
/media/disk/mydistro/output_mangard/staging/i686-linux/usr/bin/install
-c
| checking whether build environment is sane... yes
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking for i486-angstrom-linux-strip... strip
| checking for i486-angstrom-linux-gcc...  ccache
i486-angstrom-linux-gcc -march=i486 -march=i486
-B/media/disk/mydistro/output_mangard/cross/i486/i486-angstrom-linux/bin/
-B/media/disk/mydistro/output_mangard/cross/i486/i486-angstrom-linux/lib/
-isystem /media/disk/mydistro/output_mangard/cross/i486/i486-angstrom-linux/include
-isystem /media/disk/mydistro/output_mangard/cross/i486/i486-angstrom-linux/sys-include
| checking for suffix of object files... configure: error: cannot
compute suffix of object files: cannot compile
| See `config.log' for more details.
| make: *** [configure-target-libstdc++-v3] Error 1
| FATAL: oe_runmake failed
NOTE: Task failed:
/media/disk/mydistro/output_mangard/work/i486-angstrom-linux/gcc-cross-3.4.4-r14.1/temp/log.do_compile.32390
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/media/disk/mydistro/openembedded/recipes/gcc/gcc-cross_3.4.4.bb
do_compile failed
ERROR: Task 7 (/media/disk/mydistro/openembedded/recipes/gcc/gcc-cross_3.4.4.bb,
do_compile) failed
NOTE: Tasks Summary: Attempted 6 tasks of which 0 didn't need to be
rerun and 1 failed.
ERROR: '/media/disk/mydistro/openembedded/recipes/gcc/gcc-cross_3.4.4.bb' failed
.
.
.
.






This is the content of my actual gcc-cross_3.4.4.bb:
#start
PR = "${INC_PR}.1"
FORTRAN = ""
JAVA=""

require gcc-${PV}.inc
require gcc-cross.inc
require gcc-configure-cross.inc
require gcc-package-cross.inc

#stop

Is there another recipe to build libstdc++.so.5. ?
How can I adapt gcc-cross_3.4.4.bb to fulfill my needs?

Martin


