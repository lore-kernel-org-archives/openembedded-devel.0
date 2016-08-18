Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 31000731C9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 17:45:54 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id p64so414261pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 10:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=pcqXFLTt12l0PVlONS2yA3gVhLGEi/4FMNKmMpbweqo=;
	b=S5twUAJp2xig7smksh9D7tFlyl6RH72Tc3JN9Qd0xVYj5mWJ2OIqLAR+IPIfKaYrG7
	/SI80jt17B8APey2O+fA+xdYgVlyAFi/hZFZKgkfpUgnCtC7kdpCkq88VuPXGjgW+0hT
	JOADGMxELxahs3fVFq0w4ZGGzUp5oQhYGrSafwVyZr61S2xdtd3bJTklNXTypCYBLrk7
	eQfLin8CdCUEtAf0koN+UYUPg0jUpKkmolXliYMILAIzlscQFlqX4lmfhAxU3naqZauo
	UcrAQLh2aV84J3nPD++jE9utILKo8/NVfdDYQQrQZcr4Q3iFwXHkw8T8k9UMnRzMUDza
	3SEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=pcqXFLTt12l0PVlONS2yA3gVhLGEi/4FMNKmMpbweqo=;
	b=ghUt6gWh1qB1gz5c8MwHxxV+R8OF02knZYDIGrvYMkab3NX0bVjKsk+Hx8cHNe96qQ
	eNxuguHr7JK7o++BeJxQV1vYh9uOJpsQh+Qs2FjKHdRBZ2mE+PQyNaEp5GA4tefG+aoF
	UJNNGsJlIeVFcH7fKjQMyz4jLBU88dONaEDKjLu+8roI4F3bntQmkcFdBCU2h72VNbl3
	TAH2Jw270XFLtLmEUFl6oARwFC2ezbht7ICxAdKG55sCZOPhu+sJEAibeW5fl/Ly+Tk8
	tPRCNpqaL///AJAOrqKWGV6jHw+NNWATUIm8iIbAmef3uzLcyIKzY3rX6lrQGsxz+c2M
	HdCA==
X-Gm-Message-State: AEkoousCioXpyl0BzPj7E62mVYSWejUCyxJhUIvvXuQPqDQbkeruupwxQQhVPtYwDMGuJQ==
X-Received: by 10.98.14.208 with SMTP id 77mr6114616pfo.23.1471542355143;
	Thu, 18 Aug 2016 10:45:55 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:e111:2047:280c:be38?
	([2601:647:4c00:3edf:e111:2047:280c:be38])
	by smtp.gmail.com with ESMTPSA id
	m128sm326076pfm.42.2016.08.18.10.45.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Aug 2016 10:45:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <b1622999964348e68e651f38dca42d59@SEHSTE15D2BE2.hs20.net>
Date: Thu, 18 Aug 2016 10:45:53 -0700
Message-Id: <530A67FF-CCDF-464A-AE0B-1BE124D4F560@gmail.com>
References: <b1622999964348e68e651f38dca42d59@SEHSTE15D2BE2.hs20.net>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: Build of u-boot with gold is broken
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
X-List-Received-Date: Thu, 18 Aug 2016 17:45:55 -0000
X-Groupsio-MsgNum: 62729
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6B7AD30D-7AFB-4A38-8F3F-8402037333E9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6B7AD30D-7AFB-4A38-8F3F-8402037333E9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 18, 2016, at 6:44 AM, Andrew Goodbody =
<andrew.goodbody@cambrionix.com> wrote:
>=20
> Hi,
>=20
> It looks like the recent change to meta/recipes-bsp/u-boot/u-boot.inc =
to enable out of tree builds for u-boot does not work with gold.
> The sed at line 70 fails as it is being executed in an empty build =
directory and so there is no config.mk.
>=20

Send this to OE-core list you might need to add cd ${B} at beginning of =
do_compile


> Andrew
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_6B7AD30D-7AFB-4A38-8F3F-8402037333E9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle19FEACgkQuwUzVZGdMxRP1gCfRvCmRC+PgRsj99wt+ONuA8qA
RrUAn2E2/n5AGL2r4TYoY1kZuyglvOVb
=4QOU
-----END PGP SIGNATURE-----

--Apple-Mail=_6B7AD30D-7AFB-4A38-8F3F-8402037333E9--
