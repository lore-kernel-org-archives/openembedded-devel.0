Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0551EC021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 19:33:44 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.3002.1739475222881976895
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Feb 2025 11:33:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QGf8hOwE;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5fca2d12020so829914eaf.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 11:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739475222; x=1740080022; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5YWUWjyLwVNO15fD1tu8sIPPLATMnQExtYG2wSzLFI=;
        b=QGf8hOwE8tdJ4rBWBBrcRG6+wtDhWo4PicCg6BNByj4P1RBaI4MJDiytBK86o/dnEV
         yW47TH40wwHOt9SMVVDEKXT7Tmnv8hoWPEfg9eQtNEO0GYyqv+PY42YCHLNxWGhlY/cj
         Wa9yF7TkLNO1BeQzybk405PNgVq1AIbSchoWcpsuB1P/Fnhpf4D+AaIK35ywsmLnj0m1
         8azI8xEGvZEwbQYIlUybWtk/VjiCPrupLMYLUQmOIBpfyfYjh9c321VRAPsSaLv2ebSP
         PMRKJnVS+cNYtp/oJU4qDHp3Wn0+mLxfuKxj84vf4e5u2zehB1kM8iPTEVDgBqUDLZ3S
         8NZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739475222; x=1740080022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S5YWUWjyLwVNO15fD1tu8sIPPLATMnQExtYG2wSzLFI=;
        b=fD8YBFy7eLUoXi88OuwhAcNA+Us+ACuaXZw1P/HnQgtb+0nAF0JN4SLQHC5WdP10WJ
         bsNJnrtVPdl2LTJ10PnkAatMlK+/FevJ5VWRkLFU8iHqeyAhgcwtG7PoVzgcTYF543SJ
         uBCfAelMVLoGzhm2EvZT60+KRnV/apFC8AAoHSpy5lINnH3iAKVh067esc2/08Jqx7yw
         6h+eMrb9fi2O77f4sVOXfmOp4KrLqdwNNZGyRwWkh6Vz6eJYTCYyw5R1/Pn3JGxDR1Mp
         1sMqcBDb9sXZjzVk5LhmSXUOPu+BxV16aOjVOFZGH743KWLdplJW559wrfakNL0G2GPA
         fr7w==
X-Gm-Message-State: AOJu0YwsLZTUte98F19VPWbxtyD06PHdw7dXmaxijru6ziYMUGZE3Ftt
	jkIsTK1zRsW+piHCzm9r/T/2pDfZZG97ym6nxaCRIyDzOVmp4bgYlCQ22Fcs9fMZb8aVtJ0oG7m
	7MHM9B3JZxEw6i9+95yyQZLGH+ZbwAN2/uX4=
X-Gm-Gg: ASbGnctVeeyhTo3HuDxZS5c16uNewSJZkV7BU4V3mjcFf9RKhMxrDLUj6t/0p0PG3/O
	lzcpestvCAUfQ1rwe9/UcesHvjLAAJZqjaPJ84VbSbTMlimS/8FMCyV1zX6Y2pLGyau3SJvp+lf
	5ytbVIGHjiLO7xnJZYcQErhJL0QA==
X-Google-Smtp-Source: AGHT+IHwsctXeWrohoWpz4FujXnjSURftTVppUPHeXebz8InOzWV6qJmdvoGFqe7UawbFgZvq+xVdN3TmGajjebBrbU=
X-Received: by 2002:a05:6870:558c:b0:29e:2bbd:51ba with SMTP id
 586e51a60fabf-2b8d6526769mr4848316fac.9.1739475222036; Thu, 13 Feb 2025
 11:33:42 -0800 (PST)
MIME-Version: 1.0
References: <20250213141940.1231925-1-ravi@prevas.dk>
In-Reply-To: <20250213141940.1231925-1-ravi@prevas.dk>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Feb 2025 11:33:15 -0800
X-Gm-Features: AWEUYZlWSz2xz8fBN4KBwr69MU6V9R8DYcgRh5uMRrm5Eu_xz0okVOoy_GQB-d8
Message-ID: <CAMKF1sqky6=ig1AB+jzMcuGcq=1XAt+3yFWRWBsYOEOoLVPe9g@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v2] systemd-netlogd: new recipe
To: Rasmus Villemoes <ravi@prevas.dk>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 19:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115469

feature_check class needs to be inherited as well.

see
https://errors.yoctoproject.org/Errors/Details/844260/

On Thu, Feb 13, 2025 at 6:19=E2=80=AFAM Rasmus Villemoes <ravi@prevas.dk> w=
rote:
>
> From: Rasmus Villemoes <ravi@prevas.dk>
>
> In some deployments, the log aggregator collects log messages in the
> syslog format, so systemd-journal-upload and friends can not be
> used.
>
> systemd-netlogd is a daemon for filling that gap.
>
> Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
> ---
> v2: add systemd as required distro feature
>
>  .../systemd-netlogd/systemd-netlogd_1.4.4.bb  | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 meta-oe/recipes-support/systemd-netlogd/systemd-netlo=
gd_1.4.4.bb
>
> diff --git a/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.=
4.bb b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
> new file mode 100644
> index 0000000000..6b609a0f5f
> --- /dev/null
> +++ b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
> @@ -0,0 +1,27 @@
> +SUMMARY =3D "Forwards messages from the journal to other hosts over the =
network using the Syslog Protocol"
> +
> +LICENSE =3D "LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079=
008b364516c"
> +
> +SRC_URI =3D "git://github.com/systemd/systemd-netlogd.git;protocol=3Dhtt=
ps;branch=3Dmain"
> +SRCREV =3D "b03cc3b1a75048c7cf19467d8918a4b7320767e6"
> +
> +inherit meson systemd pkgconfig useradd
> +
> +REQUIRED_DISTRO_FEATURES =3D "systemd"
> +
> +S =3D "${WORKDIR}/git"
> +
> +DEPENDS +=3D "systemd"
> +DEPENDS +=3D "openssl"
> +DEPENDS +=3D "gperf-native"
> +DEPENDS +=3D "python3-sphinx-native"
> +
> +# systemd-netlogd uses prefix and sysconfdir in a weird way.
> +EXTRA_OEMESON +=3D "--prefix ${libdir}/systemd --sysconfdir ${sysconfdir=
}/systemd"
> +
> +FILES:${PN} +=3D "${libdir}"
> +
> +USERADD_PACKAGES =3D "${PN}"
> +GROUPADD_PARAM:${PN} =3D "-r systemd-journal"
> +USERADD_PARAM:${PN} =3D "--system -d / -M --shell /sbin/nologin -g syste=
md-journal systemd-journal-netlog"
> --
> 2.48.1
>

