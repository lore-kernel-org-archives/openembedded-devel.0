Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1NCXTb-0005UN-Tb
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 12:53:07 +0100
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id DAD4C140B0; Mon, 23 Nov 2009 12:51:35 +0100 (CET)
Date: Mon, 23 Nov 2009 12:51:35 +0100
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091123115135.GA26444@zlo.nu>
References: <alpine.LFD.2.00.0911200514430.18485@localhost>
	<4B068A46.8090701@balister.org>
	<alpine.LFD.2.00.0911200916270.11844@localhost>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.00.0911200916270.11844@localhost>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: marcolz@zlo.nu
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Upgrade guile from 1.8.6 to 1.8.7.
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
X-List-Received-Date: Mon, 23 Nov 2009 11:53:07 -0000
X-Groupsio-MsgNum: 14608
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline

--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2009 at 09:22:04AM -0500, Robert P. J. Day wrote:
> > 2) You can include the checksums in the recipe now. See:
> >
> > http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/curl/cu=
rl_7.19.7.bb
> >
> > look in the curl-common.inc file for the "tarball" naming.
>=20
>   ok, there's some curious stuff going on there.  first, while the
> newest curl .bb file is version 7.19.7, there is no equivalent
> curl-native .bb file, even though earlier version have them.  is there
> a reason for that?

Yes, I did not bother to add a -native version of it, because the update
(from 7.19.6) did not provide anything new or fixed anything that would
be of value to an OE build. ;-)

>   also, it's only that latest .bb file -- curl_7.19.7.bb -- that has
> the tarball checksums.  if there *was* a corresponding -native .bb
> file, would it *also* need those identical checksums?  i would like to
> think not since that would be redundant.  a grep of recipes shows only
> two recipes that appear to be taking advantage of this feature --
> busybox and curl.

The -native .bb would include the non-native .bb and thus use the same
checksums, which would be correct.

Marc

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksKd0cACgkQezjnobFOgrF01ACfQ5PFIoYeO9qbs7u3bTngaqQq
GjQAn1sObEmNurXLZ4UxOwuC0IonJ0jq
=n+3t
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
