Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1Ot0Wn-00078Z-5s
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 17:56:13 +0200
Received: (qmail invoked by alias); 07 Sep 2010 15:48:49 -0000
Received: from 234.163.71-86.rev.gaoland.net (EHLO [192.168.1.71])
	[86.71.163.234]
	by mail.gmx.net (mp043) with SMTP; 07 Sep 2010 17:48:49 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+Pu1ES9HiPQ2efikTKV1+HJC6KFBdSW1zl+9FDcv
	oKNCuTfxlHPUf4
Message-ID: <4C865EDC.4080807@gmx.net>
Date: Tue, 07 Sep 2010 17:48:44 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1283842952-20249-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1283842952-20249-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.23
X-SA-Exim-Mail-From: thebohemian@gmx.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] java-library.bbclass: do_stage is not needed anymore
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
X-List-Received-Date: Tue, 07 Sep 2010 15:56:13 -0000
X-Groupsio-MsgNum: 23270
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig3C777F5941FDF07D46DE11C7"

--------------enig3C777F5941FDF07D46DE11C7
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Patch is fine!

Signed-off-by: Robert Schuster <robertschuster@fsfe.org>

Am 07.09.2010 09:02, schrieb Khem Raj:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  classes/java-library.bbclass |    4 ----
>  1 files changed, 0 insertions(+), 4 deletions(-)
>=20
> diff --git a/classes/java-library.bbclass b/classes/java-library.bbclas=
s
> index 904b4f1..5ce0537 100644
> --- a/classes/java-library.bbclass
> +++ b/classes/java-library.bbclass
> @@ -65,7 +65,3 @@ do_install() {
>  java_stage() {
>    oe_jarinstall -s ${JARFILENAME} ${ALTJARFILENAMES}
>  }
> -
> -do_stage() {
> -  java_stage
> -}





--------------enig3C777F5941FDF07D46DE11C7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAkyGXt8ACgkQG9cfwmwwEtourwCfUZFBq6caHTGjwQEy0RfjhOy8
sbIAnjfFzqxGSPK0jFMKLYH8AVZHzFRu
=QT5S
-----END PGP SIGNATURE-----

--------------enig3C777F5941FDF07D46DE11C7--
