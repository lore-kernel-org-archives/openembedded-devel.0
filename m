Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <khimov@altell.ru>) id 1PVKZG-0008FD-TR
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 10:01:06 +0100
Received: from keemun.altell.local (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id 319855413
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 11:52:37 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Dec 2010 11:52:36 +0300
User-Agent: KMail/1.13.5 (Linux/2.6.34.7-0.5-desktop; KDE/4.4.4; x86_64; ; )
References: <4D0FA44D.7000907@gmail.com> <20101220212958.GC17904@gmail.com>
	<4D10F80E.1000505@gmail.com>
In-Reply-To: <4D10F80E.1000505@gmail.com>
MIME-Version: 1.0
Message-Id: <201012221152.36723.khimov@altell.ru>
X-Altell-MailScanner-ID: 319855413.4C82A
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-Spam-Status: No
Subject: Re: openssl-native_1.0.0b.bb do_compile failed
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
X-List-Received-Date: Wed, 22 Dec 2010 09:01:07 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D1=82=D0=BE=D1=80=D0=BD=D0=B8=D0=BA 21 =D0=B4=D0=B5=D0=BA=D0=B0=D0=
=B1=D1=80=D1=8F 2010 21:55:10 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Jan Paesmans =
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> On 12/20/10 22:29, Khem Raj wrote:
> > On (20/12/10 19:45), Jan Paesmans wrote:
> >> I traced the culprit down to the following command using strace:
> >> execve("/usr/bin/ld", ["/usr/bin/ld", "--build-id", "--eh-frame-hdr",
> >> "-m", "elf_x86_64", "--hash-style=3Dgnu", "-shared", "-o", "libgost.so=
",
> >> "-z", "relro",
> >> "/usr/lib/gcc/x86_64-linux-gnu/4.4.5/../../../../lib/crti.o",
> >> "/usr/lib/gcc/x86_64-linux-gnu/4.4.5/crtbeginS.o", "-L../..",
> >> "-L/usr/lib/gcc/x86_64-linux-gnu/4.4.5",
> >> "-L/usr/lib/gcc/x86_64-linux-gnu/4.4.5",
> >> "-L/usr/lib/gcc/x86_64-linux-gnu/4.4.5/../../../../lib",
> >> "-L/lib/../lib", "-L/usr/lib/../lib",
> >> "-L/usr/lib/gcc/x86_64-linux-gnu/4.4.5/../../..",
> >> "-L/usr/lib/x86_64-linux-gnu", "-lcrypto",
> >> "--version-script=3Dopenssl.ld", "-Bsymbolic", "-soname=3Dlibgost.so",
> >> "--whole-archive", "e_gost_err.o", "gost2001_keyx.o", "gost2001.o",
> >> "gost89.o", "gost94_keyx.o", "gost_ameth.o", "gost_asn1.o",
> >> "gost_crypt.o", "gost_ctl.o", "gost_eng.o", "gosthash.o",
> >> "gost_keywrap.o", "gost_md.o", "gost_params.o", "gost_pmeth.o",
> >> "gost_sign.o", "--no-whole-archive", "-lgcc", "--as-needed", "-lgcc_s",
> >> "--no-as-needed", "-lc", "-lgcc", "--as-needed", "-lgcc_s",
> >> "--no-as-needed", "/usr/lib/gcc/x86_64-linux-gnu/4.4.5/crtendS.o",
> >> "/usr/lib/gcc/x86_64-linux-gnu/4.4.5/../../../../lib/crtn.o"], [/* 102
> >> vars */]) =3D 0
> >>=20
> >> Seems like this file openssl.ld is needed for the --version-script.
> >> I did a simple test that involved removing the offending linker flag
> >> from the makefile and that did the trick. However it seems to me that
> >> this is a very hackish solution.
> >>=20
> >> Any further ideas?
> >=20
> > Well removing it may not be a good thing to do. Can you make sure
> > that this ld script exist in the build tree
>=20
> Well, seems that the files openssl.ld are created by the debian.patch.
> Any idea why that is applied?

Sane paths, configure targets, etc. Although I've never seen problems like=
=20
yours from 10 minute look it seems that an update is needed for it. For one=
,=20
openssl.ld is still living in 0.9.8 days. I have a 1.0.0c patch almost read=
y=20
for OE.dev, so I'll try to take a closer look at debian.patch when testing =
it.=20
Hope to do it this week.


