Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5A4CA0EFC
	for <webhook@archiver.kernel.org>; Sat, 23 Aug 2025 03:23:57 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.190.1755919425092287781
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Aug 2025 20:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iT9HZueF;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-71d603cebd9so31990127b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Aug 2025 20:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755919424; x=1756524224; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQXTE0W70A9M7yxiexCvYH2X8kCJqsmEjuck2LSzJyM=;
        b=iT9HZueFRdjRHG9QBEtbKikeFD55vRzlDtMR3210uNmja1XmkF0fLG5aOhLqBKs8aq
         N0MKXqgUgIWlwATrzdmN34LpRR9WtAtUNAhPPdJWOqOVzQ2dhGY9U7WXPeTieBE/Hnp0
         Rnn4I8fxiCEA2iXIWzWfeIlOC40SWXVTY+/6OLTJurgPw8WQ1bkLtIujJmx/VB0oESID
         NCRoAePHU95CDOjZd5Lc1U/GZxZIgFpfyW7t5Z+MAv5Jmx+VqEsS6Nse4S07/k8BCyqq
         1ZUPGxOaD+XIggtN+x6q/B1Iz1fsQwH1u+jprnY6KRwT3+owK8MEEgGEd7sT3Q8k7fub
         uLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755919424; x=1756524224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQXTE0W70A9M7yxiexCvYH2X8kCJqsmEjuck2LSzJyM=;
        b=HtmziS5hRPfs9X4YwgfEbzRb4KUW8QIbXDdOpe58guJ5OZPJRUuK5XJtXjnPcNg5uL
         OGSqcQtftyjRswhlyyAFpBuGig44xj3FWjb0xoXNK2Q8VnuJ1qMImhX0WAf4inqv5+Qg
         EeIhch0zVoUD/z9N696Uah4Ne0L4kveYML2is7olooXcGBkv3uRF1ehNap/98Tz+w1bU
         bGkELa7ZgYpU6NMwSW9UIfaCMd/YNJ17Gbk9zeciretVMZ4fmNQjjAOLeEL5D1a7NUKQ
         ysAFnpeKSYD0q2Kd1523E3ceACZr3eouVCu4UgL12/Kwz86kgl3jA+HU6kr4ZoBkys9H
         7Nnw==
X-Gm-Message-State: AOJu0YzQm0go0QHcFPvfB9tnsrunsCfnN/GgjMI8SvCvXTHY6QDvqA1h
	/h1nfD8WmHEfm5xrtjF/8HcPEjCqAocOSJZ0BvcpUs2R2R3HIHgK3iMuNO1wY1bzwtqqFZAeXl9
	dZQrPaDLk+TOP/jXuDVXs7FUM6LY1QZw=
X-Gm-Gg: ASbGncsv60nPYVKJwvoY7nsQuoZqzOTP0z0Rruw7RI+wP3ZYWCDyrfDWvjIXunZUqp8
	8LoGiEqdTvMZ9YZXfB6xoTk94r6cYmBcbyXzK6lXDJ8oQLN1o4ey0HGrJqsIPYu0EJhzTMuAAn9
	Jzi+dGy7RJmVL1HcCsDGlK1ghVYVcSD5zr8tBXI5PywXNoZZc0aoVMSCu1kpRQfg6vWljzfrU2f
	Mk6wAoq2/6RNlaujqZvMqis4k3iApwgorGockFGz/bGqRWWKvTKpGF26qevqk9neEAtcd5nCHDo
	1j4c/lD69prxukw/H111ENJMPjBxw95xqg==
X-Google-Smtp-Source: AGHT+IE2bRJoPAPDxPE819oWlEnCS0KfcGwjIXbDe/cP3hPTpwtENn1xOjwYaXjIaggOf6FEO/fcf6KN2jYzDEfY6DI=
X-Received: by 2002:a05:690c:720a:b0:71e:7fea:bb1b with SMTP id
 00721157ae682-71fdc562fafmr60749537b3.36.1755919423937; Fri, 22 Aug 2025
 20:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250822115732.69642-1-psaavedra@igalia.com>
