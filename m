Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 84699609C0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Aug 2014 14:23:25 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id c1so10435375igq.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Aug 2014 07:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=VlfMyUoSdndJH6VfJyDKFaYDdjhU1FarQqpyC3scbEQ=;
	b=uOrOb+i08QyiKoYxznRzHyWIHWphekhB+7xVgghBJ6vV2+sMDo4zTgHrVbnwlELC9x
	5ISevbeG+DIQwcFOtsRyGOMG738408TPbP002uJjgtzu3rKFDJ07FaWvlu8dg1hlit95
	quAcunw8GMz0AyMmCL1y1w4RhDnBhY6lnNnFKWhVqpKEBuPgKpgkQ/IkuWl9Tcx2smgq
	Z1poEnOIaxtWZ3vAlhwzfdSBEgQPNBHFQSs46KExoDh3Z5Pam7xp8oIPjBKS05vDq+9O
	ooocp2IGsBo56AcHtHmLKwwQi8PBvBGhta7t5jQyrcAiSBDYY9esJ5mZIf6DyD6xW7wE
	KbTA==
X-Received: by 10.50.25.71 with SMTP id a7mr68755223igg.17.1407421406239; Thu,
	07 Aug 2014 07:23:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.126.103 with HTTP; Thu, 7 Aug 2014 07:22:56 -0700 (PDT)
In-Reply-To: <53e32a94.c2d3440a.4f81.2eb2SMTPIN_ADDED_BROKEN@mx.google.com>
References: <53e32a94.c2d3440a.4f81.2eb2SMTPIN_ADDED_BROKEN@mx.google.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Aug 2014 07:22:56 -0700
Message-ID: <CAMKF1sptdCmisDJ4Scf5WekXU0krruj24n4xBsJtq3VDHzVG=Q@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Problem with YOCTO
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
X-List-Received-Date: Thu, 07 Aug 2014 14:23:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 7, 2014 at 12:27 AM, Himanshu  Pandey
<pandey_himanshu80@rediffmail.com> wrote:
> I have an issue with Yocto:
>
> Suppose I am compiling a package say X that has a dependency on package Y=
 and Z. Now in my receipe I have included Y and Z with DEPENDS flag. So as =
far as I know first Y &amp; Z will be compiled and installed and then X wil=
l be compiled. But unfortunately that is not happening in my case &amp; I d=
on't understand why?

Can you check if DEPENDS flag is not being dropped somehow in your
recipe ?. if possible share the recipe here so folks can see.

>
> For every dependent package I have to manually compile and install it's d=
ependencies then only my package gets compiled.

this should not be needed


 This is the biggest issue I am facing with YOCTO.
>
> Please somebody help me to resolve this issue.&nbsp;
>

