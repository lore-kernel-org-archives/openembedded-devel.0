Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web08.23733.1606506694064484146
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2020 11:51:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RTvRj4+t;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id n132so5348094qke.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2020 11:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b5t6wANNE/ugboMJrAxhctOhmB7DkKUJPUh26HGCj+A=;
        b=RTvRj4+tUNdImTZ/onvl2q4n80nAUNhe0cKUoJu4uF4b4u75pUBNTtd0jwlLfzTVhU
         //j9UseMRTfnBT+DNZPIUQwmbNNIR2sGqDfLH9sXSAgs5aFk5ESnvEkbOmcUj57cJxsI
         L21W+MSRohcRUseiGfgodyd6zq8umMTyk9xi4Zv79P/gCBYF+PArqOFQDU0RZCJq+9tM
         jsPHl5kk/T37otMCc5T9yYmsXcT3i6qSaDI6H3RPkZHCkJ+Alcsj772lsl+3jFmmaWFN
         tTGoIK8ZEylPKQrWmbVJQpJtfss0KPRLFzgt8pwpIg18K0iZyUqLRxKbZBhZasvuJuId
         2G3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b5t6wANNE/ugboMJrAxhctOhmB7DkKUJPUh26HGCj+A=;
        b=a6kL8TePCLI8iFn3C28i3PlI6LXnA0TsEy1ufYpypxAg8JvqsywOSRE0xxZ9LLHa03
         n+xGsTPrnL0jEX3F6ABTr8WB+YidaPeOsL+9VMF13v/v3cFXUK4wy67vKWI5Z4uqfIWt
         91B7xYm7pPTcLVZI0wYQyhFf7yFci25ZSkJqDWZ0odVcA5mFJHCF0JSzMNHqynnFQgka
         hUkck91zXJttvlLbtlkt3H9VJtXNbXTDGiCwVsdIrkTG/UAyjLWLaw3uErdt0I38Kkb1
         ion/xZudnrJ0ai+5z3PLg92owb0b5JvSozjoXgNO2hhimt8wnQuASf1GaF5/SOIenA+t
         JgQw==
X-Gm-Message-State: AOAM533CJv/olceD+j7JdbqRCr6bMmo1Dtege/L8WhB2plJhhCuYqT+Y
	xUu//ClXNmDWfMtLU5bP3amtASSIWJ2iaZPranU=
X-Google-Smtp-Source: ABdhPJzUza3kcWBItCGK9BfHwQWytUYanVF0u3KIlGheCCuCmjzrczKub3q8+zJK+fesdal3Y+8hHOAIBJJszZBwDMY=
X-Received: by 2002:a37:a70e:: with SMTP id q14mr10060784qke.337.1606506693085;
 Fri, 27 Nov 2020 11:51:33 -0800 (PST)
MIME-Version: 1.0
References: <20201127153734.147135-1-beniaminsandu@gmail.com>
In-Reply-To: <20201127153734.147135-1-beniaminsandu@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 27 Nov 2020 11:51:07 -0800
Message-ID: <CAMKF1sqFj_6HvhgoX64=Zkx_wJRj6593crEJ_dzhTXHVexA2Rg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] trace-cmd: create recipe for version 2.9.1
To: beni <beniaminsandu@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 27, 2020 at 7:37 AM beni <beniaminsandu@gmail.com> wrote:
>
> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ---
>  .../recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb  | 16 ++++++++++++++++


Please add it to packagegroup-meta-oe as well.

>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
>
> diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
> new file mode 100644
> index 000000000..d9599c046
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "User-space front-end command-line tool for ftrace"
> +
> +LICENSE = "GPLv2 & LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=873f48a813bded3de6ebc54e6880c4ac"
> +
> +SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;branch=master"
> +SRCREV = "530b1a0caef39466e16bbd49de5afef89656f03f"
> +
> +S = "${WORKDIR}/git"
> +
> +do_install() {
> +       oe_runmake DESTDIR=${D} install
> +}
> +
> +FILES_${PN} += "${prefix}/etc \

user ${sysconfdir}

> +       ${libdir}/traceevent/plugins/"
> --
> 2.25.1
>
>
> 
>
