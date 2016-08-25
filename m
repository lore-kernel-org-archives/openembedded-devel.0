Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3F27C60119
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Aug 2016 17:00:03 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hb8so18539614pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Aug 2016 10:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=E0blKEu9VuMr2FSw/S9OlzP56Q74CsRs1aoTr46poWI=;
	b=gTg0IJLJPa4BjM/K/nhSzLqL9r6aq3cxyj3Pl3yHmJwVoGal0/cezc6exhk2iZlfcC
	0MdVqWkM+lL+OZa+jd6G0rACMvc3N5KBqgtEsDXQd7YIP2+S9vLq2c+KSMmK7WiLHiRj
	3pt6LP49dIlSfPrG0zyzYncekIrKyeCn3V8MhTHvxVWRup61oxJWjRdDW43XefMA3yBz
	qhjgG4EH+SxcjbzwCzpuX68GqJajLusMxyewDV7Izt0jlx71gzhMsDtlvK+HIyPFxfJM
	KbYEPkeT9iveAPLQ0oLaLE5kwenMJsv7uSDAPbjcFbB+omPgKIign7plnt/DJbvEHC/d
	+cxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=E0blKEu9VuMr2FSw/S9OlzP56Q74CsRs1aoTr46poWI=;
	b=O5X+QsY4Xz8/7qYURjfHIyodRbe/d9xqvhyJCm/01FFuYDqFcoHbgRaAppXLuEmJIl
	CwzF7wkXipKQ6s/asrgVdm/xUxn+SICgl9aXDuPHzzVUXeTPPfuOjX2KS7bhVncDXsrM
	X/F13cjaB/6Hbfn6SDDCjmcwL20KNS0Bzda25SoSTZ2l7Ms/r2mBT3p4t+za2fc7s8wA
	ZASv2RZZgDgSjTLXFYRHy+MaBzw7CLfzP4RjOssdB9u8G7egbC2PEPL7+EfbpO+upTnI
	XKFHS4iLHbFPqba5VD+40vNQ9q7ZHPeSSmI8MVQnGEFgtbfoiwrcUalRSpMIeq8ivIXb
	+HUQ==
X-Gm-Message-State: AE9vXwPG5jOVXzUW4AZkLoewUdT/Hukle33j4KsgHWy4E50j118sPQ+FRzUokCx2l4hXsg==
X-Received: by 10.66.193.7 with SMTP id hk7mr18129549pac.78.1472144404793;
	Thu, 25 Aug 2016 10:00:04 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:157a:f659:3403:a165?
	([2601:647:4c00:3edf:157a:f659:3403:a165])
	by smtp.gmail.com with ESMTPSA id
	uz4sm22229895pac.13.2016.08.25.10.00.03
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Aug 2016 10:00:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CADwFkYehX7aM8Oqiu+jv85iOe54J6wUFbKUs7OdENoUsF_rUfA@mail.gmail.com>
Date: Thu, 25 Aug 2016 10:00:34 -0700
Message-Id: <6715E3FE-34D2-4C89-B54E-76B481EAAF06@gmail.com>
References: <CADwFkYehX7aM8Oqiu+jv85iOe54J6wUFbKUs7OdENoUsF_rUfA@mail.gmail.com>
To: Yi Qingliang <niqingliang2003@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-qt5] the QV4 engine will crash result in SIGSEGV
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
X-List-Received-Date: Thu, 25 Aug 2016 17:00:04 -0000
X-Groupsio-MsgNum: 62840
Content-Type: multipart/signed;
	boundary="Apple-Mail=_16A2F46A-4BAA-443F-A747-48D3C582D2A2";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_16A2F46A-4BAA-443F-A747-48D3C582D2A2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 25, 2016, at 12:45 AM, Yi Qingliang <niqingliang2003@gmail.com> =
wrote:
>=20
> bug detail:
> https://bugs.archlinux.org/task/49723
>=20
> patch:
> =
https://git.archlinux.org/svntogit/packages.git/tree/trunk/qt5-declarative=
-gcc6.patch?h=3Dpackages/qt5-declarative
>=20

Thanks for report. Would it be possible for you to cook up a patch for =
meta-qt5 layer for this ?

> Yi Qingliang
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_16A2F46A-4BAA-443F-A747-48D3C582D2A2
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle/JDIACgkQuwUzVZGdMxRM7wCdGNpSuhrjoSWO7R4pcw6xKGiM
Rr0An3PBfRG9r9Jb5GnJQZNXaraecXKu
=9BtP
-----END PGP SIGNATURE-----

--Apple-Mail=_16A2F46A-4BAA-443F-A747-48D3C582D2A2--
