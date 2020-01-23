Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id A7E9E7FD23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 18:56:45 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id e25so3279137qtr.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 10:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=kUyoyOo4KWMhvRlDP2KeCxdVAlxyfQg4JfdHk9gKjsk=;
	b=KXEbYq7P/9fQmSNE0dneMU/x0XuUYh71Xx3epxv81xDgxZWOH+VnQ4XfoLvD5RhSKg
	y7WDKV7TPuIqJOE0dvXAiUqPY/Hue6tNE+eyTM5B6GLsgZ24xzY4HkSKtSqwtZdHUZs6
	XPuJf53IAQIPi3EaQAfjxHc7jldJFeMC1KtMsobKbQfq4xXNu9sSbag4E8yGux9KSUtB
	Fn1kMvbzlc3wMZz9m1U7xF5xCKtU/kemCLvgLUMelfeENHYAroNliaLEaOjUbueh4ixG
	2HxejUMxwv+jLnqlAhQkFHvd1bImO2JTPCLhDrdaPCSubVs0dZ59pjECnLt3Cgt7C6hI
	rN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=kUyoyOo4KWMhvRlDP2KeCxdVAlxyfQg4JfdHk9gKjsk=;
	b=j8yJwyEyHsuv1k4H6iw/hnscXvcIfT/y+TzQOVlBfIgA1YcHf693nD8wJtzrtlJvMs
	Y8F9gjNDDkpY21KuVRCGavPn5b/Vfce2g4Q29v36xClvQFn/PaTEZD0feKDLVmLIvQUd
	bCs2REQvdQlFiQ8BkPcpDWRO+zTu1H/2d0QzBjYNeLccX1ZoKlph38dKl/kpyk2SDADV
	zI8EoxAXcIIlxZv8SWAsVg0YqIzGwnLCJQUiBuwla74k1K1xIEUYz61DLihdN9t8rBLL
	bNBCpyLE9/rLInXVH8d0GsDOPqGLuHRPlnnX5zxcBQZo2NJVzVr842uBOOYMUSwRb/Q5
	VoFg==
X-Gm-Message-State: APjAAAXMsDUvSfRRoRIgzgATrunZxN/0f+QevHmnDuOdfnvZtTT0DpDH
	uPBCRSW0tXC9fNzG7fxmHl5OhGcmvrIDoqCAXTX+VgMN
X-Google-Smtp-Source: APXvYqzOO9rDvP+0H/uWE9XSewozarghzusXrlpr0y14+Dk4g7rP4kiqYlr7q9cKlu1gmW8YOe7i9qnlcMwfAoDe6RY=
X-Received: by 2002:ac8:145:: with SMTP id f5mr17485790qtg.194.1579805806176; 
	Thu, 23 Jan 2020 10:56:46 -0800 (PST)
MIME-Version: 1.0
References: <20200123183531.2066136-1-raj.khem@gmail.com>
In-Reply-To: <20200123183531.2066136-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Jan 2020 10:56:19 -0800
Message-ID: <CAMKF1sqscAD51bqJ083+8aPx1-pZyC6KGvS0KLV6mE9yhkcTYg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] ruby: Remove __has_include and __has_include_next from preprocessed header file
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
X-List-Received-Date: Thu, 23 Jan 2020 18:56:45 -0000
Content-Type: text/plain; charset="UTF-8"

ignore it

On Thu, Jan 23, 2020 at 10:35 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> one of the build steps ruby has is that it generated rb_mjit_header.h
> during configure using gcc preprocessor using -dD which emits built-in
> defines as well, problem happens when this header is later included in
> subsequent compiles, where compiler errors out stating that an existing
> internal define is redefined
>
> | /tmp/20200123-2021083-2c601q.h:13849:9: error: "__has_include" cannot be used as a macro name
> | 13849 | #define __has_include __has_include
> |       |         ^~~~~~~~~~~~~
> | compilation terminated due to -Wfatal-errors.
>
> Since compiler already will take care of it internally we can edit it
> out from this header file
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/ruby/ruby.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
> index ce1b02f012..d5cd329e65 100644
> --- a/meta/recipes-devtools/ruby/ruby.inc
> +++ b/meta/recipes-devtools/ruby/ruby.inc
> @@ -38,3 +38,10 @@ do_configure_prepend() {
>      sed -i "s#%%TARGET_CFLAGS%%#$CFLAGS#; s#%%TARGET_LDFLAGS%%#$LDFLAGS#" ${S}/common.mk
>      rm -rf ${S}/ruby/
>  }
> +
> +do_compile_prepend() {
> +    if [ -e ${B}/rb_mjit_header.h ]; then
> +        sed -i -e "/#define __has_include __has_include/d" ${B}/rb_mjit_header.h
> +        sed -i -e "/#define __has_include_next __has_include_next/d" ${B}/rb_mjit_header.h
> +    fi
> +}
> --
> 2.25.0
>