In-Reply-To: <20250822115732.69642-1-psaavedra@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Aug 2025 20:23:17 -0700
X-Gm-Features: Ac12FXxIdJX1dT6GBhdVa0sUCSzggufz6_iHajM_dmM5_nJCXEVxfr2nnVVVj8c
Message-ID: <CAMKF1sqDLd349mWK+aPcSO9RrNmrFzbYuJS7CYGHb4_qHyd7pA@mail.gmail.com>
Subject: Re: [oe][meta-gnome][PATCH] sysprof: upgrade 47.2 -> 48.0
To: psaavedra@igalia.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Aug 2025 03:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119087

I am seeing build failure especially with clang
https://errors.yoctoproject.org/Errors/Details/879220/
Please backport
https://gitlab.gnome.org/GNOME/sysprof/-/commit/46efd34d6bda105288ccde0a952=
d9054c7d05d14
and send a v2.

On Fri, Aug 22, 2025 at 4:58=E2=80=AFAM Pablo Saavedra Rodi=C3=B1o via
lists.openembedded.org <psaavedra=3Digalia.com@lists.openembedded.org>
wrote:
>
> Changes:
>
> * Ensure local dbus-monitor is reaped after capturing
> * Modernization for various GTK deprecations
> * Add new symbolizer for debuginfod which is enabled by default
> * Many performance improvements for capture loading
> * Support for unwinding without frame-pointers on distributions
>   lacking -fno-omit-frame-pointer at the toolchain level. This
>   uses a new "sysprof-live-unwinder" elevated helper process
>   which takes data from perf and unwinds the stack as soon as
>   it can without capturing the perf data to disk.
>   Thank you to Red Hat and the tools team for enabling this
>   work for RHEL.
> * The greeter now persists your settings and restores them the
>   next time you run Sysprof.
> * Various graph drawing improvements.
> * Fixes for time display in various formats.
> * Translation updates.
> * Fix drawing of Y-reversed data point markers
> * Make greeter save environment variables to state file for reuse
> * Use D-Bus power profiles bus name rather than legacy D-Bus bus name
>
> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> ---
>  .../recipes-gnome/sysprof/{sysprof_47.2.bb =3D> sysprof_48.0.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-gnome/recipes-gnome/sysprof/{sysprof_47.2.bb =3D> sysprof_48=
.0.bb} (95%)
>
> diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof_47.2.bb b/meta-gnom=
e/recipes-gnome/sysprof/sysprof_48.0.bb
> similarity index 95%
> rename from meta-gnome/recipes-gnome/sysprof/sysprof_47.2.bb
> rename to meta-gnome/recipes-gnome/sysprof/sysprof_48.0.bb
> index b6f140404c..4aad735278 100644
> --- a/meta-gnome/recipes-gnome/sysprof/sysprof_47.2.bb
> +++ b/meta-gnome/recipes-gnome/sysprof/sysprof_48.0.bb
> @@ -21,7 +21,7 @@ SRC_URI +=3D "file://0001-meson-Check-for-libunwind-ins=
tead-of-libunwind-gener.pat
>              file://0002-meson-Do-not-invoke-the-commands-to-update-the-i=
con-.patch \
>              file://0003-libsysprof-Check-for-unw_set_caching_policy-befo=
re-u.patch \
>             "
> -SRC_URI[archive.sha256sum] =3D "e4b5ede9fd978ec3f0d5a0d44d0429a6d201c362=
bf6cb4527319031ae462c54f"
> +SRC_URI[archive.sha256sum] =3D "1b0f0380f2f30708ba87829321a06fee1db36dfa=
87797bbf07f0a7acf4498d18"
>
>  # reason: gtk4 requires opengl distro feature
>  REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKAGECONFIG', 'gtk=
', 'opengl', '', d)}"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119086): https://lists.openembedded.org/g/openembedde=
d-devel/message/119086
> Mute This Topic: https://lists.openembedded.org/mt/114833729/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

