Return-Path: <rcagley@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 431F665D37
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Apr 2014 19:46:34 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id f73so2098303yha.15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Apr 2014 12:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=s1eRl43gfWqqiZ5XNxDnWoLaaOMXbYJKFisfNFTlMbs=;
	b=YVpvi6EcZXH3SGoMIT8vNQxZJcDdUSFfSDCxmnmw9ZU80N+zdNhIEhmEvkcp01qXJK
	meSxyfEkSnRzRK/99xbd35SO/aZOrPLU2dYRgRxBFPU/O/olwFqSYpCuS/ipjOkS4VX7
	zIQohDI107h8eGstWMOiyaO6pgpYY3SZXjMRlmKLjT1zSyEWX1uJr1kmIeLf77HJ0dy8
	Gs2ptj/FdaWq2GS5DUJ9BBZ3o/M+zq6FvBExzRLbZRHTXK53X+OEilcye7DXSY8oGkVK
	QKmIOi4rM0jVb6B7jPf2L2FYC5Fbr5WGQhZdesKSzDJEQDZpYnIx2Jn1dgKPjTRXv6Kt
	h/8g==
MIME-Version: 1.0
X-Received: by 10.236.97.102 with SMTP id s66mr32433400yhf.45.1398627994996;
	Sun, 27 Apr 2014 12:46:34 -0700 (PDT)
Received: by 10.170.143.196 with HTTP; Sun, 27 Apr 2014 12:46:34 -0700 (PDT)
In-Reply-To: <CAN-NoH2zv8HtC8O3G-7KXJk1odd-agcye9h89SPGcYy6r1XHEw@mail.gmail.com>
References: <CAN-NoH3n=jjiSUou_drXk1xSD8rrKymWXiERgoHEeyus2LCz+A@mail.gmail.com>
	<20140425235627.GA2486@jama>
	<CAN-NoH3eEb1x-XYt8aNDJm_s5DmLq_C_YyvkiskR8jp2n0uqRQ@mail.gmail.com>
	<CAFeBWL7qqCRw2rdJT41KvmOc9wHneaCrYE0oP=Go-o_FoXJ8GQ@mail.gmail.com>
	<CAN-NoH2zv8HtC8O3G-7KXJk1odd-agcye9h89SPGcYy6r1XHEw@mail.gmail.com>
Date: Sun, 27 Apr 2014 12:46:34 -0700
Message-ID: <CAN-NoH2PsEqtvUg+hDf6XqAEzogxneXXb2Pdc73VEAsgu+sFkQ@mail.gmail.com>
From: Richard Cagley <rcagley@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: v4l-utils won't build
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
X-List-Received-Date: Sun, 27 Apr 2014 19:46:35 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 25, 2014 at 7:06 PM, Richard Cagley <rcagley@gmail.com> wrote:

> On Fri, Apr 25, 2014 at 5:40 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
>
>> which branch are you on? I am on master-next for OE and on Daisy on Poky.
>> Both opencv and v4l-utils build ok.
>>
>> Adam
>>
>> I don't know is probably a bad answer. Here's what I do:
>
> git clone git://git.openembedded.org/bitbake
> git clone git://github.com/openembedded/oe-core.git
> git clone git://github.com/openembedded/meta-oe
> cd oe-core
> . ./oe-init-build-env ../build ../bitbake
>
> add in the meta-oe layer to bblayers
>
> bitbake core-image-minimal
> bitbake opencv
>
> then it fails
>

you're right. if I use the daisy branch of oe-core and master-next of
meta-oe does seem to build fine.

