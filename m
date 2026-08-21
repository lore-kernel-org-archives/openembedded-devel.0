Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD1CC5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 05:03:20 +0000 (UTC)
Subject: Re: [meta-virtualization][PATCH] go-logrus: correct CVE_PRODUCT mapping
To: openembedded-devel@lists.openembedded.org
From: "Devansh Patel" <devanshp@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 151
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 20 Aug 2026 22:03:11 -0700
References: <20260820093753.43396-1-devanshp@cisco.com>
In-Reply-To: <20260820093753.43396-1-devanshp@cisco.com>
Message-ID: <2326395.1787288591759544747@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="qiJsKfX2NLmglM63dAUY"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 05:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129411

--qiJsKfX2NLmglM63dAUY
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 03:07 PM, Devansh Patel wrote:

>=20
> From: Devansh Patel <devanshp@cisco.com>
>=20
> The default "go-logrus" product does not match the packaged Logrus
> identity in NVD, so its CVE records are not associated with the recipe.
>=20
> Use "turbopuffer:logrus", the exact NVD identity for the
> github.com/sirupsen/logrus source.
>=20
> Signed-off-by: Devansh Patel <devanshp@cisco.com>
> ---
> recipes-devtools/go/go-logrus_git.bb | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/recipes-devtools/go/go-logrus_git.bb
> b/recipes-devtools/go/go-logrus_git.bb
> index 7b9e31a5..4f8a255e 100644
> --- a/recipes-devtools/go/go-logrus_git.bb
> +++ b/recipes-devtools/go/go-logrus_git.bb
> @@ -12,6 +12,8 @@ SRC_URI =3D
> "git://${PKG_NAME};branch=3Dmaster;protocol=3Dhttps"
> SRCREV =3D "a29884b9be3dc22c18338c0fe5a51d23e69731e4"
> PV =3D "1.9.4+git"
>=20
> +CVE_PRODUCT =3D "turbopuffer:logrus"
> +
> inherit meta-virt-depreciated-warning
>=20
> do_install() {
> --
> 2.35.6

Hi,
Please ignore this patch, as it was mistakenly submitted to the wrong layer=
 mailing list. Apologies for the mix-up!

Regards,
Devansh

--qiJsKfX2NLmglM63dAUY
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Thu, Aug 20, 2026 at 03:07 PM, Devansh Patel wrote:</div>
<div>
<blockquote>From: Devansh Patel &lt;devanshp@cisco.com&gt;<br /><br />The d=
efault "go-logrus" product does not match the packaged Logrus identity in N=
VD, so its CVE records are not associated with the recipe.<br /><br />Use "=
turbopuffer:logrus", the exact NVD identity for the github.com/sirupsen/log=
rus source.<br /><br />Signed-off-by: Devansh Patel &lt;devanshp@cisco.com&=
gt;<br />---<br />recipes-devtools/go/go-logrus_git.bb | 2 ++<br />1 file c=
hanged, 2 insertions(+)<br /><br />diff --git a/recipes-devtools/go/go-logr=
us_git.bb b/recipes-devtools/go/go-logrus_git.bb<br />index 7b9e31a5..4f8a2=
55e 100644<br />--- a/recipes-devtools/go/go-logrus_git.bb<br />+++ b/recip=
es-devtools/go/go-logrus_git.bb<br />@@ -12,6 +12,8 @@ SRC_URI =3D "git://$=
{PKG_NAME};branch=3Dmaster;protocol=3Dhttps"<br />SRCREV =3D "a29884b9be3dc=
22c18338c0fe5a51d23e69731e4"<br />PV =3D "1.9.4+git"<br /><br />+CVE_PRODUC=
T =3D "turbopuffer:logrus"<br />+<br />inherit meta-virt-depreciated-warnin=
g<br /><br />do_install() {<br />-- <br />2.35.6</blockquote>
</div>
<div>Hi,<br />Please ignore this patch, as it was mistakenly submitted to t=
he wrong layer mailing list. Apologies for the mix-up!<br /><br />Regards,<=
br />Devansh</div>

--qiJsKfX2NLmglM63dAUY--

