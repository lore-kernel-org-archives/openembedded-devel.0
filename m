Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 56B35731DC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 19:24:04 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id u188so111242780wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2016 11:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dlc/tDtNNPR0CQPWJs6o6Dp94rTAVUmSjtaRfvevRgw=;
	b=jFKAb//IadYd8e9ummKBcZGbqXR2oeWEvjvY+eKATMItv8w1sVt0LS3KmuBmHKFEUr
	z+xMo0SF1HsnBmclqJpmBrx9IRaf9ffBFn48I1kw1V0Y+cpEdVnfMytv5UFhcx0Ax3pn
	17QXb1MFxuQffxc/5gXD1K5zepwFXVBL+N8AkRKGHqctPcksnSN//3Af2ShXQ6bbdZvC
	a7CCxT9PwbfWpNoPXuRQXocFfywuK6RpliP7jUeClpjqmlXwUMK7eHNSaRHzrdLWP9c4
	VwDVG+GwS3axp5fdeY/TSBbSo1SJT48CfoapdZPvx2AEWL8pKUaFxi1AgdylFaehdX1T
	L/SA==
X-Received: by 10.194.77.137 with SMTP id s9mr53913460wjw.171.1452194645174;
	Thu, 07 Jan 2016 11:24:05 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	wx2sm13613253wjc.27.2016.01.07.11.24.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jan 2016 11:24:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 7 Jan 2016 20:24:29 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160107192429.GG2512@jama>
References: <1452186388-6796-1-git-send-email-moritz.fischer@ettus.com>
MIME-Version: 1.0
In-Reply-To: <1452186388-6796-1-git-send-email-moritz.fischer@ettus.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] gpsd: Add patch to fix broken ACTIVATE hook.
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
X-List-Received-Date: Thu, 07 Jan 2016 19:24:05 -0000
X-Groupsio-MsgNum: 59410
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kjpMrWxdCilgNbo1"
Content-Disposition: inline

--kjpMrWxdCilgNbo1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 07, 2016 at 09:06:28AM -0800, Moritz Fischer wrote:
> This patch is already in mainline gpsd. It fixes a

Please add Upstream-Status: Backport inside the .patch file to make it
clear.

> bug where the ACTIVATE hook for a device never gets
> called.
>=20
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
>  ...e-Fix-issue-with-ACTIVATE-hook-not-being-.patch | 32 ++++++++++++++++=
++++++
>  meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb       |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-libgps=
d-core-Fix-issue-with-ACTIVATE-hook-not-being-.patch
>=20
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-libgpsd-core-=
Fix-issue-with-ACTIVATE-hook-not-being-.patch b/meta-oe/recipes-navigation/=
gpsd/gpsd-3.14/0001-libgpsd-core-Fix-issue-with-ACTIVATE-hook-not-being-.pa=
tch
> new file mode 100644
> index 0000000..ce971de
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.14/0001-libgpsd-core-Fix-iss=
ue-with-ACTIVATE-hook-not-being-.patch
> @@ -0,0 +1,32 @@
> +From 6ff099b1ba8de74df9ddeb61e3825264b96ef692 Mon Sep 17 00:00:00 2001
> +From: Moritz Fischer <moritz.fischer@ettus.com>
> +Date: Tue, 22 Dec 2015 19:38:31 -0800
> +Subject: [PATCH] libgpsd-core: Fix issue with ACTIVATE hook not being ca=
lled.
> +
> +In the current system session->mode seemed to ignore the
> +O_OPTIMIZE flag, leading to the ACTIVATE hook being ignored.
> +
> +Another way to fix this would be to keep the session->mode
> +condition pull up the check for O_CONTINUE.
> +
> +Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> +---
> + libgpsd_core.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libgpsd_core.c b/libgpsd_core.c
> +index 31fec2a..a84e85f 100644
> +--- a/libgpsd_core.c
> ++++ b/libgpsd_core.c
> +@@ -543,7 +543,7 @@ int gpsd_open(struct gps_device_t *session)
> + int gpsd_activate(struct gps_device_t *session, const int mode)
> + /* acquire a connection to the GPS device */
> + {
> +-    if (session->mode =3D=3D O_OPTIMIZE)
> ++    if (mode =3D=3D O_OPTIMIZE)
> + 	gpsd_run_device_hook(&session->context->errout,
> + 			     session->gpsdata.dev.path, "ACTIVATE");
> +     session->gpsdata.gps_fd =3D gpsd_open(session);
> +--=20
> +2.4.3
> +
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/recip=
es-navigation/gpsd/gpsd_3.14.bb
> index 6ae2f30..646360c 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> @@ -16,6 +16,7 @@ SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz=
 \
>      file://0002-Add-a-test-for-C11-and-check-we-have-C11-before-usin.pat=
ch \
>      file://0003-Whoops-check-for-C11-not-for-not-C11-in-stdatomic.h-.pat=
ch \
>      file://0001-Include-stdatomic.h-only-in-C-mode.patch \
> +    file://0001-libgpsd-core-Fix-issue-with-ACTIVATE-hook-not-being-.pat=
ch \
>      file://gpsd-default \
>      file://gpsd \
>      file://60-gpsd.rules \
> --=20
> 2.4.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kjpMrWxdCilgNbo1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaOu2wACgkQN1Ujt2V2gBykGACguPQ7MQFYldFR/0JrVv2gC/au
4/sAoImIIMdGanfxoT8Gs2GuPDkib83v
=M/r7
-----END PGP SIGNATURE-----

--kjpMrWxdCilgNbo1--
