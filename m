Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QMnal-0001B6-Nk for openembedded-devel@lists.openembedded.org;
	Wed, 18 May 2011 22:43:39 +0200
Received: from f053038139.adsl.alicedsl.de ([78.53.38.139]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QMnY2-0001zC-5l for openembedded-devel@lists.openembedded.org;
	Wed, 18 May 2011 20:40:50 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BANLkTi=aVkuikkwxKoQNuQ8fTmHTZOxyhw@mail.gmail.com>
References: <1304951256.3791.61.camel@mattotaupa>
	<1305621062.4065.20.camel@mattotaupa>
	<BANLkTi=aVkuikkwxKoQNuQ8fTmHTZOxyhw@mail.gmail.com>
Date: Wed, 18 May 2011 22:40:44 +0200
Message-ID: <1305751244.4389.38.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: gs_9.01: task configure fails with `./base/gp_unix.c:25:37: error: fontconfig/fontconfig.h: No such file or directory`
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
X-List-Received-Date: Wed, 18 May 2011 20:43:39 -0000
X-Groupsio-MsgNum: 32185
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-g2millGMnyIrDoQk/6ss"

--=-g2millGMnyIrDoQk/6ss
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 17.05.2011, 06:00 -0700 schrieb Steve Sakoman:
> On Tue, May 17, 2011 at 1:31 AM, Paul Menzel
> <paulepanter@users.sourceforge.net> wrote:
>=20
> > I have two problems with this commit though.
> >
> > 1. According to the build logs from Steve [2][3] this recipe fails for
> > him with the same error message.
>=20
> Yes, it did fail that time, but note that it completed successfully on
> that same machine as well as a different machine subsequently with no
> changes to the recipe!

How can I search for failed Ghostscript builds? Could you please tell me
the machine.

> I can't explain why that is, but we need to figure it out!  Perhaps a
> missing dependency or a parallel build issue??

The error here is that we do use `make` instead of `oe_runmake` and
therefore the environment variables are not set correctly.

> > 2. The recipe of `gs_8.64` was improved beforehand [4] and the above
> > mentioned problem fixed (it still does not work though). Why was the ne=
w
> > version not based on the old one?
>=20
> Probably because this the 9.01 recipe has been sitting around in one
> of my experimental branches for quite a few months and Koen pulled
> quite recently.  So I likely based it off the version prior to
> Graham's changes.

Understood.

> We should probably apply Graham's modifications to 9.01 also.
>=20
> Have you tried that yet?

I tried building Ghostscript 8.64 which failed because
`libfontconfig.so.1` cannot be found. I would propose to first fix 8.64
and then apply those changes to 9.01.

Hopefully Graham will have time to reply or, if you and Graham are on
IRC, you could try to ask him there.


Thanks,

Paul


> >> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D49=
a0babada7f58fc583d299cfc16c22fc3e42fc2
> > [2] http://build.sakoman.com/packages/11697/
> > [3] http://build.sakoman.com/public/logs/task/82709.txt
> > [4] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D74d=
7b8e7a0c52178a8a111415586eb15d802a88b
[5] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-May/032881=
.html

--=-g2millGMnyIrDoQk/6ss
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3ULswACgkQPX1aK2wOHVjANQCffEvASC+DjHM0soCz+RfqMetj
zzgAn2bNew9Ka5AyTp/tuQXxH+oItSY4
=h1oC
-----END PGP SIGNATURE-----

--=-g2millGMnyIrDoQk/6ss--
