Return-Path: <asselsm@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6ED17605B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Sep 2016 01:44:36 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id j1so2498707ywb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Sep 2016 18:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=89+qIeTIybnCb0x3RpnFt6mtdrGuGLDstU3SrM28IdM=;
	b=Ls8CRfFnE+CrixNb0IEY87NyMDhRfOuQ08kLRcleD28oup6XnEB+RiyIwQXhwQ6XBA
	od0kpd8+b7cv5bVlOjEhM7pLxYlH47mOVgDMq/5nLu4UjAyn4Ypj/+znidGkJ/f0FCVN
	NH/NwqZm+8Peyw/CPtj5vPp0gddwUHOOE/+VTeXdLnL2FGu3vHLqiwM9L8ZvvfrvWGUA
	LJ9yiilRXhVfiZM+cRjDmCfbcMIgoDBKoiLo/9M7J5ykhU4vQu9nTQF/3EwHjyL7vdXD
	Xly9ZuceqvdMpy/c0f+nqho/sVhAN4b33+3+WXcGW1Fi8Qd34bqPMYrmVbcBTvTSoBB6
	f3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to;
	bh=89+qIeTIybnCb0x3RpnFt6mtdrGuGLDstU3SrM28IdM=;
	b=GjhzjDYtr4tRNJI5BPrseI4K+VV6hHJgLqkiV8RY8pMy+yXnb9ZBtbZxsrmDF/cuve
	nWEu/lObiTEVGi0+fE+f5DlsR0tSr9/UlzrrDj1rztAqcjozXWf5lFBTsJFslSgaacXU
	bejq3H8vZltHN06jex/GqbVz2JUt/DAl5NuV7xCz1a8xkEaKJ0wbt1RRlAEHd/S86E8a
	gsFaT7fz9t5TNtvDNGDiUOownQGEHEji8nM60pS39AilC0ifJhnDc37xUCk+nRIG9g+F
	ARbjXjk4nOFks8xy/6z5leWUljcabdawtcC/KSXsYWDO3b1qKy3r1N1ilL9vyOL9V/FX
	55Wg==
X-Gm-Message-State: AE9vXwOICzr/+Kw6e2CKXDdUoWhVkjw5q3lUrLKTdFJBSoeuplvT+HuktflNbNRldzuWJe+FgngTo+DHwhGGWg==
X-Received: by 10.129.125.84 with SMTP id y81mr966285ywc.234.1473385477022;
	Thu, 08 Sep 2016 18:44:37 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 10.37.170.75 with HTTP; Thu, 8 Sep 2016 18:44:36 -0700 (PDT)
In-Reply-To: <CAMKF1soPS9-=t0dpSnxeOdSTPR4NR5xoKckB4RC-boZ4wy1GtA@mail.gmail.com>
References: <20160908051048.15948-1-jackie.huang@windriver.com>
	<20160908084015.GA2636@jama>
	<1B858668EC6A94408DCA5225FDFA85AA0131074A68@ALA-MBB.corp.ad.wrs.com>
	<CAMKF1soPS9-=t0dpSnxeOdSTPR4NR5xoKckB4RC-boZ4wy1GtA@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Thu, 8 Sep 2016 21:44:36 -0400
X-Google-Sender-Auth: zTSS2yWbdRh_McWmzYQc5KjYHS8
Message-ID: <CAPuovEJymWQrgqGKUVcrXx2C4HM-KCNpN3UUehFqPkM3byzwAA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org, Jackie.Huang@windriver.com
Subject: Re: [meta-networking][PATCH] waf-samba.bbclass: Append PACKAGECONFIG_CONFARGS to EXTRA_OECONF
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
X-List-Received-Date: Fri, 09 Sep 2016 01:44:37 -0000
Content-Type: text/plain; charset=UTF-8

