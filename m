Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 66362728CB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2015 19:10:48 +0000 (UTC)
Received: by pacwv17 with SMTP id wv17so77124159pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2015 12:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=AIg5Vv9CAuAapVC66CwfJAs312DP2CIsZCSqWEdrrAk=;
	b=for9ETt4yAK1ujBxEP+1QZJ7kjHGl51QyIupbtQ2XE5pdJicUFIEZTK+0f4tqnqfCZ
	qY82n/5YzqN15yX3mvajqKCmYSB8Cvn3XxDxCVAb5EJ4S8GRWkKoaxn3li/U636Xy1jO
	up8QWwMZ5DEO4AbhI0eqGhOYdnfKxIhSVl+43z46gqWodLgeYn8S0lagOsXRx/gw8V83
	Upt/fCYK6bDcvhGzhGM6M3oDj9f/oIbUcZUILE4rCxEPsAvc4M81l4tGZ6GRP8YQt2x5
	QFyj21qmKImVvZgHQbazq+mg4At/31Kd5c5reL4+VhC1kDaUeZMRQTYmBQesPGJmqLoS
	4eOg==
X-Received: by 10.67.13.140 with SMTP id ey12mr67880436pad.67.1432149049733;
	Wed, 20 May 2015 12:10:49 -0700 (PDT)
Received: from ?IPv6:2600:1010:b04d:4ac3:5910:a868:e4de:c473?
	([2600:1010:b04d:4ac3:5910:a868:e4de:c473])
	by mx.google.com with ESMTPSA id he9sm16891917pbc.7.2015.05.20.12.10.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 May 2015 12:10:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0Lbn8OnaONPtHSm+cxOwQBgefJyAR+yPP1Q2ubmudUAMCA@mail.gmail.com>
Date: Wed, 20 May 2015 12:10:47 -0700
Message-Id: <A40E2E73-1B08-4ECF-BEFE-F1B354C266F6@gmail.com>
References: <555B59D4.80304@linux.intel.com> <555B9872.50301@gmail.com>
	<CAJTo0Lbn8OnaONPtHSm+cxOwQBgefJyAR+yPP1Q2ubmudUAMCA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2098)
Subject: Re: [meta-ruby] proposal: moving ruby to oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 May 2015 19:10:50 -0000
X-Groupsio-MsgNum: 55570
Content-Type: multipart/signed;
	boundary="Apple-Mail=_699C0950-6FDE-4247-9CF5-AB4AA6ACAA8B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_699C0950-6FDE-4247-9CF5-AB4AA6ACAA8B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 20, 2015, at 2:18 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
> On 19 May 2015 at 21:09, akuster808 <akuster808@gmail.com> wrote:
>=20
>> I don't have an issue with that. Do you need both Ruby and bundler? I
>> believe there is value in having additional ruby packages outside =
core,
>> like python is structured.
>>=20
>=20
> Agreed, meta-ruby should continue to exist for anything outside of the =
core
> Ruby runtime, exactly like meta-python and meta-cpan.

+1 here as well. We should however make any changes needed in OE-Core to =
make ruby consumption
easier.



--Apple-Mail=_699C0950-6FDE-4247-9CF5-AB4AA6ACAA8B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVc3DcACgkQuwUzVZGdMxSfzQCfQHHol4wAhnmaB34mi4f5Qkmx
PhEAnRHrHFwDurplvnVyY9PPWHPnS/7E
=Xo0V
-----END PGP SIGNATURE-----

--Apple-Mail=_699C0950-6FDE-4247-9CF5-AB4AA6ACAA8B--
