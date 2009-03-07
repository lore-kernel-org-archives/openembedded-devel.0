Received: from [209.85.198.245] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lft3N-0008J5-DX
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Mar 2009 10:42:45 +0100
Received: by rv-out-0708.google.com with SMTP id b17so830909rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Mar 2009 01:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:organization:to:subject
	:date:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:message-id;
	bh=YgJAPHwqtek2Q3/kgFlIYc4EjTECTew8ud8kNYJyOUk=;
	b=WG86j+XiDh1HEXfpE7T4loICareZvTYGquYPsGr6Q4fdrf6BhDL7kY6VQu5MTxT5Vd
	7GQcLLH/7B40/s+LHdTOx7DGkJGh9f5FziMz3eFOy7t2hWtBKZp7asmGcN/rKqiYLh8L
	2Tw07Zws5f8zBbFLmGyas32l4ShLYvFBzVJrI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:organization:to:subject:date:user-agent:cc:references
	:in-reply-to:mime-version:content-type:content-transfer-encoding
	:content-disposition:message-id;
	b=Ts3FrFpdLr4UopKxHTkrZq0qR+fGRYxNjtkOXkXLDqlCFlYEukn6lnFWV66VziGKhA
	3ezlznfNRM9OjphBOV8wsa3jarGlnRJkeBqTFXHuCDHOTwNMvMC0CkhXdGTwcf0IJdEi
	0bElnzggXTyA4XKaoz9n3s6M2tidWV68eUQ1g=
Received: by 10.142.200.3 with SMTP id x3mr498559wff.165.1236418688596;
	Sat, 07 Mar 2009 01:38:08 -0800 (PST)
Received: from morpheus.localnet (adsl-71-146-1-99.dsl.pltn13.sbcglobal.net
	[71.146.1.99])
	by mx.google.com with ESMTPS id 22sm3858307wfd.6.2009.03.07.01.38.07
	(version=SSLv3 cipher=RC4-MD5); Sat, 07 Mar 2009 01:38:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Organization: Juniper Networks Inc.
To: openembedded-devel@lists.openembedded.org
Date: Sat, 7 Mar 2009 01:37:40 -0800
User-Agent: KMail/1.11.1 (Linux/2.6.28-8-generic; KDE/4.2.1; x86_64; ; )
References: <ac9c93b10903050921y59233df1o731fb4983e22e12f@mail.gmail.com>
	<gop5fu$ec$1@ger.gmane.org>
	<ac9c93b10903051310g48c05d5eiaa6371f67383f7f1@mail.gmail.com>
In-Reply-To: <ac9c93b10903051310g48c05d5eiaa6371f67383f7f1@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200903070138.05252.raj.khem@gmail.com>
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
X-List-Received-Date: Sat, 07 Mar 2009 09:42:45 -0000
Content-Type: text/plain;
  charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thursday 05 March 2009 13:10:13 Frans Meulenbroeks wrote:
> 2009/3/5 Koen Kooi <k.kooi@student.utwente.nl>:
> > On 05-03-09 18:21, Frans Meulenbroeks wrote:
> >> Ucbit is an unsigned char
> >
> > unsigned char makes me think of
> > http://www.arm.linux.org.uk/docs/faqs/signedchar.php
> >
> > regards,
> >
> > Koen
>
> Well it is explictly defined as unsigned char.
> from utypes.h:
>
> /*
>  * The IBM AIX C-compiler seems to be the only compiler on the world
>  * which does not allow to use unsigned char bit fields as a hint
>  * for packed bit fields. Define a pesical type to avoid warnings.
>  * The packed attribute is honored wit unsigned int in this case too.
>  */
> #if     defined(_AIX) && !defined(__GNUC__)
>
> typedef unsigned int    Ucbit;
>
> #else
>
> typedef unsigned char   Ucbit;
>
> #endif
>
> The link you give is related to chars that are by default signed or
> unsigned
>
> This one seems to be related to whether bitfields are ordered left to
> right or right to left
> (and if I recall correctly in the ansi C standard this is undefined
> (but it has been a while since I checked)
>
> Decided to do some testing. On x86: gcc 4.3.2:
> frans@linux-suse:~/wt> cat tst.c
> #include <stdio.h>
>
> typedef struct {
>     unsigned char bit0:1;
>     unsigned char bits:6;
>     unsigned char bit7:1;
> } bitfields;
>
> main(int argc, char **argv)
> {
>     char c =3D 0xf0;
>     bitfields *bf =3D &c;
>
>     printf("bit 0 =3D %d, bits =3D %x, bit7 =3D %x\n", bf->bit0, bf->bits,
> bf->bit7); }
> frans@linux-suse:~/wt> gcc  tst.c
> tst.c: In function =91main=92:
> tst.c:12: warning: initialization from incompatible pointer type
> frans@linux-suse:~/wt> ./a.out
> bit 0 =3D 0, bits =3D 38, bit7 =3D 1
> frans@linux-suse:~/wt> gcc -O1 tst.c
> tst.c: In function =91main=92:
> tst.c:12: warning: initialization from incompatible pointer type
> frans@linux-suse:~/wt> ./a.out
> bit 0 =3D 0, bits =3D 38, bit7 =3D 1
> frans@linux-suse:~/wt> gcc -O2 tst.c
> tst.c: In function =91main=92:
> tst.c:12: warning: initialization from incompatible pointer type
> frans@linux-suse:~/wt> ./a.out
> bit 0 =3D 0, bits =3D 1c, bit7 =3D 1
> frans@linux-suse:~/wt> gcc -O3 tst.c
> tst.c: In function =91main=92:
> tst.c:12: warning: initialization from incompatible pointer type
> frans@linux-suse:~/wt> ./a.out
> bit 0 =3D 0, bits =3D 1c, bit7 =3D 1
>
> Same test on beagle (gcc 4.3.1), -O0  -O1 -O2 -O3
> root@beagleboard:~# ./tst0
> bit 0 =3D 0, bits =3D 38, bit7 =3D 1
> root@beagleboard:~# ./tst1
> bit 0 =3D 0, bits =3D 38, bit7 =3D 1
> root@beagleboard:~# ./tst2
> bit 0 =3D 0, bits =3D 20, bit7 =3D 0
> root@beagleboard:~# ./tst3
> bit 0 =3D 0, bits =3D 20, bit7 =3D 0
>
> Not sure what is happening here.
> I tried to compile cdrkit with -O1 using
> FULL_OPTIMIZATION =3D "-O1"
> FULL_OPTIMIZATION_armv7a =3D "-O1"
> BUILD_OPTIMIZATION =3D "${FULL_OPTIMIZATION}"
> but that did not help either.
>
> There is a compile time macro in gcc called BITS_BIG_ENDIAN but that
> one is set to 0 for arm (same as for x86).
>
> Puzzled....
=46rans

There is a gcc bug here you are seeing when you use higher opt level. But t=
his=20
may not be cause of your problem here. You could try compiling with -Wcast-
align and see for any new warnings that will pop up. You then need to fix t=
hose=20
cases.

You could also try -Wpadded and see if any structure is getting implicit=20
padding.


Thx

=2DKhem


