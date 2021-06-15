Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.9371.1623764972323979348
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jun 2021 06:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=THjrkVuZ;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id x21-20020a17090aa395b029016e25313bfcso2249265pjp.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jun 2021 06:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Guo4GA5Cpmned5raPKpqGzjRnh5186jAy6WVJG5oEs8=;
        b=THjrkVuZMYNGZDiUNYalKZxhofvWddqcYqwaZ7FnV5CbdJgsrUKgzXWE5gtLbdOtFB
         D0z/NwqakpSx5mqLPO055ZdQnzSsyT+Wf4sHMmBsShlNcLQkBcMZ6GAQt0lUUg+4Bb4D
         5ZP4rOZqzvPrak83X85AgZoeMbNcTulVC29+xUbynsfCttOExpMJUYGFahBIMtU9FPDv
         UrVejO04OyXOHe99xDfVtwhzp+4Tdvt7ODbwEYpKFi7k2ttdmXOZNhgCGZH4ljmA3lcz
         Mi8UMQ8aNIbKlj/4vwLNFYkLer1eK6t37jBqhD7C1XpVLwjdY5Ry4R63He5pK+kzhLva
         J7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Guo4GA5Cpmned5raPKpqGzjRnh5186jAy6WVJG5oEs8=;
        b=NE27/zynnX9m4tYl0lhHjM3/ofJzWkbeOjQbj6jOMLPmAmPseHF2iFROYFNYufLhb8
         lT0t6C4VbK7i7XMw0NCX+kr8kQdiVz0ZqIb2H9ewTw+UE7MRV6H9jUUeUTkFsrsQNP/D
         J1bgzx3NYng2QPP0pNNY0pZ3C9MnlnZcy01RVYBUL6FWxYTTHZkMlQt352pvQq5Be9fW
         dMM/bE/6d3FdSDBQL/IvaIlNi78MM7PIaJUJA4iBLP9M7p8x+PjZd+xPe+fatSJmoj0t
         6UuxF6hgDGLRq76EGRUBfaOXuTliIR0IvgRW71XaOuSM74cgumose5LbC3WCvTMGXwpK
         BH4A==
X-Gm-Message-State: AOAM530WYHW/S2T4ZvrWa47DgBBttiT4SD0coXqj68N6NmIsx88m6BAV
	48dpGFNDaKJAahBfQkGpmoocrvhyqjj1+gp4QMQ=
X-Google-Smtp-Source: ABdhPJyjwBS3gqYLrSM4MR+SRr7qNgzZuDMTDOtE8t6oSIwR/e/LTVlteIu3Is9wX449pAUFvu6w4KiqeicU2dZ1G9s=
X-Received: by 2002:a17:902:8f94:b029:103:62e4:686d with SMTP id
 z20-20020a1709028f94b029010362e4686dmr4124843plo.42.1623764971287; Tue, 15
 Jun 2021 06:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210615074501.44131-1-changqing.li@windriver.com>
In-Reply-To: <20210615074501.44131-1-changqing.li@windriver.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Tue, 15 Jun 2021 15:49:17 +0200
Message-ID: <CALbNGRRgZ6Sp=u+DOOM_s9v0PXejMG+gEndBd=+-rgHkw6hpDQ@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH] mousepad: fix warning during postinst
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 15, 2021 at 9:47 AM Changqing Li <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> fix below warning during do_rootfs:
> [log_check] Warning: undefined reference to <schema id='org.xfce.mousepad.plugins'/>

That was really annoying - thanks for this fix

Cheers,

Andreas
