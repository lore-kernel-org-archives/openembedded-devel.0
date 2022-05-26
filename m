Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29095C433F5
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 23:33:35 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web08.1709.1653608011125619844
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 16:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PlbKvv7Q;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id b11so2628851qvv.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 16:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PCD+KuF99QNJVaq7nisEneymvVbYyDlqSuBpVuY1Qlw=;
        b=PlbKvv7Q4p1Zajcl6ZKgRF/bnaR7PwqSQZmAkg3tcJ6f2uvpp2PL1jvblmhPZkGxyZ
         iLGcFmOKnJvmUWZ/QzT+PYZ2U0540OtTscrQnuH7/OxaMFD4dCxbim8O2pSlTMkKKYCN
         74igzBGkSBVl3i7HQCGDYRXqut6sVkK729V2ZIcTrgI9sLyJmZycSZZNgTLO5tkHZy4+
         aV02Uj+a374rgkHN32l4qCiJRSOxihvYvOyBd1tO3wPZy4oVmo7beFy/N+R8pe1deqRs
         bYrB0V6tP38MCE9/9TkZDomkWo/7dpjX2zwIn/agPJM/Y72Obm6L1t7bMqnGkYHoAmnV
         pmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PCD+KuF99QNJVaq7nisEneymvVbYyDlqSuBpVuY1Qlw=;
        b=5Aun9HkYWTdTXeKzrESWpsXOlpRitwfKk8ngagzgJTSKuXBEeml1gCjCnfg9416u/6
         H/2EsvvF4E8MkRYxaMii1p8hwDZr00B/kEeeITuUzY8Qm0mAWh5xNmrTGt+nHdYkhQ5X
         bXSVDwGt6zGXQyS2fetTKlJQs+8WJv+Mn+CmM6wZo2a5AQ2qypt+oOVT4JLRPHWX+98A
         NShTL1wjZQ5jaULVImEQ6tAN3LyDJ62QAxC6VNROGcciEE/vCH9N8tpY+CS0MN0XysNH
         MFk95XruEdgATQQHAdJ/noHKQzvmcIZzc0InCaHN8No4LXnLKLf0uQZ+d/iQUgjsGDQl
         +NZA==
X-Gm-Message-State: AOAM533jBt04SbTWaD5NFCK3qndIBN4FWaRF2PI8ikWL13vZ5OWeJo1W
	1u3Vxm/TEaQUkq0Envj9SRxEDND0OUSFO6lZRo0=
X-Google-Smtp-Source: 
 ABdhPJyrDo8HzTOXD71IXozvfbOlzrwwoLOucNxWfEvzWBU4K1HC7wDi/flkHzAPXc/X3dEXLScMWKVCpN7Qk26s5Y0=
X-Received: by 2002:a05:6214:4118:b0:462:e0c:897f with SMTP id
 kc24-20020a056214411800b004620e0c897fmr28955406qvb.63.1653608010118; Thu, 26
 May 2022 16:33:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220526231444.608039-1-zach@aquabyte.ai>
In-Reply-To: <20220526231444.608039-1-zach@aquabyte.ai>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 May 2022 16:33:03 -0700
Message-ID: 
 <CAMKF1srYaxqA5=at78vQtFG60wR2ZQYsbNQ-BTUQ9yhvnSABFA@mail.gmail.com>
Subject: Re: [oe] [PATCH] ccache.bbclass: document CCACHE_MAXSIZE variable
To: Zach Welch <zach@mandolincreek.net>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Zachary T Welch <zach@aquabyte.ai>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 May 2022 23:33:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97283

you need to send it to oe-core ml

On Thu, May 26, 2022 at 4:15 PM Zach Welch <zach@mandolincreek.net> wrote:
>
> Setting this avoids premature cache object eviction during large builds.
>
> Signed-off-by: Zachary T Welch <zach@aquabyte.ai>
> ---
>  meta/classes/ccache.bbclass | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
> index 4532894c57..913304ab35 100644
> --- a/meta/classes/ccache.bbclass
> +++ b/meta/classes/ccache.bbclass
> @@ -12,7 +12,12 @@
>  #   Set CCACHE_TOP_DIR to a shared dir
>  #   CCACHE_TOP_DIR = /path/to/shared_ccache/
>  #
> -# - TO debug ccahe
> +# - Adjust the ccache size limit to avoid overflow during large builds:
> +#   export CCACHE_MAXSIZE = "100G"
> +#   To find a reasonable limit, set this limit to 0 (no limit), then
> +#   observe how large the ccache directory grows.
> +#
> +# - To debug ccache:
>  #   export CCACHE_DEBUG = "1"
>  #   export CCACHE_LOGFILE = "${CCACHE_DIR}/logfile.log"
>  #   And also set PARALLEL_MAKE = "-j 1" to get make the log in order
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97282): https://lists.openembedded.org/g/openembedded-devel/message/97282
> Mute This Topic: https://lists.openembedded.org/mt/91366017/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

