Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RGH1A-0005GB-8s
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 23:16:12 +0200
Received: by bkat8 with SMTP id t8so1414572bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 14:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=y+Ibr1vdVToQBlnxe0G4OCxGdqqYcAPSDJo+9NMy7Mw=;
	b=h8gfiOJXOSo3IJ94oXHY9n4kfU7aQutkoUa3UyjUjQoKDiiE9EZt2OiWSVcFjgfdt9
	4RGb1soSLjnjfCSan6LoYhK6pR0TfKotat2JhBXjzH9VO7I6uI8xLxpUQOOwsSY0Pli6
	BzlMLZGpp9hivBbldxzr+UG1ducQL75ryjj5o=
Received: by 10.204.141.8 with SMTP id k8mr3063456bku.14.1318972222328;
	Tue, 18 Oct 2011 14:10:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w8sm3563990bks.11.2011.10.18.14.10.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 14:10:21 -0700 (PDT)
Date: Tue, 18 Oct 2011 23:10:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111018211015.GE556@jama.jama.net>
References: <j7gllt$s0$1@dough.gmane.org> <20111018203818.GD556@jama.jama.net>
	<20111018204954.GA27472@sakrah.homelinux.org>
MIME-Version: 1.0
In-Reply-To: <20111018204954.GA27472@sakrah.homelinux.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Patchwork breaking submitters name Was: Patchwork hooks for meta-oe active and working
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
X-List-Received-Date: Tue, 18 Oct 2011 21:16:12 -0000
X-Groupsio-MsgNum: 34880
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="84ND8YJRMFlzkrP4"
Content-Disposition: inline

--84ND8YJRMFlzkrP4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2011 at 01:49:54PM -0700, Khem Raj wrote:
> On (18/10/11 22:38), Martin Jansa wrote:
> > On Mon, Oct 17, 2011 at 09:32:13AM +0200, Koen Kooi wrote:
> > > -----BEGIN PGP SIGNED MESSAGE-----
> > > Hash: SHA1
> > >=20
> > > Hi,
> > >=20
> > > Thanks to Khem the patchwork hooks for meta-oe (and hence meta-efl,
> > > meta-gnome and meta-xfce) are active and working.
> > > Once the commits hit the OE server the state will get updated automat=
ically,
> > > so the submitter will instantly know when his/her patch has hit the r=
epo.
> > >=20
> > > regards,
> >=20
> > There is known and fixed issue with patchwork breaking author name
> >=20
> > We have an example in patch
> > "[meta-oe] lightmediascanner: Add version 0.4.4 (initial recipe)"
> > Original e-mail says "Pau Espin Pedrol <pespin.shar at gmail.com>"
> > http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/03=
5644.html
> >=20
> > older patchwork instance says only "pespin <pespin.shar at gmail.com>"
> > http://patches.openembedded.org/patch/13323/
> > newer patchwork instance says also "pespin <pespin.shar at gmail.com>"
> > http://patchwork.openembedded.org/patch/13323/
> >=20
> > Same problem was reported also on LKML
> > https://lkml.org/lkml/2011/9/18/128
> > And later fixed by Jeremy Kerr
> > https://lkml.org/lkml/2011/9/18/149
> >=20
> > Can we get this upstream fix to our patchwork instance too?
>=20
> This patch is already applied to the new patchwork instance on
> patchwork.openembedded.org however it was only yesterday when it came
> into life.

But still it doesn't work today:
http://patchwork.openembedded.org/patch/13437/

and from Kerr's reply I'm not sure if someone has to fix something in
patchwork database or if registered users can fix it in their profile
page.. or maybe he fixed only Submitter fields for existing patches in
database..

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--84ND8YJRMFlzkrP4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6d6zcACgkQN1Ujt2V2gBw3SgCfZdtreKx0vVjyZnhlulduH0//
wNsAn04dFfJ7vJQUL4ue6CuQEf1YzMWq
=ZeNf
-----END PGP SIGNATURE-----

--84ND8YJRMFlzkrP4--
