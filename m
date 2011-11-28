Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RUqtn-0004cG-Rv
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 03:24:51 +0100
Received: by lahe6 with SMTP id e6so432890lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Nov 2011 18:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=Ut2nboSb2+X8r8FsLsvq+0a9sp8KXqjaQ+vrck4QDsM=;
	b=SQMgEY2gYQ5sh4XXT4vcrM3dcOrgZ5Av3rKc7jB7IFSiMQSjnBz37uQoZRebcyZaxU
	uKgM1kllJ2PmR6gs1xVm1M+QCbibMVT/GkqoDJJhBDPn3G2Sy2g+IRrdqZOz5VhzfdCq
	eGcEIpR19XlBmSIicamF4h7oc7x9yvYaODWUw=
Received: by 10.152.111.1 with SMTP id ie1mr14511646lab.7.1322446694380; Sun,
	27 Nov 2011 18:18:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Sun, 27 Nov 2011 18:17:43 -0800 (PST)
In-Reply-To: <1322395493-30396-1-git-send-email-koen@dominion.thruhere.net>
References: <1322395493-30396-1-git-send-email-koen@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Nov 2011 18:17:43 -0800
Message-ID: <CAMKF1sreJB3qkFnDZPxpxBv7bZBkfE6aJ0Jwbv55HvQepitj6g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe] digitemp: fix QA issues:
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Nov 2011 02:24:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 27, 2011 at 4:04 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> -EXTRA_OEMAKE =3D "ds9097 ds9097u"
> +EXTRA_OEMAKE =3D "ds9097 ds9097u \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SYSTYPE=3D'Linux=
' \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> +# Fix GNU_HASH QA errors
> +TARGET_CC_ARCH +=3D "${CFLAGS} ${LDFLAGS}"
>
>

why CFLAGS ? I thought only LDFLAGS would have been sufficient


