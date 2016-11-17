Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4A69965CC7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 18:09:09 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id o1so16876172ito.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 10:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=shJR1Pm1oCLmoTQSnJJp6hYPBJSs33t79HAHzuBOswU=;
	b=lhEGE0AjVj2LRH+aPI62V2IBKzWA6rPXqZSInKVE93+4L2nkWSkdCzMeSEJ2kF+E9V
	sneUMyrHoU4blwUgldhqlhYNOsdlV59S1ScS9ya3/2SbPoPSKiTv39Q0UmyQkDg1QW8r
	MErEHQhZfW1bmedbwlbQJMiQbeQ10wSFG4D4h8/Nnv13ko9KjXzHTPycMIfcyoj/1wqY
	PAkptEk1IyeXBwPNqem9cQEC8olPwLq+KhtUqtZdR03iknscq/FCpdwH8LY5h2ksptXV
	odqVC99FB/QxN0yyLysllpPjpvrT0k/oHVWx4viOIDsW07opUerkzYSWQ5nMvpp9WmgR
	HcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=shJR1Pm1oCLmoTQSnJJp6hYPBJSs33t79HAHzuBOswU=;
	b=NWRR/JqbqT2Q10JiYzXX3Nz2TjE99X4wOYuZTbaToJF2liXCz+gqyLla2B17Oq39/o
	85k3uq4PbojkvR26lDVBe/UdR5PpBKc3igGWQcJsA/DOGi8mJnDX9phbZJy9bjSj+x0B
	MpVclbvSut1K9nkDOBTEcPhPf7SqisqgtvWy4pF9CIBqu9k9mst7Yb0kyMDNmmuZ1rl/
	WB+0OpHmPBS6e/orP2hIQKNVy2qnrVneaNaa2bfokyUTah5RrcGDYDvlzA6MEy0o8Pvc
	JJwFmc3TolzJuGCe7StsoinZY9qihukIJiReENNuAcyZsYR277zkIvwYEKf5JlvNnZK4
	zV6Q==
X-Gm-Message-State: ABUngvfimHSHzUFP/V7Tyy3shNa92sLE1gR2mcIorWcAlTTbexp0shXfqWpF3lTYMs8ZLA==
X-Received: by 10.107.57.131 with SMTP id g125mr5137128ioa.108.1479406151503; 
	Thu, 17 Nov 2016 10:09:11 -0800 (PST)
