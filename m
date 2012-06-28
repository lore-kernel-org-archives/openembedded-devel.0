Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SkImA-0002ZF-3S
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jun 2012 19:45:06 +0200
Received: by werg55 with SMTP id g55so1612649wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2012 10:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PqAa7aZ4neTlho23QWYOyegWP4VahYhhIg6E+QhXG5Y=;
	b=KB+FT2FSDUHW0+8NfwCp253aiimCcbgNTpYrRDBCjzE83wfxul8787JtQEYoPWx/fB
	5SZG9KWMNhvSY94ulYVy5qvxyKC1dzuNCjC4q1iS7LZm/fof0SuJ7/fR4JddmhNETw7C
	93G57bbDnCsCEgLl1FyzQju7xcJuA9xT8o9POzw8LEB//v4DtyfF6qGT1x0jaooM8Pwx
	PVFRr3RkilCOz9Fx57QyU+PTqzWWd7hm9qyCyZsa4ZGCzMGIw+Cid1pyyFAAhk8EYBts
	+Fc0g6/T+yqQG03RJx0nmRX9841tNTEggokkc2XEtjtHMAGv5t9XE+vQVOKuj/uWqybE
	07cw==
Received: by 10.216.199.167 with SMTP id x39mr1585979wen.148.1340904848510;
	Thu, 28 Jun 2012 10:34:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n6sm2318442wie.7.2012.06.28.10.34.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 10:34:07 -0700 (PDT)
Date: Thu, 28 Jun 2012 19:34:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120628173400.GA24537@localhost.jama.net>
References: <1340336931-7978-1-git-send-email-elvis.dowson@gmail.com>
	<AF874800-B131-47EF-81EF-07B7C98BCA0F@gmail.com>
MIME-Version: 1.0
In-Reply-To: <AF874800-B131-47EF-81EF-07B7C98BCA0F@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-openembedded] lighttpd: Set SYSTEMD_PACKAGES as lighttpd-systemd.
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
X-List-Received-Date: Thu, 28 Jun 2012 17:45:06 -0000
X-Groupsio-MsgNum: 39433
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline

--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2012 at 09:09:37PM +0400, Elvis Dowson wrote:
> Hi,
>       I sent this patch a while back, and this still hasn't been applied.=
 I just did a git pull and noticed this. Its a trivial patch, so would it b=
e possible for someone to please apply it.

It's trivial but if some image or task had lighttpd in RDEPENDS then it
got also systemd support with it.. so those images/tasks need to be
fixed too.

I don't have such task/image, just explaining that it's not so trivial
as this..

Cheers,

>=20
> Elvis
>=20
> On Jun 22, 2012, at 7:48 AM, Elvis Dowson wrote:
>=20
> > This commit fixes WARNING:
> > /tool/yocto/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb:
> > it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
> >=20
> > Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> > ---
> > .../lighttpd/lighttpd_1.4.30.bbappend              |    2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend=
 b/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
> > index 1341405..b02f35c 100644
> > --- a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
> > +++ b/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
> > @@ -6,5 +6,5 @@ inherit systemd
> >=20
> > SRC_URI +=3D "file://lighttpd.service"
> >=20
> > -SYSTEMD_PACKAGES =3D "${PN}"
> > +SYSTEMD_PACKAGES =3D "${PN}-systemd"
> > SYSTEMD_SERVICE_${PN} =3D "lighttpd.service"
> > --=20
> > 1.7.9.5
> >=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/slYgACgkQN1Ujt2V2gBwmKgCgq2ZpS09kkXasim33BYjyczkF
A8wAn1boYmR3DvOyQC3OHYza6W+9rGXV
=Kpp8
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
