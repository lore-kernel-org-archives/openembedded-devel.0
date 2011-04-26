Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEj5W-0003vU-GI for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 16:18:02 +0200
Received: from f053033081.adsl.alicedsl.de ([78.53.33.81]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEj3s-0003Ru-R2 for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 14:16:21 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ly1v0pqft7.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1303814494-9623-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1303824912.4073.44.camel@mattotaupa>
	<ly1v0pqft7.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Tue, 26 Apr 2011 16:15:33 +0200
Message-ID: <1303827333.4073.57.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] tcp-wrappers: place LIBS after object files
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
X-List-Received-Date: Tue, 26 Apr 2011 14:18:02 -0000
X-Groupsio-MsgNum: 31482
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-crnY8khghz0iMPA9bDDy"

--=-crnY8khghz0iMPA9bDDy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 26.04.2011, 15:53 +0200 schrieb Enrico Scholz:
> Paul Menzel <paulepanter@users.sourceforge.net> writes:
>=20
> >> From: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>
> >
> > it seems you need to update your Git configuration to your common
> > email address.
>=20
> Both addresses are in use; some patches are created at home when I work
> on a personal project (-> tu-chemnitz.de address), some patches at work
> (-> sigma-chemnitz.de address).

I guessed as much. But your Signed-off-by line differs from the From
line. Additionally for the commit statistics it would be better to use a
common address so that all your commits are shown under one person.

The second reason is just for convenience reasons.

> > The diff could have been smaller, but no big problem.
>=20
> how? three places must be changed (removal of $(LIBS) from old LINKFLAGS,
> removal of superflous ';' and adding of $(LIBS) to link command).

I meant just the header of the diff in the patch.

> >> +-SHLIB_OBJ=3D $(addprefix shared/, $(LIB_OBJ));
> >> ++SHLIB_OBJ=3D $(addprefix shared/, $(LIB_OBJ))
> >
> > The =C2=BB;=C2=AB was superfluous, since no command followed?
>=20
> yes; and it would break the build because it terminates the $(CC) command
> and $(LIBS) would be interpreted as the start of a new command.

Thank you for the explanation.

> >> ++	$(CC) $(LDFLAGS) -o $(SHLIB) $(SHLINKFLAGS) $(SHLIB_OBJ) $(LIBS)
>=20
> > Is this patch already upstream?
>=20
> woglinde gave his ack on irc

For documentation purpose it would be great if you could add such
acknowledgments to the commit message.

> and I submitted it.

But I meant upstream of TCP Wrapper.


Thank you for the explanation and your patches,

Paul

--=-crnY8khghz0iMPA9bDDy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2204UACgkQPX1aK2wOHVjsvACdFU/Zdep2E1wE593NLp2WrCT5
OwQAn1wCM3dBGKbJEDIN5SXBZFtEGuzB
=Xka7
-----END PGP SIGNATURE-----

--=-crnY8khghz0iMPA9bDDy--
