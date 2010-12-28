Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PXT7O-00062a-D0
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Dec 2010 07:33:31 +0100
Received: by iyj18 with SMTP id 18so8361734iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Dec 2010 22:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=rCzPG8V0wQWtuBLZmI/sL73Okoa3ARJvAnZ9VHXZp/A=;
	b=buhZ4gImOW5JtG/Jj9Md4Diou1o4mUcac8c1Y6zLs4/d0O31QxYxjpdnvHbp3rj6RY
	XYcHUT9Wt6dY3NdcI19cV2Ah4rUSyR5LROEJnfa0a9qjH4NnvIS1t6SB626UEonfT3dQ
	SCPsPDvwxe3CEjw9b18P2rcPxftuFeKIWWZB0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=E6O5A+U0VdFw9oJXqMdXD3kqcflYgkQYWmdmO6IRpPsh88RGyR6G+77nmbZDJ3kTYM
	qFP8lWq5o1+OjM9DRt+Au3pJD/npI1pHpL3enRaQY10mmuEjSUvQL/vdGMc77XP9goPP
	c4fN+UpKT8/kNoN810CKPNkiVutRqGqlAc0q0=
MIME-Version: 1.0
Received: by 10.231.39.71 with SMTP id f7mr12798249ibe.182.1293517946480; Mon,
	27 Dec 2010 22:32:26 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Mon, 27 Dec 2010 22:32:26 -0800 (PST)
In-Reply-To: <201012272236.01404.roman@khimov.ru>
References: <1293469867-18737-1-git-send-email-fransmeulenbroeks@gmail.com>
	<201012272236.01404.roman@khimov.ru>
Date: Tue, 28 Dec 2010 07:32:26 +0100
Message-ID: <AANLkTinxoknTa=4DqkPRqeTm_QMVLFAevC+WkhsUN=1O@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v3] cpan_build.bbclass; added cc and ld flags to the perl Build.PL invocation
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
X-List-Received-Date: Tue, 28 Dec 2010 06:33:31 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

2010/12/27 Roman I Khimov <roman@khimov.ru>:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=CF=CE=C5=C4=C5=CC=D8=CE=C9=CB =
27 =C4=C5=CB=C1=C2=D2=D1 2010 20:11:07 =C1=D7=D4=CF=D2 Frans Meulenbroeks =
=CE=C1=D0=C9=D3=C1=CC:
>> Without these gcc would be used which resolves to /usr/bin/gcc
>> and one gets an intel exe.
>> This showed up with libparams-validate-perl and libdatetime-perl
>> The LDFLAGS are added to resolve the GNU_HASH QA error
>>
>> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>> ---
>> =9Aclasses/cpan_build.bbclass =9A =9A | =9A =9A1 +
>> =9A1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/classes/cpan_build.bbclass b/classes/cpan_build.bbclass
>> index d1bbc4f..070e061 100644
>> --- a/classes/cpan_build.bbclass
>> +++ b/classes/cpan_build.bbclass
>> @@ -26,6 +26,7 @@ cpan_build_do_configure () {
>> =9A =9A =9A =9A =9A =9A =9A # build for target
>> =9A =9A =9A =9A =9A =9A =9A . ${STAGING_LIBDIR}/perl/config.sh
>> =9A =9A =9A =9A =9A =9A =9A perl Build.PL --installdirs vendor \
>> + =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A --config cc=3D"${CC} ${LDFLAGS=
}" --config ld=3D"${CCLD} ${LDFLAGS}"
>> =9A\ --destdir ${D} \
>> =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A --install_path lib=3D"${data=
dir}/perl5" \
>> =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A --install_path arch=3D"${lib=
dir}/perl5" \
>>
>
> Seems strange to me. ${STAGING_LIBDIR}/perl/config.sh for example:
>
> rik@kettle:oe-arm$ cat tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/li=
b/perl/config.sh | grep -E "^(cc=3D|ld=3D|ldflags=3D)"
> cc=3D"arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s=
 -mthumb-interwork -mno-thumb"
> ld=3D"arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s=
 -mthumb-interwork -mno-thumb"
> ldflags=3D"-L/storage/work/oe/oe-arm/tmp/sysroots/armv5te-angstrom-linux-=
gnueabi/usr/lib -Wl,-rpath-link,/storage/work/oe/oe-arm/tmp/sysroots/armv5t=
e-angstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu"
>
> Same definitions in Config_heavy. It should be working without that. I've
> just built it here for qemuarm (with Angstrom distro) and seems to be OK:
>
> rik@kettle:oe-arm$ ./tmp/sysroots/x86_64-linux/usr/armv5te/bin/arm-angstr=
om-linux-gnueabi-objdump -f tmp/work/armv5te-angstrom-linux-gnueabi/libdate=
time-perl-0.61-r1/image/usr/lib/perl5/auto/DateTime/DateTime.so
>
> tmp/work/armv5te-angstrom-linux-gnueabi/libdatetime-perl-0.61-r1/image/us=
r/lib/perl5/auto/DateTime/DateTime.so: =9A =9A file format elf32-littlearm
> architecture: arm, flags 0x00000150:
> HAS_SYMS, DYNAMIC, D_PAGED
> start address 0x00000c94
>

I'll peek into those config files tonight to see what I got (and I'll
try to reproduce the problem).
Last weekend I ended up in getting an i686 DateTime.o
my dev sys is opensuse 11.3 on 686, target was sheevaplug, but I seem
to recall it also appeared for beagleboard.
distro minimal.

I have only seen the problem with the two recipes I mentioned. Both of
these use Build.PL. I have not seen it with packages that have a
Makefile.PL (which seems to be the majority), but if it fails again
tonight with the patch I'll recheck that too.

Frans.


