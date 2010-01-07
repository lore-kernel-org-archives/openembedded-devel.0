Received: from mail-yx0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NSz7V-0002P8-Dv
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 21:38:16 +0100
Received: by yxe1 with SMTP id 1so17452463yxe.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jan 2010 12:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=z/HCqtfvBPZnbrq2HAfSM/a6LPobvKqy4e2VIS1b1u0=;
	b=EhnLXep/Blujb8xfgoGWWw6vfSdlC1+8QR9LJKJ0852elVRIRwnEQPT/1J5UcLiQYW
	9yA5JTqwKAtgudld2FGkA1tTle2Olmwvr9pIdV+2SA1BfrxqPbIaaYCgxnAjqRDt9gHr
	HT9ks1rla2MygoIOVJaicx9M+HKZaWNxaern8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=qoZ+FoDAEiMJHKtlOzbRTWO2EklxMvAtG3F0ivq5q3LJiWx1Bf+Q4iVqYsACzJKawP
	Xx1kPQddp2y7ZEjwxWTSXPuwzX6s/g/VVcBrxDJpu3HyW2SuDukHNaL+NmW0zeCy1O95
	FwKptzvzHOBhzMDIadWoc00kZsX4caVwOFq18=
MIME-Version: 1.0
Received: by 10.101.181.32 with SMTP id i32mr1163026anp.7.1262896567576; Thu, 
	07 Jan 2010 12:36:07 -0800 (PST)
In-Reply-To: <1262891117.3218.16.camel@mattotaupa.wohnung.familie-menzel.net>
References: <1262649107.3238.44.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100105095147.GA3433@rhein.zuhause.netz>
	<1262694630.3209.10.camel@mattotaupa.wohnung.familie-menzel.net>
	<1262697909.3209.26.camel@mattotaupa.wohnung.familie-menzel.net>
	<1262891117.3218.16.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Thu, 7 Jan 2010 21:36:07 +0100
Message-ID: <ac9c93b11001071236j4aa675fbv39dca16009666339@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.171
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/1] Remove `-lintl` from `LIBS`. (was: [bitbake vdr] /arm-angstrom-linux-gnueabi/bin/ld: cannot find -lintl)
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
X-List-Received-Date: Thu, 07 Jan 2010 20:38:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/1/7 Paul Menzel <paulepanter@users.sourceforge.net>:
> Dear list,
>
>
> Am Dienstag, den 05.01.2010, 14:25 +0100 schrieb Paul Menzel:
>> Am Dienstag, den 05.01.2010, 13:30 +0100 schrieb Paul Menzel:
>> > Am Dienstag, den 05.01.2010, 10:51 +0100 schrieb Henning Heinold:
>> > > seems I forgot the depency. Will check them in later. This happens when one
>> > > done build vom clean oetmp.
>> >
>> > I merged your changes, did `bitbake -c clean vdr`, `bitbake vdr` and
>> > still get the same errors as yesterday/this night. I also tried `bitbake
>> > libintl` manually with no success.
>> >
>> > Is there something messed up with my setup?
>>
>> I tried to build another package with `virtual/libintl` in its `DEPENDS`
>> and after updating the whois recipe to a newer version (see patch some
>> minutes ago) `bitbake whois` succeeded.
>>
>> Is written yesterday, I do not really know what I am doing and how to
>> best approach to fix this problem. ;-)
>
> thanks to you all. Please review and commit the attached patch.
>
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
>
> (Is this needed for patchwork to pick this patch up or does it also look
> in the attachments?)
>
>
> Thanks,
>
> Paul

I've compiled without -lintl and it builds for me (with it would fail).
I've reviewed the patch and it looks ok to me. Didn't attempt to apply
it though.

Frans


