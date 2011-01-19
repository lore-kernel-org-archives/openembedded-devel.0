Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PfTDB-000447-BY
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 09:16:13 +0100
Received: by bwz10 with SMTP id 10so533956bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 00:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=cf6Nwnvlt1DwaeK8ab+t0dBaMe0a6I3osOQk0N00KVQ=;
	b=dBluC7Q+2FsSndcud7O5ingjgw1fDXaY0XXUWK9cxFZnWBi8FmNkQ6SyRhugkUn+5v
	Ow9Xo38jYf8y23j7RJsWvbWxVVat4gYaFKyBp1KWuwyPPV7Hc1nhLEvZV9994W2LOL2n
	wXcRdJ1IyyD/4piUaoyTSYacv7iZC3XhTNajQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=NqmSlMU8TF+HSA1x6toJ2TD9d443tXpbd0Bn3Jd5PVK5MPwSX2MCT8OYZeuQiU09dR
	ngowRUT1lLePX1Wb+6OS/OBznBB9k32AF8BiFQ7dbwMFh+/mdHqq8NUQDwlxGmReJzb7
	l6hD7DLsJYlPBcx8kqsn8iQCJe8iq2V356c5s=
Received: by 10.204.73.78 with SMTP id p14mr319056bkj.47.1295424935829;
	Wed, 19 Jan 2011 00:15:35 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id x38sm3125980bkj.1.2011.01.19.00.15.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 19 Jan 2011 00:15:35 -0800 (PST)
Date: Wed, 19 Jan 2011 09:16:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110119081622.GV21179@jama>
References: <1295027350.14388.6527.camel@rex>
	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
	<4D353F81.50301@xora.org.uk>
	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
	<4D35C5C3.60205@mentor.com> <ih4s84$gbj$1@dough.gmane.org>
	<AANLkTinDtgCiqeRPk4PgnUSZb_V5ryTH-LgzNk2bSoGu@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinDtgCiqeRPk4PgnUSZb_V5ryTH-LgzNk2bSoGu@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Wed, 19 Jan 2011 08:16:13 -0000
X-Groupsio-MsgNum: 28170
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SZSwH5G1FJ2Fz+jP"
Content-Disposition: inline

--SZSwH5G1FJ2Fz+jP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 19, 2011 at 08:47:42AM +0100, Frans Meulenbroeks wrote:
> 2011/1/18 Koen Kooi <k.kooi@student.utwente.nl>:
> > But in the end if boils down to "Does OE wants to make life hard for
> > DISTROs or easy". Frans is firmly in the "make it hard" camp, I hope
> > others have a saner point of view.
>=20
> I don't want to make it hard for the distro's but I feel the distro's
> should not make it hard for the package maintainers (which happens if
> every distro pins its favourite version of recipe foo).
> You're just pushing the burden of the distro choices onto the package
> maintainer.

I don't see any problem with active, well-maintained distro (like
=C5ngstr=F6m is) pinning different versions. Everytime I see package
maintainer asking for pinned version change (like Eric does for
busybox), he receives Ack from distro maintainer with reasonable RTT,
or receives the reason why that distro needs this specific version for=20
longer and they can discuss if it will be moved to distro specific layer=20
or stays in core when it could be usefull for other distros as well.

Problem with pinned versions in OE I had only with stalled distro.confs
which weren't changed in years, nobody knows if there is someone still
building it etc.. But as Graeme said, those unmaintained distros won't
go to openembedded-core without someone actually moving them :).

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SZSwH5G1FJ2Fz+jP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk02ndYACgkQN1Ujt2V2gBxAYACdHyfMX1XHwXY+xnbdBufsaub2
AwYAoJmkt1OFZxFKHOvoWSg35jvSxsxf
=9pUq
-----END PGP SIGNATURE-----

--SZSwH5G1FJ2Fz+jP--
