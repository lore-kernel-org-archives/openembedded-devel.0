Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RGGWF-0003y3-Oq
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 22:44:15 +0200
Received: by bkat8 with SMTP id t8so1385327bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 13:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1RzDFRFYzEKanP0ltdQ/GeqJ5N9QMoFGV2ZK49uiU7M=;
	b=RCGcuwaRQZVdW1BZeWaDyLURtmYiASNrPjZ9a+55/G6GXqhA1EgYatf696xxRq0alZ
	cDaxLz58Dvzo0ZjyQjXv7UTfsWDOe23yQbE5JiirKsKozy3iM6nCIX/tACIw1gJm0ks8
	/Jhdg02LpEEEqucTL9oKS4EF9qqXYTj1RCqWE=
Received: by 10.204.10.77 with SMTP id o13mr403079bko.85.1318970305407;
	Tue, 18 Oct 2011 13:38:25 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w8sm3484003bks.11.2011.10.18.13.38.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 13:38:24 -0700 (PDT)
Date: Tue, 18 Oct 2011 22:38:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111018203818.GD556@jama.jama.net>
References: <j7gllt$s0$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j7gllt$s0$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Patchwork breaking submitters name Was: Patchwork hooks for meta-oe active and working
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
X-List-Received-Date: Tue, 18 Oct 2011 20:44:15 -0000
X-Groupsio-MsgNum: 34877
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NtwzykIc2mflq5ck"
Content-Disposition: inline

--NtwzykIc2mflq5ck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 17, 2011 at 09:32:13AM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Hi,
>=20
> Thanks to Khem the patchwork hooks for meta-oe (and hence meta-efl,
> meta-gnome and meta-xfce) are active and working.
> Once the commits hit the OE server the state will get updated automatical=
ly,
> so the submitter will instantly know when his/her patch has hit the repo.
>=20
> regards,

There is known and fixed issue with patchwork breaking author name

We have an example in patch
"[meta-oe] lightmediascanner: Add version 0.4.4 (initial recipe)"
Original e-mail says "Pau Espin Pedrol <pespin.shar at gmail.com>"
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/035644=
=2Ehtml

older patchwork instance says only "pespin <pespin.shar at gmail.com>"
http://patches.openembedded.org/patch/13323/
newer patchwork instance says also "pespin <pespin.shar at gmail.com>"
http://patchwork.openembedded.org/patch/13323/

Same problem was reported also on LKML
https://lkml.org/lkml/2011/9/18/128
And later fixed by Jeremy Kerr
https://lkml.org/lkml/2011/9/18/149

Can we get this upstream fix to our patchwork instance too?

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NtwzykIc2mflq5ck
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6d47oACgkQN1Ujt2V2gBxmHgCeMNHYdKemTqS3Dq+4eeWto+vT
FQQAoJDc4Ky2/Y5aNRU3kFcCOwdFGHz7
=phK1
-----END PGP SIGNATURE-----

--NtwzykIc2mflq5ck--
