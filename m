Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.thomas@microbee-systems.com>)
	id 1RQ5Ce-0003is-Qq for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 23:40:36 +0100
Received: by wwp14 with SMTP id 14so4845950wwp.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 14:34:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.227.208.147 with SMTP id gc19mr17115834wbb.25.1321310055201;
	Mon, 14 Nov 2011 14:34:15 -0800 (PST)
Received: by 10.227.200.14 with HTTP; Mon, 14 Nov 2011 14:34:15 -0800 (PST)
In-Reply-To: <CALJpqJx=xpX7uksjLcVBZ0uYW8YjoKmQGMhf9w_C=urmSVT6pA@mail.gmail.com>
References: <CALJpqJz0x63nDkXuJe3Xp9k014gyaMnONpFUWtds5VNCUrTnrA@mail.gmail.com>
	<CAEsOVNf_5HnBQHuJpuOrAXJQDhhoM7kAF5L56bCF=fBFeOjxyA@mail.gmail.com>
	<CALJpqJwzNbcvmHbSZiy2Be5-akzkOpaZucaHa_0vMDsPYn7=MA@mail.gmail.com>
	<CAEsOVNdtanuSxeyMew2Dvt6-nULXWiE1tCsc-nSs71AsH_5jYg@mail.gmail.com>
	<CALJpqJzMGYbBbJ+C21bi_+jf-eLkBDCf8MFUauKF0tk2haE5aA@mail.gmail.com>
	<CALJpqJx=xpX7uksjLcVBZ0uYW8YjoKmQGMhf9w_C=urmSVT6pA@mail.gmail.com>
Date: Mon, 14 Nov 2011 16:34:15 -0600
Message-ID: <CALJpqJwweNX=isV_B8LKd2hvV5p18+kNxWh+ZYLjwZSw7Ne=Ng@mail.gmail.com>
From: David Thomas <david.thomas@microbee-systems.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: GCC Error
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
X-List-Received-Date: Mon, 14 Nov 2011 22:40:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Sigh, is there a prefered make version to?