Received: from CACSVMO-14452.local (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	i200sm5434967itb.0.2016.11.17.10.09.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Nov 2016 10:09:11 -0800 (PST)
To: openembedded-devel@lists.openembedded.org,
	=?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>
References: <1479404055-12584-1-git-send-email-jaragunde@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <d960264f-ef18-8875-cdfb-29a1b604ec87@gmail.com>
Date: Thu, 17 Nov 2016 10:09:09 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <1479404055-12584-1-git-send-email-jaragunde@igalia.com>
Cc: denis@eukrea.com, eric@eukrea.com, otavio@ossystems.com.br
Subject: Re: [meta-browser][PATCH 1/3] Set CHROMIUM_ENABLE_WAYLAND flag in chromium-wayland recipe
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
X-List-Received-Date: Thu, 17 Nov 2016 18:09:10 -0000
X-Groupsio-MsgNum: 63865
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="MvenT5itK9ft6tI7E5GqWWbResIUS3Np8"

--MvenT5itK9ft6tI7E5GqWWbResIUS3Np8
Content-Type: multipart/mixed; boundary="NWuWgOvD0M7TXugRF3jk8QBUJ2otwSjN2";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org,
 =?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>
Cc: denis@eukrea.com, otavio@ossystems.com.br, eric@eukrea.com
Message-ID: <d960264f-ef18-8875-cdfb-29a1b604ec87@gmail.com>
Subject: Re: [oe] [meta-browser][PATCH 1/3] Set CHROMIUM_ENABLE_WAYLAND flag
 in chromium-wayland recipe
References: <1479404055-12584-1-git-send-email-jaragunde@igalia.com>
In-Reply-To: <1479404055-12584-1-git-send-email-jaragunde@igalia.com>

--NWuWgOvD0M7TXugRF3jk8QBUJ2otwSjN2
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 11/17/16 9:34 AM, Jacobo Aragunde P=C3=A9rez wrote:
> It makes no sense to trigger a build of chromium-wayland and not
> enable CHROMIUM_ENABLE_WAYLAND, so we are doing it directly in the
> recipe now.
>=20
> We are allowed to remove some conditionals, now we know the value of
> the flag beforehand.
>=20
> Signed-off-by: Jacobo Aragunde P=C3=A9rez <jaragunde@igalia.com>
> ---
>  recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb | 11 +++++---=
---
>  1 file changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb b=
/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
> index bbba147..f66e77c 100644
> --- a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
> +++ b/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
> @@ -1,3 +1,5 @@
> +CHROMIUM_ENABLE_WAYLAND =3D "1"
> +
>  include chromium-browser.inc
> =20
>  DEPENDS +=3D "wayland libxkbcommon"
> @@ -21,15 +23,12 @@ SRC_URI[sha256sum] =3D "4ca4e2adb340b3fb4d502266ad7=
d6bda45fa3519906dbf63cce11a63f6
>  OZONE_WAYLAND_GIT_BRANCH =3D "Milestone-SouthSister"
>  OZONE_WAYLAND_GIT_SRCREV =3D "c605505044af3345a276abbd7c29fd53db1dea40=
"
> =20
> -SRC_URI +=3D "${@base_conditional('CHROMIUM_ENABLE_WAYLAND', '1', 'git=
://github.com/01org/ozone-wayland.git;destsuffix=3D${OZONE_WAYLAND_GIT_DE=
STSUFFIX};branch=3D${OZONE_WAYLAND_GIT_BRANCH};rev=3D${OZONE_WAYLAND_GIT_=
SRCREV} file://chromium-wayland/0006-Remove-GBM-support-from-wayland.gyp.=
patch', '', d)}"
> +SRC_URI +=3D "git://github.com/01org/ozone-wayland.git;destsuffix=3D${=
OZONE_WAYLAND_GIT_DESTSUFFIX};branch=3D${OZONE_WAYLAND_GIT_BRANCH};rev=3D=
${OZONE_WAYLAND_GIT_SRCREV} file://chromium-wayland/0006-Remove-GBM-suppo=
rt-from-wayland.gyp.patch"
> =20
>  # Component build is unsupported in ozone-wayland for Chromium 48
>  python() {
> -    if (d.getVar('CHROMIUM_ENABLE_WAYLAND', True) =3D=3D '1'):
> -        if bb.utils.contains('PACKAGECONFIG', 'component-build', True,=
 False, d):
> -            bb.fatal("Chromium 48 Wayland version cannot be built in c=
omponent-mode")
> -    else:
> -        raise bb.parse.SkipPackage("CHROMIUM_ENABLE_WAYLAND isn't enab=
led")
> +    if bb.utils.contains('PACKAGECONFIG', 'component-build', True, Fal=
se, d):
> +        bb.fatal("Chromium 48 Wayland version cannot be built in compo=
nent-mode")
>  }
> =20


you still need to skip parsing this recipe if user has not enabled waylan=
d


>  CHROMIUM_WAYLAND_GYP_DEFINES =3D "use_ash=3D1 use_aura=3D1 chromeos=3D=
0 use_ozone=3D1 use_xkbcommon=3D1"
>=20


--NWuWgOvD0M7TXugRF3jk8QBUJ2otwSjN2--

--MvenT5itK9ft6tI7E5GqWWbResIUS3Np8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgt8kUACgkQuwUzVZGdMxRdyACdGDTShZ5dah+jHnzOtysyQzAo
MOoAoIBUR7ZFf6fw6A46JlZ6ebViLflr
=N40K
-----END PGP SIGNATURE-----

--MvenT5itK9ft6tI7E5GqWWbResIUS3Np8--
