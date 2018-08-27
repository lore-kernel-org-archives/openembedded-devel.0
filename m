Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6BEB378E00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 22:29:28 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id x7-v6so768377qtk.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 15:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HyJ4oPDl5rPZk3OmfPQ7HjlTjTZP6M2USF7lKEGAdP4=;
	b=p2WWkBaaFniSp8Gu3YhNd3boSvNPG0wY30yFJ4XTaK68zi0GzXd/kUV8+kPPX6Sydo
	oguHgVjxUP2538JIw+1DrGwD6rwlOQ7T9wdqwZUng77zKc8QRUJpO07HP2zVOYv/l4h3
	BSMRkBe8dSSrMnJZ8EYY6M8Pl5u8xIV5q8W8MPIKq+X3y6lRlu2lQfaQZSfV+n0lCh+W
	4jzv1A16Xjz31FzU6DCAtFgZh/LqDKAny6s6E04HpBueGwV4F0K/pFGRcW4BE/gNdGeg
	2HbUJBfqF2/Jw7JR6CT1Xc7mkVwOYzAVuZXPcZPEFzSlHMG6KjI25plyNlZ1Td+r79Tn
	ZHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HyJ4oPDl5rPZk3OmfPQ7HjlTjTZP6M2USF7lKEGAdP4=;
	b=FkEPmtqh0U6nd65MbG/UOcMbFeBVKfrNqVaBymRgCB9cvQnj4MPU58RSGvH32/lzsk
	fQwaG3Qe2GCBMGhCnm45fnUoG6xGtr566+wecL1m1lEloyoW7lbWW8qiCm/Q31m6oY8s
	sERXuTWdHcXvEi+R2cJeL528i46MWxMSNuTg5Bn8ESfQ60oW0oo8a/vnRepSlAP8pHW1
	Ghel3bEwgw+mZAUENuvY6U6O82lf3P+mp6CVot52tXtLtMBkZXLvEVrkeql6iCCg46TB
	RFoHAvmPZwVEdFvDL+xwzunw01vRx2Qk709Zy1Tri4VPT7pssK/3JuKX8s6FBnY/xGeC
	eHag==
X-Gm-Message-State: APzg51BNV728k4EabMWgiD22AODGFOpjWfx4qEq0HTVzVgfjuqZdZtJo
	MPbci16DGkNRDedjhizcnpDCctuFV3TfhdOgG+0=
X-Google-Smtp-Source: ANB0VdZzVVkiTaaaGzOvLBfA93Ex0EdNm3ml5L27Mbc8j5H/27cKUMDvhRDt/myAMiCaMAJxPbToeBs4MsHQkMR7czI=
X-Received: by 2002:aed:3848:: with SMTP id
	j66-v6mr16079659qte.218.1535408969141; 
	Mon, 27 Aug 2018 15:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20180824193454.146236-1-joe.slater@windriver.com>
	<CAMKF1spEy0_3DdinAzP4qxv_heCXHwsqBmdtYfRMV3a+nJms=w@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF84F3688B69@ALA-MBD.corp.ad.wrs.com>
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84F3688B69@ALA-MBD.corp.ad.wrs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Aug 2018 15:29:18 -0700
Message-ID: <CAMKF1srDyUohh5YGLQCo2wVT6F35E8pRuBTodzhBfcPZxUtC+Q@mail.gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1] php: specify no valgrind
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
X-List-Received-Date: Mon, 27 Aug 2018 22:29:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 27, 2018 at 2:59 PM Slater, Joseph <joe.slater@windriver.com>
wrote:

> Yes, although that is an enhancement.    Joe
>

Agreed. I think this also helps to provide a solution to users who might be
relying on the wrong behavior now corrected



> -----Original Message-----
> From: Khem Raj [mailto:raj.khem@gmail.com]
> Sent: Friday, August 24, 2018 1:22 PM
> To: Slater, Joseph
> Cc: openembeded-devel
> Subject: Re: [oe] [meta-oe][PATCH 1/1] php: specify no valgrind
>
> On Fri, Aug 24, 2018 at 12:35 PM Joe Slater <joe.slater@windriver.com>
> wrote:
> >
> > configure will look by default for valgrind.h in some host directories.
> > We override this by setting --with-valgrind=no.
> >
> > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > ---
> >  meta-oe/recipes-devtools/php/php.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-oe/recipes-devtools/php/php.inc
> b/meta-oe/recipes-devtools/php/php.inc
> > index 4231fcc..ef03e66 100644
> > --- a/meta-oe/recipes-devtools/php/php.inc
> > +++ b/meta-oe/recipes-devtools/php/php.inc
> > @@ -47,6 +47,7 @@ EXTRA_OECONF = "--enable-mbstring \
> >                  --enable-wddx \
> >                  --enable-fpm \
> >                  --enable-zip \
> > +                --with-valgrind=no \
>
> perhaps turning it into a packageconfig is better.
>
> >                  --with-libdir=${baselib} \
> >                  --with-gettext=${STAGING_LIBDIR}/.. \
> >                  --with-zlib=${STAGING_LIBDIR}/.. \
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

