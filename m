Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MWDbo-0002HH-Ro
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jul 2009 20:10:36 +0200
Received: by qyk35 with SMTP id 35so1284905qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2009 10:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=kDRMZczWX6USTzMTsURIq0II6CRAp73LMHqpiWb6188=;
	b=OknesjGMQkQzkf4wL9omcHAI9fqISWGqMqIjw6dchWc69W0jPjaZ46W9EFWjk6+kWE
	zjgn317xQ7YYspWrtA3D9mpEtc+Job9/M/Lb5vCNlkUmVt7fAgHeQKsVqWWoeVqrRPFv
	ukhII6OedE4/ZAyJ4vkyuKEFI1mb5uEhAGQag=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=er17f+Tl7ptgxzOWQ7Qq4UlK3hxvCPH6EAjxwvjTz5oMK6UWaczIY1nz0Y02LyRE3m
	geNZ4BdJy+HDhtnM3XLNGgfMCYIkm+Bjk4afEjKsSwPHYyLVW4tKUrEBE+he8KtvktP5
	XG9C2wEXlWb2GWkZlCSpIIxfTbfnVR/r3StCI=
MIME-Version: 1.0
Received: by 10.220.100.206 with SMTP id z14mr132177vcn.60.1248890138358; Wed, 
	29 Jul 2009 10:55:38 -0700 (PDT)
In-Reply-To: <200907290800.39598.holger+oe@freyther.de>
References: <20090728072202.GA5422@gmail.com>
	<200907290614.40124.holger+oe@freyther.de>
	<19c1b8a90907290002i1a80a99fqfbb42128472f3299@mail.gmail.com>
	<200907290800.39598.holger+oe@freyther.de>
Date: Wed, 29 Jul 2009 10:55:38 -0700
Message-ID: <19c1b8a90907291055n67d716dh60fba8f064d99932@mail.gmail.com>
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
X-List-Received-Date: Wed, 29 Jul 2009 18:10:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2009 at 11:00 PM, Holger Hans Peter
Freyther<holger+oe@freyther.de> wrote:
> On Wednesday 29 July 2009 09:02:39 Khem Raj wrote:
>> On Tue, Jul 28, 2009 at 9:14 PM, Holger Hans Peter
>>
>> Freyther<holger+oe@freyther.de> wrote:
>> > On Tuesday 28 July 2009 09:22:02 Khem Raj wrote:
>> >> Hi
>> >>
>> >> Enabling TLS support on uclibc/glibc is not sound enough in out build=
.
>> >> Reason is we depend upon various autotools tests to find out if the
>> >> software combination we chose can support it or not and these tests a=
re
>> >> not doing the correct think many times.
>> >
>> > Have you seen the patch I sent? The title was
>> > [oe] [PATCH] gcc: Pass --enable-tls=3Dno on uclibc builds...
>>
>> I did however nptl/uclibc builds we need TLS support to be enabled
>> and there is no way to differentiate the triplets for a NPTL uclibc
>> toolchain from non NPTL toolchain. In future not all arches will get
>> NPTL support
>> on uclibc at once so we wil have few arches where NPTL will be there and
>> that will require TLS whereas others will use Linux Threads and will
>> have to disable TLS.
>
> To cite my patch:
>
> +# The tls/ntpl support in uclibc is work in progress. For the current
> +# targets we should build gcc with --enable-tls=3Dno. In the future we
> +# might want to enable TLS for certain architectures and uclibc versions
> +# so this is why this method exists.
> +def get_gcc_uclibc_tls_setting(bb, d):
> + =C2=A0 =C2=A0return "--enable-tls=3Dno"
>
>

I was thinking of a case when say nptl is supported on mips
but someone still wants to build with linuxthreads. In your patch you
rely upon the target triplet to decide where to enable it and where
not to. a toolchain with nptl/uclibc or
lt/uclibc has same target triplet. So even for nptl
like uclibc_nptl.bb recipe we will have enable-tls=3Dno
which wont be the correct thing.

> we are basically talking about the same thing? e.g. with the proposed
> TARGET_TLS you would add a if to the above and return "". right?
>
> z.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


