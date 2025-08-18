Return-Path: <andrey.z@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85066CA0EE4
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 07:40:26 +0000 (UTC)
Subject: Re: [meta-networking][PATCH] meta-networking: mbedtls: Remove tag from SRC_URI
To: openembedded-devel@lists.openembedded.org
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
X-Originating-Location: Heerbrugg, Saint Gallen, CH (193.8.40.126)
X-Originating-Platform: Windows Firefox 141
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 18 Aug 2025 00:40:20 -0700
References: <d698e473-a955-4f19-b0f4-6226ee1978f2@phytec.de>
In-Reply-To: <d698e473-a955-4f19-b0f4-6226ee1978f2@phytec.de>
Message-ID: <17834.1755502820247186023@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Aug 2025 07:40:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118992

Hello all,

On Sat, Aug 16, 2025 at 12:55 AM, Daniel Schultz wrote:

>
> Still the same error. I can also see this issue in our nightly builds=20
> and they're fetching from scratch.

FTR: I've also started to see the same parser error. It was also triggered =
in
the CI first, which is using clean builds and targeting `scarthgap` LTS.

Tag parameter in SRC_URI actually came with commit:
9fa57a47b3a0 ("mbedtls: upgrade 3.6.3 -> 3.6.3.1") on master as part of rec=
ipe
upgrade, and unfortunately had no reasonable explanation why this parameter
was included...

I've also tried to drop either `;tag=3D` parameter or `SRCREV` from the rec=
ipe,
and both options worked to solve the parser issue.

Is there any reasonable explanation why  `;tag=3D` parameter is now include=
d?

>=20
> - Daniel
>=20
> On 8/14/25 19:06, Khem Raj wrote:
> > I wonder why it works on autobuilder. Can you try with bitbake -ccleana=
ll ?

I do not think that this would help, as the error comes during parsing stag=
e,
which is far before task execution.

> > and see if fetching works. I can see the SRCREV is same as v3.6.4 tag.
> >
> > On Thu, Aug 14, 2025 at 3:51=E2=80=AFPM Daniel Schultz via
> > lists.openembedded.org <d.schultz=3Dphytec.de@lists.openembedded.org>
> > wrote:
> >> This recipe uses SRCREV as well as defines a tag in the SRC_URI.
> >> Only use SRCREV since this will generate an error.
> >>
> >> Fix following error:
> >>    [...] FetchError: Fetcher failure: Conflicting revisions
> >>    (c765c831e5c2a0971410692f92f7a81d6ec65ec2 from SRCREV and v3.6.4
> >>    from the url) found, please specify one valid value
> >>
> >> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> >> ---
> >>   meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.=
4.bb
> b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> >> index 88b50a406b..a0dc6a689a 100644
> >> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> >> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> >> @@ -23,7 +23,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D379d5819937a6c2f1ef1630d341e026d"
> >>   SECTION =3D "libs"
> >>
> >>   S =3D "${WORKDIR}/git"
> >> -SRC_URI =3D
> "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;branch=3Dmbedtl=
s-3.6;tag=3Dv${PV}
> \
> >> +SRC_URI =3D
> "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;branch=3Dmbedtl=
s-3.6 \
> >>              file://run-ptest \
> >>              "
> >>
> >> --
> >> 2.25.1
> >>
> >>
> >>=20
> >>
>=20
>

-- Andrey

