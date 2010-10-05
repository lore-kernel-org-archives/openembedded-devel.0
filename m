Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anton.sergienko@gmail.com>) id 1P32EP-0003kZ-7V
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 09:46:39 +0200
Received: by iwn2 with SMTP id 2so7948952iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 00:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=jxHuWv9Wan5PuMkvn3z24sKspvlVB0Lp50RNPBYdnIA=;
	b=hFBLXfkwlUlywD8UCs0KKLiM3e8gqlMlRGfvptLDYH8NoqshgtMUeJdbyOjE2J0yxK
	ICffU0Pz9+0wEAyXfz4kY2oLPw3YR3gZkfUYziUx7zRsUuMYPb1+p0xPhoDearnN+PjH
	92zAprPyLAdBMOZSGghHdX7lrdUheRgmLksGA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=kvD/98HtIRLXt6otkCSS91qTY1Trf7+x01JHPZJb8cg/Jy2P6Td3ojOVKwU9jUrFw9
	Tq8yuFkdbwTKqjOv0lyUkjYLzMPXckW4j7Gp+TP60WvqRChmTuowHu3FcYVfQ/6jMGJM
	XGg+iGTXhuEzvXfsX4cg2dci6XkcA9pS4AA/0=
Received: by 10.231.149.198 with SMTP id u6mr11690675ibv.7.1286264777356; Tue,
	05 Oct 2010 00:46:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.192.68 with HTTP; Tue, 5 Oct 2010 00:45:57 -0700 (PDT)
In-Reply-To: <AANLkTin3ykUbVfGwqghAjRPnPx12LLimmrrtnzoS0Fat@mail.gmail.com>
References: <AANLkTi=X_E_B54Wrm7SDCTDJ1t2usFDAwj-99r_tDn0E@mail.gmail.com>
	<AANLkTin3ykUbVfGwqghAjRPnPx12LLimmrrtnzoS0Fat@mail.gmail.com>
From: Anton Sergienko <anton.sergienko@gmail.com>
Date: Tue, 5 Oct 2010 09:45:57 +0200
Message-ID: <AANLkTinSyb=8PhOg=xRjQ+OuYHknvvCzEyKBBM1V=hHy@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: anton.sergienko@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: eglibc, do_package error: too old kernel
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
X-List-Received-Date: Tue, 05 Oct 2010 07:46:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hej Patrik !
har b=C3=B6rjat med OE f=C3=B6r ett tag sedan men hade inga fr=C3=A5gor til=
ls nu :) Systemd
finns i listan av packet som jag t=C3=A4nkte prova i n=C3=A4rmaste framtide=
n.


For me it seems to start working if i'm changing kernel version to 2.6.32
(libc-headers version).

//Anton

On Tue, Oct 5, 2010 at 9:32 AM, Patrik Lindergren <palisv@gmail.com> wrote:

> Tjenare, Anton
>
> Hur =C3=A4r l=C3=A4get?
>
> B=C3=B6rjar du k=C3=B6ra mer Linux nu? :-)
>
> Sj=C3=A4lva eglibc paketet verkar vara inte helt moget i OpenEmbedded, f=
=C3=A5r
> sj=C3=A4lv fel p=C3=A5 det n=C3=A4r jag k=C3=B6r det emot en 2.6.34 k=C3=
=A4rna och qemu. Men d=C3=A5
> =C3=A4r det ett annat fel.
> Om det =C3=A4r bara f=C3=B6r att f=C3=A5 ig=C3=A5ng en grund milj=C3=B6 s=
=C3=A5 kan fungerar glibc
> r=C3=A4tt okey dock s=C3=A5 blir den st=C3=B6rre.
>
> Skall fixa eglibc strax men h=C3=A5ller p=C3=A5 att fixa till systemd (ko=
lla
> g=C3=A4rna upp det riktigt h=C3=A4ftig ers=C3=A4ttare till init m.m) f=C3=
=B6rst. Problemet
> med systemd nu =C3=A4r att den har beroende emot GTK+ (fast den beh=C3=B6=
ver
> igentligten bara glib om man skippar den grafiska frontend:en).
>
> Mvh
> Patrik Lindergren
>
> 2010/10/5 Anton Sergienko <anton.sergienko@gmail.com>:
> > Hello!
> > I'm getting an error during packaging of eglibc:
> >
> > bitbake -f -c package eglibc
> > NOTE: Handling BitBake files: / (7082/7082) [100 %]
> > Parsing of 7082 .bb files complete (6614 cached, 468 parsed). 7273
> targets,
> > 322 skipped, 0 masked, 0 errors.
> > NOTE: Resolving any missing task queue dependencies
> > NOTE: Preparing runqueue
> > NOTE: Executing runqueue
> > NOTE: Running task 426 of 426 (ID: 8,
> > /build/openembedded/openembedded/recipes/eglibc/eglibc_2.11.bb,
> do_package)
> > NOTE: package eglibc-2.11-r14.7+svnr10690: task do_package: Started
> > NOTE: preparing tree for binary locale generation
> > FATAL: kernel too old
> > ERROR: Task 8 (/build/openembedded/openembedded/recipes/eglibc/
> > eglibc_2.11.bb, do_package) failed with exit code '1'
> > NOTE: generating locale en_US (UTF-8)
> > NOTE: package eglibc-2.11-r14.7+svnr10690: task None: Failed
> > ERROR: localedef returned an error (command was
> >
> PATH=3D"/build/openembedded/build/tmp_angstrom.7/sysroots/x86_64-linux/us=
r/i686/bin:/build/openembedded/build/tmp_angstrom.7/sysroots/x86_64-linux/u=
sr/sbin:/build/openembedded/build/tmp_angstrom.7/sysroots/x86_64-linux/usr/=
bin:/build/openembedded/build/tmp_angstrom.7/sysroots/x86_64-linux/sbin:/bu=
ild/openembedded/build/tmp_angstrom.7/sysroots/x86_64-linux//bin:/build/ope=
nembedded/bitbake/bin:/usr/lib64/mpi/gcc/openmpi/bin:/bin:/usr/local/bin:/u=
sr/bin:/bin:/usr/bin/X11:/usr/X11R6/bin:/usr/games:/opt/kde3/bin:/usr/lib/m=
it/bin:/usr/lib/mit/sbin:/usr/lib/qt3/bin"
> >
> I18NPATH=3D"/build/openembedded/build/tmp_angstrom.7/work/i686-angstrom-l=
inux/eglibc-2.11-r14.7+svnr10690/locale-tree/usr/share/i18n"
> > qemu-i386 -s 1048576 -r 2.6.24 -L
> >
> /build/openembedded/build/tmp_angstrom.7/work/i686-angstrom-linux/eglibc-=
2.11-r14.7+svnr10690/locale-tree
> > -E
> >
> LD_LIBRARY_PATH=3D/build/openembedded/build/tmp_angstrom.7/work/i686-angs=
trom-linux/eglibc-2.11-r14.7+svnr10690/locale-tree/lib
> >
> /build/openembedded/build/tmp_angstrom.7/work/i686-angstrom-linux/eglibc-=
2.11-r14.7+svnr10690/locale-tree/bin/localedef
> > --force --old-style --no-archive
> >
> --prefix=3D/build/openembedded/build/tmp_angstrom.7/work/i686-angstrom-li=
nux/eglibc-2.11-r14.7+svnr10690/locale-tree
> > --inputfile=3D/usr/share/i18n/locales/en_US --charmap=3DUTF-8 en_US).
> >
> >
> >
> > Seems to be something wrong with kernel version supplied in qemu's
> > arguments.
> >
> > //Anton
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

