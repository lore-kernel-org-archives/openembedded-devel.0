Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1BD807DE36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 18:19:17 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id o18so11107045qvf.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 10:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=av8q4x2VuXyTcj8CZGvwmDxhkFlD6M0DLPZe0AL4IJM=;
	b=vBjXG2UMT1cvKVCLqG+YPwIMEYVgC0mySoOaXXxvUWhxZzfgmZ095yzoPwGFCuw3JM
	V5Q6cZ9u6acdJe5uRekCOfg9aAPWuEXmetiFvxQ8wZl18Hei4c4ukWvTg/uIGKtI1tHb
	APgg/F2qf+It8v/5sYqb/pmOiYrAo7k+66o5fk6Yo5LnOjYThdtxRsOmexBAdKzoFhsp
	AS0Gpm5D5SpmnmIO2xn8MKWbt3QHycMikqYS5ZbWRkbr58MXOHvF30L51Pv6EYmLJ+Q3
	itqw0KNU/V5/w6u3l7FFmclISC8Fnm86ruZ9aAaZoDw3hDFR0syPmJ3FEF1hNRWxYsp9
	BF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=av8q4x2VuXyTcj8CZGvwmDxhkFlD6M0DLPZe0AL4IJM=;
	b=O060C0ABFjzkDwdmg13LMEUQUOTesFDWOQpumhNgKUDNZujOLXjiuh0otYaiQutP21
	ocAc4ChU0fZWs+yndmVF2U7IA8Mtsmt+Vbd5RA0mKQ3UwC9eaXx8hVlhgNYo5ktVLswo
	MSdggC+MZJCv6SVs5D02N3Q+oedm/MlMOGxJjz16ypXsrI8sR/7JJG0S9ef+/bCKzKtr
	z173ryd7EG2eHiP811e0Mxd9MEiA1H8CBq5PTuHsQg5cc/TawBitR5eoox6BRdcSSwKq
	isO1kgWwxgIE/wcZqoZW4H7StnxzXd+vkCzFuCt9onvb9a6pCD+bzVR57F41rS3nXB2B
	bSGA==
X-Gm-Message-State: APjAAAXnJjwbHUh3czmkTinOfYutWbYMWtV6zjcgD4vv0nWYxvBCuUKj
	UODn2DDWiYAzMGSgwIJjCmADPDcs2Q1vVfW4KiY=
X-Google-Smtp-Source: APXvYqwoCbt1r6Bc+HtRFZ3tLuIDHjF6MCI0oa5nTvapgj+keBtgBYSoC3n0xKyxpoetezMI57XW4KxMKlQRt9KUBKY=
X-Received: by 2002:a0c:8605:: with SMTP id p5mr44780663qva.109.1577557157835; 
	Sat, 28 Dec 2019 10:19:17 -0800 (PST)
MIME-Version: 1.0
References: <20191227172339.10885-3-peter.kolbus@garmin.com>
In-Reply-To: <20191227172339.10885-3-peter.kolbus@garmin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Dec 2019 10:18:51 -0800
Message-ID: <CAMKF1srxGU_XQQjF5G-5df1kfcoYxRzHVTtEU2qk3ycF_wJ2UA@mail.gmail.com>
To: Peter Kolbus <peter.kolbus@garmin.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 3/4] python-soupsieve: add recipe
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
X-List-Received-Date: Sat, 28 Dec 2019 18:19:17 -0000
Content-Type: text/plain; charset="UTF-8"

http://errors.yoctoproject.org/Errors/Details/300494/

On Fri, Dec 27, 2019 at 9:26 AM Peter Kolbus <peter.kolbus@garmin.com> wrote:
>
> Backport python3-soupsieve to python2; this enables use in
> python-beautifulsoup4.
>
> Signed-off-by: Peter Kolbus <peter.kolbus@garmin.com>
> ---
>  meta-python/recipes-devtools/python/python-soupsieve_1.9.4.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-soupsieve_1.9.4.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-soupsieve_1.9.4.bb b/meta-python/recipes-devtools/python/python-soupsieve_1.9.4.bb
> new file mode 100644
> index 000000000..55a673ecc
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-soupsieve_1.9.4.bb
> @@ -0,0 +1,4 @@
> +inherit setuptools
> +require python-soupsieve.inc
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-backports-functools-lru-cache"
> --
> 2.24.1
>
> Note- I recognize python2 support is ending. Nacking this patch and
> accepting the next may cause python-beautifulsoup4 breakage; will leave
> it to your discretion how to handle this.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

