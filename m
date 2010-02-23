Received: from smtp-out26.alice.it ([85.33.2.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1NjtVK-0003k1-9J
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 13:04:45 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out26.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 23 Feb 2010 13:00:56 +0100
Received: from FBCMCL01B07.fbc.local ([192.168.171.45]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 23 Feb 2010 13:00:55 +0100
Received: from [192.168.1.116] ([79.54.13.49]) by FBCMCL01B07.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 23 Feb 2010 13:00:55 +0100
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <a1da1e5e1002230103k33369a5j2be39f66400aab8c@mail.gmail.com>
References: <a1da1e5e1002230103k33369a5j2be39f66400aab8c@mail.gmail.com>
Date: Tue, 23 Feb 2010 13:00:51 +0100
Message-Id: <1266926451.3759.12.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 23 Feb 2010 12:00:55.0644 (UTC)
	FILETIME=[DAB239C0:01CAB47F]
X-SA-Exim-Connect-IP: 85.33.2.26
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Linux on Nokia 5800
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
X-List-Received-Date: Tue, 23 Feb 2010 12:04:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2010-02-23 at 01:03 -0800, KaruppuSwamy T wrote:
> I have installed openembedded to get familiar with embedded linux development.
> I have some good experience in building the linux from scratch (lfs)
> and using gentoo for some time.
> 
> To play with real hardware, I have got my wife's Nokia 5800 which
> seems to be a crap for day to day use. So I am dedicating this mobile
> for my embedded linux play.
> 
> Please let me know how to start with it to develop an image for
> Nokia 5800. How to target (customize) the arm build for this device?
> It seems to be Nokia 5800 is based on ARM11 processor. My aim is not
> to run a Mobile app in it, instead a linux distro.
According to the specs I found, it runs symbian
I am not aware of a symbian bootloader like haret(maybe it exists)
So...
If you can't find one you will have to develop a bootloader
Then you need to find the exact cpu/soc model.
If there is a port of the linux kenrel for it,you could use it but you
will need drivers.
Finding the serial port or jtag would help a lot since you won't
necessary see something on the screen at first.
Most of the time that requires disassembling the phone and soldering.
A big issue would also be the lack of documentation,you would need to do
reverse-engineering and so write something like haret which also does
reverse engineering.

All that is too much time consuming,so maybe choose a better model which
already runs some sort of linux kernel.
The time spent on writing drivers and adapting the kernel depends on:
*the recentness of your kernel(you want a recent kernel)
*the fact that you have proprietary drivers or not
*the fact that the kernel is standard or not(I'm thinking about android)
*the completeness of the port

So:
*or use qemuarm target or something like this(there are also some x86
targets)
*or buy some hardware that is supported...
Some devices like the nanonote(I don't know the state of openembedded
support,but runs GNU/Linux) or the sheevaplug(should be well suported)
don't cost a lot,and it will save you a lot of time and frustration.

Denis.






