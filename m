Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id B894E605B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 14:16:05 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id f93so14823946lfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 07:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=bZWpw2A4z/g0LSVkqOyYp+rnlJpx1dObgLQjdmOuZ1s=;
	b=S52Rb1M0LhzgyZT/KMWkmv7G5jkDPP3DE78Cx3pqKCETT7Zr37aXhkdtIOgxa6qLMH
	+RMjxTOG4F3fNyWyARZwhEa91/QJNX2ugZzgAsjN95nUktM/LLHe0PQpSCAD3tsczq0f
	VYMzMpT1UMJDrU7FzVKiv28Eh525yCHtxS0tPN9Bufo9T4n5c+C38sF7UyWbZQZ0Vjnl
	5n1wiDBKJSQ0+5SRF4HZDp6QDj7JLqLP3KGQo1dkGJKc/j357sFelgGjgK4ctAddnrOB
	kXR/hZ1wtILZMaYdj1Ptaue1CC3IntHioQIqzHJgUWrxzqvujOEwlqsQXiUvhAINJbf+
	5YdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=bZWpw2A4z/g0LSVkqOyYp+rnlJpx1dObgLQjdmOuZ1s=;
	b=E0kgW0vXVdyNEcNfZhq32bCFgAsqOWHQWWXUlNZfQ/sy8dh3qP/OYHtEIxeLR9feZ2
	lE5uscx0PK3I3kjw0h+2m0g4AHCGZviQlVUQ0sKK2p6bCHpoXpBSR4meG2hXDAiKNc8/
	BF88z7pEXMLujWBwrmbABBuwGpWL7YDGqOFhkA12sxXgdwIHyRehJn3LPWlZy6z3cnGF
	sB39Ahk5HaxW4RG4og0IKQirgubF5/EqbI3XUe4l5EBEh2AtpgF3gfYLQf7fO14qIbbE
	StNQzbvAcvNOdbJ/Zld1TD/9ODitnpiiulYSTzXMwV1Ixf+4o3HG+5bpiGqKx+GzodrO
	A/Ew==
X-Gm-Message-State: AE9vXwNE/uqOFjKTWN6ryPjkvwDl4d0kCHXODG7IQiJmT0coucy04W4NCcpOqO/9AoMNdp8g7lmm7H341WLyDg==
X-Received: by 10.46.9.9 with SMTP id 9mr1137267ljj.3.1472566564917; Tue, 30
	Aug 2016 07:16:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Tue, 30 Aug 2016 07:16:04 -0700 (PDT)
In-Reply-To: <22beaaca-b392-3971-3125-1f579b79e186@windriver.com>
References: <1472063392-11490-1-git-send-email-raj.khem@gmail.com>
	<e6c87ae1-ca1d-895c-adb3-6c2b75abaaa9@embed.me.uk>
	<CAMKF1spmR94=-VGMJD0LGTLASWeOyq-wt-KM4p0Ut-vowzYcDA@mail.gmail.com>
	<22beaaca-b392-3971-3125-1f579b79e186@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 30 Aug 2016 16:16:04 +0200
Message-ID: <CA+chaQfqE23N-s3HZ+W=qKSL2KJV+19+BY_wjSCWi7wL287WuA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] imagemagick: Upgrade 7.0.3 release to patch level 9
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
X-List-Received-Date: Tue, 30 Aug 2016 14:16:06 -0000
Content-Type: text/plain; charset=UTF-8

It doesn't destroy the history, but regenerates the tarball from time to
time with different checksum, so it sucks as well.

On Tue, Aug 30, 2016 at 4:12 PM, Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 2016-08-25 08:51 AM, Khem Raj wrote:
>
>> On Aug 25, 2016 2:04 AM, "Jack Mitchell" <ml@embed.me.uk> wrote:
>>
>>>
>>> On 24/08/16 19:29, Khem Raj wrote:
>>>
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>>   meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb | 6 +++---
>>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>
>>>
>>> 7.0.3?
>>>
>>
>> Its a typo thanks
>>
>
> patchlevel 9 is gone, replaced by 10! Whee!
>
> I've asked about keeping a few patchlevel tarballs around:
>
> https://www.imagemagick.org/discourse-server/viewtopic.php?
> f=1&t=26962&p=137186#p137176
>
> If the maintainers don't want to do that could we use
> the github mirror since it doesn't destroy history...
>
> ../Randy
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

