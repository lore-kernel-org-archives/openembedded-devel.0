Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEiST-0002WR-7v for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 15:37:42 +0200
Received: from f053033081.adsl.alicedsl.de ([78.53.33.81]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEiQp-0001mQ-A1 for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 13:35:59 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1303814494-9623-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1303814494-9623-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Date: Tue, 26 Apr 2011 15:35:12 +0200
Message-ID: <1303824912.4073.44.camel@mattotaupa>
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
X-List-Received-Date: Tue, 26 Apr 2011 13:37:44 -0000
X-Groupsio-MsgNum: 31478
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-nCNnwgrI7XNeVs+Ln3op"

--=-nCNnwgrI7XNeVs+Ln3op
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Enrico,


Am Dienstag, den 26.04.2011, 12:41 +0200 schrieb Enrico Scholz:
> From: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>

it seems you need to update your Git configuration to your common email
address.

> This fixes builds with '-Wl,-as-needed'. Patch changes the previous
> 'ldflags.patch' files instead of adding a new one.

It would be great if you could add a log of the failed build.

> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> Cc: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
> ---
>  .../tcp-wrappers/tcp-wrappers-7.6/ldflags.patch    |   22 ++++++++++++++=
+----
>  1 files changed, 17 insertions(+), 5 deletions(-)
>=20
> diff --git a/recipes/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch b/recipe=
s/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch
> index 2e89765..cac8615 100644
> --- a/recipes/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch
> +++ b/recipes/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch
> @@ -1,13 +1,25 @@
> -Index: tcp_wrappers_7.6.orig/Makefile
> +Index: tcp_wrappers_7.6/Makefile
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- tcp_wrappers_7.6.orig.orig/Makefile	2009-04-06 10:55:47.000000000 +0=
000
> -+++ tcp_wrappers_7.6.orig/Makefile	2009-04-06 10:57:04.000000000 +0000
> -@@ -748,31 +748,31 @@
> +--- tcp_wrappers_7.6.orig/Makefile
> ++++ tcp_wrappers_7.6/Makefile

The diff could have been smaller, but no big problem.

> +@@ -724,9 +724,9 @@ SHLIBSOMAJ	=3D shared/libwrap.so.$(SOMAJOR
> + SHLIBSO		=3D shared/libwrap.so
> + SHLIBFLAGS	=3D -Lshared -lwrap
> +=20
> +-SHLINKFLAGS =3D -shared -Xlinker -soname -Xlinker libwrap.so.$(SOMAJOR)=
 -lc $(LIBS)
> ++SHLINKFLAGS =3D -shared -Xlinker -soname -Xlinker libwrap.so.$(SOMAJOR)
> + SHCFLAGS =3D -fPIC -shared -D_REENTRANT
> +-SHLIB_OBJ=3D $(addprefix shared/, $(LIB_OBJ));
> ++SHLIB_OBJ=3D $(addprefix shared/, $(LIB_OBJ))

The =C2=BB;=C2=AB was superfluous, since no command followed?

> + all other: config-check tcpd tcpdmatch try-from safe_finger tcpdchk $(L=
IB)
> +=20
> +@@ -748,31 +748,31 @@ $(LIB):	$(LIB_OBJ)
>  =20
>   $(SHLIB): $(SHLIB_OBJ)
>   	rm -f $(SHLIB)
>  -	$(CC) -o $(SHLIB) $(SHLINKFLAGS) $(SHLIB_OBJ)
> -+	$(CC) $(LDFLAGS) -o $(SHLIB) $(SHLINKFLAGS) $(SHLIB_OBJ)
> ++	$(CC) $(LDFLAGS) -o $(SHLIB) $(SHLINKFLAGS) $(SHLIB_OBJ) $(LIBS)
>   	ln -sf $(notdir $(SHLIB)) $(SHLIBSOMAJ)
>   	ln -sf $(notdir $(SHLIBSOMAJ)) $(SHLIBSO)

Is this patch already upstream?


Thanks,

Paul

--=-nCNnwgrI7XNeVs+Ln3op
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk22yg8ACgkQPX1aK2wOHVjO4QCeN43ko+qixM/Vq4M+35yaimdr
/t0An3LcKnDwkE8KUIMTTB64SIrzEmNn
=6GhT
-----END PGP SIGNATURE-----

--=-nCNnwgrI7XNeVs+Ln3op--
