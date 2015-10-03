Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id C83D3770F6
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Oct 2015 22:55:50 +0000 (UTC)
Received: by ioii196 with SMTP id i196so152906954ioi.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Oct 2015 15:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Nj1SwtkOg8f/4ZTWlI4HzYVVRSE319FaISPkHB6UGBQ=;
	b=yvU4TFnmE0cexvtIqWk7o8x099djQwwHQDgT/R8W+2x0tiJvwKd4K+WCBscKNfUape
	KfCCWtQbCFhzpYI02bI/hFYLkwslYulFqBoQBc/gz8tSIMf0kzMeAXE0IsAFZnhC8ztF
	++1tVnq84lB9qPVNDdYuUJ/jiRFo2TiKbeLNsqjlfe7yXUx9mLFibmHesmm/ivnBqqW0
	ONZbGw6xvnEv2+pe4bCNTXkdhzO78dSgFtuZvxDTfLpRRQyr4dBg/034KXkbYXWaU+g6
	h28S90MaG5ydapIm2X5SBSnEUjz5mlQRpvnlG9YqnBqzkZQCqhz2SGeHuUGbQ/eWQIua
	A0gw==
X-Received: by 10.107.34.149 with SMTP id i143mr25879476ioi.195.1443912950230; 
	Sat, 03 Oct 2015 15:55:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Sat, 3 Oct 2015 15:55:20 -0700 (PDT)
In-Reply-To: <1443911675.32723.0.camel@gnu.org>
References: <1443902125-30247-1-git-send-email-raj.khem@gmail.com>
	<1443902125-30247-2-git-send-email-raj.khem@gmail.com>
	<1443911675.32723.0.camel@gnu.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Oct 2015 15:55:20 -0700
Message-ID: <CAMKF1sqRPnuOBgnW7_gCn_ry7iLAg2OYF4FKJh0iBN=ndCqnDw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 2/2] libnetfilter: Avoid using VLAs
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
X-List-Received-Date: Sat, 03 Oct 2015 22:55:51 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 3, 2015 at 3:34 PM, Phil Blundell <philb@gnu.org> wrote:
> On Sat, 2015-10-03 at 12:55 -0700, Khem Raj wrote:
>> VLAs in non POD data types like structures and unions
>> are not a standard feature of C language and gcc has specific
>> implementation which other compilers dont have specifically clang, and
>> they refuse to implement it since its non standard.
>
> The reference to "POD" here is a bit confusing.  By the generally
> accepted meaning of the term, structs and unions would in fact be POD
> just like any other C type.  But you seem to be using the term here to
> mean something along the lines of "non-aggregate type", which isn't a
> usage I've previously encountered.
>
> This is particularly confusing in this context because there is a
> different clang limitation which applies to VLAs where the
> variable-length element is not POD, irrespective of whether it is inside
> an aggregate or not, and someone reading your comment might be misled
> into thinking that this was the issue here.

Yes, infact I should have said composite data types instead of non-POD
data types. I will send a v2 which should
clear this confusion.

> p.
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

