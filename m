Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id D801071DD9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 14:55:43 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id r126so30322643wmr.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 06:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=7isynnTFD9brTAMswxy4HoEJblD/Us2neYDLDlJ7K00=;
	b=vI/IGa8E4xMVcRNCsIbe7E9ZpmbBXPBGEpEzeAglY1hAF+6mW/k/2gT0ewBp43gsOd
	M84b4crSVr4lmsBhL1B9H903eVALPj4BrdpqXh/dbiJ6LG4wRVOIkTcUFixNy0lEmaM8
	j0GUS78TavfZBnqYMQ/uxbBrV+8Y7lZpNxbYUl4Mhg9YPjVCTcmQ8xKWP1+ZwwQ8ojT5
	MC6hhypISHZNcFoNicGvPXH+QDdqMicBFZq1rgexOrvdegigR4tYTZL+CWnwHXaDPnmb
	tG9sm2Z14lk1z5SwwbD7AanTxQ932PBF9rL4IcYOr73ZZfPBFOb/ttwavtfQQ1d/qJAD
	y2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=7isynnTFD9brTAMswxy4HoEJblD/Us2neYDLDlJ7K00=;
	b=OD3NRKmNMLReZo7UFKobjtGfU29sOSfmQLC4YXdKRNwuGKLHc0zFkz4sqiVoMyn9gC
	vT9yWWQ22pUhrKlxg0+2mvylDyRGEuASkDoqSp9JxbsjjK5UeKR7kIGuwWFKlkmeBzzv
	YuVCUUm4b4vjiEzXGEiRrygQED552JMpkjoO0fes06T9XCk0zRoS/miTh08l1GaIjp+j
	Kr/PI1IVY+kH697DHz0tMbdpu2afY1JxJgdb07oqUt23cmd4johifAypbBGNliT342pC
	B30ySa1eUC0ethFlS9Ktl7dHcsWWv/73eIii5OesnwCuPbNDzngaUNbEceUc00EmpM92
	PT+A==
X-Gm-Message-State: AIkVDXIXi+FXktR3icxil2+zye/gMVC1+zovb9aTWwQQV12kuPmAjxytXYpJQwSqtXzmtA==
X-Received: by 10.28.158.82 with SMTP id h79mr24793712wme.30.1485356143545;
	Wed, 25 Jan 2017 06:55:43 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	p49sm25334459wrb.10.2017.01.25.06.55.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Jan 2017 06:55:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 25 Jan 2017 15:55:45 +0100
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Message-ID: <20170125145545.GC3260@jama>
References: <20161229133508.5584-1-ricardo.ribalda@gmail.com>
	<20161229133508.5584-2-ricardo.ribalda@gmail.com>
	<20170119114529.GG3265@jama>
	<CAPybu_32sRCZGtLQgTzX7bUtqrzfUWawhQy+LJXOCTtO7Q0o3w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPybu_32sRCZGtLQgTzX7bUtqrzfUWawhQy+LJXOCTtO7Q0o3w@mail.gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] opencv: Update to version 3.2
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
X-List-Received-Date: Wed, 25 Jan 2017 14:55:44 -0000
X-Groupsio-MsgNum: 64845
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p2kqVDKq5asng8Dg"
Content-Disposition: inline

--p2kqVDKq5asng8Dg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2017 at 03:21:15PM +0100, Ricardo Ribalda Delgado wrote:
> Hi Martin
>=20
>=20
>=20
> On Thu, Jan 19, 2017 at 12:45 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Thu, Dec 29, 2016 at 02:35:08PM +0100, Ricardo Ribalda Delgado wrote:
> >> -Only enable protobuf as dependency if dnn module is enabled
> >> -Download manually xfeatures from 3rd party repo
> >> -Remove uneeded fixgcc60patch
> >
> > Fails to build now:
> > http://errors.yoctoproject.org/Errors/Details/117456/
> >
>=20
>=20
> I have not been able to replicate it in for qemux86. By looking at the
> error message it looks like something on the freetype module. Until we
> figure out what is going on, maybe we could pakcageconfig that module
> and disable it by default (it is part of contrib)
>=20
> What do you think?

Yes, it could also be caused by freetype upgrade in oe-core, fine with
me to disable it with packageconfig until the issue is resolved.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--p2kqVDKq5asng8Dg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWIi8cAAKCRA3VSO3ZXaA
HPKVAKCRrmbghfnGCkkRm9BxMiiv070uPQCgtZRqevL6AuScpL30i8GwfqBFjTM=
=zlwT
-----END PGP SIGNATURE-----

--p2kqVDKq5asng8Dg--
