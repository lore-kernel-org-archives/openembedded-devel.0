Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id A85B36B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jun 2016 10:40:45 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 187so8437813wmz.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jun 2016 03:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=WxeH9zLtbj0pO8IukHBHxEaR21TQ0iJMOGRBZNJ35FM=;
	b=RH/9IofPBZ931njr/MeBYlyDCgN+F1iRU3MLGzEgQF30RIXj9R2ZqryhNvYMtQ5Gmx
	BnAJhNTr0EA1Y1VGpnB99XGnszfSDyZOgibehXjBUFRpVTwHnmT+0l8NI4E0idD5muJH
	rqCV5NrxrdnfIpNuRAsljGN5tnGmapRAMWqhfcy+/MnXUcgu4IGjeW0FY7a5vKlcpyuH
	KUXrRRU4SCESs6pSKSpVAuBqa/RruO61FMuOvVx+cmcx4EpPCtvBqmY4vjmFibzCqYmg
	smRyO5yqhnuDSGDG3uRUMt1k6XEMoetTr+lMiqWa8CXXTyaqI8Ks6vzXWsL2E9Dve1y6
	RfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=WxeH9zLtbj0pO8IukHBHxEaR21TQ0iJMOGRBZNJ35FM=;
	b=CHNklazMaC9rZm8ZVXYgQec4X8hr/xNavyLbfQSJ9cXxteUom3N48Ve2T2Kkg2kMzZ
	vN3tz8fQMxPVl1D70R5oX8o6mq4AeHi4LeX5nt3aCuH5YFZmE+87UfPJuLbGsdWKxP2d
	p2/ee0N5cwYzJ/va59Ih1qbDgz/q8q5iJy2ky0zAvsyonj7dQ2t1RbM6z3gcFF05bA7O
	H/AKtoxYAdik9Vhj1hvOnP3r/PklSN3Bj3nd4pZ/MmpOO4wNWETwe9Re0AhMbNhRfQ1Q
	5KcN/X9EYM4gKAGfec26tRaFVNEP3ItChzI94WquHioDBKkUhtNXFKNykBuzdiKcBrxt
	RY6A==
X-Gm-Message-State: ALyK8tJKIMtwn/gwvZuwWOHNeysN4VaNKw6uxKpu8Vpe6+iwOye+wUcbG1g8fhNcAfSyUQ==
X-Received: by 10.28.195.131 with SMTP id t125mr3872006wmf.25.1466073645951;
	Thu, 16 Jun 2016 03:40:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w76sm14198690wmd.11.2016.06.16.03.40.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Jun 2016 03:40:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 16 Jun 2016 12:41:15 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160616104115.GB2563@jama>
References: <1465287700-18359-1-git-send-email-liezhi.yang@windriver.com>
	<575D321E.6010308@windriver.com>
MIME-Version: 1.0
In-Reply-To: <575D321E.6010308@windriver.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: [PATCH 1/2] nginx: add group www-data
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
X-List-Received-Date: Thu, 16 Jun 2016 10:40:47 -0000
X-Groupsio-MsgNum: 61855
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline

--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 12, 2016 at 05:57:50PM +0800, Robert Yang wrote:
>=20
> Sorry, please hold on the two patches, base-passwd does provide
> www-data, I should not meet this orror in theory.

For some reason nostromo, nginx, sthttpd are now failing because of
www-data user group:
http://errors.yoctoproject.org/Errors/Build/17410/

Any idea why it happends? I suspect last sthttpd change.

>=20
> // Robert
>=20
> On 06/07/2016 04:21 PM, Robert Yang wrote:
> > Fixed:
> > Running useradd commands...
> > useradd: group 'www-data' does not exist
> >
> > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > ---
> >   meta-webserver/recipes-httpd/nginx/nginx.inc | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webser=
ver/recipes-httpd/nginx/nginx.inc
> > index ebf926a..946db12 100644
> > --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> > +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> > @@ -130,6 +130,7 @@ INITSCRIPT_NAME =3D "nginx"
> >   INITSCRIPT_PARAMS =3D "defaults 92 20"
> >
> >   USERADD_PACKAGES =3D "${PN}"
> > +GROUPADD_PARAM_${PN} =3D "--system www-data"
> >   USERADD_PARAM_${PN} =3D " \
> >       --system --no-create-home \
> >       --home ${NGINX_WWWDIR} \
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldigZQACgkQN1Ujt2V2gBzsJQCfUCBMiajKZP8LjYmj7ijizx1q
qTYAn2miFOsM+NvVhtWBBO9Mtd4gGONo
=CC8f
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
