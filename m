Return-Path: <vm.rod25@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9F5D2761D6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 16:23:23 +0000 (UTC)
Received: by igbpg9 with SMTP id pg9so515689igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 09:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=zb49R5YUJmvGkUV4q1v3vr16EppIC3g34i0WVoLDVEs=;
	b=oIXU8+PpD/h+aDCueM+4fI0Mq3bSos5GrMpa77RTNdIoQdlIwsBKL1iANlEjABpos0
	lgUYVImqcpGzkN+TaYlND3ElPMJqy/2bHCHPtMcXoJvQpo0HWzzMO4x9XioKVdztnGw7
	s5lzShAZsesWSdnyCYOuNm0tlD0fMab6TZ6CqpcMn5VoPZ4KOFie3vY1N+/mpv9xTW1R
	GSlE1JH9EnUYAljf5ZgDrseLes0Mom5Fr5Eu47qvr+slnohuxSbhkKv9XgU+UHvcd13u
	IEx96sbHyekHMMLXzeVlsKRONFIprlhF4RYmlpfb+gU2lGzCdGWNs7T9KP4T9gXqHG2U
	bEyw==
MIME-Version: 1.0
X-Received: by 10.107.166.72 with SMTP id p69mr15767931ioe.65.1437663930938;
	Thu, 23 Jul 2015 08:05:30 -0700 (PDT)
Received: by 10.50.141.228 with HTTP; Thu, 23 Jul 2015 08:05:30 -0700 (PDT)
In-Reply-To: <CAP9ODKq6U0udqPvjgs1WmHNFy693O6h5Qt+hHFwnYo5nbpH1kQ@mail.gmail.com>
References: <CAK5mtexxdYxhwvv-MB27Ur56iwAV8O3Y6ah_BPAo+R58NmNouQ@mail.gmail.com>
	<CAP9ODKq6U0udqPvjgs1WmHNFy693O6h5Qt+hHFwnYo5nbpH1kQ@mail.gmail.com>
Date: Thu, 23 Jul 2015 10:05:30 -0500
Message-ID: <CAK5mtezxAk8pdCohRV8R4VCTcc4OypTd29Gf6mzK1g7F+_0OMg@mail.gmail.com>
From: Victor Rodriguez <vm.rod25@gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 23 Jul 2015 16:23:24 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 22, 2015 at 7:35 AM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Tue, Jul 21, 2015 at 11:57 AM, Victor Rodriguez <vm.rod25@gmail.com> wrote:
>> Few weeks ago I was having some problems with open CV receipt. In the
>> begining I toght I was adding opencv tro my core-image-minimal-xfce
>> just with this:
>>
>> IMAGE_INSTALL_append = " gcc gcc-dev openssh php mariadb opencv"
>>
>> Now after booting the image I realize that none of the libraries for
>> open stack were added to my image
>>
>> What I had to do was the following:
>>
>>
>> IMAGE_INSTALL_append = " libopencv-core-dev libopencv-highgui-dev
>> libopencv-imgproc-dev libopencv-objdetect-dev libopencv-ml-dev
>> opencv-staticdev python-opencv"
>>
>> Even last night when one of the opencv developers ask me for python
>> opencv I had to add the last part python-opencv. That is not cool at
>> all . If I add opencv in the beginning I assume we are more than cool
>> with that and yocto will add all the packages . Unless I am doing
>> something wrong, in taht case I am more than happy to get the
>> feedback.
>>
>> Thanks a lot for all the help . If someone else can reproduce this bug
>> I am more than happy to report it in bugzila (not sure the URL)
>
> You should add the dev-pkgs and tools-sdk image features for the
> image, not mangle it manually.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto


I think the best solution is create a package group that will keep
backward compatibility and aloud packages exist as expected

