Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5288960303
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 15:57:21 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id m25so3857670ioo.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 07:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sokB1H5XtW+7CHHZr7mGQAjNL1LiDors0JM7eMbu/Gw=;
	b=lEq2zyElxdULoE36RFgMkuPLI1eW41hsaj9Omu9HGSrFIoMggJv2PkMq1/H2ARps7v
	dJmHnydOJjGGMHGAVsiSemI2heuh+8CYuhBXfsIpq+mMckbSFjEeMDqPyCzIBipHPJhG
	s05H2HuyuEOJHRDiKJ8UcZqd2xiL8PRMxBHVLI22tvNDB0rGRe5NpjT/ncrqcSAonCTY
	ISj7ZV7Y3SKk8uYpvb0RErOrufBgBesVk0CaeYT2Pge37/oSUUwZUrRWU3+oB08X2ZAL
	QKV+QaSd7pSaVJaKcQjV44WtOqp541hGaOk4ie8074Qdi5AqYKtLrmUNdhe5hiT6YV8/
	m6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sokB1H5XtW+7CHHZr7mGQAjNL1LiDors0JM7eMbu/Gw=;
	b=bKd+wFgCwp4+VJTA8Iux5SVcjEHL2YKWAW2fsKSHf3eApYbaEED5b2x4oyg/e/W0Nv
	pYxxztUmhr0mbScC1ug+AyCBXwgVXdsfs0i8ffxJhNMsO6na214WW8pKuLv9XgDG6LZE
	CoLjdCBEXRU1Iagzv7s4ijXMUYW0OAIr3sCSsQClElm2IXid7q4jIU3fHrT6yNmvzwj6
	3X8ttK5Y3j4x5hwNb0xKsmD+oDaSSB01Pi+5zDI0LJAOaALzydvRXMulMtX7z/tdnSgm
	F4F0IwQ38MuXFwC8pTNR1NRjUPz5z1FqYyDjkfhug+8VBfCGAMVy07RyMb9ogq4Kpe+e
	R2wA==
X-Gm-Message-State: APjAAAXNH6ISL3nqUqjOa8TEIoawXpplL088hbvXgxrRchZmpW3O/xCN
	i8Sdt1g4N53zAtZCj8T0Yd56RYS7ElFSY/LHyVA=
X-Google-Smtp-Source: APXvYqy1FC/xNE/QEBbfSxAYRYutfmB09jjvvuCUyxYLqXL45OGm4TnibK6sKrXz2zlr/UOu/FzDUVo5lKCtLPKZm+k=
X-Received: by 2002:a6b:b642:: with SMTP id g63mr4921199iof.122.1582732642212; 
	Wed, 26 Feb 2020 07:57:22 -0800 (PST)
MIME-Version: 1.0
References: <20200225135346.13344-1-Martin.Jansa@gmail.com>
In-Reply-To: <20200225135346.13344-1-Martin.Jansa@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 26 Feb 2020 07:57:08 -0800
Message-ID: <CANx9H-B+bfh_qpQuesoZ=vAE2aiCcs8iR7=+FuLNHQ-hpgVj5A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python2][PATCH 1/2] python-backports-functools-lru-cache: enable native and nativesdk
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
X-List-Received-Date: Wed, 26 Feb 2020 15:57:21 -0000
Content-Type: text/plain; charset="UTF-8"

Merged. Thank you!

On Tue, Feb 25, 2020 at 5:54 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> * since this change:
>   commit d1a1c57d0e73251e86591214f30fc90010d5c111
>   Author: Tim Orling <ticotimo@gmail.com>
>   Date:   Mon Jan 20 11:31:59 2020 -0800
>
>     python-beautifulsoup4: fix target RDEPENDS syntax
>
>   there is now this dependency:
>   'python-beautifulsoup4-native', 'python-soupsieve-native',
> 'python-backports-functools-lru-cache-native'
>   and error in world builds:
>   ERROR: Nothing RPROVIDES 'python-backports-functools-lru-cache-native'
> (but virtual:native:meta-python2/recipes-devtools/python/
> python-soupsieve_1.9.4.bb RDEPENDS on or otherwise requires it)
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../python/python-backports-functools-lru-cache_1.6.1.bb        | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-devtools/python/
> python-backports-functools-lru-cache_1.6.1.bb b/recipes-devtools/python/
> python-backports-functools-lru-cache_1.6.1.bb
> index 8c40cf5..aee130f 100644
> --- a/recipes-devtools/python/
> python-backports-functools-lru-cache_1.6.1.bb
> +++ b/recipes-devtools/python/
> python-backports-functools-lru-cache_1.6.1.bb
> @@ -25,3 +25,5 @@ do_install() {
>  }
>
>  FILES_${PN} =
> "${PYTHON_SITEPACKAGES_DIR}/backports/functools_lru_cache.py"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

