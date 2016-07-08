Return-Path: <ticotimo@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2FFC260119
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jul 2016 17:06:23 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id a10so6589571lfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2016 10:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=OWbXYAsV2GuAxs+YSm4UU840u9doVFoZqp7guc7lmho=;
	b=vO70QRrhfFG/zLFYPymI/Hg0Ha2QZWiUrwb0yQ4dT+L+HcBYQpHI1Zc6xCWqvtebD4
	vDQWmOrmKrHgcrdGdIv/HEJEKZ310cxuL0TPp0rK2H7UgU94Y3hoiE/ZySVKxwoYInlB
	7mekwGdzslmcsnvpJLZCcOlGcTiLiJOodE1TbhsDWYMnjipH/058LJIhOqM4AHWo0RAA
	VWrRHx3FLO+8nNnPb4z4RRgLRBwyPU+kYbVWV8r4IBPQtEsziHz0im+9eOZHZtYARDTt
	88IGmz9Sp8t17mA5j7BhGaIkBwVGSYVJnit/nykrxGxmFVbN4SJ4NkLj/mmZhLPUe8S7
	apuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=OWbXYAsV2GuAxs+YSm4UU840u9doVFoZqp7guc7lmho=;
	b=lEDWGPe5W1ePCLMvSPJl+Z+u63WXvTS80kCly3ZjCma3BXmIHapUccM1V+vfWYtpu8
	4Q18HijeKafYvvEXeyGDU1XShpxHSUJfm7EoD2b8cpDLOKTvWe9rAIo3VPbjR0r0fUp8
	3At4buoUef6KipQ/hddVo+/AKKSQHMJT7eV6+urDg4kdwacu+RHrfYvdGlQAP9TnNSVt
	Fz81zm9NXNu/kW9OuM8rEFldA1/8pWii6/8rrGH+eR5kaXDwemefCbn5iHMHE6mT+fDY
	W6xxlBqxfnkxoEZoRRAmJD5B+IlY7iVhioCpSi0KByCYVMa73ZgrOrtBUn37fvJLWrCm
	djjQ==
X-Gm-Message-State: ALyK8tIR/wEby05DptyEHFXYQXecfW6OgSLGgZlprBTWEibn4td4l6WTvqhg+ICc7zzEMvF4zYOm1PtpchAh4w==
X-Received: by 10.25.153.148 with SMTP id b142mr1964284lfe.61.1467997583446;
	Fri, 08 Jul 2016 10:06:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.10.10 with HTTP; Fri, 8 Jul 2016 10:06:22 -0700 (PDT)
In-Reply-To: <1467619576-13899-4-git-send-email-mingli.yu@windriver.com>
References: <1467619576-13899-1-git-send-email-mingli.yu@windriver.com>
	<1467619576-13899-4-git-send-email-mingli.yu@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 8 Jul 2016 10:06:22 -0700
Message-ID: <CANx9H-A60g=TQCg3hWm4JDNCcOvd8HRL6vg5XyEi8-pou1AHbA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH v2 3/5] python-mccabe: Add python-pytest-runner dependency
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
X-List-Received-Date: Fri, 08 Jul 2016 17:06:24 -0000
Content-Type: text/plain; charset=UTF-8

Built ok for beaglebone.

Acked-by: Tim Orling (Intel OpenSource Technology Center) <
ticotimo@gmail.com>

On Mon, Jul 4, 2016 at 1:06 AM, <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> * Add python-pytest-runner dependency for python-mccabe
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
> b/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
> index 0958f75..ba966eb 100644
> --- a/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
> +++ b/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
> @@ -8,6 +8,9 @@ SRC_URI[sha256sum] =
> "9a2b12ebd876e77c72e41ebf401cc2e7c5b566649d50105ca498226886
>
>  inherit pypi setuptools
>
> +DEPENDS += " \
> +    python-pytest-runner"
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

