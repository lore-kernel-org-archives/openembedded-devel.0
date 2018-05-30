Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id BB0E860778
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 15:13:53 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id k86-v6so14614549qkh.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 08:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=duFCUSLGZlDb5YL1A7hUE0vlCbAj2BgCfgc12pu8JbA=;
	b=OCfOWJIvV7iBCTYKgAQ9nLJKDq67l4MOAjeX8cSskbWj6wV/WOoQ4H9M0jwRSJBclZ
	zc66tqnrx1HhzyOuqLz5Uh7aqHH5cDx1oOBeEGdKcMyy2qblZcloaZyuzWxq/0QAiE+i
	us24xfEn8FEpliriYTbQjbA41YoN5x42dijbKh0MNQzJM1jwcZwhmVl7aIMiaqEtuHTV
	kWJTcc7aZpb2EAcOjwez0Q5vb5A0LTV/JVhZUW+2o1Cpx+ti216YVa4hNaOMJbW30Ys3
	TiyhyOBd04biXlCeX7rV8II55Z3Addz0jCaz66z0yOmNtk9TWdw3a85ueeyzH5mNTWLh
	gnug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=duFCUSLGZlDb5YL1A7hUE0vlCbAj2BgCfgc12pu8JbA=;
	b=DaDVz8Rruw1ouDhwj2L4n0SsSYkCZbiJtyjmecy9+tPHC1L1VM/Gt2gXwn4t2ewJcc
	TiOt8w/yTQVgNN/cBkuvOIpDrzP4GOPLPfjkUy+BeFbRbD/XgohOArtoRSxyqXejzuvo
	ckp9gqlZipYinEw03EHVrh2e4rgphabiqu2I5uxYL+4t4JlFa6Pqc1hKwTa343yy8Hb7
	gRn3B1xEu1tZIYIZW7rW1mquA2JVvxW8dPEPaoT4Xr0n4lmfhFM5p/xYKsj1U+/UcXYi
	qJxwdT87tAxUEKkaLOPkxNIIooc+CdBWcjrIVyv2sn2MuSv/4UCcIWCV4KEJPh5FOnFL
	M6ug==
X-Gm-Message-State: APt69E3cqS8KnOha7/ooiri44okR0cugseqg1mri4cE669tXBZ7sdRjK
	dFHKyh3M5RWPyzpVkyVde/A5uF+hGfV0dYVZvUk=
X-Google-Smtp-Source: ADUXVKJ+yqijE3upGlhdtA23ZmdoMXPoMCQEZ2RuwqYYqhCxJxG/iw8cDCZgyi1tVDCAK1aNEx3Hl6GolS+TmL91B5c=
X-Received: by 2002:a37:95c6:: with SMTP id
	x189-v6mr2698392qkd.110.1527693234263; 
	Wed, 30 May 2018 08:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20180530084937.19662-1-ricardo.ribalda@gmail.com>
	<CAPybu_0xcxOS4n_srFpPfejbFE6Zk5ts=9Rp+xVMrtqrkbzu+A@mail.gmail.com>
In-Reply-To: <CAPybu_0xcxOS4n_srFpPfejbFE6Zk5ts=9Rp+xVMrtqrkbzu+A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 May 2018 08:13:43 -0700
Message-ID: <CAMKF1sr=4K1+Wrz_M3vpQ4_+xd4oOU+Z22Rrq2CXiomcGATByw@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-clang][PATCH] clang: Fix sigsegv of llvm-config on the target
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
X-List-Received-Date: Wed, 30 May 2018 15:13:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 30, 2018 at 1:51 AM Ricardo Ribalda Delgado <
ricardo.ribalda@gmail.com> wrote:

> Sorry for the spam. The SOB is missing this this patch. Shall I resend?


It would be good if you sent a pull request on GitHub

>
> On Wed, May 30, 2018 at 10:49 AM Ricardo Ribalda Delgado <
> ricardo.ribalda@gmail.com> wrote:
>
> > llvm-config is, by default, broken by the SSTATE_SCAN_CMD. This patch
> > removes llvm-config from SSTATE_SCAN_FILES.
> > ---
> >   recipes-devtools/clang/clang_git.bb | 3 +++
> >   1 file changed, 3 insertions(+)
>
> > diff --git a/recipes-devtools/clang/clang_git.bb
> b/recipes-devtools/clang/
> clang_git.bb
> > index 5730b9b..3e2d2c7 100644
> > --- a/recipes-devtools/clang/clang_git.bb
> > +++ b/recipes-devtools/clang/clang_git.bb
> > @@ -158,3 +158,6 @@ FILES_${PN}-dev += "\
>
> >   INSANE_SKIP_${PN} += "already-stripped"
> >   INSANE_SKIP_${PN}-dev += "dev-elf"
> > +
> > +#Avoid SSTATE_SCAN_COMMAND running sed over llvm-config.
> > +SSTATE_SCAN_FILES_remove = "*-config"
> > --
> > 2.17.0
>
>
>
> --
> Ricardo Ribalda
>

