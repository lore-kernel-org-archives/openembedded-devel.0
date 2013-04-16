Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1US7MQ-0003TZ-TB
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 16:59:59 +0200
Received: by mail-pb0-f49.google.com with SMTP id um15so328438pbc.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2013 07:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=bW/02l8MhUbwIhONg1S9/S2+N/nVYAoi3Sbq/bDCeCw=;
	b=S4njAkmNi7AA8I24dxFcwM427v6gQ59onFlhzxVbF97INs+znIRbtseRRZ+PkpVmHG
	Keo8cSskNat0QBisbnCIkL5VMepXTvrhOZu1lRFiYrxFCZlqC7fjFLNU/sOP2/OWThnW
	l+MjlEwr4/NzVeqW1ILR+Fc4Xu0YY5xB4kKT9ArnR9jWsZcG/rVmc1YjcWZfU6k4HtxS
	d3s0OcMm0piHEQmvgsTX3xFehVPWA58y9uEzftYK9uLGcKs39YP+iAZFIi69ixD5vg+w
	fCGYrQ5qX86Iq4z3vB5DRg813VCoYc3olf4fBt6DTKKJqFeUG1nthGqY1Hbapmy+jJ8g
	HUDA==
X-Received: by 10.66.27.105 with SMTP id s9mr3993057pag.108.1366122899296;
	Tue, 16 Apr 2013 07:34:59 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id vb8sm2320119pbc.11.2013.04.16.07.34.45
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 07:34:57 -0700 (PDT)
Date: Tue, 16 Apr 2013 16:34:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130416143442.GP10628@jama.dyndns-home.com>
References: <cover.1366119759.git.paul.eggleton@linux.intel.com>
	<20130416140501.GO10628@jama.dyndns-home.com>
	<28464506.76Htkx7JyD@helios>
MIME-Version: 1.0
In-Reply-To: <28464506.76Htkx7JyD@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome][PATCH 0/2] Remove some recipes that are in OE-Core (cover letter only)
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
X-List-Received-Date: Tue, 16 Apr 2013 15:00:05 -0000
X-Groupsio-MsgNum: 44251
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U+NfgObvpQT1Q9Yq"
Content-Disposition: inline

--U+NfgObvpQT1Q9Yq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2013 at 03:11:11PM +0100, Paul Eggleton wrote:
> On Tuesday 16 April 2013 16:05:01 Martin Jansa wrote:
> > On Tue, Apr 16, 2013 at 02:46:48PM +0100, Paul Eggleton wrote:
> > > In case you're wondering why I've only sent the cover letter for just=
 two
> > > patches, I tried sending them as normal and what I got was:
> > >=20
> > > fatal: pull-29844/0001-hicolor-icon-theme-remove.patch: 29: patch con=
tains
> > > a line longer than 998 characters warning: no patches were sent
> > >=20
> > > They are just deletes though so they don't contain much in the way of
> > > substance.
> >=20
> > libical is fine and I'll merge it shortly, but hicolor-icon-theme needs
> > PR bump in oe-core first (and in oe-core/dylan if you want it merged in
> > meta-oe before branching dylan).
>=20
> If you'll accept an OE-Core PR bump for this can we do the same for the=
=20
> bbappends that are preserved solely for keeping the same PR?

bbappens are a bit different, because this PR bump (would be nice to do
+2) does not need to happen atomically with meta-oe bb removal.

With bbappends it's possible that someone will upgrade oe-core with PR
bumps, build qt4-x11-free and then upgrade meta-oe without PRINCs and
build qt4-x11-free. But I'm willing to take that risk if we apply both
"close" :).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--U+NfgObvpQT1Q9Yq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFtYYIACgkQN1Ujt2V2gBw2zACgkDIUXEpPB4cff12Bva5bjZ6u
hgkAoJi0Dkn/i634eNtmgp2njGHcwN0A
=eWgY
-----END PGP SIGNATURE-----

--U+NfgObvpQT1Q9Yq--
