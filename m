Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id C886C7FC51
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 11:09:59 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id z19so5399596ior.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 04:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WsmoOF2HletLPQlrY1JBjdtThEfXNNz6FLBBD5+vMVY=;
	b=G75j5Re7ugzquJovtu0ObZzRese/3Fn6wPaYEn4sfrpArtkebtvizaNATHqUMTEJrZ
	Z8K0Zf9iI/007ib1m8xT5IiNSoaZJ0zUNd9XZpqA7nv7P4c5+czyC0aPfkt0RsrLUs7o
	o8jUHsszm4xO0nslDa/twBWPzSeWBGoyZqhp9dXh5KCpNc5O24V6ElBS3HeMS8o8SU9g
	4xjDZvuH4qZsj/oCsBvFf2EiygoDxpc4wfeV3IlzP7agqM7skYDrM8avivnWf7IFnC09
	kPwsCPHSYXBmoEG3EGUG7jKyL1qBYtJnhD8Fjr4zoV6Mt7sxb5KoEAIGG667Mw6h5nom
	Jl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WsmoOF2HletLPQlrY1JBjdtThEfXNNz6FLBBD5+vMVY=;
	b=af+FhmEafW+OlEYqzfDGk3fFirgECeWZERvI6pXivFT9UAHVLM/38aXu9DfytsXLqJ
	4uD7pTyWwQczOO2w4kRAFNRLCV+MJGYkTks47l0FbA2wZf+P4GKt1ub7YLLgTUqJaX8L
	OtO3roM/enTbjZK6k2mUukiuohwkzxquVrc33dzBS80CDFAu/Gut/ZYlyxyfsT8Nrhai
	XlA/wA54BI9Q/D/NPpfansGOW1rs/pSd/JOwLSOqzjhxNjkTCznwViJAQaZgk/oKtP9m
	8AzhECdf/QAAjWpmdsb92US7rtiSe97OswQiFvpGMhLDOGqFH0Xecw8fxRl9cczNoNX0
	MGHw==
X-Gm-Message-State: APjAAAV4V8tlR/GfgAGvJed3cBGjlW33u+kaeqWdZ1091QlFUuZYF+RF
	kIZ+Rr+ilVZSuKl4Skjed5Pq0vWXJzVdpibcAro=
X-Google-Smtp-Source: APXvYqwp60bBUghq+npOiZRVbID7p5vYDYo5ZL7kITeQDAMt0H8p4/tjywoLisHxZ3ngaxkB8/8BSK5sDc4PQYICBSQ=
X-Received: by 2002:a02:c9cb:: with SMTP id c11mr8454631jap.81.1572088200701; 
	Sat, 26 Oct 2019 04:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20191026093404.19659-1-schnitzeltony@gmail.com>
	<20191026093404.19659-4-schnitzeltony@gmail.com>
	<CAMKF1sqBUTk01=tQ=V6ECnXz5jj6r9ARi1kMyJFL5Xp2-41UjQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqBUTk01=tQ=V6ECnXz5jj6r9ARi1kMyJFL5Xp2-41UjQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 26 Oct 2019 13:09:46 +0200
Message-ID: <CALbNGRTurd2uh2fvu=eWk2hjeiJpJsQeiYd6zhjaY9r6fgXOyg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] zenity: rework recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Oct 2019 11:10:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 26, 2019 at 11:43 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> I dropped https://patchwork.openembedded.org/patch/166178/ and took
> this one. It seems to include those changes as well.
>
Was not precise enough but that was my intention -thanks

Andreas

