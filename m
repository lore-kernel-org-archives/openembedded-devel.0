Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 0D9427F7E2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 17:55:10 +0000 (UTC)
IronPort-SDR: xRwlVTRWhJEJRK2xDb4g7rrQfCOLhYdu9CpDe/9U8L6oIXHvv4YXtLd+stHqrvalw22zh5hmih
	4oCwfSHkroLbkf1LSwOu7hjKZ+P9cI9hKipRkXtkpfj1KcDWc0GsdLzT0xu+Ygk4m2y5mhvtOT
	OweF1XltKQ9VdLTqhvnkpaE8M2U04y7ueS7JRrRk+meeo1c7xPdADHyJcOdri4Vy055a0wO/IC
	2hi4LjlccWA73OAW7oorIxuhAZuLZZY9jp8vU90pzHwr7vACkO6Jna8V/FAabMFs1UrYyGaY7D
	2aU=
X-IronPort-AV: E=Sophos;i="5.70,362,1574118000"; 
   d="scan'208";a="4631336"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][master][zeus][PATCH] gitpkgv.bbclass: Add support
	for extending the supported tag formats
Thread-Index: AQHVzXaRR88IE1JGGkmVv3BrRvrBIqf7tg0A
Date: Sat, 25 Jan 2020 17:55:09 +0000
Message-ID: <ad30e13710014de5837638701dff67e5@XBOX03.axis.com>
References: <20200117203421.4944-1-pkj@axis.com>
In-Reply-To: <20200117203421.4944-1-pkj@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [meta-oe][master][zeus][PATCH] gitpkgv.bbclass: Add support	for extending the supported tag formats
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 25 Jan 2020 17:55:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please cherry-pick this to zeus.

//Peter

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
> devel-bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 17 januari 2020 21:34
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][master][zeus][PATCH] gitpkgv.bbclass: Add support
> for extending the supported tag formats
>=20
> Introduce GITPKGV_TAG_REGEXP (which defaults to "v(\d.*)") to support
> dropping other unwanted parts of the found tags than just a leading
> "v". Any matching groups in the regexp will be concatenated to yield
> the final version.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>=20
> In our case, the tags looks like either R1.2.3 or IR1.2.3-4, so we
> want to use GITPKGV_TAG_REGEXP =3D "(?:[vR]|IR)(\d.*)" to drop our
> prefixes.
>=20
>  meta-oe/classes/gitpkgv.bbclass | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-
> oe/classes/gitpkgv.bbclass
> index ab591bd45..180421ed3 100644
> --- a/meta-oe/classes/gitpkgv.bbclass
> +++ b/meta-oe/classes/gitpkgv.bbclass
> @@ -40,10 +40,16 @@
>  GITPKGV =3D "${@get_git_pkgv(d, False)}"
>  GITPKGVTAG =3D "${@get_git_pkgv(d, True)}"
>=20
> -def gitpkgv_drop_tag_prefix(version):
> +# This regexp is used to drop unwanted parts of the found tags. Any
> matching
> +# groups will be concatenated to yield the final version.
> +GITPKGV_TAG_REGEXP ??=3D "v(\d.*)"
> +
> +def gitpkgv_drop_tag_prefix(d, version):
>      import re
> -    if re.match("v\d", version):
> -        return version[1:]
> +
> +    m =3D re.match(d.getVar('GITPKGV_TAG_REGEXP'), version)
> +    if m:
> +        return ''.join(group for group in m.groups() if group)
>      else:
>          return version
>=20
> @@ -105,7 +111,7 @@ def get_git_pkgv(d, use_tags):
>                          output =3D bb.fetch2.runfetchcmd(
>                              "git --git-dir=3D%(repodir)s describe %(rev)=
s -
> -tags --exact-match 2>/dev/null"
>                              % vars, d, quiet=3DTrue).strip()
> -                        ver =3D gitpkgv_drop_tag_prefix(output)
> +                        ver =3D gitpkgv_drop_tag_prefix(d, output)
>                      except Exception:
>                          ver =3D "0.0-%s-g%s" % (commits, vars['rev'][:7]=
)
>                  else:
> --
> 2.21.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

