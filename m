Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6A87B7863B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 00:51:10 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id f19so3949lfg.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 16:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EAEtsdXliWa3ZHf3uTS11pufiAFJLB/HPGdmArUGbHM=;
	b=HHkzN3858WxJBzCI+WrvZle9jstO6Cnr9JPxU9HKJzqFuT8KBn/teOh9hCSzu018Ey
	dsOmqrtiJwzYUTxRhuTTuxOMxkzhGLVFr79Nlq3hnaLOmWTPFY6+pxB3hWY0YGdKV8aA
	jIIxb4xJCaNj0TMRXO7CQm/f1uTBieA4Y19q6wCxUy+opnXiKoeLH2RBU30rVNEVa4Zd
	uG1D1WqCmNP0ww01hccz+2XH5QhGUtj2/dhlvxOTSCbUV0I66M6pwkX08h6eTV0H+sLZ
	CPM+O4E5me8ay1NYJeLj7/qMtpo0NvbPo76V0d4uCTP4Y52afVnqWPkiWjT+041KYgry
	tEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EAEtsdXliWa3ZHf3uTS11pufiAFJLB/HPGdmArUGbHM=;
	b=UzbOxXMlJWXqmNmUAyeYwBtt+HeyI6+CC3feQX/DAd9HLLSvelveX2pKFmZrV/vu7g
	MvO7g+gwM+Qk10nggg1lLKqQKbq2nBnnpOg0bCJQ+Ef3VHr7QlsgNgYHd0yrm4A7rS94
	jajHeun+r21S5o2eeLGRzxabSkr0caxqmG3CaplIBqUCi8DWeDEfthkdwQcAgq7DoTys
	pCYJjZNssGg2UHUBztjxOaMNY3BnFDzQn4XuduucD4uGMqqa2xUCeCDUVR1eG7rZo4I4
	wVwWO6HJQGl2801oCM2wKfepqZaPY94Cl9Gi9yLc0S815SZEG4tNP8+ZN6SWVrN+kOGe
	fwkw==
X-Gm-Message-State: APf1xPDPnVNznP6jDTw4ddgos5uNkHI0O/Nbmj7EoDIBcuJZ0cVgJcAM
	Fb2UBqnEg/WVOWUktV0Jzdc/XeHADKSGF88hKco=
X-Google-Smtp-Source: AH8x225DEKNagtSx1jb9OcVFAx/P9L7lG7vS/AIB69rfHLUo6ib/mverwK/tMTenqBvu3dREffwCTBTwoU+fCFYeZpU=
X-Received: by 10.25.25.9 with SMTP id 9mr923969lfz.3.1519174271833; Tue, 20
	Feb 2018 16:51:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Tue, 20 Feb 2018 16:51:11 -0800 (PST)
In-Reply-To: <8d5be4e4-3fd9-a0f2-c5cf-b967cf428416@gmail.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<CADkTA4MdQgigdN+hSsyZjk=1nfDB3M2799Pf-jy4WYt=6PdXyA@mail.gmail.com>
	<8d5be4e4-3fd9-a0f2-c5cf-b967cf428416@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 20 Feb 2018 19:51:11 -0500
Message-ID: <CADkTA4P46zCdHEUeAdsC7Ej+N3gp7-6Rxx=UTTYN7U91fL3Z1w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Wed, 21 Feb 2018 00:51:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 20, 2018 at 1:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On 2/20/18 9:13 AM, Bruce Ashfield wrote:
>> On Tue, Feb 20, 2018 at 11:50 AM, akuster808 <akuster808@gmail.com> wrote:
>>>
>>>
>>> On 02/20/2018 02:45 AM, Burton, Ross wrote:
>>>> Hi,
>>>>
>>>> Is now a good time to talk about splitting up meta-oe?  Some layers are
>>>> actively developed and maintained (one example: meta-python), others are
>>>> basically bitrotting and only get touched when something else causes them
>>>> to break world builds (one example: meta-gnome).  I've long felt that
>>>> meta-oe should be split up and the high quality layers managed in their own
>>>> repositories so patches to them don't get held up by breakage in other
>>>> sub-layers.
>>> You make it sound like meta-oe is not a high quality layer.  I could
>>> make the same claim about oe-core master.
>>>
>>> I don't see the connection in patches being held up due to breakage in
>>> other sub layers. This only happens if the dependency fail to build.
>>>
>>> You lose control over the quality in current layers that reside in
>>> meta-openbedded just like you have no control over all the other layers
>>> residing in the community. It makes maintaining stable versions very
>>> difficult. Well, unless The Yocto Project takes over them.. I guess that
>>> would work then.
>>>
>>>>
>>>> Another advantage of splitting out the high quality layers is that we'd
>>>> like to look at running more community layers through the Yocto
>>>> autobuilder, and granular layers make that easier to manage.
>>>  I thought not including layers in bblayers.conf was easy enough.
>>>>
>>>> Comments?
>>>
>>> What problem do you thing you are trying to solve here?
>>
>> My unrelated issues are that I can't update one layer, without getting
>> all of the updates.
>> .. but that is both a good thing (i.e. they are all tested together,
>> so you know that the
>> single SRCREV update is good for all layers), and a bad thing (when
>> you just want a
>> new python recipe update from meta-python, but don't want other changes).
>>
>
> if you dont include the layers in your BBLAYERS and they become
> effectively non existent, unless you are on metered internet connection,
> where downloading unused stuff would save you bandwidth, it should be
> ok.  No ?

Its not that.

I *am* building the different layers, but say I have a stable set of packages
and working images .. but for whatever reason, I need an updated python-<foo>
package for an unrelated package, or some other layer that needs a newer
version, etc.

How do I get that, without taking updates to all the layers ? .. and layers that
I really didn't want to update. I have to do some sort of combo-layer, carry
my own copy of the recipe, etc.

So there are definitely ways to do it, I'm just pointing out that I
end up taking
some build failures/issues from time to time on packages I didn't really
need to update.

The flip side of that argument is that all of the layers and sub layers have
gone through some sort of global build, and hence I know that they all have
worked together for someone. If I can update pieces individually, I break
that .. and I own the broken bits after that .. which again, goes to
my point that
fixing one workflow/issue can break another :D

Bruce

>
>> It is very likely that splitting the layer would help one issue, but
>> make the other worse.
>>
>> So no solution from me, just an observation about potential issue.
>>
>> Cheers,
>>
>> Bruce
>>
>>>
>>> - armin
>>>>
>>>> Ross
>>>
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>>
>>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

