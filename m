Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252D7C4332F
	for <webhook@archiver.kernel.org>; Sat, 10 Dec 2022 07:38:21 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.10461.1670657896141333181
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Dec 2022 23:38:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ADPNPotG;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-142b72a728fso2428572fac.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Dec 2022 23:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=idqUBFvZttDD2xZgXJVUgk1z7r6Cvom9khOj8WJWk30=;
        b=ADPNPotG7t1/ftLEtTwH7mWmnerqNCeKDDW3YTBfuo1mrdeOzqejlhuu8v8Fd7C+hC
         N8etsefytWNL4IJWC/W8AI/xjLC4/NviZXAJDvg51l2k5sck92F4r8RAyqwfXYvTmdvq
         +3cE5Aa672E86rkDUw+XiB9Du7mzSOHCxyhfSOocyvw6r2Q76Up2PcGWySwtN/oOYWZO
         zZtsAHjHbGrHtv0MN0oFo+COCbujr2xpB7EUGlEhNedN2TDKBxuZFAcE2+tDJyA73jth
         ctFD0Y5dycKNyVZI1MfRLxqhwoGZPGJAz0X/rV1EWDTGDD/nrMFM984QfIvvOhM15FNS
         OEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idqUBFvZttDD2xZgXJVUgk1z7r6Cvom9khOj8WJWk30=;
        b=vGIZc5FzATCVMpkXa1d3LDf/e6+2Lq8b0Tp3nueLuTRZMO6RakARl9Dy3Pytik4MYQ
         lxOs/Wic0lJpB1P4zKjwi53lLDunlpBk8TKy/Otc8ztqH46jK3odRgmOFU0TFmtQ3HCe
         sOYI9WjapgMXJRoT4FDoT4/LFPmyE+ePgZzulizRHS4ZLKzoj1z+JReSoRpons7jmQQP
         a2TnlOYhmuuONL2kRjqd/8DxcQlXTqPTq4cKKsu9yU0eUMW0T9Qj+PRv++1n6DW4lxIw
         WRjQfRz46nrSBYhCMd9UD6qGru3u9adDLYfVw0+RYrASjM5FjCvmR7bBmTJJ77/lH9Bw
         vqqg==
X-Gm-Message-State: ANoB5pm6M5x7thsm3gIUP/ldQW/d1hCo7pyVw4GKmiUU+nDGoKqA7Tmn
	vx32rvAZ6zawHrU0FFUtq0jwC2sfKTKyWS3KmeM=
X-Google-Smtp-Source: AA0mqf5ZseY7EOsS7tpOfrzZBHhtb2z7vJ1CntrWwIHE97tC/QKf6ICiFG6LyVNiuUoxOYqLpsgyrVwhjyEFxWBZzIs=
X-Received: by 2002:a05:6870:1784:b0:13b:1e05:a73d with SMTP id
 r4-20020a056870178400b0013b1e05a73dmr54990089oae.55.1670657895269; Fri, 09
 Dec 2022 23:38:15 -0800 (PST)
MIME-Version: 1.0
References: <20221210070938.5979-1-f_l_k@t-online.de>
In-Reply-To: <20221210070938.5979-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Dec 2022 23:37:49 -0800
Message-ID: <CAMKF1sogE3-itgNupQ3+jPa3mZAn-FHt06p3cO=S9uguG9EaEg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCHv2] editorconfig: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 07:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100022

On Fri, Dec 9, 2022 at 11:09 PM Markus Volk <f_l_k@t-online.de> wrote:
>
> It is needed by gnome-text-editor
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../editorconfig/editorconfig-core-c_git.bb      | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_git.bb
>
> diff --git a/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_git.bb b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_git.bb
> new file mode 100644
> index 000000000..8c8ce6e34
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_git.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "EditorConfig helps maintain consistent coding styles across various editors and IDEs."
> +HOMEPAGE = "https://https://editorconfig.org"
> +SECTION = "libs"
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f515fff3ea0a2b9797eda60d83c0e5ca"
> +
> +SRC_URI = "git://github.com/editorconfig/editorconfig-core-c.git;protocol=https;branch=master"
> +
> +S = "${WORKDIR}/git"
> +PV = "0.12.5"

its better to call the recipe with PV and drop setting PV here.

> +SRCREV = "f6b0ca395149b5a2fbd56a488cae30306a58170f"
> +
> +inherit cmake
> +
> +DEPENDS = "pcre2"
> +
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100020): https://lists.openembedded.org/g/openembedded-devel/message/100020
> Mute This Topic: https://lists.openembedded.org/mt/95578135/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

