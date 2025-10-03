Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CC8CCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 16:42:33 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.web10.753.1759509745592388372
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Oct 2025 09:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gASXdQCK;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6354af028c6so2394411d50.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 09:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759509745; x=1760114545; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVanvkgBzFYebMRtQ8rNGj9wPcvOgIfsAWkjMENZwWM=;
        b=gASXdQCKCPi7Tig1QFF7SHOu+wD+sTCmGqLm2Hf08/hN9XUH3OQNOfS63tspJz1hwg
         on90vhGa00vnlP42lDyghNT1ZT238v5W+18vsSIN8mb+zqoTwZhaO7Q0OjBlU0VEt8TI
         yLxwVMHZwmSRIZ9vA71etwFH0439l1x6EbnBoVjZmD0HEJCX9u8iyyJiu2TOBSzlqIev
         vuPixVMphsR6xa2wgXOojXHGKuyaWyPlZwn7bkLYWLA9BIxXQA9FSZe2IF7p6PVAv+3J
         xdhnOV0hA3BcFKb1JSJRqTC4PyJTVU3pa3lX0drwWWiSadtsrizn9II9jr/xl7IQOwBW
         7iTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759509745; x=1760114545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVanvkgBzFYebMRtQ8rNGj9wPcvOgIfsAWkjMENZwWM=;
        b=oiI5AFn057CIUWFiYQ881y5H4gZssrPpHoUN4JNqXxnLpARubf7ZsW6EsJyW07vUxx
         uVHsJbl4ThkFFCtwar4z8tGqsqS4imAu5CQkN3vy3aAM5fuBhLQVWe8Alv9wUeFI3AjQ
         hr1EsncNqFx/zITzzamltL9xLnTR/FcostmkridjcQ/EytL/j8HBgZzZRjBvNibJjXZ2
         dsRvkBfF5ZmUe2S5Wi29NH5V1LhXlndmzZQLsm8LQvAzDrO7Uek3jC1boFolx7D6tLZF
         NiqjQ5nKwbUtnC1rBVy20RNtHSxxkQUMpy8T9SZj86/xRsptCzVTjfMhIwYUn/W2ixCn
         bzSQ==
X-Gm-Message-State: AOJu0YxUMmxqRjgKShCcJEA+xjD1nPxS7fHv3mnQDHLlLerpr9BF4BdY
	luCGx5mjAqRYqKZYU0UxWLlilOzCOHG8vFgY0Q4raFQon7Fj7iGMZbZGapzCOcx+jEoBb7OOvAw
	QjS5JIZMrusdvKdLAZvNpqLxaPErujQAh7VBd/Ps=
X-Gm-Gg: ASbGnctCmw6f7k8ggV4G8Sboc3R/VT3a9uqABGfIuf4XvDNCphAdpHDaSCMKDhJJn1U
	NSYHyOilbEQWh9QEMLKJWFWHT/Xj4Q46NhVMfGUgO7WrP4Lou5kJUupq5Zfspsws0PiAWc+Cp44
	iQHu9rAAb5yGavgQofrr2KN9zou/ufTRerF7qhgi2J7grjptovyytEOLeX+dbsEaW2t82S0aawc
	yo2mRB4Pe5XsWRaJXF0Sy9KOfCr3xJRpbPMrN9zOT78Rg741QCIaNYqGt6VOw9uaEgZ20civtIs
	82gk8owiCQHUNakk9zcWAYRnFfudVjhAVzFw7VMvEIWWql2tKP+Ui3+4OOuCqt/moCvLUtqLU3L
	VwzI2
X-Google-Smtp-Source: AGHT+IE4XOrwLj0XI9cQNeWEIk0iKetCQrmOxesg/yqPW6o/h6bRMoRZQX9WVES5CQhRtC5ajk7usCvJttwwcjj/Rd8=
X-Received: by 2002:a05:690e:38f:b0:629:acb6:d8a with SMTP id
 956f58d0204a3-63b9a0ee4a7mr2629305d50.26.1759509744477; Fri, 03 Oct 2025
 09:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20251003065609.499113-1-yogita.urade@windriver.com>
In-Reply-To: <20251003065609.499113-1-yogita.urade@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Oct 2025 09:41:58 -0700
X-Gm-Features: AS18NWD8KJJiv6r9gyAEc-EDPQTE88eWDxBbvfRatL49Xw94Z8z7YY1jx_oJUto
Message-ID: <CAMKF1sqh+wgARdmhOUmrypQ2QYhwHajpjez7XODK5gUcrGzwjg@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 1/1] mariadb: fix failure for
 starting of mysqld.service
To: Yogita.Urade@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 16:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120221

On Thu, Oct 2, 2025 at 11:56=E2=80=AFPM Urade, Yogita via
lists.openembedded.org
<Yogita.Urade=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Yogita Urade <yogita.urade@windriver.com>
>
> It fails to start mysqld.services:
>
> root@qemux86-64:~# systemctl start mysqld
> Job for mysqld.service failed because a timeout was exceeded.
> See "systemctl status mysqld.service" and "journalctl -xeu mysqld.service=
" for details.
>
> In the source code, STACK_DIRECTION is already set:
> cmake/os/WindowsCache.cmake
> 192:SET(STACK_DIRECTION -1 CACHE INTERNAL "")
> so no need to add in EXTRA_OECMAKE removed from recipe file.
>
> Reference:
> https://jira.mariadb.org/browse/MDEV-36051

It is fixed in master via
https://git.openembedded.org/meta-openembedded/commit/?id=3Dcdd8b41d6e3b20c=
a562df49aa0710f07a6218f20
please cherry-pick the same to release branches, it maintains the tree
history well.

>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>  meta-oe/recipes-dbs/mysql/mariadb.inc | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
> index 6e7c01a775..f0cec75568 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -95,7 +95,6 @@ EXTRA_OECMAKE =3D "-DWITH_EMBEDDED_SERVER=3DON \
>                   -DINSTALL_SYSCONFDIR:PATH=3D${sysconfdir} \
>                   -DMYSQL_DATADIR:PATH=3D/var/mysql \
>                   -DCAT_EXECUTABLE=3D`which cat` \
> -                 -DSTACK_DIRECTION=3D1 \
>                   -DHAVE_SYSTEM_LIBFMT_EXITCODE=3D0 \
>                   -DCMAKE_AR:FILEPATH=3D${AR}"
>
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120210): https://lists.openembedded.org/g/openembedde=
d-devel/message/120210
> Mute This Topic: https://lists.openembedded.org/mt/115566143/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

