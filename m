Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f172.google.com (mail-yb0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3D5C378563
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 22:29:42 +0000 (UTC)
Received: by mail-yb0-f172.google.com with SMTP id j7so14794364ybl.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 14:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j135rvSZjAS7Klf6elGbbeYYWvZPrwMyfX2hmyNy78s=;
	b=eI4rYaLaVDczT/udym6n8MDjECeD4WN22oDEKiNnQX9fZROEcOA8AqDqVRw3U4ZKD6
	Ofgutbg1bh/Jt7aMuIROBw/jafZmZYYiakzhT2wN45/CkHBz0zEVYG+p7U+N8Cl0EkUF
	Xh+0Pv9wQ3gyc1FsXGIEqgqul9dUK6/iLSDaeVHRhcNsy8jGQSByc1Tdz2xtXEHRaHYJ
	W863iNf3C9PsDHgAWV57ifb6KyyHPqkk4hWEX5AxkJDyKbppj2ISU3DjkVjk7PnRnSoA
	l3KgVDSbhjDIK3iXgykVVdWAAj6WMf2zyWijh9qCrPlVZXvyoyTOaS88pYsXhDNZkuMG
	PMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j135rvSZjAS7Klf6elGbbeYYWvZPrwMyfX2hmyNy78s=;
	b=sh+DlL80o+l+7uXuRsYQ+ds2rVLSfynza6dSNIOr/vjc8zTASj0JpVbMLbWpg6IWc9
	PSpZ32ImkNM5FxAqE5yKbqPmRit4zbbYWXhXj3fSRyziRlZfookza4ypG93JXmSrwGKM
	qKtkpj4+7/cjbMOJqYlRkAjqhiPPnGikOc2cn6To4r7fn95VEL2lZhJVmdt0ik2PR7AA
	xw2ZGFELSOzpBGNjZIwXtzFTRUnjHtggjHX2kj/FQMJH6DE6ILC8nHimu+xRLFINzK3b
	5x2LFyry02+pfZRkQBkW5rVjFroOgZrQ1nvN7JBPGeiXSU4ZQd6NlfdziAJyhkmxJs8c
	4Plw==
X-Gm-Message-State: AKGB3mITKr1rDgFo41b0NwbEJOBqfnWc5aV5lVM/kr0aSTcjjfZaH6MT
	jxJPBgTq0MDxpSfnIUXxHW0ND4X2jzDOxYgxrYU=
X-Google-Smtp-Source: ACJfBotfWk+IYwg3Qwmp38k07zZfdQeJs+z0SHG5IUZ2Zestu0ypJHX47ceoRztxZMzFrqWEOXXkJZSX1+7dHzDpNPY=
X-Received: by 10.37.244.3 with SMTP id q3mr3931714ybd.247.1513722584142; Tue,
	19 Dec 2017 14:29:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.97.6 with HTTP; Tue, 19 Dec 2017 14:29:43 -0800 (PST)
In-Reply-To: <1f1db4cf-17aa-d1e3-4b0d-305d37dd029d@gmail.com>
References: <1f1db4cf-17aa-d1e3-4b0d-305d37dd029d@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 19 Dec 2017 23:29:43 +0100
Message-ID: <CALbNGRQYJc1fxOYL6+fE3GcxD-PDJnNMePba1DRn=j02Yvuv1g@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-12-17
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
X-List-Received-Date: Tue, 19 Dec 2017 22:29:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 19, 2017 at 8:49 PM, akuster808 <akuster808@gmail.com> wrote:

> This build included some meta-python changes that had v2 after the build
> started.
>
>
> == Failed tasks 2017-12-17 ==
>
> INFO: jenkins-job.sh-1.8.43 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.
> report.20171219_092527.log
>
> === common (7) ===
>     * meta-openembedded/meta-gnome/recipes-gnome/eds/evolution-
> data-server_git.bb:do_compile
>
^Have a patch prepared - it is at test currently

>     * meta-openembedded/meta-gnome/recipes-gnome/libgnome/
> libgnome_2.32.1.bb:do_compile
>
^Khem sent working fix

>     * meta-openembedded/meta-networking/recipes-daemons/
> keepalived/keepalived_1.3.5.bb:do_configure
>     * meta-openembedded/meta-networking/recipes-daemons/
> postfix/postfix_3.2.2.bb:do_install
>     * meta-openembedded/meta-networking/recipes-support/
> ntop/ntop_5.0.1.bb:do_configure
>     * meta-openembedded/meta-networking/recipes-support/
> tinyproxy/tinyproxy_1.8.4.bb:do_prepare_recipe_sysroot
>     * meta-openembedded/meta-xfce/recipes-xfce/gtk-xfce-engine/
> gtk-xfce-engine_3.2.0.bb:do_compile
>
^Khem sent working fix

FWIW: As mentioned earlier: Some of Khem's patches were refused by
patchwork. I cherry-picked them form his git repo branch [1]

[1] https://github.com/kraj/meta-openembedded/tree/kraj/master

Andreas

