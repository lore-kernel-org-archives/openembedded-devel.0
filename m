Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qeagc-0008Rp-Ho for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 00:35:15 +0200
Received: from f053037185.adsl.alicedsl.de ([78.53.37.185]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QeadE-0006tE-Mq for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 22:31:44 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1309990305-4246-1-git-send-email-agnel.joel@gmail.com>
References: <1309990305-4246-1-git-send-email-agnel.joel@gmail.com>
Date: Thu, 07 Jul 2011 00:31:23 +0200
Message-ID: <1309991483.4583.46.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] libxml: Deleted patch that is already applied in source tarball
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
X-List-Received-Date: Wed, 06 Jul 2011 22:35:15 -0000
X-Groupsio-MsgNum: 33025
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-bo1Wfq6gwPciMXyCL1uI"

--=-bo1Wfq6gwPciMXyCL1uI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 06.07.2011, 17:11 -0500 schrieb Joel A Fernandes:
> This deletes a patch that appears to be already applied to the checked ou=
t source and is causing do_patch in libxml2
> to fail when bitbaking beagleboard-validation-base-image

This is strange. I do not get this error with `bitbake -k libxml2`. And
according to `git log recipes/libxml/` the patch has been there from the
beginning so somebody else should have hit this too already. Can you
check your set up and post exactly what branch and build configuration
you are using. It would be great if you could run another build with a
clean build (and download(?)) directory.

What do you mean by =C2=BBchecked out=C2=AB? The downloaded archive?

> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
> ---
> Not sure if should bump the PR in this case? If not, please ignore this n=
ote

If it really fixes a build error I guess no PR bump would be needed,
since the package content should not change.

[=E2=80=A6]


Thanks,

Paul

--=-bo1Wfq6gwPciMXyCL1uI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4U4jsACgkQPX1aK2wOHViR4QCfVtlp5KsPoo5MJ/oeQ2Zi/IfJ
4FUAn0EOIc+yOgQtAcuoH1nqQE4ANX+W
=TUsh
-----END PGP SIGNATURE-----

--=-bo1Wfq6gwPciMXyCL1uI--
