Received: from [209.85.198.240] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LpGfk-0000rE-7D
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 08:45:14 +0200
Received: by rv-out-0708.google.com with SMTP id k29so428869rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2009 23:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=uBPIoyDTUmiE4TZQj5CtfrwTu0jbOd96JdsP3V8yZus=;
	b=ok7GfIrqAHiy9nDMjZND/kKj77fAvKrxVOGrs5IA8F/sirTOsekH7ManS6vJquam0b
	fg1xEG7bfaSYxL77i6YJAJQmQ1xGE2UOZykIpYiOhvjQxdB2mFwp6K814w+K8jyFDSok
	MFdWF+3MnC7jY3sCdGIpFX4SNiIiZiM2zBPzU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=P6woAzDfG2sxchVZEnfXhmpO1b6aPp8pZxUSLqSJ+erNtQu9AEMd1+g5MmvaMXN5zB
	cVK7ergWTkwKN8l2XVssdLPbNDtP1+KxrMksE+nlRAa/ftxIQ5LivYH/nSL5DNP2dLW9
	2veGrDklQq8PnLdw6h8zrZDvL1MjkPQTzhNKM=
Received: by 10.114.73.14 with SMTP id v14mr5721351waa.104.1238654564468;
	Wed, 01 Apr 2009 23:42:44 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-4-184.dsl.pltn13.sbcglobal.net
	[71.146.4.184])
	by mx.google.com with ESMTPS id v9sm805190wah.60.2009.04.01.23.42.43
	(version=SSLv3 cipher=RC4-MD5); Wed, 01 Apr 2009 23:42:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 1 Apr 2009 23:42:29 -0700
User-Agent: KMail/1.11.1 (Linux/2.6.28-11-generic; KDE/4.2.2; x86_64; ; )
References: <49D3582F.4070304@xora.org.uk>
In-Reply-To: <49D3582F.4070304@xora.org.uk>
MIME-Version: 1.0
Message-Id: <200904012342.38417.raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.198.240
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=AWL,BAYES_40,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: klibc problems
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Apr 2009 06:45:15 -0000
X-Groupsio-MsgNum: 8961
Content-Type: multipart/signed; boundary="nextPart1422220.xQdt33LXdA";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1422220.xQdt33LXdA
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 01 April 2009 05:03:59 Graeme Gregory wrote:
> Ok, its no mystery to some people that klibc has problems with modern
> kernels.
>=20
> But I think we also have a problem with the package in OE. Seeing as
> klibc is machine dependent in that it includes mach-XXX/include/mach/*.h
> files it really should not be staged as part of the base arch. I think
> we need to stage it into ${MACHINE_ARCH} the same was as the kernel is.
>=20
> We can then work on fixing the application compiles.=20

How much work this would be.

> I think I have a
> suitable hack.

post it.
>=20
> Graeme
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20

=2D-=20
Khem Raj

--nextPart1422220.xQdt33LXdA
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAknUXlYACgkQHnJKy6V6em4AsgCfXUo4sUWA9OB9z4yT5rutLjUa
u6AAnic0rB5sCfm2DhW0LbufFqFR/NAw
=NTti
-----END PGP SIGNATURE-----

--nextPart1422220.xQdt33LXdA--
