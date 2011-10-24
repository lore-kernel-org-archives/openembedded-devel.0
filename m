Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RIPIJ-00088b-GP for openembedded-devel@lists.openembedded.org;
	Mon, 24 Oct 2011 20:30:44 +0200
Received: from f053042016.adsl.alicedsl.de ([78.53.42.16]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RIPCc-00010G-2j for openembedded-devel@lists.openembedded.org;
	Mon, 24 Oct 2011 18:24:50 +0000
Message-ID: <1319480673.3483.3.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Oct 2011 20:24:33 +0200
In-Reply-To: <1319480061-20128-3-git-send-email-schnitzeltony@gmx.de>
References: <1319480061-20128-1-git-send-email-schnitzeltony@gmx.de>
	<1319480061-20128-3-git-send-email-schnitzeltony@gmx.de>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [meta-xfce 3/3] xfce4-datetime-plugin: Initial add git (0.6.1)
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
X-List-Received-Date: Mon, 24 Oct 2011 18:30:44 -0000
X-Groupsio-MsgNum: 35004
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-tB2uuynVmK+L/QTSU5IH"

--=-tB2uuynVmK+L/QTSU5IH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Andreas,


Am Montag, den 24.10.2011, 20:14 +0200 schrieb Andreas M=C3=BCller:
> Version 0.6.1 was release about 3 years ago. The patch to migrate from
> libxfcegui4->libxfce4ui hopefully shall be applied mainline [1]. It would=
 have
> caused extra efforts to base the patch on 0.6.1 release.
>=20
> [1] https://bugzilla.xfce.org/show_bug.cgi?id=3D8064
>=20
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmx.de>
> ---
>  .../datetime/files/port-to-libxfce4ui.patch        |  360 ++++++++++++++=
++++++
>  .../datetime/xfce4-datetime-plugin_git.bb          |   20 ++
>  2 files changed, 380 insertions(+), 0 deletions(-)
>  create mode 100644 meta-xfce/recipes-panel-plugins/datetime/files/port-t=
o-libxfce4ui.patch
>  create mode 100644 meta-xfce/recipes-panel-plugins/datetime/xfce4-dateti=
me-plugin_git.bb

[=E2=80=A6]

> diff --git a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plug=
in_git.bb b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_=
git.bb
> new file mode 100644
> index 0000000..831d549
> --- /dev/null
> +++ b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_git.=
bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION =3D "Panel plugin to date and time anc calendar when clicked=
"

the description could be improved if I am right.

	Panel plugin displaying date and time and a calendar when left-clicked.

[=E2=80=A6]

Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-tB2uuynVmK+L/QTSU5IH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6lrWEACgkQPX1aK2wOHVilBwCeNaLMt7oQLa9AOLnvaUOGmUx7
R7IAn06m7Qv3MAqPDO8gGe0EW5s2Kyfo
=+8AY
-----END PGP SIGNATURE-----

--=-tB2uuynVmK+L/QTSU5IH--
