Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 188706010B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 03:24:10 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id x129so3479337qke.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 19:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=T1bpXHLsugTXmWzqybAkMpCqZMjEdQaemC0LezD/fT8=;
	b=ew9y8mjGqRV+VFbcAQSwHsI4MXLxrd5nYH0Z1BH5a+9b5EVCB2ZUJ9IRw+W/jNJhsr
	bW2YNPXT/SljPn4e24G5gxrEMmNjm3bYJ9GKGDtYielZ498IaiZP8Mwg4TVIbhNS5WOl
	KE4Jnz8CGID/YEDHTEbo+9wnsAP4Ya4tg4lTaxOemhv7cUiGuNP0HAdJyHUnt3MiRCaY
	6aWuPfN8yE4rcN3tNPTcPAnCaYsyMoiAh7ZgBq2CssZ49KrAvw/75aRwlUGToyhQNGgE
	mHSQIsSfb3w2aovxYGtbUNldJ2GcSlDX1U3UWvT79apfwxCQ7iYNE0IWaIVG2XvYY3f0
	qhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=T1bpXHLsugTXmWzqybAkMpCqZMjEdQaemC0LezD/fT8=;
	b=D5n9vTyLve+ucKQss9cjqZq416XaqI19OBt9teUEM7Ru3stN0ovWX4EhWldBzib0Ul
	HMZNHsamBwAwajSXTdgf06I4prYvwoJ12fGMVTugl1C4tHpgtH/k2RTXXyFo6b2BOf9G
	SiwC25PX/dSY74f4MGceFKtZG7JEB5cAuFeupAi3ij5r+udP0h8DQvJOeQQbaB04SkJm
	iFkEAvFlhYh5qUYHrcyJxYHxHDcN8PYBx8AfCWbuAkjRPDlnb7LZK9/evXKejZ5ViMRM
	TvXoKQybYufOH8LhUQI1hZcb/oR6XQPCX3iOfr3HGONhv0Bo6LnpXFJko+7vW21qo46r
	T09g==
X-Gm-Message-State: APjAAAXA7JpZu4uJuETXB7LF5wPY5debD2aRGgup/joD7f28/lNmccl0
	pKI6k7BT2/xWxSYoPtNUSRen8Q4BK4KIQYQ8Po0=
X-Google-Smtp-Source: APXvYqwEJR4VTh+8wQiJZSyAIUCfDS5YWbxaZ2fLUAl6aqTGXfTY1vYfFCURFpFq/tdbSr3uZwTfaYu0MxQmCitn5KY=
X-Received: by 2002:a37:de05:: with SMTP id h5mr6272020qkj.474.1576725850725; 
	Wed, 18 Dec 2019 19:24:10 -0800 (PST)
MIME-Version: 1.0
References: <20191219031617.8339-1-kai.kang@windriver.com>
In-Reply-To: <20191219031617.8339-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Dec 2019 19:23:44 -0800
Message-ID: <CAMKF1spBRVYnnQLVXnN5ciT1SwXEvhQn1pV-rQbRUcorRKLBTA@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] openl2tp: update systemd service file
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
X-List-Received-Date: Thu, 19 Dec 2019 03:24:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2019 at 7:16 PM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> It shows an warning of openl2tp in systemd log:
>
> | /lib/systemd/system/openl2tpd.service:8: PIDFile=3D references a path
> | below legacy directory /var/run/, updating /var/run/openl2tpd.pid =E2=
=86=92
> | /run/openl2tpd.pid; please update the unit file accordingly.
>
> Update the systemd service file to fix the warning.
>
> Update SRC_URI as well that the homepage openl2tp.org has been closed.
> Use archived file on sourceforge instead.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../recipes-protocols/openl2tp/openl2tp/openl2tpd.service       | 2 +-
>  meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tp=
d.service b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd.s=
ervice
> index 7b3faf672..d02d0ff7e 100644
> --- a/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd.servi=
ce
> +++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd.servi=
ce
> @@ -5,7 +5,7 @@ Requires=3Drpcbind.service
>
>  [Service]
>  Type=3Dforking
> -PIDFile=3D@STATEDIR@/run/openl2tpd.pid
> +PIDFile=3D/run/openl2tpd.pid
>  EnvironmentFile=3D@SYSCONFDIR@/default/openl2tpd
>  ExecStartPre=3D@BASE_BINDIR@/sh -c "@BASE_SBINDIR@/modprobe -sq l2tp_ppp=
 || @BASE_SBINDIR@/modprobe -sq pppol2tp"
>  ExecStart=3D@SBINDIR@/openl2tpd $OPENL2TPDARGS
> diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b=
/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
> index 90e8b111d..38d0554e1 100644
> --- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
> +++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
> @@ -18,7 +18,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De9d9259cbbf0=
0945adc25a470c1d3585 \
>
>  DEPENDS =3D "popt flex readline rpcsvc-proto-native bison-native"
>
> -SRC_URI =3D "ftp://ftp.openl2tp.org/releases/${BP}/${BP}.tar.gz \
> +SRC_URI =3D "https://sourceforge.net/projects/openl2tp/files/openl2tp/${=
PV}/${BP}.tar.gz \

Can we use SOURCEFORGE_MIRROR

>             file://Makefile-modify-CFLAGS-to-aviod-build-error.patch \
>             file://openl2tp-simplify-gcc-warning-hack.patch \
>             file://Makefile-obey-LDFLAGS.patch \
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

