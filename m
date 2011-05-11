Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QK169-0005CV-LK
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 May 2011 06:32:33 +0200
Received: by eye27 with SMTP id 27so37695eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 21:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=qJzQ5rfLzmp2jvrvnknHvqRQim10qLhLFAmFhI4WLSA=;
	b=aLD/yxdDpI6iGR1KXENnTYU1zcgkOfuQVROxSQMG+qGplg40ClGCE2Z5EaygknJ6N/
	2I1qUlI7DXDUeqVtWgMfzlb+apFSRlU3huIHNIDbZdvu6U1tMBe846DMS1DpjJcD+N3I
	rOr0dtL7ptIfyKWUyWKPz6r2OAj/wvsrzBoa0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=tai2ASSl+2Pfj4R2DxpX/moGKT+ykJtnhmFTTySemiVqDPupglabEymp2jR2XIAekh
	8ZN8tIRNk+rDIEfR1H6toZsUZo2ORQQpkCFW46EiJu5Ibxdp9M0/FI9rEFDyzNL2CWU5
	kaioYHaKzm+leqshAs5ewhAe1e+2U0JGDLSVg=
Received: by 10.14.15.78 with SMTP id e54mr4102795eee.80.1305088179141; Tue,
	10 May 2011 21:29:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.5 with HTTP; Tue, 10 May 2011 21:29:09 -0700 (PDT)
In-Reply-To: <1304968617-4949-7-git-send-email-otavio@ossystems.com.br>
References: <1304968617-4949-1-git-send-email-otavio@ossystems.com.br>
	<1304968617-4949-7-git-send-email-otavio@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 May 2011 21:29:09 -0700
Message-ID: <BANLkTikdBou4+n10aSsdH30w98AA0wuUKg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH v4 07/12] libiconv: drop hack since gettext was being inherited
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
X-List-Received-Date: Wed, 11 May 2011 04:32:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 9, 2011 at 12:16 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> =C2=A0.../recipes-support/libiconv/libiconv_1.13.1.bb =C2=A0 =C2=A0| =C2=
=A0 =C2=A05 +----
> =C2=A01 files changed, 1 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb b/meta-o=
e/recipes-support/libiconv/libiconv_1.13.1.bb
> index 4db70cb..868314b 100644
> --- a/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb
> +++ b/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb
> @@ -8,10 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb6734=
63ab874e80d47fae504 \
> =C2=A0BBCLASSEXTEND =3D "native nativesdk"
>
> =C2=A0PROVIDES =3D "virtual/libiconv"
> -PR =3D "r1"
> -
> -#gettext.class cant be inherit here so use this hack
> -DEPENDS =3D "${@['','gettext-native'][bb.data.getVar('USE_NLS', d, 1) =
=3D=3D 'yes']}"
> +PR =3D "r2"
>
> =C2=A0EXTRA_OECONF +=3D =C2=A0"${@['--disable-nls','--enable-nls'][bb.dat=
a.getVar('USE_NLS', d, 1) =3D=3D 'yes']}"
>

even this setting of EXTRA_OECONF can be dropped since --enable-nls
and --disable-nls are also taken care by gettext bbclass
> --
> 1.7.2.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


