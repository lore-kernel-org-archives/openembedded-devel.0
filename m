Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RssdA-00065y-Ez
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Feb 2012 10:07:00 +0100
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id D97864B028D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Feb 2012 09:59:01 +0100 (CET)
Date: Thu, 2 Feb 2012 09:58:40 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120202095840.392c5244@eb-e6520>
In-Reply-To: <CA+chaQe-XFR6XVAoept8+d8kqoZ1y2qBoVXgetEPpD2n50nYBA@mail.gmail.com>
References: <1324624336-18713-1-git-send-email-eric@eukrea.com>
	<20120104051849.GG31275@sakrah.homelinux.org>
	<20120104090523.066ae2d7@eb-e6520>
	<CA+chaQe-XFR6XVAoept8+d8kqoZ1y2qBoVXgetEPpD2n50nYBA@mail.gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [meta-oe] gdb-cross-canadian: build gdb with python support
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
X-List-Received-Date: Thu, 02 Feb 2012 09:07:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Martin,

(sorry if you get the mail twice, I'm trying with a new smtp as the
previous one seems to have high latency with mailing lists).

Le Thu, 2 Feb 2012 08:45:13 +0100,
Martin Jansa <martin.jansa@gmail.com> a =E9crit :

> On Wed, Jan 4, 2012 at 9:05 AM, Eric B=E9nard <eric@eukrea.com> wrote: =20
> > Hi Khem,
> >
> > Le Tue, 3 Jan 2012 21:18:49 -0800,
> > Khem Raj <raj.khem@gmail.com> a =E9crit : =20
> >> On (23/12/11 08:12), Eric B=E9nard wrote: =20
> >> > * python support is needed for providing finer scripting control
> >> > in gdb, and for remote controling gdb for example from qtcreator
> >> > * gdb/configure tries to autodetect python using python executable
> >> > with --includes --ldflags --exec-prefix to get the right flags
> >> > As it's difficult to achieve in OE's context, we generate a
> >> > script which will return the right values and make gdb's build
> >> > system happy. This idea was taken from the following article :
> >> > http://www.mentby.com/doug-evans-2/python-enabled-gdb-on-windows-and=
-relocation.html
> >> > * tested using angstrom & armv7/armv5 targets & qtcreator 201005 & 2=
.4.0 =20
> >>
> >> I think this change should go into oe-core. Can you please redo it
> >> w.r.t. oe-core
> >> =20
> > I agree with you, I initally submited it for oe-core and was asked
> > to put it into meta-oe by Jessica :
> > http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/01=
4828.html
> > http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/01=
4833.html
> >
> > Eric =20
>=20
> Hi Eric,
>=20
> with this patch I see gdb-cross-canadian_7.3.1.bb failing with:
> | checking whether to use python...
> /OE/shr-core/tmp/work/x86_64-nativesdk-oesdk-linux/gdb-cross-canadian-arm=
/gdb-cross-canadian-arm-7.3.1-r5.1/python
> | checking for python2.7... no
> | configure: error: no usable python found at
> /OE/shr-core/tmp/work/x86_64-nativesdk-oesdk-linux/gdb-cross-canadian-arm=
/gdb-cross-canadian-arm-7.3.1-r5.1/python
>=20
> and
> /OE/shr-core/tmp/work/x86_64-nativesdk-oesdk-linux/gdb-cross-canadian-arm=
/gdb-cross-canadian-arm-7.3.1-r5.1/python
> is really script from this patch
>=20
> Any hint how to fix this?
>  =20
can you check the content of :
${WORKDIR}/python
and if
${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${exec_prefix=
}/include/python${PYTHON_BASEVERSION}/
and
${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${libdir}/pyt=
hon${PYTHON_BASEVERSION}/config/config =20
exist ?

Eric
--=20
http://eukrea.com/en/news/104-2012


