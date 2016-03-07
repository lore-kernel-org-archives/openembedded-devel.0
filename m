Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 16E2870018
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Mar 2016 12:08:44 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id l68so82821135wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Mar 2016 04:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=062plEhdfGcVNsb4yGlrmhXmlAw904C0zJo4x0rQDy8=;
	b=j5ZwwOkGM0WprahEa1qvLhYiM7UGMV1W9WOsCzeb0Hdq4OAEu4eVHTGYfuD2NmgaOj
	fj0dKCbtQwJRV358ts9OyQukp/eol5rrAcLdHQvwmGQd3QyVmObG6owluA1szT473fBI
	MWLMqF0ljY4b+pbGwxlWwwsFKgAj+ItNVAdQzabFzne/G1EJP0OroyWsxfOoAU3VLGg3
	ApPHcDFuABGjYVg7xbG9O4xtAIFQG8OBPYTwCnTiFtHijEfzzJNFfaxZRMlGlgaxp1v6
	VLpxS6WNnRSOzHVo0PHAJwrrQNbcPoyvHJ0UfqF0CuBoAmlAwpd7ajF/vm2PW8mhFCAq
	E/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=062plEhdfGcVNsb4yGlrmhXmlAw904C0zJo4x0rQDy8=;
	b=b7Qi+Nl9yX4NfIoxx3oNj+2TuHdBF3l2/Cc7O97DGqNQt+7lSN/vBKG6tMYhXNh0mn
	cBWM3xmB7be5wxI2JfO4XFZLRmsXsZLzedpbpRDl6q1gwz7BV2gGmjuOckaX5t5VRKNZ
	MzlFFUp1S8W/CtPhx6mfHAlPCJV0Nb8+eYJ/+DowaOMXsKyxyT+GjnS+l6J/zMdvLrcG
	h0WaAxjm6JWrzSG79yB+HgG/aHruanLyfQKCbNvpENAtN5Q0XAIrordLN1htdeuDJ+VF
	eLmSLot9hPOC7LLGenu/ZXwaBZIn+PxBYb8qCNXSBlcmQTqnJdHC7mMSLydyCqyRxjvo
	4iHg==
X-Gm-Message-State: AD7BkJJJ3FtjvLWsW0VNtQrmwxyjAo7ooUiOX6HSWO9wOqla+iWVdMh+y53c/kcF11dCQg==
X-Received: by 10.194.57.16 with SMTP id e16mr22522075wjq.105.1457352524574;
	Mon, 07 Mar 2016 04:08:44 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	av3sm17670843wjc.44.2016.03.07.04.08.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Mar 2016 04:08:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 7 Mar 2016 13:11:11 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160307121111.GD2549@jama>
References: <1456818214-5466-1-git-send-email-teemu.holappa@theqtcompany.com>
MIME-Version: 1.0
In-Reply-To: <1456818214-5466-1-git-send-email-teemu.holappa@theqtcompany.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-qt5][PATCH] Change dependency from virtual/mesa to drm in the kms packageconfig.
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
X-List-Received-Date: Mon, 07 Mar 2016 12:08:47 -0000
X-Groupsio-MsgNum: 60363
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4zI0WCX1RcnW9Hbu"
Content-Disposition: inline

--4zI0WCX1RcnW9Hbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2016 at 09:43:34AM +0200, Teemu Holappa wrote:
> In some configurations there no provider for virtual/mesa, but only drm l=
ibaries.

NAK

Missing SOB line and summary doesn't follow
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

> ---
>  recipes-qt/qt5/qtbase_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index bf56741..1d32a0b 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -117,7 +117,7 @@ PACKAGECONFIG[gtkstyle] =3D "-gtkstyle,-no-gtkstyle,g=
tk+"
>  PACKAGECONFIG[directfb] =3D "-directfb,-no-directfb,directfb"
>  PACKAGECONFIG[linuxfb] =3D "-linuxfb,-no-linuxfb"
>  PACKAGECONFIG[mitshm] =3D "-mitshm,-no-mitshm,mitshm"
> -PACKAGECONFIG[kms] =3D "-kms,-no-kms,virtual/mesa virtual/egl"
> +PACKAGECONFIG[kms] =3D "-kms,-no-kms,drm virtual/egl"
>  # needed for qtwebkit
>  PACKAGECONFIG[icu] =3D "-icu,-no-icu,icu"
>  PACKAGECONFIG[udev] =3D "-libudev,-no-libudev,udev"
> --=20
> 2.7.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4zI0WCX1RcnW9Hbu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbdb94ACgkQN1Ujt2V2gBzRQgCePHFy7FvJkqJR+gXy0q3fpJQq
wvAAoKDjxSKK4tcy3FAljtESgFBS4nnX
=U6qv
-----END PGP SIGNATURE-----

--4zI0WCX1RcnW9Hbu--
