Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id A3D166B073
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 22:57:36 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id d18so7960066wrs.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 15:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=gvM6n5i3fXf3Vmq9eIwREx8UvdmiyWEZghtO2qdTGg0=;
	b=uIVj6c99Sla3hWhRkgexNkKTPYZuegduYDB7/16N+vJctCEsfl/NPDTkYSirOK+QUx
	GlHPhk/YF/02UkLWM9W7KJZmUVOfj/pbIPLOxJ5OC0u1T5/OxzjHS8xbJFO96Iu7s2yH
	/f3POzG+EGIEwialK6ZPxCGZKRAVrCkSBXx0TVTwuCGrCVU7cpWQr6M4X8ltZriHX1PV
	PDXUt9sQci+jIB8O678gTPHdtJgeHxhnxXUmFpseotYPzdEKqDamrH1s42CthPfr15CD
	pJzlF+3iuI/UZ14pOKU1OKP0c4qaZNKfWSRDTWQ+cyfmXykruMaKiBm8c7uT6BgXYKtk
	aSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=gvM6n5i3fXf3Vmq9eIwREx8UvdmiyWEZghtO2qdTGg0=;
	b=B3BHBYJJQu/Fe3qhenOrwqYHc+8301BLewG5o0/EG3XCz52usVT5ZjUbs/CCa1bndF
	nmyxSx0J8dJvLi58QQSp08ibec+i3cbiUKBgl18Bn33hG3voOYwAnfoMzUZRIDbZhm0H
	ZUt8zqVDT86qdkn1JjBnU0knJz8V9uI09hwK698jd3BmjOePktrQXFxiFOIzlYgqrHkF
	8LMM34wldloI6lk1QqiE3rhohsVYdetr8Z6oaltCDPq5vyJwPRdLL6ttogWfvvo1w6ZU
	v4bBs2Cz4ZJr8u9vvhuCRsDKlkAJVkmtnicPM2jRhvd8IdHAp+FAiLww8VBJcOzlBRIy
	04uw==
X-Gm-Message-State: APjAAAUiBELEebCGjQTzlIoUgJxLgGTOajp9eSu23AUXGaukiZ2lP3SK
	tHdI/t9IY08jy5TzM6V0L4g=
X-Google-Smtp-Source: APXvYqzdlk7jlyVGSeJ7GJ32R3l+LGdT/rtQPY748KcNlcj6Oxj3Fh63E0IYjZoBFjnQnxw8mG/wtA==
X-Received: by 2002:adf:c807:: with SMTP id d7mr33591443wrh.112.1558652257282; 
	Thu, 23 May 2019 15:57:37 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	w13sm10432505wmk.0.2019.05.23.15.57.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 May 2019 15:57:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 24 May 2019 00:57:47 +0200
To: Stanislav =?utf-8?Q?Angelovi=C4=8D?= <angelovic.s@gmail.com>
Message-ID: <20190523225747.GC1421@jama>
References: <CAA9bybO-v4iJ8YcSDQVtmoopRY5YOjvhERUcQWjYh=1Omd--mQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAA9bybO-v4iJ8YcSDQVtmoopRY5YOjvhERUcQWjYh=1Omd--mQ@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Adding recipes to former meta-openembedded releases
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
X-List-Received-Date: Thu, 23 May 2019 22:57:36 -0000
X-Groupsio-MsgNum: 77758
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IpbVkmxF4tDyP/Kb"
Content-Disposition: inline

--IpbVkmxF4tDyP/Kb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2019 at 12:09:57AM +0200, Stanislav Angelovi=C4=8D wrote:
> Hi,
>=20
> I'm about to send a PR introducing a new recipe for sdbus-c++ library to
> meta-openembedded master. I'd also like to support previous releases -
> sumo, thud, warrior, where the recipe differs a little bit from current
> master version. Is it possible to send PR back-porting to branches
> representing those releases, or is the recommended practice to clone
> open-embedded and provide the recipes there on my own?

New recipes usually aren't added to released stable branches.

Providing the recipes on your own is reasonable approach, to keep it a
bit more organized you can use something like we do in webOS to have
separate layers for recipes/bbclasses backported from newer releases,
big advantage is that once you're ready to upgrade to newer release you
can just drop this whole layer from your builds and nothing should went
missing (instead of searching our layers for recipes which were
backported from somewhere).

See example in:
https://github.com/webosose/meta-webosose/tree/bf7f8d8a01a16b54f141c0a34410=
05a5b3ce4507/meta-webos-backports

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IpbVkmxF4tDyP/Kb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXOclagAKCRA3VSO3ZXaA
HBDRAJ9Xa6ZBoI84fsUj+HmlRhpkzYMMAACgsRKWVZMMiPpb+qgq+wAR6sRMdPI=
=LRM0
-----END PGP SIGNATURE-----

--IpbVkmxF4tDyP/Kb--
