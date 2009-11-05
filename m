Received: from [209.85.223.190] (helo=mail-iw0-f190.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N69F3-00087h-8Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 21:47:40 +0100
Received: by iwn28 with SMTP id 28so337746iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2009 12:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ImXyc0V5q18K+1lMgnQpzhrPY910cUENX12EMgjt1bM=;
	b=XnHS8yB5Nm4kwr9+bvVZ7C/v9DvaBK3bWBlztHoRv8aHYwlmoS+YdKxf+YDWmHKpXn
	eTifpCUd2gtMVf2lvBHwWa6iV1OPoynt1JjM1LBwWBmhxUkg8aidtTDbey+Sqoyru0MN
	INTvsQxN8gftC9FV4MDtN3wp5tkZAOKOB35t8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=RzFpYO5G0KO3rPxxnihBWqiz6eu9cfMQ4k3aGoBjhCO89ZCt0mzn8YUBNiNFiDhc7U
	vcxBKnVkFZl0BLGs9zVCoJXE4UXg5Ws/+07YCqOaGfSj9MFmiJsSMjsDuQNA9dnxoHrN
	0L7HO+TefloiREQukBVTdoBOO+hDCCkiWr7W0=
MIME-Version: 1.0
Received: by 10.231.25.29 with SMTP id x29mr2126381ibb.31.1257453983362; Thu, 
	05 Nov 2009 12:46:23 -0800 (PST)
In-Reply-To: <OF2F5C7F62.018E016D-ONC1257665.003B5352-C1257665.003B8C2E@cirsa.com>
References: <OFD304A523.BBE570B9-ONC1257665.002B2A2A-C1257665.002B8252@cirsa.com>
	<OF2F5C7F62.018E016D-ONC1257665.003B5352-C1257665.003B8C2E@cirsa.com>
Date: Thu, 5 Nov 2009 12:46:23 -0800
Message-ID: <19c1b8a90911051246p2d19eb49ne13fbb6bc138c6@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.190
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Problems building binutils-cross_2.18.50.0.7.bb
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
X-List-Received-Date: Thu, 05 Nov 2009 20:47:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2009 at 2:49 AM, jorge fernandez monteagudo
<jorgefm@cirsa.com> wrote:
>> >
>> > what version of gcc is installed on your build box ? My guess is that
>> >
> -isystem/mnt/hdb1/arm-beagle/angstrom-dev/staging/i686-linux/usr/include
>> > is causing trouble for you in the CFLAGS. IIRC there was some issue
>> > with gcc 4.2 where isystem mucked with compiler defaults and it did
>> > not search the default include paths correctly. =C2=A0You can build a =
local
>> > version of different gcc (say gcc 4.4) on your build box and install
>> > it and use to compile the cross and native packages.
>> >
>> > Thanks
>> >
>> > -Khem
>> >
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>> Yes, you're right. My gcc version is
>>
>> $ gcc --version
>> gcc (GCC) 4.2.2 20071128 (prerelease) (4.2.2-3.1mdv2008.0)
>> Copyright (C) 2007 Free Software Foundation, Inc.
>>
>> Is there some way to solve this without installing a new gcc ?
>>
>> Thanks!
>> Jorge
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> Khem, I get the same error with the gcc 4.3 !
>
> $ gcc --version
> gcc (GCC) 4.3 20070713 (experimental) (4.3-0.20070713.5mdv2008.0)
>
> What gcc version do you use to build oe ??

I use several of them. Closest to your I use is 4.2.4 (ubuntu) and
binutils-cross_2.18.50.0.7.bb built fine
with this on .dev

>
> regards,
> Jorge
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


