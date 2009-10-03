Received: from [74.125.92.149] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MuBSO-000170-9K
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Oct 2009 22:43:59 +0200
Received: by qw-out-1920.google.com with SMTP id 4so708977qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Oct 2009 13:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=LUEGnTyGKLIfQ07r6CmgGN+/LOa9WxNgaHngsfQqC/Q=;
	b=ghfH6UJZKBVe7SEFp/IArT7JZyqwtsYVW6mRUp9MCl8Bn2wXIgsseRIqxqH79UCLyr
	ERPth3e4XFE1uFRKLzcSr9rh0bdrcdxqsQCjjF7slYdSCjV92GsSvjC7FjfhLXpd/WG+
	jxoaIGbv7LpYPlmbINnNtg6DMuraz0PxBsPTg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=OLw+/ZPMjLDOUk/lI+AMW0g8iajhUbVbpnDkl/PxzCzq/w02LsEiepgfjoAosk3u5F
	KYcnbgrT5L5gQXjEo6JiySB7B52SUpmptqPqPEUcGvVJ/bQDxP0je/YL5lliJargr4gm
	Wikdsj58qOB/aTpq43h8tXilaT//y+B5R3eKw=
MIME-Version: 1.0
Received: by 10.229.33.70 with SMTP id g6mr3496552qcd.75.1254602591396; Sat, 
	03 Oct 2009 13:43:11 -0700 (PDT)
In-Reply-To: <1254472179.9214.47.camel@lenovo.internal.reciva.com>
References: <1254452313.25385.2.camel@ed-hp-laptop>
	<1254472179.9214.47.camel@lenovo.internal.reciva.com>
Date: Sat, 3 Oct 2009 13:43:11 -0700
Message-ID: <19c1b8a90910031343u745a6b97s1e3272c2aea06169@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.149
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Message - %n in writable segment detected
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
X-List-Received-Date: Sat, 03 Oct 2009 20:43:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2009 at 1:29 AM, Phil Blundell <philb@gnu.org> wrote:
> On Thu, 2009-10-01 at 19:58 -0700, ed wrote:
>> I get this message in the log.
>>
>> NOTE: Running task 40 of 2678 (ID:
>> 1757, /home/ed/mini2440/OE/mini2440/recipes/m4/m4-native_1.4.12.bb,
>> do_patch)
>> NOTE: Running task 41 of 2678 (ID:
>> 1758, /home/ed/mini2440/OE/mini2440/recipes/m4/m4-native_1.4.12.bb,
>> do_configure)
>> *** %n in writable segment detected ***
>>
>> Is this something to be concerned about?
>
> Not unduly. =C2=A0It's caused by a bug in one of the test programs that m=
4's
> configure script runs, which is tripping a security check in glibc. =C2=
=A0The
> program in question will be aborted, which could be causing autoconf to
> get the wrong result for one of its tests, so the error isn't entirely
> harmless, but if the resulting m4 seems to be working ok then it is
> probably no cause for serious alarm.

yes for me m4 worked fine and that was my assumption.

>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


