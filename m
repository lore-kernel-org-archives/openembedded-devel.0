Received: from mail-px0-f197.google.com ([209.85.216.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NjzOg-0005Nr-2X
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 19:22:17 +0100
Received: by pxi35 with SMTP id 35so256614pxi.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 10:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=p2NWWrnhdKqZt//GYlwd07GGDXL0fN/9Fs37/rqAg68=;
	b=eAMjzsYnqxg04N0+GD4NQkwJkIw5ENV8sQbwIJwijSEodYbsGyX2+nUHAlMcPSXYLK
	RXUGrW2j3KARCFcSXbpmCTM+MPD9ZwiVa64KuQKmA/NMxIGiUjYsoNBdhqQJfm8sSHc2
	4HOU8x5wn3l96wpWNIBvsgMuxqTm/JTIqojHQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=apFss+fZu9bkw2K/KQxrLFINyGNFJgxhCt50vApcEIQFDjweOZoUdQtt+oqj1B8HFh
	Kuvzgld0xzLiCXh5v0uRnXXCPytRcf3NLpP30KSZa8ZBOSU8uZ0HZ2tmA2lGv0HNL/Kj
	dhdyGYd+TXFipQ4K5O5QaNoOOtTrBqZQYXOKA=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.210.17 with SMTP id i17mr3685568wfg.146.1266949161163; 
	Tue, 23 Feb 2010 10:19:21 -0800 (PST)
In-Reply-To: <19c1b8a91002231015l1847354cle068bda32347bd29@mail.gmail.com>
References: <mailman.3988.1266916925.14961.openembedded-devel@lists.openembedded.org>
	<4B83DC88.7070705@tycoelectronics.com>
	<19c1b8a91002231015l1847354cle068bda32347bd29@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 23 Feb 2010 11:19:01 -0700
X-Google-Sender-Auth: d6d39260ce22c724
Message-ID: <b6ebd0a51002231019h1d5f8b04q3af0b5300444ddc2@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.197
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Openembedded-devel Digest, Vol 43, Issue 98
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
X-List-Received-Date: Tue, 23 Feb 2010 18:22:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

It's worth noting here that TARGET_CC_ARCH +=3D "${LDFLAGS}" is a hack,
not an ideal solution.   The preferred way of solving this is
reviewing the buildsystem in question to determine how best to make it
obey all of our bitbake variables, rather than injecting one into
another that it happens to already obey.

On Tue, Feb 23, 2010 at 11:15 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Feb 23, 2010 at 5:47 AM, Jay Snyder
> <jay.snyder@tycoelectronics.com> wrote:
>>>
>>>
>>> try the following:
>>> TARGET_CC_ARCH +=3D "${LDFLAGS}"
>>> This should resolve your problems if you build your executable from
>>> within your OE buildsystem.
>>> In very rare cases (e.g. when you build some programs outside of OE
>>> but use OE to package all) it could be useful to use the following:
>>> INSANE_SKIP_objc =3D "True"
>>> AFAIK that sould not be commonly used, but it worked for me.
>>>
>>> majo
>>>
>>
>> Updating my GCC recipe with a "git pull" worked (the INSANE_SKIP_obj lin=
e
>> got added sometime recently).
>>
>> The TARGET_CC_ARCH +=3D "${LDFLAGS}" =C2=A0fix is the first thing that I=
 try when i
>> get this problem, and usually fixes it, although there are some packages
>> that required patching Makefile.ac files throughout the project.
>
> if you have a list of packages that would be helpful. Generally
> packages should respect
> LDFLAGS if they dont then probably they should be fixed.
>
> =C2=A0 =C2=A0 As I
>> just stated in another reply, when I get beyond the current project time
>> crunch (coming up on a release deadline), I will submit my recipe patche=
s
>> for inclusion in the OE git repository.
>
> Thats nice.
>
>>
>> Thanks,
>> Jay
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


