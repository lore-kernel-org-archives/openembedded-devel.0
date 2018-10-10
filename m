Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9D4337547F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 01:59:06 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id a85-v6so2263333qkg.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2018 18:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jJKq3Po7EhgjA7+dPYd5BxT8htTX92J5JksJjjx3eoo=;
	b=puK1hpx662pCFrvwwSwmcJdgwBWgygXkrd81heDM0Il1OrO2+06etwPBK8dm/7dtSd
	jJF1KigR7m37D2ap+CLxZ76TNZDKIxRD7NKCFWfGfhJq2SJuvLopQcKqgB4RNQCCGVkq
	eAaMYMmfNmB1VtCRaAZp9Y7eCiYYtCxfVzcXWiM5xzBb4k09Wr56QaBiyc87yDmrp9WV
	Ix9hFiHdXixNWIjRB9cQQzUabvbWeKLndj1EVYsJsT6KlWZE9t9L3jiQGtbXC8UyN+iG
	wRZvmuK70/f5w6AAyaEzbBm+kZwNuLjS7EOOueSiYqqTnKop/2bkVX2lRsco04W+2T/N
	DALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jJKq3Po7EhgjA7+dPYd5BxT8htTX92J5JksJjjx3eoo=;
	b=IaGBix6WsKaXO77J2lYplGbeFyy1KsY/IxeZ5PXIUie68qBSrZtXebzFltjni4nTHL
	Vm6tmxAGEIDcetxuOXyQOzape2dDWxCqewI6q65s9YWHe+M4sQy7oIG5pFkaTmBj2NnA
	4OJMdQHDDgDeToY3wQvPxGERLmEYVMStLB5Cv7Bs0QFbwOVaW2GAes1rS6YLeyQuUFzJ
	lh+zX5ejwyucnEVCA20XbHfO67NtFOHoMevaMFLNRLP2so1QLNVukFDB9sHMUd0WdNIr
	6p74geCN6q/xv7RIQk2BqdJqEqlwDrjGfbzWgbIJ0s9y2q7A7JT+jhBK2LLVTdh/61ym
	i1Lw==
X-Gm-Message-State: ABuFfojQUPWJ+5jKRVicsGfIfFvkBNMJDwPGVTbqJq5RjrH5VaQQXfd1
	GLwTnBMQTSoqKJKAG/8LpNMfPave78+0xnovDw0=
X-Google-Smtp-Source: ACcGV63QyaWlkfJOO9jsDuqVkJUS18j4ycVo0VOcOphn8YCImUVn5PNDTo4m5QL4a6iV8QtebWKVYyiCYa4sINQpI8E=
X-Received: by 2002:a37:5003:: with SMTP id
	e3-v6mr13776683qkb.102.1539136747081; 
	Tue, 09 Oct 2018 18:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <20181009085425.18140-1-yisooan@gmail.com>
	<20181009085425.18140-2-yisooan@gmail.com>
	<b90c2a55-134c-9482-0600-2f3d12ba2bf7@gmail.com>
In-Reply-To: <b90c2a55-134c-9482-0600-2f3d12ba2bf7@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Oct 2018 18:58:41 -0700
Message-ID: <CAMKF1sqfygWpfotE=4SBZ5BuFW+sG-G9a3QFFsLFV1Q5pQ3KqA@mail.gmail.com>
To: yisooan@gmail.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 2/2] babeld: Fix build fail on LICENCE
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
X-List-Received-Date: Wed, 10 Oct 2018 01:59:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 9, 2018 at 5:42 PM Yi-Soo An <yisooan@gmail.com> wrote:
>
> This patch is not necessary since [meta-networking,v2][PATCH] babeld:
> Add Babel routing protocol recipe. the v2 patch points to LICENCE
> instead of renaming it to LICENSE.
>

Thanks for update, I would have figured it out hardway with broken
builds.

> Best regards,
> Yi-Soo
>
> On 10/09/2018 05:54 PM, Yi-Soo An wrote:
> > Signed-off-by: Yi-Soo An <yisooan@gmail.com>
> > ---
> >   .../0001-Rename-LICENCE-to-LICENSE.patch      | 24 +++++++++++++++++++
> >   1 file changed, 24 insertions(+)
> >   create mode 100644 meta-networking/recipes-protocols/babeld/babeld/0001-Rename-LICENCE-to-LICENSE.patch
> >
> > diff --git a/meta-networking/recipes-protocols/babeld/babeld/0001-Rename-LICENCE-to-LICENSE.patch b/meta-networking/recipes-protocols/babeld/babeld/0001-Rename-LICENCE-to-LICENSE.patch
> > new file mode 100644
> > index 000000000..de374ad69
> > --- /dev/null
> > +++ b/meta-networking/recipes-protocols/babeld/babeld/0001-Rename-LICENCE-to-LICENSE.patch
> > @@ -0,0 +1,24 @@
> > +From f58103fc6da9a96c11b653eafd4c2ea7eab7ee68 Mon Sep 17 00:00:00 2001
> > +From: Yi-Soo An <yisooan@gmail.com>
> > +Date: Tue, 9 Oct 2018 16:24:32 +0900
> > +Subject: [PATCH] Rename LICENCE to LICENSE
> > +
> > +Although LICENCE is grammatically correct, the recipe requires
> > +only LICENSE file. If the name does not match LICENSE, it fails
> > +to build.
> > +
> > +To fix it, it renames to LICENSE.
> > +
> > +Signed-off-by: Yi-Soo An <yisooan@gmail.com>
> > +---
> > + LICENCE => LICENSE | 0
> > + 1 file changed, 0 insertions(+), 0 deletions(-)
> > + rename LICENCE => LICENSE (100%)
> > +
> > +diff --git a/LICENCE b/LICENSE
> > +similarity index 100%
> > +rename from LICENCE
> > +rename to LICENSE
> > +--
> > +2.17.1
> > +
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

