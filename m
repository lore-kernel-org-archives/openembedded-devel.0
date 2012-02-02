Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rssuz-00059I-RR
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Feb 2012 10:25:26 +0100
Received: by eaal10 with SMTP id l10so336175eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Feb 2012 01:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2oAvtAVcuAiV8PQ7Oc64SJnd8J7qxHcaxXxx7sjckH8=;
	b=sof+GA9bQCa+yKe1cGmxzstnj/v1aOd68/x48s3HyFZvaGkeliKJAb8Cl54MegW0Bq
	9sOV9Xk31umJilvfK7LOCJQZqUROTMqGnFcnd6FXVjKUEku8hAXLtukFiSaBF4wydGWP
	lQYZtNPjhZhB43WR1AcnPs6Xuv8c+940wAXrs=
Received: by 10.213.28.204 with SMTP id n12mr357241ebc.74.1328174250059;
	Thu, 02 Feb 2012 01:17:30 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e12sm7105099eea.5.2012.02.02.01.17.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Feb 2012 01:17:28 -0800 (PST)
Date: Thu, 2 Feb 2012 10:17:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120202091726.GG3697@jama.jama.net>
References: <1324624336-18713-1-git-send-email-eric@eukrea.com>
	<20120104051849.GG31275@sakrah.homelinux.org>
	<20120104090523.066ae2d7@eb-e6520>
	<CA+chaQe-XFR6XVAoept8+d8kqoZ1y2qBoVXgetEPpD2n50nYBA@mail.gmail.com>
	<20120202084000.GD3697@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120202084000.GD3697@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Thu, 02 Feb 2012 09:25:26 -0000
X-Groupsio-MsgNum: 36844
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QWpDgw58+k1mSFBj"
Content-Disposition: inline

--QWpDgw58+k1mSFBj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2012 at 09:40:00AM +0100, Martin Jansa wrote:
> On Thu, Feb 02, 2012 at 08:45:13AM +0100, Martin Jansa wrote:
> > On Wed, Jan 4, 2012 at 9:05 AM, Eric B=E9nard <eric@eukrea.com> wrote:
> > > Hi Khem,
> > >
> > > Le Tue, 3 Jan 2012 21:18:49 -0800,
> > > Khem Raj <raj.khem@gmail.com> a =E9crit :
> > >> On (23/12/11 08:12), Eric B=E9nard wrote:
> > >> > * python support is needed for providing finer scripting control
> > >> > in gdb, and for remote controling gdb for example from qtcreator
> > >> > * gdb/configure tries to autodetect python using python executable
> > >> > with --includes --ldflags --exec-prefix to get the right flags
> > >> > As it's difficult to achieve in OE's context, we generate a
> > >> > script which will return the right values and make gdb's build
> > >> > system happy. This idea was taken from the following article :
> > >> > http://www.mentby.com/doug-evans-2/python-enabled-gdb-on-windows-a=
nd-relocation.html
> > >> > * tested using angstrom & armv7/armv5 targets & qtcreator 201005 &=
 2.4.0
