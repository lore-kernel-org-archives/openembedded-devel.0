Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OtSV9-0002of-BA for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 23:48:20 +0200
Received: from g225141153.adsl.alicedsl.de ([92.225.141.153]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OtSUU-000253-ME for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 21:47:38 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1283969035-1397-1-git-send-email-chase.maupin@ti.com>
References: <1283969035-1397-1-git-send-email-chase.maupin@ti.com>
Date: Wed, 08 Sep 2010 23:47:35 +0200
Message-ID: <1283982455.21233.48.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] common_use_cases: add description of SOC_FAMILY
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
X-List-Received-Date: Wed, 08 Sep 2010 21:48:21 -0000
X-Groupsio-MsgNum: 23350
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-DRPmp27HAgf1NSxq1gVw"

--=-DRPmp27HAgf1NSxq1gVw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 08.09.2010, 13:03 -0500 schrieb Chase Maupin:
> * Added a description of the SOC_FAMILY variable that
>   can be set in the machine configuration files.
>=20
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> ---
>  docs/usermanual/chapters/common_use_cases.xml |   24 +++++++++++++++++++=
+++++
>  1 files changed, 24 insertions(+), 0 deletions(-)
>=20
> diff --git a/docs/usermanual/chapters/common_use_cases.xml b/docs/userman=
ual/chapters/common_use_cases.xml
> index d86d0ca..ef81b95 100644
> --- a/docs/usermanual/chapters/common_use_cases.xml
> +++ b/docs/usermanual/chapters/common_use_cases.xml
> @@ -94,6 +94,30 @@ SRCDATE =3D "20061014"
>          </listitem>
>        </itemizedlist></para>
> =20
> +    <para>There are also some optional variables that can be defined:
> +    <itemizedlist>
> +    <listitem>
> +          <para><command>SOC_FAMILY</command> describes a family of proc=
essors
> +            that all share common features such as kernel versions,
> +            bootloaders, etc.  This is used to allow overrides for a who=
le

I think a full stop is required even if there is an abbreviation in
front of it. =E2=86=92 etc..

[=E2=80=A6]

With this fixed:

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks for improving the documentation,

Paul

--=-DRPmp27HAgf1NSxq1gVw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyIBHcACgkQPX1aK2wOHVgE4gCfXIcto9lHdaGOjElZKxSJnflZ
wkEAn3kqHBk3bRfn3pwfo3gfB4otVZcl
=RguM
-----END PGP SIGNATURE-----

--=-DRPmp27HAgf1NSxq1gVw--
