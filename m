Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 376AE79306
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 03:17:43 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id p84-v6so24849049oic.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Aug 2018 20:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=ufGMY9nuOlhheJtMZj5mgPMpeDU3j0wIoOJGs5Kh3fQ=;
	b=hw66fkh0qDP1qFCijYapUcs4xFTmfXD4aRukyjDeqrgdzg8f5s/ISfUtIr5Gh8Fnne
	SOGbhYsRj0UF5HhM9wXN7x7tXeIeJ0I/BPlkdwWuml8X4x3zX7aYFBrEmlOaZekTUw67
	wufs/khQixVQCwhBFNpVjzO7QW16/AIzQSc+ISmKU5YapYL372frGo6oJNofbh85FLra
	aQDId7SdTGT9sEUkP1k/xGxfR2Max2aXDuhQjjKiZxJv3LKN/BFFDD9dk/b5M5+X4Q1C
	2A7rI3/GUkEwJCZxxkZlyDmKE8uK0mqFKME2g6EW7FdD1LrsxVAR1LJF4IstWGCZ05Nx
	1CZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=ufGMY9nuOlhheJtMZj5mgPMpeDU3j0wIoOJGs5Kh3fQ=;
	b=rL/Wu/IULgbhp6MMe7F0YIcZKjNE/8vNvYArEjTCsGA+KWEM3fiGGwXE8Cbn2k/As8
	Fi1lo9l9OfnDn/3ewLSq/mls5aXTleMGAW2pJLHXNZfOAHwti+D1x5rA7djET9JjsaSC
	5seR2fTApCekKcY6hEYBI43Z0zVXA4RKa53STZ+eY7KHxCuhJ1KzGM7fFWaiNCWa812L
	lFl8zzJEe65LicUdtkzbXGkr6zXWzD0M/V4cri4gGO3DfD1pgvNykf0yxHfx04fjh6Qu
	rx/jzXH0Gy5CGUYCVat8sNyKu4cRrtKZL3vzQz2f4DBzfcCVBH9c1/hkazKwsYUC86DL
	EGUQ==
X-Gm-Message-State: APzg51CjoJ+7TREGxetmH3pid3gLANJWifnJUpzdJDkBh5DCNesKa3Im
	H/M8eScJr8pJpxl6EW/MgHUnWANr
X-Google-Smtp-Source: ANB0VdZXh1zYhb4LFhxQG9fKij7fWzibwsH7V1WUCJbzPqCTNnjD/tHIIQGMFv8L4pJg4nVwoo3Sog==
X-Received: by 2002:aca:ad4f:: with SMTP id
	w76-v6mr11859876oie.233.1535339863805; 
	Sun, 26 Aug 2018 20:17:43 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:548d:64c4:7713:42f0?
	([2601:202:4180:c33:548d:64c4:7713:42f0])
	by smtp.gmail.com with ESMTPSA id
	t141-v6sm30565856oif.18.2018.08.26.20.17.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 26 Aug 2018 20:17:43 -0700 (PDT)
To: changqing.li@windriver.com, openembedded-devel@lists.openembedded.org
References: <1535339666-364064-1-git-send-email-changqing.li@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <a5b7e74e-4f8e-431c-bc34-7b812ebde595@gmail.com>
Date: Sun, 26 Aug 2018 20:17:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1535339666-364064-1-git-send-email-changqing.li@windriver.com>
Subject: Re: [PATCH] libsndfile1: patch for CVE-2017-14634
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
X-List-Received-Date: Mon, 27 Aug 2018 03:17:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 08/26/2018 08:14 PM, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../libsndfile/libsndfile1/CVE-2017-14634.patch    | 40 ++++++++++++++++++++++
>  .../libsndfile/libsndfile1_1.0.28.bb               |  1 +
>  2 files changed, 41 insertions(+)
>  create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14634.patch
>
> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14634.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14634.patch
> new file mode 100644
> index 0000000..12dce56
> --- /dev/null
> +++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14634.patch
> @@ -0,0 +1,40 @@
> +From 85c877d5072866aadbe8ed0c3e0590fbb5e16788 Mon Sep 17 00:00:00 2001
> +From: Fabian Greffrath <fabian@greffrath.com>
> +Date: Thu, 28 Sep 2017 12:15:04 +0200
> +Subject: [PATCH] double64_init: Check psf->sf.channels against upper bound
> +
> +This prevents division by zero later in the code.
> +
> +While the trivial case to catch this (i.e. sf.channels < 1) has already
> +been covered, a crafted file may report a number of channels that is
> +so high (i.e. > INT_MAX/sizeof(double)) that it "somehow" gets
> +miscalculated to zero (if this makes sense) in the determination of the
> +blockwidth. Since we only support a limited number of channels anyway,
> +make sure to check here as well.
> +
> +Closes: https://github.com/erikd/libsndfile/issues/318
> +Signed-off-by: Erik de Castro Lopo <erikd@mega-nerd.com>
> +
> +Upstream-Status: Backport[https://github.com/erikd/libsndfile/commit/
> +85c877d5072866aadbe8ed0c3e0590fbb5e16788#diff-61db6a4422d4ff5453548f73548f4ca1]
> +
> +CVE: CVE-2017-14634

Missing signed-off-by


> +---
> + src/double64.c |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/double64.c b/src/double64.c
> +index b318ea8..78dfef7 100644
> +--- a/src/double64.c
> ++++ b/src/double64.c
> +@@ -91,7 +91,7 @@ int
> + double64_init	(SF_PRIVATE *psf)
> + {	static int double64_caps ;
> + 
> +-	if (psf->sf.channels < 1)
> ++	if (psf->sf.channels < 1 || psf->sf.channels > SF_MAX_CHANNELS)
> + 	{	psf_log_printf (psf, "double64_init : internal error : channels = %d\n", psf->sf.channels) ;
> + 		return SFE_INTERNAL ;
> + 		} ;
> +-- 
> +1.7.9.5
> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> index 281ac82..9416e52 100644
> --- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> +++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> @@ -10,6 +10,7 @@ SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
>             file://CVE-2017-8361-8365.patch \
>             file://CVE-2017-8362.patch \
>             file://CVE-2017-8363.patch \
> +           file://CVE-2017-14634.patch \
>            "
>  
>  SRC_URI[md5sum] = "646b5f98ce89ac60cdb060fcd398247c"


