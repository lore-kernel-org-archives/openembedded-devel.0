Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 29DFE6FFD8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 May 2017 16:05:03 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id k15so12115158wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 May 2017 09:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oOAf8zby/VVC8wW9dI1FheO9wCb2vWb0T303HcNJ2Lk=;
	b=HKl2smU/qu1B5xbb7eT2LwwNgO2npEfraqQLUx2cLZyUOL5KOZpnDapslHFdtDGK0W
	uuMAsv0znNO6DwdCW9TfHB0LSGhFi64BOgp/jkG0wIG2ZcFXhPY5jgl/NB4o2AqbYZRj
	XbYnG3wJDxwzyJTSeoQIwZG4xXscfShV9ZeS6jH07kjelrikuJMy8PrTXwl8BGXNHX7j
	7VtxoLUUIg5kw4sAKydbDh814iqcOO1PabRStimEoQxDJsAMJO1oCVbS5lZA1or8hvIJ
	6lnbMSlzL3LQqjwuQ/GKxDZFPLtLd+yc9K3GIxUOEnqUp+UeL3J+q2JdxXnZNOQ0uxk4
	cMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oOAf8zby/VVC8wW9dI1FheO9wCb2vWb0T303HcNJ2Lk=;
	b=hhFjCHvgQQuiVdX8GvoSLVpa5OzCHNYZsfnAz5JxQd84DciKbsBuamYhMz4gROjOiW
	k7iFOazfFmD4XxpP1PK+KZt0HiROcfpbutI5lqBuobVvTV/FdNuiLt197vzEbK0g/LGE
	iSXnN1HzjekbYow8btVAQ+SlKsFFlgGEZt/pPWvEAYdPv9HUaa3KbI85wjkJ3dSN4lVO
	GdEF+7nT5Em6guCPhMbAlSd4Cd8XdwDAhjef9fi5ptKdQwnjf8gn501nuXeh5T0vlEc9
	77LJ1N3ryU2EG7+IjNjHQBAWL8oKoRQW9IOw8vBhTPaQiq09/imXwgs4mzfrabYsKdQ8
	bZ6g==
X-Gm-Message-State: AODbwcClmq4E+sITSmT7/7kBIyjIGIXjhFfKOnzhCMpBkebSd3WrNEPo
	EX+pDadA+R69J0ZxYJRqxQaK+AXFBQ==
X-Received: by 10.80.180.155 with SMTP id w27mr9690805edd.42.1495987504334;
	Sun, 28 May 2017 09:05:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Sun, 28 May 2017 09:04:33 -0700 (PDT)
In-Reply-To: <20170528111040.22809-1-max.krummenacher@toradex.com>
References: <20170528111040.22809-1-max.krummenacher@toradex.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 28 May 2017 09:04:33 -0700
Message-ID: <CAMKF1sptWiD9vH0CVB86mFhaQMpiSY+3sAGd8E-B+hT2O08O9Q@mail.gmail.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [meta-oe][PATCH 1/2] gpsd: don't compile with gold
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
X-List-Received-Date: Sun, 28 May 2017 16:05:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, May 28, 2017 at 4:10 AM, Max Krummenacher <max.oss.09@gmail.com> wrote:
> When linking with gold libgps and libgpsd error out with:
>  | ./libgpsd.so: error: undefined reference to 'atan2'
>  | ./libgpsd.so: error: undefined reference to 'pow'
>  | ./libgpsd.so: error: undefined reference to 'sqrt'
>  | ./libgpsd.so: error: undefined reference to 'sin'
>  | ./libgpsd.so: error: undefined reference to 'cos'
>  | collect2: error: ld returned 1 exit status
>
> Using the bfd linker fixes the issue.

It seems packages dont have proper linker rules.
perhaps a better fix is to add -lm to linker cmdline.


>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> index 4d00fea6d..fb02f9598 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> @@ -36,6 +36,8 @@ SYSTEMD_OESCONS = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'f
>  export STAGING_INCDIR
>  export STAGING_LIBDIR
>
> +LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
> +
>  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}"
>  PACKAGECONFIG[bluez] = "bluez='true',bluez='false',${BLUEZ}"
>  PACKAGECONFIG[qt] = "qt='yes',qt='no',qt4-x11-free"
> --
> 2.12.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

