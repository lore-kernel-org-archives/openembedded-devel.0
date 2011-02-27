Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Ptovw-0006rW-Qw
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Feb 2011 23:17:44 +0100
Received: by wyb38 with SMTP id 38so3096980wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Feb 2011 14:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=hgbW5/0iFZM+Aw+8W5aNy2nMXL3OchLl2WhJQPNx1lM=;
	b=GEtAHR8E0V3dmXKYkfUx1jq8VnHJ+UW3swyA20cucZPWThjB5s/czsVcJHqtJxzaIB
	X7zvl8LuHLAL0c95L/+t8ngaGaTNnnP9/3mpJ843Wiu7kGSz71ag9gR4mw9cOwe76/vE
	rSukctWag9OAP/4UZJz+0MQdE0+0oby4eRHsQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	b=MSeytigB4cXT2AuT8Y20skSclTmkeLhc4i7ryQyTY8MzOnEr4g6nfek+/PrLuMb5UE
	PPI0wa7vlLuFBGEYWiKQoppdDK2STFlPo3xS5pRPqdUkJY/Jsh7KJZzgi2CfImqB8dY8
	dllTgzhVfaNiGjHoqNJCXPbvQmAfXMf/dCOuE=
Received: by 10.216.241.11 with SMTP id f11mr1542269wer.76.1298844977221; Sun,
	27 Feb 2011 14:16:17 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.246.11 with HTTP; Sun, 27 Feb 2011 14:15:57 -0800 (PST)
In-Reply-To: <AANLkTinKqrKRpQd=ALYjjGOLyWmWEOGZobsHrsHxQi_j@mail.gmail.com>
References: <1298049536.11289.3126.camel@rex> <4D6A5FB2.4070604@cam.ac.uk>
	<4D6A6DFA.5040305@mwester.net>
	<AANLkTinKqrKRpQd=ALYjjGOLyWmWEOGZobsHrsHxQi_j@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 27 Feb 2011 15:15:57 -0700
X-Google-Sender-Auth: MP4V6B0J7jK22W7wS4W_KS13x9Y
Message-ID: <AANLkTimUqDu1nptPT9CrKrA5f8AHg3=V2OPNR2ne4ZgY@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: Bitbake 1.12.0 released!
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
X-List-Received-Date: Sun, 27 Feb 2011 22:17:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 27, 2011 at 1:14 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Sun, Feb 27, 2011 at 8:30 AM, Mike Westerhof <mike@mwester.net> wrote:
>>> On 02/18/11 17:18, Richard Purdie wrote:
>>>> Bitbake 1.12.0 has been released.
>>>>
>>>> http://prdownload.berlios.de/bitbake/bitbake-1.12.0.tar.gz
>>
>>>>
>>>> This release has many cleanups and improvements to the bitbake core. T=
he
>>>> biggest and most user visible change is the parallel parsing work whic=
h
>>>> is the driving reason for the release.
>>>>
>>>> A git log of the differences between 1.10 and 1.12 follows.
>>>>
>>> It's a dumb question, but what are the intended restrictions on python =
version
>>> for running bitbake? =C2=A01.10 seems to work fine with python2.7 where=
as I can
>>> only get 1.12 to work with python2.6.
>>
>> Just to add another datapoint to the python version restrictions: it
>> seems that bitbake 1.12 requires python 2.6.4 and fails with python
>> 2.6.2 (which means that bitbake 1.12 doesn't work on Fedora 12 or earlie=
r).
>
> FYI, from some quick testing in a f12 chroot and creation of a test
> case outside of bitbake, it appears we're hitting
> http://bugs.python.org/issue5331, whose root cause is
> http://bugs.python.org/issue5155, which refers to
> http://bugs.python.org/issue5313. =C2=A0Looking into this now, it's
> possible we could replace the appropriate method of Process in our
> subclass with the one with the fix.

https://github.com/kergoth/bitbake/compare/master...f12-hang
https://github.com/kergoth/bitbake/commit/12d9095

This fixes the parsing hang on Fedora 12 for me.  Note that I'm not
sure about the version check.  We could just use this version of
_bootstrap all the time, but I'd rather avoid this for future
versions, as we could miss fixes.  We should determine if this fix was
in python 2.6.3.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


