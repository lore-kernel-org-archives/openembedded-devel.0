Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NWTl9-0004K7-6F
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 12:57:38 +0100
Received: from 88-110-78-150.dynamic.dsl.as9105.com ([88.110.78.150]
	helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NWTj0-0001tE-Ko
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 11:55:22 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <op.u6ob5ohzmn1qzu@guohr-laptop-ubuntu>
References: <> <1263698541-9726-1-git-send-email-camelguo@gmail.com>
	<1263726023.457.897.camel@lenovo.internal.reciva.com>
	<op.u6ob5ohzmn1qzu@guohr-laptop-ubuntu>
Date: Sun, 17 Jan 2010 11:55:18 +0000
Message-ID: <1263729318.457.901.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Change the prefer binutils of micro.conf from 2.19.51 to 2.18
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
X-List-Received-Date: Sun, 17 Jan 2010 11:57:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2010-01-17 at 19:14 +0800, Guo Hongruan wrote:
> =E5=9C=A8 Sun, 17 Jan 2010 19:00:23 +0800=EF=BC=8CPhil Blundell <philb@gn=
u.org> =E5=86=99=E9=81=93:
>=20
> > On Sun, 2010-01-17 at 11:22 +0800, Guo Hongruan wrote:
> >> * the previous default version of binutils (2.19.51) in micro.conf =20
> >> cause the default version of glibc failed to build
> >>
> >> Signed-off-by: Guo Hongruan <camelguo@gmail.com>
> >>
> >> -PREFERRED_BINUTILS =3D "2.19.51"
> >> +PREFERRED_BINUTILS =3D "2.18"
> >
> > No, this is not acceptable.  Moving binutils forwards to 2.20{.1} would
> > probably be OK, but going back to 2.18 is no good since that version
> > does not work correctly with Thumb code.
>=20
> the toolchain setting in micro.conf is incompatible, which caused this =20
> problem. For the preferred version of glibc is 2.6.1 which is set in =20
> conf/distro/include/sane-toolchain.inc,

Isn't micro using eglibc?  I wouldn't have expected that you should be
seeing glibc built at all for that DISTRO.

> I think it is better to change the =20
> binutils preferred version which is set in conf/distro/micro.conf.

As I said before, binutils 2.18 is not acceptable in general because
this version cannot do Thumb code.  Glibc 2.6.1 is pretty old and, if it
is incompatible with newer toolchains, I would suggest updating to a
newer version of glibc (e.g. 2.10) rather than trying to wind the
toolchain backwards.

As a last resort we could make the binutils version be
architecture-specific, and select 2.18 for i386, but I really don't
think this ought to be necessary.

p.



