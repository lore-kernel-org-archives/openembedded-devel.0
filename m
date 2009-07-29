Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MW3Pu-0001zW-TI
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jul 2009 09:17:39 +0200
Received: by qyk35 with SMTP id 35so818663qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2009 00:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=itJUFWpZ9QijQxhNEM1eA2kg07GNV6c886m01xr0lBo=;
	b=pLDuDZGD1/zeqMhOyQOGRZwiu8xyM6paCdvRZ/+SEA4ikRipBGTy+BzGnHBZH5e4DW
	p/IbDFYIeL2xQnraqJGA4Uu3b0J7YZ8rbxZPC+d9t85MkeYOx6qVTrVtCc24YwXHX8+A
	OaJAGLZFnjIOkhsmTLmwme/kIRxprtbD+AM0s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=UOA23oMgea30UmiIbiLRFu4yNbraaJLcVj5Q6CtDmzxRWp63Z/LagBWl6MpbGS7WA0
	tUgTGhwn6yrWd4x5CBgm9shE/PEiFbIEgyD8ffIwvb/EuTMEYj0ZG3NY1Tc9LrfBVpZh
	APX9HWFgW441X62waoCupRLIJhndgXKnH8QrI=
MIME-Version: 1.0
Received: by 10.220.75.211 with SMTP id z19mr5563563vcj.43.1248850959383; Wed, 
	29 Jul 2009 00:02:39 -0700 (PDT)
In-Reply-To: <200907290614.40124.holger+oe@freyther.de>
References: <20090728072202.GA5422@gmail.com>
	<200907290614.40124.holger+oe@freyther.de>
Date: Wed, 29 Jul 2009 00:02:39 -0700
Message-ID: <19c1b8a90907290002i1a80a99fqfbb42128472f3299@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Adding TLS selection choice to metadata
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Jul 2009 07:17:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Tue, Jul 28, 2009 at 9:14 PM, Holger Hans Peter
Freyther<holger+oe@freyther.de> wrote:
> On Tuesday 28 July 2009 09:22:02 Khem Raj wrote:
>> Hi
>>
>> Enabling TLS support on uclibc/glibc is not sound enough in out build.
>> Reason is we depend upon various autotools tests to find out if the
>> software combination we chose can support it or not and these tests are not
>> doing the correct think many times.
>
> Have you seen the patch I sent? The title was
> [oe] [PATCH] gcc: Pass --enable-tls=no on uclibc builds...

I did however nptl/uclibc builds we need TLS support to be enabled
and there is no way to differentiate the triplets for a NPTL uclibc
toolchain from non NPTL toolchain. In future not all arches will get
NPTL support
on uclibc at once so we wil have few arches where NPTL will be there and
that will require TLS whereas others will use Linux Threads and will
have to disable TLS.

Thanks

-Khem

>
>
> z.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


