Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 55E737F3A6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2019 03:40:32 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id m24so133204928ioo.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2019 20:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CsCdpShkh1shDhX+1qLn7E+DhK9VZZ6EQc+XRGLNwW4=;
	b=pXL6P4KTPBl0beQVYqloYExarbVyhCxCrubjroixRg7F5WHeC914okWS9LCJeladyW
	NpmZ7QYYQZ536hr7sXBmX7yWFdZ3eABRaUdkIpEL3KyuP5I5dT8ne8yhleoRrl7IzAfY
	sHt7SbXPrcc+Z8ADF+EvETTE/bk9rqrhYZ7WQh7qbwn2tVihspcvqFvUpW9PXN5y94EB
	0Fc2ML/qvwTXWiXFZcZBhufWmju3F2GXGwlnqqGczCTk97EGWdjLFcyD/N45DeYgSEtP
	Rtg7i5sGMhYvgGsBOCbjPTSQxqFFAYdl69bsWBpoBX/J88wwGrORKuvBLB9ggyYjPtYM
	zYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CsCdpShkh1shDhX+1qLn7E+DhK9VZZ6EQc+XRGLNwW4=;
	b=DEJNB98fmWwYct0e41cgT4Sw6eKMJOBUaW2uLj7x+x4qkbpewlDaDXEXR3SO2dmtar
	SI/Wvw8HTU/d9wUrJ/5GB56NxmWYxCvSW3ySnB2/tI2F58aFucLhM8cwxKDYFJBrkUdg
	tNqwk3fVX7X1YUgGBt0+bptRoH7lgzCdgV40QnURKdvL1xx1pDnQzA+u9twedbgv7rXn
	BZCbLT/X0XLXxEczY+T1Hyz4uGU/SuBrS/1HmX+xm90LY/WAYqTNyXsXvJczrVP1HxEb
	vkALlPFy3xCYb8ZUqeniX4Nl+op5j4U7CPJZpobxJrXEjQxKpI8AAyv+EU+fU4OvVcPc
	q5Lg==
X-Gm-Message-State: APjAAAWtuIsvbJGOOfJ0OpCXt2Ru4RVIzpjflxRorL7+b88SguCZeteY
	OhQ85Fs3b0BJBywCicw2cfoIsiNe6oJuaCBAr5E=
X-Google-Smtp-Source: APXvYqzLzV9FNloIbynLUmyDJjsLzxPraVSwLAp5fXBJ2CJZ3r83vC91H0I/X0Yw9Cxs29lfVCyeDTQCAVJagW5XmQs=
X-Received: by 2002:a02:bca:: with SMTP id 193mr83887993jad.46.1564544433138; 
	Tue, 30 Jul 2019 20:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190730185545.20310-1-Martin.Jansa@gmail.com>
In-Reply-To: <20190730185545.20310-1-Martin.Jansa@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 30 Jul 2019 20:40:22 -0700
Message-ID: <CANx9H-AjC3VrqsDj3m1KAOOChaHhYFVDvd7K_6QudYujXfP5+Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libdbi-perl: prevent native libdbi-perl depending on target perl
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
X-List-Received-Date: Wed, 31 Jul 2019 03:40:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for clobbering this change previously. I hadn=E2=80=99t seen the comm=
it
message about the error and I meant to send an email to open up discussion
once I saw it (randomly)...we discussed it in the bug triage meeting and a
weekly engineering sync meeting.

I do wonder why this is needed (which is why I naively dropped it), or
better said why other Perl modules are not affected. This feels like a fix
for an underlying problem. I would expect ALL libfoo-perl recipes to have
the same behavior. Bitbake is supposed to be smart enough to handle
RDEPENDS properly for native recipes.

Have you only seen it on this package because of usage, or is it special in
some way? Did it affect releases before the perl-cross change when we moved
to perl 5.28.0? Trying to sleuth out the underlying cause...otherwise we
need a sweeping change for all other native perl module recipes...

On Tue, Jul 30, 2019 at 11:56 AM Martin Jansa <martin.jansa@gmail.com>
wrote:

> From: Martin Jansa <martin.jansa@gmail.com>
>
> * detected with:
>   openembedded-core/scripts/sstate-diff-machines.sh --tmpdir=3Dtmp-glibc
> --machines=3D"qemux86 qemux86copy qemuarm" --targets=3D"libdbi-perl-nativ=
e"
> --analyze
>   ...
>   ERROR: libdbi-perl-native different signature for task
> do_populate_sysroot.sigdata between qemux86 and qemuarm
>   Hash for dependent task perl-sanity/perl_5.28.2.bb.do_populate_sysroot
> changed from
> 00c0f30e40a144255fc3054e9a71ce73170a89832318774bd2a8fc5e8dcd20ad to
> e22ff8375c4ee6bda646dae8a1d6b1ddeb6d373678fc036fdc406e91a026b497
>
> * it was already merged in:
>
> http://git.openembedded.org/meta-openembedded/commit/?id=3Dd98e62e64219b3=
65063fdb299d35f2af999d8f6e
>   and then silently reverted in:
>
> http://git.openembedded.org/meta-openembedded/commit/?id=3D784285981b1ce9=
825575981f2b60e2b286251283
>   see:
>
> http://lists.openembedded.org/pipermail/openembedded-devel/2019-July/2006=
76.html
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
> b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
> index 77991bd158..91f94a1aa0 100644
> --- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
> +++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
> @@ -27,7 +27,7 @@ do_install_prepend() {
>         rm -rf ${B}/t/z*.t
>  }
>
> -RDEPENDS_${PN} =3D " \
> +RDEPENDS_${PN}_class-target =3D " \
>      perl-module-carp \
>      perl-module-exporter \
>      perl-module-exporter-heavy \
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

