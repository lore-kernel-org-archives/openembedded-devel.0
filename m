Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF7DC4321E
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 22:08:10 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.615.1669759686874554005
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Nov 2022 14:08:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aNblmKtR;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id t62so16790291oib.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 14:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hRCsV2y4WLQXuYnFpwB52T1+iQkyAaGWpyKG+soFMLA=;
        b=aNblmKtR90HI6lw/AOd6EGpNb7uzuJgIVmYyZP/cYrcB8/S2Fs+EIcp7HUyrWkmqcF
         NLymMvkduXxYg1aOEpsHUncnC+nSTtqppvtRvmkhbMxT3HQ3a5/LyD6UF2JXVCfw7oiE
         aZOO2BlJiZE+8j40IHFSa6ssbkI8VFbjuADolIWmgQVxzgSbfp0Z2++G1LUf1oJ1U3WB
         5FzWKejlQgBle/n/yHbf8cN9GovV5gO0DHYjGkU0PVXCpBh6sPPrZhKuxiL1DArs893P
         v028p+rQdwvBRMz64HGwb3qye/K4poC0tULxzPEWrMPOT/93upsuMkseddwqAIP4ZbaK
         tFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hRCsV2y4WLQXuYnFpwB52T1+iQkyAaGWpyKG+soFMLA=;
        b=FeewKyvgNKSnD/eL4Pecj3ifiSpxve74FhubpAYat48W3r/j7DLEdtB9UXtFQ7CJfA
         XXwTk1e6V8ui/eOcshHBKMHbgu6pS3fqVEwwmMUnzd//X9zOGj3uk42o3baMc0mHfaP4
         Z6GEalhGXvxfHJzVJsyQTsDLJygq0tlhZ/hAMIibxPo18XLXBhxv51GmKW8zqTNm6zCY
         FZk5LTKpmsIYdvHDvUkI+00lJQEDEGvs3XMyM6Ld4tnR2Dk4zlqaSOdIDU0mIKd16IRP
         UVGEqJa3AvelolPG6x09aQWrVKmsmy5ypYPypWewYHKb0Czfp28IeARbIGW+821s72hI
         EkpA==
X-Gm-Message-State: ANoB5pk88w8W7wE06v5swAeGLEOqfa/3SVhlVecurqJAi7q0N3lrRNjP
	1aBXL8OhYNNssxSp00vwCN97trAFWG20C8OGDY2gWwgZS8w=
X-Google-Smtp-Source: AA0mqf5MJbQoZwenu8PgCqfg80+/z3lHLOdTLhwiFGoZwCwjhZzueKfIfHBZ2EIomZw1JPVK0uHDTXoDrmKiIk0Y5MI=
X-Received: by 2002:a05:6808:1c1:b0:34f:d32d:cad5 with SMTP id
 x1-20020a05680801c100b0034fd32dcad5mr29896503oic.262.1669759685965; Tue, 29
 Nov 2022 14:08:05 -0800 (PST)
MIME-Version: 1.0
References: <20221128151916.3541948-1-erwann.roussy@savoirfairelinux.com> <20221128151916.3541948-4-erwann.roussy@savoirfairelinux.com>
In-Reply-To: <20221128151916.3541948-4-erwann.roussy@savoirfairelinux.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Nov 2022 14:07:40 -0800
Message-ID: <CAMKF1soO15X2G6m9tA6c1AVGCPn62TOr2Rh893xdnzjcKdUs-g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 3/3] tuna: add recipe
To: Erwann Roussy <erwann.roussy@savoirfairelinux.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 22:08:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99850

On Mon, Nov 28, 2022 at 7:21 AM Erwann Roussy
<erwann.roussy@savoirfairelinux.com> wrote:
>
> Tuna is a cui/gui tool for tuning of running processes.
> It is useful to see and changed irq affinity on an embedded board.
>
> The chosen revision of tuna is the last commit to this day and not the
> last release. This is due to the python3-ethtool module which was
> required in the last release but isn't anymore. Tuna now has a built-in
> module instead.
>
> Despite tuna's homepage's dependencies section, python3-inet_diag isn't
> required anymore.
>
> Signed-off-by: Erwann Roussy <erwann.roussy@savoirfairelinux.com>
> ---
>  meta-oe/recipes-support/tuna/tuna_git.bb | 25 ++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta-oe/recipes-support/tuna/tuna_git.bb
>
> diff --git a/meta-oe/recipes-support/tuna/tuna_git.bb b/meta-oe/recipes-support/tuna/tuna_git.bb
> new file mode 100644
> index 000000000..f698b2ea2
> --- /dev/null
> +++ b/meta-oe/recipes-support/tuna/tuna_git.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "cui/gui tool for tuning of running processes"
> +HOMEPAGE = "https://rt.wiki.kernel.org/index.php/Tuna"
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
> +
> +SRC_URI = "git://git.kernel.org/pub/scm/utils/tuna/tuna.git;branch=main"
> +
> +SRCREV = "0681906e75e1c8166126bbfc2f3055e7507bfcb5"
> +
> +S = "${WORKDIR}/git"
> +
> +RDEPENDS:${PN} += " \
> +    python3-io \
> +    python3-linux-procfs \
> +    python3-logging \
> +    python3-schedutils \
> +    python3-six \
> +    "

it seems to depend on python3-linux-procfs which is in meta-python but
meta-oe does not depend on meta-python
as layer dependency, so perhaps it should be using dynamic layers or
perhaps should be moved to meta-python

> +
> +inherit setuptools3
> +
> +do_install:append() {
> +    install -m 0755 -d ${D}${bindir}
> +    install -m 0755 ${S}/tuna-cmd.py ${D}${bindir}/tuna
> +}
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99829): https://lists.openembedded.org/g/openembedded-devel/message/99829
> Mute This Topic: https://lists.openembedded.org/mt/95312027/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

