Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73BBC00145
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 08:54:00 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.129246.1671094431632770701
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Dec 2022 00:53:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UjeAXaQG;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id i26-20020a9d68da000000b00672301a1664so2475226oto.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Dec 2022 00:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qDLV6yX8yf4ULt81KHu2tqF3qP8f9w+0LyPZWnGxdwY=;
        b=UjeAXaQGgiPzEwzVA8Q7+MhTzUt1ICpmOUC8XHT0DKuHtPp8F3zw2AegxAAw3pRqzu
         ph9hjwYVUogBas79dassF7KenqhG79xgeXsNQsI2TYvVf40p+a2ejsylZblFeZSBcbpl
         2zoKi6oqq3vqh7edevTU0/gOku3umyS5jP1gm1CJf64b+XJOP9ZoBz+zysWQfoXz+tF1
         SUn5ews3ZSFBIMhIHf2904yIzyrS9SIqcTHk0LuJuYsgVQyDSzrC81H4Z6rmu6VRA0Cv
         Re0rwgSMNgJBgNun3ViZpfMD1rudrrUaWP+FtrP9OVncx9Io8osaskv1iRns+hqTPlqD
         tiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDLV6yX8yf4ULt81KHu2tqF3qP8f9w+0LyPZWnGxdwY=;
        b=cPzrGk4mnJW4Ddp8nGk2v2LK/bR4Tk1Ofwjg06sX/sWkEqgOUfAc0t6Teo5uYPaFPt
         xyxpvvGDB/D9qrBb2VIh0rxLOIqtXGkDr4WZj6lyjeidMtGQ9FybqEZvMwZ4cVx9f5Vh
         XBb/GU7cSRCBfPVe7JPWS1oMzcncqbTIMGko/loFcM00/YKRok7yWwviyOCUf6+b27dL
         4YbVK7mBbItEGejcMjIJkjMYQpjS5x+ZA4fJ3ECVnkNzPc3zYVA+Helq1ZmDbP6RrVl4
         Dl5Kb2d92zMnkfvE9beKjbVR+L36tarDIRPiVnw4QXn6Itch9Xy71llQacJgt56o3qB5
         crVQ==
X-Gm-Message-State: ANoB5pnfrF5YhOge9AylMSZTw6pz9QpntsxSF2L/64j+JFmTieEkTS7V
	0MrJYpeTwza1KdR+CaitqZ3OHjBSs/iAHxKpMbc=
X-Google-Smtp-Source: AA0mqf7ee3Ua6svYC2MYT+ZWjjjEbH3JiBI4PYxBMdW5Oj7MFh1TpZJIjnzCjUkf5a1PeXu1J0Y4H1POFDebYmjwgkc=
X-Received: by 2002:a9d:6486:0:b0:66d:ca7a:8b1a with SMTP id
 g6-20020a9d6486000000b0066dca7a8b1amr39192707otl.55.1671094430792; Thu, 15
 Dec 2022 00:53:50 -0800 (PST)
MIME-Version: 1.0
References: <20221215073031.3781726-1-changqing.li@windriver.com>
In-Reply-To: <20221215073031.3781726-1-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Dec 2022 00:53:24 -0800
Message-ID: <CAMKF1sofOBRSSvVAD6VgsDwjkfY8zZukZCXpw-e_KLUezFcxKg@mail.gmail.com>
Subject: Re: [oe] [PATCH] graphviz: Do not build tcl support for native
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Dec 2022 08:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100082

its already in master
https://git.openembedded.org/meta-openembedded/commit/?id=fa616dca0a910aa75565de4988bc7a83102ed17a

On Wed, Dec 14, 2022 at 11:30 PM Changqing Li
<changqing.li@eng.windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> with enable-tcl=yes, task do_configure looks for tclConfig.sh on
> buildhost, and source it. But there is no dpkg-architecture in current
> PATH, and the tclConfig.sh enter into an dead loop since
> dpkg-architecture not found and finanlly Segmentation faulted. Therefore
> it is better to disable tcl
>
> do_configure failure:
> using /usr/lib/tclConfig.sh
> /usr/lib/tclConfig.sh: line 2: dpkg-architecture: command not found
> /usr/lib//tcl8.6/tclConfig.sh: line 2: dpkg-architecture: command not found
> ...
> /usr/lib//tcl8.6/tclConfig.sh: line 2: dpkg-architecture: command not found
> /usr/lib//tcl8.6/tclConfig.sh: line 2: dpkg-architecture: command not found
> NOTE: The following config.log files may provide further information.
> Segmentation fault (core dumped)
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb b/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
> index 4c51af669c..967b9321b8 100644
> --- a/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
> +++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
> @@ -58,6 +58,9 @@ EXTRA_OECONF:class-nativesdk = "\
>                  --disable-r \
>                  --disable-sharp \
>                  "
> +EXTRA_OECONF:class-native = "\
> +                --disable-tcl \
> +                "
>  CFLAGS:append:class-target = " -D_typ_ssize_t=1 -D_long_double=1"
>  CFLAGS:append:class-nativesdk = " -D_typ_ssize_t=1 -D_long_double=1"
>  do_configure:prepend() {
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100080): https://lists.openembedded.org/g/openembedded-devel/message/100080
> Mute This Topic: https://lists.openembedded.org/mt/95684473/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

