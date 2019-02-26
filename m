Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4B8BB7CBA2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 18:15:18 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id c2so7461105qkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 10:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XMLYsok+JDhTPUIC8d7aWTxzFo3LPE/7WYGv24fo+gM=;
	b=THk5tv9+MzEHD72ctZ74R2H54zkMHd/UsP3Z8zWfoJvhkD+XbvrI4/inwOyFxC6JlA
	QEhZj9zbQ4mxlY3+TJ++9p4wEXFPvQtxjBsWf1Bfd7A3dHGfBPCQ89OkW8lTa++jHfia
	S0ws6ozju0OnlqFbqPJi9FmxzT/2VfzPh9hJ65ouPdkeS7TuoBMofCBb/83iDHOkuKB2
	liKAOZZKIl6VLxYJ0imSlISARIBAbtGBIA3uXI+gL3P2bIavE4QE/EIenr3P2r/VDpGX
	TU+YTXSu1G/21FKR8bkaM2W52o6aUn4xdcMq8QlwQtIBDwnMRobqcPTsoUJ0qOJatOoh
	vgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XMLYsok+JDhTPUIC8d7aWTxzFo3LPE/7WYGv24fo+gM=;
	b=Rf5doIYE3wja9/WvwJFcaCugs6yxwQf6V7CDf9ZHcNNUIvWWLlLltCoAelXy/mToFs
	Y0EWIeoYB+w8ke9UAkVtkawhcx3B47Ga7nfGRPssQsIyMCl/LEwNU8G/i9r8UEWwSwXx
	jx2NNHZ+j3EQZnktchhILx/FZG8Ey7ghErr/tTRo/WPAoR8ooZ/h4jCUKSHl5sGDwuJh
	6iWNkouPTOjnQWNrY2uFM/duhSwbkDSPRSAGD8XE6XOzue2dWqfMHbjXUz+Y3JuZ95f5
	xEp2rxKaPhU0QhqADMhZAvE7nrP9SiabRf+12beA4Vj3iJCunzmhRENvTMuO417+G6Hq
	W9nA==
X-Gm-Message-State: AHQUAubF141EpEZ+/rZfLuDfpiGYlMZED8y4icdTo2nD+vZ2DgPQIy8h
	NyjPYcvto2K4dGgrC9IJJ/k//hmJQEudBVljhIY=
X-Google-Smtp-Source: AHgI3IZ7aWhKEP3cWFCruy/DF++hAIPwGJGvxXpyvZow5PDyIGxin6GL0LKDpSKUd8YYHy1Jd7w7k0tefxihZ4eRyao=
X-Received: by 2002:a37:4c88:: with SMTP id
	z130mr17797493qka.206.1551204918891; 
	Tue, 26 Feb 2019 10:15:18 -0800 (PST)
MIME-Version: 1.0
References: <20190222172949.3661-1-nicolas.dechesne@linaro.org>
	<20190222172949.3661-2-nicolas.dechesne@linaro.org>
	<CAMKF1sqPdBOQSq8Aejj5ji_yOGk3qPU_n8C_TqzEou4H0kuKpw@mail.gmail.com>
	<870da333acd14eaab709707238e1ac7d@XBOX04.axis.com>
In-Reply-To: <870da333acd14eaab709707238e1ac7d@XBOX04.axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Feb 2019 10:14:52 -0800
Message-ID: <CAMKF1sq1BGdFgMckYTjZPta5tMz7iVwBj09Re9h_tFjVd5B+5g@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/4] meta-oe: fixup LAYERDEPENDS to include meta-python
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
X-List-Received-Date: Tue, 26 Feb 2019 18:15:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 26, 2019 at 9:39 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
> > devel-bounces@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: den 22 februari 2019 19:19
> > To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> > Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
> > Subject: Re: [oe] [meta-oe][PATCH 1/4] meta-oe: fixup LAYERDEPENDS to
> > include meta-python
> >
> > On Fri, Feb 22, 2019 at 9:30 AM Nicolas Dechesne
> > <nicolas.dechesne@linaro.org> wrote:
> > >
> > > meta-oe depends on meta-python, for mongodb recipe, since
> > > 5cf9a144ad16 (mongodb: Upgrade to 4.0.1 release)
> > >
> >
> > The dependency was always there, but I wonder if there is a better
> > place for mongodb than meta-oe
>
> Can we please revert this? Making meta-oe depend on meta-python
> is not the right thing to do. Either move mongodb to another layer
> that already depends on meta-python or where it is fine to do so,
> or move python-cheetah to meta-oe. The latter seems like the easier
> choice.

I am fine with dropping mongodb from meta-oe and revert this patch
and the problem I see is that now meta-oe depends on meta-python
and meta-python depends on meta-oe, which is not good. Although
having meta-python as a dependency for meta-oe is fine or vice-versa
but no loops.

>
> //Peter
>

