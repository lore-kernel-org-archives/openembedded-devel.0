Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4AD92781FA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 17:21:08 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id v111so74760780wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 10:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7jFKGAl3RaXFz/13a1f9Gj7D/3oNYAeD8k6snHozNdk=;
	b=GdB8SgxR0uk27WXX7M6JNbrqv6liXtN9IXioF5yw1lBKfeBUMiMeMdWOIXR0yj+6VI
	5VC1OySCGAhal7mVsEcBLJdgmN61ihcoTAnGVCRCJv+puIFRbb9uYuoMwK0S3evG3GWF
	90X78y5q6/5Ph3P0lFQ2gyN+vBGTkLYLdqpF9UkqEhRTy6q29LXFC03sqN3bBoqfMbXV
	GNyaYVFoMSMMHLdxINRS4jNA45x9ssfOXegjFAhhP8xVx8aSwBE1xhX97P+vaEpVsN2g
	AXZynYScw2addKKywwd5CfHiQV1TMZpHpTOssT3d7k1JDfOeBxDNYD916+3YX1AiKy6O
	sjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7jFKGAl3RaXFz/13a1f9Gj7D/3oNYAeD8k6snHozNdk=;
	b=SEUtYoh/R0cXpQQqenEFNNwR610jgx31RIKsJcIlq3Pb5NcPthuZlq6kkg6hzEMmdA
	imOoBf/T9ndeQIiv1A0tGDkdtXFsZqqeurQfEXjXAPpTMKvG0Q8eobJ9MrZmPV284yQx
	wcRU4iQlUS2q5KmsAIpYdsRsngHuJF8jb6a6DZR69lqAlsZesC8FHEuNmyF5Oer7gzWt
	/ZJrSyr9xLU1Y+xHtRKD3+suKSHUb5pcOstWdaiLEhaxU50MOZAF2yZGXRP3Q7EIF5KI
	pEln5anyVG4EBEm2zw+zGE2Y4paAluWDucrZca81mDZiwZqtz21d/RARA/KK/TXxUwZC
	R4rA==
X-Gm-Message-State: AODbwcBeEzszZgnxyGDiEPXtty4Ru9Nh4+kHlkXOs0kflyD0kDDNzBiz
	huLJ9o9r+MuyEN5ukN1H1ul7r0tA0Q==
X-Received: by 10.80.131.6 with SMTP id 6mr6511411edh.178.1497201669023; Sun,
	11 Jun 2017 10:21:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Sun, 11 Jun 2017 10:20:38 -0700 (PDT)
In-Reply-To: <20170611165939.GT10782@bill-the-cat>
References: <1497193576-3774-1-git-send-email-trini@konsulko.com>
	<1497193576-3774-2-git-send-email-trini@konsulko.com>
	<CAMKF1soYoKjRue_y6w=yjZRP5ByOkLcrtZ=RwBTfopammubT1w@mail.gmail.com>
	<20170611165939.GT10782@bill-the-cat>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Jun 2017 10:20:38 -0700
Message-ID: <CAMKF1sqCTT0qV0naEXPn=U+GRxaOR=oQb8euPruXOAr89FDxXA@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] debsums: New recipe
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
X-List-Received-Date: Sun, 11 Jun 2017 17:21:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 11, 2017 at 9:59 AM, Tom Rini <trini@konsulko.com> wrote:
>> order of directives seems a bit displaced, may be running
>> meta-openembedded/contrib/oe-stylize.py
>> will be good.
>
> I'm not sure about that, I copied the order here from prelink_git.bb in
> oe-core.  Unless you're referring to something outside of the -cron
> part?  Thanks!

prelink_git.bb might not be a perfect template for new recipes too. Since
this patch is adding a new recipe, I think its probably good to have known
structure for it. I am thinking PACKAGES and FILES variables should be
after do_install

