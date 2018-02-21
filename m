Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 973C678493
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 13:38:24 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id r80so2379346lfe.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 05:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GXGNZPZXWFKmenVYD+tPLrUwMZxv41L4+VdS93Tyd+w=;
	b=X7dZWGCH/O683+ITDN+6fI0x6xaIo3DLu0tCmdBGizpilJdHhIhquaceOxlP8kDjeq
	pVo3xG7CxzUIG5I3zlByIWND5A+7vi9WWbli2AgOMhnlp4buN4mryrLmmngJxpPRyvQu
	ugAoQZvg6zRscvngqjC4OWzSLy7M5Xh/+E780c47QYtILR+my/kHaut6jrQStrfvcF5q
	SeSzZI2J/dOqB3xC3UnF+O7IXK0jsG/q9cvahXpS794r5TGIMYStFxYTTSK0ecG2FrKI
	rDrycIfAbOV4pCrkOmWE8FZ6WG4SWrpdDs+o8M7uuNo228CcH2lBZKhty9/oe3I9SI76
	kTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GXGNZPZXWFKmenVYD+tPLrUwMZxv41L4+VdS93Tyd+w=;
	b=tKOC8ElqDJ/q1jCPUDAWND1p127VEYZQtT/5IHSpyHlbEu+ojW56kERucpMpNkdvTZ
	AJtaQzDNNHyvdTixbsxAMeOzMO62yO7JWUFmpNcAT7KDz7N724NNPKcbcbFl/NxEp5OK
	ms9t8AgpBXPjYIjdIHeKAPoErY6AS/tf1BpDhWJU9NvS+HizRmCcspwVQ3oKIpEIi037
	x9fDS1lR8YzVDznSgBB6EpdG8p0vtkvvrfLiDrJ6159Naws2MyOKyBnB6KieHd70gJBC
	lgUo1Uj7zVJaHU5QGpsvc9D2lLx2FJPKWAvsfE2l4SCo/hRb4VR6XWLNmOEFODvzVBew
	dNMw==
X-Gm-Message-State: APf1xPD71sZ26+YTmVtlvMtZlQ0i5Nq127m3dblCQE7CNHh8HtsCPOdq
	UKpKeWo8cbrlKJhNohtKm2cxCFJAKqGx3gA/L+4=
X-Google-Smtp-Source: AH8x224eGME0B9TBmnuKHPPZ5lif9+cfkD1ZRUE/F2APUKcCnXTEZRMrCCDQaD9IMM4Aa7Z9xm6ikW6k07soI5aH7mg=
X-Received: by 10.46.17.220 with SMTP id 89mr369188ljr.87.1519220305077; Wed,
	21 Feb 2018 05:38:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Wed, 21 Feb 2018 05:38:24 -0800 (PST)
In-Reply-To: <CADkTA4PmgUikFh_hPqGsDLhmo7B0PwHXzV-VvYBbvT_M6M+KXQ@mail.gmail.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<CADkTA4MdQgigdN+hSsyZjk=1nfDB3M2799Pf-jy4WYt=6PdXyA@mail.gmail.com>
	<8d5be4e4-3fd9-a0f2-c5cf-b967cf428416@gmail.com>
	<CADkTA4P46zCdHEUeAdsC7Ej+N3gp7-6Rxx=UTTYN7U91fL3Z1w@mail.gmail.com>
	<CA+chaQd=LFUw8wV0h6O2O_RvH2R9APE=X3Mn+DarPSwxefs6bg@mail.gmail.com>
	<CADkTA4PmgUikFh_hPqGsDLhmo7B0PwHXzV-VvYBbvT_M6M+KXQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 21 Feb 2018 08:38:24 -0500
Message-ID: <CADkTA4O8Xkr_YUGipwVxJciZ-rR-pL705ei=-4OMfa=fC4LH_w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Wed, 21 Feb 2018 13:38:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 21, 2018 at 8:34 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Wed, Feb 21, 2018 at 3:49 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> I need an updated python-<foo> package for an unrelated package
>>
>> And how far will you go?
>>
>
> pretty far. I work with a lot of deep stacks that have a lot of specific
> dependencies as well as compatibility issues.
>
>> If you want just newer python-<foo> and nothing else, will you take other
>> changes to other python-* recipes from meta-python layer? There is a lot of
>> recipes there, if you're so picky about updates, then you shouldn't update
>> whole oe-core as well.
>
> I actually don't always, but generally speaking, I haven't had many
> problems with package updates from oe-core. I end up with breakage
> due to core build system changes, and that impacts oe-core and any
> layer either.

oh, and I'd add that this point is somewhat contrived (few package
breakages), since that is really just a fallout of the oe-core packages
being fairly ... core .. (and boring), so really there aren't any hard or
strange dependencies that cause issues and that's a fall out of the
content, not the workflow or model (or git repo split, or not!).

