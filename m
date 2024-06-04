Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 914E1C27C53
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 18:26:13 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.3417.1717525563744748929
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Jun 2024 11:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PCpIcsUr;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2510648fbacso556917fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Jun 2024 11:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717525563; x=1718130363; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlwazlSOPBrXnUQ4hi6M/yFQDVx6zCC1yATWpcljEDE=;
        b=PCpIcsUriopgAUluRtP8D32DRVCT6aIbh+kweSlQqZmVzOExfqNlwhS99v6ZVxcsDu
         tUrlZP+lWxvqEj7brJwQbiCV/JpEQd+2wB8+kUXTZBIcGW3+oqmSGOLJvbbQX5pCbHnv
         SAvT80DAvbBnmU/dD7uvvJWb83LIFOWYcAeLEC6p6GW74leYGJW0Rybri/3A+UyZvPeP
         lpqZW3pKDG396piA9nix7NblGOpMGw+vGy/wWF8fGPN1I0EFRhDDFYXct9S1iZO21TbN
         y+ew1rDAMuRVM4Rb5DD9JEuuTgc1xoBvThlXGkF6HtBoFW7ZUVWMWpoyVWY3C9Hr/GlI
         ihJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717525563; x=1718130363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlwazlSOPBrXnUQ4hi6M/yFQDVx6zCC1yATWpcljEDE=;
        b=O3GxPSRL0eanudSnwABVWZAt7BCCVgKxnlUYPEOK7uS0hGmYPRb5zxmjuUbKWVqbHh
         lQQn+hQlclZxNd3KJ2mrbOqdCnCUcsqq5tjzyqUgjobuu1KeB5xxWkoG+rmwTaaUyfWN
         lAK5mY6xeAzOzCcq0/GTvhqjObiLJU+pgUCbt2OVYEvwji9y3mgbWTeIcerjz+BR08ok
         0AfMXh9+U+Yc8ci6zAZoUimzOgVxIIxqomnMPKgPNtDjcNS2E43Ae0zalhBj+mvwucOr
         XbUDKtISC6xxZ6W6ki3D47b2YRXUMOzuxK/UQfaUaCpYBdGYQ5YJvQEJQWjBQFfH9+56
         yDuw==
X-Gm-Message-State: AOJu0YzMQOyC7BVnlXwKI3mZUMgtPM3OZicN8QLMQy0SdR8Xv2srKb33
	a+HKTzw5pi9u1zwgdXHBh8l5ct6C6HriJhEaEtDlFh3XnEWDXtu491l/QqxLZXqcOG+XdrQ2i4G
	gwARb4h52b0VyfSjkBD+wFL1fcfA=
X-Google-Smtp-Source: AGHT+IEmnzkW6NQ6NtgHd0AfenCYXcRiBojRqjNIq/F4NHLMsNvDonhE+CJtzgUNTRVNc7FdqmSJJu4Rl4h9cPt5YQw=
X-Received: by 2002:a05:6870:a687:b0:250:725f:ed4d with SMTP id
 586e51a60fabf-25121c7e175mr491220fac.3.1717525562782; Tue, 04 Jun 2024
 11:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240604032018.419634-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20240604032018.419634-1-jiaying.song.cn@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Jun 2024 11:25:36 -0700
Message-ID: <CAMKF1sqptwuzkEWc5=XjrF_YtMEXGdAW+ZO=tV32rs0OOyptjg@mail.gmail.com>
Subject: Re: [oe] [scarthgap][master][meta-oe][PATCH] rrdtool: Fix
 do_populate_sysroot QA issues
To: Jiaying.Song.CN@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jun 2024 18:26:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110687

On Mon, Jun 3, 2024 at 8:19=E2=80=AFPM Song, Jiaying (CN) via
lists.openembedded.org
<Jiaying.Song.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> This commit addresses the shebang size issue encountered in the
> do_populate_sysroot task of the rrdtool-native recipe. The issue
> was caused by the shebang line in the cgi-demo.cgi file exceeding
> the maximum allowed length of 128 characters.
>
> The following error was observed:
>
> ERROR: rrdtool-native-1.8.0-r0 do_populate_sysroot: QA Issue: : /work/x86=
_64-linux/rrdtool-native/1.8.0/sysroot-destdir/work/x86_64-linux/rrdtool-na=
tive/1.8.0/recipe-sysroot-native/usr/share/rrdtool/examples/cgi-demo.cgi ma=
ximum shebang size exceeded, the maximum size is 128. [shebang-size]
> ERROR: rrdtool-native-1.8.0-r0 do_populate_sysroot: do_populate_sysroot f=
or this recipe installed files with QA issues
> =EF=BB=BF
> The solution implemented involves modifying the shebang line in the
> cgi-demo.cgi file to use '/usr/bin/env rrdcgi', ensuring it adheres
> to the length limit.
>
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
>  meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb b/meta-oe/=
recipes-extended/rrdtool/rrdtool_1.8.0.bb
> index cbe1af285..5afb3f2f4 100644
> --- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb
> +++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb
> @@ -103,6 +103,11 @@ do_configure() {
>          ${B}/examples/*.pl
>  }
>
> +do_install:append:class-native() {
> +    # Replace the shebang line in cgi-demo.cgi
> +    sed -i '1s|^.*$|#!/usr/bin/env rrdcgi|' ${D}${datadir}/rrdtool/examp=
les/cgi-demo.cgi
> +}

I think this patch makes sense for non-native versions of this recipe
as well. However, it will be good
to see if we can do it as a patch to .in file itself, string
substitution can cause unintended changes
especially when the scripts change etc.

https://github.com/oetiker/rrdtool-1.x/blob/master/examples/cgi-demo.cgi.in=
#L1


> +
>  PACKAGES =3D+ "${PN}-perl ${PN}-python"
>  PACKAGES =3D+ "rrdcached"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110683): https://lists.openembedded.org/g/openembedde=
d-devel/message/110683
> Mute This Topic: https://lists.openembedded.org/mt/106476549/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

