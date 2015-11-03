Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3BF9460124
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Nov 2015 19:29:40 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so26775839pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Nov 2015 11:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=vMHsKECdbNHv8fvD7i7Plm2KqLpIvJzg93hVa/rrqTY=;
	b=HNuDSbT+GBhVpqoV69KrPsI31xVQ7YAHGYIBFFOsAZ7mp50xCXq0NEiPGerbc7Tczs
	ckio6EU5Jm90dH3ZUAmfUgmlID084ev6CbzlcAvV8qS7aq6IF92nOxLNJPGu9BtgLhiu
	vfpUXU/Bt27CXE+FcCW7KfYKjrHvQyNjjx4Ae2IRTOWlz++L3F4e/kjvTPi6sOci7BUr
	/GI51dL4O72d0olFYg0vWr17oIaiiPYlz5T/xeU9IPQevDS4aX34jaHYzmqylSYTXB54
	IvD4tR6bfDa53BMcRDcadgd0xjjnlDyWlPpKiPfF4DjfccxDfscUelGcCf+93IkhAcy/
	a9Ng==
X-Received: by 10.66.192.106 with SMTP id hf10mr35988834pac.16.1446578980752; 
	Tue, 03 Nov 2015 11:29:40 -0800 (PST)
Received: from ?IPv6:2601:646:8601:4580:440f:8649:8a1c:baf6?
	([2601:646:8601:4580:440f:8649:8a1c:baf6])
	by smtp.gmail.com with ESMTPSA id
	yh3sm30867318pbb.82.2015.11.03.11.29.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Nov 2015 11:29:33 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3106\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5638F552.7000609@balister.org>
Date: Tue, 3 Nov 2015 11:29:28 -0800
Message-Id: <C5B15014-8E0F-479D-AA4D-973D05D92757@gmail.com>
References: <1446228808-18756-1-git-send-email-philip@balister.org>
	<20151030195137.GD2566@jama> <5633CB87.1070903@balister.org>
	<20151103141546.GA2556@jama> <5638F552.7000609@balister.org>
To: Martin Jansa <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3106)
Subject: Re: [meta-oe][PATCHv2] llvm: Add recipe for llvm-3.7.0.
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
X-List-Received-Date: Tue, 03 Nov 2015 19:29:42 -0000
X-Groupsio-MsgNum: 58271
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FDCCB5AB-495C-4BB9-99E4-12AB24B70269";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_FDCCB5AB-495C-4BB9-99E4-12AB24B70269
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


> On Nov 3, 2015, at 9:56 AM, Philip Balister <philip@balister.org> =
wrote:
>=20
>> The --disable-compiler-version-checks in EXTRA_OECONF isn't passed to
>> configure:
>> http://errors.yoctoproject.org/Errors/Details/21293/
>=20
> That is the log from do_compile. Apparently configure is getting =
re-run
> with different arguments. Anyone have ideas?
>=20

you need to show log.do_configure or run.do_configure to make sure its =
not happening

> Philip


--Apple-Mail=_FDCCB5AB-495C-4BB9-99E4-12AB24B70269
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlY5CxwACgkQuwUzVZGdMxSx/QCdF6cLnk6/LbCH7Ni25wuVdEcS
wKUAoI8bvc7VdpIWyJpSnx7qyiMeL8rL
=jKc1
-----END PGP SIGNATURE-----

--Apple-Mail=_FDCCB5AB-495C-4BB9-99E4-12AB24B70269--
