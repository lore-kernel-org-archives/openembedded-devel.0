Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id D7E4D62133
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2018 22:56:49 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id j3so1779178pgf.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2018 15:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Xtun9g+92ggKFTTAbR4KzPlfeOuHwQ8EClkdY6whdd0=;
	b=aFK68lGbvA519VUGZSV++EUoQff9h/NKsvfON3f1ftjXalnxfxO+aatzajiSpX3QF2
	SckvfWCJ9DckIBISCsji1Sne25/forXQaH/gcvdaDU9MUK7Hao1yJrZj2eI6VZ7QMkt9
	2+DznOQ1oIFsbJLjgJUL/BljIi9X3CZhnqvZU+Xq/rAkGoJO8G2L6Ot3X0B1c/gBN9O8
	AjmljC8EVEIJaJmzTU3OsDoyxtTf01s0m6mPEVKKpmaeReUHhEvqrb9R/XjT/QOv9eVV
	/RhV4oDZDXKSI2K0xcuSO/0qpQBr/G41kzA/UDmQylim/atbvbAuSnaImpROKhdxPbGI
	H+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Xtun9g+92ggKFTTAbR4KzPlfeOuHwQ8EClkdY6whdd0=;
	b=QaMNEv5cStfWZuoMVwqPpbU2CASvInobaWoFtUKKcXZhd/+A23Axwj5Nn0OJl8toH4
	duMHAol3TFdfw7OJP14VzamBBhtBFEozWh5HZkCyX2hEq7u4L7l/iaqqkYDq9i04RSYn
	HmcaYDmt82OF9Hy2jVwUT51ehNxGRmSA6wbdNhxBmRkx/eyU6tS2EeanjiirFh1blb6t
	HtAHFi5zYvzWQJr3nfr++pjx2HBc+ObKY29zygFXisCoygjPy5Z+8UYD0qHwKcY6rafz
	KuALkzZJoeJ6v1ah5z6ufmwNRrm/QSGl5RAMqGLT6x5JFiEEK4iHe5sTgWOTOwBaB9Hp
	U1Rg==
X-Gm-Message-State: AElRT7FebGfA17sfIr0f4PzkIQ6IJf8Up2jftwxO2nq9TdiSp7/9QXda
	Jj46JDOnB/BthxSs6UWdu5uqjuZSV+OLPjNZQlc=
X-Google-Smtp-Source: AIpwx49OIGraO8ZJNAyZWhfOQS1kklXKUrJVUtZuo+W2LiWtwfI9DY8fkrhM8aEK1UNHMoiQfIHjsOeNPa3vyESHoN8=
X-Received: by 2002:a17:902:6e01:: with SMTP id
	u1-v6mr5547326plk.96.1522277810989; 
	Wed, 28 Mar 2018 15:56:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.227.8 with HTTP; Wed, 28 Mar 2018 15:56:20 -0700 (PDT)
In-Reply-To: <CAHStOZ6KXHrZMVa_iydoDd-N7p_098YqJYo5hBv7Jyxx9NMOYA@mail.gmail.com>
References: <CAHStOZ6KXHrZMVa_iydoDd-N7p_098YqJYo5hBv7Jyxx9NMOYA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Mar 2018 15:56:20 -0700
Message-ID: <CAMKF1srJz631-vQDLwdfv+FpQbp2iqzZuCEw9DuA0od2dcQBEw@mail.gmail.com>
To: Maxime Jourdan <maxi.jourdan@wanadoo.fr>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-clang] [PATCH] nonclangable: Add python3
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
X-List-Received-Date: Wed, 28 Mar 2018 22:56:49 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Maxime

On Wed, Mar 28, 2018 at 3:38 PM, Maxime Jourdan <maxi.jourdan@wanadoo.fr> wrote:
> While python3 will build "successfully" with clang,
> it will silently discard a few modules in the process:
>
> Python build finished successfully!
> The necessary bits to build these optional modules were not found:
> _bz2                  _curses_panel         _dbm
> _gdbm                 _lzma                 _sqlite3
> _ssl                  nis                   readline
> zlib
>
> The lack of these modules will generate empty packages
> which can later break do_rootfs.
>

while this is fine, I would appreciate if you can delve a bit and see
why these tests
would fail with Clang and pass with gcc. It could be simple bugs in
python itself where
it assumes compiler == gcc

> Signed-off-by: Maxime Jourdan <maxi.jourdan@wanadoo.fr>
> ---
>  conf/nonclangable.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/conf/nonclangable.conf b/conf/nonclangable.conf
> index 720b653..7d30bc1 100644
> --- a/conf/nonclangable.conf
> +++ b/conf/nonclangable.conf
> @@ -58,6 +58,7 @@ TOOLCHAIN_pn-openjre-8 = "gcc"
>  TOOLCHAIN_pn-perf = "gcc"
>  TOOLCHAIN_pn-piglit = "gcc"
>  TOOLCHAIN_pn-prelink = "gcc"
> +TOOLCHAIN_pn-python3 = "gcc"
>  # has dpkg source which does not compile
>  TOOLCHAIN_pn-start-stop-daemon = "gcc"
>  TOOLCHAIN_pn-syslinux = "gcc"
> --
> 2.16.2
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

