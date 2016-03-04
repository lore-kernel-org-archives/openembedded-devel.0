Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id BE77D731E5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2016 23:33:38 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id w104so56388542qge.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Mar 2016 15:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=JVOon4hnXRN20XrbJ0DJl8K+4FrBrjQNfgLVzQZmtwI=;
	b=HnBe37dh1epHvly3vSRkoKCa25RgPg0TgmK3/J9PsgNEdLtKNtoCFysBZKyp7uyyFW
	EszUOD5gcjMKpnJWAtKvwdPT7fNh8vzRKM1kzIEWVgKzM+dRz+iJo0W9kl4Y7PhGHLJF
	41/piAj+xaJbLgUx8KxNM2IhDqkQ3oLqLQSO/qsyBohGqP8UVKy5+DR6PDNoJ0nrbMy1
	G/GzHOYdEzjh2qXb8h67hM+0CwOPkdM2IItkEZUcetxnjf8n+gzRUI4V+6v1w5hUOsuG
	dMRKTqSm6AkrYqmsYIox/D2Hw4+kPEJ9aaD9cNd7dCGaYXccpTRal1U3uGWXxHZ4lUb2
	GDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=JVOon4hnXRN20XrbJ0DJl8K+4FrBrjQNfgLVzQZmtwI=;
	b=h3iQFG0hqCzYrunWSXFpDilHHPMH2OUJHp6qFCZgMC65CjDMEr5EvCaccA3qyJs/Vj
	Hun5AfeLW9JfdvJ435Y73Dr6T2kOkePn+2awD5FBTvPN0Eb2cMdNfNAO4HuKsT+l0HUD
	Y91JJQpr9gM3WQL7MKBM4UQTLd7SWLWZ+Y4alMevCGqK1Kx4Ie+SPrpGzxM/QRPS4G2n
	WWOvmjB8ePoYJ4rqmf8E9YOrjIk2dMbjqBqITPAK43wlpPz0J+pdPoEGSEbwbdsnfb/G
	ioStn2X+BwdDWbEUU6L5WCuRvuqqDZkmEVf4Ic+aBrN0iC5O9RAO6ReJkcIcW+3HJ4YV
	fMRg==
X-Gm-Message-State: AD7BkJLj+9N90EkYGLTcZa9fwzS6FoJWAv8crx6PTU8YiPnJAckBy1Td7fOYJ4gLzlr52DpFmNfyPF+NeFFd0A==
X-Received: by 10.140.241.68 with SMTP id m65mr14260312qhc.98.1457134418957;
	Fri, 04 Mar 2016 15:33:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Fri, 4 Mar 2016 15:33:09 -0800 (PST)
In-Reply-To: <1456266340-30312-1-git-send-email-schnitzeltony@googlemail.com>
References: <1456266340-30312-1-git-send-email-schnitzeltony@googlemail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 5 Mar 2016 07:33:09 +0800
Message-ID: <CAMKF1sr_oFNbatzU4_pXnwZ7WU5JjmExeD0NFSYoScQD8YmpZA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] firefox: fix install for oe-core master and cleanup packaging
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
X-List-Received-Date: Fri, 04 Mar 2016 23:33:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2016 at 6:25 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Could build test only due to lack of building image
>

this is ok to install.

> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  recipes-mozilla/firefox/firefox_38.6.1esr.bb | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
>
> diff --git a/recipes-mozilla/firefox/firefox_38.6.1esr.bb b/recipes-mozil=
la/firefox/firefox_38.6.1esr.bb
> index 8356532..4e4a7aa 100644
> --- a/recipes-mozilla/firefox/firefox_38.6.1esr.bb
> +++ b/recipes-mozilla/firefox/firefox_38.6.1esr.bb
> @@ -68,7 +68,7 @@ do_install_append() {
>
>      install -m 0644 ${WORKDIR}/mozilla-firefox.desktop ${D}${datadir}/ap=
plications/
>      install -m 0644 ${WORKDIR}/mozilla-firefox.png ${D}${datadir}/pixmap=
s/
> -    install -m 0644 ${WORKDIR}/vendor.js ${D}${libdir}/${PN}-${MOZ_APP_B=
ASE_VERSION}/defaults/pref/
> +    install -m 0644 ${WORKDIR}/vendor.js ${D}${libdir}/${PN}/defaults/pr=
ef/
>
>      # Fix ownership of files
>      chown root:root -R ${D}${datadir}
> @@ -78,19 +78,9 @@ do_install_append() {
>  FILES_${PN} =3D "${bindir}/${PN} \
>                 ${datadir}/applications/ \
>                 ${datadir}/pixmaps/ \
> -               ${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/* \
> -               ${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/.autoreg \
> +               ${libdir}/${PN}/* \
>                 ${bindir}/defaults"
> -FILES_${PN}-dev +=3D "${datadir}/idl ${bindir}/${PN}-config ${libdir}/${=
PN}-devel-*"
> -FILES_${PN}-staticdev +=3D "${libdir}/${PN}-devel-*/sdk/lib/*.a"
> -FILES_${PN}-dbg +=3D "${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/.debug \
> -                    ${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/*/.debug \
> -                    ${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/*/*/.debug \
> -                    ${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/*/*/*/.debug=
 \
> -                    ${libdir}/${PN}-devel-*/*/.debug \
> -                    ${libdir}/${PN}-devel-*/*/*/.debug \
> -                    ${libdir}/${PN}-devel-*/*/*/*/.debug \
> -                    ${bindir}/.debug"
> +FILES_${PN}-dev +=3D "${datadir}/idl ${bindir}/${PN}-config"
>
>  # We don't build XUL as system shared lib, so we can mark all libs as pr=
ivate
>  PRIVATE_LIBS =3D "libmozjs.so \
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

