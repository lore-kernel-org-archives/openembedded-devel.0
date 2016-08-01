Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id EC1F565CBB
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Aug 2016 09:40:12 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i5so25358524wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Aug 2016 02:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=DDrRLk9gILTUNglGRRG8ksE9DQqe3PwfiQ0g/dC0Rb8=;
	b=1JAEMK32LkGkkOdNMSeCbCciLeeGoSz8ZKDvzv/vFufsP5/WFxEJ9ViFo140NxIgzz
	jdT2kQ4YF0Brga2bswQMWTT8u1n/aWOrCC/I8kWdpD2Bp5Pk4hi8bJ3xRIUKwQa26iCu
	xBmcH9DOSxMRVktEOOafJy3xNiWYEb3HeknmKrOFNYt8dgDZcHR7rnEyaLvhWXHlduaT
	KQZj3Mx+pQKEddzUYFVlaaZR/kgqtTycr9HuSSZZT+ZaxX4AU15sYbL7hhBYKSwhmB+p
	t0B10x5wryArUOVi6tbaO3MvAn1EAmBaYon6kbWlY+cN5EfAmFWhzMWrjkClZyIbbtCc
	7Nfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=DDrRLk9gILTUNglGRRG8ksE9DQqe3PwfiQ0g/dC0Rb8=;
	b=iOqzEwaJYM2FQTr0A3O5GuxY4T0eGdh7cDeTzC2lwufC5pLqzJANHUHjQ7CwETcEGz
	xuRTi5vJNIP56G1/aeYkZbprvrfYrO91e/aY3/CHo2yWWouUcvNOLO1NQkLYNQiSasBy
	u6YePoVW7u9kGdZFzBN93sIz8Ble5pLg3o25TC8ELYU29p6G2JORPWlPHBjOIErB8AEA
	bCOhOxzhuAmJIZtms823y1FgMBfczreWUvFwD49CaO5v2UGIWqfzJwQY3o3c0f66WhR3
	NcS/okVdwj3Cus2mOYx189DlZLaNQ0v/pTP367Efn8IkD6udEZa39727CWeHTyCn8O7f
	qhqQ==
X-Gm-Message-State: AEkoous9hOFl+QosrIUCKDpKlLJmpgL5eL62dNE3b24jgiQuuhmEuK6wD9SRhqjqw6F9UQ==
X-Received: by 10.194.100.129 with SMTP id ey1mr48836256wjb.60.1470044412341; 
	Mon, 01 Aug 2016 02:40:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	d80sm16161064wmd.14.2016.08.01.02.40.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 Aug 2016 02:40:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 1 Aug 2016 11:40:13 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160801094013.zlymmxvpdwcarali@jama>
References: <1470026517-26247-1-git-send-email-jpuhlman@mvista.com>
	<8b91a02c-4d51-2d47-970b-48b6be4cc3e3@mvista.com>
MIME-Version: 1.0
In-Reply-To: <8b91a02c-4d51-2d47-970b-48b6be4cc3e3@mvista.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [PATCH] Fix random python backtrace in mutlilib handling code.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Aug 2016 09:40:13 -0000
X-Groupsio-MsgNum: 62401
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7uik2x4milyar4fb"
Content-Disposition: inline

--7uik2x4milyar4fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 31, 2016 at 09:43:54PM -0700, Jeremy Puhlman wrote:
> Not sure if this is the right way to address it(perhaps just continuing=
=20
> in the else), but
> this resolves random backtraces I was having building multilib images on=
=20
> master.

It's in wrong ML, you need to send it to openembedded-core ML.

> On 7/31/2016 9:41 PM, Jeremy Puhlman wrote:
> > newval is not defined in all cases. Set to None and check if it is set.
> >
> >    File
> > "/local/foo/builds/x86/layers/openembedded-core/meta/classes/multilib_g=
lobal.bbclass",
> > line 90, in preferred_ml_updates(d=3D<bb.data_smart.DataSmart object at
> > 0xf6fd528c>):
> >                   if not d.getVar(newname, False):
> >      >                d.setVar(newname, localdata.expand(newval))
> >               # Avoid future variable key expansion
> > UnboundLocalError: local variable 'newval' referenced before assignment
> > ---
> >   meta/classes/multilib_global.bbclass | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multil=
ib_global.bbclass
> > index 67dc72b..11ae268 100644
> > --- a/meta/classes/multilib_global.bbclass
> > +++ b/meta/classes/multilib_global.bbclass
> > @@ -72,6 +72,7 @@ def preferred_ml_updates(d):
> >               pkg =3D pkg.replace("virtual/", "")
> >               virt =3D "virtual/"
> >           for p in prefixes:
> > +            newval =3D None
> >               if pkg !=3D "kernel":
> >                   newval =3D p + "-" + val
> >  =20
> > @@ -86,7 +87,7 @@ def preferred_ml_updates(d):
> >  =20
> >               # implement alternative multilib name
> >               newname =3D localdata.expand("PREFERRED_PROVIDER_" + virt=
 + p + "-" + pkg)
> > -            if not d.getVar(newname, False):
> > +            if not d.getVar(newname, False) and newval !=3D None:
> >                   d.setVar(newname, localdata.expand(newval))
> >           # Avoid future variable key expansion
> >           provexp =3D d.expand(prov)
>=20
> --=20
> Jeremy A. Puhlman
> jpuhlman@mvista.com
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7uik2x4milyar4fb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlefGPwACgkQN1Ujt2V2gBxWDACdHx9+u0uINAy1ubuBQNT1hLD1
pUgAn3rM3E7zaP8rqMhRFib8eriFBLq8
=FaMe
-----END PGP SIGNATURE-----

--7uik2x4milyar4fb--
