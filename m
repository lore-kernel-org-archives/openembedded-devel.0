Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id C6F2A7D6A8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 15:31:26 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id m2so16317822qkd.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2019 08:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5np+UItSu3Ph8fjpLV2ViqCSBZto7+LCZwc8GxXtujY=;
	b=V53/1o2DsVouX/RRB48d0Yfile1MkZWLZNXI9XivA0nhs1sdYQrRDJJHyELbEjUxVh
	ucNlWUEzWo/MfIiD/CQP/vqxAy34UkRj+hLna3HOLQC2qDhmmDvWmEMMSLSvzFTYWImd
	xNTQfdtOeIo4td6E0W5jUc74Hxt29OnO+dUDELI3Oq5eW8h+viQzqgKvmFN49tswdfkM
	ip2WM7tiWaYhWqGt4kGMOGuwW4qhGj/nfRIUlFTyKIRF6LaVMntZLaRyjyP+WBLby8PH
	FtWPaVrgKtI0KIhKlT6UOQqb+Ic4i0qNoq7ZVFJ/WKLrXTGKl5buepOgmNuc2jwhP3X6
	6uUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5np+UItSu3Ph8fjpLV2ViqCSBZto7+LCZwc8GxXtujY=;
	b=ap76VEl65AWKAufyUvfve323zdqBTm5/MDAdI0a4Z6jfIU/CEkd5kPZStQa/lylP9V
	wxhwogRcKCSNmmfEIBNUF1xSiEp0w9qpjXaqtbXGh6FMwP919LPWz1ZvIUBx0E3t0L9J
	dKMyeRHb55prkKAANNP4yVu0yRCSYVkWRKyVe5IFuiFtxadzDEb3fUI57Bu60Zg8uIFd
	Sm8zTqpemoIkPBthJJgHr+mETm1n1EXBMw22nYbQsK7LqIj5mqQ5esJqH5F43eUl+lsk
	lntm9OAQza4Xncy81bAyI09ki3acHhbtNFmL9b0DO9ViQNy7ycYIknVbZe00Hik/dmL+
	+WvA==
X-Gm-Message-State: APjAAAVHR0Lx2xDk4cBhOrY1MGhuPMWaxXZbc+1V1f00x9CD56fOq2Op
	vIhezxnF2XO4OQkZ5ioEcjKM50JDz4xnn0U/qI4=
X-Google-Smtp-Source: APXvYqxHGp8TRAh9ie9crbu/0se4BGWw+9E1oibJ0KBb1Ah+LAz6Oh4KAKAPnbjhc1Q5omSy2qRTFW8ftw8BWbkmfeM=
X-Received: by 2002:a37:c403:: with SMTP id d3mr27569503qki.212.1567524687367; 
	Tue, 03 Sep 2019 08:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <1567156014-79892-1-git-send-email-hongzhi.song@windriver.com>
In-Reply-To: <1567156014-79892-1-git-send-email-hongzhi.song@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Sep 2019 08:31:00 -0700
Message-ID: <CAMKF1spP9hQt64stWn_mSGfE7tVg_wLhaADyp4VHqWLCe1GCog@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-realtime][PATCH] layer.conf: add openembedded-layer to LAYERDEPENDS
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
X-List-Received-Date: Tue, 03 Sep 2019 15:31:27 -0000
Content-Type: text/plain; charset="UTF-8"

please send this to linux-yocto@yoctoproject.org as per
http://git.yoctoproject.org/cgit/cgit.cgi/meta-realtime/tree/MAINTAINERS
always good to check README for such information.

On Fri, Aug 30, 2019 at 2:08 AM Hongzhi.Song <hongzhi.song@windriver.com> wrote:
>
> latencytop.bb depends on gtk+ which exists at openembedded-layer.
>
> So we should add openembedded-layer to LAYERDEPENDS, otherwise
> "yocto-check-layer-wrapper meta-realtime --dependency 'cat mylist'"
> will fail with "NO PROVIDE gtk+ ..."
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index cb24358..72ae7ad 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -16,4 +16,4 @@ BBFILE_PRIORITY_realtime = "5"
>  # cause compatibility issues with other layers
>  LAYERVERSION_realtime = "1"
>  LAYERSERIES_COMPAT_realtime = "thud warrior"
> -LAYERDEPENDS_realtime = "core"
> +LAYERDEPENDS_realtime = "core openembedded-layer"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

