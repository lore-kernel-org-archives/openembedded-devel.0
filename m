Received: from mail-yw0-f176.google.com ([209.85.211.176])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ng0Mk-0002Uz-Pe
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 19:35:49 +0100
Received: by ywh6 with SMTP id 6so2426308ywh.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2010 10:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=kSXY72Je18f/MKUDzSCDnzV9jzqh+Y/1RkvYzaLNszA=;
	b=eOJ7A63Yv9Q2Li2Ex9o1uWYiF5AChlbttOUXy0OzBmdEzDyMoEjVpoGCZZDMDrFBFN
	a0gIhZJvAO+46UeLCtMIvCulgULkSF/nOsMDtyYb/IfDiDLHdPvlA8PqBqf3nBHc1n+u
	oleFezCqhISZag5+Xl2vjc4m1+BjYGPJJJGMA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Lyd8x8rhAcR7iIkWh+P7afVPzmpAk+MKr43hhOrdkWDqilfKOoFWBxWkjlrrl/AxmF
	2zeNfnZOgzCEoG1nrDxHbu5gtwHSMUm/v5iIXtT2DnGat44kAWqYHDrHvGBbfzcjHe67
	+W0eKlOpqV18e/iX964PqE9TCcbQajsmgdZy0=
MIME-Version: 1.0
Received: by 10.101.211.37 with SMTP id n37mr2575582anq.82.1265999590296; Fri, 
	12 Feb 2010 10:33:10 -0800 (PST)
In-Reply-To: <20100212085414.GG1638@il.fontys.nl>
References: <20100203104829.GL17820@il.fontys.nl>
	<1265195232.5591.75.camel@mattotaupa>
	<20100203111649.GN17820@il.fontys.nl>
	<20100210072033.GF1638@il.fontys.nl>
	<ac9c93b11002092333s3a90d623xd6234e392d84925d@mail.gmail.com>
	<20100212085414.GG1638@il.fontys.nl>
Date: Fri, 12 Feb 2010 19:33:10 +0100
Message-ID: <ac9c93b11002121033s6b25910fj87fbe29373cf6870@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.176
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: New machine: Embedded Artists LPC3250
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
X-List-Received-Date: Fri, 12 Feb 2010 18:35:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/2/12 Ruud Althuizen <ruud@il.fontys.nl>:
> On Wed 10 Feb 2010 08:33 AM, Frans Meulenbroeks wrote:
>> 2010/2/10 Ruud Althuizen <ruud@il.fontys.nl>:
>> > On Wed 03 Feb 2010 12:16 PM, Ruud Althuizen wrote:
>> >> On Wed 03 Feb 2010 12:07 PM, Paul Menzel wrote:
>> >> > Am Mittwoch, den 03.02.2010, 11:48 +0100 schrieb Ruud Althuizen:
>> >> > > In the attached patches there is a machine config and kernel recipe for the
>> >> > > LPC3250 based Embedded Artists development board.
>> >> > >
>> >> > > If you have any suggestions for the attached patches, please give them so I
>> >> > > can fix it.
>> >> >
>> >> > Please attach them. ;-)
>> >> Ah, now I remember that mutt discards attachments when forwarding :/.
>> > So, it's been a week now. And not even an reply. Any chance of this getting
>> > into the dev tree?
>>
>> I just skimmed over it.
>> First impression is ok, and as this will not break anything else, I
>> have no problems getting it added.
> I just found out about the patch queue and that my patch is added[1]. The
> problem is though that I attached _patches_. Both patches are useless on
> their own. The new kernel recipe contains all the patches for the board to
> be able to boot.
>
>
> 1: http://patchwork.openembedded.org/patch/1541/
>

Ruud, can you resend your patch.
I wanted to apply it, but you've submitted two patches and the text in
the first one reads:

This is a kernel recipe for the LPC32XX (LPC3250) based Embedded Artists
development board. It uses public patches provided by NXP and Embedded
Artists. The other two patches provide drivers for the PWM capabilities
and fix one NXP patch.

(and there are 4 files in the patch).
In order not to make an error I wanted to verify what exactly need to
be patched.

FM


