Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 9D34F706B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Feb 2015 19:29:45 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1YPyhO-0005an-Qn from Joe_MacDonald@mentor.com ;
	Mon, 23 Feb 2015 11:29:46 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 23 Feb 2015 11:29:46 -0800
Received: by burninator (Postfix, from userid 1000)	id 4AE56582837; Mon, 23
	Feb 2015 14:29:50 -0500 (EST)
Date: Mon, 23 Feb 2015 14:29:50 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Bian Naimeng <biannm@cn.fujitsu.com>
Message-ID: <20150223192949.GB8949@mentor.com>
References: <1424073156-18834-1-git-send-email-biannm@cn.fujitsu.com>
	<1424073156-18834-3-git-send-email-biannm@cn.fujitsu.com>
	<20150223191307.GA8949@mentor.com>
MIME-Version: 1.0
In-Reply-To: <20150223191307.GA8949@mentor.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v2 2/2] postfix: fix bug of main.cf_2.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Feb 2015 19:29:46 -0000
X-Groupsio-MsgNum: 54464
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WYTEVAkct0FjGQmd"
Content-Disposition: inline

--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH v2 2/2] postfix: fix bug of main.cf_2.0] =
On 15.02.23 (Mon 14:13) Joe MacDonald wrote:

> Hi Bian,
>=20
> I merged the other postfix change, but this one I'm less sure about.  Is
> this actually incorrect?  The standard place to install postfix is in
> /usr/libexec and that seems to be where we install it as well.

Okay, I've just confirmed that this is the current location after all,
I'll merge this as well.  Thanks.

-J.

>=20
> -J.
>=20
> [[oe] [meta-networking][PATCH v2 2/2] postfix: fix bug of main.cf_2.0] On=
 15.02.16 (Mon 15:52) Bian Naimeng wrote:
>=20
> >  ${exec_prefix}/libexec/${PN} =3D> ${libexecdir}
> >=20
> > Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> > ---
> >  meta-networking/recipes-daemons/postfix/files/main.cf_2.0 | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta-networking/recipes-daemons/postfix/files/main.cf_2.0 =
b/meta-networking/recipes-daemons/postfix/files/main.cf_2.0
> > index bb31451..9e1077f 100644
> > --- a/meta-networking/recipes-daemons/postfix/files/main.cf_2.0
> > +++ b/meta-networking/recipes-daemons/postfix/files/main.cf_2.0
> > @@ -30,7 +30,7 @@ queue_directory =3D /var/spool/postfix
> >  mail_spool_directory =3D /var/spool/mail
> >  readme_directory =3D no
> >  command_directory =3D /usr/sbin
> > -daemon_directory =3D /usr/libexec/postfix
> > +daemon_directory =3D /usr/lib/postfix
> >  mail_owner =3D postfix
> >  setgid_group =3D postdrop
> >  unknown_local_recipient_reject_code =3D 450
> > --=20
> > 1.9.1
> >=20
> --=20
> -Joe MacDonald.
> :wq



--=20
-Joe MacDonald.
:wq

--WYTEVAkct0FjGQmd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJU63+tAAoJEEn8ffcsOfaWpjMH/0Qa4opZs2SqbkbUpZOb96QN
JQFshRwsAm5Xu1rAtfjDAF9g0n9gB91ZfZY7lHAuaX+aLuibsLbb0u7GwyNFKj+B
xRxRvWtlcRKvJK7cAtr+xk0WobT88YDZGTXB3G1gWEeBOrMrkc1U/a77RrQayQ4k
QczQFO19OC20dF4srBTeUxHQU7qyTJrNzP5+ZGmwslaLWCDkt+TbtMjibRnJZGnK
W48MSnALO7Yaf4GQTI00oMeeORO+cYQA0j7GwacC+LqIQCWnmWRavE+oPINLT8Ba
vove3mrOW2M+jdw54rgwbv02FTfEez4Ozf1KfaEpbQwEyYD98RiadHKFD7fEFLk=
=iSnz
-----END PGP SIGNATURE-----

--WYTEVAkct0FjGQmd--
