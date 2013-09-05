Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 95BCE6086C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 04:29:33 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id eo20so1140659lab.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Sep 2013 21:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=sBrKlH/WYvk6z/ekvqjwWq1DmMrNtGHYexx4HMVflfE=;
	b=XyWYUjL55bxOJ+OGIXHbFt1jFvqUHtMHG+PNFVH46pO6pih02AsFPBsYQtAs7AwPMY
	Jko3y+ks0ZA1ucqPoNN4XlqxpMV5XQuFn/oc1HuWtTvBiQW51kvUJ4LPPy1skXNnQsEh
	Y7QR9ujD2JzCCaNVHBNHygwZyyVWbQz9iQjovtmwsIRBL62qBQreEiYr0H2DTefrcEpy
	e4WDDIPILnIssrxCH95wRgQfTzyZ+myxiNIOfAgziS+5vp9EVOMfN60ZW5fz2sJ9oWoo
	n9kdsgTRvG6C0h7klsZUVxM91pv8BjEo9yn1JZMGQyyCtLW2yI5oMy7IFhmgzDTlZujV
	fMSg==
MIME-Version: 1.0
X-Received: by 10.112.72.229 with SMTP id g5mr5455259lbv.10.1378355374266;
	Wed, 04 Sep 2013 21:29:34 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Wed, 4 Sep 2013 21:29:34 -0700 (PDT)
In-Reply-To: <20130904210427.GQ3761@deserted.net>
References: <1378110051-8976-1-git-send-email-lpapp@kde.org>
	<CADkTA4NZ-M6XBYx2bBBW_QtMtsUnDNdyYggr1Wa=6Qu33EHvPQ@mail.gmail.com>
	<CAOMwXhNV70uRZiL1T+gbguZnBrwUwdUzfGA30d6N-OvhSK__xA@mail.gmail.com>
	<CADkTA4P-tyfnX5Dywf8Z+tSEVxjbrykio5tFg_UmhkrTvORdyw@mail.gmail.com>
	<CAOMwXhNp0w=1=QW=e+82Q135wECMROUdcJ3aEaLUFKOu_68DEQ@mail.gmail.com>
	<CADkTA4PUf5ce5B206zP+7i4hZ0LWN_YD1VuooSZLkC4j-nmuJw@mail.gmail.com>
	<20130903210803.GD20985@deserted.net>
	<CADkTA4M=4Jrr6-4JP4bWM0Bwm7XxMvgyTi49XkcLGtLSpSMBvg@mail.gmail.com>
	<CANBf+V2Mp7Q+E0uW6YtoctCUcQa3sCma31Ygmm9f7nejYbUZJg@mail.gmail.com>
	<CADkTA4NOCjzDz=SXqAx+AxDTDztSas5EG+i74LUmpaF0OkZ5SQ@mail.gmail.com>
	<20130904210427.GQ3761@deserted.net>
Date: Thu, 5 Sep 2013 00:29:34 -0400
Message-ID: <CADkTA4NUd9jWSuP=ReP6zxHCSdiLMqXHuzBgKD3HWnVYD_cbDQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Joe MacDonald <joe@deserted.net>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] openflow: Add latest from git
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Sep 2013 04:29:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 4, 2013 at 5:04 PM, Joe MacDonald <joe@deserted.net> wrote:
> [Re: [oe] [meta-networking][PATCH] openflow: Add latest from git] On 13.09.04 (Wed 08:22) Bruce Ashfield wrote:
>
>> On Tue, Sep 3, 2013 at 11:27 PM, Joe MacDonald <joe@deserted.net> wrote:
>> > On Tue, Sep 3, 2013 at 6:39 PM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>> >>
> ...
>> >>  - We run some tests against meta-virt and give you the thumbs up when it
>> >>    is safe to merge, and the meta-virt copy can be deleted. I definitely don't
>> >>    want two of these running around.
>> >
>> > I don't mind delaying a merge a bit while waiting for more feedback on
>> > testing, provided we're talking about a reasonable timeframe.
>> > Otherwise, if the submitted OpenFlow is working well enough in
>> > meta-net, I'm inclined to merge it and take patches from you guys if
>> > you find issues down the road.  That'll be how it will work anyway in
>> > three month's time, for example, when meta-virt has dropped their
>> > copy.
>> >
>> > How long do you think you'll need on this?
>>
>> I can test the new SRCREV and recipe by the end of the day, assuming
>> that you have the slightly edited version by the time I'm done, there
>> shouldn't be any incurred delay.
>
> Great, thanks.  Let me know how it goes.

My cherry-picked version of the patch looks sane, the newer hash worked ok in
my tests. Which isn't surprising, since the number of changes between the old
and new SRCREV isn't that big.

So from that front, we are fine to keep chugging along.

Bruce

>
> --
> -Joe MacDonald.
> :wq



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

