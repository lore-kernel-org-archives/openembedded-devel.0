Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 53DD07CECE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 08:08:41 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id o25so23210669qtr.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 01:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=z5/cT10hQqNgVx/cRisuN62b4HOIitNdkouaQ/UJzNg=;
	b=LLta98/hMui5uv0UKNXSuQ8nM5+30xy8X33PtzB/27GEs+xQHVlBbESwJSVqooVpuP
	PsoQnLR4n3lKmn0vK/efVdy45DKPeGjxAqr51VZ6RF+sre77ZVPrN1Oc3NYbFwy/I4zu
	CJFEVPuz7P5DRXVKPLfTJMkK3oHvdtqeEO+I6QY9akQRLV1E7cnXRltBojvR5geGjgUA
	kQLGVC7mFLFpGdXkekCX724XF99QdHae1EQjd+OvC4f2bnksWWCU4JBzIojekPl1POBH
	Y8PuXaeQNOniJrjLTwlAcZDFe/3kh+jj1CNzbFSG6SY3Y1HCMb4BTc6VTZpSvppUz2M9
	bFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=z5/cT10hQqNgVx/cRisuN62b4HOIitNdkouaQ/UJzNg=;
	b=tB66wMAFyANivcZ1eKL+uNjIzfvGYBTjPSLmLBuTwK/mTfmn6RIX0Hg7Mb2r+gCKID
	9r+jPiBbrnP4RcxAGjaTu9pe3fh+mmMOJaJmMjkvJcCvIblMHe8pzq0E/zBqv+R6IN+s
	1wE4b3e36hlpa0xphSbNkSLbDWEUV+ZxdBHznbkHdd0IyyD1pmcMr5Uj3Awn8ww5k5UB
	gllJ32C9U5fYVgjjRQHuBhmCh8Aoe0R4LVWHdlxosI5uCcuknhDwl76koegk0+iBMDvm
	1PdtNjzTBkcOfSKbxVpLiyQgzXaHEgkrSOKs86nzBgZExG9gZJBYsQO44of77q1LJgjK
	cPiQ==
X-Gm-Message-State: APjAAAXfmCrqsuUlYB9Mqp+7OoGitB01AI+t9p3RPyDyZ2uNRCQpayCw
	8M0MrppfRchhL5/40ycxWtrKX2XL6G7IKpDjZvY=
X-Google-Smtp-Source: APXvYqwG2Tg5peh7GX/pvkcjxTyHv4KmiPrjDW/hzyQb1v4fFf7Y5+MSeZ69IaOeuL4e+0200j6ttqz55MAhNtZBCs8=
X-Received: by 2002:a0c:e5c1:: with SMTP id u1mr13290366qvm.206.1571904521845; 
	Thu, 24 Oct 2019 01:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191023211702.15125-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20191023211702.15125-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Oct 2019 09:08:15 +0100
Message-ID: <CAMKF1spa6g3QynzOXGyZooVFCkVEjrsxP-caQYkwuU5iNG83uw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/2] python3-astor: Upgrade 0.7.1->0.8.0
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
X-List-Received-Date: Thu, 24 Oct 2019 08:08:41 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Richard

This also needed SRCREV bump, so I have actually staged a fix with
that change as well.

On Wed, Oct 23, 2019 at 10:17 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../python/{python3-astor_0.7.1.bb => python3-astor_0.8.0.bb}     | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-astor_0.7.1.bb => python3-astor_0.8.0.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-astor_0.7.1.bb b/meta-python/recipes-devtools/python/python3-astor_0.8.0.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-astor_0.7.1.bb
> rename to meta-python/recipes-devtools/python/python3-astor_0.8.0.bb
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

