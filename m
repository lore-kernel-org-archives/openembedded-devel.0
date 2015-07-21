Return-Path: <vm.rod25@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1420873694
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 15:45:37 +0000 (UTC)
Received: by ietj16 with SMTP id j16so145751533iet.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 08:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jj1ftDqQopeR+T0eV5GcfVYqIbuDvf82zoo2XsRVoe4=;
	b=gfUSUWA7yaDZpwk17uzyhQpg6IMHpOQdBn4mKhO/OI5wiNjm8vLSeENn1XHTumXj89
	oF9RXU8RDFbZyw2UrxLMN/5uXbfMJ+qDYhg2rDLR3SjJT18aK3ukW6FaUb9risemZIS6
	AmZ0S+vhmy/TLUcP0yoWVWNPjt30GWevFF0bde4sFiV/Awu5JfWOcFDTY9ulsN5YVJBO
	U3vreWF9TM8oq7coDNDDWGtyzhV2PgnXUeSnXEDy/ScCphNLMNtH85lnla3dq2A5xYZk
	Jfv/N3UOVERhbSEutpa3LSj5hOnsORcXBMpovj+JHhC4WgYGgfdkt6TPtDjl3q8L3OOr
	nDCQ==
MIME-Version: 1.0
X-Received: by 10.50.30.196 with SMTP id u4mr25148714igh.11.1437493537767;
	Tue, 21 Jul 2015 08:45:37 -0700 (PDT)
Received: by 10.50.141.228 with HTTP; Tue, 21 Jul 2015 08:45:37 -0700 (PDT)
In-Reply-To: <55AE6705.5040907@mlbassoc.com>
References: <CAK5mtexdmYF7ivs+nwa7WZSqVb8sZCq5Euvt8oK2HimiXy7PMA@mail.gmail.com>
	<55AE6705.5040907@mlbassoc.com>
Date: Tue, 21 Jul 2015 10:45:37 -0500
Message-ID: <CAK5mtex-n4XrVXG18zG=ha_+R1-Z5Yh6TKLWudt1CVpXpUHokQ@mail.gmail.com>
From: Victor Rodriguez <vm.rod25@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>
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
X-List-Received-Date: Tue, 21 Jul 2015 15:45:42 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 21, 2015 at 10:36 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2015-07-21 09:26, Victor Rodriguez wrote:
>>
>> Hi team
>>
>> I have a question , according to documentation there is a difference
>> between
>>
>> IMAGE_INSTALL_append
>>
>> and
>>
>> CORE_IMAGE_EXTRA_INSTALL
>>
>> Specifies the list of packages to be added to the image. You should
>> only set this variable in the local.conf configuration file found in
>> the Build Directory.
>>
>> When I use the second one and try to build a core-image-minimal-xfce
>> bitbake does not install what I wanted in my image . I had a really
>> hard time few weekends ago because of this.
>>
>> I wonder If I am missing something or if this is a bug
>
>
> The core-image-minimal-xfce recipe does not "play nice" with
> the core-image class and is not respecting CORE_IMAGE_EXTRA_INSTALL.
>
> I think this should be filed as a bug (and feel free to suggest a patch)
>
> BTW, this question should really be on the OpenEmbedded development list.


Thanks Gary

I will submit the BUG , do you know the Bugzila where I should submit it ?

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

