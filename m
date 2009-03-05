Received: from [209.85.220.167] (helo=mail-fx0-f167.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LfKtp-0005mU-U3
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Mar 2009 22:14:37 +0100
Received: by fxm11 with SMTP id 11so118143fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2009 13:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=5+PpChjNR2gm2lVkmrm23V7D72V6H2oaWhJFCyJ12Nc=;
	b=Rs2XwFCQke4aXseYTyGlJF1IHHBgVnkChSC3figLdQAjQJjmOLTDybsDrnI2V6k4Gf
	LfcdwFHWv2pi7Iu1gj5uLNTHHOQxR3GPnZVyffuBltuLunh+6HlMEEIeoa0lSdukcWva
	rNuOtuUqnDnCmR4Jfz8KTQ0+rQEewxlN5j4G8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=bnebbRAbu8IsWeugS4UBT3BObK4Yxm5olXtXW1SAqkK9DQW2P6GMdWVzqJZTLDtjZb
	mTOkV0AuGo/zXKZfVzwVIk+afrRfQC7pzcPVwnlCRe5xPvvF7rZBXH4keGtUqJNT7VPT
	WOH5ILgZCmI3+NoNxTcrwNsZexg9dtMHnsvwI=
MIME-Version: 1.0
Received: by 10.223.109.199 with SMTP id k7mr1356820fap.45.1236287413339; Thu, 
	05 Mar 2009 13:10:13 -0800 (PST)
In-Reply-To: <gop5fu$ec$1@ger.gmane.org>
References: <ac9c93b10903050921y59233df1o731fb4983e22e12f@mail.gmail.com>
	<gop5fu$ec$1@ger.gmane.org>
Date: Thu, 5 Mar 2009 22:10:13 +0100
Message-ID: <ac9c93b10903051310g48c05d5eiaa6371f67383f7f1@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: need help: cdrkit & bitifields
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
X-List-Received-Date: Thu, 05 Mar 2009 21:14:38 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

2009/3/5 Koen Kooi <k.kooi@student.utwente.nl>:
> On 05-03-09 18:21, Frans Meulenbroeks wrote:
>
>> Ucbit is an unsigned char
>
> unsigned char makes me think of
> http://www.arm.linux.org.uk/docs/faqs/signedchar.php
>
> regards,
>
> Koen

Well it is explictly defined as unsigned char.
from utypes.h:

/*
 * The IBM AIX C-compiler seems to be the only compiler on the world
 * which does not allow to use unsigned char bit fields as a hint
 * for packed bit fields. Define a pesical type to avoid warnings.
 * The packed attribute is honored wit unsigned int in this case too.
 */
#if     defined(_AIX) && !defined(__GNUC__)

typedef unsigned int    Ucbit;

#else

typedef unsigned char   Ucbit;

#endif

The link you give is related to chars that are by default signed or unsigne=
d

This one seems to be related to whether bitfields are ordered left to
right or right to left
(and if I recall correctly in the ansi C standard this is undefined
(but it has been a while since I checked)

Decided to do some testing. On x86: gcc 4.3.2:
frans@linux-suse:~/wt> cat tst.c
#include <stdio.h>

typedef struct {
    unsigned char bit0:1;
    unsigned char bits:6;
    unsigned char bit7:1;
} bitfields;

main(int argc, char **argv)
{
    char c =3D 0xf0;
    bitfields *bf =3D &c;

    printf("bit 0 =3D %d, bits =3D %x, bit7 =3D %x\n", bf->bit0, bf->bits, =
bf->bit7);
}
frans@linux-suse:~/wt> gcc  tst.c
tst.c: In function =91main=92:
tst.c:12: warning: initialization from incompatible pointer type
frans@linux-suse:~/wt> ./a.out
bit 0 =3D 0, bits =3D 38, bit7 =3D 1
frans@linux-suse:~/wt> gcc -O1 tst.c
tst.c: In function =91main=92:
tst.c:12: warning: initialization from incompatible pointer type
frans@linux-suse:~/wt> ./a.out
bit 0 =3D 0, bits =3D 38, bit7 =3D 1
frans@linux-suse:~/wt> gcc -O2 tst.c
tst.c: In function =91main=92:
tst.c:12: warning: initialization from incompatible pointer type
frans@linux-suse:~/wt> ./a.out
bit 0 =3D 0, bits =3D 1c, bit7 =3D 1
frans@linux-suse:~/wt> gcc -O3 tst.c
tst.c: In function =91main=92:
tst.c:12: warning: initialization from incompatible pointer type
frans@linux-suse:~/wt> ./a.out
bit 0 =3D 0, bits =3D 1c, bit7 =3D 1

Same test on beagle (gcc 4.3.1), -O0  -O1 -O2 -O3
root@beagleboard:~# ./tst0
bit 0 =3D 0, bits =3D 38, bit7 =3D 1
root@beagleboard:~# ./tst1
bit 0 =3D 0, bits =3D 38, bit7 =3D 1
root@beagleboard:~# ./tst2
bit 0 =3D 0, bits =3D 20, bit7 =3D 0
root@beagleboard:~# ./tst3
bit 0 =3D 0, bits =3D 20, bit7 =3D 0

Not sure what is happening here.
I tried to compile cdrkit with -O1 using
FULL_OPTIMIZATION =3D "-O1"
FULL_OPTIMIZATION_armv7a =3D "-O1"
BUILD_OPTIMIZATION =3D "${FULL_OPTIMIZATION}"
but that did not help either.

There is a compile time macro in gcc called BITS_BIG_ENDIAN but that
one is set to 0 for arm (same as for x86).

Puzzled....

Frans


