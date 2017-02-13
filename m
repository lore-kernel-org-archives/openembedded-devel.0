Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9788C71DCF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 10:17:29 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id t8so7414186vke.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 02:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5oo221cok9QU3D5e5dSqvqs9EbY356YiOt+BzCP3ne8=;
	b=SWBDtb2e9TfaEoFyck4wkX7D/zIsTA6wYokWaQGofmYo4+mFwYtuTaWy2K2qbR9N4W
	DCeJ8sNIJg4Jv0+Ob5JsQOgAgYf4I8fywZdeG6h41ys3ie2TbKWZiJ14TXn7RKJLlj5t
	yJkwF/jDF0wMSPMpoomXMwFKrnNiyA/kcu59srKEmXFlNGA0X+wPQPu51ftYZh+VSYcU
	kWF/mFx6aiXWZY/SLekrhWekpv3ueneMWBzI7bdqfKHd7sCHKnHy0ElQbWTIz9qAAap2
	oQJ405DSiMzCvkGkTdny7O+M0wmTxk2q7UCkvHMgD18DW7B3u+jFZY/2+yubtSd5eezK
	2maA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5oo221cok9QU3D5e5dSqvqs9EbY356YiOt+BzCP3ne8=;
	b=VmWNpVO/myO2e16tTXE1+RAC26R/881QogTjP3Z+C9Epwsrmt6vXps9TZSYB/wczue
	+hGpzbFkp7lkVMAom3vWtFtHM+8ypsIGpYzNhnXhUvjIk9DEYUtUHCi2rbFYpYzYGA0H
	J/pKM65/Fvv9+qNkZIFxUAK+1UmawGc1YOXx5XuIVhLdicYkPLH7VvkBCFRxNyXl303l
	waVDt4oloRIQoG5ZJdjpMltH0u1RrQmbAVJ7hEGHKJDbccspAadM9uPuWdMBr+jBIhRd
	WUPVynGY6g6htq7EbSrpjAXfpFOHbekwXL7+cLTInzUJL16XbnjL5epRovMGBE0gcpm4
	mQ+Q==
X-Gm-Message-State: AMke39n97/anrybMVElJRcPpwjUDrcVmtT7F4jnypDJsptOCYto1AfGGlE7CzsgwrzSEGMiyJ1jnq2kA8ILfKw==
X-Received: by 10.31.155.75 with SMTP id d72mr10366205vke.55.1486981049343;
	Mon, 13 Feb 2017 02:17:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Mon, 13 Feb 2017 02:17:28 -0800 (PST)
In-Reply-To: <abf3f0e694f9e82a95de8916198967f9d2b1583c.1486980187.git.liezhi.yang@windriver.com>
References: <cover.1486980186.git.liezhi.yang@windriver.com>
	<abf3f0e694f9e82a95de8916198967f9d2b1583c.1486980187.git.liezhi.yang@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 13 Feb 2017 11:17:28 +0100
Message-ID: <CALbNGRQpXD6RJ7XK9uAtrGmFX+prXt8_qMUNYBSm=WkfWLY53g@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 02/13] postgresql: add gettext-native and tcl-native to DEPENDS
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
X-List-Received-Date: Mon, 13 Feb 2017 10:17:32 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 13, 2017 at 11:04 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> Fixed:
> | checking for msgfmt... no
> | configure: error: msgfmt is required for NLS
>
> And:
> | checking for tclsh83... no
> | configure: error: Tcl shell not found
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta-oe/recipes-support/postgresql/postgresql.inc | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
> index f720cbc..0c3af0f 100644
> --- a/meta-oe/recipes-support/postgresql/postgresql.inc
> +++ b/meta-oe/recipes-support/postgresql/postgresql.inc
> @@ -19,7 +19,7 @@ DESCRIPTION = "\
>  "
>  HOMEPAGE = "http://www.postgresql.com"
>  LICENSE = "BSD"
> -DEPENDS = "zlib readline tzcode-native"
> +DEPENDS = "zlib readline tzcode-native gettext-native"
>  INC_PR = "r0"
>
>  ARM_INSTRUCTION_SET = "arm"
> @@ -61,8 +61,7 @@ PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
>  PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
>  PACKAGECONFIG[python] = "--with-python,--without-python,python,python"
>  PACKAGECONFIG[uuid] = "--with-ossp-uuid,--without-ossp-uuid,ossp-uuid,"
> -# when tcl native package  is fixed change WORKDIR to STAGING_BINDIR_CROSS
> -PACKAGECONFIG[tcl] = "--with-tcl --with-tclconfig=${STAGING_BINDIR_CROSS},--without-tcl,tcl,"
> +PACKAGECONFIG[tcl] = "--with-tcl --with-tclconfig=${STAGING_BINDIR_CROSS},--without-tcl,tcl tcl-native,"
Does this really fix the issue - or is this fix correct? tclConfig.sh
created by tcl (cross) reports incorrect paths so I think that should
be fixed.

Andreas

