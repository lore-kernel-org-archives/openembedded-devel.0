Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8213071AD1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 14:55:00 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id g2so6411388pli.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 06:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jYJaqbOqe5XY2U7IPVUdsyYcz6QF4RtlBtTrpze5lJ4=;
	b=IpwAibhAleWDJq/dsMXN5he7Tkj4rRQyNzUM4Q5X1lO3Ti2igcTJi1PaLYqxCae7iF
	EjZ1ao91hlZVJW4ayEFN07CNkTmCtQmraG3wcyOGJJ2puM0VA1m//NKvyRnvYBD1AEzL
	aRUCDTUB2aFL78qRBbvbv1rRNlCs3aDlIpyu3VW7tfIuZwHesr0aS33u0ZD52fy4n6dp
	qYSMG9hAA8JsQR7D6VAZbs4WBVymPhkgfbkFXlYfddfG6p6n5NfbBqgNyNLQ+dY4eHb4
	pvd3+eMC9CtJ7kaq1kUBpKwYmcetiNcYbHsv7l1YlB/K+g8gXsOgQcxMK2ugOi6idNm/
	JtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jYJaqbOqe5XY2U7IPVUdsyYcz6QF4RtlBtTrpze5lJ4=;
	b=HxW/y0yaV5nDjBb1bGWo0xqrx9MLa+Ef730LDfzjy3evvTvOrtIXN+gZ6NE4rLpZnn
	FjZV2c1oU8462vIucxkzvCmb0dscd13jjlgy9JCy3ixLZozhytqN19/yk4v57V9HG1uE
	rk5D8tnJ0RWpJIZXprhb9AZe5GtXUEG2Gc2IeGThumxG/DLYTrxbgqPHcm5Jj+/GxQQJ
	D9pk9luENu+jgClKrRMfaWtxfdvuNWvGDA3j/t15UwlT61AhSJ8gkmw/f3QOZJauyyOV
	K8dMixYNti8FdaEcWJaaF8v8tXv6n3iT3BmPtpGScV7HA46E2lJ5OjREmyLQ8iNLfNJb
	m36w==
X-Gm-Message-State: AJaThX4eu5IFRkh/k7hqXW7bmIBa3kqzyfgr4zWzNBy9ZQ3PrFHgdgcR
	VQ8QRTZGMnOqBpdZ/JrCzrIGdjcKAMQbvVjIeI4=
X-Google-Smtp-Source: AGs4zMbvtHhH4Pd92g6HkgQvlOZ6UjykcvoMgYqO8J8H9BqDdXekc1CgOuHsWEO1LNO8WLbYjynTFcmBETTjVTHN2Wg=
X-Received: by 10.159.216.139 with SMTP id s11mr6409229plp.441.1512140101803; 
	Fri, 01 Dec 2017 06:55:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Fri, 1 Dec 2017 06:54:31 -0800 (PST)
In-Reply-To: <20171201124658.19036-1-otavio@ossystems.com.br>
References: <20171201124658.19036-1-otavio@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Dec 2017 06:54:31 -0800
Message-ID: <CAMKF1sp8GeD-4c1ungSZeWDhhQ2cbMrmRGd2+MJBrDFZKK4ggQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe PATCH v2 1/2] nghttp2: Move to meta-networking
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
X-List-Received-Date: Fri, 01 Dec 2017 14:55:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 1, 2017 at 4:46 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> The nghttp2 depends on c-ares which is provided by meta-networking
> layer, so it should be moved there as well.
>

perhaps meta-webserver is better suited for this recipe.

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
> Changes in v2:
>  - rebase on top of master
>
>  {meta-oe => meta-networking}/recipes-support/nghttp2/nghttp2_1.26.0.bb | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename {meta-oe => meta-networking}/recipes-support/nghttp2/nghttp2_1.26.0.bb (100%)
>
> diff --git a/meta-oe/recipes-support/nghttp2/nghttp2_1.26.0.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.26.0.bb
> similarity index 100%
> rename from meta-oe/recipes-support/nghttp2/nghttp2_1.26.0.bb
> rename to meta-networking/recipes-support/nghttp2/nghttp2_1.26.0.bb
> --
> 2.15.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

