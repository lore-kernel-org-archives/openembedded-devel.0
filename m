Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5A95260269
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 06:30:06 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id n6-v6so22907641qtl.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2018 23:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GJGCtC7ekW2LVlTXe/lyidQHwnXRuqLZnmODLwvxB6M=;
	b=rZWBZLCSbjcqFAi/vPQhQgUMHwmaIfhlyWnJ04btxy3TVDes+1xZ6RGC76ShkpUuT2
	Z3IvtaNoIHNlz+eNieP5wOxZxxol48eM1pUq4wcfjMxvcg6ya8wHZ/YWuzcizjgXZuVD
	e0Y7Q3ykKM8XQJNrgxy4VTMPs9iNiZQ3QzMne8zP0oJ+qqG9kelqu07EmoTDlbdNNeW0
	Q+Nx8B6muMMXr/LbX2RSH7xDIk143ytJ50RdE8IRztI5RoZn7mW8V5O3McJCEEWOdBa+
	6AX0pfjzrbSNW16FJf5VvOq9ZHsSeaC83ZjCA9w8PaA/wRicaLiahhTfcF88SO9UJspG
	QEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GJGCtC7ekW2LVlTXe/lyidQHwnXRuqLZnmODLwvxB6M=;
	b=BcPcJqxXevdbBwMeLUrGm8WJlT0mqrpODeBxrBRI09lthAT2CYhnco2eYhY3o/ZQPw
	BlHvPOvt50wlHz0lmWICNrzRHunq0fkApqJgifjD3Zro2E3jv5Wei8kvPnXPV9Es9gTc
	pUcpPwYCiPwKYwwqbqvD1jLXZu6G1WR5zZSgFZEECgQ+CRhQ6nRYumt4vIZ16mOnb8zz
	0fQSobtFr1w3qvxc8sef29KxRc0wMQVKFvxHWJ/cddTtxUARUHVAxBw0eX8P15+Vzvjv
	FgEXJ0NsEucpTH7pPpwo8wdRSQ9OyxuBOldViwaIyjF3DD13OhouQ+Ei0aCqe2G+/ncN
	LapQ==
X-Gm-Message-State: APzg51DhIP/Ol8BaqhcbpY3xwlxgliZ5smeHPT5L+6Cn+jABHT18pFIP
	1k8IzoetMnqL2fki6k/71IWNKW+GOumcYYsnu7M=
X-Google-Smtp-Source: ANB0VdbMqyyWUwNgWVLDeOL/6cY+anesZJD5f8L5FMljTmoXcZFfSNAQjVLFAhIFHTb7XjusT6jrDZHGPRDq1rwE1ws=
X-Received: by 2002:ac8:6c8:: with SMTP id
	j8-v6mr14544252qth.314.1536561006948; 
	Sun, 09 Sep 2018 23:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <1536560060-7660-1-git-send-email-Qi.Chen@windriver.com>
In-Reply-To: <1536560060-7660-1-git-send-email-Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 9 Sep 2018 23:29:40 -0700
Message-ID: <CAMKF1soiYbmex53Z8y59ay=_pU8nqAY8O44_aGxXnshDkJK25A@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] cyrus-sasl: do not set CLEANBROKEN
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
X-List-Received-Date: Mon, 10 Sep 2018 06:30:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 9, 2018 at 11:25 PM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> A previous commit set CLEANBROKEN to "1" to claim to fix the following
> error.
>
> Fixed rebuild error:
> configure: error: changes in the environment can compromise the build
> configure: error: run `make distclean' and/or `rm .././config.cache' and start over
> configure: error: ./configure failed for saslauthd
>
> However, I'm still seeing these errors!
>
> The actual problem is about autotools.bbclass not cleaning things up. It just
> uses 'make clean' while maybe 'make distclean' and 'rm -f ${B}/config.cache' also
> needs to be there.
>
> In fact, setting CLEANBROKEN will do no cleanup except removing some .la files.
>

please rebase on top of master-next and resend

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> index 3391da0..317d238 100644
> --- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> @@ -19,8 +19,6 @@ UPSTREAM_CHECK_REGEX = "cyrus-sasl-(?P<pver>(\d+(\.\d+)+))\.tar"
>
>  inherit autotools-brokensep pkgconfig useradd systemd
>
> -CLEANBROKEN = "1"
> -
>  EXTRA_OECONF += "--with-dblib=berkeley \
>                   --with-bdb-libdir=${STAGING_LIBDIR} \
>                   --with-bdb-incdir=${STAGING_INCDIR} \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