> > >>
> > >> I think this change should go into oe-core. Can you please redo it
> > >> w.r.t. oe-core
> > >>
> > > I agree with you, I initally submited it for oe-core and was asked
> > > to put it into meta-oe by Jessica :
> > > http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/=
014828.html
> > > http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/=
014833.html
> > >
> > > Eric
> >=20
> > Hi Eric,
> >=20
> > with this patch I see gdb-cross-canadian_7.3.1.bb failing with:
> > | checking whether to use python...
> > /OE/shr-core/tmp/work/x86_64-nativesdk-oesdk-linux/gdb-cross-canadian-a=
rm/gdb-cross-canadian-arm-7.3.1-r5.1/python
> > | checking for python2.7... no
> > | configure: error: no usable python found at
> > /OE/shr-core/tmp/work/x86_64-nativesdk-oesdk-linux/gdb-cross-canadian-a=
rm/gdb-cross-canadian-arm-7.3.1-r5.1/python
> >=20
> > and
> > /OE/shr-core/tmp/work/x86_64-nativesdk-oesdk-linux/gdb-cross-canadian-a=
rm/gdb-cross-canadian-arm-7.3.1-r5.1/python
> > is really script from this patch
> >=20
> > Any hint how to fix this?
>=20
> And here are details from:
> gdb-cross-canadian-arm-7.3.1-r5.1/build-arm-oe-linux-gnueabi/gdb/config.l=
og
>=20
> configure:10440: $? =3D 0
> configure:10440: result: yes
> configure:10465: checking whether to use python
> configure:10467: result: /OE/shr-core/tmp/work/x86_64-nativesdk-oesdk-lin=
ux/gdb-cross-canadian-arm/gdb-cross-canadian-arm-7.3.1-r5.1/python
> configure:10685: checking for python2.7
> configure:10703: x86_64-oesdk-linux-gcc  --sysroot=3D/OE/shr-core/tmp/sys=
roots/x86_64-nativesdk-oesdk-linux -o conftest -isystem/OE/shr-core/tmp/sys=
roots/x86_64-oesdk-linux-nativesdk/usr/local/oecore-x86_64-arm/sysroots/x86=
_64-oesdk-linux/usr/include -O2 -pipe -isystem/OE/shr-core/tmp/sysroots/x86=
_64-oesdk-linux-nativesdk/usr/local/oecore-x86_64-arm/sysroots/x86_64-oesdk=
-linux/usr/include  -I/OE/shr-core/tmp/sysroots/x86_64-nativesdk-oesdk-linu=
x/usr/local/oecore-x86_64-arm/sysroots/x86_64-oesdk-linux/usr/include/pytho=
n2.7/  -L/OE/shr-core/tmp/sysroots/x86_64-oesdk-linux-nativesdk/usr/local/o=
ecore-x86_64-arm/sysroots/x86_64-oesdk-linux/usr/lib/armv4t-oe-linux-gnueab=
i -Wl,-rpath-link,/OE/shr-core/tmp/sysroots/x86_64-oesdk-linux-nativesdk/us=
r/local/oecore-x86_64-arm/sysroots/x86_64-oesdk-linux/usr/lib/armv4t-oe-lin=
ux-gnueabi -Wl,-rpath,/usr/local/oecore-x86_64-arm/sysroots/x86_64-oesdk-li=
nux/usr/lib/armv4t-oe-linux-gnueabi -Wl,-O1 -L/OE/shr-core/tmp/sysroots/x86=
_64-oesdk-linux-nativesdk/usr/local/oecore-x86_64-arm/sysroots/x86_64-oesdk=
-linux/lib -Wl,-rpath-link,/OE/shr-core/tmp/sysroots/x86_64-oesdk-linux-nat=
ivesdk/usr/local/oecore-x86_64-arm/sysroots/x86_64-oesdk-linux/lib -Wl,-rpa=
th,/usr/local/oecore-x86_64-arm/sysroots/x86_64-oesdk-linux/lib -Wl,-O1 con=
ftest.c -lncurses -lz -lm    -L/OE/shr-core/tmp/sysroots/x86_64-nativesdk-o=
esdk-linux/usr/local/oecore-x86_64-arm/sysroots/x86_64-oesdk-linux/usr/lib/=
armv4t-oe-linux-gnueabi/python2.7/config/config -lpthread -ldl -lutil -lm -=
lpython2.7 >&5
> conftest.c:91:20: fatal error: Python.h: No such file or directory
> compilation terminated.
>=20
> And Python.h is in
> /OE/shr-core/tmp/sysroots/x86_64-nativesdk-oesdk-linux/usr/local/oecore-x=
86_64-x86_64/sysroots/x86_64-oesdk-linux/usr/include/python2.7/Python.h
> not
> /OE/shr-core/tmp/sysroots/x86_64-nativesdk-oesdk-linux/usr/local/oecore-x=
86_64-arm/sysroots/x86_64-oesdk-linux/usr/include/python2.7/
>=20
> oecore-x86_64-arm doesn't exist at all in /OE/shr-core/tmp/sysroots/x86_6=
4-nativesdk-oesdk-linux/usr/local

OE @ ~ $ ls /OE/shr-core/tmp/sysroots/x86_64-oesdk-linux-nativesdk/usr/loca=
l/
oecore-x86_64-arm
OE @ ~ $ ls /OE/shr-core/tmp/sysroots/x86_64-nativesdk-oesdk-linux/usr/loca=
l/
oecore-x86_64-x86_64

OE @ ~ $ find /OE/shr-core/tmp/sysroots/x86_64-oesdk-linux-nativesdk/usr/lo=
cal/ -name python2.7
OE @ ~ $ find /OE/shr-core/tmp/sysroots/x86_64-nativesdk-oesdk-linux/usr/lo=
cal/ -name python2.7
/OE/shr-core/tmp/sysroots/x86_64-nativesdk-oesdk-linux/usr/local/oecore-x86=
_64-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/python2.7
/OE/shr-core/tmp/sysroots/x86_64-nativesdk-oesdk-linux/usr/local/oecore-x86=
_64-x86_64/sysroots/x86_64-oesdk-linux/usr/include/python2.7

and gdb is trying to use oecore-x86_64-arm in x86_64-nativesdk-oesdk-linux

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QWpDgw58+k1mSFBj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8qVKYACgkQN1Ujt2V2gBy6ywCguVvRMvQ+bPLBX2XUI2dThokR
mx8AoIhoY23QA28/9N9bbLWc9nAiAiv/
=sjrM
-----END PGP SIGNATURE-----

--QWpDgw58+k1mSFBj--
