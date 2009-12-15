Received: from qmta03.westchester.pa.hmc1.comcast.net ([76.96.53.20])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john@soundmetrics.com>) id 1NKfka-0005Rv-UF
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Dec 2009 23:20:16 +0100
Received: from omta02.westchester.pa.hmc1.comcast.net ([76.96.53.7])
	by qmta03.westchester.pa.hmc1.comcast.net with comcast
	id HSQo1d00c09Ku2s01aJShq; Tue, 15 Dec 2009 22:18:26 +0000
Received: from [192.168.10.133] ([75.147.191.205])
	by omta02.westchester.pa.hmc1.comcast.net with bizsmtp
	id HaHv1d0054SLwm302aJSKS; Tue, 15 Dec 2009 22:18:26 +0000
Message-ID: <4B280B09.2010300@soundmetrics.com>
Date: Tue, 15 Dec 2009 14:17:45 -0800
From: John Faith <john@soundmetrics.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.22) Gecko/20090605 SeaMonkey/1.1.17
	(Ubuntu-1.1.17+nobinonly-0ubuntu1)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 76.96.53.20
X-SA-Exim-Mail-From: john@soundmetrics.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: dbus error when running menuconfig in konsole
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
X-List-Received-Date: Tue, 15 Dec 2009 22:20:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,
I just moved my oe development tree from an old gnome setup to a new 
kde/kubuntu 9.10 machine.  After doing things like changing sh symlink 
from dash to bash, and changing TERMCMD in bitbake.conf to konsole from 
gnome-terminal, when I try 'bitbake -c menuconfig virtual/kernel' I get:

KUniqueApplication: Cannot find the D-Bus session server:  
"/bin/dbus-launch terminated abnormally with the following error: No 
protocol specified
| Autolaunch error: X11 initialization failed."

Doing 'xhost +local:' before bitbake gets me a brief flash of konsole, 
and I am able to run menuconfig in a running konsole, but still no 
menuconfig in the new konsole window.  As an experiment, I changed the 
KONSOLE_TERMCMDRUN in bitbake.conf to '${KONSOLE_TERMCMD} -e vi' and 
that runs fine in the new window.

Any ideas on how to debug this further?

Thanks,
John



