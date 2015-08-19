Return-Path: <amit.k.chaudhuri@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0BD47608B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 09:13:58 +0000 (UTC)
Received: by obbwr7 with SMTP id wr7so5263175obb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 02:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ZTQ4ptKlV/U6/rNonjkCCzKdeb4yXsBUawPgg6EWhXs=;
	b=J1cdCLvb4nyMGhn+IZr85qWL4o9HLAKMQ2wnqFYKxlC+HDemaIYf1u8bEVt5Kz0g4y
	pzD89QvOaOZZsCMG8nbgi6N4Le+sopQW385Ix5183jXxfdV6WvfeF3dVRD69u1oovj4d
	5NFPzSfRdsT9l0/PO4Cezk/jHOhqJQib+kBgB+1lxDTkprk8mr4YBDE5//UUl5AGuR94
	oiOtTb6aqt82S/aHksI2UStha82eTHul6tXp6HpChpQmVbDDJWbpMsEQcgF8OWljGck9
	il8I5FESy0ONfiYbt1CUVhom09pZkcdh+UgsRu6sjlzwGBB2Aj01ght0eUNKIiE4NdCj
	/bvA==
MIME-Version: 1.0
X-Received: by 10.60.145.134 with SMTP id su6mr9666059oeb.22.1439975639001;
	Wed, 19 Aug 2015 02:13:59 -0700 (PDT)
Received: by 10.76.36.2 with HTTP; Wed, 19 Aug 2015 02:13:58 -0700 (PDT)
In-Reply-To: <119994489.EziVMMmOMT@peggleto-mobl.ger.corp.intel.com>
References: <CAH=VbNdYaP+Q7e0JduUG9i7i64hZjre3bPZLaWErhDXW1KHwTQ@mail.gmail.com>
	<119994489.EziVMMmOMT@peggleto-mobl.ger.corp.intel.com>
Date: Wed, 19 Aug 2015 10:13:58 +0100
Message-ID: <CAH=VbNd890jyqKBe-agXvSVnK2P+Vuy_+Vb9YN3qa05ex8MVqA@mail.gmail.com>
From: Amit Chaudhuri <amit.k.chaudhuri@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] inconsistency between autotests and ssh support
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
X-List-Received-Date: Wed, 19 Aug 2015 09:14:03 -0000
Content-Type: text/plain; charset=UTF-8

Hi Paul,

thanks for the pointer.

If I stumble across the doc reference I'll shout.

Amit

On Tue, Aug 18, 2015 at 1:39 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi Amit,
>
> On Tuesday 18 August 2015 09:34:44 Amit Chaudhuri wrote:
>> I am experimenting with tools-profile and qemux86 and qemuarm. Autotest
>> failures make me think there is an inconsistency in the recipes and
>> possibly also somewhere in the docs.
>>
>> I was under the impression (from docs?) that core-image-base would add ssh
>> support so I switched from core-image-minimal. Whether I was looking in the
>> wrong version of docs or not, the failure of the autotests makes me think
>> there is a problem. Examining the ssh log listed in the test output I can
>> see multiple "connection refused on port 22" messages" and there is clearly
>> no ssh server in the image. The test output shows that some tests are
>> indeed skipped because the system knows ssh is not present. But multiple
>> other tests are not skipped.
>>
>> Same experience on both qemuarm and qemux86.
>>
>> After greping to find ssh-server in a .bb file I switched again to
>> core-image-full-cmdline and am now able to ssh in. I still get an error
>> relating to something else, but ssh works fine.
>>
>> With fido version:
>>
>> meta              = "fido:6546771a502a09c63e33679be8784818be0ef93b"
>>
>> The main changes I have made are to local.conf where I have:
>>
>> MACHINE ??= "qemuarm"
>> ....
>> EXTRA_IMAGE_FEATURES = "dbg-pkgs tools-profile tools-debug debug-tweaks"
>
> Since you're already setting EXTRA_IMAGE_FEATURES, just add
> "ssh-server-dropbear" or "ssh-server-openssh" to its value and you'll have SSH
> server support no matter which image you build.
>
> I'm not sure where we'd have documented that core-image-base has an SSH server
> - at least I can't find such a reference.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

