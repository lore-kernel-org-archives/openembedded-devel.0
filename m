Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D5ECC433F5
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 07:30:11 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web09.13675.1646551809752407546
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 23:30:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NGvr2E6Y;
 spf=pass (domain: gmail.com, ip: 209.85.160.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id b23so10895549qtt.6
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 23:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q0oCvswkrkS56BFWL9OEkYi97PFwHnek8Ij884k6emE=;
        b=NGvr2E6Y3MSD5DK3Ur8TaxVM40mE2rb+/jIVDi7PGdBbLcfdk8bA/w/z+YypvN6xjS
         HOsQVeaLobSVZDb7JeJsZVA/40UJ/kkU6QnYuA52vR6EU3LalOTGWJ6DKb6sSxS4Vc0p
         XgF/0VqRwzipXhPTNVeKnNk2zey8VASxOi1lVc1CAS9MVS9lNz4nYUS6CDlwavmeOO3z
         chUB1di97DKTGvES/vQo9IaSii31oB8SwqX8FgkMtoraf6C20qg65+8yk3vGtRKIqMWC
         fIYrWuPWa8lTZAk4wlnTw1PiRGaqL3Z/EQa+2IAMNJ3c8mqsqv8rFqHQb9amy12+CktS
         wtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q0oCvswkrkS56BFWL9OEkYi97PFwHnek8Ij884k6emE=;
        b=XftyYx3ITbBQpqMkn/awxM1/6zHj/Wr5FeurnT6zF2uvVDM5VsDYDAV6bx9xvmFuTH
         pcsnWmpnS4QeAona05C4xWkhZvMNrPTGldg3vh1cCmkESDGeC+oqIM7qRdJpm1oJn2Ji
         CcohkTLs+JvP37C7CSsh61EGNrQg74hjmmBkoC8Nl3IHtR8xZ97o50v/I3gjIikgqCSk
         8wi64BogZzJk7geyPCBpgYHruWjaT/XDq96K9rJHOnYoA41IL/l+09reMPq+A13nLH3Z
         786/cG5v1rhMXzlgrCLDIE6oLN0NrJcQAxRJQmEls1S/+QFuTR5vKn6ujyv+54uPE/+A
         H8LQ==
X-Gm-Message-State: AOAM53143DTORjeYbJ9YZi8zOlcVGrGmKGZkn8K8L8aD++WV++1D10q+
	rIkuQSJHZADob28uTz05ui79hAlZADn3NCdZlHs=
X-Google-Smtp-Source: 
 ABdhPJx+0X60AuLcr+V4/Yp+cxzd+3x7uj+r8QcZYDZ0h0Ekc37Grs2y2s2Rx1Pm3ks7CpDP3oy/xN909GOkQ8YijEw=
X-Received: by 2002:ac8:7dd1:0:b0:2de:600:a5ab with SMTP id
 c17-20020ac87dd1000000b002de0600a5abmr5212538qte.532.1646551808809; Sat, 05
 Mar 2022 23:30:08 -0800 (PST)
MIME-Version: 1.0
References: <20220306063116.710-1-sam.van.den.berge@gmail.com>
In-Reply-To: <20220306063116.710-1-sam.van.den.berge@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 5 Mar 2022 23:29:42 -0800
Message-ID: 
 <CAMKF1sriSNk8FQJhUSHumG5eoA+5d_w4EzeidDwzm_0oZrNTFQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libiio: point PYPA_WHEEL to custom location
To: Sam Van Den Berge <sam.van.den.berge@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Mar 2022 07:30:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95813

Thanks for fixing this

On Sat, Mar 5, 2022 at 10:31 PM Sam Van Den Berge
<sam.van.den.berge@gmail.com> wrote:
>
> From: Sam Van Den Berge <sam.van.den.berge@gmail.com>
>
> This fixes the installation of the python bindings of libiio.
>
> Signed-off-by: Sam Van Den Berge <sam.van.den.berge@gmail.com>
> ---
>  meta-oe/recipes-support/libiio/libiio_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
> index f33fc0c1c..19753a13b 100644
> --- a/meta-oe/recipes-support/libiio/libiio_git.bb
> +++ b/meta-oe/recipes-support/libiio/libiio_git.bb
> @@ -15,6 +15,9 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>  S = "${WORKDIR}/git"
>
>  SETUPTOOLS_SETUP_PATH ?= "${B}/bindings/python/"
> +PIP_INSTALL_PACKAGE = "libiio"
> +PIP_INSTALL_DIST_PATH = "${B}/bindings/python/dist/"
> +PYPA_WHEEL = "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-0.21-*.whl"

perhaps we do not need to set PYPA_WHEEL perhaps. I am also wondering
why its not failing in
oe world builds. Can you check it again with latest master-next of
both core and meta-oe


>
>  DEPENDS = " \
>      flex-native bison-native libaio \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95810): https://lists.openembedded.org/g/openembedded-devel/message/95810
> Mute This Topic: https://lists.openembedded.org/mt/89585637/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

