Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id C0AC47E101;
	Wed, 22 May 2019 21:33:33 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id o2so2202498qkb.3;
	Wed, 22 May 2019 14:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=KhboyP6q1dPNnBVwS+pcLKHLtSbrGOQerV5p75n1GvM=;
	b=F8AeM9Ffj5r7i2weeXpBOmB1IPe/2GMzHLMLa9Kx+tgO9jBszTx9mTZfU6nRqpaPTg
	mvu4UVHiN7v43GVHW9jK9slWLiqUSbhs+kNvA1Pk35xXLkNXhLFK1Thg463KOMDsE7eX
	rdHMyas0HtCA+9OF2kzT6LqS5ENEVpfpxnBPwvYvPs/6y+EW6s0/iaBQhENLACTbeUam
	g/yK7nPLRz06mW9PMAHo0ijgq1piuCh2/1swXiRRlmwHyDZIjTsjLzv+T9uDJ91egnvR
	exd3/c9fUqFRLpkZJJh2rRvwFOQ3SQVmgLGLMogfOdDuB/CVhBWEcB5rebuDmIV8GFWu
	hY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=KhboyP6q1dPNnBVwS+pcLKHLtSbrGOQerV5p75n1GvM=;
	b=eKiB8U9jbGO568ufKNguaQM++JAuVou1Aang3lZIH15wHa9Zn3l5jRcPZVunEqJx1z
	zkJLKCogd9Nw8lZcmvTsQ3tq5wl88Ox0N9O1rkaKEasn0UbjigFDV4VIgp0EN4H74jIu
	rcmGveovJHE4XPjrbK6Lgioew2Ij1pe+4RcE5e7rxWncFXf5mN7gXKfyoQftu454gBkz
	nJ5F2T0ChoPtFURTIj4fSPUsLC6fMBpGStE5n42r9PCdjiPgH6muYHewCCxG9Uj3ThR1
	rTvSkFhdMRO60WZii1YwY6yW8Hl8jPN2Li0jGTsVWgHaVJdLKG0WDd/zBpGyjBoERw/k
	bhtA==
X-Gm-Message-State: APjAAAX73Bd6hfqCDgAj7dOA+89O2hjaB01c/d8p/ySX4w4Y5rdwNxzz
	Y8/+lquQnUnBa63odBH9nNau0REzxfHkAdRtyHg=
X-Google-Smtp-Source: APXvYqyoqqalKoeAZuxOiPf3xj9p2/PHtC+19O3MaEeRaG0+0329HK3w2Tgc3JWHExOO4SPF1Sr6LbxkZlXsh4zaaBU=
X-Received: by 2002:a37:9a8f:: with SMTP id c137mr328308qke.208.1558560814577; 
	Wed, 22 May 2019 14:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <155854019588.26288.10003174813774515795@git.openembedded.org>
	<20190522154956.B6296235353@git.openembedded.org>
	<CALbNGRQ7VT88mxPhnW44pEOHRhGQ_QUg4WORMCyH17Q6KfE8wg@mail.gmail.com>
In-Reply-To: <CALbNGRQ7VT88mxPhnW44pEOHRhGQ_QUg4WORMCyH17Q6KfE8wg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 May 2019 14:33:08 -0700
Message-ID: <CAMKF1spYS_aU_v7JmX75vF6U8B1PKtLkDfWyHtMeSWe470H1xg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Andrei Gherzan <andrei@gherzan.ro>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [meta-openembedded] 08/09: networkmanager: Update to 1.18.0
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
X-List-Received-Date: Wed, 22 May 2019 21:33:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 1:45 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Wed, May 22, 2019 at 5:50 PM <git@git.openembedded.org> wrote:
> >
> > This is an automated email from the git hooks/post-receive script.
> >
> > khem pushed a commit to branch master-next
> > in repository meta-openembedded.
> >
> > commit 8ac5fe0ca3d32e2cf6be7555c1f84dba9106f96c
> > Author: Andrei Gherzan <andrei@gherzan.ro>
> > AuthorDate: Wed May 22 14:13:45 2019 +0100
> >
> >     networkmanager: Update to 1.18.0
> >
> >     One patch was dropped (0003-dlopen-failure.patch) as a similar one =
was
> >     merged upstream. See:
> >     https://github.com/NetworkManager/NetworkManager/commit/bd4957fcd78=
a0e64d26459e94ab3b84c91cd6f5f
> >
> >     Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> >     Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Wanted to do same but did not yet because of [1]: --with-libnm-glib
> was removed. That means
>
> * PACKAGECONFIG[glib] has to go
> * bbappend in meta-oe has to go
> * maybe glib-2.0 must be an unconditional dependency
> * please check if network-manager-applet builds (that required
> PACKAGECONFIG[glib]) set in the past
>
> [1] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/commit/5=
801f89f4d1464fc15cb1d97755b73f9f68cb2e6
>
> And if you really have nothing to do with your time - you might want
> to move to meson build (please don't consider this as blocker)
>

Thansk, I have dropped this from master-next

> Cheers
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

