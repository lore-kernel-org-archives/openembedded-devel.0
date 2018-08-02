Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8213378D6D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Aug 2018 08:34:50 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id 191-v6so958798qki.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Aug 2018 01:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mV6fx0eMy/gUrKG+4oBD5cbFSPjV6GdS5tsPHRV0t/A=;
	b=Et5Ppj+ha1BtCiE8i3Yr6RD5FYo9QmIt3L2l7PpoWOpZvM+wcjqUni3kDzoq+nTvd+
	L4fY3o/bxp1suWFRrXZ/FqvD9vkswZwT0cwJVYTlav9J3gHC9nz4Nv+zcPLGy2saY9mw
	TT5WbHcvTyNeSpnuUfu2zFe38SbhxbJdy+I/gAwr8rasPSMG0G060/f3YOkgglKQnkKj
	myUXHXLcT9+E4lsfwHWRN+CirJFBKGgQyc9ju84Yr/kPY7bUbBSVihmVMSVfkigj7WqG
	9hXWta/aw5P3OOsJs6NQn14dnx6Oahl1mVgSJtagYWZ7ulSFaCEu1oK1kBPR4x0q+i8A
	05Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mV6fx0eMy/gUrKG+4oBD5cbFSPjV6GdS5tsPHRV0t/A=;
	b=tch/mSZakKRoln5CjvpLxtD53yLiM+40oxBZe7PY+eXHHvcu3VMuyV8e2+eSwg6Vo5
	VrPt4TsM18pgYw0TbmHcQwHX3YLzTh1SUKfcp204rKbgKoThficGrRamPxdgDRuWMXOu
	Z27Zboe8mN8I8662R0ON5BzQ6AgMwZXgXS4FswxenVWG/3OqcnU/uPnvtTVkgMueP0T2
	/f2wKE9RDFNoP6p88DS93Bz71XE8i9wgp/99YgHajHU61X5UdJa0xg8ADcQt9gv9/dRZ
	V0k02f1H7BQDdWCrYX7or0ch75TWHaoGsSTpmlnp7jIQxQKBz3ZlyPR/XycLlpHEZoJb
	1amw==
X-Gm-Message-State: AOUpUlE+xVNXWCqD/+r7X3MBIeN1moMxWckSom3AOSHhm0bt5PEUN4SY
	3BGFllV47IgxkNIISR7YcSTmU/hoftXV5UeWJFu5fTbN
X-Google-Smtp-Source: AAOMgpfPXOPJXqOd8q0Z0Zt+9LIIU6B5U+btCh+MFYp2scVQAyMHTdrfnSOg+Vi/34X0VM/6nDtr1CpXf+GKHiNXAI4=
X-Received: by 2002:a37:8f41:: with SMTP id
	r62-v6mr1564397qkd.412.1533198891045; 
	Thu, 02 Aug 2018 01:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <1533092773-22300-1-git-send-email-ricardo@foundries.io>
In-Reply-To: <1533092773-22300-1-git-send-email-ricardo@foundries.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Aug 2018 01:34:24 -0700
Message-ID: <CAMKF1sqAMyN2QErgLn1VZ4hxXjm-fGdRTnZ5ZeBEs5mXOqEL+g@mail.gmail.com>
To: ricardo@foundries.io
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mozjs: set -fno-schedule-insns2 on both CFLAGS and CXXFLAGS
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
X-List-Received-Date: Thu, 02 Aug 2018 08:34:50 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Ricardo


On Tue, Jul 31, 2018 at 8:06 PM Ricardo Salveti <ricardo@foundries.io> wrote:
>
> Mozjs fails to start on several architectures due broken build
> optimizations when building with GCC >= 6.
>
> Set -fno-schedule-insns2 as workaround (flag also used by Firefox and
> Debian).
>
> Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
> ---
>  meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
> index da80b63..adc27ac 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
> +++ b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
> @@ -30,6 +30,11 @@ CONFLICT_DISTRO_FEATURES_mipsarchn32 = "ld-is-gold"
>
>  DEPENDS += "nspr zlib"
>
> +# Avoid broken JIT on several architectures (from Firefox and Debian)
> +# https://bugzilla.mozilla.org/show_bug.cgi?id=1245783
> +CFLAGS += "-fno-schedule-insns2"
> +CXXFLAGS += "-fno-schedule-insns2"
> +

Could you test with -fno-tree-vrp -fno-strict-aliasing
-fno-delete-null-pointer-checks instead of -fno-schedule-insns2

>  # nspr's package-config is ignored so set libs manually
>  EXTRA_OECONF = " \
>      --target=${TARGET_SYS} \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

