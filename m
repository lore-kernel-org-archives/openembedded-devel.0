Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P4d2R-0007MF-HJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 19:16:53 +0200
Received: by iwn7 with SMTP id 7so931502iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 10:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=QblFDLmuAUbuSN1SzpiIG53FH649ztLhpoebpCvGi4I=;
	b=BhfiIQIh8WdjbTozZI4uQ2haiILXFlm+rEiuBZxuAxyms9arhI21vitDwsc8ULFsd8
	lACAfPf815M3aPA5nUBjstW6L2Zfsl5p5DyWrm50scvC0GiNKj6NmFaYKg90zro/i2cW
	nXLuT7oZQTIoAHHRzi7+9UWVxsI8cTYtJnms4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=RZmLiuVToahY4auB3pqmSfXkjeF8noodNO2024Skd0zpZCp7ERG18k1hN30QIb9aTC
	XDQCaXa9EyMHV6ww1bXId5DS8WOWqynq825ZD56m/yR6kmv9/I8h/Ov6Qo7Z6ZTWkE2p
	JYJVGJGG0LQu/mvdvZ3QkjwG0Rd1nWrdW+/T0=
MIME-Version: 1.0
Received: by 10.42.12.13 with SMTP id w13mr808543icw.475.1286644586111; Sat,
	09 Oct 2010 10:16:26 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 9 Oct 2010 10:16:26 -0700 (PDT)
In-Reply-To: <4CB07A28.4050200@opensimpad.org>
References: <AANLkTi=iNaP53YAKHeTpv9Wsp1VL4GZPhrJTkYdMfdGp@mail.gmail.com>
	<4CB07A28.4050200@opensimpad.org>
Date: Sat, 9 Oct 2010 19:16:26 +0200
Message-ID: <AANLkTimwEzFVVdzC7vyBDmv2LvcBTVRb5ngN0g0x-Bdo@mail.gmail.com>
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
Subject: Re: inc file discussion
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
X-List-Received-Date: Sat, 09 Oct 2010 17:16:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

Clarifying a few things.

Actually I don't care too much whether DESCRIPTION and other fields
are in the .inc file or in the bb file as long as it is done fairly
consistently.
Now it is not.
And the reason why I prefer the bb file is because not every recipe
has an .inc file, so it is a one stop shop.

I'm not proposing rigid rules. I can see a case for DEPENDS in .inc files.
Then again I actually bumped into this an hour or so after posting this.

pulseaudio can work with and without tcpwrapper, but there was no
choice forced. There was no depends, so if you happen to build
tcpwrapper before it would pick it up (but would not end up in
RDEPENDS or so).
If you did not build pulseaudio before you would not get tcpwrapper.
support/usage in pulseaudio.

One solution is to add tcpwrapper to the DEPENDS of pulseaudio.
However this was in an inc.

This gave me the following dilemma:
1 add in the recipe with _append  or +=
2 add to the inc and test the other version(s)
3 add to the inc and not test the other version(s) and assume things
work properly.
4 not do the patch.
5. remove the old recipe

I expect a lot of people would go for 3, but that *could* introduce a problem.

BTW maybe it is indeed time for BBVERSIONS or whatever it was called.

Frans


