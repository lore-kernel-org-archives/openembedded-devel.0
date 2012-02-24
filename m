Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0uO0-0000c5-1g
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 13:36:32 +0100
Received: by eekd41 with SMTP id d41so1086878eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 04:28:09 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.32.133 as permitted sender) client-ip=10.213.32.133; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.32.133 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.32.133])
	by 10.213.32.133 with SMTP id c5mr679874ebd.119.1330086489794 (num_hops
	= 1); Fri, 24 Feb 2012 04:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Uktu+PSkzoZmpb+zUAbY7lxwlhyyBsMaKiO3P3mgqv8=;
	b=Ij3Se1eEQ59JCi7fv+ofuQtOw/1yTkuKGoksR2/s/33G3YtnTP2jhrxwVJn3rnoany
	x24deAbUKlVKqrtb96v4XTKo+/JwIl2NnNOx6HzG0AtVrhS/fWQYW/r/mCEAx0mVKgZ6
	2jms6SACF+SkVh/wfWFKI4nSIE4+9i6Qtztxs=
Received: by 10.213.32.133 with SMTP id c5mr513882ebd.119.1330086489652;
	Fri, 24 Feb 2012 04:28:09 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm17640189eeb.7.2012.02.24.04.28.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 04:28:08 -0800 (PST)
Date: Fri, 24 Feb 2012 13:28:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120224122806.GI3769@jama.jama.net>
References: <1330084384-1267-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1330084384-1267-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-mozilla 1/2] firefox: change URI to fetchable ftp / bump to 10.0.2
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
X-List-Received-Date: Fri, 24 Feb 2012 12:36:32 -0000
X-Groupsio-MsgNum: 37437
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yBd94+RIx/Fx7UDH"
Content-Disposition: inline

--yBd94+RIx/Fx7UDH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2012 at 12:53:03PM +0100, Andreas M=FCller wrote:
> build tested from scratch
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  ...l10n-af_10.0.1.bb =3D> firefox-l10n-af_10.0.2.bb} |    4 ++--
>  ...l10n-ak_10.0.1.bb =3D> firefox-l10n-ak_10.0.2.bb} |    4 ++--
>  ...l10n-ar_10.0.1.bb =3D> firefox-l10n-ar_10.0.2.bb} |    4 ++--
>  ...l10n-as_10.0.1.bb =3D> firefox-l10n-as_10.0.2.bb} |    4 ++--
>  .../firefox-l10n/firefox-l10n-ast_10.0.1.bb        |    9 ---------
>  .../firefox-l10n/firefox-l10n-ast_10.0.2.bb        |    9 +++++++++

Interesting that it detected rename in first 4 locales and then the rest
is add/del, but otherwise look ok.=20

Please reset those PR in those locale files to ${INC_PR}.0.

Cheers,

--yBd94+RIx/Fx7UDH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9HglYACgkQN1Ujt2V2gBz70gCgnQcVv3xcylzfW0jWUHXsJhPz
rwoAnjl+o5ZTKZjEunUV7RgH9jTblNvH
=BPAW
-----END PGP SIGNATURE-----

--yBd94+RIx/Fx7UDH--
