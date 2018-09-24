Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id D41A971B27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 20:45:13 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id 5-v6so4961172lju.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 13:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GHQzZFZTenqqN1zNo697JwC4xoC6NivMvAbV/4tE4sk=;
	b=ftFWa4ognrvROv2CKehAO6SMqqGzE+MGyedKRYlw+yTqeVsZzWCywf+QiDUP9JzgKB
	vXWA879jsZoC7ZaGL0WDSWplitv97qSa3uEtmxheDB2GArtM7U/kVHsyCLIf/DBv5AA7
	6VldlW3yMO9DeGfmKiM+Y90xfUTCwSLdqt9bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GHQzZFZTenqqN1zNo697JwC4xoC6NivMvAbV/4tE4sk=;
	b=Ofj57WYYPQNRRl5EBHXMPpCD5gLHCiHX4Iwk0fxm4o92RHwPYIZ8mWqP/1qMBwxqbk
	1eDbd1wg2X/00YZUR6YCOEUHU7qSdUdmEQHt0uhKao7qe4v9uBVxOt2DxdWCHVVZnvI/
	DOk+3J68jU916q3oQNdvH3t0QwYS8M8f+5KQg3HWpLMa+Qkc/lkD+EIcIuwtR7lCoO1O
	Dp+2xcUqBsyRmMVJdKhtLHoBSD7hNCncGqTO1UKHyGkUTZ7cKUeQTyRiImbII+STvSGj
	oTWCtHAPtmCKtmbjS4eZg8m1BVmlru8eIzavZn0f/TqsPm8FQzdG+A6Rfp2IBYGAGavJ
	JklA==
X-Gm-Message-State: ABuFfojjp6uRw4oeQawejyPdmqt05K4700xJa2L39U1s98CRD9LgtGXz
	lnFweSz6GXOaaXs/kr7M5b94GvutzLAIgK2LpS7ZHA==
X-Google-Smtp-Source: ACcGV63VPBxJy1hIAH4NzQGDWKYqGQP0EswS53jEltyCLF9kdu084K7cg/ii+aG3HfgMkH9/xMzOdOHkv9+AI6AjGoA=
X-Received: by 2002:a2e:85d5:: with SMTP id
	h21-v6mr335644ljj.103.1537821914185; 
	Mon, 24 Sep 2018 13:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20180924201705.30209-1-nicolas.dechesne@linaro.org>
	<CAMKF1sqg6-DnQE7MGuxe4RnScu_uoXW6iker022pW6Q7FRS5dg@mail.gmail.com>
In-Reply-To: <CAMKF1sqg6-DnQE7MGuxe4RnScu_uoXW6iker022pW6Q7FRS5dg@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 24 Sep 2018 22:45:02 +0200
Message-ID: <CAP71Wjw78UsD9opN1bEUCo3B_FZL0YY3HpvabQufdUhNT0JNzw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] meta-multimedia: fixup LAYERDEPENDS
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
X-List-Received-Date: Mon, 24 Sep 2018 20:45:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 24, 2018 at 10:27 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Dos2unix is in oe-core now please try with master

ouch. sorry, i missed that. I noticed the issue while running the YP
2.0 compliance script against sumo branch... how do we get that fixed
in sumo then? can we apply something like the below patch on sumo
directly?

>
> On Mon, Sep 24, 2018 at 1:19 PM Nicolas Dechesne <nicolas.dechesne@linaro.org> wrote:
>>
>> libebml depends on dos2unix classe since 26dafa0f3542 (libebml: inherit
>> dos2unix), so LAYERDEPENDS needs to be updated accordingly, otherwise we are
>> getting a ParseError:
>>
>> ERROR: ParseError at
>> /srv/work/oe/meta-openembedded/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb:13:
>> Could not inherit file classes/dos2unix.bbclass
>>
>> It was initially found with yocto-check-layer script.
>>
>> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>> ---
>>  meta-multimedia/conf/layer.conf | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
>> index cfedf2f6b..a1dfed4e9 100644
>> --- a/meta-multimedia/conf/layer.conf
>> +++ b/meta-multimedia/conf/layer.conf
>> @@ -27,6 +27,6 @@ BBFILE_PRIORITY_multimedia-layer = "6"
>>  # cause compatibility issues with other layers
>>  LAYERVERSION_multimedia-layer = "1"
>>
>> -LAYERDEPENDS_multimedia-layer = "core"
>> +LAYERDEPENDS_multimedia-layer = "core openembedded-layer"
>>
>>  LAYERSERIES_COMPAT_multimedia-layer = "sumo"
>> --
>> 2.18.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

