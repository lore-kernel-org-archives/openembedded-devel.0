Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id F2BEB788E1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Mar 2018 18:40:14 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id z12so16750859wrg.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Mar 2018 11:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NZq3BkNld0F6a85WIl0QyjxW/Zb/I9U3rpqfhoXLrIo=;
	b=C+UX/N8HV+ebpHQz/4Xsh3OiVNtdvc7SyeabmJzzVp94gkjQRVhvBTgH+UUBYk2l8u
	vEsxnIlacXV6JrjBNULrmjujTeTBHrUmlZiL+LR8T8hYF1RrtayDa78T6SxSS/diNTZa
	FufptDjHQoA3MR5DzrqB5/xdxyes2oPImyYHGjOfDY11hT4EQo3L+tDzW9h06BnNuVPC
	kB9F+hNFhh1TCOMmTtUbnxaA1uwsLHGshUS8SJKCw5Q5la5h0EjD1H4i/elDGde6FMjx
	OQVoVCDMF7b2hwFtKVEsQieo31L6WJ8f01mMDVC0YON8BsRi7fbUCcil7C6QFf5/07xY
	tYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NZq3BkNld0F6a85WIl0QyjxW/Zb/I9U3rpqfhoXLrIo=;
	b=CsBscjEICyxniG2jcURmBmC4o1buejj4vla/52YKrNtOfUpcQQBPuci0oWzP/JUcH/
	6qP8V7nuoqAAEPtTN4TmC5iSKGqB54OCf1Sup/jc2XZGnnPDqgep9McmJmuP3nqoaFvR
	ZNlVwSvGuvbTN6p2H7pgGRzyt3W2UOUzJkoqx8L2suzjgGl2eFjplj1gVFXN29yJFXT3
	1UFUsX/s9n1gQKy6JgVwav8+wo4bD2bnrT/cei7EuyD93IiIPdQGx3Xy2JrzElf3Vplz
	7h/d0mG/+NA757e9QI5FNMH1NRNhys9efatf3/qotokia3U0i1aIGu5PFv4sYhABQ8gW
	X6Aw==
X-Gm-Message-State: AElRT7EzAoNOWLFFPJZ5aCSANL72fI1Ch3Oqq4o8YBc0Ntzis+AJvB0c
	e0zMMkDkAzNlh+S91dNfk2KaykYu0Sdb0g0Rn0E=
X-Google-Smtp-Source: AG47ELvSE/mHKeFur7j/Y9fYApdaHktRKuhoFWJr05+UHNVWw8g8gFjOTH8zTSh9DhbMMAkzDiq4cBXSgxULQuLeAw4=
X-Received: by 10.223.142.13 with SMTP id n13mr1955943wrb.133.1520880015566;
	Mon, 12 Mar 2018 11:40:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.30.136 with HTTP; Mon, 12 Mar 2018 11:40:15 -0700 (PDT)
In-Reply-To: <1520395408-19266-20-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
	<1520395408-19266-20-git-send-email-akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 12 Mar 2018 19:40:15 +0100
Message-ID: <CA+chaQc23Fs6xdFF==qWb5Nid9hvFoFqYyL9nvURHQo_GRLqvw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 20/25] libxml++: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Mon, 12 Mar 2018 18:40:15 -0000
Content-Type: text/plain; charset="UTF-8"

What in libxml++ requires x11? I'm building it in DISTRO without x11 for
years and never noticed any issue with that.

On Wed, Mar 7, 2018 at 5:03 AM, Armin Kuster <akuster808@gmail.com> wrote:

> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-core/libxml/libxml++_2.40.1.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
> b/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
> index c001c18..c3d647c 100644
> --- a/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
> +++ b/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
> @@ -16,7 +16,9 @@ SRC_URI[sha256sum] = "4ad4abdd3258874f61c2e2a41d08e9
> 930677976d303653cd1670d3e9f3
>
>  DEPENDS = "libxml2 glibmm"
>
> -inherit autotools pkgconfig ptest
> +inherit distro_features_check autotools pkgconfig ptest
> +
> +REQUIRED_DISTRO_FEATURES = "x11"
>
>  do_compile_ptest() {
>    oe_runmake -C examples buildtest
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

