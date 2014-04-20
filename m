Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 51A8F65D47
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 09:04:22 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e49so2850429eek.39
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 02:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3ZvkuOQD5YfVezGEGCMFnWYkOip3EHtf1caTSl+xdL0=;
	b=Xsar42jyEHakzq6noNx+dm79Uz1jpkI2H6AFqqXbsmRtRxGLeFatePk1cTulld8ugI
	niYk5Hcz+2fE+/GdCq6c7HHNAPYuSuMB18XDin3YOIT526QUcYGGF1oMmrFtZ71Jedvf
	rWFKGmnHPpZ6Sx1fANCsl5K3ZY9Q5Jy2xzrc5U9g0u6fiAVvsn/4aCXO9RI1tMhEBCCM
	9tdLif/x/8Xzb2sNVEmhgFtLAEtVK83hAmhHfUtP9lqPNedyrVyCMOhWPpc+Uy/q62rA
	B2PJCVEcEIxONl6IfTcehtnusvb7L8j+U/oWkmNGtheA/fF1lKuw2CAJrHpdf0dnufFP
	m0FQ==
X-Received: by 10.15.61.133 with SMTP id i5mr18854eex.80.1397984663235;
	Sun, 20 Apr 2014 02:04:23 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	44sm92847255eek.30.2014.04.20.02.04.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Apr 2014 02:04:22 -0700 (PDT)
Date: Sun, 20 Apr 2014 11:04:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Message-ID: <20140420090427.GP2486@jama>
References: <1396323568-18135-1-git-send-email-trevor.woerner@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1396323568-18135-1-git-send-email-trevor.woerner@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org, patches@linaro.org
Subject: Re: [meta-oe][PATCH 0/4] 'gtkmathview' fix for SOBBW (2014-03-29)
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
X-List-Received-Date: Sun, 20 Apr 2014 09:04:25 -0000
X-Groupsio-MsgNum: 49297
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aC33ObtQAkNdOZ6b"
Content-Disposition: inline

--aC33ObtQAkNdOZ6b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2014 at 11:39:24PM -0400, Trevor Woerner wrote:
> Hi Martin,
>=20
> Here is a fix for your "State of bitbake world, Failed tasks 2014-03-29".=
 This
> patch set provides fixes and some clean-up for the gtkmathview package.

First 3 merged together with asio patch, thanks!

>=20
> Best regards,
>     Trevor
>=20
> Trevor Woerner (4):
>   gtkmathview: fix B!=3DS
>   gtkmathview: fix qa issue
>   gtkmathview: fix build error
>   gtkmathview: run through oe-stylize.py
>=20
>  .../mml-widget/gtkmathview/qualify-lookup.diff              | 13 +++++++=
++++++
>  meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb    |  9 +++----=
--
>  2 files changed, 16 insertions(+), 6 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/mml-widget/gtkmathview/quali=
fy-lookup.diff
>=20
> --=20
> 1.9.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aC33ObtQAkNdOZ6b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNTjZsACgkQN1Ujt2V2gBwL1ACfSFSgJQv2GfbNzujFESys2tU2
0e0An0hCvL6jFXNXKnnK47SjOYQYQwW2
=lWK0
-----END PGP SIGNATURE-----

--aC33ObtQAkNdOZ6b--
