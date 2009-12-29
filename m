Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NPde2-00085A-Uj
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Dec 2009 16:06:02 +0100
Received: by fxm4 with SMTP id 4so9575070fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Dec 2009 07:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=D4f0QPEn7gx9+9WoJqzMmH3UhGZtopF8TQd3Obfy3PU=;
	b=JjQOReLuUNLqYIcqGXZ/paAQa9rtv0LdJXTzHoUQSUO/L8X/izfFOBvbvTuEwOpqEA
	JzBUgymW6ne92u24sIfO9cyZsoX34WDWjOl0EK7nTJzeBVMSMihm77ksvBqKE2Zrn5UG
	j9yP6pJaI4gT9/2Fc1iAgwPUP6TPUUAdI4+98=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=U2jEb7gRlLyWyDzBlVaM9ddtu7nG+ruA4GmDT1J6f736tGwxAxOjAQ/3l5IQ/Qr62b
	TP+8TZLoC7AzbpqlwJhiKQ42GxyfJRRpNP+SvTQgqhCuUG/K626PoSCWMfKE0y/eaJIB
	UxrvlAa5WJBXIyelE2jV+tmqdDUJjtKZybQ14=
MIME-Version: 1.0
Received: by 10.239.183.37 with SMTP id s37mr1793797hbg.90.1262099041110; Tue, 
	29 Dec 2009 07:04:01 -0800 (PST)
In-Reply-To: <1262040945.28755.270.camel@lenovo.internal.reciva.com>
References: <c384c5ea0912281419h3c14c675r8ec6d044c234a381@mail.gmail.com>
	<1262040945.28755.270.camel@lenovo.internal.reciva.com>
Date: Tue, 29 Dec 2009 16:04:01 +0100
Message-ID: <c384c5ea0912290704j1bbc52c4s25d7009fc880f3ac@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: helloworld image
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
X-List-Received-Date: Tue, 29 Dec 2009 15:06:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Phil,

On Mon, Dec 28, 2009 at 11:55 PM, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2009-12-28 at 23:19 +0100, Leon Woestenberg wrote:
>> when compiling my favorite minimal image ("helloworld-image") under
>> both the minimal-distro and angstrom
>> shows 4 MB of cruft being dragged in.
>>
>> What happened?
>>
>> I would like to start with nothing and then configure the system for
>> what I need.
>>
>> Should I start another more-minimal distro or can we change the
>> minimal distro to be truely minimalistic?
>
> It might be worth trying DISTRO=micro to see if that works any better
> for you.
>
Thanks for the suggestion.

Instead I would like to learn how is (wrongly) determined what goes
into the image.

This looks pretty definite to me, nothing should override the image
recipe on this one:

IMAGE_INSTALL = "helloworld"

Regards,
-- 
Leon


