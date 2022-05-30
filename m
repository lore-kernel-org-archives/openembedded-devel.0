Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4787C433F5
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 14:44:00 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web09.37553.1653921834032488782
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 May 2022 07:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LVA/z8nH;
 spf=pass (domain: konsulko.com, ip: 209.85.166.173,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-il1-f173.google.com with SMTP id j16so2421596ilk.8
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 May 2022 07:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=9fPb2fMXID8/VObt+oWnoN81pqCP33BtUsYByRt73SY=;
        b=LVA/z8nH+pmbx45sFUWyyuwy8+2x59bthNQPO29+eEIL1QfMUzbmavVRAa+d26mYoX
         FrrfaDuc/PpcezmAe9UbuJ8hZegKIzvArl5441veYFLSdYk8myQUnCTJQ7GoshrteJtl
         2ZX96ZOUtxJEDdFRD/szufqTjiADLNUbVjJIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=9fPb2fMXID8/VObt+oWnoN81pqCP33BtUsYByRt73SY=;
        b=ETmnbbqKeorDuJwpp7PqcGRmNn5LUwjLempO5vCXncWCb37Mxnx7skXTh5/ip+Bj26
         1uvK/pUP6/vQEWwr6lzrjY7DRBNPscHH3H3A5rmTb83d/dygJ4orlS8eecgXtuGbj6rq
         VyRXYCf4mRYve9j0J9OGeF7YCCbpfSsnIgpf8jq+jO96xEeAc47KWctxfLMtWLgSzmwH
         /xa+Mg5joZVsej5BiX4emoLg63iYG0bIVANohCcf+w7ZMKhOu9Cv3F8aNOzE49xM8JgZ
         LulMjoAvigbQpXH+y4dPGfc0DntCHcUSq0ymwLT8BD8aphV9kV9f5HoP4XNmSvJqGAgN
         9ycw==
X-Gm-Message-State: AOAM531vFjyHY+Wjn3QtmFPnFMJdSSyfRTD9rLtr4mNBYMH/5jXFZdAN
	hwME6SYyeHTD645HR8j0XWaxrg==
X-Google-Smtp-Source: 
 ABdhPJwbd3diG/nsktZxejzXcHKZLkLfudsRSuHMTwFQ3mmgDvky1xb3sGGfTjJeyLW7kQXsM03Z7w==
X-Received: by 2002:a05:6e02:12c8:b0:2d3:7da8:32a4 with SMTP id
 i8-20020a056e0212c800b002d37da832a4mr7836718ilm.294.1653921833397;
        Mon, 30 May 2022 07:43:53 -0700 (PDT)
Received: from godzilla (192-0-174-222.cpe.teksavvy.com. [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a92300d000000b002cde6e352c7sm3718691ile.17.2022.05.30.07.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 07:43:52 -0700 (PDT)
Date: Mon, 30 May 2022 10:43:51 -0400 (EDT)
From: Scott Murray <scott.murray@konsulko.com>
To: Samuli Piippo <samuli.piippo@gmail.com>
cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-multimedia][PATCH] flite: add recipe
In-Reply-To: <20220530122952.2715776-1-samuli.piippo@qt.io>
Message-ID: <9881391e-a6d9-beb4-14a4-de636795c22@spiteful.org>
References: <20220530122952.2715776-1-samuli.piippo@qt.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 May 2022 14:44:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97338

On Mon, 30 May 2022, Samuli Piippo wrote:

> CMU Flite (festival-lite) is a small, fast run-time open source
> text to speech synthesis engine developed at CMU and primarily
> designed for small embedded machines.
>
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> ---
>  .../recipes-multimedia/flite/flite_2.2.bb     | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
> new file mode 100644
> index 000000000..9ab9c0208
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "Flite: a small run-time speech synthesis engine"
> +HOMEPAGE = "http://cmuflite.org"
> +SECTION = "libs/multimedia"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b3b732d1349633a53e69356607fd2d6c"
> +
> +inherit autotools-brokensep
> +
> +SRC_URI = "git://github.com/festvox/flite.git;protocol=https;branch=master"
> +
> +SRCREV = "e9e2e37c329dbe98bfeb27a1828ef9a71fa84f88"
[snip]

There's no 2.3 tag, but the README.md and Makefile imply that 2.3 was
released in March 2022 (see commit 530060de), and the current voice files
on http://festvox.org/flite/packed/ are "flite-2.3".  So perhaps this
should be building that instead of the ~2 years old 2.2?

> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OECONF += "--enable-shared"
> +
> +do_install:append() {
> +    chown -R root:root ${D}${libdir}/*

This seems a bit odd, I'm curious what prompted adding it?

> +}
>


