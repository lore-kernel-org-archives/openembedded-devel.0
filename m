Received: from mailbackup.inode.at ([213.229.60.24])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <peter-gsellmann@inode.at>) id 1NKhJv-0001hM-P9
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Dec 2009 01:00:51 +0100
Received: from [62.99.145.5] (port=65261 helo=mx.inode.at)
	by mailbackup.inode.at with esmtp (Exim 4.67)
	(envelope-from <peter-gsellmann@inode.at>) id 1NKh2F-0002X6-GV
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Dec 2009 00:42:31 +0100
Received: from [84.119.0.189] (port=12926 helo=onzo.local)
	by smartmx-05.inode.at with esmtp (Exim 4.69)
	(envelope-from <peter-gsellmann@inode.at>) id 1NKh2C-0003rk-KY
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Dec 2009 00:42:28 +0100
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by onzo.local (Postfix) with ESMTP id 21D801B2003F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Dec 2009 00:42:28 +0100 (CET)
From: Peter Gsellmann <peter-gsellmann@inode.at>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B280B09.2010300@soundmetrics.com>
References: <4B280B09.2010300@soundmetrics.com>
Date: Wed, 16 Dec 2009 00:42:27 +0100
Message-Id: <1260920547.3372.13.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.3 (2.12.3-5.fc8) 
X-SA-Exim-Connect-IP: 213.229.60.24
X-SA-Exim-Mail-From: peter-gsellmann@inode.at
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
X-List-Received-Date: Wed, 16 Dec 2009 00:00:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


Am Dienstag, den 15.12.2009, 14:17 -0800 schrieb John Faith:
> Hello,
> I just moved my oe development tree from an old gnome setup to a new 
> kde/kubuntu 9.10 machine.  After doing things like changing sh symlink 
> from dash to bash, and changing TERMCMD in bitbake.conf to konsole from 
> gnome-terminal, when I try 'bitbake -c menuconfig virtual/kernel' I get:
> 
> KUniqueApplication: Cannot find the D-Bus session server:  
> "/bin/dbus-launch terminated abnormally with the following error: No 
> protocol specified
> | Autolaunch error: X11 initialization failed."
> 
> Doing 'xhost +local:' before bitbake gets me a brief flash of konsole, 
> and I am able to run menuconfig in a running konsole, but still no 
> menuconfig in the new konsole window.  As an experiment, I changed the 
> KONSOLE_TERMCMDRUN in bitbake.conf to '${KONSOLE_TERMCMD} -e vi' and 
> that runs fine in the new window.
> 
> Any ideas on how to debug this further?
> 
If kubuntu 9.10 uses KDE4, you are out of luck. Konsole in KDE4 is
horribly broken. There are numerous Bugtracker entries about.
For example, it doesnt inherit the $PWD from the starting process but
gets it from the konsole-settings! So the flash you see is the message
from make: 'no makefile found.  Stop.' ~ and bye.
The process you start gets not child nor grand-child of the starting
bitbake-process, but of a central 'konsole'-process

Use xterm instead. Works for me.



