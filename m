Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PHujH-0002NQ-Pj
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Nov 2010 09:48:01 +0100
Received: by iwn42 with SMTP id 42so6599715iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Nov 2010 00:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=dbk5CtThmgRL4eavJ1obxxwqUKjbERYFOvS9BKRj1AA=;
	b=Lae+p05ZiuHeZO9hBk4nSJFZMlgLEZBgtPgNr15ME5VGZVK2bfUIzcVhLWh8grm3fw
	q6TtlRlh5KR7e/2LeUPp6d1L0/P6n0pxYmUutR2uXuECMfiJCwa8mwP+Pw+XvbeBA3WC
	NXvde6KUzNYKZI8L9TUXqRuUkuIHr9OT2bzUw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=f6Pjm/ZLY1065iGsMq3CxMApFmtGdHy8D1+2/sMGhbmoIptdGXnrOZsI6iLfOv2IXF
	kertngwPKR0yYvsusR4XKI+zE8t3xLG5fP0tVvJ19eR8Ae5cZoGEf5q93kJr6qigIn2O
	/+BmGcRweEVXMJx/gEdhWJFeSfJBx4ZjsRrzE=
MIME-Version: 1.0
Received: by 10.231.17.203 with SMTP id t11mr4051962iba.1.1289810817401; Mon,
	15 Nov 2010 00:46:57 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Mon, 15 Nov 2010 00:46:57 -0800 (PST)
In-Reply-To: <ib5q4g$847$1@dough.gmane.org>
References: <4C78D1E1.9080101@mlbassoc.com> <4CB081A4.9010908@mlbassoc.com>
	<20101106141118.GG6691@excalibur.local>
	<ib5q4g$847$1@dough.gmane.org>
Date: Mon, 15 Nov 2010 09:46:57 +0100
Message-ID: <AANLkTine055VfFfvyFhbqbqTVHY97zHxVzT+2QMwQic1@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] TI tools - make EULA unpack work when /opt is writeable
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
X-List-Received-Date: Mon, 15 Nov 2010 08:48:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/7 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 06-11-10 15:11, Stefan Schmidt wrote:
>> Hello.
>>
>> On Sat, 2010-10-09 at 08:52, Gary Thomas wrote:
>>> On 08/28/2010 03:07 AM, Gary Thomas wrote:
>>>> This patch addresses the problem where the TI tools that need
>>>> the EULA unpack into the wrong place if the user has write
>>>> permission in /opt. The current behaviour of expecting the
>>>> unpacker to fall back to the $HOME environment variable should
>>>> not be relied on. The patch changes the unpack step to use
>>>> the --prefix=3D option which will always work.
>>>>
>>>> Version 2:
>>>> * Update patch to be against org.openembedded.dev branch
>>>> * Incorporate full description into patch
>>>
>>> What about this patch? =A0It's been nearly 6 weeks and no discussion
>>> or anything.
>>>
>>> The problem persists in today's tree.
>>
>> Can we have a comment form the TI devs here?
>
> I'm against automatic application of patches.

To me this clearly indicates the current problem with openembedded.

Apparenlty some people do not care on properly maintaining their
recipes, addressing issues and patches raised by the community,
reviewing and commenting on them.
But of course there is always time to grunt and whine and bash if
others with less knowledge try to give attention to those patches.

Especially from a company like TI I had expected a somewhat more
professional attitude wrt patches and improving their recipes.

I guess is that this is one of the areas where we as OE community
loose when compared to yocto.

Frans


