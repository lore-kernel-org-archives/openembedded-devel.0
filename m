Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web09.3194.1612475297035954945
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 13:48:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WnJ05rmZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id r20so3607559qtm.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Feb 2021 13:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4OKkArTqLYlbPpg4rJi06qdB+PwbfCZ5FDydjqoW2PM=;
        b=WnJ05rmZn8KargSaSVenzEOhmowmlJLTecGlpzMzvYIgZErWxZFEFzybtkXqhwtVSu
         mUd9e5JzIMgC01wDbKqEXw26LtzftLnsv8oJcIu27EKuQ221XIN8Lr85DQ3YuH6NT6Ki
         VgpdiTnXWigUV9rzpM25fiOeGvk2xyPXefi3R7wpQOFupRbR4NwEibsTahcDrrJ9pd/X
         APziY0JkfKXeSH3staDclfO6lQlzPlzCcvar4N7R4lgKWzqqENJuAaZzjA0juWJ4OUSW
         z+mq8ExdQYBn/1LhRaDDS2Gh5Avtj3pQ3mCW2lrZ3fpQJPsjC+eJUMWxRj+RWg5Zo3o6
         iTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4OKkArTqLYlbPpg4rJi06qdB+PwbfCZ5FDydjqoW2PM=;
        b=thM+rMaJZZgCmfjCEE9UV/rtwQRFi+PC4v87eM3jY3coG68xDBRh6HI7uTI/81M3js
         8WLGxGgKz8f60yFoXYfZFhGT5BIn+IuBUCv4nstw8Gv1TV3qndjDqRuOGES2GktH0/n+
         qgZpjMcLOk0q+v0WehvbHA5B7yBwhJxsokPh/BzV4WG8qs1YUsDw5SYUifeCnF3ktvpC
         IBmpsvCjpE0hWycYTedvWeVTdjLoPWn0ekmewcMQNSnPWnI3afKx310TfIbZafNdPLTu
         C19Ore1etPkL+kk96EQTjWFEhL3NQy41Vkt1nF20y8uEfqKomlGnm7cpOHEq/WkaZC38
         BnrA==
X-Gm-Message-State: AOAM531gX3I2mRhoeeAF/BaQVxtwVzzpr1WxCPMi2JeVER4P50vbrkF5
	v7xWVVp/gvZ3DhDK6ZzKL4HFpYvfTdNOjLe8IpVSu/5mMsRqAA==
X-Google-Smtp-Source: ABdhPJzHb7e9fDDkoG25N+7t/ZyUiOqAOyuoN+YV0GSjYRcE9INgaBV2BsLTZa405gLVRVvDXc+ZNUmuimZ+J22WuTQ=
X-Received: by 2002:ac8:5894:: with SMTP id t20mr1675130qta.194.1612475296225;
 Thu, 04 Feb 2021 13:48:16 -0800 (PST)
MIME-Version: 1.0
References: <8f242d61-4dea-070a-217d-657e2204a807@windriver.com>
 <CAAnfSTsku9yTFYKCMVkmKq=77V8XGgq9pdO5n_PPb_ttHWnd3w@mail.gmail.com>
 <3aeac6ad-c5cc-dba9-2c3e-6caaad82aa2d@windriver.com> <5a73bb02-18ae-a7ea-c55b-d650db4d97a1@windriver.com>
 <CAHtQpK7P8JbrKCS-xMmgUu-rEUW1wbgJau+_93O9eP_+wgM_LQ@mail.gmail.com> <c6849b7a-5dc0-ced2-b6d0-a0e6f9ec72f6@windriver.com>
In-Reply-To: <c6849b7a-5dc0-ced2-b6d0-a0e6f9ec72f6@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 4 Feb 2021 13:47:50 -0800
Message-ID: <CAMKF1soXQNO8Jx_iHN+3rGam6qNJ1SsUyPXZgHv=F7NyGgwpOQ@mail.gmail.com>
Subject: Re: [oe] Help with dealing with autoconf uprev affected packages?
To: Yi Fan Yu <yifan.yu@windriver.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, hongxu <hongxu.jia@windriver.com>, 
	Randy MacLeod <randy.macleod@windriver.com>, "Chen, Qi" <qi.chen@windriver.com>, 
	Ross Burton <ross@burtonini.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

here is latest list

https://errors.yoctoproject.org/Errors/Build/116365/

Just look at the do_configure failures for filtering to autotools issues only.

On Thu, Feb 4, 2021 at 1:09 PM Yi Fan Yu <yifan.yu@windriver.com> wrote:
>
> Andrey,
>
> i am working on this now.
>
> since you already submitted iperf3, i'll focus on
>
> libmcrypt.
>
> i'll test and build both of them once i figure out libmcrypt.
>
>
> On 2/4/21 5:45 AM, Andrey Zhizhikin wrote:
> >>> - iperf3 - YiFan
> > I just sent a patch for this one:
> > https://lists.openembedded.org/g/openembedded-devel/message/89274
> >
> > YiFan, can you please have a look at it to see if it fits?
> >
