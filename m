Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8B17676A51
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Sep 2015 08:37:39 +0000 (UTC)
Received: by wiclp12 with SMTP id lp12so22271942wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Sep 2015 01:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=wF7v5X0Q+4fn54TjgwdhNnVmF3qdjx83eHuU/B3LVfQ=;
	b=D01i58VWMCxhRIxNS3MZtigQjro8TvE/dyskmHf6lP9eweLiHlBIIxzmccSNfOWq7f
	pbfKvCFFLKec7tXPqIvT0azX9u9YGmkZxTWX6SZOFDjaPqbVrVpwfXxS/mclurdNDxSd
	SFlSGl2V1rZ3gMAA4B14JO8lJDEhbN1uehWeKJJjCZNwKM9X59y3ODcvfUZZhUbmenfJ
	4JgOLUgksxHSlqQTNrrAv4ULzOOEVT+onSMYd9jw+TYj4alUjpomHvpPo0bWVmrOyAVe
	858zVJOd/T/+VwB5DlekfNHn+8dWWpuDELrWIgpL3FhbQ8vHWFIVgXmyw+6/KTYSmC5v
	zJiA==
MIME-Version: 1.0
X-Received: by 10.194.94.165 with SMTP id dd5mr9447775wjb.40.1441096658462;
	Tue, 01 Sep 2015 01:37:38 -0700 (PDT)
Received: by 10.28.64.196 with HTTP; Tue, 1 Sep 2015 01:37:38 -0700 (PDT)
In-Reply-To: <BLU436-SMTP163EC5681882060DBD6E64ED66F0@phx.gbl>
References: <BLU436-SMTP163EC5681882060DBD6E64ED66F0@phx.gbl>
Date: Tue, 1 Sep 2015 10:37:38 +0200
Message-ID: <CA+chaQfq8YcM-RXp-Z47qcbYDsi7jYUB-RYkpnG-QrwTuuiNAg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] wolfssl: update version from 3.4.0 to 3.6.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Sep 2015 08:37:42 -0000
Content-Type: text/plain; charset=UTF-8

You forgot to update the SRC_URI checksum.

Please test it before sending.

On Thu, Aug 27, 2015 at 6:21 PM, LC Mac <lchristina26@hotmail.com> wrote:

> Updates include:
> SSLv3 disabled by default
> removed support for static cipher suites with PSK, RSA, ECDH
>
> Signed-off-by: lchristina26 <leah@wolfssl.com>
> ---
>  .../recipes-connectivity/wolfssl/{wolfssl_3.4.0.bb => wolfssl_3.6.6.bb}
>  | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_3.4.0.bb =>
> wolfssl_3.6.6.bb} (100%)
>
> diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.bb
> b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.6.6.bb
> similarity index 100%
> rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.bb
> rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_3.6.6.bb
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

