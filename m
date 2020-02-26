Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
	[209.85.166.42])
	by mail.openembedded.org (Postfix) with ESMTP id 25DF661625
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 15:57:47 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id n21so3848313ioo.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 07:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=P6FR/XwN1yDwy6N0OtJqp9gT0Iv/B1epv+dlvs8dKzA=;
	b=AYp79rZWtCidtpc15gT0PsWxAwz6cAXE/SzHnfu7aE1hnuI3p6Se87I1FQxXd443ao
	F8yoscPQYpPv+vO5EzkGSSuusuG0D0XjjHYpmmeVopzv9PjeO3G/XnRF3VJWOf1c5Jur
	/OYjg4lj3O3V9fFRVC7pJFySp5GlfUTTQhvAZ4zu8go8hwur9vkaJPtGudwlLXJsn433
	o1sM5gUfwLComp2HxL+7/v7iCbPouzatxL6dwsdgDuXTRSJMqz7SNj+Hnxz0BIqv1Ogh
	grn6XVNnYB6xxvOO4TVw78XT4aMHMDpvvaS8KHPUbocFjRbajk/ewQlo64/oBS/jVUQY
	5bBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=P6FR/XwN1yDwy6N0OtJqp9gT0Iv/B1epv+dlvs8dKzA=;
	b=qC3MDjQ0Kcj/iCQjZLy+HXyVLhEtb3fEYg8+ohz63xHAT3kX1gZfjI7x+EuE0/Z4km
	j+ylmqtkrHbnr5XNcfZV7/9WqEojBGqGs8WhsjbNXCsto7hL0LAC7otkkj7vc85I8St2
	CirDpTvWE4rlGaH5guqptLbzghcMzdgrDt/91OtwOfK+XYhVE2Rjfk6kI/Sv50raHVo1
	GlZB2dtGvWxJnoMR4ZxynshlqJ/AhvLybqKMKfgcKIMf7UDR+wqZg1LvFRb32kwCOgXa
	B87a6MQKzCl0mCPFnpkJBErynJII6p4deMN0zhqA7Q2rf+LzEmyITrnbvc5bc+L2DgQ/
	Cr1Q==
X-Gm-Message-State: APjAAAXV4uCtZ1cXokLqW0r3DltKJQucLaSXEZr7Uwjn57EHfqA9Ue9m
	9KZHmptnVWvVljP2PEVp8NVCjFxbtgwsZucpMSfpIA==
X-Google-Smtp-Source: APXvYqwkcpAcKyqwNgJkxePAVHI0WXRLwsbmWcABf4L1ESo08WirSJwDzsVsV62DesZeCjeF79BwyMvX59PzzUEHpvA=
X-Received: by 2002:a05:6602:210a:: with SMTP id
	x10mr5261024iox.151.1582732668961; 
	Wed, 26 Feb 2020 07:57:48 -0800 (PST)
MIME-Version: 1.0
References: <20200225135346.13344-1-Martin.Jansa@gmail.com>
	<20200225135346.13344-2-Martin.Jansa@gmail.com>
In-Reply-To: <20200225135346.13344-2-Martin.Jansa@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 26 Feb 2020 07:57:37 -0800
Message-ID: <CANx9H-ADnUq-koTbui5Hs=R0pmiPCzn4mN=QYnR5-v20X=AqJQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python2][PATCH 2/2] python-backports-init: enable native and nativesdk
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
X-List-Received-Date: Wed, 26 Feb 2020 15:57:48 -0000
Content-Type: text/plain; charset="UTF-8"

Merged. Thank you!

On Tue, Feb 25, 2020 at 5:54 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> * needed for python-backports-functools-lru-cache-native
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-devtools/python/python-backports-init_1.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-devtools/python/python-backports-init_1.0.bb
> b/recipes-devtools/python/python-backports-init_1.0.bb
> index 29e712a..8b226aa 100644
> --- a/recipes-devtools/python/python-backports-init_1.0.bb
> +++ b/recipes-devtools/python/python-backports-init_1.0.bb
> @@ -23,3 +23,5 @@ do_install() {
>  }
>
>  FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/backports/__init__.py"
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

