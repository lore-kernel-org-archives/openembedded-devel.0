Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23E7C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:49:41 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web08.952.1648752580628141490
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gbD7Rizb;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id s11so301817qtc.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5pKf+twqEcyxVQvEacP/4xUyIeKXVhgddQsV4zSlTqg=;
        b=gbD7RizbSHhwbL4K2gh+5q8C12MbDKd35WbB8f00A77NL/1XqP2xI7c4bH3dSBaRd0
         qNCdCmqYn+yply/mrAmN5U+rADd8UNLH8ufJCI66+T4n3/QzlQQSMu4f7qqSawGVPAj1
         RFUT6YTtyi2br/9npjwfJk641sP6jOGX5Mb5dKsdnAIlXZOI07dEiDQQkkbcm+Iiu3z/
         2K6Nib02qsA2xNPsZTQueP49wEZCU6DX/iJlpB5XHCeguSv3CRMrk7h+oMGDy9LrF1CW
         CC5j6O3NpZyYTsWp1koyBTryGuoRJB6Ye5S9YJAIOjaUASUDK2icHnEu/2Nj2X/43t61
         hx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5pKf+twqEcyxVQvEacP/4xUyIeKXVhgddQsV4zSlTqg=;
        b=7JPdwtfQLrILJo2jwF0rqVGaFszeHg7ftIL0p/8VYUa0nfU+8beUP3SfywCnQt0Rg6
         ig3oTQ7Ms3h8xAI7babWRXokTYDIXDkoj/bXvAWryHfky4ibCeyOWpOzBLJxzrVby2lt
         beu0R4iB0Qkb6bnCOG9cAatA2t6rtSYq17r1kGjTNi98VUPcUhY0DcpowG1TD7A46VgK
         /poUlfk1I4XH++nrqvo/gUeg/OJ03KUfP5zKeVfvqj35LL/iuBGSgiif2oHlA9i7gWc1
         2e9f4phECSgmSAUrf2oH9kNm4av6t8FDYPeytBTwWy1CjfUulWOeJMY57MAEgNYL7pM7
         WLkw==
X-Gm-Message-State: AOAM532R4alm+r3FgeLNLjSb3ItkrNQYuR+7J7q0AquXCTfNJrhOLtaD
	ucfozSjhVwKsM+27xD+6vOODUdvXeHG8YKmjirY=
X-Google-Smtp-Source: 
 ABdhPJxEZK8Chv8h2oU6eghKSrXd5OEvJTLJAN0aSpc00i1sju+UiTHND7f7evNM43NhMacKgroraFmaoag9TeeVaa8=
X-Received: by 2002:a05:622a:1052:b0:2e1:fe6b:377d with SMTP id
 f18-20020a05622a105200b002e1fe6b377dmr5507280qte.229.1648752579631; Thu, 31
 Mar 2022 11:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220331064935.2763629-1-schnitzeltony@gmail.com>
 <20220331064935.2763629-2-schnitzeltony@gmail.com>
 <CAMKF1soHzWsBnGVWH4ZPmbb=C=_KSD-b_1xFOq7u30eS4D09NA@mail.gmail.com>
 <CALbNGRRW4RDt=d78QQ1h03OfHcPyVo=_VW9kh9HjZKKjcUHbsQ@mail.gmail.com>
In-Reply-To: 
 <CALbNGRRW4RDt=d78QQ1h03OfHcPyVo=_VW9kh9HjZKKjcUHbsQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Mar 2022 11:49:13 -0700
Message-ID: 
 <CAMKF1sodYTCoVH1JY3sJcqeVRytDUSjiBp3UhK0_TRE8x7YBuA@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/6] gnome-commander: initial add 1.14.2
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 18:49:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96305

On Thu, Mar 31, 2022 at 11:45 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> On Thu, Mar 31, 2022 at 6:09 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > seeing this build failure on arm64 ( I use clang )
> >
> > | In file included from
> > ../../../gnome-commander-1.14.2/src/intviewer/searcher.cc:27:
> > | In file included from
> > ../../../gnome-commander-1.14.2/src/intviewer/libgviewer.h:40:
> > | In file included from
> > ../../../gnome-commander-1.14.2/src/intviewer/viewer-window.h:27:
> > | In file included from
> > ../../../gnome-commander-1.14.2/src/intviewer/../gnome-cmd-includes.h:2=
4:
> >
> >              | In file included from
> > ../../../gnome-commander-1.14.2/libgcmd/libgcmd.h:26:
> > | ../../../gnome-commander-1.14.2/libgcmd/libgcmd-widget-factory.h:167:=
70:
> > warning: 'format' attribute argument not supported: gnu_printf
> > [-Wignored-attributes]
> > |     void create_error_dialog (const gchar *msg, ...) __attribute__
> > ((format (gnu_printf, 1, 2)));
> > |                                                                      =
^
> > | ../../../gnome-commander-1.14.2/src/intviewer/searcher.cc:303:5:
> > error: cannot initialize a parameter of type 'gint *' (aka 'int *')
> > with an rvalue of type 'void *'
> > |     g_atomic_int_compare_and_exchange (&src->priv->progress_value,
> > oldval, (gint)d);
> > |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
> > | /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome-commander/=
1.14.2-r0/recipe-sysroot/usr/include/glib-2.0/glib/gatomic.h:160:44:
> > note: expanded from macro 'g_atomic_int_co
> > mpare_and_exchange'
> > |     __atomic_compare_exchange_n ((atomic), (void *)
> > (&(gaicae_oldval)), (newval), FALSE, __ATOMIC_SEQ_CST,
> > __ATOMIC_SEQ_CST) ? TRUE : FALSE; \
> > |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~
> > | 1 warning and 1 error generated.
> > | make[3]: *** [Makefile:521: searcher.o] Error 1
> > | make[3]: Leaving directory
> > '/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome-commander/1=
.14.2-r0/build/src/intviewer'
>
> Looked into this and think the code of gnome-commander is correct.
> Looks to me that glib-2 atomic macros do not work properly in your
> environment. My clang/gcc-runtime build is still pending so I ask: Was
> this with llvm runtime?

yes it uses llvm runtime as well right.

>
> Andreas

