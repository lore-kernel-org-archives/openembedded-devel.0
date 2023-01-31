Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19975C636CC
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 15:57:15 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.16106.1675180631908269337
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 07:57:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RZnrpPUY;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id p185so13191761oif.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 07:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fiwV2a6ROzBQ4HlVtoFz4Btg+8mG0F1/Iqe06kwl+uQ=;
        b=RZnrpPUYXKpBjQQrxdVx7V8Ko9PqhKScFrh9obZYSr7lhyzA+SLVcpydG8SHDsHxhT
         jciPoo9nclWvIIsuptQKe4K4ZLN232NgL+C8fBJlAaEv5sUwbdUbSxab7N7ZWgTDD1Sj
         fycJw14sGamsczcEzH5Qq8u2GvPlTqe4pPH1TPPVMxJYkRfBB3Uh2bwflvlPogfaqpCy
         htWdSCUzIDCj9UyWD1UJ3db/CuYM7W6zJluJ65oHJPfrdTP/0gB8NbCvFZ3SJmeRvKym
         54Yvh9jbEzoiiGKBGgZzyEXuydqAaVgTAvnCZodMGv2qv4G9DM7Qi4tVBYko8Hd2AKDj
         iDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiwV2a6ROzBQ4HlVtoFz4Btg+8mG0F1/Iqe06kwl+uQ=;
        b=E9wwmuBsOyXi7eImnOousRzc+QxDLmpUdR629pKgEfv2N3AwOvZ7LS0HzDATfel1x0
         93+2esbt+ABQWwjQsW/KSJlTJ2u3oY+K149+Sg3OuIppQFrfWtIuyLaOllOVOlYgxvbS
         t43jPnJV0XZ8IxlPBFNa6dyr2QnMkALsEvHxYK82g+4WXjE7y8KdX5fc+aJsf7bIRFKd
         wJcJYBwgR+8OjbjLs7xVGhNgMitnjNt23LGIxJSCz8CEboRFiRSUk+6Q8hfloY+49zWl
         SpkYYcpTc9UNvnX2D09rrjhtlB76JLJANND2WJJrU2RfGch1TR4SZrqUSPzb0ToWezF5
         O14Q==
X-Gm-Message-State: AFqh2kq1RBFFps1TmLs0iXrY4iDjTFFS6UfcGfctC+bBt/XF1pB5+GQD
	C/k8iqUQwk2D7l0M3sQXL9AcykJOZsH2mrBV4qKIhq9dpZE=
X-Google-Smtp-Source: AMrXdXvi28oP3KuclmQa+/2MtfBSOerP+NUJyTCpDAZGP2gQxivAcZrFGIT1k5CQD+5t4FiMdjRv2b025fZWCPaJ8J0=
X-Received: by 2002:a05:6808:120a:b0:364:bd84:ca34 with SMTP id
 a10-20020a056808120a00b00364bd84ca34mr3356024oil.262.1675180630833; Tue, 31
 Jan 2023 07:57:10 -0800 (PST)
MIME-Version: 1.0
References: <20230131110231.1700882-1-jlu@pengutronix.de>
In-Reply-To: <20230131110231.1700882-1-jlu@pengutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 Jan 2023 07:56:44 -0800
Message-ID: <CAMKF1sp_jGYhHyvJWMsinjxzow9RNd2pqRw+PDufWjPBBp9Yng@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] extract-cert: add recipe
To: Jan Luebbe <jlu@pengutronix.de>
Cc: openembedded-devel@lists.openembedded.org, yocto@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 15:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100879

On Tue, Jan 31, 2023 at 3:03 AM Jan Luebbe <jlu@pengutronix.de> wrote:
>
> The extract-cert tool is used to fetch the X.509 certificate associated
> with a key from a PKCS#11 token (such as a HSM or YubiKey). This version
> is derived from certs/extract-cert in the Linux kernel as a stand-alone
> tool to make it available when signing other software components besides
> the kernel.
>
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> ---
>  .../extract-cert/extract-cert_git.bb             | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/extract-cert/extract-cert_git.bb
>
> diff --git a/meta-oe/recipes-devtools/extract-cert/extract-cert_git.bb b/meta-oe/recipes-devtools/extract-cert/extract-cert_git.bb
> new file mode 100644
> index 000000000000..b2007eb8214f
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/extract-cert/extract-cert_git.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "small helper program to extract X.509 certificates from PKCS#11 tokens"
> +LICENSE = "LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> +
> +DEPENDS = "openssl"
> +
> +SRC_URI = "git://git.pengutronix.de/git/extract-cert;protocol=https;branch=master;"
> +SRCREV = "d652b4e8279aef2a85f58676ab472744bafeafc9"
> +
> +PV = "0.3"

Rename the recipe to extract-cert_0.3.bb and remove the PV setting here.

> +
> +S = "${WORKDIR}/git"
> +
> +inherit meson pkgconfig
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100875): https://lists.openembedded.org/g/openembedded-devel/message/100875
> Mute This Topic: https://lists.openembedded.org/mt/96649870/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

