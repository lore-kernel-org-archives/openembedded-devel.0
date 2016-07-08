Return-Path: <ticotimo@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id DEFA560119
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jul 2016 17:05:32 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id l188so8290722lfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2016 10:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=rC0C4uIuNjmC68cvTbn+mfZECEDv0y4mjF/b5HDAEYc=;
	b=qLF7OvuvoL82TSmo4yHnJ3YSYLtZzsYvpLEZhXDx0ayWqakrJcijNpabhQ/hHNjxxH
	QMavELWXciGkFFxTTzGoo3i7500zdo3q3AVHO0UHpm8pB1FoN+PbBf9xQpslFoONzFaa
	bgtMtlToVIU+twvE9wKb2LT/W7qoHnI2+zZ1n4HmOV7Re8J6YeL1tuQTX+c7VvjW+q7e
	HzAQisdB0mk8pgaKPHayBsqAjsWdMN+1PSFrneMqmTkj9OkxWQcmQLVbMQHJuCeL9EXW
	HT+mOoF69nDznJnVkMZzxE2H5uUx4IWt1k2YOnUpOaK4Gj9lr/9ZHhOSJs67t4v4g0JP
	3anw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=rC0C4uIuNjmC68cvTbn+mfZECEDv0y4mjF/b5HDAEYc=;
	b=mnn/IZyxQEYxgcEi/SzXgtpujKgoo8tbhCNYDBr2vFIkOOyaE3UEGmFjrfj4Go2AAM
	5ZxPsu5AnxDCwdHKaPoHtfqHYHO80RydaaGZuKc1CWIErQo/etxmrYEkPnLj+6d4JdCs
	UPKikFBWclXjn1C8oKqO718YQ1FU4S0YXmXRMzhJQJP4u4jKh6c1WhGxDSPRR9aCktvU
	VHukOXorHth2fvpmehv+RD05d8Z3o/QUV9o92a299JtrbZEDhC+yMkwR6cKQYJ8rJqks
	R6sAl3sJGOoVU7dNWGS2bjzQfCqxKsTI2It+L4/ggj3Sc/I2ryhhbMUoMCiKeWupGp36
	pnvw==
X-Gm-Message-State: ALyK8tI0T7qncVKEPuUOHaXajtz+wpdhtBHJ/kSsa34WRBckaskLhCVaW3dTGDEzvMMvxFMGSg4Gsbk8jJRatQ==
X-Received: by 10.46.1.148 with SMTP id f20mr1811837lji.52.1467997532802; Fri,
	08 Jul 2016 10:05:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.10.10 with HTTP; Fri, 8 Jul 2016 10:05:32 -0700 (PDT)
In-Reply-To: <1467619576-13899-3-git-send-email-mingli.yu@windriver.com>
References: <1467619576-13899-1-git-send-email-mingli.yu@windriver.com>
	<1467619576-13899-3-git-send-email-mingli.yu@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 8 Jul 2016 10:05:32 -0700
Message-ID: <CANx9H-A6bB0mNKV7MRRut-2mRcoO_RdLZ_vgn5tgES33+y4OVg@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH v2 2/5] python-mock: Add python-pbr-native dependency
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
X-List-Received-Date: Fri, 08 Jul 2016 17:05:33 -0000
Content-Type: text/plain; charset=UTF-8

Built ok for beaglebone.

Acked-by: Tim Orling (Intel OpenSource Technology Center) <
ticotimo@gmail.com>

On Mon, Jul 4, 2016 at 1:06 AM, <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> * Add python-pbr-native dependency for python-mock
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta-python/recipes-devtools/python/python-mock_2.0.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python-mock_2.0.0.bb
> b/meta-python/recipes-devtools/python/python-mock_2.0.0.bb
> index eb473d2..849c99e 100644
> --- a/meta-python/recipes-devtools/python/python-mock_2.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python-mock_2.0.0.bb
> @@ -8,6 +8,9 @@ PYPI_PACKAGE_HASH =
> "0c53014354fc93c591ccc4abff12c473ad565a2eb24dcd82490fae33dbf
>
>  inherit pypi setuptools
>
> +DEPENDS += " \
> +    python-pbr-native"
> +
>  RDEPENDS_${PN} += " \
>      python-prettytable \
>      python-cmd2 \
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

