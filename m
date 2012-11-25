Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Tcvw9-0007q8-4o
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 11:29:13 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so10078914ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2012 02:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=yoJTxi3Ayh0ay9itrtW1yivXgYvXU5mlXGzKIFgnmM0=;
	b=EwIJBdoLSeCc1Dn8RAtuR2wgdja8GnrQTs0GtirxIPAQsgHnoCnJ5r4+f4EPLFNhot
	EWE/wu6ilnWI2ZbEhq4GMSXXfUOhpuf9rnO+b8zmglyUro0CHdDmX/6yKeHFU7ZrIVZQ
	8nKH2Qv6uoNxXUaGLf29wGfiCBf81bIuYL/4ylq06bZ670pGW+aRWwRwim3c385et+KU
	abt/Zq/e2qEM1SYEgBE+BqSKODjPu1wc6py3x+m/5meF59pFMK5D5Y08vsRmwhIf9Cur
	E0dTz2G6WmXRxpF3SdfZMoJyo6crGrb3w/Lu/hevfTKj/2CIYGZNEXoCSKWDTnOZi6v3
	2sBA==
MIME-Version: 1.0
Received: by 10.50.152.240 with SMTP id vb16mr8996220igb.45.1353865571237;
	Sun, 25 Nov 2012 09:46:11 -0800 (PST)
Received: by 10.64.20.113 with HTTP; Sun, 25 Nov 2012 09:46:11 -0800 (PST)
In-Reply-To: <CAPOJ94OVOe=fP-8cgCdDFGFEJskce4G=DMcTR6a-JDM9QHJg0w@mail.gmail.com>
References: <CAPOJ94OVOe=fP-8cgCdDFGFEJskce4G=DMcTR6a-JDM9QHJg0w@mail.gmail.com>
Date: Sun, 25 Nov 2012 18:46:11 +0100
Message-ID: <CALbNGRTjM3MWC=_Lrcb5c2=astYGZB317KBNvdBf0erLS1-=0Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Peter Bigot <bigotp@acm.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] gphoto2: fix gettext build error
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
X-List-Received-Date: Mon, 26 Nov 2012 10:29:13 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Nov 25, 2012 at 3:19 PM, Peter Bigot <bigotp@acm.org> wrote:
> Koen Kooi <koen <at> dominion.thruhere.net> writes:
>
>>
>> Signed-off-by: Koen Kooi <koen <at> dominion.thruhere.net>
>
>> ---
>>  .../recipes-graphics/gphoto2/libgphoto2_2.4.11.bb  |    3 +--
>>  1 files changed, 1 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
> b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
>> index d7f6ac0..27f660b 100644
>> --- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
>> +++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
>> @@ -3,7 +3,7 @@ SECTION = "libs"
>>  LICENSE = "LGPLv2.1"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=0448d3676bc0de00406af227d341a4d1"
>>
>> -PR = "r3"
>> +PR = "r4"
>>
>>  DEPENDS = "libtool jpeg virtual/libusb0 libexif"
>>
>> @@ -26,7 +26,6 @@ inherit autotools pkgconfig gettext lib_package
>>  EXTRA_OECONF = " --with-drivers=all udevscriptdir=/lib/udev
> ac_cv_lib_ltdl_lt_dlcaller_register=yes"
>>
>>  do_configure_append() {
>> -    cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in
>> ${S}/libgphoto2_port/po/
>>      cd ${S}/libgphoto2_port/
>>      autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF}
>> $acpaths
>>      cd ${S}
>
> I was about to submit a similar patch reverting the original.  Here's what I
> wrote up.
>
> Revert "libgphoto2: fix build"
>
> When using gettext-0.18's Makefile.in.in the elimination of AM_PO_SUBDIRS()
> prevented the substitution of @GETTEXT_MACRO_VERSION@.  With the original
> patch I get:
>
> | Making all in po
> | make[4]: Entering directory
> `/prj/oe/yocto-ang/build/tmp-angstrom_v2012_12-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2-2.4.11-r3/libgphoto2-2.4.11/libgphoto2_port/po'
> | *** error: gettext infrastructure mismatch: using a Makefile.in.in from
> gettext version 0.18 but the autoconf macros are from gettext version
> @GETTEXT_MACRO_VERSION@
>
> autotools.bbclass does not unconditionally copy po/Makefile.in.in over the
> original gettext-0.14 version.  Presumably the original patch could be fixed
> by replicating the logic in autotools.bbclass that determines whether this
> should be done.  Reverting it is a simpler solution that works in my
> environment.
>
> This reverts commit 5febf70d37c7e9cf55fa7de5285531a810312e3a.
>
I tested this patch and get

ERROR: Function failed: do_install (see
/home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2/2.4.11-r4/temp/log.do_install.6873
for further information)
ERROR: Logfile of failure stored in:
/home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2/2.4.11-r4/temp/log.do_install.6873
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
'common']
| DEBUG: Executing shell function do_install
| NOTE: make -j20
DESTDIR=/home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2/2.4.11-r4/image
install
| Making install in libgphoto2_port
| make[1]: Entering directory
`/home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2/2.4.11-r4/libgphoto2-2.4.11/libgphoto2_port'
| Making install in po
| make[2]: Entering directory
`/home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2/2.4.11-r4/libgphoto2-2.4.11/libgphoto2_port/po'
| /bin/sh @MKINSTALLDIRS@
/home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2/2.4.11-r4/image/usr/share
| /bin/sh: @MKINSTALLDIRS@: No such file or directory
| make[2]: *** [install-data-yes] Error 127
| make[2]: Leaving directory
`/home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2/2.4.11-r4/libgphoto2-2.4.11/libgphoto2_port/po'
| make[1]: *** [install-recursive] Error 1
| make[1]: Leaving directory
`/home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2/2.4.11-r4/libgphoto2-2.4.11/libgphoto2_port'
| make: *** [install-recursive] Error 1
| ERROR: oe_runmake failed
| ERROR: Function failed: do_install (see
/home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libgphoto2/2.4.11-r4/temp/log.do_install.6873
for further information)
ERROR: Task 2 (/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb,
do_install) failed with exit code '1'

Andreas


