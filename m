Return-Path: <vm.rod25@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2212B755F8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Aug 2015 15:12:37 +0000 (UTC)
Received: by ioeg141 with SMTP id g141so172330704ioe.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Aug 2015 08:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=X2GLS2tWy9H4vDz/srbVu91xp7dIkAG+AjkOM1AuXqs=;
	b=NKRZeLZo1PUGmxwABC6MhL+yGIu+1KjJVlyZ4djBvD/n98n7QP3gMR1hQBs+8OEI/g
	bHDItIjsWbQLR2Rt98UmH/cp9u+kZborHOfSGOx+MjgrMkebaepXOG1Y2vN3bBjU3Qlh
	7uEmTMxvIjbMWzwaeNTf2lf1y3UDatQ3jWejvEAkew+q9nPFA8MDmYp4X96cAuhjXhyH
	aQag7sNw3vZnhrWysVY9FZlPFqDhG4300fSsF1bHBJCgzWFaDYXHiDl1h8xMcyf0FN64
	JvyjjdF0kqYPD4MIt8t42S7TKRTif/RUZCpZqxQywl1H72M5sZ5dsAszY2tdCXuaLiIt
	6zLA==
MIME-Version: 1.0
X-Received: by 10.107.136.146 with SMTP id s18mr21741464ioi.25.1439219558021; 
	Mon, 10 Aug 2015 08:12:38 -0700 (PDT)
Received: by 10.50.141.228 with HTTP; Mon, 10 Aug 2015 08:12:37 -0700 (PDT)
In-Reply-To: <CAP9ODKp3d0tGGiVHDZmvmCiduh6xrC-bU14NteEKYpPRVOTkcw@mail.gmail.com>
References: <CAK5mtexxdYxhwvv-MB27Ur56iwAV8O3Y6ah_BPAo+R58NmNouQ@mail.gmail.com>
	<CAP9ODKq6U0udqPvjgs1WmHNFy693O6h5Qt+hHFwnYo5nbpH1kQ@mail.gmail.com>
	<CAK5mtezxAk8pdCohRV8R4VCTcc4OypTd29Gf6mzK1g7F+_0OMg@mail.gmail.com>
	<CAP9ODKp3d0tGGiVHDZmvmCiduh6xrC-bU14NteEKYpPRVOTkcw@mail.gmail.com>
Date: Mon, 10 Aug 2015 10:12:37 -0500
Message-ID: <CAK5mteyG+9GxQ5xo=Az0dfYLTq9hOeGjp5vYsR6=cNAs2W-t3A@mail.gmail.com>
From: Victor Rodriguez <vm.rod25@gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Re: [yocto] Bug in Open CV receipt
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
X-List-Received-Date: Mon, 10 Aug 2015 15:12:38 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 23, 2015 at 11:30 AM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Thu, Jul 23, 2015 at 12:05 PM, Victor Rodriguez <vm.rod25@gmail.com> wrote:
>> On Wed, Jul 22, 2015 at 7:35 AM, Otavio Salvador
>> <otavio.salvador@ossystems.com.br> wrote:
>>> On Tue, Jul 21, 2015 at 11:57 AM, Victor Rodriguez <vm.rod25@gmail.com> wrote:
>>>> Few weeks ago I was having some problems with open CV receipt. In the
>>>> begining I toght I was adding opencv tro my core-image-minimal-xfce
>>>> just with this:
>>>>
>>>> IMAGE_INSTALL_append = " gcc gcc-dev openssh php mariadb opencv"
>>>>
>>>> Now after booting the image I realize that none of the libraries for
>>>> open stack were added to my image
>>>>
>>>> What I had to do was the following:
>>>>
>>>>
>>>> IMAGE_INSTALL_append = " libopencv-core-dev libopencv-highgui-dev
>>>> libopencv-imgproc-dev libopencv-objdetect-dev libopencv-ml-dev
>>>> opencv-staticdev python-opencv"
>>>>
>>>> Even last night when one of the opencv developers ask me for python
>>>> opencv I had to add the last part python-opencv. That is not cool at
>>>> all . If I add opencv in the beginning I assume we are more than cool
>>>> with that and yocto will add all the packages . Unless I am doing
>>>> something wrong, in taht case I am more than happy to get the
>>>> feedback.
>>>>
>>>> Thanks a lot for all the help . If someone else can reproduce this bug
>>>> I am more than happy to report it in bugzila (not sure the URL)
>>>
>>> You should add the dev-pkgs and tools-sdk image features for the
>>> image, not mangle it manually.
>>
>> I think the best solution is create a package group that will keep
>> backward compatibility and aloud packages exist as expected
>
> Sorry but this does not make sense. The image recipe you described is
> not using the framework structure for this and this is the problem you
> should address not bloat the oe-core itself.
>
> Check core-image class for it.

Thanks a lot for the help and answer these mails

I will create a RFC patch just for this recipe and see what happen

The problem is that when I add opencv to the image nothing is added
not even the capabilities to run a binary with this library nor the
capability to do development

I will send the patch to the open embedded and see what the community think

Best regards

Victor Rodriguez

> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

