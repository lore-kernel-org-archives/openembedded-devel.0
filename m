Received: from mail-ee0-f46.google.com ([74.125.83.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1URg8F-0005nF-Dk
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 11:55:30 +0200
Received: by mail-ee0-f46.google.com with SMTP id d49so2183543eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 02:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qCIRsK5qImphxTMEBu+idxcdy31GWGiYbPd6mBCDAbE=;
	b=V2sFS44U3BD9D311h1OsBeUyIsTtWSW2Qp8I7oOoVCKRiBak/zePFTd12nQtWzOhvU
	vS/yS4h+Tgw2fVFMYizYS1gzywdBGyO5cJxVDsIcRMbfXhWJf1grv6KcM5EaFilLQoEF
	YeBnLb5XSjQ8cR4a074fSb2ZO8Urw6let9UmLnDzA57SRbieVp9SvMoOgGOiFJpFSjZx
	UZCwbz7HWgOu88Gepg4URBubOaE/SXXcaxfdB3dckb6U3KFCTO8IrW0clq2naL8lla8o
	hS0amg7OS36hInsa5WuP27iETaGXh8Zi5B14cylymNDptg+bcuYRxFSev2olNrvzU8jn
	NAlQ==
X-Received: by 10.14.182.72 with SMTP id n48mr2483819eem.3.1366018678902;
	Mon, 15 Apr 2013 02:37:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id
	cb50sm25794160eeb.14.2013.04.15.02.37.57
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 02:37:58 -0700 (PDT)
Date: Mon, 15 Apr 2013 11:38:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130415093804.GK2475@jama>
References: <1365867474-10261-1-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0LZEwOb+u0=aR+BnozYTZ1n0GOO2_e3Na1WW3C6ApNk3Rw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZEwOb+u0=aR+BnozYTZ1n0GOO2_e3Na1WW3C6ApNk3Rw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] llvm: Import from meta-java
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
X-List-Received-Date: Mon, 15 Apr 2013 09:55:37 -0000
X-Groupsio-MsgNum: 44187
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cN0A5YokcrYPGsSB"
Content-Disposition: inline

--cN0A5YokcrYPGsSB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2013 at 10:19:00AM +0100, Burton, Ross wrote:
> Hi Martin,
>=20
> On 13 April 2013 16:37, Martin Jansa <martin.jansa@gmail.com> wrote:
> > * llvm is generic enough to be useful outside meta-java
> >   e.g. we need it to enable llvmpipe galium driver in mesa
>=20
> Do you plan on doing this?  I've had this down as something to propose
> for oe-core, or at least enable elsewhere.

Yes, we have it in .bbappend, unfortunately galium is disabled without
PACKAGECONFIG which makes EXTRA_OECONF mangling a bit more complicated,
when we have working version I can propose some changes to mesa in
oe-core. We're using danny so we have to backport some stuff too first.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cN0A5YokcrYPGsSB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFrynwACgkQN1Ujt2V2gBzo4ACgmrmXBp6nOPURcR19P+uod9Nq
OjsAnAsOoi5+wL52M/KLxXV1BLcd1xmO
=kd85
-----END PGP SIGNATURE-----

--cN0A5YokcrYPGsSB--
