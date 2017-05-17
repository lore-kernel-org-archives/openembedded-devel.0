Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9CDFA77D4A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 12:27:41 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id d127so3199711wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 05:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=67F6o4FXB/QFGrfBjvLKVD2X6uTCm/SLI8MHKjXhCRE=;
	b=gWLKp/kEqhALqDqm8ybGTmH0cB4eMzH/ol8G/x3Qv2G/V88w1ttB0kJsUoRysARkeO
	Y75VxldvShv78p/cols1BJg+wXeSgX5feZWhV4LeeEvou976ncEgBC0X8tO0zU31KY89
	3+nhb2WyyYWHkO+ELgEsPcd9ki5LBRaTW8zeuzHPp4oUZU58vuNAwzA3aBpmn0QwOjnt
	/ZW5nQGwIHhvMfI/5ZW7s2u7ZLmZkXbwtilrz0HSKnWndVzrRLWRrQe72FpcPZ/YseDp
	kzQgMkH/E6j6QJ3W/4qtRRsadkx+r5+/ezM4dlHTtdFXIjjsp36CKNLnOkncsgvNgTcg
	Clrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=67F6o4FXB/QFGrfBjvLKVD2X6uTCm/SLI8MHKjXhCRE=;
	b=sUY6ryYqx2cPScd1N+EMT8fRzzhIreREEUY4PvzEteXZPseecH7YbANE50lfF0mRqV
	X3FN5wVfWYLX57JdaeJSxCD5KRERCxH8Zo2JlNAhCXWp/adbrq9Ivr8dkuGgKfRxXGPM
	/eLLOg6jzfY4eR7hP75j2OwcdWkd55aX2nEBbLQHufy/APM4ZIeEXPYkl3qRcHKgchpl
	V/I8TSshe4TwHpUTudMd0B+V6sUR0Upr6ZgkXiL72lwezAba23gsAWHrJ0pgTwZc38QC
	RLJpi56zVZIm9zIl5x5PXIb8C0X3oyZC65nGTbNIfLFQfZYnIOZcZ4z91lUNPNQ2kCZY
	lIhw==
X-Gm-Message-State: AODbwcC1KW70GiZVsYlIafW3m6CW0hEgjMMKvBKfgsWOeOqIfM5aHhkM
	zIL4xo06nsGlDcZ7nrvUSL322Cujtg==
X-Received: by 10.80.149.209 with SMTP id x17mr2844289eda.175.1495024062521;
	Wed, 17 May 2017 05:27:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.213.154 with HTTP; Wed, 17 May 2017 05:27:41 -0700 (PDT)
In-Reply-To: <1494803346-189821-1-git-send-email-wei.tee.ng@intel.com>
References: <1494803346-189821-1-git-send-email-wei.tee.ng@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 17 May 2017 14:27:41 +0200
Message-ID: <CA+chaQd+TZgZOSFaaRchKrekYB3KiV66jOfxuqCkVSi-P=4QTg@mail.gmail.com>
To: wei.tee.ng@intel.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] dbus-daemon-proxy: inherit pkgconfig and unblacklist
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
X-List-Received-Date: Wed, 17 May 2017 12:27:41 -0000
Content-Type: text/plain; charset="UTF-8"

Can you set some better version in the recipe while you're at it?

dbus-daemon-proxy-0.0.0+gitrAUTOINC+1226a0a137: Package version for
package dbus-daemon-proxy-dbg went backwards which would break package
feeds from (0:0.0.0+gitr0+1226a0a137-r1.56 to
0:0.0.0+gitr0+1226a0a137-r1.0) [version-going-backwards]


On Mon, May 15, 2017 at 1:09 AM, <wei.tee.ng@intel.com> wrote:

> From: "Ng, Wei Tee" <wei.tee.ng@intel.com>
>
> The pkgconfig is not found in recipes specific sysroot. Therefore
> inherit pkgconfig is added to fix it.
>
> Signed-off-by: Ng, Wei Tee <wei.tee.ng@intel.com>
> ---
>  meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
> b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
> index a953ebc..b216410 100644
> --- a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
> +++ b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
> @@ -11,6 +11,8 @@ ASNEEDED_pn-dbus-daemon-proxy = ""
>  SRC_URI = "git://git.collabora.co.uk/git/user/alban/dbus-daemon-proxy"
>  S = "${WORKDIR}/git"
>
> +inherit pkgconfig
> +
>  do_compile() {
>      ${CC} ${LDFLAGS} `pkg-config --cflags --libs dbus-glib-1` -o
> dbus-daemon-proxy dbus-daemon-proxy.c
>  }
> @@ -19,6 +21,3 @@ do_install() {
>      install -d ${D}${bindir}
>      install -m 0755 dbus-daemon-proxy ${D}${bindir}
>  }
> -
> -
> -PNBLACKLIST[dbus-daemon-proxy] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130613/ - the recipe will
> be removed on 2017-09-01 unless the issue is fixed"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

