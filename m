Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3659A611C6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 01:17:11 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id a141so1180139qkg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 17:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0pOu5vW9QB4WQZMmP3vNkhP8oT2FS358mIvJ6419MZQ=;
	b=ViH1w0jEjhzj0u4/KbfTQT7Bk/9Q9QNtRiHZbRaCJqvRGSNubXpSDisQrChnT6qgsO
	MPvCtdKpgomlAAjLg+6ZlAymY1HmbmrY/th56jMvI1mUhqsbWxTuNQBuWrsUKLnj9UNZ
	bKEBbDuaLXxoWvm1/hfPnYvZefrSIwCHuUSypHNluvKmBcV+jkyrWD1IPfItmZQXjAkJ
	LCHR3gptIals0Sk/gxw0pQQ6b3SGqZeEnFjKRp5Nm01DWBprmU/qUecR1MdwrW86spdZ
	mitdz3D9h+SsZCbHEfvugCc13/KicnHVJNL4zR0AuzaOCL5RV4qDRUODxtLY6kS05X8r
	rSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0pOu5vW9QB4WQZMmP3vNkhP8oT2FS358mIvJ6419MZQ=;
	b=YtcxBa1NYx/4pMosebBrgcmKLOMYUbQhuo0iFB+JoqZ3bofy4ldsPcaY6DGlv3XXCY
	xGRyHjfBR8/CrcxEQWSf3mShmDIM7hzl3PYMLQGDl15XK+WWs+Eu0TNaAtBlfLsek8UA
	RbaAzSCzeZcf+mFp216jiBJQ473LYmuaVyyX8ZdDa+h5YY7bmbz2spCLfQEiXz//UDxf
	N0qaUuDPrVFWfh5p8ps77aBdocm3h9hGlQQiuW2sCLezf6+jPpNHhxtrB9XgGbQxWXK/
	4vVq4sDNpqtUcKOHdq0ZEGGUnPkeekeiDWnIvwei6E9QngL4eDQZ08SA6IDZVe9fEHFJ
	trHQ==
X-Gm-Message-State: APjAAAUeH6/9rb7NXtxSHIgZTfqX9vXA/21MZGM4XhNLsIB/Cnzan7Zt
	EHUIbthsC7S6r2njJhw1rMIqXMdoQZxD3hQr76HAdjmc
X-Google-Smtp-Source: APXvYqzX9N91ckp22+3G3opXGU6xiY7MFNaiFBF5U9mBFLcbiukmFpiIAkXUipu0aqBSJI6668PjNJCTc61M4zJ8qtE=
X-Received: by 2002:a37:de05:: with SMTP id h5mr5332931qkj.474.1581729431825; 
	Fri, 14 Feb 2020 17:17:11 -0800 (PST)
MIME-Version: 1.0
References: <20200215005020.31970-1-jpuhlman@mvista.com>
In-Reply-To: <20200215005020.31970-1-jpuhlman@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Feb 2020 17:16:44 -0800
Message-ID: <CAMKF1sog6ogAhHactnGNz-QePRNmnpCBfusS2rW7FZYn3J2zXQ@mail.gmail.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-pytest: Fix typo in SUMMARY
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
X-List-Received-Date: Sat, 15 Feb 2020 01:17:11 -0000
Content-Type: text/plain; charset="UTF-8"

Can you rebase on top of master-next and resend, please

On Fri, Feb 14, 2020 at 4:50 PM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>
> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> ---
>  meta-python/recipes-devtools/python/python-pytest.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
> index 752d67e36..00f2d6021 100644
> --- a/meta-python/recipes-devtools/python/python-pytest.inc
> +++ b/meta-python/recipes-devtools/python/python-pytest.inc
> @@ -1,4 +1,4 @@
> -SUMMARY = "Simple powerful teting with python"
> +SUMMARY = "Simple powerful testing with python"
>  HOMEPAGE = "http://pytest.org"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=640061b8cee64b308a4d2f9f556c12f2"
> --
> 2.13.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

