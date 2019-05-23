Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id E25CB7E3B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 15:21:47 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id j53so7157306qta.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 08:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hKPPLKpXnW/4eSxuE9b//fTv83Dig2xPd5REM6/h+mk=;
	b=XJd5CzvBhicE1d0bpY4JAIrCAo0cQknawihCTGXmQsW8vyRG69ukFc9eA/c/43YNgv
	3vbdbk7LeJRvD7AiwHL8wmtaujCLN/Vmb0WbNIIV8xE4+q2PU26lduVdLclFs6EHhsQI
	tpbdjxrJjOrBOhX95Y+d3JoOy4bGnNWzf8EMtSfv/fUT2FJpC/dZ9utM8H8YGlcF4VWn
	Iht+WHzm6xM5AGDK+MvtjM688xBWOHjWZhczdRcYcJAM/cCZSPUJaDc3+efB7hQMAJ28
	W+AzqtjMy78+Tnr12ifkpqdu+PzaNPTUmxxt7JIlfjfm5H1Qr4kwIH+iJPfitcwd08kk
	8x7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hKPPLKpXnW/4eSxuE9b//fTv83Dig2xPd5REM6/h+mk=;
	b=ATpoE6o7FwMiTOvgSCJQc+h+b08/Ah6CuWLPPokgrAzwP6mJWRyGXqkM1L6HBguAdP
	GElxAXFqZtQk2mnxSlgox6kmNhfvWqlSA35HlW80oroOODen0v7h+tK+cbEVtFwurS0T
	UUjS+2JmteVQ2amSdwAIuFBOZWf61z9KvRaskYysznrLjwPqBwNWLlldcB0JrOMdXtdS
	tIojjl/3f3W42rcYIOIwMRB4MZ/RWze++MvSG0D7/B0qox4b3zwlXyAmV0YipPE4iyoh
	vAwYqJctNqUpVQKyYccZNJ44PoON8d6u7tMbUhapx5gHEZISmg+j7pNCN+KXXWP87VxB
	5+8Q==
X-Gm-Message-State: APjAAAXIkIYTMKYKa8rBHARU/K6NIP/mdSgX3YzMkTD2HQXFR+z9wslA
	n0x4sbBGCi+KgjKFoGPlQkmNcZbKhAuig7Da66E=
X-Google-Smtp-Source: APXvYqxwlNxm27V7b2CLT8IJZ7kLNtKRjB9wZ1K5WiD5Oeev9FzPRbrrZ6ch0NCVWj2/5fFVSOrYZug0zCWiKkfucQc=
X-Received: by 2002:aed:23a8:: with SMTP id j37mr42898152qtc.53.1558624908508; 
	Thu, 23 May 2019 08:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190521210926.5236-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190521210926.5236-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 May 2019 08:21:22 -0700
Message-ID: <CAMKF1spwUr0cbT1Zf+tYhBUh5j8zcR8-_SPZJHCWyEODZ-7Jgw@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking] lldpd: update to 1.0.3
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
X-List-Received-Date: Thu, 23 May 2019 15:21:48 -0000
Content-Type: text/plain; charset="UTF-8"

This fails on musl

https://errors.yoctoproject.org/Errors/Details/241886/

I think limits.h needs to be included for missing PATH_MAX

On Tue, May 21, 2019 at 2:09 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Removed patch is not appropriate anymore.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  ....service.in-Use-fixed-path-for-mkdir.patch | 32 -------------------
>  .../lldpd/{lldpd_0.9.8.bb => lldpd_1.0.3.bb}  |  5 ++-
>  2 files changed, 2 insertions(+), 35 deletions(-)
>  delete mode 100644 meta-networking/recipes-daemons/lldpd/files/src-daemon-lldpd.service.in-Use-fixed-path-for-mkdir.patch
>  rename meta-networking/recipes-daemons/lldpd/{lldpd_0.9.8.bb => lldpd_1.0.3.bb} (91%)
>
> diff --git a/meta-networking/recipes-daemons/lldpd/files/src-daemon-lldpd.service.in-Use-fixed-path-for-mkdir.patch b/meta-networking/recipes-daemons/lldpd/files/src-daemon-lldpd.service.in-Use-fixed-path-for-mkdir.patch
> deleted file mode 100644
> index 4876e1794..000000000
> --- a/meta-networking/recipes-daemons/lldpd/files/src-daemon-lldpd.service.in-Use-fixed-path-for-mkdir.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From f9f3e4dd31588cce5f655730da7b5c3f56a9bdc1 Mon Sep 17 00:00:00 2001
> -From: Fabio Berton <fabio.berton@ossystems.com.br>
> -Date: Tue, 26 Sep 2017 09:19:51 -0300
> -Subject: [PATCH] src/daemon/lldpd.service.in: Use fixed path for mkdir command
> -Organization: O.S. Systems Software LTDA.
> -
> -@mkdir_p@ is expanded to host tools path ../build/tmp/hosttools/mkdir that
> -doesn't exist on target. Remove @mkdir_p@ and use /bin/mkdir -p to
> -create /var/run/lldpd directory.
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ----
> - src/daemon/lldpd.service.in | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/daemon/lldpd.service.in b/src/daemon/lldpd.service.in
> -index fdb7338..4291830 100644
> ---- a/src/daemon/lldpd.service.in
> -+++ b/src/daemon/lldpd.service.in
> -@@ -9,7 +9,7 @@ Type=notify
> - NotifyAccess=main
> - EnvironmentFile=-/etc/default/lldpd
> - EnvironmentFile=-/etc/sysconfig/lldpd
> --ExecStartPre=@mkdir_p@ @PRIVSEP_CHROOT@
> -+ExecStartPre=/bin/mkdir -p @PRIVSEP_CHROOT@
> - ExecStart=@sbindir@/lldpd $DAEMON_ARGS $LLDPD_OPTIONS
> - Restart=on-failure
> - PrivateTmp=yes
> ---
> -2.14.2
> diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_0.9.8.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.3.bb
> similarity index 91%
> rename from meta-networking/recipes-daemons/lldpd/lldpd_0.9.8.bb
> rename to meta-networking/recipes-daemons/lldpd/lldpd_1.0.3.bb
> index dbd84cf67..9a912a2fe 100644
> --- a/meta-networking/recipes-daemons/lldpd/lldpd_0.9.8.bb
> +++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.3.bb
> @@ -9,11 +9,10 @@ SRC_URI = "\
>      http://media.luffy.cx/files/${BPN}/${BPN}-${PV}.tar.gz \
>      file://lldpd.init.d \
>      file://lldpd.default \
> -    file://src-daemon-lldpd.service.in-Use-fixed-path-for-mkdir.patch \
>      "
>
> -SRC_URI[md5sum] = "8809600492f6b73149eb19158e819c1f"
> -SRC_URI[sha256sum] = "9ee494e91bc33938575b2c09b26188c486ef8eac6e2155d250c189cc4e988c4f"
> +SRC_URI[md5sum] = "04844328f053ee343344d892efb8a00c"
> +SRC_URI[sha256sum] = "39fced395168015416bfe78b95414facf066f841f349024433aa20ab54e4c360"
>
>  inherit autotools update-rc.d useradd systemd pkgconfig bash-completion
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

