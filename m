Return-Path: <vm.rod25@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id BD8807685E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Aug 2015 15:08:20 +0000 (UTC)
Received: by igui7 with SMTP id i7so20620841igu.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Aug 2015 08:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Vvwp4wxbPGFT2kbM/CPe8Gakem1WuKn4kS8ZOzOxbxg=;
	b=YhAyjRJIvhONluZplVcMT5OABkgmjMGvxFC0zV0lvB1J2qgQLaslZ9zMFS/R9p1O2V
	0Y0JrNeqrrM8fcFnpsM4ptkEGgJ4J887O9wCzHjIIVXfzDrHC9RIhI+3N0r2dhLaSshm
	ZyJXzcSiByYbkCzgBnb9S53HQ454jvUWdPze0YL6Z93wamkCgHPP1XSVwcu9Ysw1B3WV
	0yUCeRprRTSJa9UT8eT2NQ8gwxOCsy4+mxTYAO+43zEejur3IwDRC+pymYgcfeZtq+nX
	gPkwzFLmQxNXXYASRuA6g0fVzsx/yzFVplcnuoizGzVu24GmkG544q0uB/Q9T9ZqylVu
	kvCA==
MIME-Version: 1.0
X-Received: by 10.50.93.74 with SMTP id cs10mr6699022igb.42.1439219301016;
	Mon, 10 Aug 2015 08:08:21 -0700 (PDT)
Received: by 10.50.141.228 with HTTP; Mon, 10 Aug 2015 08:08:20 -0700 (PDT)
In-Reply-To: <55B38068.6000706@mlbassoc.com>
References: <CAK5mtexdmYF7ivs+nwa7WZSqVb8sZCq5Euvt8oK2HimiXy7PMA@mail.gmail.com>
	<55AE6705.5040907@mlbassoc.com>
	<CAMKF1sowuLL2i+uWVBC4M0j2YY8aCCw=hhGkA_oMk8G338X6Eg@mail.gmail.com>
	<55B38068.6000706@mlbassoc.com>
Date: Mon, 10 Aug 2015 10:08:20 -0500
Message-ID: <CAK5mtey_sLZj-Smx7Wx+96K-xFyP5EQaRY3EG-haNTbqeH2VEA@mail.gmail.com>
From: Victor Rodriguez <vm.rod25@gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 10 Aug 2015 15:08:24 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jul 25, 2015 at 7:26 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2015-07-24 18:37, Khem Raj wrote:
>>
>> On Tue, Jul 21, 2015 at 8:36 AM, Gary Thomas <gary@mlbassoc.com> wrote:
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
>>
>>
>>
>> its not required to.
>
>
> Maybe it's not required, but since that is the recommended way to
> add packages to an image, it probably should.  As you can see from
> the original question, the non-standard behaviour is confusing,
> certainly to new users.  It would only take a little reorganization
> to make it work as expected.
>

I really apreciate all the time you take to answer this mail

I would like to summarize this part and came to a final conclusion

Should I try to fix or should we leave it as it is ?

Best regards

Victor Rodriguez


>>
>>>
>>> I think this should be filed as a bug (and feel free to suggest a patch)
>>>
>>
>> No. Its not OE-Core or yocto bug
>>
>>> BTW, this question should really be on the OpenEmbedded development list.
>>
>>
>> its valid for meta-xfce only.
>
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

