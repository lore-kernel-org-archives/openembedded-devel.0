Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 362BE7F82E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 06:05:18 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id o25so9812073qtr.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 23:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=WDY26COmsX3GWS94QJQwyHo4R11GzIBPO5EGpRREb/Y=;
	b=c8uAtPMERq3wD/8KADwJjpizbn9hw91O1JrCOTq49335m6M2Xm/4ZEHccKjBeQO1iU
	b8kqel5WRPcPZ7SfW0TwPHTU+InnwJxe1HuDSMxQJ40PnKloYcaUSQtvNGZHZiV/liC8
	KtOuTJT3JFeVNotkXBYYNHVqlQeSZq/6rS4GespD6NoMgepbVHXTHOSn4UzNwX/es+9i
	nxxYt4/tjjZTbH9KpAW/90ejPTQXAjZjQ+8n2e/B0KtCpCHsnDgfspeut39T1zkPMV0b
	lSxDG46yFmw9N0rD1ypWsPyJK3ILfootWEhDw9ELa4ZmkoyNNAfHnKA8k5d4aIxdNA7W
	7MwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=WDY26COmsX3GWS94QJQwyHo4R11GzIBPO5EGpRREb/Y=;
	b=ikooAPD6aoUEWpYulFpC6vCv2hHLoW1x4cr0nrK0AYmmCgMh7MtDQDFToS2Orv/FHR
	/Hy22vl4UI5KvxlQ8iCCkOIeoZgnMZsixvPqRvrUucOAM/ocOT82UZsti3XJ3cVs7/Hg
	Z5ic/4RdsTVyM0FUgC+XePpoyFXmGUXkSnCyixIuhWIyHKoFyxe5lYcnk4eepq3dKmhP
	cAzECC8zVbGBGrdGNu0cBMEhZopz4HkCZzUMaRBei+gBw5TIhLcdE9dwMIgFTvjYBTm3
	GZSNWgHMsvoTldfVdx6fHu9+51+uPVNuwhs+g86qzv/sf/DZLHsXPq80WyHFm2ui5aE0
	lP+g==
X-Gm-Message-State: APjAAAWQZ/qhNHJIIF35bMtdvRDO16b2vDjA2pCZCDu+1ty667mLRqJH
	Bq58244d/P3TdXRnBjmO5k+t4ssM1tc0nn6QUTw=
X-Google-Smtp-Source: APXvYqyHWvfWxwbBtnwJfuH7kd4D3Av8cxA36nbfPgKBco6eUA8jIZJZ9wNLgivBLBsrQgDJ7VLCbYMfZ5lbUV+hgAY=
X-Received: by 2002:ac8:411b:: with SMTP id q27mr11995330qtl.53.1572156319206; 
	Sat, 26 Oct 2019 23:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20191026093404.19659-1-schnitzeltony@gmail.com>
	<20191026093404.19659-4-schnitzeltony@gmail.com>
	<CAMKF1sqBUTk01=tQ=V6ECnXz5jj6r9ARi1kMyJFL5Xp2-41UjQ@mail.gmail.com>
	<CALbNGRTurd2uh2fvu=eWk2hjeiJpJsQeiYd6zhjaY9r6fgXOyg@mail.gmail.com>
In-Reply-To: <CALbNGRTurd2uh2fvu=eWk2hjeiJpJsQeiYd6zhjaY9r6fgXOyg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Oct 2019 07:04:52 +0100
Message-ID: <CAMKF1so25cP0PuM8nchSyY2JTLQQ3X=5_9nRr73mMXW3Ly92iw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
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
X-List-Received-Date: Sun, 27 Oct 2019 06:05:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 26, 2019 at 1:10 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Sat, Oct 26, 2019 at 11:43 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > I dropped https://patchwork.openembedded.org/patch/166178/ and took
> > this one. It seems to include those changes as well.
> >
> Was not precise enough but that was my intention -thanks
>

this fails to compile e.g.

https://errors.yoctoproject.org/Errors/Details/274743/

> Andreas

