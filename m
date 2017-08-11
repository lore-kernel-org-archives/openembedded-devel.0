Return-Path: <garbados@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 744EA782EA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Aug 2017 20:14:10 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y206so7580662wmd.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Aug 2017 13:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4kbg41tIBt53vW0MyPxzcFpeEzipDa3dezwb+wE8q9Q=;
	b=cP0iTmF4mQV8T/GKDHULxtwy2w34DpJT7BL5IYbZYqKwvhvIvkJqNOUfRWMc7XVVOd
	uPJTaeZdQ9gnV1uC8BQW7UTpgzFEsQSkDtKlhFXc3Q1VTxsbWwkjN8y4rjo/TuWkdgwP
	2taRbtI7VB79ucavGl/aQ5Idzm9nBSAncLT+ddfkuICtpFPktLJgISkMxqqS3CmjQGOO
	h7bIW4LcWNeHOVmY6sqPOKlBjqljvOIo44xxQ4nxUAvRaAeg/c2wPtUxZJ9F/etjAlS5
	m+2PLpTBh82mUymKPu3FAeuwUmBLBxqhjGCKmwWhIm6K7qkcTFYiu0ubeZgphD3di4j1
	l0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4kbg41tIBt53vW0MyPxzcFpeEzipDa3dezwb+wE8q9Q=;
	b=DQ5Fs6JMfy1XWAOBhHTKxaXpmPArQmwJi1Th3iVlp/9cknFbpiFNYEMrmpW2ncfgGB
	X9p8zo1HyAWNcnulT9sk5lIVIcLJghb2QNjUaEarRzl1wpjSzyYYlgQMhD5F5xAOXZOP
	zmcYybRTu3iGlnVZ26CIquP85JvKIW7XnYPjaDGhxZselPNOa2SqaoWDu5z/4SslPAAG
	ptpBqlkQxMPEqv7N1cDSLMksadW5tGQD4gsXN+upsLKDvoF2cVtFvJ1NjbtLuDaEsuY0
	76DWzbJO3Wb0nTnQY82wI+F3q0Y1z2kemnBjLzoZiUInLMH3iV6R+WeHToDJRxpvCwWh
	zMLw==
X-Gm-Message-State: AHYfb5h4uad0yL3/tn0eRM3rLDqNb4pJRp9tBrsDLpS5ES/oGiqS9xc5
	uQWps7T6kllrc77CQiMT0OHVOiAmlA==
X-Received: by 10.80.138.6 with SMTP id i6mr16480763edi.247.1502482451239;
	Fri, 11 Aug 2017 13:14:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.167.164 with HTTP; Fri, 11 Aug 2017 13:13:30 -0700 (PDT)
In-Reply-To: <CALbNGRT1bnpRLb0L4hok3UV8Qci9MxVTByWL5T-WGiP8D1gFow@mail.gmail.com>
References: <CA++8a_B59JkA14c9aN531E_HZN64ig_kDY_m_oNzcbEt39-hBw@mail.gmail.com>
	<CAMKF1sqx0z62dbQtQQZHhiDU1_0gjrzSfhOacsmBVkP5ehariQ@mail.gmail.com>
	<CA++8a_BLciSLffmy_MyxyeSEWCX+07BkiQ4u80Rz+upJ1rzBdw@mail.gmail.com>
	<CAMKF1spBau=OW8iA2K=ULnkZ_fFvdiRupDsPeiL8bPhPfms2cg@mail.gmail.com>
	<CA++8a_CQEZBUGm_u04cA1EddT=QnMxgWqEY8ZJGiVrTnbaKmoA@mail.gmail.com>
	<CAMKF1soVgTtENN2DG_ESg02coXAtjzuWn=jMt3ydhz_HdLfXbA@mail.gmail.com>
	<CA++8a_DgbopF2ssWZpNN9kgRiJyYS1gEtf4FuggBevsp=rL1tQ@mail.gmail.com>
	<CALbNGRT1bnpRLb0L4hok3UV8Qci9MxVTByWL5T-WGiP8D1gFow@mail.gmail.com>
From: Diana Thayer <garbados@gmail.com>
Date: Fri, 11 Aug 2017 13:13:30 -0700
Message-ID: <CA++8a_C-ysEbJ2dd0NZr8dvW8hyED0tthR3E36jhMmcNnw96Tg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openwrt] Issues adding layer using readme instructions
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
X-List-Received-Date: Fri, 11 Aug 2017 20:14:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> 600-shared-libext.patch does not apply any more. It is part of
meta-openwrt [1]. Have no idea what this patch is trying to
fix/enhance - Khem?

This is still blocking efforts to build with meta-openwrt. Any ideas?

On Fri, Aug 4, 2017 at 5:04 PM, Andreas M=C3=BCller <schnitzeltony@googlema=
il.com
> wrote:

> On Sat, Aug 5, 2017 at 1:12 AM, Diana Thayer <garbados@gmail.com> wrote:
> > Great! Here's the PR <https://github.com/kraj/meta-openwrt/pull/22>.
> >
> > Attempting to run `TCLIBC=3Dmusl MACHINE=3Dqemux86 bitbake core-image-s=
ato`
> > still fails with this error:
> >
> > ```
> > ERROR: iptables-1.6.1-r0 do_patch: Command Error: 'quilt --quiltrc
> > /home/garbados/openembedded-core/build/tmp-musl/work/i586-
> oe-linux-musl/iptables/1.6.1-r0/recipe-sysroot-native/etc/quiltrc
> > push' exited with 0  Output:
> > Applying patch 600-shared-libext.patch
> > patching file extensions/GNUmakefile.in
> > Hunk #1 succeeded at 50 (offset 1 line).
> > Hunk #2 succeeded at 87 (offset 1 line).
> > Hunk #3 succeeded at 114 (offset 1 line).
> > Hunk #4 succeeded at 123 (offset 1 line).
> > Hunk #5 succeeded at 146 (offset 1 line).
> > patching file iptables/Makefile.am
> > Hunk #1 succeeded at 8 (offset 2 lines).
> > Hunk #2 FAILED at 15.
> > Hunk #3 FAILED at 42.
> > 2 out of 3 hunks FAILED -- rejects in file iptables/Makefile.am
> > Patch 600-shared-libext.patch does not apply (enforce with -f)
> 600-shared-libext.patch does not apply any more. It is part of
> meta-openwrt [1]. Have no idea what this patch is trying to
> fix/enhance - Khem?
>
> [1] https://github.com/kraj/meta-openwrt/blob/master/recipes-
> tweaks/iptables/iptables/600-shared-libext.patch
>
> Andreas
>

