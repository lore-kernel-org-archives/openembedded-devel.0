Return-Path: <trini@konsulko.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0447D78954
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 15:59:53 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id z184so18848138qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 08:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Jg8RNekKgjUPHunRSPI0NM20nosEahfQa50P2aMWJcc=;
	b=FJ3+EFCVQX8EgrV41q3Z2QcYLWNZhKGV+m/HEQsr9HZ62isMRTtVwAL3F4nEzbHN+e
	4ckkuy05bK5WBBoiJbJyfDcQwyDa61LgsSxrNo4pwsnKDcxTB9uWcJf7WpMRysYYF57Q
	f5WC9pMnYItp1vUvv+1ktBVyEBFhCQMkUT+ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Jg8RNekKgjUPHunRSPI0NM20nosEahfQa50P2aMWJcc=;
	b=j1+saPA1tNYYgkxiqMMGVvLXlsXZTDEEZmdU5iNnnkJnKCXkSxuR3IyJgI2ZV3ZiLp
	vaFNT4pKwLTv8hP9M0xjqtQ8hJ1/qtdeAixG4LLo2WlCM30P+S3r3fOIkxNJzoNM6dix
	9cyBg594b3QrASaS0uiZl3MEleWXtt2zy4X0arGXpbEwKBjchD4Oon6AX0H2dbBAGvXP
	D3EFlQovAFZ6DhNeTX5deTk0ies0xUP45aQMqXdwHOV1QasC9zq4YAK2rXMYYCHvyQ0h
	pgb79Ege2l2PA7F6GPEb6G+XZLYlic1uE986Kb45LYqgfoXZxuskgZW+DmQ+NM+DYK/1
	EWkw==
X-Gm-Message-State: AElRT7F8B8uAZT6Mca+8lNvioRefp5bKp+RXhQFCo5OmAqp/q/Z/+hPM
	W+u1EphREv1lZt9yQv4jDvdtZg==
X-Google-Smtp-Source: AG47ELv6gADRpxxmsUBx/I6mmaVpLPNyY24fm770lw1yXHhu3BaTgcWfH/2J5QPza5MEsCC9dKvdrw==
X-Received: by 10.233.221.69 with SMTP id r66mr17747801qkf.106.1521475194790; 
	Mon, 19 Mar 2018 08:59:54 -0700 (PDT)
Received: from bill-the-cat.ec.rr.com (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68])
	by smtp.gmail.com with ESMTPSA id x31sm238128qtc.55.2018.03.19.08.59.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Mar 2018 08:59:54 -0700 (PDT)
Date: Mon, 19 Mar 2018 11:59:51 -0400
From: Tom Rini <trini@konsulko.com>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20180319155951.GW4418@bill-the-cat.ec.rr.com>
References: <48f2945a-e330-4bc8-a4da-ab970b63ea5f@gmail.com>
MIME-Version: 1.0
In-Reply-To: <48f2945a-e330-4bc8-a4da-ab970b63ea5f@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-openembedded Layers
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
X-List-Received-Date: Mon, 19 Mar 2018 15:59:54 -0000
X-Groupsio-MsgNum: 71341
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KG+zyBxh8BrwB1om"
Content-Disposition: inline

--KG+zyBxh8BrwB1om
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 18, 2018 at 02:32:15PM -0700, akuster808 wrote:
> Hello all,
>=20
> I have been reviewing the meta-openembedded sub-layers and I plan on
> taking the following actions:
>=20
> Please keep your comments focused on the 3 items below.
>=20
>=20
> 1) I plan on resetting the sub-layer maintainers. Several maintainers
> listed have been inactive.=A0
>=20
> If a currently listed maintainer is interested in continuing, please
> send me an email.=A0 I plan on removing in-active maintainers in 12 days (
> March 30th).
>=20
>=20
> 2) I plan removing meta-filesystem and moving recipes to other layers.
>=20
>=20
> 3)=A0 Meta-gnome, I have heard feed back regarding this layer. Does it
> make sense to remove it and push needed recipes out to=A0 other layers? =
=A0=A0
>=20
>=20
> I want to get any restructuring done prior to sumo release to lessen
> impact on the Sumo maintainer.

I would suggest that for sumo, any layers that do get moved /
re-distributed / whatever, a "dummy" version be kept in place that says
where it moved to (or where recipes were migrated to, or whatever is
appropriate) and then they can be dropped in master.

--=20
Tom

--KG+zyBxh8BrwB1om
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJar953AAoJEIf59jXTHXZSpWQP/j5zyv+ov5U3sdlkd+iUaycM
yimpmjdDKgAcnA5x329lc6mCftSWyh8i7M5wsPgQ5ypRtJT2WOZZQL2RtKT1ZvPN
d2jYSeK2eyY83c6oKG83YUvv12AddkCbze3qkFhqjGRo44XD7cgxywYm58ZYXzbZ
u2a/rrJJHkWI1uEzWY/UWu0rZPbUdBMOKwkvOsq3ZBu1eMJugfIFHuSr8p8zRaNj
2gdnbk0n8JAOv6gxSkMISr/SXut40ejZo40jQUaH3QT7LYa3/PnykHKx8JjTPfpV
88Pld20wIihUUYucW9jYaV1yyHEONW1aOO7F0OTb930rJcUDGqfwPkR9QtvKYPF3
1PqIOyRiJ+2ENNOf4Rss9+1RmLu2OhG5N9VQsMG9fP18ZWHmWQDXKrai51fb637B
6Ukt4Kc0pyUXfy1ot5aK52oS4pto2aKFMJja9LK/NZIoCmbHIzUPZTt2/A5ReJOY
PEX1KBlGlnqfnBKNsk9LnCjqFBxwdIDI9PcOKeDlUqhBkxtt5OP2I4lr+V3cQPtv
/E+cZxQMgKvzcpDW1GiKirAaJsadYrdLUHAfFgqExDSMADYi1kHMBb/w6hVOfIdi
hFl1G0c9RBxOo8bzoLYi1qF3QmB4niFv63eGIlpt9CMA//p8prhECKeWXWgD1K+q
rk27wKNtqKUDyq/zC9xH
=WS1s
-----END PGP SIGNATURE-----

--KG+zyBxh8BrwB1om--
