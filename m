Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Ptn2f-0006kM-SB
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Feb 2011 21:16:34 +0100
Received: by wyb38 with SMTP id 38so3046519wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Feb 2011 12:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=5CnCQFmaARdM+QDqxXLnQ7NR/Mdh+SN8Pub4iQjLOU4=;
	b=HRnCy4rPcnS8dOJclyt4yPVJMDrpYtQdVgHPgUPNmHD6g/Dj/bTC0FvUWAwmMCnARk
	agHp/OUrU0iIn5qPS6/tQeuUKj7F3ec0uZ7NjzBa9IGiy2oUVLqOOH0PxC3qYyCRGJ+R
	VKgIIeEOi4EryAMLrk4OG7ljHNL1B9pXJKQng=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	b=YWQYrpK50qTtjYdAMesOf8L5/xJmi7mbDGTalAzR7sJSKuKSM3LA44QsSX+J4oHu3q
	n4ahj/U3/W3t22Q/WSR5uS+iVhigPwCsIzqLdmQNw/BwZo9lv667/hEpjg+KDKSp8fIb
	9c2P0Cw/W/01imOEeCBb27SnvMq4t/WO5hiIA=
Received: by 10.216.162.84 with SMTP id x62mr3886753wek.106.1298837705218;
	Sun, 27 Feb 2011 12:15:05 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.246.11 with HTTP; Sun, 27 Feb 2011 12:14:45 -0800 (PST)
In-Reply-To: <4D6A6DFA.5040305@mwester.net>
References: <1298049536.11289.3126.camel@rex> <4D6A5FB2.4070604@cam.ac.uk>
	<4D6A6DFA.5040305@mwester.net>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 27 Feb 2011 13:14:45 -0700
X-Google-Sender-Auth: dS-Hzg_joZYtJ4Mlrg_IqPoRbWU
Message-ID: <AANLkTinKqrKRpQd=ALYjjGOLyWmWEOGZobsHrsHxQi_j@mail.gmail.com>
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
X-List-Received-Date: Sun, 27 Feb 2011 20:16:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 27, 2011 at 8:30 AM, Mike Westerhof <mike@mwester.net> wrote:
>> On 02/18/11 17:18, Richard Purdie wrote:
>>> Bitbake 1.12.0 has been released.
>>>
>>> http://prdownload.berlios.de/bitbake/bitbake-1.12.0.tar.gz
>
>>>
>>> This release has many cleanups and improvements to the bitbake core. Th=
e
>>> biggest and most user visible change is the parallel parsing work which
>>> is the driving reason for the release.
>>>
>>> A git log of the differences between 1.10 and 1.12 follows.
>>>
>> It's a dumb question, but what are the intended restrictions on python v=
ersion
>> for running bitbake? =C2=A01.10 seems to work fine with python2.7 wherea=
s I can
>> only get 1.12 to work with python2.6.
>
> Just to add another datapoint to the python version restrictions: it
> seems that bitbake 1.12 requires python 2.6.4 and fails with python
> 2.6.2 (which means that bitbake 1.12 doesn't work on Fedora 12 or earlier=
).

FYI, from some quick testing in a f12 chroot and creation of a test
case outside of bitbake, it appears we're hitting
http://bugs.python.org/issue5331, whose root cause is
http://bugs.python.org/issue5155, which refers to
http://bugs.python.org/issue5313.  Looking into this now, it's
possible we could replace the appropriate method of Process in our
subclass with the one with the fix.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


