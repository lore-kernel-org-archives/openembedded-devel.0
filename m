Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0B25C7E71A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2019 01:24:54 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id g16so2288409qto.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2019 18:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Im5B9OVM0D0YF185aqQWx/1nhVbUs53UzJHLz1nCKrM=;
	b=lFx5uRpcvV+nuMMQGHkfCoJtvPvJLGsViV6ZsQWIdCxOZ4N4w8Xt3f619VXQlHTiz/
	PAaH8Zno3Qx876JNBYwpKTyZ99wvqkB8r9ZfjbZGj4jigRcxDzkhG/aQNiSQEj8900DC
	zi+K1gi7tWvu1/MYhoL/hp0WNmfy/m4shqEy8TMAArISp7ExEGu6tV01zUpkYRq0bAtt
	Ykqy5SUrCi+Ge2i1NPqMmnJdQQKDp6ASk/u/j0/10+IqBRTb0ClmRapJ5Yr2t++Mde3i
	r9nghct4UpRpapDXQjWZr59Fs/JsB9gyDzRH1qD+nQ0gic20NNtZsgxJkmEzjh7wX0CP
	pBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Im5B9OVM0D0YF185aqQWx/1nhVbUs53UzJHLz1nCKrM=;
	b=jS9zSNmlEVRPvMRdoXvX/UmebsrtMOUgBsdkd/0V+Ku+0NZPWtqGOXvHwQloMkp2ft
	9y4PkA8urB7W9F1NX9pAtsFUMcdibvzOA+k/I2f60PYYfm+09zzeXPQUBACzbiWO5i1i
	KDxg0QgWBCk8fEpGaDI/URwCtRwAxjORivpH6LDKgMlLvnUxx0qMru93NGzENb/q6j4/
	v2sQVk1FCXKP/MdidUJeyS+48e+UwHL3aUe1fsrMSPhvyV/BhNJo7m8GxJMAABnNIRWX
	M0qXiWfzCGP5F3xT2tA0ctkYIlPlf1EAXQw19yPge5LZTHRktbZFmQNVMcn7saEVgHnE
	n5ig==
X-Gm-Message-State: APjAAAWyhI83y0K3ZWKQfRgZeFthR8J0rokhf/qXUwuSk1caCU00FO8k
	9xeUJ9fO83urfYQMHw+H/sVkCyr83wyWtCUoMlNzZ9iSmd4=
X-Google-Smtp-Source: APXvYqwRaNJXTDBSOd8q9R1QHOUidgUFgg0xbNhmpw9mycgj/mf0WgyZHlIZdt6Zi97oH8PCQ9u23rBjazhODZrzaVA=
X-Received: by 2002:aed:3c52:: with SMTP id u18mr1353500qte.194.1568683495623; 
	Mon, 16 Sep 2019 18:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190915234257.13921-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190915234257.13921-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Sep 2019 18:24:44 -0700
Message-ID: <CAMKF1srSjmvfeGaQOaymggw5S_qtBGHiOTHCLfpJhfi3Z47rcA@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] flatbuffers: update to 1.11.0
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
X-List-Received-Date: Tue, 17 Sep 2019 01:24:55 -0000
Content-Type: text/plain; charset="UTF-8"

Fails on musl

https://errors.yoctoproject.org/Errors/Details/270781/

something like below might help
https://github.com/buildroot/buildroot/blob/master/package/flatbuffers/0001-Add-detection-of-strtoull_l-function.patch

On Sun, Sep 15, 2019 at 4:43 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../{flatbuffers_1.10.0.bb => flatbuffers_1.11.0.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-devtools/flatbuffers/{flatbuffers_1.10.0.bb => flatbuffers_1.11.0.bb} (94%)
>
> diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
> similarity index 94%
> rename from meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb
> rename to meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
> index 452e1e65a..4a76b9273 100644
> --- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb
> +++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
> @@ -10,7 +10,7 @@ RDEPENDS_${PN}-dev += "${PN}-compiler"
>
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a873c5645c184d51e0f9b34e1d7cf559"
>
> -SRCREV = "c0698cc33f1e534bb59c455909b88cc2726089af"
> +SRCREV = "9e7e8cbe9f675123dd41b7c62868acad39188cae"
>
>  SRC_URI = "git://github.com/google/flatbuffers.git"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

