Received: from emailgateway.hillcrestlabs.com ([12.173.51.132])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Chris.Conroy@hillcrestlabs.com>) id 1NKg00-0005kz-4F
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Dec 2009 23:36:11 +0100
X-AuditID: 0a1e000a-b7b8cae000000d7b-fb-4b280eea26aa
From: Chris Conroy <Chris.Conroy@hillcrestlabs.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B280B09.2010300@soundmetrics.com>
References: <4B280B09.2010300@soundmetrics.com>
Date: Tue, 15 Dec 2009 17:34:12 -0500
Message-Id: <1260916452.4230.5.camel@conroy-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-Brightmail-Tracker: AAAAAA==
X-SA-Exim-Connect-IP: 12.173.51.132
X-SA-Exim-Mail-From: Chris.Conroy@hillcrestlabs.com
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
X-List-Received-Date: Tue, 15 Dec 2009 22:36:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-12-15 at 14:17 -0800, John Faith wrote:
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
> Thanks,
> John

I just happened to be fighting dbus issues (unrelated to OE) for the
past day or so.

DBus has an odd dependency (IMHO) on X11, and it uses X11 to figure out
what the current running dbus session is.

If you run 'dbus-launch --auto-syntax', it should output some export
statements. If you run those in your shell and then run your dbus aware
application, it should be able to connect to that bus.

Though, I have no clue why make menuconfig on the kernel would trigger
anything even close to dbus related, but perhaps the above info is
helpful to you since it took me a while to track it down. It appears
there aren't a ton of people running dbus in a sans-X11 environment...

--Chris 


