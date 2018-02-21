Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id B6F537873C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 13:34:01 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id r80so2359687lfe.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 05:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o1olEQ2YdORTsGZJaeuorD0OpwXpEJCqQxx+F36YL9I=;
	b=rubKyNI71Vppk8PFd4vh2oehLa+WBqEw1AwCFNHGrhZsOmCcP1xP5By7A62j9zhLFa
	/XkBY3K6rj/rmgURhuq1Yn6AbgiT85DPCbWq5KXLNNhmJZvD73VxilWkiUFebmm6TFpK
	JXFn1wchb+FVTPdo9hhz20FDJ8RWKcrwI3SxFH/NhesZQVMx++dFCQgVm4uh0iYoTtBl
	Jd5h+VsOzLsiRRBYOXGuheVkLr1NsKB657E7K/Paf4drOfA/2WfsCqgNFhEPU+2oSc9f
	3ZEhK/UJjWhuoZDTnjfW50KvTXUjA+OmbR3vFUtEr+3QhAIJrtqXtZfkVSqkeWaYJPte
	xzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o1olEQ2YdORTsGZJaeuorD0OpwXpEJCqQxx+F36YL9I=;
	b=Vh9CWoo7gc5pgyvKFNPvEQ3bVxFa84iUqDlsN8liJLiOIR6tCMMZ5Kp+4aH1Qbi6g+
	M/sLF3JWq3jrWJU0lYmraK+H+Pxmah08ZkAln16IVZR7FbALS/KFx/Cs4XVzvwYG5fJi
	z1Ixap06snOxRGDKCpjasXlhjUdBsYhatFsb074eCO2pE2ApsnD95+4yhanCR2Dscgee
	JIM3RMFhumapnjGkHwU9auCWYYmySjspzBRSiD4UrvY/BQwDpH5VXuAe7MLc48xtYXn1
	6qW1dVKjEqyvkNBJjjPafkSuS94BqSA02x7n1Hk8DRY62LnNSqznsBFpsVB7B9c9wZ/K
	6YkA==
X-Gm-Message-State: APf1xPBMA6OROABCaVhzWkRlqtJk3PpEZkA6Ozyfg1zlUDSYUMXyHq5T
	LXme7va3OMvrmDhDiRuvMg+JyBZ5UPs8BLaLm+g=
X-Google-Smtp-Source: AH8x227WCvPpSxV4AWSCNwPo0DwpO80Uo3/VAZ94j6wGU4q+hLNAG18yD+9MWxmHmLJuudMlQyW+jujytoTG7MjgdFw=
X-Received: by 10.25.25.9 with SMTP id 9mr2317477lfz.3.1519220042017; Wed, 21
	Feb 2018 05:34:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Wed, 21 Feb 2018 05:34:01 -0800 (PST)
In-Reply-To: <CA+chaQd=LFUw8wV0h6O2O_RvH2R9APE=X3Mn+DarPSwxefs6bg@mail.gmail.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<CADkTA4MdQgigdN+hSsyZjk=1nfDB3M2799Pf-jy4WYt=6PdXyA@mail.gmail.com>
	<8d5be4e4-3fd9-a0f2-c5cf-b967cf428416@gmail.com>
	<CADkTA4P46zCdHEUeAdsC7Ej+N3gp7-6Rxx=UTTYN7U91fL3Z1w@mail.gmail.com>
	<CA+chaQd=LFUw8wV0h6O2O_RvH2R9APE=X3Mn+DarPSwxefs6bg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 21 Feb 2018 08:34:01 -0500
Message-ID: <CADkTA4PmgUikFh_hPqGsDLhmo7B0PwHXzV-VvYBbvT_M6M+KXQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 21 Feb 2018 13:34:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 21, 2018 at 3:49 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> I need an updated python-<foo> package for an unrelated package
>
> And how far will you go?
>

pretty far. I work with a lot of deep stacks that have a lot of specific
dependencies as well as compatibility issues.

> If you want just newer python-<foo> and nothing else, will you take other
> changes to other python-* recipes from meta-python layer? There is a lot of
> recipes there, if you're so picky about updates, then you shouldn't update
> whole oe-core as well.

I actually don't always, but generally speaking, I haven't had many
problems with package updates from oe-core. I end up with breakage
due to core build system changes, and that impacts oe-core and any
layer either.

