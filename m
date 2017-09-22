Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 758C471C27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 15:56:14 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id i130so804758pgc.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 08:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b3j5def8ZEOysGxN8OP/iS4Lj/hdcxi+cQzljFbQ6V8=;
	b=Il/ZPFi9WHj9F0hCVsBpzeLtbBlCyUqa8dwj6q69YFxBozPbYrkeyuq2xJuSI1bz9/
	om6tgPXpBsnFoMVr+RZuUTm65KITxE5rq2q8PojK78pZMZs8Nz03kyLyVKSKt7aHxXU0
	w/V4yk0nWgwBdELlWmrmKlZI2/Lq+Xgc7ciCN4gzlF79TJyxoYMEgPg4aDfK443LQi81
	7lwlWLFtMyfaedApVm/GETe+DzyEz71El7rzjVToaugGKs13m+3BwOMRQcQqTtJpnmf1
	B2OtjqNLgfALQzXboRA4YbZQZWeDq2F+q6A9EzFz/tv/UdQ5HeoFghdKjji972oALrZ4
	8rnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b3j5def8ZEOysGxN8OP/iS4Lj/hdcxi+cQzljFbQ6V8=;
	b=AtEf0A294rB4apPLLomBKl7L2eWybexEcmlkDHpf2hGYQ21fn13ZA8wBfUp0Fnht6E
	DbLMUK6irMVsLCOskWRMd/uiUzupidb/dMDnSgIKhWm35Rf/vQXGHUp9JNyFoc6jBmBH
	1EYnRtkNGdNnVQKnwJTwFSD2wPAazJP/XBWDWPoNGeL6N1DFF858gQqOdfeD75ShmcYP
	Y3xSPZM8bcFDJPZHGMsRL8Gca3xYYlR8cQoYOUy/vPFzatgEW0mS/DLaiIeiZ9G1ro4B
	7ICg2nlD1knZvbwnCu12uO+TH3KU7Bm8bo/0ox4fXUvHrVO/SS/4SvAxYUC23CbYP+fc
	DjKg==
X-Gm-Message-State: AHPjjUj4M00BVczqwigvaBulsG/tJukDn7Kic9E8LqlNCHSCBQokyZN7
	lZw/csZhmnsPZqJCMv8NVxa0J2sWJC4VzGGKU7w=
X-Google-Smtp-Source: AOwi7QB1wE/gZ7dcTteRDedJpooCY3PJhmMvTG0m4AegGmd69f/xvETxIKB4AIj5jE9kZ1mpj/VOoZBHZhHxclpULtU=
X-Received: by 10.84.218.199 with SMTP id g7mr9696664plm.215.1506095775616;
	Fri, 22 Sep 2017 08:56:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.149.73 with HTTP; Fri, 22 Sep 2017 08:55:45 -0700 (PDT)
In-Reply-To: <CACrLJgAyV=KOputf8o8O9=Acqu=V7gSUyY6hhBBFPBVECTFhVQ@mail.gmail.com>
References: <CACrLJgAyV=KOputf8o8O9=Acqu=V7gSUyY6hhBBFPBVECTFhVQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Sep 2017 08:55:45 -0700
Message-ID: <CAMKF1srBOJ9_E4sDx5iH8-r9b0NayX0-Wh-d4yWi9Ahjps2MNQ@mail.gmail.com>
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: How to use two toolchains
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
X-List-Received-Date: Fri, 22 Sep 2017 15:56:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 22, 2017 at 7:22 AM, Changhyeok Bae
<changhyeok.bae@gmail.com> wrote:
> Hi
>
> I would like to use 64 bit for kernel and 32 bit for userspace(rootfs).
> Toolchain is created by OE (Not prebuilt toolchain)
> Could you recommend good way to use different toolchains to achieve my goal?

I think you can look into multilib where, 64bit is default but then you constuct
an image where rootfs is virtually just 32bit packages

> If you have good examples, it's very helpful to me.
>
> Thanks
> Changhyeok
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

