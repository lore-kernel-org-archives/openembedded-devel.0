Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id B30F87D674
	for <Openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2019 11:26:45 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id b11so2537876wmj.4
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 03 Dec 2019 03:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=kQcu9KLJND1o7/bJKw/uZ9L1kwV83YnuETyyHVhrkzc=;
	b=dHz5g7dLpXyjbpFntb47eVbaEKGmRnS2fG+Mo1L9aNCG/2CXwEjJcJ5XmI87wt+vgG
	536Jj7/x3vZotJxvh0QuuxE2ML2Wdm2Yc0a51x247zEHN5ZFg6RvMOQODyZpazIY+/rC
	MvN8QuePPgFRoXf9+2wfItkajePyP4bmEby/x+UYLq4JF20VGC36VehU3694G+ADXwFM
	kla3hPLk0u3iQtzCdYejfRfTv9qEY0MBFGKPbN+c5bIqTSuG9OHO4ib9LtBS6leP7o8j
	ABPEue2ZaUAUWzJ4i7+fB0XWwsUVo4Zy02bF0me2dz6YOtBcedbDkWGLAVi5MuZ1aYFi
	Eerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=kQcu9KLJND1o7/bJKw/uZ9L1kwV83YnuETyyHVhrkzc=;
	b=FE8eAzEFugqEaI9KebcG19j3bwKqsFkCWFq5xwthHFND36WAf82+Mupc0U91ks/tkk
	on101fMwwt1KMxoqr7MxJsc/0JHGxl9PWimXIiQn6N/n/qySdfWfKEu0d3XXAgtCu+jL
	vEOfm763TTS2FbC4a/iPCMZxujmsPUVhQKBhYe7KYKdicDqgCkvx9qzvcGBkMukZG4OQ
	wcMI2fOnc3tJ5qHLyuYFCF97MyzO4xssXk7sNTrPA5IJHnmKT77Og57gpU1lTS3FTFmq
	DUF/AqLUtB33/lAi3VKY5zzGyUUvnOhFLhmarL2949R33u1/PK0ADa0iKU3mbZop8Pc6
	j3aw==
X-Gm-Message-State: APjAAAV+DcryDoCItGKvfkpVNDaZg/zaasM2FYhtP2KcGTItVHred0t6
	qkTDY8HwK4kE1sOt5mQ/bs2u4ijI
X-Google-Smtp-Source: APXvYqwtUF8KmHEeT6IhbkgyIQln4557UXr44+g4WKzP9AXkFGnb7j/1pdCWgWNcBBpoZ8BPcNnwWA==
X-Received: by 2002:a1c:f70a:: with SMTP id v10mr31543106wmh.159.1575372406306;
	Tue, 03 Dec 2019 03:26:46 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	u16sm3070122wrr.65.2019.12.03.03.26.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Dec 2019 03:26:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 3 Dec 2019 12:26:44 +0100
To: Tim Orling <ticotimo@gmail.com>
Message-ID: <20191203112439.ioxlwkibvplewbnz@jama>
References: <CANx9H-Am-T-LMMr+oWpR0KM70k0TYHF2v=GdqTem4Rj1ud6srA@mail.gmail.com>
	<CA+chaQeKxzeXzhzS5g3YcBcR7Tz6YYEj0bmBT=HF_2xQXu3UFg@mail.gmail.com>
	<CANx9H-C_xmQFSnt20S-SudsUovZHrnjxR+BEhKEXK_QwcK2xrQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANx9H-C_xmQFSnt20S-SudsUovZHrnjxR+BEhKEXK_QwcK2xrQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: "openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
Subject: Re: ANNOUNCEMENT: meta-python2 has been created
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
X-List-Received-Date: Tue, 03 Dec 2019 11:26:45 -0000
X-Groupsio-MsgNum: 81326
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ztvtxa6h623knkid"
Content-Disposition: inline

--ztvtxa6h623knkid
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 02, 2019 at 08:10:17PM -0800, Tim Orling wrote:
> On Mon, Dec 2, 2019 at 8:07 AM Martin Jansa <martin.jansa@gmail.com> wrot=
e:
>=20
> > Thanks
> >
> > It would be nice to delete all branches except master. Only master bran=
ch
> > makes sense now for meta-python2, right?
> >
> > " The stable branches were also kept, to make it easier to refer back to
> prior history
> and allow developers to use meta-python2 only in their workflow."
>=20
> I can see use cases where a developer may want to replace meta-python with
> meta-python2 and still be on a "stable" release. It also makes reviewing
> what existed in which release much easier with cgit or git log --oneline,
> which I do VERY frequently. If this is contentious then the OE-TSC will
> make the decision.

But python2 is still in oe-core zeus and older so it should continue to
be maintained there, right?

Why should people add meta-python2 to zeus (or older) builds? If there
are more security updates to python2 or any other recipes, then they
should still land in oe-core or meta-oe/meta-python as well and
maintaining the duplicates in meta-python2 seems unnecessary overhead.

My understanding was that meta-python2 is just to help transition from
oe-core/master when the python2 is dropped there.

Regards,

--ztvtxa6h623knkid
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXeZGcwAKCRA3VSO3ZXaA
HMhTAKCbgEGh+Nw0iJZj3itWBhTbggW1HACffwmon02x0vdjmjcCPa4O38DkrrI=
=4Rs4
-----END PGP SIGNATURE-----

--ztvtxa6h623knkid--
