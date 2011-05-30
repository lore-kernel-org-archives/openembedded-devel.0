Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQyrG-0003jU-SW
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 11:33:58 +0200
Received: by fxm19 with SMTP id 19so2755926fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 02:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=EiW3IItgWFAlB1dTLHz/klAIvAlcuQIChtCRDVonV70=;
	b=vkhukDZ1GuTzH0n3LHPvF0sfCRc0/yzIDAWhbLKpr8YakQsswwfQNuWBdnT73+IMY2
	UKxFWnrywtz3513JctpBhwX/0JsoT+8Ena/mCAdeZklCsZ4crmkdifaoHSmBYWWKhmfF
	1Mu3vQJkOP+GraC6dyhmybW2qRtoagZtAwi2k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=unzj27CFfU9X8LSdxpgtWSJnC+c4dmiWb4a+/FJrql9qOQcLJXiv/1Pa499LU13GGr
	r5Oa2cmwFhMECIEes6UWLXZrqa72zyfvG+0Idrpkjad8h8HfJjZCJslhKxNhggJM5O+o
	g0J7hpKClu4jOwCv6UN30avBjM5RiF1IZm0B0=
Received: by 10.223.143.6 with SMTP id s6mr3420209fau.74.1306747846589;
	Mon, 30 May 2011 02:30:46 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id n7sm660283fam.43.2011.05.30.02.30.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 02:30:45 -0700 (PDT)
Date: Mon, 30 May 2011 11:30:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110530093039.GF18119@jama.jama.net>
References: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
	<c424bae29966b789e50eb4112a9d95a2b7833942.1306706130.git.Martin.Jansa@gmail.com>
	<1306720135.5979.1.camel@perseus>
	<20110530053016.GE18119@jama.jama.net>
	<irvd51$kf9$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <irvd51$kf9$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 07/14] libelf: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Mon, 30 May 2011 09:33:58 -0000
X-Groupsio-MsgNum: 32375
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gneEPciiIl/aKvOT"
Content-Disposition: inline

--gneEPciiIl/aKvOT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 30, 2011 at 08:23:33AM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 30-05-11 07:30, Martin Jansa wrote:
> > On Sun, May 29, 2011 at 06:48:55PM -0700, Khem Raj wrote:
> >> On Sun, 2011-05-29 at 23:56 +0200, Martin Jansa wrote:
> >>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>
> >> You do not need to import libelf recipe. oe-core provides libelf via
> >> elfutils change the depending recipes to depend on elfutils instead.
> >=20
> > OK, thanks! Will test and update patch.
> > koen: should I update patch in same branch or send new patch removing
> > libelf and changing deps?
>=20
> updating the branch would be good enough for me.

updated branch pushed
libelf removed and ltrace DEPENDS updated and moved to recipes-devtools
devmem2 removed from branch because it was already applied :)

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gneEPciiIl/aKvOT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3jY78ACgkQN1Ujt2V2gBxKIACfXG9VumGXMLv9+9xaz55c27qu
26sAn0nVnEnsnZZrVznka+b5NE0aJ/Oc
=9zUa
-----END PGP SIGNATURE-----

--gneEPciiIl/aKvOT--
