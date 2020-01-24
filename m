Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id E4C927E797
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 00:22:20 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id t6so31884plj.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 16:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=BFoIjzX0eNe4j8UlqxFre19Cbka/al36SH1qP25FKu0=;
	b=qtaxLOTW+bMx68SqZ0UIoOr+WtI+IpN+nCtAIPRNdwW3uWKxe4inrwScQg1BIwso9k
	V0nbyKZb4oNF6TvpRu9M5d7N1maTBFouGSlvYm+aXzlbhrS7a9rZztnmxp8Hpx/aMmIF
	CH3XggJU9kdNQRLIGR9qFvAQglBtAqpWI6u4iFMmKEpnWrBi86gA/gfi86loDJB+cNUN
	yPM70xPq64B78aaI2M8/50ofAvS2ivNAaAyjekuzjjY/xE7jKDrF1A0se67QPaRkvlpB
	lWQh9t73bLSWtZA2tDg0LO3g8EP2d+zoU4f+DLXFylE42rfFosgLKeB3kTk6pmqdM+sX
	vN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=BFoIjzX0eNe4j8UlqxFre19Cbka/al36SH1qP25FKu0=;
	b=KP1sZoU5tvX7XOj4+Wa3N8191mVI/WpZJDi9YCZm7v9eUoA84ZCzoASfiEf2dit3Tb
	A4Y7zgyHtW6g3Dfq7fzGEbZ8UooFK0XUoUvE+3rUcz99wty+zQX+lkjS0nvu/vY4fokW
	okHILh8U4V/d6UQcdnTH7l3dIYgsAqDS4BRRC99LmAYef/4mwBJavzUH3BF5m3FxX0e1
	cGYqAV97v39hS7VcjivNIAHAHfoxAnHXGDywqYATS77fFzKj3DpP4kTk+9uqKGv2RvJu
	P14jaHvqdIXv62N0iZl4oaRlkPUcqSeMOfYdTvtWJEUcfiy51sZRhjkUFcVOVPty5VXs
	gSvw==
X-Gm-Message-State: APjAAAWR4hs8qx7tKonYy1pZsDImRQansMC/G1F5F5CvlsFE9l2jOBzJ
	M0AoVKKgM6sqwLFP5KgAVPPu/nCnC6w=
X-Google-Smtp-Source: APXvYqxggNWKrQ3uMWDlHAVX9/qS/qjHBktSIkM6R+wZA1JZSQFkhivQg1XAesgYmdi1cE6TFzEJmg==
X-Received: by 2002:a17:902:321:: with SMTP id 30mr827288pld.130.1579825341039;
	Thu, 23 Jan 2020 16:22:21 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:9c09:6925:3189:b428?
	([2601:646:9200:4e0:9c09:6925:3189:b428])
	by smtp.gmail.com with ESMTPSA id j2sm3970715pfi.22.2020.01.23.16.22.20
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 23 Jan 2020 16:22:20 -0800 (PST)
To: Alex Kiernan <alex.kiernan@gmail.com>,
	=?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
References: <CAO5Uq5TV_6f7PXF6Q_TE0ii-W9xG9xgrO8p8OP_vb48HW=DugQ@mail.gmail.com>
	<CALbNGRSAYNsQkWMhNAfxVqnq4bYx2=mcqMxQpxvPampLFyKazA@mail.gmail.com>
	<CAO5Uq5TPW+hePvbEmxgN6cFHx5zcNqM-k9m_zSOOReBrYqU=pA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <92e2dcc5-6107-e05f-87f4-161b8132266e@gmail.com>
Date: Thu, 23 Jan 2020 16:22:19 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAO5Uq5TPW+hePvbEmxgN6cFHx5zcNqM-k9m_zSOOReBrYqU=pA@mail.gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: systemd failing in master with Assertion clock_gettime(map_clock_id(clock_id), &ts) failed
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
X-List-Received-Date: Fri, 24 Jan 2020 00:22:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 1/23/20 4:13 PM, Alex Kiernan wrote:
> On Thu, Jan 23, 2020 at 10:09 AM Andreas Müller <schnitzeltony@gmail.com> wrote:
>>
>> On Thu, Jan 23, 2020 at 10:43 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>>>
>>> On the offchance someone's tripped over this already/has pointers:
>>>
>>> Around the time python2 dropped out, I'm now seeing boot failures with:
>>>
>>> [  612.151548] systemd-journald[543]: Assertion
>>> 'clock_gettime(map_clock_id(clock_id), &ts) == 0' failed at
>>> src/basic/time-util.c:55, function now(). Aborting.
>>>
>>> I suspect it's unrelated to py2, but that's delayed me getting to the problem.
>>>
>>> The board I'm targetting is AM335x based, but without an RTC (which I
>>> suspect may be relevant).
>>>
>>> Anyone seen anything similar?
>>>
>>> --
>>> Alex Kiernan
>> Hi Alex,
>>
>> Have not seen that one yet. Will look for it once I can build images
>> in current environment (python2/Qt5.14 broke loads for me). What I
>> have seen were problems with timedatectl <-> ntp. Changing from local
>> time to ntp-sync did not work: Time remained un-synced on recent
>> images. Machine was Raspi so no RTC either.
>>
>> Don't know if this is related to your finding...
>>
> 
> Looks like it's related to the glibc bump - reverting that changeset
> gets it booting again. I struggle to figure out which of the myriad
> wrappers are actually being used from inspecting the glibc source, but
> if it's the one I think it is, there's clearly
> clock_gettime/clock_gettime64 changes there which I doubt my kernel
> has (we're currently using the TI 4.19.y kernel).

Is it possible for you to try 5.x for tests ? I know there were 64bit 
time_t related errors I saw with 4.19/rpi3-32bit but it was with musl, 
since musl enabled 64bit time_t by default, that might be different 
issue too

Try applying [1] to glibc as well, currrently, its only applied to musl 
case, perhaps that might help.

[1] 
https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch



> 