Agreed. I was looking at this today as well and if we go the
EXTRA_OECONF route it should be done in the package recipe.
Additionally Jackie I was going to restrict the blacklist to ARM based
on the build failure report
(http://errors.yoctoproject.org/Errors/Details/81004/).

Could you include a patch for this, something like:

-PNBLACKLIST[samba] ?= "BROKEN: fails to build with new binutils-2.27"
+BLACKLIST_REASON ?= ""
+BLACKLIST_REASON_arm = "BROKEN: fails to build with new binutils-2.27"
+PNBLACKLIST[samba] ?= "${BLACKLIST_REASON}"

Or if you want I will send something out in the morning.

Mark

On Thu, Sep 8, 2016 at 9:25 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Sep 8, 2016 at 6:18 PM, Huang, Jie (Jackie)
> <Jackie.Huang@windriver.com> wrote:
>>
>>
>>> -----Original Message-----
>>> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedded-devel-
>>> bounces@lists.openembedded.org] On Behalf Of Martin Jansa
>>> Sent: Thursday, September 08, 2016 4:40 PM
>>> To: openembedded-devel@lists.openembedded.org
>>> Subject: Re: [oe] [meta-networking][PATCH] waf-samba.bbclass: Append
>>> PACKAGECONFIG_CONFARGS to EXTRA_OECONF
>>>
>>> On Thu, Sep 08, 2016 at 01:10:48PM +0800, jackie.huang@windriver.com wrote:
>>> > From: Jackie Huang <jackie.huang@windriver.com>
>>> >
>>> > Append PACKAGECONFIG_CONFARGS to EXTRA_OECONF for waf-samba.bbclass
>>> > because the PACKAGECONFIG will not be handled for all recipes after
>>> > the following commit in oe-core:
>>> >
>>> > commit c98fb5f5129e71829ffab4449b3d28082bc95ab4
>>> > Author: Martin Jansa <martin.jansa@gmail.com>
>>> > Date:   Tue Aug 30 16:19:58 2016 +0200
>>> >
>>> >     base, autotools: Append PACKAGECONFIG_CONFARGS to EXTRA_OECONF only in
>>> autotools.bbclass
>>> >
>>> >     * recipes which don't inherit autotools or cmake bbclass and want to
>>> >       use the configure options from PACKAGECONFIG need to handle
>>> >       PACKAGECONFIG_CONFARGS themselves.
>>> >
>>> >     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> >     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> >
>>> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>>> > ---
>>> >  meta-networking/classes/waf-samba.bbclass | 2 ++
>>> >  1 file changed, 2 insertions(+)
>>> >
>>> > diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-
>>> samba.bbclass
>>> > index 772bc75..a58ca2c 100644
>>> > --- a/meta-networking/classes/waf-samba.bbclass
>>> > +++ b/meta-networking/classes/waf-samba.bbclass
>>> > @@ -20,6 +20,8 @@ CONFIGUREOPTS = " --prefix=${prefix} \
>>> >                    --mandir=${mandir} \
>>> >                  "
>>> >
>>> > +EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
>>>
>>> Cannot we append it to CONFIGUREOPTS and remove EXTRA_OECONF from this
>>> bbclass completely?
>>
>> Yes, we can, but why do we need to remove EXTRA_OECONF from this bbclass
>> completely? Is it going to be deprecated?
>>
>> And I see that EXTRA_OECONF  is used in several recipes that inherit waf-samba,
>> If it's remove from the bbclass, it's should also be removed from those recipes, right?
>>
>
> EXTRA_OECONF is usually kept for recipe namespace.
>
>> Thanks,
>> Jackie
>>
>>>
>>> > +
>>> >  # Three methods for waf cross compile:
>>> >  # 1. answers:
>>> >  #    Only --cross-answers - try the cross-answers file, and if
>>> > --
>>> > 2.7.4
>>> >
>>> > --
>>> > _______________________________________________
>>> > Openembedded-devel mailing list
>>> > Openembedded-devel@lists.openembedded.org
>>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>> --
>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

