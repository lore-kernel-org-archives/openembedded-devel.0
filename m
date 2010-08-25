Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1OoA7i-0004gi-0o
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 09:10:27 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OoA7B-00062A-PY from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 00:09:42 -0700
Received: from 137.202.157.210 ([137.202.157.210]) by eu2-mail.mgc.mentorg.com
	([137.202.76.30]) via Exchange Front-End Server
	webmail.mentor.com ([192.94.38.218]) with Microsoft Exchange
	Server HTTP-DAV ; Wed, 25 Aug 2010 07:09:40 +0000
Received: from pkl-fusman-ubuntu by webmail.mentor.com;
	25 Aug 2010 12:13:25 +0500
From: Fahad <Fahad_Usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1282717481-18836-1-git-send-email-fahad_usman@mentor.com>
References: <1282717481-18836-1-git-send-email-fahad_usman@mentor.com>
Organization: Mentor Graphics
Date: Wed, 25 Aug 2010 12:13:25 +0500
Message-ID: <1282720405.3332.27.camel@pkl-fusman-ubuntu>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_00,
	RCVD_NUMERIC_HELO autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] (withdrawn) kakasi-native_2.3.4.bb: Removed legacy style staging
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
X-List-Received-Date: Wed, 25 Aug 2010 07:10:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, i want to withdraw this patch and will submit the updated patch
shortly.

Thanks,
Fahad

On Wed, 2010-08-25 at 11:24 +0500, Fahad Usman wrote:
> From: Fahad <fahad@pkl-fusman-ubuntu.(none)>
>=20
> * converted do_stage to do_install
>=20
> * replaced ${STAGING_BINDIR} with ${D}${bindir}
>=20
> * added PR =3D "r1"
>=20
> * added NATIVE_INSTALL_WORKS =3D "1"
>=20
> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> ---
>  recipes/kakasi/kakasi-native_2.3.4.bb |    9 ++++++---
>  1 files changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes/kakasi/kakasi-native_2.3.4.bb b/recipes/kakasi/kakas=
i-native_2.3.4.bb
> index 24d4e1d..447b452 100644
> --- a/recipes/kakasi/kakasi-native_2.3.4.bb
> +++ b/recipes/kakasi/kakasi-native_2.3.4.bb
> @@ -2,11 +2,14 @@ require kakasi.inc
> =20
>  inherit native
> =20
> -do_stage() {
> -        install src/mkkanwa ${STAGING_BINDIR}
> -}
> +PR =3D "r1"
> =20
> +do_install() {
> +        install -d ${D}${bindir}
> +        install src/mkkanwa ${D}${bindir}
> +}
> =20
> +NATIVE_INSTALL_WORKS =3D "1"
> =20
>  SRC_URI[md5sum] =3D "4eff51aafbd56c9635791a20c03efa8f"
>  SRC_URI[sha256sum] =3D "c272560f5c11fe45b011c4e26ada66218fb0109d5582c587=
6aa49c5e24718534"



