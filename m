Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9524C6CBAC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 11:22:58 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id u56so8235834wes.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 04:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=YIXIvshFu/OTtvRnE/HKm5Z2YD+72Xh4tAcH/R1kM4s=;
	b=TV1yk16NKwI+BRdKSndoWkU3pchTENpZsz5zK7vYSRAIFmxv8gKtPhDZss/VoJ7teK
	WsanI7zKWAGVUFtfpX1QdqkSzXxGyAcz97NflIiFkWUAxLDAgMM4g/svqTUjnhL93ChF
	zhy/T+ZAtkqulLY2Rbq7Y0bOC8d4iaRo8wgKnz+7T0/3ZcSrwhLR3qubisvsns58ARoU
	/bZGrottwxvq3kEBhcjBqsgqD8FonCbFgAtz6q2R/y2A4tAwyeSASDaglM0pBEhvi2bx
	lYe9wxHt/FNfJGPCBSlOK8crtfD1bV01QgaqCGxPCn6dEkW21Hp+ceV4uIylCxiqtiSa
	9EnQ==
X-Gm-Message-State: ALoCoQmXmOqDg4IkwYHG8J7jWU5KxOX8mfY47ZkUMGGiBLx9e0uQm3XUkoKgVUIV6Vp/yYigFFKY
X-Received: by 10.194.119.132 with SMTP id ku4mr1590642wjb.51.1381836179739;
	Tue, 15 Oct 2013 04:22:59 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id ev4sm55084wib.7.2013.10.15.04.22.58
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 04:22:58 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1381835734-6969-1-git-send-email-fathi.boudra@linaro.org>
Date: Tue, 15 Oct 2013 13:23:01 +0200
Message-Id: <7AF48623-2F7B-443F-AC08-4241E115DAA1@dominion.thruhere.net>
References: <1381835734-6969-1-git-send-email-fathi.boudra@linaro.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] libjpeg-turbo: update to 1.3.0 release (svn r988)
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
X-List-Received-Date: Tue, 15 Oct 2013 11:22:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 okt. 2013, om 13:15 heeft Fathi Boudra <fathi.boudra@linaro.org> =
het volgende geschreven:

> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>

Can you list in the commit message what made the license checksums =
change?

> ---
> meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb | 9 ++++-----
> 1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb =
b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> index 4fd258f..f18d37d 100644
> --- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> +++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> @@ -3,12 +3,11 @@ HOMEPAGE =3D "http://libjpeg-turbo.org/"
>=20
> LICENSE =3D"BSD-3-Clause"
> LIC_FILES_CHKSUM =3D =
"file://cdjpeg.h;endline=3D12;md5=3D78fa8dbac547bb5b2a0e6457a6cfe21d \
> -                    =
file://jpeglib.h;endline=3D14;md5=3D7bb9a39828a1b1e84acd4e8aec1e5532 \
> -                    =
file://djpeg.c;endline=3D13;md5=3De85613b52f2906c5dfc0e21ec902cb33 \
> +                    =
file://jpeglib.h;endline=3D14;md5=3Da08bb0a80f782a9f8da313cc4015ed6f \
> +                    =
file://djpeg.c;endline=3D13;md5=3D03db065044529233c296324be85530ab \
> "
> -PV =3D "8d+1.2.1"
> -PR =3D "r2"
> -SRCREV =3D "837"
> +PV =3D "8d+1.3.0"
> +SRCREV =3D "988"
> SRC_URI =3D =
"svn://libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-turbo;protocol=3D=
https;module=3Dtrunk"
>=20
> S =3D "${WORKDIR}/trunk"
> --=20
> 1.8.1.2
>=20


