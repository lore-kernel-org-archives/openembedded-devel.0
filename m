Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OsfqI-0004N4-B4
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 19:50:55 +0200
Received: by iwn2 with SMTP id 2so4358733iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 10:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=MBqYFvI6r+kAa1iYGx33pwo+OtDpQ0FdElLbM64ZkEA=;
	b=jcfWoliPWbXDS3klYRbfdbBSGiPRqF1Xi0GlyFDX1jdrXMWNFBRCf4+2Vfjyj7CaEI
	O1yt1wX07tD81zOfJ2J/adNH3GbPjAXQd/9oA65nKT/dnz/FVw/L3mKymz+XgFUsB0Ug
	/OKdteWrBQD9ahPMt2TVwjzJZD5P3nbbXkEQ8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=f4nKIMT1chs+5bGoMH11tZma1WxRVMRyC8n9IZwcQDTyB8x/duz5VIytUIBUdsUWs5
	ot1Wcm22ajGMq1TpK1SBW+/byFwP3/VjuhZUZ5PSVlQyaw/Fexuyyap2zeUkk+XPN2oL
	P43Om44jKuenRx3gem0cXC6d0Yt+BuXA1vdxA=
MIME-Version: 1.0
Received: by 10.231.153.76 with SMTP id j12mr6566907ibw.66.1283795415748; Mon,
	06 Sep 2010 10:50:15 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 6 Sep 2010 10:50:15 -0700 (PDT)
Date: Mon, 6 Sep 2010 19:50:15 +0200
Message-ID: <AANLkTineLTCDtymfwbaAJXcrz0vB=V4++=HOwEA7wQHU@mail.gmail.com>
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
Subject: libtermcap (was: Re: Asterisk and termcap)
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
X-List-Received-Date: Mon, 06 Sep 2010 17:50:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/6 Arigead <captain.deadly@gmail.com>:
> was trying to build Asterisk for the OpenMoko Free runner and it failed
> on a dependency on termcap so I tried to bitbake termcap first and that
> failed. The termcap compile stage is working but it's when it tries to
> install that the recipe seems to fail but I'm new to this.
>
> I'm off to read the openembedded documentation again but in the mean
> time if anybody can give me a hit that would be great.

Eric peeked into the termcap problem. I've tested his patch and it
works. He will probably push a patch later today.

The termcap problem from asterisk is not related. It cannot find
libtermcap. This one does not exist any more with ncurses 5.7.

People how should we fix this? I know it has been discussed before,
but I don't recall a solution.
I bumped into this for a different package too. There I fixed things
by adding a patch, but I am not sure if that is really the desired
solution.

Best regards, Frans


