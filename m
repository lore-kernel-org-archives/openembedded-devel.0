Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id B01A27D5BC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Apr 2019 18:53:44 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id q14so14849739itk.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Apr 2019 11:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XY58em8l28bD7AzfrmvkYNHmTI0vB8U+aXTQC2c+xrQ=;
	b=Prt0W+HgaVgKvK79DliIHQkwf/hfCxpZWyJ/SNtNqqMUHYJaD7HINgC9f1iKR9iZIR
	SgGswS4zaX1HyrAPl2mG9bYnHZEDmFZkPsvNh7i7KC9RyKG+mEidTcc0Fg48CH9UuSl5
	2Z3CSR8V95iTseIdLf1ED58cxTM5Z3nlbRc6DrT0E7MUqzk/+bS57rCjrbthw5gymJu2
	mlpQXUiAAD3YZGzD+Ld3+DqB21V+f54htwIm27koDLu/VdFrX5tqtjE0k504CQSic0eg
	icFCFUfV7yXCZtG8MCwCE0fy82MUi1tAZ79jvjx9d+e+JCLRlk6w8Sx4w27Ghv1VG7+C
	BTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XY58em8l28bD7AzfrmvkYNHmTI0vB8U+aXTQC2c+xrQ=;
	b=OX7ibRy8hzc6AbdnodIxgxzlN+xLYrAcRQmOq5stQXXnHlyRzBert/b7vph+el9Rb8
	4Q6l9ADkPTN5L/qX8P2GPsOZuZgIORyfaVKaZnlz/yHTAuflm4yJjDlVlAbUmI88jr6L
	ZkhuiHlUaXbryORdWuHdYPw+HO4C8jHNBM1BiGMR1AQ6JVAOcHw4m3g2x/sJJUTr2Q2D
	iVHi+kPoGHfxKEZV/UFoxpidttQnkIAuowk5fQ5QY8X/YuHOFCnZSLpYLGcqxRcD4CuO
	FKiva27wpYjrcMls27/YBLpXjWcmK80d1nHda+ygEjWRpYqzgQtRILj5WFFrUvS/OCvl
	N6bg==
X-Gm-Message-State: APjAAAX+DQDUB5qmTSrbAY1po8kDwmXZchQiuBZlyzmTDwDVEygXRaui
	kD5wCzJptjMK+kdl0EqXa8NOzypmHtyChTPUXbM=
X-Google-Smtp-Source: APXvYqz3TaBbavnmh/xujhCiXWFAHKyA6/sRYE0wQ5qwwC3HxjQnUg5qvk28G6h0RktOJ+wD3fObh4jQNWFxQk6AC34=
X-Received: by 2002:a02:6019:: with SMTP id i25mr15202878jac.66.1554576825772; 
	Sat, 06 Apr 2019 11:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190406184223.28699-1-raj.khem@gmail.com>
In-Reply-To: <20190406184223.28699-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 6 Apr 2019 20:53:34 +0200
Message-ID: <CALbNGRSp_1Aji=iiFKkRGAiH+XKdMCLasA8FUwmc8B7HYtpz1Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] networkmanager: Fix build with clang
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
X-List-Received-Date: Sat, 06 Apr 2019 18:53:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 6, 2019 at 8:42 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Detecting libdl for dlopen when failed returns
> "none required", which then gets added to linker commandline
> and inturn fails to link with errors obviously because "-lnone required"
> is no such library.
>
> This patch is not musl dependent, earlier patches clubbed it into musl
> patch however this is needed with clang too regardless of the C library
> the reason is clang automatically brings in libdl in OE and hence this
> test is failing.
>
Seems I was a bit over enthusiastic - thanks

Out of curiosity: If I remember correct similar is in musl patch.
Doesn't this cause conflict with musl patch?

Andreas

