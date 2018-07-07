Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id B87916FF0E
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Jul 2018 02:38:58 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id j17-v6so8686098uap.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jul 2018 19:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=suDTbr2rtXOVgDvOCm/GiNR2ww2vEqdCQ9ed3psN4/M=;
	b=BIO6AJE8N6yWogchwnvijoZoKKgRurbzNFrmpVD1ZaTRLKT2X77BNTEM0sn5Qs9DP0
	D7Z6KIC4EDeobRzl9HMOeoybJJncmu1ZtBRfJwZ8Zom2H5yyGqKqRNWYW0SSPrGsbk+y
	jQG2kzWJZkHYx4tp+eLYArg0VWfY1ZbDRVGfWxDphQz2IY17HHmqyfAiBRU8tYSs1vT3
	pxvwaiPg/nE4CWK2zy3slueO4gPwedX9BYbcqgyagvh6GBuQ5tA78CgQfpX02OfNl3k7
	faMfzhmuCULexjZTG1s6BSePbwWxzY7CQCkqneuIug0VTQBJmBL49D1voQx0ytqv6fd/
	fUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=suDTbr2rtXOVgDvOCm/GiNR2ww2vEqdCQ9ed3psN4/M=;
	b=lE8G3+O6TKlb9Te3rp6fVVRZ1ZbYwZtsktDtkm+CPrL+zv1Cwxt6ttbYdFcQpNg/Uv
	OeEmmB6ESgWOpUbdiiNXeHSEpQG+3+T6SG4Zfrs5syVCHQmjzEbpjMy3IE4+TZCIyAMi
	OeTtn21n/wjHBsBCz8Shlap55jwicpMFovVUTdndl6hsBFpg9v2Brc4FFOSg/JK8U2Bc
	C7BY0aBW4s/lkNGr3NKknbdRxj2Zwl87w+uLrXsrnjbgkYMsqefv+fAeaqs0iPrKWRtd
	OyvUi5SyIzJvVYIhFI2kFUOgZq11k/BICEEL4wUd9e3eJWXs9X4dhkw6diIDn820AXAJ
	uqzw==
X-Gm-Message-State: APt69E1iHxx4t/WSFDVc0gh/eX4ySWpxiXJeRTooB0eVRMYgbvjxMqs/
	nA4A4Y8U5BDxJhTnbKDFBdeTwIGhBVy0tecxDKg=
X-Google-Smtp-Source: AAOMgpdul5dvVV/Oai3phmNqDSo0XSkNKWidkjthVO8ELDGB+HStu/YK/L4UU+RYlDoF1xLnibqU3eM1ZMS9hTLfnVs=
X-Received: by 2002:ab0:5323:: with SMTP id
	x32-v6mr7685896uax.139.1530931139333; 
	Fri, 06 Jul 2018 19:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <9a8e4137ac914b168091b71d755d54281530789529-12623-1-git-send-email-jonathan.haigh@arm.com>
	<DB5PR08MB0888D243F1C828A518CBA90C93470@DB5PR08MB0888.eurprd08.prod.outlook.com>
	<CAMKF1soy4zSM3+c=iun_u6OsY4YsP2Sp0NWfB-zatsTdjFUxZg@mail.gmail.com>
	<b3728620-31d6-455d-7ce3-1d86c9dcf66c@gmail.com>
In-Reply-To: <b3728620-31d6-455d-7ce3-1d86c9dcf66c@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Jul 2018 19:38:48 -0700
Message-ID: <CAMKF1sqO9r7rSaymFd34na7LBgGmmwfyqb6xD-N+YHpGVc7PGw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Jeremy.Johnson@arm.com,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devicetree.bbclass: DTB make targets may contain path components
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
X-List-Received-Date: Sat, 07 Jul 2018 02:38:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 6, 2018 at 6:13 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 07/06/2018 02:25 PM, Khem Raj wrote:
> > On Fri, Jul 6, 2018 at 12:02 PM Jonathan Haigh <Jonathan.Haigh@arm.com>
> wrote:
> >> normalize_dtb() turns DTS and DTB paths into values that can be used as
> >> make targets. These make targets sometimes contain some directory
> components
> >> so 'basename' is not suitable for turning the paths into make targets -
> >> we should only strip off leading directory components of the path up to
> >> and including the 'dts' directory (if it exists). For example:
> >> * 'overlays/at86rf233.dtbo' should not be changed.
> >> * 'some/directory/path/dts/overlays/at86rf233.dtbo' should be changed to
> >>   'overlays/at86rf233.dtbo' rather than just 'at86rf233.dtbo'
> >>
> >> Signed-off-by: Jonathan Haigh <jonathan.haigh@arm.com>
> >> ---
> >>  meta/classes/kernel-devicetree.bbclass | 5 +++--
> >>  1 file changed, 3 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/classes/kernel-devicetree.bbclass
> b/meta/classes/kernel-devicetree.bbclass
> >> index 9866d84..0ffa8e9 100644
> >> --- a/meta/classes/kernel-devicetree.bbclass
> >> +++ b/meta/classes/kernel-devicetree.bbclass
> >> @@ -12,9 +12,10 @@ KERNEL_DEVICETREE_BUNDLE ?= "0"
> >>  normalize_dtb () {
> >>          DTB="$1"
> >>          if echo ${DTB} | grep -q '/dts/'; then
> >> -               bbwarn "${DTB} contains the full path to the the dts
> file, but only the dtb name should be used."
> >> +               bbwarn "${DTB} contains the full path to the the dts
> file, but the path should be relative to the dts directory."
> >> +               DTB=`echo "${DTB}" | sed 's,^.*/dts/,,'`
> >>          fi
> >> -       DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
> >> +       DTB=`echo "${DTB}" | sed 's,\.dts$,.dtb,g'`
> > This patch is fine however, you should rebase it on top of master as of
> today.
> > secondly, this should be sent to oe-core mailing list since its
> > changing that layer
>
> this landed in master already. patch was posted earlier this week.
>
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=8b9264824689e99fb257901be3c0f91f79f920ef
> >


They are different patches

>
> >>          echo "${DTB}"
> >>  }
> >>
> >> --
> >> 2.7.4
> >>
> >>
> >> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

