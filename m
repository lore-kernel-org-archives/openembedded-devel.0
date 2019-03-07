Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 43C527CEBC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 20:48:41 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id x7so14636165eds.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2019 12:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=4htXxoKadMmHY+l494njfNeHRYoLEs2KeYSzUBCHH4s=;
	b=F7DSyRS1MIJGu0YULAYKNzmafVwrN5LlflOkIraj1Djk5QdNGi28e/L+1+6X8/7Mrd
	/B8CCWptxn8Pfgr+jbJioMGS0C/oFqOzAbH65n26oJsKflE7ZwlL61MJc8zomzXT0i3y
	ogA0mopy8aDUVSo91OiIuaM7S+mmVcXv5bIwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4htXxoKadMmHY+l494njfNeHRYoLEs2KeYSzUBCHH4s=;
	b=r3/rsauRWaLpZHWqu4z369H+NlNxnCI1QVGjTjAVeVctT/IVZBlyvYRTxcvN4J5S9q
	iiSkqOF5ZLFiQxgYZhDmOjbm5qwxxXbPxdSSNgKXMAWeqoLwJEHnxp1pXWquI3xbbTb5
	aEPFdfiWpyGhlSzIaFrmJXPIij7pceWTYSug2vJm8Cg4KaSZOq4QM0wZOFAy5H31jla1
	k6m0lfcQRQXSt1JShwKLgQBr4qc1MTzLgBhUcp7C/ksmhfUMzaMcW206l60XwDx6A9f9
	dnPfgoERk6jer13p/nN0feSrP0pvJSZCgQdrR7ZIDm7uKa9mMm7oUj1mF6fSJe1L4j4E
	Cpmg==
X-Gm-Message-State: APjAAAXW35YaN9yYthtesJxPyGPZNi1LQWPYybR93ADJl3YhplB7D7iX
	MeTBdpUUZxHPaEfvacVTqldwPw==
X-Google-Smtp-Source: APXvYqwO6Akg2G20kZJQvIhaVQxZd9yXEfQchi36PXyJp2R/CLUP50ffPZmoXxEUDVpVupPcVcs+0A==
X-Received: by 2002:a50:9737:: with SMTP id c52mr30549315edb.190.1551991721787;
	Thu, 07 Mar 2019 12:48:41 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-606A-AF5B-88B1-B23A.dyn6.twc.com.
	[2606:a000:1401:880d:606a:af5b:88b1:b23a])
	by smtp.gmail.com with ESMTPSA id
	x16sm1592726edx.89.2019.03.07.12.48.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Mar 2019 12:48:38 -0800 (PST)
Date: Thu, 7 Mar 2019 15:48:34 -0500
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190307204834.GX5026@bill-the-cat>
References: <20190306054548.16430-1-raj.khem@gmail.com>
	<20190306054548.16430-6-raj.khem@gmail.com>
	<20190307172333.GA1278@localhost>
	<CAMKF1sp-k21Pmw_soord9-Sbwj1B4QO=yhvJELtbSsT-PBhSZQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp-k21Pmw_soord9-Sbwj1B4QO=yhvJELtbSsT-PBhSZQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-networking][PATCH 06/12] inetutils: Fix build on RISC-V
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
X-List-Received-Date: Thu, 07 Mar 2019 20:48:41 -0000
X-Groupsio-MsgNum: 76675
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dpEE41+QZ7HQEdc/"
Content-Disposition: inline

--dpEE41+QZ7HQEdc/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2019 at 09:25:33AM -0800, Khem Raj wrote:
> On Thu, Mar 7, 2019 at 9:23 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Tue, Mar 05, 2019 at 09:45:42PM -0800, Khem Raj wrote:
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  .../recipes-connectivity/inetutils/inetutils_1.9.4.bb           | 2 =
++
> > >...
> >
> > This recipe moved to OE-core.
> >
>=20
> thansk of reminder, yeah it was in transition. I hoping Tom will send a
> patch to delete these recipes from meta-oe repo.

Yes, I sent one last week :)  Do you need me to rebase them?

--=20
Tom

--dpEE41+QZ7HQEdc/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcgYOiAAoJEIf59jXTHXZS7fUQAJBkY1mPyO10gho7NdGJ5Jor
kgZLpXp1l9vpEwug/gXsYbU7FjYQ8HTEMQXydx508z39wYFR9J6hQejAb51FA1/m
Lqc4+yZhcl9mGQDMiaVQMMOaO0cvidX1A1u/qaDb6BGq1ci73hoUfx5f9X41CzT0
Fetrmt486j+q5FZYb4w8ZIw4PmWkVxNlI5dtEzgb/O6vRD5prjP9TJaEzI2d3fMI
4wMdP6fVQ68phpElgdSpXEKyz3OJ1jRDpNCfqZ6lYkLWlh4shLCYn9ghfKijxNBe
+vG4IdIsgofPMymH72Kpp6dSwkC3tAIYTkd3ESz5EI26nYIOjUkOwdnHCsjwfkHk
y+Ojpv5cXidjn5fDp338+mAR19c7t8lpTbpYgvVh9C8ScN3UM/B0NW4IldVPeb4X
w6v2Ya3PIm7DGLzfVVQZFITzy4xCQjAubjBgBealDaY/DH5bFO1cWu33LYHSIfXd
/qJiHFT61men6EcYzQf9QrtNktw6nHyDD0zEzNUXzF+ycwBSd87Xcn5VOBnmlm5Z
4x6rEhnJSBLx9qFl7pZtL/vWeIaMUM0t9WdGaI6z1WgI+le2zfoKEvLt7o/xfzbu
qvEe6yjk2lT6nYIzeXhWjUBvEZa11R76/5uQLcgKZLOz0Vismk8K2gSJ/BQQPP+v
JxIWG2L/F5pQxc3uhSiP
=qfHk
-----END PGP SIGNATURE-----

--dpEE41+QZ7HQEdc/--
