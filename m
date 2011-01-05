Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PaTmT-0005Gh-Dn
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 14:52:02 +0100
Received: by iyj18 with SMTP id 18so14626063iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 05:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=2GnETMX7jgqliePjunjyel/wfnlHhfZxarpddCzRmCU=;
	b=xhwSZfxSAe8fyvKgf+GaBsmzeDRzLEu8nAvdjzNI+trSrfxdGDSJiTzVE71cFSl26z
	/FGk21iNan1ccopKr+rK/p55nwbY4WZ8Ou7hrjlaIWYSbLzH3w9LoTg0Zw2qj1r1Rr4m
	IiDiWDb+i8S2hP1oRwn9HvhaE1s0PWVFIO2jk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=R6WNQiEnGZbbGzL6a3eLCf5vXwxJ8H7z1m7ftjuPyTtc/0LHcJBha14jRlu22c9qbV
	NnAxVK9tYVyCb9r4xyrIi81LDBRfhkIeu8fE/n1gMXILnj3nOOvCRoNM5zAa8rTGlhZm
	cnb+qptrEOwl8RRRxd0IWTBQztUgDMeaXL8rc=
MIME-Version: 1.0
Received: by 10.231.14.74 with SMTP id f10mr23452936iba.119.1294235495819;
	Wed, 05 Jan 2011 05:51:35 -0800 (PST)
Received: by 10.231.38.11 with HTTP; Wed, 5 Jan 2011 05:51:35 -0800 (PST)
In-Reply-To: <201101051252.07668.marcin@juszkiewicz.com.pl>
References: <AANLkTink9h1dkjww1+Vi3arnTagSF2yCwygSHnPLcTdU@mail.gmail.com>
	<201101051252.07668.marcin@juszkiewicz.com.pl>
Date: Wed, 5 Jan 2011 14:51:35 +0100
Message-ID: <AANLkTiks7z6oag1GLC=cj9a-mmtYqm-0Z1oCE2zZXT9R@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] linux 2.6.36: upgrade to 2.6.36.2
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
X-List-Received-Date: Wed, 05 Jan 2011 13:52:02 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

2011/1/5 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>:
> Dnia wtorek, 4 stycznia 2011 o 22:12:29 Frans Meulenbroeks napisa=B3(a):
>> Hi,
>>
>> I'm in the process of upgrading the sheevaplug kernel to 2.6.36. I
>> noticed the current version of 2.6.36 is at patch 1 but 2.6.36.2 is
>> already out.
>> Guess this needs some coordination with the other users. Currently the
>> recipe says:
>>
>> DEFAULT_PREFERENCE =3D "-1"
>> DEFAULT_PREFERENCE_mx31ads =3D "1"
>> DEFAULT_PREFERENCE_ts72xx =3D "1"
>>
>> Seems Petr, Eric and Robert are involved in these two machines.
>> Care to comment on moving to 2.6.36.2 (or give it a stab)?
>
> Long time ago (July 2009) I had similar RFC. In October 2009 I did mass u=
pdate
> for all versions.
>
> I think that stable kernel updates should be applied without asking - but=
 if
> there are some patches for some machines in recipe then it needs to be ch=
ecked
> does it patch/build before pushing update.

There are. Both systems mentioned above have patches.
I've no idea if they will remain to apply after moving to .2. Of
course I can verify that, but if they fail I am not too sure if I can
fix things.
They are machines that I do not have.

Thinking of it, probably it is better to create a 2.6.36.2 recipe with
DP =3D -1 for all but my board and leave it to the mx31ads and ts72xx
machines to move to that recipe when they see fit.

Frans.


