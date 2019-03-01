Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id D89037CD7D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 15:56:56 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id v10so28275277qtp.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Mar 2019 07:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lXJXQV6rFNFxLq19hj0zYSFj+0xSYNhYtUyzKB4fg90=;
	b=WWiB9SjxX87wH+q+SECkP4GKhELzRxq1jIEOpVSLH8SDkxhCAFWNfzN83tYlaylT9I
	zhLlT19qXAtmNT+YAxDaLNmVqKMVIunFt0A0pVdS4GbqLdE8leASHMh9LcKeX8lXZSje
	7wCfR6ppj1oy00bb72rKfBLT+kxXe/rhATE6qHcEM8SLQLuZPtnk5VCsddxGvwSSJAhP
	yZ1i02Yyp0iBoRsLz4xshybduEm9iGDD3/BvU6rCrULs1v5pQKfEdq//mYhMDh89xFKG
	gJd26gTIsx4QrcexfTPDEKttoFFvyHdciLppndV8WrzUqcLYtgpGWap08mF3PsTCCAGZ
	1IAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lXJXQV6rFNFxLq19hj0zYSFj+0xSYNhYtUyzKB4fg90=;
	b=du2AxEXOPupubX3P5fYhuLPp2Ly+kZW/aHp/AJoCcBNW57R0NYWx4sCHRhZMJIe07k
	tyoIFoUZj5GOLKZh92IhUUoZ/1FcBo/+iXZEX/x6T1vE9+xx9UoyY5cSndZV0CFlaJp9
	X8YB9MAjvk9nZYMIMmPxrUbPbpfQBOYN5rdfrDyHUc0ghCjQK9WQVBEOHlNgtqcUu2Eq
	mJ4FePBJ0s3fXZ3cEc0aIliHmP9Nh3mCih2qvCBMSkxoGRGMkmK1fwpIHq6RvUVGt6hQ
	44VChJdMBBWcfzVhtjKlRWd+gqCqBJLApkJ2YlGQqJJlTWco67IQDpgum9KZKUXIQ2cf
	DUjw==
X-Gm-Message-State: APjAAAXt67lZt029UzWoSwflhunwjEGGbydlOOY1QyLfYVxlW8/IDx0Y
	EDvO9l6RfmvYc26f6xkagjaTYg9GzYujvqsF3FI=
X-Google-Smtp-Source: APXvYqzX/wfIGe3BhNi80kEUCQvAu5l8uUhOJudUi7ZbGgcyUbXOZytRqu7qhY4b97BPacltWbbPOKylwq4c1fBRZu4=
X-Received: by 2002:a0c:94cf:: with SMTP id k15mr4317236qvk.55.1551455817474; 
	Fri, 01 Mar 2019 07:56:57 -0800 (PST)
MIME-Version: 1.0
References: <20190225140010.19025-1-otavio@ossystems.com.br>
	<CAMKF1sr88He+DDgyaRWdabY8d0xuV5jM8faQgBSeYOCY0zpaYg@mail.gmail.com>
	<CAJTo0LZFz3mLSROPrV3y09L4ZTSZ5T+uO=8MRKmrReDoLLDf7w@mail.gmail.com>
	<CAP9ODKroyRVLaK640+UZv2idv3FnZ2NC8hgMqQDQU63f9-QQiA@mail.gmail.com>
	<CAMKF1sqbAFbXdeJTL=gtJU4QzdPwdwEW5R01gpnUx4OhB_YtjQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqbAFbXdeJTL=gtJU4QzdPwdwEW5R01gpnUx4OhB_YtjQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Mar 2019 07:56:31 -0800
Message-ID: <CAMKF1sp61cfBXHTuPzMeQGfuK3SXv2h8kdDq5z1nAhC9_hUTLw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	Maxime Borges <maxime.borges@strataggem.com>
Cc: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe PATCH 1/2] python-idna: Avoid removing '+x' from `.egg-info/` directory
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
X-List-Received-Date: Fri, 01 Mar 2019 15:56:57 -0000
Content-Type: text/plain; charset="UTF-8"

Otavio

Can you resend this patch series, its missing in patchwork, so
hopefully, it will catch it this time.

On Mon, Feb 25, 2019 at 11:05 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Feb 25, 2019 at 10:38 AM Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
> >
> > On Mon, Feb 25, 2019 at 2:03 PM Burton, Ross <ross.burton@intel.com> wrote:
> > >
> > > The original patch doesn't explain what it's doing and is clearly
> > > going to remove executable bits from directories, which clearly isn't
> > > right.
> > >
> > > I'd say remove it, and *then* if it breaks again fix properly.
> >
> > I am with Ross here. It is a really ugly patch and if need, we need a
> > comment on the code and a proper reason to add it back.
> >
>
> +Maxime for information on the original patch

