Return-Path: <vm.rod25@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 521B36013D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 19:51:55 +0000 (UTC)
Received: by iebmu5 with SMTP id mu5so150678478ieb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 12:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=qzpoz3KJdMMlxw7/qI7Cdv8pTe2uuwlED+HlKwOcdTY=;
	b=CMR+xosiMInpERMqME/zP5cHk6Jnx6wz5Qq5Mj1HoJwKG++sNurnAA9zXO3PtYQFuP
	JSqQcesYyPneNsFeYBVWyP81ziHlsAwqW4hQBU0DYkxWfUVmD3tP8aYgx365EOzewQ+9
	qpy8MoSJQshOQr1rfxVQUYjMfARLGsi94wHos05By68huU6JOLER/IcKwAN46BmXiIPV
	RU1GbZAI/Ghtn/QnsTOEol7A5Bf1eJEmUNWHffeg5Cjc4yvokFa1XLtOE7vex0VjkjZY
	l7ZnMBIlVq5uw/5y0Ps8yLHD83zdLwqe2m8FyxtfFz2gC+yt9RUtGsA1IbXVBeep5fmq
	fppA==
MIME-Version: 1.0
X-Received: by 10.50.111.231 with SMTP id il7mr27199788igb.23.1437508315464;
	Tue, 21 Jul 2015 12:51:55 -0700 (PDT)
Received: by 10.50.141.228 with HTTP; Tue, 21 Jul 2015 12:51:55 -0700 (PDT)
In-Reply-To: <55AE8445.60302@linux.intel.com>
References: <CAK5mtexdmYF7ivs+nwa7WZSqVb8sZCq5Euvt8oK2HimiXy7PMA@mail.gmail.com>
	<55AE6705.5040907@mlbassoc.com>
	<CAK5mtex-n4XrVXG18zG=ha_+R1-Z5Yh6TKLWudt1CVpXpUHokQ@mail.gmail.com>
	<55AE8445.60302@linux.intel.com>
Date: Tue, 21 Jul 2015 14:51:55 -0500
Message-ID: <CAK5mtexxVJ2uZeahegoJ=+8pOztcPufUHYmXWrhwy9hMzc3tLw@mail.gmail.com>
From: Victor Rodriguez <vm.rod25@gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [yocto] Question about IMAGE_INSTALL_append and CORE_IMAGE_EXTRA_INSTALL
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
X-List-Received-Date: Tue, 21 Jul 2015 19:51:58 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 21, 2015 at 12:41 PM, Leonardo Sandoval
<leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>
>
>
>
> On 07/21/2015 10:45 AM, Victor Rodriguez wrote:
>>
>> On Tue, Jul 21, 2015 at 10:36 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>>>
>>> On 2015-07-21 09:26, Victor Rodriguez wrote:
>>>>
>>>>
>>>> Hi team
>>>>
>>>> I have a question , according to documentation there is a difference
>>>> between
>>>>
>>>> IMAGE_INSTALL_append
>>>>
>>>> and
>>>>
>>>> CORE_IMAGE_EXTRA_INSTALL
>>>>
>>>> Specifies the list of packages to be added to the image. You should
>>>> only set this variable in the local.conf configuration file found in
>>>> the Build Directory.
>>>>
>>>> When I use the second one and try to build a core-image-minimal-xfce
>>>> bitbake does not install what I wanted in my image . I had a really
>>>> hard time few weekends ago because of this.
>>>>
>>>> I wonder If I am missing something or if this is a bug
>>>
>>>
>>>
>>> The core-image-minimal-xfce recipe does not "play nice" with
>>> the core-image class and is not respecting CORE_IMAGE_EXTRA_INSTALL.
>>>
>>> I think this should be filed as a bug (and feel free to suggest a patch)
>>>
>>> BTW, this question should really be on the OpenEmbedded development list.
>>
>>
>>
>> Thanks Gary
>>
>> I will submit the BUG , do you know the Bugzila where I should submit it ?
>
>
> Victor, you can file a bug at https://bugzilla.yoctoproject.org
>

I think we have one already

https://bugzilla.yoctoproject.org/show_bug.cgi?id=7616

>>> --
>>> ------------------------------------------------------------
>>> Gary Thomas                 |  Consulting for the
>>> MLB Associates              |    Embedded world
>>> ------------------------------------------------------------
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

