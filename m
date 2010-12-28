Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PXhQV-0003sP-Qg
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Dec 2010 22:49:52 +0100
Received: by iwn8 with SMTP id 8so10050158iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Dec 2010 13:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=LhAXFpl0EnMH4Vx9riTYAnbuUjFWAYecPhU7lzTJ1KY=;
	b=CNKEdd3j91ofonjVLkQC5OoOXpUJKUFlq8HaVmU5bZ1sCADgdf/856WgwGsz3LCOoe
	ez1vvpnZVJC9G5fckt4+EoI9wBGbVTZbTAHqPIJddKEz9RIlYCyXhxwnDdTG/Aay+Ycu
	ra6liOUATxRfppzNwd0PZ+9sMkBmNahBwxzvU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Sm2D/chNq7L8KwY3l6tjUNAV5HMJ0z6hQJG+9ldwNnqBJkm8eSRK8TFToPFiwMK75d
	6/IgszXIZJVRQYoEJPH+2Hq8TrnpxLo+i9O+ugVUhtgGnuD6YXMBjyW+swltwcpM/NaJ
	D2Jok/RhIpy8fp4l8Hn4Az+4q9MG8qhL3BrSA=
MIME-Version: 1.0
Received: by 10.231.38.10 with SMTP id z10mr13912302ibd.107.1293572968168;
	Tue, 28 Dec 2010 13:49:28 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Tue, 28 Dec 2010 13:49:28 -0800 (PST)
In-Reply-To: <201012282200.18012.roman@khimov.ru>
References: <1293469867-18737-1-git-send-email-fransmeulenbroeks@gmail.com>
	<201012272236.01404.roman@khimov.ru>
	<AANLkTi=P_dKFv4JiyU8_g_EoLK_Zn+HvNtVfUEccTA56@mail.gmail.com>
	<201012282200.18012.roman@khimov.ru>
Date: Tue, 28 Dec 2010 22:49:28 +0100
Message-ID: <AANLkTinj-pWTJfLqszpHVkN29McgpZ1Lidg8n-+V7RYo@mail.gmail.com>
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
X-List-Received-Date: Tue, 28 Dec 2010 21:49:52 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

2010/12/28 Roman I Khimov <roman@khimov.ru>:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F7=D4=CF=D2=CE=C9=CB 28 =C4=C5=CB=
=C1=C2=D2=D1 2010 21:23:39 =C1=D7=D4=CF=D2 Frans Meulenbroeks
> =CE=C1=D0=C9=D3=C1=CC:
>> 2010/12/27 Roman I Khimov <roman@khimov.ru>:
>> > rik@kettle:oe-arm$ cat
>> > tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib/perl/config.sh | g=
rep
>> > -E "^(cc=3D|ld=3D|ldflags=3D)" cc=3D"arm-angstrom-linux-gnueabi-gcc
>> > -march=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb"
>> > ld=3D"arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926e=
j-s
>> > -mthumb-interwork -mno-thumb"
>> > ldflags=3D"-L/storage/work/oe/oe-arm/tmp/sysroots/armv5te-angstrom-lin=
ux-gn
>> >ueabi/usr/lib
>> > -Wl,-rpath-link,/storage/work/oe/oe-arm/tmp/sysroots/armv5te-angstrom-=
lin
>> >ux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu"
>>
>> Comparing notes: I have:
>>
>> frans@linux-suse:~/oe> cat
>> tmp_minimal/sysroots/armv5te-oe-linux-gnueabi/usr/lib/perl/config.sh |
>> grep -E "^(cc=3D|ld=3D|ldflags=3D)"
>> cc=3D"arm-oe-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s
>> -mthumb-interwork -mthumb"
>> ld=3D"arm-oe-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s
>> -mthumb-interwork -mthumb"
>> ldflags=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu"
>>
>> Note the different definition of ldflags. (no -L ) and the -mthumb
>> versus -mno-thumb.
>
> We might have different targets for thumb things (mine is qemuarm), but "=
-L"
> difference seems suspicious (my test build is for 'angstrom-2008.1' if th=
at
> matters).
>
>> Btw I am using libtool 2.4 with systool support (should that matter)
>
> Maybe, maybe. I should try some newer distro for my test builds.
>
>> > Same definitions in Config_heavy. It should be working without that. I=
've
>>
>> Should I have this file in sysroots/armv5te.... =9A?
>> I only have
>> frans@linux-suse:~/oe/tmp_minimal/sysroots> find | grep heavy
>> ./i686-linux/usr/lib/perl/5.10.1/Config_heavy.pl
>> ./i686-linux/usr/lib/perl/5.10.1/utf8_heavy.pl
>> ./i686-linux/usr/lib/perl/5.10.1/Config_heavy-target.pl
>> ./i686-linux/usr/lib/perl/5.10.1/bytes_heavy.pl
>> ./armv5te-oe-linux-gnueabi/usr/share/mysql/my-innodb-heavy-4G.cnf
>> ./armv7a-oe-linux-gnueabi/usr/share/mysql/my-innodb-heavy-4G.cnf
>>
>> And Config_heavy.pl says:
>> frans@linux-suse:~/oe/tmp_minimal/sysroots> grep -E
>> "^(cc=3D|ld=3D|ldflags=3D)" ./i686-linux/usr/lib/perl/5.10.1/Config_heav=
y.pl
>
> That's the wrong one, you're interested in Config_heavy-target.pl, or
> Config_heavy-arm-angstrom-linux-gnueabi.pl after my recent patch series (=
that
> I'll push today).
>
> --
Config_heavy-target.pl has the same content as I gave for config.sh.

I did this as a test:
bitbake -cclean perl perl-native libdatetime-perl
libdatetime-perl-native; bitbake libdatetime-perl

results: config.sh and Config_heavy-target.pl are as reported before.
Build fails. Info on the file:

frans@linux-suse:~/oe>
./tmp_minimal/sysroots/i686-linux/usr/armv5te/bin/arm-oe-linux-gnueabi-objd=
ump
-f tmp_minimal/work/armv5te-oe-linux-gnueabi/libdatetime-perl-0.61-r1/image=
/usr/lib/perl5/auto/DateTime/DateTime.so

tmp_minimal/work/armv5te-oe-linux-gnueabi/libdatetime-perl-0.61-r1/image/us=
r/lib/perl5/auto/DateTime/DateTime.so:
    file format elf32-little
architecture: UNKNOWN!, flags 0x00000150:
HAS_SYMS, DYNAMIC, D_PAGED
start address 0x00000e50

frans@linux-suse:~/oe> file
tmp_minimal/work/armv5te-oe-linux-gnueabi/libdatetime-perl-0.61-r1/image/us=
r/lib/perl5/auto/DateTime/DateTime.so
tmp_minimal/work/armv5te-oe-linux-gnueabi/libdatetime-perl-0.61-r1/image/us=
r/lib/perl5/auto/DateTime/DateTime.so:
ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV),
dynamically linked, not stripped

Obviously the settings from config.sh are not taken into account.

target sheevaplug (armv5t5) distro minimal, git head of a few days
ago. litbool 2.4 with sysroot support.

Roman, can you perhaps retest with qemu-arm and minimal (as Khem
suggested in the next message).
Also I'm more than happy to do additional tests and/or compare notes
on irc (e.g. tomorrow evening european time)

Frans