Cheers,

Bruce

>
> But as I pointed out, I'm not looking to have my problem 'solved', I'm
> just pointing out that it is a valid concern .. whether or not others
> agree.
>
> Cheers,
>
> Bruce
>
>>
>> On Wed, Feb 21, 2018 at 1:51 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
>> wrote:
>>>
>>> On Tue, Feb 20, 2018 at 1:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> > On 2/20/18 9:13 AM, Bruce Ashfield wrote:
>>> >> On Tue, Feb 20, 2018 at 11:50 AM, akuster808 <akuster808@gmail.com>
>>> >> wrote:
>>> >>>
>>> >>>
>>> >>> On 02/20/2018 02:45 AM, Burton, Ross wrote:
>>> >>>> Hi,
>>> >>>>
>>> >>>> Is now a good time to talk about splitting up meta-oe?  Some layers
>>> >>>> are
>>> >>>> actively developed and maintained (one example: meta-python), others
>>> >>>> are
>>> >>>> basically bitrotting and only get touched when something else causes
>>> >>>> them
>>> >>>> to break world builds (one example: meta-gnome).  I've long felt that
>>> >>>> meta-oe should be split up and the high quality layers managed in
>>> >>>> their own
>>> >>>> repositories so patches to them don't get held up by breakage in
>>> >>>> other
>>> >>>> sub-layers.
>>> >>> You make it sound like meta-oe is not a high quality layer.  I could
>>> >>> make the same claim about oe-core master.
>>> >>>
>>> >>> I don't see the connection in patches being held up due to breakage in
>>> >>> other sub layers. This only happens if the dependency fail to build.
>>> >>>
>>> >>> You lose control over the quality in current layers that reside in
>>> >>> meta-openbedded just like you have no control over all the other
>>> >>> layers
>>> >>> residing in the community. It makes maintaining stable versions very
>>> >>> difficult. Well, unless The Yocto Project takes over them.. I guess
>>> >>> that
>>> >>> would work then.
>>> >>>
>>> >>>>
>>> >>>> Another advantage of splitting out the high quality layers is that
>>> >>>> we'd
>>> >>>> like to look at running more community layers through the Yocto
>>> >>>> autobuilder, and granular layers make that easier to manage.
>>> >>>  I thought not including layers in bblayers.conf was easy enough.
>>> >>>>
>>> >>>> Comments?
>>> >>>
>>> >>> What problem do you thing you are trying to solve here?
>>> >>
>>> >> My unrelated issues are that I can't update one layer, without getting
>>> >> all of the updates.
>>> >> .. but that is both a good thing (i.e. they are all tested together,
>>> >> so you know that the
>>> >> single SRCREV update is good for all layers), and a bad thing (when
>>> >> you just want a
>>> >> new python recipe update from meta-python, but don't want other
>>> >> changes).
>>> >>
>>> >
>>> > if you dont include the layers in your BBLAYERS and they become
>>> > effectively non existent, unless you are on metered internet connection,
>>> > where downloading unused stuff would save you bandwidth, it should be
>>> > ok.  No ?
>>>
>>> Its not that.
>>>
>>> I *am* building the different layers, but say I have a stable set of
>>> packages
>>> and working images .. but for whatever reason, I need an updated
>>> python-<foo>
>>> package for an unrelated package, or some other layer that needs a newer
>>> version, etc.
>>>
>>> How do I get that, without taking updates to all the layers ? .. and
>>> layers that
>>> I really didn't want to update. I have to do some sort of combo-layer,
>>> carry
>>> my own copy of the recipe, etc.
>>>
>>> So there are definitely ways to do it, I'm just pointing out that I
>>> end up taking
>>> some build failures/issues from time to time on packages I didn't really
>>> need to update.
>>>
>>> The flip side of that argument is that all of the layers and sub layers
>>> have
>>> gone through some sort of global build, and hence I know that they all
>>> have
>>> worked together for someone. If I can update pieces individually, I break
>>> that .. and I own the broken bits after that .. which again, goes to
>>> my point that
>>> fixing one workflow/issue can break another :D
>>>
>>> Bruce
>>>
>>> >
>>> >> It is very likely that splitting the layer would help one issue, but
>>> >> make the other worse.
>>> >>
>>> >> So no solution from me, just an observation about potential issue.
>>> >>
>>> >> Cheers,
>>> >>
>>> >> Bruce
>>> >>
>>> >>>
>>> >>> - armin
>>> >>>>
>>> >>>> Ross
>>> >>>
>>> >>>
>>> >>> --
>>> >>> _______________________________________________
>>> >>> Openembedded-devel mailing list
>>> >>> Openembedded-devel@lists.openembedded.org
>>> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>> >>
>>> >>
>>> >>
>>> >
>>>
>>>
>>>
>>> --
>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end"
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

