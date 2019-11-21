Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id B09507F82F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 18:49:40 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id n4so4865647qte.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 10:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=m+QZ+ztwNw/E9+HBarfCqsPQHxOykfIiW3sm/yeNn5E=;
	b=Hiv3e/D0i+lztThfYqFHZVFun9Gq7Cjicz3P0lmQTndw1FkYlmkiHrqjNQqn23nzaE
	7CL/JP8Ka5uj3VU/AMzGxwuOa2e18MsgYUkFnTucvXqOlnKGSjqWqdO4qWO6Y2mJBmGN
	tM0tDQcmTkcaLevt9Umw6Re6qJVR6+znhZZ4JmHkEXXDcwp22VJ5JPozw6LZAObQ/M1h
	YYo8Yk9DqXpXJUJDvEZ2MVBZ+eEWc4M/hvcFXHZhoE3nn0+mqAWf4DYujs9BKCk+h6ZZ
	PYsS+26VbrPiup/zcU0bv82Pala11gz0ICSDmOazPrHDyaFmkONcqXMeZth+Z4lk0cXT
	4f+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=m+QZ+ztwNw/E9+HBarfCqsPQHxOykfIiW3sm/yeNn5E=;
	b=XwE7tzMmY30wcrKv0Zhe/xE24cdw3EW9xEaa3ytenzCurZN8TkXUK/T2kmIwnzMcXD
	YRnNL+jGSEiI7/yE8xBhPljJxcjwPqVP0LkV5g324qwMvYnc2PlXwkyLi5i2yocm9wlA
	qaDmMUzkIMfbU9BEHbLnQV0uzb32F4uAlbHJ1txZFfpzrxPIupicSxvV/GA0SC0jnCoK
	pFcddgG4sxLP6H+dIr8wPRz3QWpvBLxrOVM3g/9m3lHzvSNDlbyb7yAZlBZO/zRJSf4u
	Un5kRd+2ZnWNNm3museq4LGPyQUfIZhQuSfSRQCSDZF3auxq5V6/2L0gWmrgmgkHHphw
	VsGg==
X-Gm-Message-State: APjAAAWFxASevEEnWpteqC/IqpvSrTLU9BlhXiRhT8UcTKjyEc0cUNtb
	eTDH+lpZI0Pm2Ad8bXwtNR8I0kxoi617TPVmoa3ONa95
X-Google-Smtp-Source: APXvYqyktBPXG8XePkB5xJ+LCGfsDonM3uzAljR9YYMlPHexajqglsr263Rx/oXmNFOEG/AwaTr8Cbz3CC/Kdb5jpDc=
X-Received: by 2002:ac8:5557:: with SMTP id o23mr10300656qtr.378.1574362181047;
	Thu, 21 Nov 2019 10:49:41 -0800 (PST)
MIME-Version: 1.0
References: <20191121120913.23013-1-jlu@pengutronix.de>
	<20191121120913.23013-5-jlu@pengutronix.de>
In-Reply-To: <20191121120913.23013-5-jlu@pengutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Nov 2019 10:49:14 -0800
Message-ID: <CAMKF1spBXDw5R42U0JT-kmQhFZvFUQp9vLvSXaJtV7gfvdST4A@mail.gmail.com>
To: Jan Luebbe <jlu@pengutronix.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 5/6] libp11: add support for native builds
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
X-List-Received-Date: Thu, 21 Nov 2019 18:49:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 21, 2019 at 4:29 AM Jan Luebbe <jlu@pengutronix.de> wrote:
>
> This is needed as a dependency when using SoftHSM from the PKCS#11
> OpenSSL engine for code singing.
>
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> ---
>  meta-oe/recipes-support/libp11/libp11_0.4.10.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.10.bb b/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
> index b40223e8abcb..fc2ec9935f56 100644
> --- a/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
> +++ b/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
> @@ -24,3 +24,5 @@ do_install_append () {
>
>  FILES_${PN} += "${libdir}/engines*/pkcs11.so"
>  FILES_${PN}-dev += "${libdir}/engines*/libpkcs11${SOLIBSDEV}"
> +
> +BBCLASSEXTEND="native"

nitpick but space around = is preferred in such assignments

> --
> 2.24.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

