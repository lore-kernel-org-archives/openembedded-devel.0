Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0E4DF763F2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 20:09:48 +0000 (UTC)
Received: by igbdj2 with SMTP id dj2so38827851igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 13:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=gyyyscmChO2NUr7enFLDfIqz7u6tQAK6D01ROkOJPDk=;
	b=z2vvDVkfNiJMfdAK1rZ1XMOaiQXCUCp7y8JEHkXnwWVt9xKeNNiqz95Yhm4DiVykJ6
	FA/t33qm3uLNTMIimPHdmRWSLnxLTVe1wi0POkLQGdz5gCoq6v6dFF0zBMtRbZ+A2i5C
	vCjgeNWNHv1QcXIA+f6FTWN3fKu0KjN/JLNHpU/1SAiIp52WnMeZF1XTBIEe4XorXHEt
	/OOJ7XCTjY2uGYT5SwUbNINiJ7mbIbf4B/ec3qKKfZ2//L90FsTBCxb/3qafBoDzsIhk
	hrEfIYMnFiroS/gb3Q+Y8jZgMyvYf7bFgfwiREBlEhwv71FUVP0SQUr4HAotdO6xypa4
	Uwlw==
X-Received: by 10.50.141.136 with SMTP id ro8mr6311138igb.11.1446149388781;
	Thu, 29 Oct 2015 13:09:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Thu, 29 Oct 2015 13:09:19 -0700 (PDT)
In-Reply-To: <CANx9H-BLJNKouUAidFAfMmTEQ3mtL34Hp+zCZQHm7WZuB1wOJg@mail.gmail.com>
References: <9D79B6D4-2FE1-4C77-A359-C0F47DCC090D@gmail.com>
	<1446137120.5251.111.camel@pbcl.net>
	<CANx9H-BLJNKouUAidFAfMmTEQ3mtL34Hp+zCZQHm7WZuB1wOJg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Oct 2015 13:09:19 -0700
Message-ID: <CAMKF1sq0Xz74tUMyHvpjq6iOrtRjbFdV7u6XtenoCXTq__fYzw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] State of libcs in OE-Core glibc/uclibc/musl
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
X-List-Received-Date: Thu, 29 Oct 2015 20:09:49 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 29, 2015 at 10:01 AM, Tim Orling <ticotimo@gmail.com> wrote:
> On Thu, Oct 29, 2015 at 9:45 AM, Phil Blundell <pb@pbcl.net> wrote:
>
>> On Thu, 2015-10-29 at 08:42 -0700, Khem Raj wrote:
>>
>> > I would like to make a proposal for 2.1 release where
>> >
>> > 1. Drop kconfig support in glibc and we become inline with upstream
>> > 2. Move musl support to OE-Core from meta-musl
>> > 3. Drop uclibc or leave it in current broken state, I would like to
>> > pull it out into a layer in meta-openembedded and we can leave the
>> > core plumbing as it is in OE-Core
>> > 4. Poky-tiny switches to use musl
>>
>
> In the past we have had issues with iconv support when using musl. Any
> experience good or bad with that?

it has got a lot better in locale area off late. I dont know what
issues you were facing though.

> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

