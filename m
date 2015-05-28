Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 14C9565D6E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 00:53:04 +0000 (UTC)
Received: by pdea3 with SMTP id a3so28844165pde.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 17:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=RCngjZPtpWe3fy7a5QeuA3rHv+SdBlgAywxh46MtmYw=;
	b=JfUbej1MBHblyCvVMxJko5bwUCB7+4zdw3xCLh3Cb55viWs7iZycTXMBFIpNzcxhwg
	IhTpjwbyPGxBVjPWsgBfGtwQCkgABG8ZdcI3fUybRmzsvHHYXoVhk4n6BauNS2YB5zdM
	85MTZ89ko24PhRtZdKQXCvT3Cagf2JxBlUY/xu94mFVtvSUvQL+mtwaYZ4MxuU+Rstcz
	c3i2pLDlofmbSRjH1x3dkm9NFPcEFOVsvbmcvB1ueMd3DTBi1yLdZzc1oQimxkipqSdV
	h8/In160NX0AXh6B/bWd6WbALKzPr7HooHOjmQqut/16aYnND+x7QPjpQgujLwHJDCf/
	zAKg==
X-Received: by 10.66.101.9 with SMTP id fc9mr227248pab.37.1432774385813;
	Wed, 27 May 2015 17:53:05 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:90eb:a06b:3186:ca08?
	([2601:9:3580:84c:90eb:a06b:3186:ca08])
	by mx.google.com with ESMTPSA id pr5sm359873pbc.63.2015.05.27.17.53.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 May 2015 17:53:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAAzKXnhRDirDffx7krgxbCjgjWV2pORdB8g2c7csohzkjp_hqQ@mail.gmail.com>
Date: Wed, 27 May 2015 17:53:00 -0700
Message-Id: <79A6FDE8-B52C-4A3F-9F26-7CF27EE17568@gmail.com>
References: <CAAzKXnhRDirDffx7krgxbCjgjWV2pORdB8g2c7csohzkjp_hqQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2098)
Subject: Re: [meta-browser] [PATCH 1/2] chromium, cef: Fix install path for cef library
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 May 2015 00:53:05 -0000
X-Groupsio-MsgNum: 55671
Content-Type: multipart/signed;
	boundary="Apple-Mail=_EDF963FB-E932-40C6-9523-A0776552DA19";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_EDF963FB-E932-40C6-9523-A0776552DA19
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

this change is ok

> On May 27, 2015, at 10:36 AM, Zoltan Kuscsik =
<zoltan.kuscsik@linaro.org> wrote:
>=20
> Wrong location of cef caused QA errors.
>=20
> Change-Id: I56743864f9e7d47e7c87fb26c478cd812d5d6961
> Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
> ---
> recipes-browser/chromium/chromium.inc | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-browser/chromium/chromium.inc
> b/recipes-browser/chromium/chromium.inc
> index 377e685..cd8bfb5 100644
> --- a/recipes-browser/chromium/chromium.inc
> +++ b/recipes-browser/chromium/chromium.inc
> @@ -44,7 +44,7 @@ do_install() {
>                install -Dm 0755 =
${B}/out/${CHROMIUM_BUILD_TYPE}/cefsimple
> ${D}${bindir}/${BPN}/cefsimple
>        fi
>        if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/lib/libcef.so" ]; then
> -               install -Dm 0755
> ${B}/out/${CHROMIUM_BUILD_TYPE}/lib/libcef.so =
${D}${bindir}/lib/libcef.so
> +               install -Dm 0755
> ${B}/out/${CHROMIUM_BUILD_TYPE}/lib/libcef.so =
${D}${libdir}/${BPN}/libcef.so
>        fi
>        if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/chrome" ]; then
>                install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/chrome
> ${D}${bindir}/${BPN}/chrome
> --
> 1.9.1
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_EDF963FB-E932-40C6-9523-A0776552DA19
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVmZu8ACgkQuwUzVZGdMxSo2QCfYT9k8w2fGdTs68rfwftWMHPs
iXwAnjQQFYb/nFzaxRqJYWNgcd/V3F44
=LLS3
-----END PGP SIGNATURE-----

--Apple-Mail=_EDF963FB-E932-40C6-9523-A0776552DA19--
