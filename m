Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id D778560667
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 11:53:08 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id u188so37137794wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 03:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NXdy112KMXMn1i27b4mmM/i3J2vevda0laijgnf4hV4=;
	b=LNInojGOGX4mrur/78ctheAU6Yx+bwD8yXr/X9oL7RGNx2tIkaRWrDWRCOIVO6PMZA
	jTpUf2rwt0KXLSgiJ4mBLv7+/z5ZU0U0N1RxXP8sRo670d55n4kfQzzbRuSaAPx1IBwe
	A8ooyl92rvmUvWGOIFu9D8MFl+tnxB0YCGZwI3rik3CxspBplUZHYE5daJl2LAkFuVPc
	zJyThTUNZqnN6mZgsmcJ0JZy+24D0CVae4Yk0b5E505hCjl859oQ0yXcfHqoZQnQAcRf
	8sJSEj7/J3W8WFPZkK78Rgei8KlTX3aUbv4NyzK3T2fzbYEfRYrgC5X92T01C7bx3S6c
	zFqA==
X-Received: by 10.28.126.77 with SMTP id z74mr63901101wmc.3.1451476389303;
	Wed, 30 Dec 2015 03:53:09 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	pn6sm65157280wjb.15.2015.12.30.03.53.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Dec 2015 03:53:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Dec 2015 12:56:44 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151230115644.GB2263@jama>
References: <1450995242-16535-1-git-send-email-cleitonrbueno@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1450995242-16535-1-git-send-email-cleitonrbueno@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Cleiton Bueno <cleitonrbueno@gmail.com>
Subject: Re: [PATCH] Include dependency to QCoreApplication::translate()
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
X-List-Received-Date: Wed, 30 Dec 2015 11:53:10 -0000
X-Groupsio-MsgNum: 59215
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IiVenqGWf+H9Y6IX"
Content-Disposition: inline

--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 24, 2015 at 08:14:02PM -0200, Cleiton Bueno wrote:
> Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>

Where do you want this to be applied? If it's for qtwebengine recipe in
meta-qt5 then you should send change for meta-qt5 repo (which includes=20
=2Epatch for qtwebengine), not patch for qtwebengine repo.

> ---
>  src/core/media_capture_devices_dispatcher.h | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/src/core/media_capture_devices_dispatcher.h b/src/core/media=
_capture_devices_dispatcher.h
> index 500fe76..eda2824 100644
> --- a/src/core/media_capture_devices_dispatcher.h
> +++ b/src/core/media_capture_devices_dispatcher.h
> @@ -43,6 +43,8 @@
>  #include <map>
>  #include <QtCore/qcompilerdetection.h>
> =20
> +#include <QCoreApplication>
> +
>  #include "web_contents_adapter_client.h"
> =20
>  #include "base/callback.h"
> --=20
> 1.8.1.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaDxnoACgkQN1Ujt2V2gBw1zwCfVBgZIFkQCUb4I5Gt+Cf/x6qC
CFMAoJkuD3tA8K7yTYAcAOa6NxFf4/+L
=y1/3
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--
