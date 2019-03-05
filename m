Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 22B896BDDC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Mar 2019 02:36:56 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id d18so7482851qtg.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Mar 2019 18:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=o8xrTiJ/dAKOeLh3638UgxLlkF5RQVF7ZTQMlnZXC1I=;
	b=TuUH+9BHM5b2G0j+9Tw0FQkAX6EKJO62EnPW4g/IgZWCVVOmUj/Sf3ptvXmStVBsCr
	KKLAupOBt2aA9xo3kXOp6c7OLJVuWnqmFzm/b1J5QoKBJZN3ZJyaSTuMssMhMjXfztZA
	yMMt03w/xRXQ4eBCE2LQVZCFkWsHngSgm4I9Ph85v53G8O8HVKipN7dxLLjspTND2O9t
	NqfGOM/6SNGxgnt55iYP28/43E600ZP141GG0C2W24G9Klb1lI9Y0eIChPGHRE+I6onR
	jDr/hhp9H1MXvWGsCijZBeLWJYZAHrdUdFsDEO6kFmo7GEgHabLly3CrY0x5FgPVuRR1
	YvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o8xrTiJ/dAKOeLh3638UgxLlkF5RQVF7ZTQMlnZXC1I=;
	b=dr+T1yHpq9sobrLvsQAUpCFg0STHHlCRE0wRSgYybPJ3nQ/2W07uIlcoh2fKv6Xf03
	3jD1BYFMZPy/nIMVvEYjE8hEA9MwCwmcsayyzzNhEaX5pbzpqxzy7jGwcopQS6GYuYnt
	CM2lWhciXpTSLQ/+17iF0pqsofpOiGkL9g1Id5LRsY4zgv/VoyPiiZtyKZEEJ+HxaqQe
	CMI58zIgjJVxNmQYNNaT3A14Ep9TD+vAwWREpH/fcWXJ07+FNb141d7nrlW9m6ws1PZA
	jw1b3rgIb/fp5soU3bSz1NDATyWPsqcF5lUx+4udbbaCM9OHp0czNKzZASU+mTBjxB/3
	LSwg==
X-Gm-Message-State: APjAAAUFCXsAJifZM0TM0o0NTxn1b9OO3ht1vpvwmxNks17kybKxeKKM
	yw5c2czza+XalWH9uU/GdJDKODfZsOlGpNEPfGg=
X-Google-Smtp-Source: APXvYqxnqRDbZcwjP5Ilh4ky8/qJb7TGaIYgmcCqRT1hKRAV1nxv25CPvMHt6AMdjbtrKtBqCIFVYEI/ZYu40kIOa78=
X-Received: by 2002:ac8:300a:: with SMTP id f10mr16769662qte.236.1551753417735;
	Mon, 04 Mar 2019 18:36:57 -0800 (PST)
MIME-Version: 1.0
References: <20190304235132.188006-1-joe.slater@windriver.com>
In-Reply-To: <20190304235132.188006-1-joe.slater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Mar 2019 18:36:31 -0800
Message-ID: <CAMKF1sprjLL91SRCRZTueo5WY6f1+qwJwyn_x8Y53oW0sgU_Vg@mail.gmail.com>
To: Joe Slater <joe.slater@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1] leveldb: restrict building for mips64
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
X-List-Received-Date: Tue, 05 Mar 2019 02:36:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 4, 2019 at 3:51 PM Joe Slater <joe.slater@windriver.com> wrote:
>
> Do not try to build lib32-leveldb.  libn32-leveldb will build.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta-oe/recipes-dbs/leveldb/leveldb_git.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-oe/recipes-dbs/leveldb/leveldb_git.bb b/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
> index 8fec89c..908ad3e 100644
> --- a/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
> +++ b/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
> @@ -35,3 +35,7 @@ do_install() {
>
>  PACKAGES =+ "${PN}-ptest"
>  FILES_${PN}-ptest = "${bindir}"
> +
> +# Do not try to build lib32-leveldb for mips64, but allow libn32-leveldb.
> +#
> +COMPATIBLE_HOST_mipsarcho32_pn-lib32-leveldb = "null"

does it fail just in multilib situation ?

> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

