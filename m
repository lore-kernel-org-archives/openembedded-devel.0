Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F9AD6ED0D
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 11:23:22 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.8363.1732188194056941463
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 03:23:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RYMTgZuT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0E1C24000F;
	Thu, 21 Nov 2024 11:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732188192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n9tDT9I0vqNOEsVXpELTskRaukzofdiH5W3WxW4ZtVA=;
	b=RYMTgZuTdHq/Mt/LIxj8NoznxhvfrgbF3e0Wj6Iga03k6UI/ODl9WIXGs1/LSWKq+17Sbj
	ABHtxfRKJLUt23ITm2Vlg9xO04wVXVUugY/goSWSk8sCj9Co0XCzZcAdMJRECm1P8MfdtU
	4LoEpkGOrs60uZbySLAjvEDUI6JpTlnUofqtUqRaS3qbm6iKJSRsdLulnnkWsj6SAqDkUH
	SBwwQ93jQs5IeAPh/GkerpuBnXTcNUphNhjNnQcxIkrX59yyCqelXZzT0THWnnGPCPgAO4
	TUP1vwONIfSlek0F1h5ZXwjbJJtvKRlXmT4ofdVtI4hUtT8XqvnytyCOu8nyIw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 Nov 2024 12:23:12 +0100
Message-Id: <D5RTGU2DZLNI.IOI1OVBS2LOS@bootlin.com>
To: "Antonin Godard" <antonin.godard@bootlin.com>,
 <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cryptopp: add a recipe for version 8.9.0
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241121-add-cryptopp-v1-1-36382a60cecb@bootlin.com>
In-Reply-To: <20241121-add-cryptopp-v1-1-36382a60cecb@bootlin.com>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 11:23:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113967

On Thu Nov 21, 2024 at 12:20 PM CET, Antonin Godard wrote:
> cryptopp is a library of cryptographic schemes written in C++
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb | 45 +++++++++++++++++=
++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb b/meta-oe/=
recipes-crypto/cryptopp/cryptopp_8.9.0.bb
> new file mode 100644
> index 0000000000000000000000000000000000000000..06652a3449525ffe649c3af45=
ad2809b96332b0f
> --- /dev/null
> +++ b/meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb
> @@ -0,0 +1,45 @@
> +SUMMARY =3D "A free C++ class library of cryptographic schemes"
> +DESCRIPTION =3D "Crypto++ Library is a free C++ class library of cryptog=
raphic schemes"
> +CVE_PRODUCT =3D "cryptopp"
> +HOMEPAGE =3D "http://www.cryptopp.com/"
> +SECTION =3D "libs"
> +LICENSE =3D "BSL-1.0"
> +LIC_FILES_CHKSUM =3D "file://License.txt;md5=3Dca6dacb7ef68b1ab5dfa3bed2=
4c12003"
> +
> +SRC_URI =3D "git://github.com/weidai11/cryptopp.git;protocol=3Dhttps;bra=
nch=3Dmaster"
> +SRCREV =3D "843d74c7c97f9e19a615b8ff3c0ca06599ca501b"
> +
> +S =3D "${WORKDIR}/git"

Ha, I was working on Scarthgap and forgot. I will change this to UNPACKDIR.


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

