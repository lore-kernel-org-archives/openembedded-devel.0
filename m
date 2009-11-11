Received: from [209.85.223.198] (helo=mail-iw0-f198.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N88R6-0007TS-Fl
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 09:20:20 +0100
Received: by iwn36 with SMTP id 36so731413iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 00:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=y3HW/CJnRk5ObD+ORhdofIIw5ju6BivMT150VhVQz8U=;
	b=KLSCXoIqrjeGiG2LeMbGtWbVvzLOx21rACW8pkbsyCZef5OS+kVZdKvy/QnDH75pbh
	tkCNxEur8pVRUJgoOeQ0+Di7OIpf2jsPJ60FEnlScDbZXZygsW0F1HKnyL1DoDIVsmK/
	vbIwb+1bOjveEKPL/UToELbEVQX3lN+6Ywjg4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hIpSKow2i68vhIiOh2gZY/UrQwBdWzMEnY9mPcXlY4ZA57hXaydESH6psCrpZfrbE4
	7YqC9pejNzEYDztXrisfj4XSkGr0C0ofYLK14a5SE+95Ll/dlu8esTGEehyk2p+hXZb3
	AQzogzI8BsTrTlftRR9swANyI+nu0AgjrVKes=
MIME-Version: 1.0
Received: by 10.231.83.75 with SMTP id e11mr2261547ibl.11.1257927213078; Wed, 
	11 Nov 2009 00:13:33 -0800 (PST)
In-Reply-To: <DIIE.000005E3001861E8@192.168.11.6>
References: <DIIE.000005E3001861E8@192.168.11.6>
Date: Wed, 11 Nov 2009 00:13:33 -0800
Message-ID: <19c1b8a90911110013q22055182i911816f070bc0f7a@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.198
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: question meta-toolchain on x86_64 for armv5te
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
X-List-Received-Date: Wed, 11 Nov 2009 08:20:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2009 at 8:03 AM, Johannes Maier <jm@huber-online.com> wrote=
:
> Hi@all,
>
> I'm new to openembedded and I didn't find any answers to my questions so =
I hope to find here some help.
>
> I get an error while building the meta-toolchain on x86_64 for armv5te.
>
> So I wanted to ask if it is in general better to use a 32bit system for s=
uch tasks since I don't get any error there?
>
> The error is as follows:
>
> angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb -I/home/test/oe/s=
tuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cr=
oss-sdk-6.8-r2/gdb-6.8/gdb/config -DLOCALEDIR=3D"\"/usr/local/angstrom/arm/=
share/locale\"" -DHAVE_CONFIG_H -I/home/test/oe/stuff/openembedded/tmp/work=
/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb=
/../include/opcode -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5=
te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/../readline/=
.. -I../bfd -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-=
angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/../bfd -I/home/test=
/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/g=
db-cross-sdk-6.8-r2/gdb-6.8/gdb/../include -I../libdecnumber -I/home/test/o=
e/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb=
-cross-sdk-6.8-r2/gdb-6.8/gdb/../libdecnumber =C2=A0 -DMI_OUT=3D1 -DTUI=3D1
> -isystem/home/test/oe/stuff/opene
> mbedded/tmp/staging/x86_64-linux/usr/include -Wall -Wdeclaration-after-st=
atement -Wpointer-arith -Wformat-nonliteral -Wno-pointer-sign -Wno-unused -=
Wno-switch -Wno-char-subscripts -Werror /home/test/oe/stuff/openembedded/tm=
p/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6=
.8/gdb/value.c
> | ccache gcc -c -isystem/home/test/oe/stuff/openembedded/tmp/staging/x86_=
64-linux/usr/include -O2 =C2=A0 -I. -I/home/test/oe/stuff/openembedded/tmp/=
work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8=
/gdb -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstro=
m-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/config -DLOCALEDIR=3D"\"/u=
sr/local/angstrom/arm/share/locale\"" -DHAVE_CONFIG_H -I/home/test/oe/stuff=
/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-=
sdk-6.8-r2/gdb-6.8/gdb/../include/opcode -I/home/test/oe/stuff/openembedded=
/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gd=
b-6.8/gdb/../readline/.. -I../bfd -I/home/test/oe/stuff/openembedded/tmp/wo=
rk/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/g=
db/../bfd -I/home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-an=
gstrom-linux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/../include -I../libde=
cnumber
> -I/home/test/oe/stuff/
> openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/gdb-cross=
-sdk-6.8-r2/gdb-6.8/gdb/../libdecnumber =C2=A0 -DMI_OUT=3D1 -DTUI=3D1 -isys=
tem/home/test/oe/stuff/openembedded/tmp/staging/x86_64-linux/usr/include -W=
all -Wdeclaration-after-statement -Wpointer-arith -Wformat-nonliteral -Wno-=
pointer-sign -Wno-unused -Wno-switch -Wno-char-subscripts -Werror /home/tes=
t/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-linux-gnueabi/=
gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/eval.c
> | cc1: warnings being treated as errors
> | /home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-l=
inux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/eval.c: In function 'evaluate=
_subexp_standard':
> | /home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-l=
inux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/eval.c:1705: error: 'subscrip=
t_array' may be used uninitialized in this function
> | /home/test/oe/stuff/openembedded/tmp/work/x86_64-armv5te-sdk-angstrom-l=
inux-gnueabi/gdb-cross-sdk-6.8-r2/gdb-6.8/gdb/eval.c:1644: note: 'subscript=
_array' was declared here

you might be using gcc 4.4 on your build box.
gcc 4.4 spits more warnings like what you see. You can do couple of
things. add --disable-werror to gdb recipes but
I would not recommend that. Secondly you can create a patch to gdb/eval.c
Modify line 1644 of gdb/eval.c to
int subscript_array[MAX_FORTRAN_DIMS] =3D {0};

and this should make gcc 4.4 happy.

-Khem
Thanks


