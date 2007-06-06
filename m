Received: from [64.233.166.183] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1Hw3vf-0008AR-HL
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jun 2007 00:24:39 +0200
Received: by py-out-1112.google.com with SMTP id f47so560457pye
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2007 15:22:09 -0700 (PDT)
Received: by 10.35.94.2 with SMTP id w2mr1701164pyl.1181168529404;
	Wed, 06 Jun 2007 15:22:09 -0700 (PDT)
Received: from cube ( [77.122.190.213])
	by mx.google.com with ESMTP id 37sm3284842nzf.2007.06.06.15.22.08;
	Wed, 06 Jun 2007 15:22:08 -0700 (PDT)
Date: Thu, 7 Jun 2007 01:22:06 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <10210715478.20070607012206@gmail.com>
To: Matthias Hentges <oe@hentges.net>
In-Reply-To: <1181167988.4914.19.camel@localhost.localdomain>
References: <E1HvlNq-0004pN-I1@linuxtogo.org>
	<1709000488.20070606140338@gmail.com>
	<466697F2.6020303@dominion.kabel.utwente.nl>
	<200706061330.37489.openembedded@hrw.one.pl>
	<1181131371.4914.13.camel@localhost.localdomain>
	<1181167988.4914.19.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev usb-gadget-mode: Add usb-gadget mode: An initscript to load the configured USB gadget module on boot
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jun 2007 22:24:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Matthias,

Thursday, June 7, 2007, 1:13:08 AM, you wrote:

> Am Mittwoch, den 06.06.2007, 14:02 +0200 schrieb Matthias Hentges:
>> Am Mittwoch, den 06.06.2007, 13:30 +0200 schrieb Marcin Juszkiewicz:
>> > Dnia sroda, 6 czerwca 2007, Koen Kooi napisal:
>> > > > Hello coredump2,
>> > 
>> > > >> usb-gadget-mode: Add usb-gadget mode: An initscript to load the
>> > > >> configured USB gadget module on boot
>> > 
>> > > What about using o-hands usbinit[1]?
>> > 
>> > I had same idea when saw that commit. OpenedHand usbinit is in use on few 
>> > machines and do that work done properly. But it supports only 2.6 
>> > machines which use g-ether kernel module.
>> 
>> This package was previously unknown to me :\
>> 
>> The idea behind usb-gadget-mode was that - eventually -  the user can
>> select the "mode" via a shiny GUI app and does not need to mess
>> w/ /etc/modutils manually.
>> 
>> If usbinit matches that description I'll happily remove gadget-mode.
>> 
>> With >4600 .bb files one can lose the overview easily, thanks for the
>> headsup ;)

> I've checked the script and found it to be less than stellar. If
> Angstrom indeed wants a hard-wired modprobe of g_ether on every boot
> ( w/o an easy way for 3rd-party apps to change that behavior) then it
> should be implemented properly via /etc/modutils/ or ( when encountering
> timing problems ) via a "pre-up" statement in /etc/network/interfaces as
> demonstrated by a user on one of the angstrom lists.

> Using a dedicated initscript for a simple modprobe is overkill and
> ignores existing OS functions that were designed to do this job.

> Comments? Suggestions?

        ... Please move /etc/usb-gadget.conf to
/etc/default/usb-gadget and continue hacking GPE's USB config applet to
use this infrastructure ;-).


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



