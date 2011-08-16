Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1QtQns-0003QD-84
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 23:04:04 +0200
Received: by gwb11 with SMTP id 11so273508gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2011 13:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=9ZlAnZbL670EKQf1MtA0GoXaIbrqfYJvkgLX8IsEn+E=;
	b=i7JBBy1cP3nK0WQ0Ubl8wWjSejY8Cyz58VAnOYD4b54ehfNI1IIQfPP6A+0Rwz/vo2
	xEJgVLV9nJZNpVdPMKo6kpDxYPeYUQpmk3Myyn1n/ZnbaKPLjzfrzST0hm7eOHbM4hyj
	iuTf7IghR4u8nq5xjKr57tRSULrWix9C9taP8=
MIME-Version: 1.0
Received: by 10.236.175.8 with SMTP id y8mr727169yhl.60.1313528366137; Tue, 16
	Aug 2011 13:59:26 -0700 (PDT)
Received: by 10.236.106.100 with HTTP; Tue, 16 Aug 2011 13:59:26 -0700 (PDT)
In-Reply-To: <CAOd_LFwQk0vCwVw-FEs5JOs9cPe_kbJHBEi9My+VaKtoM0k7Jg@mail.gmail.com>
References: <CAOd_LFx5+NyXY4cTZ76yfccaFea8_WsFm2t_ZnkLk1xKD9Xzyw@mail.gmail.com>
	<1313523876.3630.14.camel@lenovo.internal.reciva.com>
	<CAMKF1srdqe0GKEYx5N9UTmt0jdJjixDioGRD--m-sU8ZoPT3hA@mail.gmail.com>
	<CAOd_LFwQk0vCwVw-FEs5JOs9cPe_kbJHBEi9My+VaKtoM0k7Jg@mail.gmail.com>
Date: Tue, 16 Aug 2011 16:59:26 -0400
Message-ID: <CAOd_LFzhax5=Zf3Spw6RD1cKXOe7B+COQ_oAwDfqsbS2re+q1w@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: error building PXA270 target with oe-core/angstrom
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
X-List-Received-Date: Tue, 16 Aug 2011 21:04:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2011 at 4:49 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> On Tue, Aug 16, 2011 at 4:03 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, Aug 16, 2011 at 12:44 PM, Phil Blundell <philb@gnu.org> wrote:
>>> On Tue, 2011-08-16 at 15:32 -0400, Cliff Brake wrote:
>>>> | ../libcpp/libcpp.a(files.o): In function `validate_pch':
>>>> | files.c:(.text+0x1978): undefined reference to `fprintf_unlocked'
>>>> | ../libcpp/libcpp.a(line-map.o): In function `linemap_check_files_exi=
ted':
>>>> | line-map.c:(.text+0xfa): undefined reference to `fprintf_unlocked'
>>>> | ../libcpp/libcpp.a(line-map.o): In function `linemap_add':
>>>> | line-map.c:(.text+0x258): undefined reference to `fprintf_unlocked'
>>>> | line-map.c:(.text+0x308): undefined reference to `fprintf_unlocked'
>>>> | ../libcpp/libcpp.a(symtab.o): In function `ht_dump_statistics':
>>>> | symtab.c:(.text+0x1cc): undefined reference to `fprintf_unlocked'
>>>
>>> That looks rather like something is wrong with your host's build
>>> environment. =A0Apparently gcc has decided that you have fprintf_unlock=
ed
>>> and using it would be a good idea. =A0AFAIK, there are no glibcs in the
>>> wild which do actually implement fprintf_unlocked so it seems that gcc
>>> must be mistaken in its belief.
>>>
>>> I think you might need to do a bit of poking at config.log to see what'=
s
>>> up.
>>>
>>
>> Do you have eglibc-nativesdk staged ?
>
> No, if I try to bitbake eglibc-nativesdk, it fails trying to compile
> gcc-cross-initial_4.5.

gcc  -isystem/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/sysroo=
ts/x86_64-linux/usr/include
-O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall
-Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes
-Wmissing-format-attribute -pedantic -Wno-long-long
-Wno-variadic-macros -Wno-overlength-strings -Wold-style-definition
-Wc++-compat   -DHAVE_CONFIG_H
-L/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-l=
inux/usr/lib
-Wl,-rpath-link,/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/sys=
roots/x86_64-linux/usr/lib
-Wl,-rpath,/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/sysroots=
/x86_64-linux/usr/lib
-Wl,-O1 -o cc1-dummy c-lang.o stub-objc.o attribs.o c-errors.o c-lex.o
c-pragma.o c-decl.o c-typeck.o c-convert.o c-aux-info.o c-common.o
c-opts.o c-format.o c-semantics.o c-ppoutput.o c-cppbuiltin.o
c-objc-common.o c-dump.o c-pch.o c-parser.o arm-c.o c-gimplify.o
tree-mudflap.o c-pretty-print.o c-omp.o \
          dummy-checksum.o main.o  libbackend.a ../libcpp/libcpp.a
../libdecnumber/libdecnumber.a ../libcpp/libcpp.a
../libiberty/libiberty.a ../libdecnumber/libdecnumber.a    -lmpc
-lmpfr -lgmp -rdynamic -ldl  -L../zlib -lz -lelf
gcc  -isystem/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/sysroo=
ts/x86_64-linux/usr/include
-O2 -pipe -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall
-Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes
-Wmissing-format-attribute -pedantic -Wno-long-long
-Wno-variadic-macros -Wno-overlength-strings -Wold-style-definition
-Wc++-compat   -DHAVE_CONFIG_H
-L/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-l=
inux/usr/lib
-Wl,-rpath-link,/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/sys=
roots/x86_64-linux/usr/lib
-Wl,-rpath,/scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/sysroots=
/x86_64-linux/usr/lib
-Wl,-O1 -o lto1 \
                lto/lto-lang.o lto/lto.o lto/lto-elf.o attribs.o
main.o  libbackend.a ../libcpp/libcpp.a ../libdecnumber/libdecnumber.a
  -lmpc -lmpfr -lgmp -rdynamic -ldl  -L../zlib -lz -lelf
../libcpp/libcpp.a   ../libiberty/libiberty.a
../libdecnumber/libdecnumber.a  -lelf
../libcpp/libcpp.a(line-map.o): In function `linemap_check_files_exited':
line-map.c:(.text+0xfa): undefined reference to `fprintf_unlocked'

ls /scratch/pp/pp-oe-2011/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-=
linux/usr/include
bzlib.h      cursesapp.h  cursesm.h  cursslk.h  eti.h
expat.h      gelf.h        libelf.h  ltdl.h  mpf2mpfr.h  ncurses_dll.h
 openssl    readline      termcap.h     tic.h     zlibdefs.h
crypto       cursesf.h    cursesp.h  dwarf.h    etip.h
FlexLexer.h  gettext-po.h  libltdl   menu.h  mpfr.h      ncurses.h
 panel.h    sqlite3ext.h  term_entry.h  unctrl.h  zlib.h
curses-64.h  curses.h     cursesw.h  elfutils   expat_external.h
form.h       gmp.h         libxml2   mpc.h   nc_tparm.h  nlist.h
 python2.6  sqlite3.h     term.h        zconf.h

eglibc header files are staged it appears.

Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


