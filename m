Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id C342973189
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Sep 2016 01:25:43 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id u68so2405283uau.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Sep 2016 18:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=xvqXF3uvRf1ZL5f76CKvzSZLO9dXZwuBD72EO0d5TfQ=;
	b=W/89izMddcRWPAfQ1OWOaMUqVge7sUz1dW+MrzL8ZJdzTDrLHdFTkm8//8DX1hovSg
	vXKM8s2as3rrD/N6W5tHpAm8atS01Ti+4X1XTLdfuNBFCfm6nSPR1lfjmlU+o85WqYPy
	M0lEMOWJ5ScftTdhkUZZTk62Wuuey8Ah6Uo390eua8CuGETiu/cgnwpBZTu/xM8DDBV6
	sdzmoGSitaJii4ALB2obPVsLCPz3inXvYviQj2Wjy4ldrzwDZQtOkMTSbcaQm0wMkJn2
	NgxlXHGzP2gFuZdeZkH0jnUdDWcZOeCBHy+dKxJ9kLdDr0gAuVtYnyB+8oCgbkZwxQsj
	8DFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=xvqXF3uvRf1ZL5f76CKvzSZLO9dXZwuBD72EO0d5TfQ=;
	b=RH0YqfcO3TbTxOmXuAfEN/F7hCdKV/NDT8vc2qr6WeNtLSAqXoHcrLeU1Dib1wrauH
	jqLZ8Dz5avLhJVHXvLU7ztYnBaXpacPHkGk9la1NFZ/DpnigAjPxgdO1RyTprVXenJGd
	QUDEEswLQ37P25tOrH8Ot1tbHpmZQj+if91iGm0dlDMw1OGzG7Uqj42bX2AFoDo7/1nB
	39AGT/3Xg2pPwoAtnILSjD/r4Qp5t2jOq1QM6gcS5Ja94u0kE+U3FRAILEWiAT7z4dN0
	jJKkPvp9ENLGqdqPW5useFJ3SFSEpvCHD7529OzzRkMxGT3tyMCDRcNTooIfHqKEcAaC
	5d1w==
X-Gm-Message-State: AE9vXwONpQiDVp/COm+wN2TBmGEySXOPeEq+zW+09v5ZZLPbIZjYngpGsF3Y5XTql1J3DZ2k0aanTiM9iNTdCQ==
X-Received: by 10.176.64.68 with SMTP id h62mr667868uad.39.1473384343535; Thu,
	08 Sep 2016 18:25:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.120 with HTTP; Thu, 8 Sep 2016 18:25:13 -0700 (PDT)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA0131074A68@ALA-MBB.corp.ad.wrs.com>
References: <20160908051048.15948-1-jackie.huang@windriver.com>
	<20160908084015.GA2636@jama>
	<1B858668EC6A94408DCA5225FDFA85AA0131074A68@ALA-MBB.corp.ad.wrs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Sep 2016 18:25:13 -0700
Message-ID: <CAMKF1soPS9-=t0dpSnxeOdSTPR4NR5xoKckB4RC-boZ4wy1GtA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 09 Sep 2016 01:25:45 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 8, 2016 at 6:18 PM, Huang, Jie (Jackie)
<Jackie.Huang@windriver.com> wrote:
>
>
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedded-devel-
>> bounces@lists.openembedded.org] On Behalf Of Martin Jansa
>> Sent: Thursday, September 08, 2016 4:40 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [meta-networking][PATCH] waf-samba.bbclass: Append
>> PACKAGECONFIG_CONFARGS to EXTRA_OECONF
>>
>> On Thu, Sep 08, 2016 at 01:10:48PM +0800, jackie.huang@windriver.com wrote:
>> > From: Jackie Huang <jackie.huang@windriver.com>
>> >
>> > Append PACKAGECONFIG_CONFARGS to EXTRA_OECONF for waf-samba.bbclass
>> > because the PACKAGECONFIG will not be handled for all recipes after
>> > the following commit in oe-core:
>> >
>> > commit c98fb5f5129e71829ffab4449b3d28082bc95ab4
>> > Author: Martin Jansa <martin.jansa@gmail.com>
>> > Date:   Tue Aug 30 16:19:58 2016 +0200
>> >
>> >     base, autotools: Append PACKAGECONFIG_CONFARGS to EXTRA_OECONF only in
>> autotools.bbclass
>> >
>> >     * recipes which don't inherit autotools or cmake bbclass and want to
>> >       use the configure options from PACKAGECONFIG need to handle
>> >       PACKAGECONFIG_CONFARGS themselves.
>> >
>> >     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> >     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> >
>> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> > ---
>> >  meta-networking/classes/waf-samba.bbclass | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-
>> samba.bbclass
>> > index 772bc75..a58ca2c 100644
>> > --- a/meta-networking/classes/waf-samba.bbclass
>> > +++ b/meta-networking/classes/waf-samba.bbclass
>> > @@ -20,6 +20,8 @@ CONFIGUREOPTS = " --prefix=${prefix} \
>> >                    --mandir=${mandir} \
>> >                  "
>> >
>> > +EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
>>
>> Cannot we append it to CONFIGUREOPTS and remove EXTRA_OECONF from this
>> bbclass completely?
>
> Yes, we can, but why do we need to remove EXTRA_OECONF from this bbclass
> completely? Is it going to be deprecated?
>
> And I see that EXTRA_OECONF  is used in several recipes that inherit waf-samba,
> If it's remove from the bbclass, it's should also be removed from those recipes, right?
>

EXTRA_OECONF is usually kept for recipe namespace.

> Thanks,
> Jackie
>
>>
>> > +
>> >  # Three methods for waf cross compile:
>> >  # 1. answers:
>> >  #    Only --cross-answers - try the cross-answers file, and if
>> > --
>> > 2.7.4
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

