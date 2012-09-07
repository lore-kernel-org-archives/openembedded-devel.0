Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1TA4EG-00089m-R2; Fri, 07 Sep 2012 21:28:36 +0200
Received: by eekb57 with SMTP id b57so1286854eek.6
	for <multiple recipients>; Fri, 07 Sep 2012 12:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=y3mpBSPzSfHbyN+hryVzE3V7xrbdg+S7qofdJ6Gf/qg=;
	b=OZf8txQexq3LbMPXMAl1Mdn6uJtNUBlr07lISFtL411EdvHBDoiRtCzpDeVC6VPVZP
	ZUWNjVXwztNFAzMh8hZ4xDKQmG+Z1QpOj3DVbqk36arO4SNW8feSDFlnvCiq+1Lydjuy
	PAZ+miigqP4GjuMmXSybNJ9gLWV3mohwAn/FkOIf4TBxYyhQdmBuYjV44YCQm89Gszp2
	0B9TKa9/NF5exAC0CTAYxodz5ZD+brkUAEzGkSUZ/hOSB0xyHqEYhMrXDreSZON4UOyu
	CjO7ytvpGBZJLsMFi4GZ3gQiT57svTn1INFw6GJCgwL7WqZOtYeH9ZWlw9YpSV8ZEDJ0
	PfTA==
Received: by 10.14.173.131 with SMTP id v3mr3975024eel.15.1347045370828; Fri,
	07 Sep 2012 12:16:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Fri, 7 Sep 2012 12:15:40 -0700 (PDT)
In-Reply-To: <1347010598.7493.42.camel@ted>
References: <20120906231235.2BFB3103D3@opal>
	<20120906233803.GC3487@jama.jama.net>
	<1347010598.7493.42.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Sep 2012 12:15:40 -0700
