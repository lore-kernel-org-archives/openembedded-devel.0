Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1888C76228
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 16:30:32 +0000 (UTC)
Received: by pdbnt7 with SMTP id nt7so88641273pdb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 09:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=lxfIlLhjo5sB2lxSp9khboD1Ynk9ddd5iH+GbVYQs0I=;
	b=IGZ1U1tZwLMpKnnpyHnbdQBDq2uq5mSwS2gdUXKWPTxGhLIsPTBC7GAvvqyA2/7Zgr
	u/Dg779aM+r7cmLLXgLYrMR+zZ8TF1ctyEyiPv3lnLLgNB5219hPNeLUD5HdC/qma4K8
	/ofbUUItQstbFdbIjCN+91VNbGUoCXJH7MOY0gjP/1VFV0Pktg0LCs0vZDXVzctOAWCe
	LmonDj3PnoKULIQPoYdwULwtaQr4a/xyRrOyGGoosKwiCsBhro+tR2BOEXjGI3M3Mmua
	VAxbuTm2qxWxKhWAL0FSvBT4XH8xfA72cOBliRLyj/9NV/Z6wvB24kYZv+4NZeZftfQR
	75xg==
X-Gm-Message-State: ALoCoQmnZqXwuhadwKSxGUD2lp9kzHim62+pyLE4w6vus7hRtxcFvT4xOdRg4Qr6HNHn1sK8L9Lr
X-Received: by 10.66.197.234 with SMTP id ix10mr15791883pac.152.1437669032773; 
	Thu, 23 Jul 2015 09:30:32 -0700 (PDT)
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com.
	[209.85.220.47]) by smtp.gmail.com with ESMTPSA id
	xp10sm9919143pac.34.2015.07.23.09.30.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jul 2015 09:30:31 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pachj5 with SMTP id hj5so160110363pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 09:30:30 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.230.201 with SMTP id ta9mr20241522pac.95.1437669030106;
	Thu, 23 Jul 2015 09:30:30 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Thu, 23 Jul 2015 09:30:30 -0700 (PDT)
In-Reply-To: <CAK5mtezxAk8pdCohRV8R4VCTcc4OypTd29Gf6mzK1g7F+_0OMg@mail.gmail.com>
References: <CAK5mtexxdYxhwvv-MB27Ur56iwAV8O3Y6ah_BPAo+R58NmNouQ@mail.gmail.com>
	<CAP9ODKq6U0udqPvjgs1WmHNFy693O6h5Qt+hHFwnYo5nbpH1kQ@mail.gmail.com>
	<CAK5mtezxAk8pdCohRV8R4VCTcc4OypTd29Gf6mzK1g7F+_0OMg@mail.gmail.com>
Date: Thu, 23 Jul 2015 13:30:30 -0300
Message-ID: <CAP9ODKp3d0tGGiVHDZmvmCiduh6xrC-bU14NteEKYpPRVOTkcw@mail.gmail.com>
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
X-List-Received-Date: Thu, 23 Jul 2015 16:30:33 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 23, 2015 at 12:05 PM, Victor Rodriguez <vm.rod25@gmail.com> wrote:
> On Wed, Jul 22, 2015 at 7:35 AM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> On Tue, Jul 21, 2015 at 11:57 AM, Victor Rodriguez <vm.rod25@gmail.com> wrote:
>>> Few weeks ago I was having some problems with open CV receipt. In the
>>> begining I toght I was adding opencv tro my core-image-minimal-xfce
>>> just with this:
>>>
>>> IMAGE_INSTALL_append = " gcc gcc-dev openssh php mariadb opencv"
>>>
>>> Now after booting the image I realize that none of the libraries for
>>> open stack were added to my image
>>>
>>> What I had to do was the following:
>>>
>>>
>>> IMAGE_INSTALL_append = " libopencv-core-dev libopencv-highgui-dev
>>> libopencv-imgproc-dev libopencv-objdetect-dev libopencv-ml-dev
>>> opencv-staticdev python-opencv"
>>>
>>> Even last night when one of the opencv developers ask me for python
>>> opencv I had to add the last part python-opencv. That is not cool at
>>> all . If I add opencv in the beginning I assume we are more than cool
>>> with that and yocto will add all the packages . Unless I am doing
>>> something wrong, in taht case I am more than happy to get the
>>> feedback.
>>>
>>> Thanks a lot for all the help . If someone else can reproduce this bug
>>> I am more than happy to report it in bugzila (not sure the URL)
>>
>> You should add the dev-pkgs and tools-sdk image features for the
>> image, not mangle it manually.
>
> I think the best solution is create a package group that will keep
> backward compatibility and aloud packages exist as expected

Sorry but this does not make sense. The image recipe you described is
not using the framework structure for this and this is the problem you
should address not bloat the oe-core itself.

Check core-image class for it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

