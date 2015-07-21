Return-Path: <vm.rod25@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id B75FD6013D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 20:50:26 +0000 (UTC)
Received: by igvi1 with SMTP id i1so113017026igv.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 13:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=1w8lsTaxSEsCb8TnMG8mPmLL5jgQpFSx4PF32Wc0+9g=;
	b=yEzCt5olElIvBHi6uGPBaxR/yLz1ezTKsNs6xE3N4aikSQlNfdUqaAZTP4GQUu+KjR
	fLXNwkd8oGTcawFs8JWQJQkitpD4HDaOTW3hVu5MGTElmx/65aLVA8Q/nPyGyi9UUJc9
	6sQvQf+XErw4+AtDw4TLYlMXyeh8rMCAP8BI1jUZNGL6gppen2Df5tq2l6fxVFranvNN
	bQkLy9U8J/wwc01nB8LZyTyAnnbhWE0CTKGaxQs6dg0irOQlZvSSQs44ftR/L19/uQNL
	4rwIX9W0wQEtEQ3E3pA143p5nfAkEjVetHEphUsaDWzneHtyZ0Zc9+XucMcnb1it2O4U
	LoFg==
MIME-Version: 1.0
X-Received: by 10.107.166.72 with SMTP id p69mr54273582ioe.65.1437511826838;
	Tue, 21 Jul 2015 13:50:26 -0700 (PDT)
Received: by 10.50.141.228 with HTTP; Tue, 21 Jul 2015 13:50:26 -0700 (PDT)
In-Reply-To: <55AEB069.80005@linux.intel.com>
References: <CAK5mtexxdYxhwvv-MB27Ur56iwAV8O3Y6ah_BPAo+R58NmNouQ@mail.gmail.com>
	<55AEB069.80005@linux.intel.com>
Date: Tue, 21 Jul 2015 15:50:26 -0500
Message-ID: <CAK5mtextp+RKCnc+rKyEZ0AyKu+xH7ZvVTiUnAvZTuaK2V5TBg@mail.gmail.com>
From: Victor Rodriguez <vm.rod25@gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 21 Jul 2015 20:50:29 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 21, 2015 at 3:49 PM, Leonardo Sandoval
<leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>
>
> On 07/21/2015 09:57 AM, Victor Rodriguez wrote:
>>
>> Hi team
>>
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
>
> A recipe can produce several packages. As I can see on opencv recipe, it can
> produced the following ones:
>
> PACKAGES="opencv-staticdev opencv-dev opencv-dbg opencv-doc opencv
> opencv-apps python-opencv"
>
> and dynamic ones (depending on what else you have install)
>
> PACKAGES_DYNAMIC="^opencv-locale-.* ^libopencv-.*"
>
> For the opencv case, it happens that the package opencv is empty, so you
> need to append the other sub-packages it produces into your IMAGE_INSTALL
> variable.
>
> So, it is not a bug, this is expected.
>

In my humble opinion this should change for OpenCV. But I would love
to hear the feedback from others

>
>> Even last night when one of the opencv developers ask me for python
>> opencv I had to add the last part python-opencv. That is not cool at
>> all . If I add opencv in the beginning I assume we are more than cool
>> with that and yocto will add all the packages . Unless I am doing
>> something wrong, in taht case I am more than happy to get the
>> feedback.
>>
>> Thanks a lot for all the help . If someone else can reproduce this bug
>> I am more than happy to report it in bugzila (not sure the URL)
>>
>> Hope it helps to cut the time of some others
>>
>> Best regards
>>
>> Victor Rodriguez
>>
>

