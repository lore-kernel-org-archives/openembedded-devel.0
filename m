Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9142A7002B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 May 2016 01:08:01 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id u64so80024622lff.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 May 2016 18:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=BqMWm1bET9GESKw6qAA74t7xfAe8DCJigL6CM7kvkTw=;
	b=bIOMq/5D/tow291/6uhxjMpDZXKyMELvn7PorYwHlhOHzPuL6hX5LIsSD3ZlmkvhSR
	Vl/piw9jgBG+Kv72c933PT0rjj7e3V639QqEhCAMXe55qndSouHEG3DLpGkOCB78+eIW
	3d5/0wEW0JVwv0liuevyGHi73un/QtWbYWwpFhtx2+ILJuR7l9CuLY/98yI95fuHIjIK
	/jsI0/58dBQCDFAk3K6SvgeJvg4cTKVCiusoH5yKDQ4NGARgnRzxZddZM7bm59SUBy8h
	6VxcYgQS44mLysQNjJY/3f139ES3loF4vwA29n2CcewLKNZKFnQerwmNoaY/CAaa7pI+
	TiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=BqMWm1bET9GESKw6qAA74t7xfAe8DCJigL6CM7kvkTw=;
	b=ECS005ywSRH1IefH2Ja10JyNQzALBqPdsyrcaTULVvZF9CA2AgnkVkAD5Sr26hT6p/
	BOEoWP1IDdpTUoA3v9Y2Dzn/TcXjrCjgZWT7e/NidUwGAaiKN51vAmQ7Yb/XWtfGTLst
	hehcANxjea/n89nZvkmg7TJyKCJmyw6/pJBlRUOFsjzN2Is7nk7QdorgtlJyn7IFFWJ+
	6VGaSX0OwAstm77VQMHnWHSsCwKrSI8hVUaROxrora16vzep/fJ2xNTjarndqSSQyZvE
	a/acSN0W3NbPuR6FJQ4Vp2/9dJRZUIdAEjjTDiDfGKW7X/weewrXo47t9Hc7x6ew4vIw
	maGQ==
X-Gm-Message-State: AOPr4FXS1ln1miMZoFXcFQN6pTbImf+5HZqgDuvhFKyjq6k2XiTkrZxbCKkSwXLoN7WD6z5AfRGfI0Xyji1/7Q==
MIME-Version: 1.0
X-Received: by 10.25.23.155 with SMTP id 27mr4795164lfx.3.1462410480413; Wed,
	04 May 2016 18:08:00 -0700 (PDT)
Received: by 10.112.180.229 with HTTP; Wed, 4 May 2016 18:08:00 -0700 (PDT)
In-Reply-To: <1462279897-7364-1-git-send-email-derek@asterius.io>
References: <1462279897-7364-1-git-send-email-derek@asterius.io>
Date: Thu, 5 May 2016 03:08:00 +0200
Message-ID: <CA+chaQeyRBhYkRoPBssbqvzox85kp4xMSCVb_6Gn6Fw75ETVWg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Derek Straka <derek@asterius.io>
Subject: Re: [meta-oe][PATCH] leptonica: update to version 1.73
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
X-List-Received-Date: Thu, 05 May 2016 01:08:02 -0000
Content-Type: text/plain; charset=UTF-8

Thanks for fixing that, now there is one more issue with leptonica:

WARN: leptonica: leptonica rdepends on openjpeg, but it isn't a build
dependency?

Can you add PACKAGECONFIG to prevent autodeting openjpeg by this new
version?

Thanks

On Tue, May 3, 2016 at 2:51 PM, Derek Straka <derek@asterius.io> wrote:

> updated to be compatible with giflib 5.1.x
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  .../leptonica/{leptonica_1.70.bb => leptonica_1.73.bb}                |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-graphics/leptonica/{leptonica_1.70.bb =>
> leptonica_1.73.bb} (76%)
>
> diff --git a/meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb
> b/meta-oe/recipes-graphics/leptonica/leptonica_1.73.bb
> similarity index 76%
> rename from meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb
> rename to meta-oe/recipes-graphics/leptonica/leptonica_1.73.bb
> index e826e05..57bc5dd 100644
> --- a/meta-oe/recipes-graphics/leptonica/leptonica_1.70.bb
> +++ b/meta-oe/recipes-graphics/leptonica/leptonica_1.73.bb
> @@ -4,8 +4,8 @@ LICENSE = "BSD-2-Clause"
>  LIC_FILES_CHKSUM =
> "file://leptonica-license.txt;md5=20cdd3af097ca431b82004c691f406a6"
>
>  SRC_URI = "http://leptonica.com/source/leptonica-${PV}.tar.gz"
> -SRC_URI[md5sum] = "5ac2a31cf5b4f0e8f5a853a5266c42ef"
> -SRC_URI[sha256sum] =
> "d3d209a1f6d1f7a80119486b5011bc8c6627e582c927ab44ba33c37edb2cfba2"
> +SRC_URI[md5sum] = "092cea2e568cada79fff178820397922"
> +SRC_URI[sha256sum] =
> "19e4335c674e7b78af9338d5382cc5266f34a62d4ce533d860af48eaa859afc1"
>
>  EXTRA_OECONF += " \
>      --without-libwebp \
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

