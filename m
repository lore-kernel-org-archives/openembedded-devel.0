Return-Path: <Anders.Montonen@iki.fi>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA467C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 10:16:15 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.6548.1646129773750363783
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 02:16:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kapsi.fi header.s=20161220 header.b=LpGp5bRy;
 spf=pass (domain: kapsi.fi, ip: 91.232.154.25, mailfrom: antime@kapsi.fi)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	 s=20161220; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=pg/+9RjwGDTXJ5RnPDQvhGvyVmRXCheUPkdWEpR7lQc=; b=LpGp5bRyRZ498tqQmMTKgUKzhL
	JAy+swD3F1k2VYfRLx6U8Lv8CdaM7w+2xl30nUXpS2GeJLkoRP5SECU7+sut7yO7TIAMIDjn5NJOj
	nMPA7YELdNGlQM7lROyAg40eOYhucMpmTc2bzymJTQRWO1K7/B3PGoztic2G/CZufP6CFBVeC7KaW
	3NUHc+Akr6+tbsh/gVo8emmMBL++lAPzyXhlY6uIeFMtTSGsGPAr6EpjPWQf51Pl+FIvGMutvlY9x
	EX9co6FuhEcAB8FVKysQ8WGsHK6enAj2LJJ9gmWyaLCByCv7wvtH5A4kS+S5tkTqviTOYTQRjb/xk
	bu9TmASA==;
Received: from 89-27-79-167.bb.dnainternet.fi ([89.27.79.167]
 helo=[192.168.1.137])
	by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <Anders.Montonen@iki.fi>)
	id 1nOzYA-00049w-GF; Tue, 01 Mar 2022 12:16:10 +0200
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-antrl4-runtime: add recipe
From: Anders Montonen <Anders.Montonen@iki.fi>
In-Reply-To: <20220301093355.2746877-2-samuli.piippo@qt.io>
Date: Tue, 1 Mar 2022 12:16:09 +0200
Cc: openembedded-devel@lists.openembedded.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <04253AFB-FAAA-4C9E-BDEB-BBCFAACDAFD9@iki.fi>
References: <20220301093355.2746877-1-samuli.piippo@qt.io>
 <20220301093355.2746877-2-samuli.piippo@qt.io>
To: Samuli Piippo <samuli.piippo@gmail.com>
X-Mailer: Apple Mail (2.3445.104.21)
X-SA-Exim-Connect-IP: 89.27.79.167
X-SA-Exim-Mail-From: Anders.Montonen@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 10:16:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95625

Hi,

> On 1 Mar 2022, at 11:33, Samuli Piippo <samuli.piippo@gmail.com> =
wrote:
>=20
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> ---
> .../python/python3-antrl4-runtime_4.9.2.bb            | 11 +++++++++++
> 1 file changed, 11 insertions(+)
> create mode 100644 =
meta-python/recipes-devtools/python/python3-antrl4-runtime_4.9.2.bb

Spelling mistake, python3-antrl4-runtime_4.9.2.bb -> =
python3-antlr4-runtime_4.9.2.bb

-a

>=20
> diff --git =
a/meta-python/recipes-devtools/python/python3-antrl4-runtime_4.9.2.bb =
b/meta-python/recipes-devtools/python/python3-antrl4-runtime_4.9.2.bb
> new file mode 100644
> index 000000000..6d67861a2
> --- /dev/null
> +++ =
b/meta-python/recipes-devtools/python/python3-antrl4-runtime_4.9.2.bb
> @@ -0,0 +1,11 @@
> +SUMMARY =3D "ANTLR runtime for Python"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D =
"file://PKG-INFO;md5=3Dc96f0ee5f5d08fd4387e5f00507bb13e"
> +
> +SRC_URI[sha256sum] =3D =
"31f5abdc7faf16a1a6e9bf2eb31565d004359b821b09944436a34361929ae85a"
> +
> +PYPI_PACKAGE =3D "antlr4-python3-runtime"
> +
> +inherit pypi setuptools_build_meta
> +
> +BBCLASSEXTEND =3D "nativesdk native"
> --=20
> 2.25.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95622): =
https://lists.openembedded.org/g/openembedded-devel/message/95622
> Mute This Topic: https://lists.openembedded.org/mt/89472243/3618057
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[Anders.Montonen@iki.fi]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