Message-ID: <CAMKF1soZ2zMUz583srEZFh-Z8E7y2xfJL-J3pHoDr6Wwg9CHSA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-commits@lists.openembedded.org
Subject: Re: [OE-core] [oe-commits] Richard Purdie : gcc-cross-initial: Reinstate limits.h generation fix
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
X-List-Received-Date: Fri, 07 Sep 2012 19:28:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 7, 2012 at 2:36 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2012-09-07 at 01:38 +0200, Martin Jansa wrote:
>> On Thu, Sep 06, 2012 at 11:12:35PM +0000, git@git.openembedded.org wrote=
:
>> > Module: openembedded-core.git
>> > Branch: master
>> > Commit: 71854f5c8c6850ed37777cad21acc92fdbea32fc
>> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcom=
mit;h=3D71854f5c8c6850ed37777cad21acc92fdbea32fc
>> >
>> > Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > Date:   Thu Sep  6 16:50:10 2012 +0100
>> >
>> > gcc-cross-initial: Reinstate limits.h generation fix
>> >
>> > The removal of gcc-cross-intermediate inadvertently reintroduced a
>> > problem with the limits.h file being incorrectly/inconsistently
>> > generated.
>> >
>> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Db0faebd1f07e161=
6004bd19664395932e7c2c48f
>> > reverted part of:
>> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Dc8815d2f21849de=
b9359706f54dc71490773415e
>> >
>> > This reintroduces the protected sysroot ensuring the limits.h file is
>> > always correctly generated. To reproduce the bug, build gcc-cross, the=
n
>> > rebuild gcc-cross-initial and it will reference the limits.h file from
>> > gcc-cross in the sysroot.
>> >
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> Not sure if PR bump would help for gcc-cross-initial, but now incrementa=
l
>> build fails with:
>>
>> | Configuring in arm-oe-linux-gnueabi/libgcc
>> | configure: loading cache ./config.cache
>> | configure: error: `CC' has changed since the previous run:
>> | configure:   former value:  ` /OE/build/tmp-eglibc/work/armv7a-vfp-neo=
n-oe-linux-gnueabi/gcc-cross-initial-4.7.1.0+git1+d07e24f4ab59f264d68d21838=
795349faab5dede-r11/gcc-4_7-branch/build.x86_64-linux.arm-oe-linux-gnueabi/=
./gcc/xgcc -B/OE/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gcc=
-cross-initial-4.7.1.0+git1+d07e24f4ab59f264d68d21838795349faab5dede-r11/gc=
c-4_7-branch/build.x86_64-linux.arm-oe-linux-gnueabi/./gcc/ -march=3Darmv7-=
a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dne=
on -mtune=3Dcortex-a8 -isystem/OE/build/tmp-eglibc/sysroots/tuna/usr/includ=
e -B/OE/build/tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-linux-gnueabi/bin=
/ -B/OE/build/tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-linux-gnueabi/lib=
/ -isystem /OE/build/tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-linux-gnue=
abi/include -isystem /OE/build/tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-=
linux-gnueabi/sys-include --sysroot=3D/OE/build/tmp-eglibc/sysroots/tuna  '
>> | configure:   current value: ` /OE/build/tmp-eglibc/work/armv7a-vfp-neo=
n-oe-linux-gnueabi/gcc-cross-initial-4.7.1.0+git1+d07e24f4ab59f264d68d21838=
795349faab5dede-r11/gcc-4_7-branch/build.x86_64-linux.arm-oe-linux-gnueabi/=
./gcc/xgcc -B/OE/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gcc=
-cross-initial-4.7.1.0+git1+d07e24f4ab59f264d68d21838795349faab5dede-r11/gc=
c-4_7-branch/build.x86_64-linux.arm-oe-linux-gnueabi/./gcc/ -march=3Darmv7-=
a -fno-tree-vectorize     -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dne=
on -mtune=3Dcortex-a8 -isystem/OE/build/tmp-eglibc/sysroots/tuna/usr/includ=
e -B/OE/build/tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-linux-gnueabi/bin=
/ -B/OE/build/tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-linux-gnueabi/lib=
/ -isystem /OE/build/tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-linux-gnue=
abi/include -isystem /OE/build/tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-=
linux-gnueabi/sys-include --sysroot=3D/OE/build/tmp-eglibc/work/armv7a-vfp-=
neon-oe-linux-gnueabi/gcc-cross-initial-4.7.1.0+git1+d07e24f4ab59f264d68d21=
838795349faab5dede-r11/gcc-4_7-branch/build.x86_64-linux.arm-oe-linux-gnuea=
bi/tmpsysroot  '
>> | configure: error: in `/OE/build/tmp-eglibc/work/armv7a-vfp-neon-oe-lin=
ux-gnueabi/gcc-cross-initial-4.7.1.0+git1+d07e24f4ab59f264d68d21838795349fa=
ab5dede-r11/gcc-4_7-branch/build.x86_64-linux.arm-oe-linux-gnueabi/arm-oe-l=
inux-gnueabi/libgcc':
>> | configure: error: changes in the environment can compromise the build
>> | configure: error: run `make distclean' and/or `rm ./config.cache' and =
start over
>> | make: *** [configure-target-libgcc] Error 1
>> | ERROR: oe_runmake failed
>
> It shouldn't do this and there are open bugs about it :/ PR would
> probably work around it but we really need to fix the underlying
> problem.
>

it seems --sysroot option has changed between two runs

old
--sysroot=3D/work/yocto/poky/build/tmp/sysroots/x86_64-nativesdk-pokysdk-li=
nux

new

--sysroot=3D/work/yocto/poky/build/tmp/work/x86_64-pokysdk-linux/gcc-crosss=
dk-initial-4.7.1.0+git1+d07e24f4ab59f264d68d21838795349faab5dede-r11/gcc-4_=
7-branch/build.x86_64-linux.x86_64-pokysdk-linux/tmpsysroot

and it gets added to CC variable by OE

CC usually do not change during reconfigure but in such cases may be
cleaning the previous configure caches completely
would be right thing to do when it finds that its trying to run
do_configure on already configured tree.

> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