But as I pointed out, I'm not looking to have my problem 'solved', I'm
just pointing out that it is a valid concern .. whether or not others
agree.

Cheers,

Bruce

>
> On Wed, Feb 21, 2018 at 1:51 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>>
>> On Tue, Feb 20, 2018 at 1:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > On 2/20/18 9:13 AM, Bruce Ashfield wrote:
>> >> On Tue, Feb 20, 2018 at 11:50 AM, akuster808 <akuster808@gmail.com>
>> >> wrote:
>> >>>
>> >>>
>> >>> On 02/20/2018 02:45 AM, Burton, Ross wrote:
>> >>>> Hi,
>> >>>>
>> >>>> Is now a good time to talk about splitting up meta-oe?  Some layers
>> >>>> are
>> >>>> actively developed and maintained (one example: meta-python), others
>> >>>> are
>> >>>> basically bitrotting and only get touched when something else causes
>> >>>> them
>> >>>> to break world builds (one example: meta-gnome).  I've long felt that
>> >>>> meta-oe should be split up and the high quality layers managed in
>> >>>> their own
>> >>>> repositories so patches to them don't get held up by breakage in
>> >>>> other
>> >>>> sub-layers.
>> >>> You make it sound like meta-oe is not a high quality layer.  I could
>> >>> make the same claim about oe-core master.
>> >>>
>> >>> I don't see the connection in patches being held up due to breakage in
>> >>> other sub layers. This only happens if the dependency fail to build.
>> >>>
>> >>> You lose control over the quality in current layers that reside in
>> >>> meta-openbedded just like you have no control over all the other
>> >>> layers
>> >>> residing in the community. It makes maintaining stable versions very
>> >>> difficult. Well, unless The Yocto Project takes over them.. I guess
>> >>> that
>> >>> would work then.
>> >>>
>> >>>>
>> >>>> Another advantage of splitting out the high quality layers is that
>> >>>> we'd
>> >>>> like to look at running more community layers through the Yocto
>> >>>> autobuilder, and granular layers make that easier to manage.
>> >>>  I thought not including layers in bblayers.conf was easy enough.
>> >>>>
>> >>>> Comments?
>> >>>
>> >>> What problem do you thing you are trying to solve here?
>> >>
>> >> My unrelated issues are that I can't update one layer, without getting
>> >> all of the updates.
>> >> .. but that is both a good thing (i.e. they are all tested together,
>> >> so you know that the
>> >> single SRCREV update is good for all layers), and a bad thing (when
>> >> you just want a
>> >> new python recipe update from meta-python, but don't want other
>> >> changes).
>> >>
>> >
>> > if you dont include the layers in your BBLAYERS and they become
>> > effectively non existent, unless you are on metered internet connection,
>> > where downloading unused stuff would save you bandwidth, it should be
>> > ok.  No ?
>>
>> Its not that.
>>
>> I *am* building the different layers, but say I have a stable set of
>> packages
>> and working images .. but for whatever reason, I need an updated
>> python-<foo>
>> package for an unrelated package, or some other layer that needs a newer
>> version, etc.
>>
>> How do I get that, without taking updates to all the layers ? .. and
>> layers that
>> I really didn't want to update. I have to do some sort of combo-layer,
>> carry
>> my own copy of the recipe, etc.
>>
>> So there are definitely ways to do it, I'm just pointing out that I
>> end up taking
>> some build failures/issues from time to time on packages I didn't really
>> need to update.
>>
>> The flip side of that argument is that all of the layers and sub layers
>> have
>> gone through some sort of global build, and hence I know that they all
>> have
>> worked together for someone. If I can update pieces individually, I break
>> that .. and I own the broken bits after that .. which again, goes to
>> my point that
>> fixing one workflow/issue can break another :D
>>
>> Bruce
>>
>> >
>> >> It is very likely that splitting the layer would help one issue, but
>> >> make the other worse.
>> >>
>> >> So no solution from me, just an observation about potential issue.
>> >>
>> >> Cheers,
>> >>
>> >> Bruce
>> >>
>> >>>
>> >>> - armin
>> >>>>
>> >>>> Ross
>> >>>
>> >>>
>> >>> --
>> >>> _______________________________________________
>> >>> Openembedded-devel mailing list
>> >>> Openembedded-devel@lists.openembedded.org
>> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >>
>> >>
>> >>
>> >
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

