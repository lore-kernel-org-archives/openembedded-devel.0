Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PYjIp-0007RA-4k
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 19:02:11 +0100
Received: by iyj18 with SMTP id 18so11201753iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Dec 2010 10:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=4RcMTlnONy+jMVg6Eyr31nRkD7TOzrlKlA52F6zSd7c=;
	b=X5I5CzLuHmkYWAUjk92pVzXY9cVqJ6pYpVrANBoOaGyQY0Irp+XGwTvpu0Q2uZcn3d
	z27j2dI/73Wpp3yyB3s3OyX1RJ/urTrmE4t99JMBFcATVYKAIWEcfBKjlqPsWTRGUWWt
	+970n2KD+69fpisgYEjjysqSI468/b/X8iajk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=TvaK/N3inivrrQ3sxCkkjssW9Aw1olk4wz0hUmeouiu1oCePL+zceYXAe9J3qaKOYV
	vEHsZ+qePDWhQKxIBbPeFiwajExBVoCXLRA03P9HQ5Dns9KIIKNErSQvR2IySkI8TY2w
	QsASwnEjxVeSr9O6PIcBufzi3WgG60qQRDM6g=
MIME-Version: 1.0
Received: by 10.231.10.76 with SMTP id o12mr1696606ibo.144.1293818511368; Fri,
	31 Dec 2010 10:01:51 -0800 (PST)
Received: by 10.231.38.11 with HTTP; Fri, 31 Dec 2010 10:01:51 -0800 (PST)
In-Reply-To: <AANLkTi=kATNZpvbMESpVEDK9=eCo5Bq-paSKWYNJneH9@mail.gmail.com>
References: <1293810428-31078-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTi=kATNZpvbMESpVEDK9=eCo5Bq-paSKWYNJneH9@mail.gmail.com>
Date: Fri, 31 Dec 2010 19:01:51 +0100
Message-ID: <AANLkTikGxbBHJJLeM52LUe6LUJkMCekmb3r7MkXOvAmp@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] u-boot: added 2010.12 recipe (DEFAULT_PREFERENCE = -1)
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
X-List-Received-Date: Fri, 31 Dec 2010 18:02:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/12/31 Khem Raj <raj.khem@gmail.com>:
> I thought it was preferred for some machine. Whats the use of a DP=-1
> recipe? So you intend to use it.

Yes. a DP=1 for pandaboard is added in the next patch.
I wanted to separate adding the recipe and enabling it for pandaboard
(as I figured the latter might raise some controversy).
I can also imagine other machines can use this (I need to check if it
is good enough for kirkwood based hardware and I need some more
testing for that before I move to this version).
However, I wanted to make this available now, so others can also use it.

BTW we have plenty of recipes with a DP=-1:
grep DEFAULT_PREFERENCE */* | grep -- -1 | wc
    421    1263   23484
guess some of them are enabled for specific hw, but several of them
seem to be quite pointless.
E.g. for cups we have 6 recipes: cups_1.1.23.bb  cups_1.2.12.bb
cups_1.2.7.bb  cups_1.3.8.bb  cups_1.4.3.bb  cups_1.4.4.bb
The last three have DP -1, none is pinned or has a hw specific DP.

Frans


