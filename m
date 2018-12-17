Return-Path: <andrea.adami@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id DF4557A030
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2018 21:18:25 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id i12so6981744pfo.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2018 13:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5EawvPwKhS+Ess8bSoU8GGL9+151Wbk54ukDDhoCRZ4=;
	b=k8BvFx0zziV259MwcKoKnyV246QD00SkGJDPKy4C4gXdwg/WHIAqzi1Vyp/UnNtqp6
	iHYu+bvijlDglqiMyAlhiEu9xUL0VpS/k2MH9cSnnkVxfLeQHu9VguF9ABeRYhSxe6M2
	DOlaSRgBgmP+P7XIU/WnjCmUsgSZKfwJ2bQCJqlkVtxK9uegLjc6NEg2sLCn8SU7/mUA
	KGsqqA2XOfBl6VI5odAImRYltTtCK1nCqqABLN95r4Uku2M6lKc60qqYnBNPB/6ywCFg
	8jVU008hN2t/M3MpPt7tTr14y0EOWCwHfCFlapdNtm4PUu0U7ceeOOV9KREhgCY3jQ+F
	GdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5EawvPwKhS+Ess8bSoU8GGL9+151Wbk54ukDDhoCRZ4=;
	b=d3Hlr+mOfQbRiq+Rni/i5gP7lwWkjO98s6IM48/XZ6qc9Dy0Xzo8lY3leB25pY0HUI
	peDAdkqapL1afo5XMAmWjxEo9OxLQitYOdsEo33V1/LK1dPtW9iU/SDIKFIXHsGs2uiR
	V1pbRHh1m/UPdM9qO5bjjG1WaAL9+ICchvk6PFonj5sftxuZB597CcD80h82bzj0xXaZ
	U/cT1DgvrEKXpipD90ijZ3zDk7B3V+hz/wKrs+AuMcU+Yp68GO9lfeuD9EuR9houkitz
	02CKiV8gPAtHejAMXOKspbflK8p48D8jNnPnY6klsv4A5cUdK4JLUigLVSkWNOOFRY4R
	VxXg==
X-Gm-Message-State: AA+aEWZ/OaFiREb3kLPmU24wPmrEfL8W8Xcb+9IC4Hj6Ax2UcTDCMsMQ
	AE17rBVkQCY7MnW2wcGbZ1riKPobOIT/Wiga3kA=
X-Google-Smtp-Source: AFSGD/URrqtSt/NjwP7BXNSWekZULyn04f/pK9OJLVMxPKLjdZq2hzf0HTCfSDZS/Vvoa5ISSLqkp77OfcUJm31aXeo=
X-Received: by 2002:a62:5950:: with SMTP id n77mr14062281pfb.128.1545081506712;
	Mon, 17 Dec 2018 13:18:26 -0800 (PST)
MIME-Version: 1.0
References: <20181217181528.14898-1-andrea.adami@gmail.com>
	<CAMKF1srZJvQsjikQ4Euymhh4zcjHHQMtDn+W83HMZS1eYFn5Ag@mail.gmail.com>
In-Reply-To: <CAMKF1srZJvQsjikQ4Euymhh4zcjHHQMtDn+W83HMZS1eYFn5Ag@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Mon, 17 Dec 2018 22:18:15 +0100
Message-ID: <CAAQYJAsRBfuHMQNFVjZkth4q-U8B1y6KPYF1VEhFPLxa_55t+g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH] kexec-tools-klibc: fix build for mipsel
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
X-List-Received-Date: Mon, 17 Dec 2018 21:18:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 17, 2018 at 8:23 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Dec 17, 2018 at 10:15 AM Andrea Adami <andrea.adami@gmail.com> wrote:
> >
> > Fix:
> > printf.c:2:10: fatal error: limits.h: No such file or directory
> > |  #include <limits.h>
> >
> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > ---
> >  meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
> > index e7553244d..872d79b93 100644
> > --- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
> > +++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
> > @@ -66,6 +66,7 @@ CFLAGS_x86-64_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/i
> >  CFLAGS_arm_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
> >  CFLAGS_aarch64_append = "${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
> >  CFLAGS_mips_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
> > +CFLAGS_mipsel_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
> >  CFLAGS_mips64_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
>
> I wonder if we just use use "mipsarch" override here once for all
> mips kinds.
>
> >  CFLAGS_powerpc_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
> >
I am also wondering how to do that in another way.
Maybe a patch to adjust the included headers?

Cheers
Andrea

> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

