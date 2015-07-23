Return-Path: <vm.rod25@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id C683B7623E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 20:28:43 +0000 (UTC)
Received: by igr7 with SMTP id 7so364703igr.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 13:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=EPKV/LtYh9mTHlcFCfilbkxD3Ys9yVDBDpReppQJq2o=;
	b=nR78e/DfY2v7pz3XSt66vPMBq7sM3XVZQYXBP73en6vqtveMziv847Mv72ucTlhW8E
	uZJ86Whgm6AxV5D4v1XWsKHgw/4O5z7GEb+jE2s+rLm7niw56DlrRXpsFkim77cQst2L
	SuhfnYEhU9CYHStrzhZffoO7ZLQhgE2oXkC5qQ0lmCzypyd934yjkxFvp8yqiMAzfsFl
	BdebxzMdVdhlC2/I/vWVt0okMODhmfdDbAEgyEGnc6LZNzSc9+aJgfn71WguCGh5dCcX
	n4Xd3jS7KFCp85FuYSwHOYx4e+e16TzrIRahOFsAZ5XIsVQNtQzn6EBqAwh/ltyGjRpc
	GHpQ==
MIME-Version: 1.0
X-Received: by 10.107.166.72 with SMTP id p69mr16823885ioe.65.1437683323325;
	Thu, 23 Jul 2015 13:28:43 -0700 (PDT)
Received: by 10.50.141.228 with HTTP; Thu, 23 Jul 2015 13:28:43 -0700 (PDT)
In-Reply-To: <3048124.JhGOlONExd@peggleto-mobl.ger.corp.intel.com>
References: <CAK5mtexdmYF7ivs+nwa7WZSqVb8sZCq5Euvt8oK2HimiXy7PMA@mail.gmail.com>
	<55AE8445.60302@linux.intel.com>
	<CAK5mtexxVJ2uZeahegoJ=+8pOztcPufUHYmXWrhwy9hMzc3tLw@mail.gmail.com>
	<3048124.JhGOlONExd@peggleto-mobl.ger.corp.intel.com>
Date: Thu, 23 Jul 2015 15:28:43 -0500
Message-ID: <CAK5mtezCMOyUvN9y8ds4heV-p2AN5Ndv5F-gic3BY0TKDP3sKg@mail.gmail.com>
From: Victor Rodriguez <vm.rod25@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Gary Thomas <gary@mlbassoc.com>,
	Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
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
X-List-Received-Date: Thu, 23 Jul 2015 20:28:44 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 22, 2015 at 8:50 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Tuesday 21 July 2015 14:51:55 Victor Rodriguez wrote:
>> On Tue, Jul 21, 2015 at 12:41 PM, Leonardo Sandoval
>>
>> <leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>> > On 07/21/2015 10:45 AM, Victor Rodriguez wrote:
>> >> On Tue, Jul 21, 2015 at 10:36 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>> >>> On 2015-07-21 09:26, Victor Rodriguez wrote:
>> >>>> Hi team
>> >>>>
>> >>>> I have a question , according to documentation there is a difference
>> >>>> between
>> >>>>
>> >>>> IMAGE_INSTALL_append
>> >>>>
>> >>>> and
>> >>>>
>> >>>> CORE_IMAGE_EXTRA_INSTALL
>> >>>>
>> >>>> Specifies the list of packages to be added to the image. You should
>> >>>> only set this variable in the local.conf configuration file found in
>> >>>> the Build Directory.
>> >>>>
>> >>>> When I use the second one and try to build a core-image-minimal-xfce
>> >>>> bitbake does not install what I wanted in my image . I had a really
>> >>>> hard time few weekends ago because of this.
>> >>>>
>> >>>> I wonder If I am missing something or if this is a bug
>> >>>
>> >>> The core-image-minimal-xfce recipe does not "play nice" with
>> >>> the core-image class and is not respecting CORE_IMAGE_EXTRA_INSTALL.
>> >>>
>> >>> I think this should be filed as a bug (and feel free to suggest a patch)
>> >>>
>> >>> BTW, this question should really be on the OpenEmbedded development
>> >>> list.
>> >>
>> >> Thanks Gary
>> >>
>> >> I will submit the BUG , do you know the Bugzila where I should submit it
>> >> ?
>> >
>> > Victor, you can file a bug at https://bugzilla.yoctoproject.org
>>
>> I think we have one already
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7616
>
> That's not the right bug.
>
> If the suggestion is that core-image-minimal-xfce needs to be fixed, that's not
> a bug we would track in the Yocto Project bugzilla (since the Yocto Project is
> not actively involved in maintaining meta-xfce).
>
> Cheers,
> Paul

Hi Paul

Where can I track this ?


> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

