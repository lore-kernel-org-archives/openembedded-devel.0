Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PXeND-0000qW-27
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Dec 2010 19:34:16 +0100
Received: by iwn8 with SMTP id 8so9931323iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Dec 2010 10:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=KF2/biDo3UcjGfQblFbJWB81s6naPM9iTtMx+g5XjCA=;
	b=dWQ+cwXIVP8PWKq2pFk+lmMLuIktlfA+20D5/yY7SVIfYSseq091oDl4rzHnd0kj1P
	uX9cFEyjCO2MyIBt9q+SFIhzgue9pFk6QBKamgiGSmEyDilsjhO1mn/wET3BA/pHzjnJ
	L1o/4Yl7LLZpDvIK4xfsi96XT5QtXbFygj2AA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Zf6INxfxtbDB/CQryABafygkwlvJNELYqMZQkevOA6LlU258YHvn74YfCrStqG2sxQ
	3OPaGzRT6/n5qrgTUvxlvlvdyrK9U6h4zo8IaCZGJ/1KWIcX533MgVkmmsvcr6EePG+8
	4k/Gztbm/qlZ2kgmgXIkqX4GpsFraPhdKz/SI=
MIME-Version: 1.0
Received: by 10.231.39.199 with SMTP id h7mr13476126ibe.157.1293560619434;
	Tue, 28 Dec 2010 10:23:39 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Tue, 28 Dec 2010 10:23:39 -0800 (PST)
In-Reply-To: <201012272236.01404.roman@khimov.ru>
References: <1293469867-18737-1-git-send-email-fransmeulenbroeks@gmail.com>
	<201012272236.01404.roman@khimov.ru>
Date: Tue, 28 Dec 2010 19:23:39 +0100
Message-ID: <AANLkTi=P_dKFv4JiyU8_g_EoLK_Zn+HvNtVfUEccTA56@mail.gmail.com>
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
X-List-Received-Date: Tue, 28 Dec 2010 18:34:16 -0000
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

Comparing notes: I have:

frans@linux-suse:~/oe> cat
tmp_minimal/sysroots/armv5te-oe-linux-gnueabi/usr/lib/perl/config.sh |
grep -E "^(cc=3D|ld=3D|ldflags=3D)"
cc=3D"arm-oe-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s
-mthumb-interwork -mthumb"
ld=3D"arm-oe-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s
-mthumb-interwork -mthumb"
ldflags=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu"

Note the different definition of ldflags. (no -L ) and the -mthumb
versus -mno-thumb.

Btw I am using libtool 2.4 with systool support (should that matter)

>
> Same definitions in Config_heavy. It should be working without that. I've

Should I have this file in sysroots/armv5te....  ?
I only have
frans@linux-suse:~/oe/tmp_minimal/sysroots> find | grep heavy
./i686-linux/usr/lib/perl/5.10.1/Config_heavy.pl
./i686-linux/usr/lib/perl/5.10.1/utf8_heavy.pl
./i686-linux/usr/lib/perl/5.10.1/Config_heavy-target.pl
./i686-linux/usr/lib/perl/5.10.1/bytes_heavy.pl
./armv5te-oe-linux-gnueabi/usr/share/mysql/my-innodb-heavy-4G.cnf
./armv7a-oe-linux-gnueabi/usr/share/mysql/my-innodb-heavy-4G.cnf

And Config_heavy.pl says:
frans@linux-suse:~/oe/tmp_minimal/sysroots> grep -E
"^(cc=3D|ld=3D|ldflags=3D)" ./i686-linux/usr/lib/perl/5.10.1/Config_heavy.p=
l
cc=3D'gcc '
ld=3D'gcc '
ldflags=3D'-L/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/lib
-Wl,-rpath-link,/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/lib
-Wl,-rpath,/home/frans/oe/tmp_minimal/sysroots/i686-linux/usr/lib
-Wl,-O1 -fstack-protector -L/usr/local/lib'


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

Will try a compile test later.

Frans


