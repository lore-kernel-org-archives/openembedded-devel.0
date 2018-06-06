Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id D97A876047
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 01:05:57 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id d3-v6so4700534qto.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2018 18:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SqOt4jIK6ElBD37tc4g8VesBQRjc5P9Y45yVDxXpSEw=;
	b=nC32PTrOAByy+yUQhHtZltJu6nfDvT/cnMe1LzChwj4SKPfGGjCi4GpgAng4KnXqB4
	55ta+utHk70DgdxIvh56riymCZH29SAZ/76qWficLJ8lHX6JCvdmVJnGVTGwFxKoCJVj
	fEfL4XFb67vpVMVsvQQLjO7CfSyryL76OS3bIzXlfJeY7H+PzEfLbgQ6EalEE5GxgBoC
	UeNpWbNgxgkXhvCp54ntTENSODKBBhW9yT+cG5NdsaOMac11Ajiy+N2typnXzoeE+RyG
	fwfaKJ8Mqixfn5tXhfNyGmzYl/IN/UsXlBrEC/EeXs4YCnulcmtcmWKUi4a3g0RHSNUp
	4UyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SqOt4jIK6ElBD37tc4g8VesBQRjc5P9Y45yVDxXpSEw=;
	b=sQQbvz0m3lnU8hE7jXZsymkN5Mp6qyxqQApvTMnL8A1gQv5Uo2hCVFJ/BMUiGs3mVV
	Z8vyY8rQWecLLH0U77Qt9EBgHF6qAusSSIKdcsr8jY8l6RFL7JMOosmiJhTKTJENmH2n
	NLb0B5HBoaZ+YsYhH65zGH345gK+UHrF8tU/W6KwYp7iFHAUejKZj76/4ese4GGHx2gw
	tOlpZSbChuzWcDkBfr28twLAssnIxjwMqO1OlvjXouDX/zKiWX3QZAnw/TcXQSYKE4hg
	WmFucv7uhfRKrBCQPR4/BEbK96nlZqNTj3dk49IAbn+B4QDSg+ORYWnirVsX7X/27CPj
	fv4w==
X-Gm-Message-State: APt69E1p5x//SKm2yE7l0lJVHzYaEmheIpCc4cxYtw/ak74R76umIZgF
	O9m3W85X11zZvVnmYDYdUh+0RR2ABIhrQwulLRf+oQ==
X-Google-Smtp-Source: ADUXVKKjYIkpCOe1p32YRbPuta5FItB0rVT0kETv02gibLt/NYgoQuBU+Xj5X0BsQMke2ssknoEl435A5hXJhu0UrdA=
X-Received: by 2002:ac8:70c9:: with SMTP id g9-v6mr931399qtp.376.1528247158445;
	Tue, 05 Jun 2018 18:05:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP;
	Tue, 5 Jun 2018 18:05:27 -0700 (PDT)
In-Reply-To: <20180604162927.22714-1-leon.anavi@konsulko.com>
References: <20180604162927.22714-1-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Jun 2018 18:05:27 -0700
Message-ID: <CAMKF1soJL8txTjcknjkKXCUNK6aBJX-BPy0NgTA-0DtYq=b13w@mail.gmail.com>
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nano: Upgrade 2.9.7 -> 2.9.8
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
X-List-Received-Date: Wed, 06 Jun 2018 01:05:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 4, 2018 at 9:29 AM, Leon Anavi <leon.anavi@konsulko.com> wrote:
> Upgrade nano to 2.9.8, the latest version as of 2 June 2018:
> https://www.nano-editor.org/dist/v2.9/ChangeLog
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  meta-oe/recipes-support/nano/nano_2.9.7.bb | 8 --------
>  meta-oe/recipes-support/nano/nano_2.9.8.bb | 8 ++++++++
>  2 files changed, 8 insertions(+), 8 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/nano/nano_2.9.7.bb
>  create mode 100644 meta-oe/recipes-support/nano/nano_2.9.8.bb
>
> diff --git a/meta-oe/recipes-support/nano/nano_2.9.7.bb b/meta-oe/recipes-support/nano/nano_2.9.7.bb
> deleted file mode 100644
> index 419e5406b..000000000
> --- a/meta-oe/recipes-support/nano/nano_2.9.7.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -include nano.inc
> -
> -do_install_append_libc-musl () {
> -       rm -rf ${D}${libdir}/charset.alias
> -       rmdir ${D}${libdir}

This is failing on musl like below

| make[1]: Leaving directory
'/mnt/a/oe/build/tmp/work/core2-64-bec-linux-musl/nano/2.9.8-r0/build'
| rmdir: failed to remove
'/mnt/a/oe/build/tmp/work/core2-64-bec-linux-musl/nano/2.9.8-r0/image/usr/lib':
No such file or directory
| WARNING: /mnt/a/oe/build/tmp/work/core2-64-bec-linux-musl/nano/2.9.8-r0/temp/run.do_install.40342:1
exit 1 from 'rmdir
/mnt/a/oe/build/tmp/work/core2-64-bec-linux-musl/nano/2.9.8-r0/image/usr/lib'


I think you might need --ignore-fail-on-non-empty
option with rmdir

> -}
> -SRC_URI[md5sum] = "e0c6d76c93932f6c41c40842952495f7"
> -SRC_URI[sha256sum] = "b64ab017305b1777e97b5b9b07b31db8aeebfc3e8719f61e8da1cf3866d344bd"
> diff --git a/meta-oe/recipes-support/nano/nano_2.9.8.bb b/meta-oe/recipes-support/nano/nano_2.9.8.bb
> new file mode 100644
> index 000000000..ac5f0622b
> --- /dev/null
> +++ b/meta-oe/recipes-support/nano/nano_2.9.8.bb
> @@ -0,0 +1,8 @@
> +include nano.inc
> +
> +do_install_append_libc-musl () {
> +       rm -rf ${D}${libdir}/charset.alias
> +       rmdir ${D}${libdir}
> +}
> +SRC_URI[md5sum] = "31714360342f9baa344e2fa574c144db"
> +SRC_URI[sha256sum] = "c2deac31ba4d3fd27a42fafcc47ccf499296cc69a422bbecab63f2933ea85488"
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

