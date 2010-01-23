Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1NYmKl-0002Fc-Ac
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 21:11:54 +0100
Received: from [192.168.0.100] (ip-81-210-243-67.unitymediagroup.de
	[81.210.243.67])
	by drlauer-research.com (Postfix) with ESMTP id 150F55841A9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 22:01:41 +0100 (CET)
Message-Id: <4FB2ADE2-A098-464D-9022-E1844CDDB2DF@vanille-media.de>
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <4B5B51BD.3020006@slashdev.ca>
X-Mailer: iPhone Mail (7D11)
Mime-Version: 1.0 (iPhone Mail 7D11)
Date: Sat, 23 Jan 2010 21:09:43 +0100
References: <4B5B51BD.3020006@slashdev.ca>
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: python-lang causing Alignment trap and Segfault
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
X-List-Received-Date: Sat, 23 Jan 2010 20:11:54 -0000
Content-Type: text/plain;
	charset=us-ascii;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: 7bit

Try running python -v to find out exactly which module is triggering  
that.

Cheers,

:M:

Am 23.01.2010 um 20:45 schrieb Josh Kropf <josh@slashdev.ca>:

> I've compiled an image for my mini2440 board (armv4t) from the  
> stable/2009 branch in git using angstrom distribution.
>
> One of the python packages I need depends on python-lang but I'm  
> finding that python segfaults when python-lang is installed.  The  
> kernel logs the following before the segfault:
>
> Alignment trap: python (2303) PC=0x403f007c Instr=0x28001c05  
> Address=0xffffffff FSR 0x813
>
> Removing python-lang package makes python work again.
>
> Just wondering if anyone has run into this problem or has some  
> pointers on debugging this.
>
> Thanks,
> - Josh
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


