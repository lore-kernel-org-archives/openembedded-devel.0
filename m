Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id D3D0F7821B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 15:26:49 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 63so608108pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 08:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XiR2ljBob/081RODoCqBB+j5pEfc9cckvoNyvlvNLDQ=;
	b=PYdVb7/Ov/7PJnB+UoTVFz9STuNCJXgI4X+M0Jd3X3yrZ1MTrLey6jG8EvexEv4LKT
	S4NS7tpl7sFwVdNikD/8A3dbkDTGepK/cS9B/aPL4qd2sXIJz0xaHDgkImJrqQ9roz2m
	pOto8vTOev4bn4vz+MG/SZeqIqGb4kV6sLEpGXEa3fbb8uU7qswL/e09d7QwiBb/fFUa
	6akDIfc1TdXgjfNZFXBj3xzxLnEjRJowZ2+OimGhkLH3L8MNO4Ch029dxZTaQQ/1i/V8
	2S85FJOMbpA1IR7Y8s+BNhuJuUhCNG1kamOtmpDf4icqPNrluMqdlDVRLYru/T+pfhgh
	3+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XiR2ljBob/081RODoCqBB+j5pEfc9cckvoNyvlvNLDQ=;
	b=uC7ufnUUbJ7rzfvgfNIOVyPuQspc0ptHKVsDRApDf2AHQsmb2DMo64E99EYY9tmaGZ
	+Lo579vWVt433gUB1mz95oqFCjdi43i5cLjtA9jL883ui5Clx4gUqDyu2DPlh+hwJU6h
	/HNxc2lktwpgnMdmGmVEPCpl34ydRUy7zI1aTn7i7tX0MbHYX74HDGZrgcWsQuzjbzJc
	okMFqEoMQCsREFhHxMBroC2z/nET7VQaAvBamLcYy+Zc+J2sHVC7gfW5SbFuWWvyGf97
	yfc3nZWEi5CK9tXCCgBZyiXdnZTNilK+6wAHnnthETSRJP+aG+MdUByhA9JCMDy+dVCq
	fKUg==
X-Gm-Message-State: AHYfb5gdUF8/iRO7pI+l1RN3vrlWOub1nNhLqOAxEd884GyrlQNYsukX
	42/Wqy1sizP99/HqVvK6V7Jzk7FmOdQV
X-Received: by 10.99.179.14 with SMTP id i14mr885397pgf.317.1503934010713;
	Mon, 28 Aug 2017 08:26:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Mon, 28 Aug 2017 08:26:20 -0700 (PDT)
In-Reply-To: <20170828060531.13717-1-jackie.huang@windriver.com>
References: <20170828060531.13717-1-jackie.huang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Aug 2017 08:26:20 -0700
Message-ID: <CAMKF1sq9CpL3V9SU9C5GSLCdQ+TZLObFJO=0djB2+8Mn9ZeS=Q@mail.gmail.com>
To: jhuang0 <jackie.huang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] enscript: set the correct path for perl
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
X-List-Received-Date: Mon, 28 Aug 2017 15:26:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 27, 2017 at 11:05 PM,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> Set the correct path for perl and avoid
> searching the one in hosttools that cause
> QA issue:
>
> | ERROR: enscript-1.6.6-r0 do_package_qa: QA Issue: /usr/bin/diffpp
>   contained in package enscript requires
>   /builddir/tmp/hosttools/perl, but no providers found in RDEPENDS_enscript? [file-rdeps]
>

already fixed with https://patchwork.openembedded.org/patch/143281/

> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-oe/recipes-extended/enscript/enscript_1.6.6.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
> index 96129880a..65f1ccfa0 100644
> --- a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
> +++ b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
> @@ -19,4 +19,6 @@ inherit autotools gettext
>  SRC_URI[md5sum] = "3acc242b829adacabcaf28533f049afd"
>  SRC_URI[sha256sum] = "6d56bada6934d055b34b6c90399aa85975e66457ac5bf513427ae7fc77f5c0bb"
>
> +CACHED_CONFIGUREVARS += "ac_cv_path_PERL=${bindir}/perl"
> +
>  RDEPENDS_${PN} = "perl"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

