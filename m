Return-Path: <kergoth@gmail.com>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id CD19A7485C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 15:27:48 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id a14-v6so13175956otf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 08:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zz0JTXmHNxqtYR5xRpKsWUNkuwn1A2EklUk2dv0qjG4=;
	b=U+oBC1Z7yvvV58F+Ryjr1sVnxilcmYjUMPHWAH2u61vj+PrWV0rPgrIqzbiWOEIyOT
	tlmBDVI2eFrvY5c92VC1TaIemeubaTSrE67dPpUwg/gTvK0sHHPsVozMMZIflXA16WW7
	Vu3u0TD8o85tOJPUcXSbOBtRsdiLKIMSq6T39Mi9OLssEumjbnrbIfbdO2OD//4Ngmiy
	g2249XXWrTwjpViQKhBQz6GEP5JZRBwJsrN2Q9opDRUicss04XNQJSFqYlxc1qEasmWN
	AGT2n+yLhhaYTNaDYgOYHnJADY+X5bznbRrEY8LAMqIesqZhmZD28IGXqVMsmRmssKQ9
	JNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zz0JTXmHNxqtYR5xRpKsWUNkuwn1A2EklUk2dv0qjG4=;
	b=YBddWsxSCsYqpccQfhJs6AF/V+MQ63WaRSdcKSNaIfGfBEwwS89uSIySoQDxtUueux
	OzehmKij5PtkXJePfIAG09jMGWodtOACOUhw5RKggeduCZ676E+gSHQ42UAFNrgmILzc
	n0fCaPPQKdWiMJ1BvolgDYNrg+04C3DFQTKnho78Q8NZ/VA7aT7ajLchlGeN9iQTPIWG
	Mo8sXpuxFkFqW/SoZydezvAt4LyGBrfTny73OeSGOJV6IzIs5Ed7G/eInOO7GAeg6nyz
	v05md50zWPX9G9oH/KGSnWPorv6zMC9jIQrRG25wTj7PuTpjbrmuw4UbGh5Kb1NQYWev
	yvmg==
X-Gm-Message-State: ALQs6tBM32T09tb1eckv23moAv23klVagUs0yDNJPCerX8xJul7hifN+
	vMLP/X6QOK41v7l4uP8rqqMt5BehHyEbvvDKvP4=
X-Google-Smtp-Source: AIpwx4/f4NaN5aoNg3acTL7hho+C12m2YixZHynAufXXvm3h7NVMvAKtHSfPF4M907sjVKX55Z840AC1In2vFWmBQg0=
X-Received: by 2002:a9d:7403:: with SMTP id n3-v6mr485330otk.213.1523374069261;
	Tue, 10 Apr 2018 08:27:49 -0700 (PDT)
MIME-Version: 1.0
References: <1523370174-24440-1-git-send-email-christophe.priouzeau@st.com>
In-Reply-To: <1523370174-24440-1-git-send-email-christophe.priouzeau@st.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 10 Apr 2018 15:27:38 +0000
Message-ID: <CABcZANnTEFwZ6bJ8UeNs=pEi0zid6wDPQ=-vS6t2=APPGW2ogA@mail.gmail.com>
To: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] minicoredumper: relocate admin-binaries to sbin
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
X-List-Received-Date: Tue, 10 Apr 2018 15:27:48 -0000
Content-Type: text/plain; charset="UTF-8"

The commit message is generic whereas the commit is not. The commit changes
the startup script to match the install path, but the commit message
doesn't mention the startup scripts at all.

On Tue, Apr 10, 2018 at 8:23 AM Christophe PRIOUZEAU <
christophe.priouzeau@st.com> wrote:

> Sine the commit "relocate admin-binaries to sbin" on minicoredumper,
> minicoredumper binaries are installed on /usr/sbin directory instead
> of /usr/bin.
> src/minicoredumper/Makefile.am: sbin_PROGRAMS = minicoredumper
>
>
> Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
> ---
>  meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init    | 2 +-
>  meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git
> a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init
> b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init
> index 90ef7fa..9c96e31 100644
> --- a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init
> +++ b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init
> @@ -22,7 +22,7 @@
>
>  case "$1" in
>      start)
> -        echo "|/usr/bin/minicoredumper %p %u %g %s %t %h %e" >
> /proc/sys/kernel/core_pattern
> +        echo "|/usr/sbin/minicoredumper %p %u %g %s %t %h %e" >
> /proc/sys/kernel/core_pattern
>          ;;
>      stop)
>          echo "core" > /proc/sys/kernel/core_pattern
> diff --git
> a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service
> b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service
> index 851b54c..45d098f 100644
> --- a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service
> +++ b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service
> @@ -4,7 +4,7 @@ Description=Enable minicoredumper.
>  [Service]
>  Type=oneshot
>  RemainAfterExit=yes
> -ExecStart=/bin/sh -c '/bin/echo "|/usr/bin/minicoredumper %%p %%u %%g %%s
> %%t %%h %%e" > /proc/sys/kernel/core_pattern'
> +ExecStart=/bin/sh -c '/bin/echo "|/usr/sbin/minicoredumper %%p %%u %%g
> %%s %%t %%h %%e" > /proc/sys/kernel/core_pattern'
>  ExecStop=/bin/sh -c '/bin/echo "core" > /proc/sys/kernel/core_pattern'
>
>  [Install]
> --
> 2.7.4
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

