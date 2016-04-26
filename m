Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id E4E28700F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 10:04:14 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id e201so103029047wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 03:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=TiYRwLgm0CxUXMnDAecZP8qSGLrygpwEp9aDgvGrErQ=;
	b=J6TAoGtXFo+1dhvJzWvBFl0FZ24BD/zAYyPlKfFYbGBR31Qq+gB+Z6p5htYJBY9Ijp
	I1Z+gRPF0ZQTxgA+6qw6zbN+QFXacCCAp888sQFqabZiSaxNyFIOa+t/69hNjh8IP2Fj
	OCeV5cvSVQCOdIDxa7bkXuozlK36sFurqkHWFuJ52Gri8hf/LpzM9g3GpYfTC8P4M+Uj
	qs1U4qNPEK0OkROjLWwB1x/aiII6E07bccHnpozZafxXWBn2/u0ziYAXqfyj73dStI9g
	yFgrco8RfOAgKkWbwdCrQ0SsUlX9dub5l+SzPeswdBEAq261rPfexJSI4B7LCI/SvTLp
	lMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=TiYRwLgm0CxUXMnDAecZP8qSGLrygpwEp9aDgvGrErQ=;
	b=HRGbcWZcUvWXuNVWJsuzgbRG8NSV5KtN1GzrlpCzd07oBHIkJ0A6Ygu6LBsyO3x8aT
	8Wc4KEER2EgVkl+QknEYc+7w3p51i1/9LmkPoF30Pa1eykVhwH9uSV7yWENvlJ0STbkL
	nGbFk69obDpfMHmq8fqxDZZzSa0vdnOGqoTnifTgQimLcrzjV/cDT4xzib86ey0meVPa
	5gSj55KzqPBCZVQxCdwr6Z8+gv9drxnpZAXOZyTxQjfB/0fYi4Kx9xTbUn/uDr6i4HrH
	kR4j2s9j72LSL9TzB1CiW2AX/qAxO/Ffkj5FMemvlphkVGx7GpbhC+yYNWeuJ8huNdK5
	l+vA==
X-Gm-Message-State: AOPr4FWeoqwxlCgLoV2kz3yRuAaMO+s5MKFMD/PPa/aZrsp2q3xQBeiUJTg2T5d1T6h1iQ==
X-Received: by 10.194.164.228 with SMTP id yt4mr2299012wjb.64.1461665054355;
	Tue, 26 Apr 2016 03:04:14 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	cf6sm28106570wjc.12.2016.04.26.03.04.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Apr 2016 03:04:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 26 Apr 2016 12:04:30 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160426100430.GA2559@jama>
References: <1461160262-4752-1-git-send-email-samuli.piippo@qt.io>
MIME-Version: 1.0
In-Reply-To: <1461160262-4752-1-git-send-email-samuli.piippo@qt.io>
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: [meta-qt5][PATCH] qt5: Allow disabling SHA validation for branch
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
X-List-Received-Date: Tue, 26 Apr 2016 10:04:17 -0000
X-Groupsio-MsgNum: 61173
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline

--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2016 at 04:51:02PM +0300, Samuli Piippo wrote:
> Qt releases are done from a release branch (5.x.x), which is later merged
> back to a stable branch (5.x) and then removed. When a recipe is updated
> to use the released SHA from the release branch, it will eventually break
> when the release branch is removed. This happens because bitbake tries to
> validate that given SHA is found from the given branch. Add additional
> variable that can be used to disable the SHA check when branch is known
> to be later removed, but SHA remains valid.
>=20
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> ---
>  recipes-qt/qt5/qt5-git.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
> index 8a6d93e..1805551 100644
> --- a/recipes-qt/qt5/qt5-git.inc
> +++ b/recipes-qt/qt5/qt5-git.inc
> @@ -3,10 +3,11 @@
> =20
>  QT_MODULE ?=3D "${BPN}"
>  QT_MODULE_BRANCH ?=3D "5.6"
> +QT_MODULE_NOBRANCH ?=3D "0"

Why not put whole ";nobranch=3D1" here (and empty by default) to keep the S=
RC_URI shorter for
recipe versions which don't have this issue?

Or even
QT_MODULE_BRANCH_PARAM =3D "branch=3D${QT_MODULE_BRANCH}"

which your recipes can replace with nobranch=3D1 and SRC_URI will stay
simple:

${QT_GIT}/${QT_MODULE}.git;name=3D${QT_MODULE};${QT_MODULE_BRANCH_PARAM};pr=
otocol=3D${QT_GIT_PROTOCOL}

>  # each module needs to define valid SRCREV
>  SRC_URI =3D " \
> -    ${QT_GIT}/${QT_MODULE}.git;name=3D${QT_MODULE};branch=3D${QT_MODULE_=
BRANCH};protocol=3D${QT_GIT_PROTOCOL} \
> +    ${QT_GIT}/${QT_MODULE}.git;name=3D${QT_MODULE};nobranch=3D${QT_MODUL=
E_NOBRANCH};branch=3D${QT_MODULE_BRANCH};protocol=3D${QT_GIT_PROTOCOL} \
>  "
> =20
>  S =3D "${WORKDIR}/git"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcfPS0ACgkQN1Ujt2V2gBx6VQCeKgpNDXSjrzrmGdFTl8h4OMqR
yyIAmQEO6qSMq4tiEEQgXgFUx10xG2nv
=bmud
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--
