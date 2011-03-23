Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kartikmohta@gmail.com>) id 1Q2Mt6-0008CR-QA
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 13:10:09 +0100
Received: by iwn10 with SMTP id 10so8861929iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2011 05:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=sd/ooA1VjQTK97tk1M+Pu9/6u9tHix+cepA4DTS0y7w=;
	b=kkyispEwOllrcuazde0qRTvBGzNAqXzy6RCaHfAG6XR+nG4dIofcVLAT4ozcHqXDNa
	Dgiy7rQtHocDpY0WBnhmGVuWd1ZdirzmOtK8xkq2cl2kWH7E30Hu6XHZRrA7TMLpNPWB
	gh18dMIJAbyRo3iFC0zrLBN4+FZDuHXQrNFp0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=P5L9JL7xOoaM28vvfDnZg07rlDMU9V8CdGvb9yW4VXNBeiVmNSBA7xf7gb+bi5tB6U
	faDdi7H8N9mTHdiFOZtCVDXe6yorUFp6M7D88F/zTnH0T24K8caXyhm4OJV0r19vhlfa
	zvvj6JkMjQh0jSdiAuA9wriIyoRzluVVBofwE=
Received: by 10.43.60.65 with SMTP id wr1mr1633328icb.323.1300881638783; Wed,
	23 Mar 2011 05:00:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.219.132 with HTTP; Wed, 23 Mar 2011 05:00:18 -0700 (PDT)
In-Reply-To: <1300878254.4101.21.camel@mattotaupa>
References: <1300878254.4101.21.camel@mattotaupa>
From: Kartik Mohta <kartikmohta@gmail.com>
Date: Wed, 23 Mar 2011 08:00:18 -0400
Message-ID: <AANLkTimJyKwc34_gwpG0nkP9ZyXgs3vQm1ScwqtMrG6P@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: libarchive: task compile fails with `error: static declaration of 'wcscpy' follows non-static declaration`
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
X-List-Received-Date: Wed, 23 Mar 2011 12:10:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I had the same problem,
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D6db4b9050e0e=
8b963e2a6b63790e48e3042ea99e
solves it.

On Wed, Mar 23, 2011 at 7:04 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear OE folks
>
>
> trying to test the latest changes in `libarchive_2.8.4.bb` I hit the
> following error.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0arm-oe-linux-gnueabi-libtool: compile: =C2=A0a=
rm-oe-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -m=
float-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/build-minim=
al-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi -DHAVE_CONFIG_H -I. =
-I/oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/include/libx=
ml2 -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -=
g -MT libarchive/archive_entry.lo -MD -MP -MF libarchive/.deps/archive_entr=
y.Tpo -c libarchive/archive_entry.c =C2=A0-fPIC -DPIC -o libarchive/.libs/a=
rchive_entry.o
> =C2=A0 =C2=A0 =C2=A0 =C2=A0libarchive/archive_entry.c:136:18: error: stat=
ic declaration of 'wcscpy' follows non-static declaration
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/oe/build-minimal-eglibc/minimal-dev/sysroots/=
armv7a-oe-linux-gnueabi/usr/include/wchar.h:144:17: note: previous declarat=
ion of 'wcscpy' was here
> =C2=A0 =C2=A0 =C2=A0 =C2=A0libarchive/archive_entry.c:145:15: error: stat=
ic declaration of 'wcslen' follows non-static declaration
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/oe/build-minimal-eglibc/minimal-dev/sysroots/=
armv7a-oe-linux-gnueabi/usr/include/wchar.h:284:15: note: previous declarat=
ion of 'wcslen' was here
> =C2=A0 =C2=A0 =C2=A0 =C2=A0arm-oe-linux-gnueabi-libtool: compile: =C2=A0a=
rm-oe-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -m=
float-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/build-minim=
al-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi -DHAVE_CONFIG_H -I. =
-I/oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/include/libx=
ml2 -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -=
g -MT libarchive/archive_entry_stat.lo -MD -MP -MF libarchive/.deps/archive=
_entry_stat.Tpo -c libarchive/archive_entry_stat.c -o libarchive/archive_en=
try_stat.o >/dev/null 2>&1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0arm-oe-linux-gnueabi-libtool: compile: =C2=A0a=
rm-oe-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -m=
float-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/build-minim=
al-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi -DHAVE_CONFIG_H -I. =
-I/oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/include/libx=
ml2 -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -=
g -MT libarchive/archive_entry_strmode.lo -MD -MP -MF libarchive/.deps/arch=
ive_entry_strmode.Tpo -c libarchive/archive_entry_strmode.c -o libarchive/a=
rchive_entry_strmode.o >/dev/null 2>&1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0arm-oe-linux-gnueabi-libtool: compile: =C2=A0a=
rm-oe-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -m=
float-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/build-minim=
al-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi -DHAVE_CONFIG_H -I. =
-I/oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/include/libx=
ml2 -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -=
g -MT libarchive/archive_entry_xattr.lo -MD -MP -MF libarchive/.deps/archiv=
e_entry_xattr.Tpo -c libarchive/archive_entry_xattr.c -o libarchive/archive=
_entry_xattr.o >/dev/null 2>&1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0make[1]: *** [libarchive/archive_entry.lo] Err=
or 1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0make[1]: *** Waiting for unfinished jobs....
> =C2=A0 =C2=A0 =C2=A0 =C2=A0make[1]: Leaving directory `/oe/build-minimal-=
eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/libarchive-2.8.4-r0/libarch=
ive-2.8.4'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0make: *** [all] Error 2
> =C2=A0 =C2=A0 =C2=A0 =C2=A0+ die 'oe_runmake failed'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0+ oefatal 'oe_runmake failed'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0+ echo FATAL: 'oe_runmake failed'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0FATAL: oe_runmake failed
> =C2=A0 =C2=A0 =C2=A0 =C2=A0+ exit 1
>
> The following configuration is used.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Build Configuration:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.1=
2.0"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0METADATA_BRANCH =C2=A0 =3D "master"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0METADATA_REVISION =3D "79d295c"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_ARCH =C2=A0 =C2=A0 =C2=A0 =3D "arm"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_OS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "lin=
ux-gnueabi"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 "beagleboard"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D "minimal"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0DISTRO_VERSION =C2=A0 =C2=A0=3D "dev-snapshot-=
20110323"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "sof=
t"
>
> I will test a build using `angstrom-2010.x` next, but will not have time
> to track down the fix.
>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>



--=20
Kartik


