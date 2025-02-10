Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC8CC0219D
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 23:14:22 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web11.7332.1739229261701114989
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 15:14:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U7j7vglt;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5fc7d346980so526970eaf.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 15:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739229261; x=1739834061; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgL5vHae1DaNdtH/beYTiYuqk5ksQHXSR0H8NFfymiU=;
        b=U7j7vgltfEZKOm9lKaskrWqqk3/dlEf1lLFqMRFLk86n70djqsEGWLVNFRixSuuFuf
         IzCuUHv97snPBt3GoJiikpOZb06jE4BaqaL5Ig43JgqyOvW9wfRtK2dQcqJHe2YI7YOY
         zDgDkS6D7U+TTaj3fCU7Jrl5nkg+CgDcsv1hAII29euqw+ALF/LfkBunF8Tf42m5SIjP
         mTC8sU2zujppqJie3NjPsxwc5L866DtTpFK0y6J8eZf3r+vruE9H4bol8NSkOMR/R3II
         uGmuwQ0cR9QGrMxSBPcyRWduT/KD1tQHi9DkQb24c/+8tYdvHITjhGPrMuwA2rnUTrZl
         PpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739229261; x=1739834061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BgL5vHae1DaNdtH/beYTiYuqk5ksQHXSR0H8NFfymiU=;
        b=NBOCZSgOgksfrRgwZZ3HsxXHjSM8lSZ4lPkx0tI4MYxn5wOyX8zkW4NfA3+x1iwvco
         GyV9VvhByKP91OvnE2V8Lm9RGuMBZH7EBXZbPlR878hGIT3DVUD8ARLp9Fuu4tKgZWaa
         2ph8WrQpLdg82gNZHp//2KjqB5kUkSdpy92B6YyRQAlj6yXonXJobxoA7czc46jWMdRD
         9g+IG4wtdBa10XVABi7NEXti2/og0KM0N7m9ADULCHKvx1tOzJmuSTJGntXZSlhEsq7X
         CZL0GckOJUUSXNJh2cksAgobxPoU9f9cC0FZdEUV/wxZXdkxW0Si/fBPo8+pWwMJ5KJF
         UDoQ==
X-Gm-Message-State: AOJu0Yz9f+NXuunvPobdWrvWP10tGQWXpqh3GK77lTK/xKanEGdpHDbF
	rPWntgxsVwac29YE2VFE+ep3b8tYDu29HvAklGAfOKdlVG7sN9QbzqUjkf0oDOq6EZ1dWWEObH6
	O4RfUM/6Qa3Q5Df6mz7V/1qWrQOw=
X-Gm-Gg: ASbGnctjG8q70wzwhWpac/z/sTw/T0oJtlrvd0C+xq0Y9MLSRzqcAcoBud2RfBKtP8V
	FX481yQ1QWs6CqrZ0LSkNA/YNmXoapfHTx4e8VIHQ9CkCasNtrxZBzH4EBwTOnOWOcDhJFMoi3X
	GyVysEyytiABboygCpEOoprj/l
X-Google-Smtp-Source: AGHT+IFsMlrZdwru7caFakWeeBu0qvceBeIf7xGthTicfr29tODC6g7CSvIqlIkL29Fjmw52BBu+7SnNlO7nO7e+6qQ=
X-Received: by 2002:a05:6870:63a0:b0:29e:49b4:92b2 with SMTP id
 586e51a60fabf-2b83ec24da0mr9322746fac.12.1739229260534; Mon, 10 Feb 2025
 15:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20250210132923.933209-1-ravi@prevas.dk>
In-Reply-To: <20250210132923.933209-1-ravi@prevas.dk>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Feb 2025 15:13:53 -0800
X-Gm-Features: AWEUYZnUep9bliS3g4t6AOd9lvz2C0E5wPMp_o91cCM__Qo57rKkQ1UYe6jH5Ks
Message-ID: <CAMKF1soPmxVfZRLkMjWmMfv-FM=PqkDsdCnWHYDcPnXZRvKHXg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] systemd-netlogd: new recipe
To: Rasmus Villemoes <ravi@prevas.dk>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 23:14:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115409

Thanks for your contribution, since this recipe depends on systemd, it
would make it specific to that being in distro features so it can be
safely ignored on
non-systemd distros.

On Mon, Feb 10, 2025 at 5:29=E2=80=AFAM Rasmus Villemoes <ravi@prevas.dk> w=
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
> Originally sent to oe-core, but it was suggested the meta-oe might be
> a better place for this.
>
> https://lore.kernel.org/openembedded-core/20250207120628.909410-1-ravi@pr=
evas.dk/
>
>  .../systemd-netlogd/systemd-netlogd_1.4.4.bb  | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta-oe/recipes-support/systemd-netlogd/systemd-netlo=
gd_1.4.4.bb
>
> diff --git a/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.=
4.bb b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
> new file mode 100644
> index 0000000000..851817e9be
> --- /dev/null
> +++ b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
> @@ -0,0 +1,25 @@
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

