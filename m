Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYnvJ-00045d-E5 for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 22:53:44 +0100
Received: from e178248110.adsl.alicedsl.de ([85.178.248.110]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYnt6-00085B-Tq for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 21:51:25 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hjfj5e$kei$1@ger.gmane.org>
References: <1264273402-29910-1-git-send-email-john@soundmetrics.com>
	<hjfj5e$kei$1@ger.gmane.org>
Date: Sat, 23 Jan 2010 22:51:23 +0100
Message-ID: <1264283483.3738.163.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: What set the state in Patchwork to? (was: [PATCH] socat: Add version 1.7.1.2)
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
X-List-Received-Date: Sat, 23 Jan 2010 21:53:44 -0000
X-Groupsio-MsgNum: 16124
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-XyrPETU24csNXLRRkjcu"

--=-XyrPETU24csNXLRRkjcu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 23.01.2010, 20:37 +0100 schrieb Koen Kooi:
> > +do_configure() {
> > +     # Override this function to avoid autoconf/automake/aclocal/autoh=
eader
> > +     # since config.h.in gets recreated.
> > +     (cd ${S} && gnu-configize) || die "failure in running gnu-configi=
ze"
> > +     oe_runconf
>=20
> Isn't the whole point of autotools_do_configure to recreate such files?
> When config.h.in triggers an errror it's usually a case of people
> abusing aclocal.m4.

I want to help in maintaining the statuses in Patchwork. I registered,
got `pwclient` [1] and set up `.pwclientrc`, which is of course
optional.

So regarding this patch. To what status should this be set to?

=C2=BBChanges Requested=C2=AB or =C2=BBUnder Review=C2=AB. I guess the firs=
t one and when
John updates the patch then to =C2=BBSuperseded=C2=AB?

	pwclient update -s "under review" 1514

This command should do the trick from the command line.


Thanks,

Paul


[1] http://patchwork.openembedded.org/help/pwclient/
[2] http://patchwork.openembedded.org/project/openembedded/pwclientrc/

--=-XyrPETU24csNXLRRkjcu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktbb1sACgkQPX1aK2wOHVjRnACdFA2yv/vZaKyILeZiSUqK2v/e
x9sAn1gUAIayiChX29UTfQqWED2sTw9p
=nvj7
-----END PGP SIGNATURE-----

--=-XyrPETU24csNXLRRkjcu--
