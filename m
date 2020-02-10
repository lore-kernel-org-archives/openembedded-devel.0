Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id E174E60BEE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 23:25:38 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id c16so9635450ioh.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 15:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4IDed0JFsMeMsapvnucAAKcNmMrEsIbh/KM0xuS2WaY=;
	b=jj3aqZ6znfLp/AgNnMJcYsWoqXUljdckOv9TSeOhluKcwKBLe/NQVP3d5ItRs9Q8pR
	0dVR1+wbQzBP4Fa4r+A6qeJWoxi33+VUicwNvHqNQlejqXnD8G4gFUqs2b5AG0OGCwJc
	v6lPXqH2JIkhY92Bw//3C8Mi+RLUqJPbAStg7QgIB2BRGPDrlE9vpseMkQ6WZ/h00BLQ
	AaiqwxJ+cIUiCT5FM+IzKprjmzDLdhgpMBDw7Vf+tsZWX4NWd0vX647J+ylet7XleXcd
	WcpzxE8who6hMlYdZ/ha2ywZgkaykoFXQW/0HYGNtJKXlCvglMGXAJmcYsVIDX9u9NbP
	rgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4IDed0JFsMeMsapvnucAAKcNmMrEsIbh/KM0xuS2WaY=;
	b=l9ewYqdiVSHeKeeWWvwpXQJXHcl/yFVgmRbdAEyg8/LUy91YNCrowe0ueozYhdoyLi
	MeweqJf2OT3P+ZtkBGa9ezCLKj7XY78c6JUIz+dMFZ2X/lN/3euI0LW3fkA8uNTaKBK/
	nqsRlcGEcz5grUj+5mMZTavHLU09nJ9mxF3UZSNma+U81P5mInS5D+basVa7hWAHfLkt
	MkkCm3+cj3O1m+t1OcHTHeZk8+mb6qYALtdNIzPqk7y1DcvMi3kWwRARQ8nm54VuDiOM
	yCrmgXDf2YonpX4tVgw8VTcF2ea4uZJi8L8s4VXUEQJVhNaZJPpIVS2pg0+cFSeab7BV
	GICA==
X-Gm-Message-State: APjAAAU/y3zFk6Fyr9kzjerdRzVqJ4rj9lYY/Z4HbkTqoC53tKnl+jEo
	AspKscDCm4HaxWrPp+i654UPLS4FKoo8QoaDgjo=
X-Google-Smtp-Source: APXvYqw/9ilRC+BoI26QLPbsuYwDDbF0xq2C+eA7TzBGUkb851UfXOqYZRO5MwTTISs0U7P/i7mKTD9X/OHlBAoGAII=
X-Received: by 2002:a05:6602:2299:: with SMTP id
	d25mr11707450iod.267.1581377139829; 
	Mon, 10 Feb 2020 15:25:39 -0800 (PST)
MIME-Version: 1.0
References: <20200210224806.3303847-1-raj.khem@gmail.com>
In-Reply-To: <20200210224806.3303847-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 11 Feb 2020 00:25:28 +0100
Message-ID: <CALbNGRQFkStjxHHV4mLfkiA0uKqGZEZ_jVZGAesQTUfygR9T+g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mozjs: Fix gold linker detection with py3
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
X-List-Received-Date: Mon, 10 Feb 2020 23:25:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2020 at 11:48 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../mozjs/mozjs/python3_string_encoding.patch | 20 +++++++++++++++++++
>  .../recipes-extended/mozjs/mozjs_60.9.0.bb    |  1 +
>  2 files changed, 21 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/python3_string_e=
ncoding.patch
>
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs/python3_string_encoding=
.patch b/meta-oe/recipes-extended/mozjs/mozjs/python3_string_encoding.patch
> new file mode 100644
> index 0000000000..97eb012e83
> --- /dev/null
> +++ b/meta-oe/recipes-extended/mozjs/mozjs/python3_string_encoding.patch
> @@ -0,0 +1,20 @@
> +Fixes python3 erros like below
> +
> +AttributeError: 'bytes' object has no attribute 'encode'
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Index: firefox-60.9.0/build/moz.configure/toolchain.configure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- firefox-60.9.0.orig/build/moz.configure/toolchain.configure
> ++++ firefox-60.9.0/build/moz.configure/toolchain.configure
> +@@ -1518,7 +1518,7 @@ def enable_gnu_linker(enable_gold_option
> +         if not gold:
> +             return
> +
> +-        goldFullPath =3D find_program(gold)
> ++        goldFullPath =3D find_program(gold.decode())
> +         if goldFullPath is None:
> +             return
> +
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb b/meta-oe/rec=
ipes-extended/mozjs/mozjs_60.9.0.bb
> index 9466c62aac..b7731c7a2a 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
> +++ b/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
> @@ -19,6 +19,7 @@ SRC_URI =3D " \
>      file://0012-JS_PUBLIC_API.patch \
>      file://0013-riscv-Disable-atomic-operations.patch \
>      file://0014-fallback-to-2011-C++-standard.patch \
> +    file://python3_string_encoding.patch \
Just sent out similar. Would prefer to keep single patch for py3 at
first position. Just in the unlikely case others want to use it :)

Andreas