On Mon, Nov 14, 2011 at 4:29 PM, David Thomas
<david.thomas@microbee-systems.com> wrote:
> NOTE: package module-init-tools-3.16-r0: task do_install: Started
> NOTE: package module-init-tools-3.16-r0: task do_install: Succeeded
> NOTE: Running task 1147 of 1169 (ID: 241,
> /home/twoods/setup-scripts/sources/openembedded-core/meta/recipes-kernel/=
module-init-tools/module-init-tools_3.16.bb,
> do_populate_lic)
> NOTE: package module-init-tools-3.16-r0: task do_populate_lic: Started
> ERROR: Function 'do_compile' failed (see
> /home/twoods/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/cm_t35-a=
ngstrom-linux-gnueabi/linux-hpveer-2.6.29+gitr1+29c1c6bb0a8feb6e6124dc0df2a=
22542ef45ef0d-r110/temp/log.do_compile.31094
> for further information)
> ERROR: Logfile of failure stored in:
> /home/twoods/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/cm_t35-a=
ngstrom-linux-gnueabi/linux-hpveer-2.6.29+gitr1+29c1c6bb0a8feb6e6124dc0df2a=
22542ef45ef0d-r110/temp/log.do_compile.31094
> Log data follows:
> | + cd /home/twoods/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/c=
m_t35-angstrom-linux-gnueabi/linux-hpveer-2.6.29+gitr1+29c1c6bb0a8feb6e6124=
dc0df2a22542ef45ef0d-r110/git/
> | + do_compile
> | + kernel_do_compile
> | + unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> | + oe_runmake include/linux/version.h
> 'CC=3Darm-angstrom-linux-gnueabi-gcc =A0-mno-thumb-interwork -mno-thumb
> -Wno-error=3Dunused-but-set-variable -Wno-error=3Darray-bounds
> -mno-thumb-interwork -mno-thumb
> --sysroot=3D/home/twoods/setup-scripts/build/tmp-angstrom_2010_x-eglibc/s=
ysroots/cm-t35'
> 'LD=3Darm-angstrom-linux-gnueabi-ld
> --sysroot=3D/home/twoods/setup-scripts/build/tmp-angstrom_2010_x-eglibc/s=
ysroots/cm-t35'
> | + '[' xmake =3D x ']'
> | + bbnote make -j2 include/linux/version.h
> 'CC=3Darm-angstrom-linux-gnueabi-gcc =A0-mno-thumb-interwork -mno-thumb
> -Wno-error=3Dunused-but-set-variable -Wno-error=3Darray-bounds
> -mno-thumb-interwork -mno-thumb
> --sysroot=3D/home/twoods/setup-scripts/build/tmp-angstrom_2010_x-eglibc/s=
ysroots/cm-t35'
> 'LD=3Darm-angstrom-linux-gnueabi-ld
> --sysroot=3D/home/twoods/setup-scripts/build/tmp-angstrom_2010_x-eglibc/s=
ysroots/cm-t35'
> | + echo 'NOTE: make -j2 include/linux/version.h
> CC=3Darm-angstrom-linux-gnueabi-gcc =A0-mno-thumb-interwork -mno-thumb
> -Wno-error=3Dunused-but-set-variable -Wno-error=3Darray-bounds
> -mno-thumb-interwork -mno-thumb
> --sysroot=3D/home/twoods/setup-scripts/build/tmp-angstrom_2010_x-eglibc/s=
ysroots/cm-t35
> LD=3Darm-angstrom-linux-gnueabi-ld
> --sysroot=3D/home/twoods/setup-scripts/build/tmp-angstrom_2010_x-eglibc/s=
ysroots/cm-t35'
> | NOTE: make -j2 include/linux/version.h
> CC=3Darm-angstrom-linux-gnueabi-gcc =A0-mno-thumb-interwork -mno-thumb
> -Wno-error=3Dunused-but-set-variable -Wno-error=3Darray-bounds
> -mno-thumb-interwork -mno-thumb
> --sysroot=3D/home/twoods/setup-scripts/build/tmp-angstrom_2010_x-eglibc/s=
ysroots/cm-t35
> LD=3Darm-angstrom-linux-gnueabi-ld
> --sysroot=3D/home/twoods/setup-scripts/build/tmp-angstrom_2010_x-eglibc/s=
ysroots/cm-t35
> | + make -j2 include/linux/version.h
> 'CC=3Darm-angstrom-linux-gnueabi-gcc =A0-mno-thumb-interwork -mno-thumb
> -Wno-error=3Dunused-but-set-variable -Wno-error=3Darray-bounds
> -mno-thumb-interwork -mno-thumb
> --sysroot=3D/home/twoods/setup-scripts/build/tmp-angstrom_2010_x-eglibc/s=
ysroots/cm-t35'
> 'LD=3Darm-angstrom-linux-gnueabi-ld
> --sysroot=3D/home/twoods/setup-scripts/build/tmp-angstrom_2010_x-eglibc/s=
ysroots/cm-t35'
> | =A0 CHK =A0 =A0 include/linux/version.h
> | + oe_runmake uImage 'CC=3Darm-angstrom-linux-gnueabi-gcc
> -mno-thumb-interwork -mno-thumb =A0-Wno-error=3Dunused-but-set-variable
> -Wno-error=3Darray-bounds -mno-thumb-interwork -mno-thumb
> --sysroot=3D/home/twoods/setup-scripts/build/tmp-angstrom_2010_x-eglibc/s=
ysroots/cm-t35'
> 'LD=3Darm-angstrom-linux-gnueabi-ld
> --sysroot=3D/home/twoods/setup-scripts/build/tmp-angstrom_2010_x-eglibc/s=
ysroots/cm-t35'
> | + '[' xmake =3D x ']'
> | + bbnote make -j2 uImage 'CC=3Darm-angstrom-linux-gnueabi-gcc
> -mno-thumb-interwork -mno-thumb =A0-Wno-error=3Dunused-but-set-variable
> -Wno-error=3Darray-bounds -mno-thumb-interwork -mno-thumb
> --sysroot=3D/home/twoods/setup-scripts/build/tmp-angstrom_2010_x-eglibc/s=
ysroots/cm-t35'
> 'LD=3Darm-angstrom-linux-gnueabi-ld
> --sysroot=3D/home/twoods/setup-scripts/build/tmp-angstrom_2010_x-eglibc/s=
ysroots/cm-t35'
> | + echo 'NOTE: make -j2 uImage CC=3Darm-angstrom-linux-gnueabi-gcc
> -mno-thumb-interwork -mno-thumb =A0-Wno-error=3Dunused-but-set-variable
> -Wno-error=3Darray-bounds -mno-thumb-interwork -mno-thumb
> --sysroot=3D/home/twoods/setup-scripts/build/tmp-angstrom_2010_x-eglibc/s=
ysroots/cm-t35
> LD=3Darm-angstrom-linux-gnueabi-ld
> --sysroot=3D/home/twoods/setup-scripts/build/tmp-angstrom_2010_x-eglibc/s=
ysroots/cm-t35'
> | NOTE: make -j2 uImage CC=3Darm-angstrom-linux-gnueabi-gcc
> -mno-thumb-interwork -mno-thumb =A0-Wno-error=3Dunused-but-set-variable
> -Wno-error=3Darray-bounds -mno-thumb-interwork -mno-thumb
> --sysroot=3D/home/twoods/setup-scripts/build/tmp-angstrom_2010_x-eglibc/s=
ysroots/cm-t35
> LD=3Darm-angstrom-linux-gnueabi-ld
> --sysroot=3D/home/twoods/setup-scripts/build/tmp-angstrom_2010_x-eglibc/s=
ysroots/cm-t35
> | + make -j2 uImage 'CC=3Darm-angstrom-linux-gnueabi-gcc
> -mno-thumb-interwork -mno-thumb =A0-Wno-error=3Dunused-but-set-variable
> -Wno-error=3Darray-bounds -mno-thumb-interwork -mno-thumb
> --sysroot=3D/home/twoods/setup-scripts/build/tmp-angstrom_2010_x-eglibc/s=
ysroots/cm-t35'
> 'LD=3Darm-angstrom-linux-gnueabi-ld
> --sysroot=3D/home/twoods/setup-scripts/build/tmp-angstrom_2010_x-eglibc/s=
ysroots/cm-t35'
> | =A0 CHK =A0 =A0 include/linux/version.h
> | =A0 SYMLINK include/asm -> include/asm-arm
> | make[1]: `include/asm-arm/mach-types.h' is up to date.
> | =A0 CHK =A0 =A0 include/linux/utsrelease.h
> | =A0 CC =A0 =A0 =A0scripts/mod/empty.o
> | cc1: error: -Werror=3Dunused-but-set-variable: No option
> -Wunused-but-set-variable
> | make[2]: *** [scripts/mod/empty.o] Error 1
> | make[1]: *** [scripts/mod] Error 2
> | make: *** [scripts] Error 2
> | + die 'oe_runmake failed'
> | + bbfatal 'oe_runmake failed'
> | + echo 'ERROR: oe_runmake failed'
> | ERROR: oe_runmake failed
> | + exit 1
> | ERROR: Function 'do_compile' failed (see
> /home/twoods/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/cm_t35-a=
ngstrom-linux-gnueabi/linux-hpveer-2.6.29+gitr1+29c1c6bb0a8feb6e6124dc0df2a=
22542ef45ef0d-r110/temp/log.do_compile.31094
> for further information)
> NOTE: package linux-hpveer-2.6.29+gitr1+29c1c6bb0a8feb6e6124dc0df2a22542e=
f45ef0d-r110:
> task do_compile: Failed
> ERROR: Task 7 (/home/twoods/setup-scripts/sources/meta-smartphone/meta-pa=
lm/recipes-kernel/linux/linux-hpveer_git.bb,
> do_compile) failed with exit code '1'
> Waiting for 1 active tasks to finish:
>
> On Mon, Nov 14, 2011 at 1:11 PM, David Thomas
> <david.thomas@microbee-systems.com> wrote:
>> cool, thanks
>>
>> On Mon, Nov 14, 2011 at 1:08 PM, McClintock Matthew-B29882
>> <B29882@freescale.com> wrote:
>>> On Mon, Nov 14, 2011 at 1:06 PM, David Thomas
>>> <david.thomas@microbee-systems.com> wrote:
>>>> 1) Fixing the (potential) errors in the source code
>>>>
>>>> Since I pulled this from Angstrom are you saying there is a error in
>>>> the sources I need to hunt down??
>>>
>>> It's a new build warning, it's something GCC is saying could be an
>>> issue. It's probably not in Angstrom but rather in the source of a
>>> package Angstrom is building.
>>>
>>> -M
>>>
>>
>



--=20
Dave Thomas
MicroBee Systems, Inc
1429 Weatherly Road, Suite G
Huntsville, AL 35803-1187
256-489-6671 (Voice)
256-426-2431 (Mobile)
256-489-6673 (FAX)
www.microbee-systems.com
"Innovative Solutions for an Embedded World"

This message is intended for the sole use of the addressee, and may
contain information that is privileged, confidential and exempt from
disclosure under applicable law. If you are not the addressee you are
hereby notified that you may not use, copy, disclose, or distribute to
anyone the message or any information contained in the message. If you
have received this message in error, please immediately advise the
sender by reply email and delete this message.


