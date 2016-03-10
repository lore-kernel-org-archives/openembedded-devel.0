Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6FA5C6011B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 13:33:54 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id l68so30496415wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 05:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=QeuNuRp8egKd8PWxzMS06RR+2qzR+PkisPjAwRIJvmE=;
	b=j0XgZfHebU9iyCf1ydlwJfFeFG8pPmU+VKmgF1CnOR5Xa3KgFgY1BPmNVNSFTqe4GD
	7AqcI3Ti7TN11luwgntq5SkzpPKxk+FP2kd0kxNHF/l68p6+PENJEMdSUwosfuUGky5s
	VXpG2ue/qpZrQRf5fblNfIjW9HsmcaNFHUNgxs9mDquc/at8npzam5+b08GnctQ/q6XF
	pXWmLlBebXBfPYQe2hc7N73+DWGMKd7XCI1ei6J4GcMsib5LyS4MGcGTHTJzYh30k6Sf
	Ey6O1g7fZa6vlGC/024aH7tIl37qxihAcJsMM9ZRpzntltZHb1317dbOPd4cj4Mn2t+v
	GaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=QeuNuRp8egKd8PWxzMS06RR+2qzR+PkisPjAwRIJvmE=;
	b=iRK2wYANVB0XGCG+pKC+3MXinCxjoPLTaU3lBiGfEFBa9T7Tqy3o9AiNbmsPM+ziZu
	+sBRhAX+K1zJ6yJfgm2Qz21SPGNRXbErEOT8zC3tkTUh+OnKPlNlTLSiuKEKXaVeOQ2g
	kYrr61Oa4dPtE8mCSQlyT6Dcyp22VdVrLfAv+smNzwLV/sjEnQWvkT5l52aDN246qaG8
	Ouq1LyPZOGKoxsBhZFpLHWXS/b7XciA0/ttDDG76LMr6yHgmZF4seY8DkEe1Uu0CFHFg
	Q/UgN4bzBbcz0y57ezsVPlMXAyZk8VskmfiIdqtoLkBSlLImv10ZHQgKh4KaFexFhI1i
	Vpgw==
X-Gm-Message-State: AD7BkJKgKzTKCiP5Nxb56ufLHORIbv9yJLulHpSHHjskpg2M80RPe/n6rLXx79GnfQ3xKQ==
X-Received: by 10.28.172.132 with SMTP id v126mr4065136wme.28.1457616834346;
	Thu, 10 Mar 2016 05:33:54 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id t7sm3563953wjf.39.2016.03.10.05.33.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Mar 2016 05:33:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Mar 2016 14:36:51 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160310133651.GG2573@jama>
References: <56E14145.4040706@mlbassoc.com> <20160310105506.GB2573@jama>
	<56E16633.4010800@mlbassoc.com> <20160310130257.GE2573@jama>
	<56E1712A.9070102@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <56E1712A.9070102@mlbassoc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-webserver] modphp
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
X-List-Received-Date: Thu, 10 Mar 2016 13:33:55 -0000
X-Groupsio-MsgNum: 60466
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sLx0z+5FKKtIVDwd"
Content-Disposition: inline

--sLx0z+5FKKtIVDwd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2016 at 02:05:46PM +0100, Gary Thomas wrote:
> On 2016-03-10 14:02, Martin Jansa wrote:
> > On Thu, Mar 10, 2016 at 01:18:59PM +0100, Gary Thomas wrote:
> >> On 2016-03-10 11:55, Martin Jansa wrote:
> >>> On Thu, Mar 10, 2016 at 10:41:25AM +0100, Gary Thomas wrote:
> >>>> Anyone know what happened to the recipe for modphp which was
> >>>> in meta-oe (maybe before meta-webserver) circa 2013?  I can't
> >>>> find a recipe for this anywhere.
> >>>
> >>> Why not try git log?
> >>
> >> Of course!  I don't often search logs for things I don't know where
> >> to find though.
> >>
> >> An aside - doesn't this change make meta-oe depend on meta-webserver
> >> (which doesn't seem like a positive relationship)?
> >
> > What in meta-oe depends on meta-webserver? I don't see anything.
>=20
> Select 'apache2' in the package config for php - that would then require
> recipe(s) from meta-webserver

That's OK as long as apache2 isn't in default PACKAGECONFIG.

There are couple optional dependencies even in oe-core's PACKAGECONFIGs
which require other layers.

> >>> commit f81961ff20d669e0f472f45b9922d6f62ee0d330
> >>> Author: Paul Eggleton <paul.eggleton@linux.intel.com>
> >>> Date:   Mon Jan 5 10:24:53 2015 +0000
> >>>
> >>>       README: update for modphp merging into php
> >>>
> >>>       Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> >>>
> >>> commit 06af52095b5be1cb21a7dc9a6a6e05d01f6e7a00
> >>> Author: Paul Eggleton <paul.eggleton@linux.intel.com>
> >>> Date:   Thu Jan 1 23:34:29 2015 +0000
> >>>
> >>>       modphp: remove
> >>>
> >>>       This is now built out of the standard php recipe.
> >>>
> >>>       Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>=20
> --=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sLx0z+5FKKtIVDwd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbheHMACgkQN1Ujt2V2gBzLWACfWqZauHJaes+qf2KkUOud9O3f
q7kAn3RJxYWdRIBoDr6M9AWbG/54NwIh
=KAUZ
-----END PGP SIGNATURE-----

--sLx0z+5FKKtIVDwd--
