Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id E85B07D71A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 23:38:11 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id i4so7894349qtj.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 16:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HvL244IY5tqmX2TK1ZITp9/51Qsbr/j65UELzU9zSyE=;
	b=AclYSu+Pj+lXoSoX0dPUu215+DaVgoayYs465g79QVLuLNODGP/AuBmFYx7ykNfqJY
	RC3usFgTa+y5vgeDPQJAdsk5UQAIVI+mDI6RcDXBLqdzu5BX+XCMkT7SoAnL+pOPZKVo
	1m1yyVtIdts6zZ8/Dp8zlG2JSby61KuDTSI/nSXiKgafUCXnzuDaAV90DEzTlQZpj5zo
	eNDQAvznityZVyyKleQDpV7GKOHYsp60dd6TDESee/2Rdsjcp56Y0zF1WZ2WEJQUkgsc
	E5GX0KMS9MVBhtrmFerL7xBNA+2sK4Lq/enAVmH+0fFWHlfN3v/petB6mZH15VVlWapv
	d7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HvL244IY5tqmX2TK1ZITp9/51Qsbr/j65UELzU9zSyE=;
	b=mTkAWqQVW4XHw8UAD7dREZdyIzmgDy1DKcw8NyDhV+8aCvHkf24VWz1fPn2w+7YJkL
	xMjYUUjvDmDAf8GGOcbS/oEaPALPXkHa+Oc11qSO/oanZ+9AVW8Btvp44vDiVhhnhuwe
	lFJ7N5B169kfUYH6I4ZJQ47GQkFCOB+flcFWukjRyxYuO8nFkNknRoSmIBJJo/xmEdnp
	1ShwBws6CHwX5hJ27cpkwV7XcS/vpxhLbhZl4mQCDPLgvXa5alY2yEJwiXPbU123mn2Z
	uSKptfs+mKliL2tCiubYoBlbvjxirTzZQAOCyWkoIXA/6JlyXGtYldy5ssCDXVegCkIf
	JDbw==
X-Gm-Message-State: APjAAAXhZjGgoVm68n1Mof+EsnNm+/D/CmUxekEzrHv9GaadIe3P+OqL
	1HbA12YEJfn0/xMNx7Rp7dhUowV+Km09f4JU58o=
X-Google-Smtp-Source: APXvYqyNZnM+3dLHSsnouq1uAuhJjVm+DMLHEQBNpjGT/Hz0+Yw8o7X4DuGZb+l1aJq7KZ9+vK/DHaizJSe5fW7oW1s=
X-Received: by 2002:ac8:d4c:: with SMTP id r12mr71088qti.88.1565998692276;
	Fri, 16 Aug 2019 16:38:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190816103958.2701581-1-Martin.Jansa@gmail.com>
	<20190816103958.2701581-7-Martin.Jansa@gmail.com>
In-Reply-To: <20190816103958.2701581-7-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Aug 2019 16:37:46 -0700
Message-ID: <CAMKF1speMTGhaYO9cVT7dUy3anVN-tg0mXwPM+iwJLSnNSMkVg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 7/7] libdbi-perl: add runtime dependency on perl
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
X-List-Received-Date: Fri, 16 Aug 2019 23:38:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 16, 2019 at 3:40 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> * fixes:
>   ERROR: QA Issue: /usr/bin/dbiproxy contained in package libdbi-perl requires /usr/bin/perl, but no providers found in RDEPENDS_libdbi-perl? [file-rdeps]
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
> index 91f94a1aa0..7532b3fa22 100644
> --- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
> +++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
> @@ -28,6 +28,7 @@ do_install_prepend() {
>  }
>
>  RDEPENDS_${PN}_class-target = " \
> +    perl \

should this be make RDEPENDS_${PN}_append_class-target so it can pick
the perl rdep from cpan-base class ?

>      perl-module-carp \
>      perl-module-exporter \
>      perl-module-exporter-heavy \
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

