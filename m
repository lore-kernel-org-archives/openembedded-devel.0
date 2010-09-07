Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1Ot0Wx-0007D5-FW
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 17:56:20 +0200
Received: (qmail invoked by alias); 07 Sep 2010 15:48:57 -0000
Received: from 234.163.71-86.rev.gaoland.net (EHLO [192.168.1.71])
	[86.71.163.234]
	by mail.gmx.net (mp034) with SMTP; 07 Sep 2010 17:48:57 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX199D3Z1nF59R60GzPgGkZIr+iJcvZsdsOeoZTlc5l
	AQic1tuOfyuNJx
Message-ID: <4C865EE8.1030505@gmx.net>
Date: Tue, 07 Sep 2010 17:48:56 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1283842952-20249-1-git-send-email-raj.khem@gmail.com>
	<1283842952-20249-2-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1283842952-20249-2-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.22
X-SA-Exim-Mail-From: thebohemian@gmx.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] jaxme_0.5.2.bb, xpp3_1.1.3.4.O.bb: Remove do_stage_append
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
X-List-Received-Date: Tue, 07 Sep 2010 15:56:20 -0000
X-Groupsio-MsgNum: 23271
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig1D39FCBBC16B6B1CE2609E2B"

--------------enig1D39FCBBC16B6B1CE2609E2B
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

This as well.

Signed-off-by: Robert Schuster <robertschuster@fsfe.org>

Am 07.09.2010 09:02, schrieb Khem Raj:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes/xml-commons/jaxme_0.5.2.bb    |    7 -------
>  recipes/xml-commons/xpp3_1.1.3.4.O.bb |    4 ----
>  2 files changed, 0 insertions(+), 11 deletions(-)
>=20
> diff --git a/recipes/xml-commons/jaxme_0.5.2.bb b/recipes/xml-commons/j=
axme_0.5.2.bb
> index 4fa9cdf..304c06d 100644
> --- a/recipes/xml-commons/jaxme_0.5.2.bb
> +++ b/recipes/xml-commons/jaxme_0.5.2.bb
> @@ -39,13 +39,6 @@ do_install_append() {
>  	oe_jarinstall jaxmepm-${PV}.jar jaxmepm.jar
>  }
> =20
> -do_stage_append() {
> -	oe_jarinstall -s jaxmeapi-${PV}.jar jaxmeapi.jar
> -	oe_jarinstall -s jaxmejs-${PV}.jar jaxmejs.jar
> -	oe_jarinstall -s jaxmexs-${PV}.jar jaxmexs.jar
> -	oe_jarinstall -s jaxmepm-${PV}.jar jaxmepm.jar
> -}
> -
>  # Compile helper
>  # 1 - source dir
>  # 2 - dest dir
> diff --git a/recipes/xml-commons/xpp3_1.1.3.4.O.bb b/recipes/xml-common=
s/xpp3_1.1.3.4.O.bb
> index 11b82ab..40f7cb2 100644
> --- a/recipes/xml-commons/xpp3_1.1.3.4.O.bb
> +++ b/recipes/xml-commons/xpp3_1.1.3.4.O.bb
> @@ -42,10 +42,6 @@ do_install_append() {
>  	oe_jarinstall xpp3-xpath-${PV}.jar xpp3-xpath.jar
>  }
> =20
> -do_stage_append() {
> -	oe_jarinstall -s xpp3-xpath-${PV}.jar xpp3-xpath.jar
> -}
> -
>  FILES_libxpp3-xpath-java =3D "${datadir}/java/xpp3-xpath*"
> =20
> =20





--------------enig1D39FCBBC16B6B1CE2609E2B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAkyGXugACgkQG9cfwmwwEtpJtACeLdJHfKbWiKDFPK4ToERc0SRW
+pMAninP2ZM+5b5rT4Yt4caER59VqIcR
=AquY
-----END PGP SIGNATURE-----

--------------enig1D39FCBBC16B6B1CE2609E2B--
