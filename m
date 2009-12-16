Received: from qmta01.westchester.pa.hmc1.comcast.net ([76.96.53.8])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john@soundmetrics.com>) id 1NKiwt-00083l-9v
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Dec 2009 02:45:10 +0100
Received: from omta03.westchester.pa.hmc1.comcast.net ([76.96.53.19])
	by qmta01.westchester.pa.hmc1.comcast.net with comcast
	id Hd9f1d00T0Qry6401di6in; Wed, 16 Dec 2009 01:42:06 +0000
Received: from [192.168.10.133] ([75.147.191.205])
	by omta03.westchester.pa.hmc1.comcast.net with bizsmtp
	id Hdi61d0014SLwm301di6d1; Wed, 16 Dec 2009 01:42:06 +0000
Message-ID: <4B283AE2.7040107@soundmetrics.com>
Date: Tue, 15 Dec 2009 17:41:54 -0800
From: John Faith <john@soundmetrics.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.22) Gecko/20090605 SeaMonkey/1.1.17
	(Ubuntu-1.1.17+nobinonly-0ubuntu1)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <4B280B09.2010300@soundmetrics.com>
	<1260920547.3372.13.camel@localhost.localdomain>
In-Reply-To: <1260920547.3372.13.camel@localhost.localdomain>
X-SA-Exim-Connect-IP: 76.96.53.8
X-SA-Exim-Mail-From: john@soundmetrics.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: dbus error when running menuconfig in konsole
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
X-List-Received-Date: Wed, 16 Dec 2009 01:45:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Peter Gsellmann wrote:
> Am Dienstag, den 15.12.2009, 14:17 -0800 schrieb John Faith:
>   
>> Hello,
>> I just moved my oe development tree from an old gnome setup to a new 
>> kde/kubuntu 9.10 machine.  After doing things like changing sh symlink 
>> from dash to bash, and changing TERMCMD in bitbake.conf to konsole from 
>> gnome-terminal, when I try 'bitbake -c menuconfig virtual/kernel' I get:
>>
>> KUniqueApplication: Cannot find the D-Bus session server:  
>> "/bin/dbus-launch terminated abnormally with the following error: No 
>> protocol specified
>> | Autolaunch error: X11 initialization failed."
>>
>> Doing 'xhost +local:' before bitbake gets me a brief flash of konsole, 
>> and I am able to run menuconfig in a running konsole, but still no 
>> menuconfig in the new konsole window.  As an experiment, I changed the 
>> KONSOLE_TERMCMDRUN in bitbake.conf to '${KONSOLE_TERMCMD} -e vi' and 
>> that runs fine in the new window.
>>
>> Any ideas on how to debug this further?
>>
>>     
> If kubuntu 9.10 uses KDE4, you are out of luck. Konsole in KDE4 is
> horribly broken. There are numerous Bugtracker entries about.
> For example, it doesnt inherit the $PWD from the starting process but
> gets it from the konsole-settings! So the flash you see is the message
> from make: 'no makefile found.  Stop.' ~ and bye.
> The process you start gets not child nor grand-child of the starting
> bitbake-process, but of a central 'konsole'-process
>
> Use xterm instead. Works for me.
>   

Hi Peter,
Yes, this is KDE4, so I'll skip konsole.  xterm seems to work fine.

Thanks!

,
John



