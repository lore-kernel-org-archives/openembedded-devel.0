Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id EECAB77194
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 18:48:13 +0000 (UTC)
Received: by igcph11 with SMTP id ph11so78189002igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 10:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=LDa4ObT+y1PsYrBPgHgr+l5HKOevKtwEQgWz/W5eruk=;
	b=zu9Xf4qBqxuhmBxbgMX1WpSTd8BF3lx1gkyUReOYVPORwlw5RTgYObqn7vzpdAHPjp
	j9Ivj/4Upa1JTKjMTMbB2WMZOmkb6GapW76gekMYKz/naky8ko+G4QI0U/ozgN5bSXgF
	IzADB/igUDdIwgtjtk1iJbqfNx16NxZl8iqQX2pP/nxTzsa73+pUuccxHqezdRK8YGl0
	ki8uqeJvoHHGDTM8Hid+x6tevuQlhaJ2/tnZaiViTDWZOAi0ntr2BPPWP5QihQDY8v1X
	fLe0zaZpNGrnWP6dJHckqbNUpJjFPDUInn7W5Er8s9KoYsaGBlKMjMDyb8OjDNgPSIwi
	QkwA==
X-Received: by 10.50.152.72 with SMTP id uw8mr13741552igb.11.1447267693467;
	Wed, 11 Nov 2015 10:48:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Wed, 11 Nov 2015 10:47:44 -0800 (PST)
In-Reply-To: <B3996A75-A243-4E48-9318-C1730ED9141B@gmail.com>
References: <A3005F6B-2993-4BA5-9406-D411C19FA636@gmail.com>
	<CABcZANnTbE-6KgFxaNr2p-ruzt3TKQ0jc2VR6-8fhJ-MmGcpZQ@mail.gmail.com>
	<B2ABFB12-3EF3-4008-94A1-A6390986AAFB@gmail.com>
	<88DAE25B-BAA9-4F99-B404-71D2D2973BBD@gmail.com>
	<4E8196B8-4770-41B9-B80A-3A9A911087D3@gmail.com>
	<CAMKF1sp8SrFpqeY4iD-juwPv6y2y5f4ZDisPU9LiCUuUXDWhqA@mail.gmail.com>
	<7F78FF81-F48C-45D0-9F1A-2D719A20CC48@gmail.com>
	<CAMKF1srTimQy2RtDk+=nnA7p+jC80u0eBTd9_v+9_FLfWt0MPA@mail.gmail.com>
	<B3996A75-A243-4E48-9318-C1730ED9141B@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Nov 2015 10:47:44 -0800
Message-ID: <CAMKF1sqPitU4ZUXZ--qyefnesyu2SqZQvbRGMCG1RRP+BOmw0w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: =?UTF-8?Q?Volker_M=C3=B6sker?= <volker.moesker@rademacher.de>,
	Tobias Theophile <Tobias.Theophile@rademacher.de>
Subject: Re: [meta-oe][PATCH 1/3] samba: fix dependencies and QA issues
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
X-List-Received-Date: Wed, 11 Nov 2015 18:48:14 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 11, 2015 at 10:20 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>
>> Am 11.11.2015 um 19:07 schrieb Khem Raj <raj.khem@gmail.com>:
>>
>> On Wed, Nov 11, 2015 at 8:37 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>>>
>>> grep remains silent regarding DISTRO_FEATURES and linuxstdbase :(
>>
>> right, its a OVERRIDE so you can do something like
>>
>> foo_linuxstdbase = .....
>
> And? That's why? ...
>
> I still don't get your initial argument why the PACKAGEOPTION shall not be named lsb,
> when init support based on lsb is added by it.

my only ask was that if I have linuxstdbase in overrides then I should
get lsb behaviour enabled for this package automatically weather its
PACKAGRECONFIG or not. and similarly disabled when I dont have it in
my distro overrides

>
> Best regards
> --
> Jens Rehsack - rehsack@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

