Received: from [216.182.48.170] (helo=beastbox.kfctristate.com)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <tom@openhardware.net>) id 1HagAc-0004QT-TT
	for openembedded-devel@openembedded.org; Mon, 09 Apr 2007 00:47:39 +0200
Received: (qmail 14150 invoked from network); 8 Apr 2007 22:47:37 -0000
Received: from unknown (HELO ?172.30.107.2?) (172.30.107.2)
	by beastbox.kfctristate.com with SMTP; 8 Apr 2007 22:47:37 -0000
Message-ID: <461970FA.1090703@openhardware.net>
Date: Sun, 08 Apr 2007 18:47:22 -0400
From: Tom Walsh <tom@openhardware.net>
User-Agent: Thunderbird 1.5.0.10 (X11/20070305)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1168683040.20070405173920@gmail.com>
In-Reply-To: <1168683040.20070405173920@gmail.com>
Subject: Re: [RFC] Cleaning up service handling in OE
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
X-List-Received-Date: Sun, 08 Apr 2007 22:47:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
> Hello openembedded-devel,
>
>   By service, I mean /etc/init.d/* scripts, which all follow
> start/stop command convention, etc. They also can autostart on boot or
> not. This is actually the topic of this RFC - to call for discussion
> of guidelines the packages should follow in their wish to install
> their services for autostart on boot.
>
>   A specific case which makes me raise this question is irda-utils
> packages which includes irattach service, which it bothers to install
> for autostart. The result of this is that IrDA is being activated
> unconditionally on boot, eating power, and disallowing other processes
> to control IrDA port on their own. The only reason it doesn't hit many
> users is that service script itself broken and fails to detect IrDA
> port on most of machines.
>
>   I checked that 2 major GUI frameworks, GPE and OPIE, use own means
> to control IrDA nd do not depend on irattach service. So, I'd like to
> proceed with following:
>
> 1. Fix port detection for irattach service so it would apply to most
> PXA devices to start with.
> 2. But leave it out of autostart, leaving this matter to user.
>
>
>   I hope that for this case, proposed steps are unambiguous, but
> again, I'd like to extend scope of this RFC to discuss generic
> guidelines for all services. Another possible usecase: user install
> mysql server. This is reasonably heavy package for embedded system.
> So, should package make it autostart or no?
>
>   I'd guess, this largely depends on the answer to question "How hard
> for end user to control service's autostart setting?". OE uses update-rc.d
> script for this, and arguably, it's not very userfriendly - while
> removal from autostart takes just remove command and service name, for
> adding to autostart, user needs to specify priorities explicitly, and
> that's easy to get that wrong.
>
>   I'm not sure how Debian solves this issue, but RedHat systems has
> chkconfig utils, which, while having confusing name, has nice feature
> of using defaults provided in service script itself, for example:
>
> -- avahi-daemon --
> #! /bin/sh
> #
> # avahi-daemon:       Starts the Avahi Daemon
> #
> # chkconfig: 345 98 02
> []
> ------------------
>
>   Would it be reasonable to add such feature to update-rc.d script?
>
>   
As a heavy Mandriva user, I prefer the chkconfig way of doing things.  
For three reasons:

1. It is a "standard" method of managing init scripts already in use.

2. You can change the order of services quickly without deleting / 
adding symlinks manually.

3. My eyes glazed over when I read the update-rc.d script.

Regards,

TomW




-- 
Tom Walsh - WN3L - Embedded Systems Consultant
http://openhardware.net http://cyberiansoftware.com http://openzipit.org
"Windows? No thanks, I have work to do..."
----------------------------------------------------




