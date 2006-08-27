Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rpurdie@rpsys.net>) id 1GHSUD-0000pD-MA
	for openembedded-devel@openembedded.org; Sun, 27 Aug 2006 23:48:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k7RLkF4q013483
	for <openembedded-devel@openembedded.org>;
	Sun, 27 Aug 2006 22:46:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13397-03 for <openembedded-devel@openembedded.org>;
	Sun, 27 Aug 2006 22:46:13 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k7RLk8uU013473
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 27 Aug 2006 22:46:08 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Sun, 27 Aug 2006 22:46:10 +0100
Message-Id: <1156715171.5536.60.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: What is task-base?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 27 Aug 2006 21:48:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I've been asked to explain exactly what my last commits did. Basically,
I broke us free from being tied to task-bootstrap by creating
MACHINE_TASK_PROVIDER which you can set to the task-bootstrap like
provider of your choice. It defaults to task-bootstrap so nothing
changes in that respect.

I then changed the zaurus machines to use a new alternative called
task-base. Instead of having each machine setting a ton of duplicate
variables, this aims to allow a machine to specify its features and
task-base builds it a customised task-bootstrap like package based on
what the machine needs along with what the distro supports. At present,
task-base supports the Zaurus 2.6 models but adding support for other
machines should be straightforward.

To illustrate, the distro.conf file can say:

DISTO_FEATURES = "nfs smbfs ipsec wifi ppp alsa bluetooth ext2 irda
pcmcia usbgadget usbhost"

and the machine.conf:

MACHINE_FEATURES = "kernel26 apm alsa pcmcia bluetooth irda usbgadget"

and the resulting task-base would support say pcmcia but not usbhost.
task-base details exactly which options are either machine or distro
settings (or need to be in both). Machine options are meant to reflect
capabilities of the machine, distro options, things distribution
maintainers might want to add or remove from their distros images.
Hopefully this will let people create customised versions of
"task-bootstrap" without impacting other OE users/distros.

As one extreme, if you want to create an extremely minimal image, you
could set DISTRO_FEATURES = "" and you'd stop a lot of packages making
it into the image.

Its not perfect yet but we needed to set the ball rolling somehow :)

Cheers,

Richard





