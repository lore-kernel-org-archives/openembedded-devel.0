Return-Path: <andrea.adami@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 08A4F7BF9E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2018 21:29:03 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id b85so7003054pfc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2018 13:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AYvij8YcrMh3hZAORbRakJI8jBCipw7KVhTWH9YmOuI=;
	b=CvJZa86u+qIKjkE+5YtQgM9lyhng4nVomyQmsYunsVuACKbcp7+15B6H8ggV9FqEMp
	zeqdf+hos4Npu0e4FC+9R5s4acy2hEwlL4j5B8mUOCLIxr80JC9rPHb63aZc+s3SHe2L
	uaoW63RV1dsV1JhDFjUhKwlibLYx1oOuNu7/y8zecGgAuL6tpPeH+vjjd5mG9s+TLAlU
	jGKadgcq77imtEp9dAnY40W881fP5xhRujtyhNuFgdO+Y18Gj8J8hFN8QR+yZ6A7URGe
	McTSj3WaHb2+/VgmS11e2NN1EWW8S5KKXwgxLEHwK3rmj8MWPdTMixcXLIDpgau433gF
	98DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AYvij8YcrMh3hZAORbRakJI8jBCipw7KVhTWH9YmOuI=;
	b=pId/GEJkI3cy74qwX5QoeuwBkUDzK+PRpHaEyBFE+bt2y3ZxxtJ9zK0VRe9m3tz+8R
	+lS8D3Laswm4dluffyqeyLUhazM7tK4A1IbQn9CyjDajkDepLRHDVDNxKHXTCu/MIU7G
	fp4m/bVQtblle6mpuV/cWachNgCWJGwza+Rj2QpIXKy9eNGuCazhSMYCfriSDgxfQKU0
	s1K/eeHwbU7r7byHRUwuTQHS3bBweL8kYrPoc7VGu/hk0w3CjcaPUZ4UUd3DyQ7VIiGQ
	iMBGEOM7z6HLcy6+sM8M3yWfKfAdsANEJuVwqVhQffclX0u1fM1uhhMo5+UTXukCNlUh
	mhbA==
X-Gm-Message-State: AA+aEWZ86dhQYX9uqBisdhHuE9vrJsv7Ht17psMeIfmXq4R1Tq5yNFa7
	WiN5JqJgvjl6XrLQugdOejxRs78PkuasD2/d7ZM=
X-Google-Smtp-Source: AFSGD/UBHq00oXhoyn8a0/VOiW96ZpB6UBpf/lQ8vGFR75rPbu4+Bc5JdLvVwY600yF9O9Mu+97ytBPNkv29AJLhHTw=
X-Received: by 2002:a63:5f88:: with SMTP id
	t130mr13662074pgb.395.1545082145139; 
	Mon, 17 Dec 2018 13:29:05 -0800 (PST)
MIME-Version: 1.0
References: <20181217181528.14898-1-andrea.adami@gmail.com>
	<CAMKF1srZJvQsjikQ4Euymhh4zcjHHQMtDn+W83HMZS1eYFn5Ag@mail.gmail.com>
	<CAAQYJAsRBfuHMQNFVjZkth4q-U8B1y6KPYF1VEhFPLxa_55t+g@mail.gmail.com>
In-Reply-To: <CAAQYJAsRBfuHMQNFVjZkth4q-U8B1y6KPYF1VEhFPLxa_55t+g@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Mon, 17 Dec 2018 22:28:53 +0100
Message-ID: <CAAQYJAvKL2MozzPtLk8xqsLMMHigPyU-=HdgN4xSVd_QCBph2w@mail.gmail.com>
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
X-List-Received-Date: Mon, 17 Dec 2018 21:29:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 17, 2018 at 10:18 PM Andrea Adami <andrea.adami@gmail.com> wrote:
>
> On Mon, Dec 17, 2018 at 8:23 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Mon, Dec 17, 2018 at 10:15 AM Andrea Adami <andrea.adami@gmail.com> wrote:
> > >
> > > Fix:
> > > printf.c:2:10: fatal error: limits.h: No such file or directory
> > > |  #include <limits.h>
> > >
> > > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > > ---
> > >  meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
> > > index e7553244d..872d79b93 100644
> > > --- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
> > > +++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
> > > @@ -66,6 +66,7 @@ CFLAGS_x86-64_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/i
> > >  CFLAGS_arm_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
> > >  CFLAGS_aarch64_append = "${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
> > >  CFLAGS_mips_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
> > > +CFLAGS_mipsel_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
> > >  CFLAGS_mips64_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
> >
> > I wonder if we just use use "mipsarch" override here once for all
> > mips kinds.

Note that there are different bitsizes...
Please merge this, we'll think how to refactor this later.
Cheers

Andrea
P.S. Unfortunately my poor 3.13.5 bcm-tainted drivers do not survive to kexec.
Will retry with a recent bmips for bcm7425


> >
> > >  CFLAGS_powerpc_append = " ${COMMON_CFLAGS} -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
> > >
> I am also wondering how to do that in another way.
> Maybe a patch to adjust the included headers?
>
> Cheers
> Andrea
>
> > > --
> > > 2.17.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

