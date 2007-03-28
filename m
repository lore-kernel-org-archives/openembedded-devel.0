Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HWePz-0007Fs-Ut
	for openembedded-devel@openembedded.org; Wed, 28 Mar 2007 22:06:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2SK6pUn008590
	for <openembedded-devel@openembedded.org>;
	Wed, 28 Mar 2007 21:06:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08165-04 for <openembedded-devel@openembedded.org>;
	Wed, 28 Mar 2007 21:06:48 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2SK6lQB008581
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 28 Mar 2007 21:06:47 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Wed, 28 Mar 2007 21:06:48 +0100
Message-Id: <1175112408.5829.54.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Interactive Task handling
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
X-List-Received-Date: Wed, 28 Mar 2007 20:06:55 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

A while back I made a proposal for interactive task handling in future
incarnations of bitbake. The problem was basically that with
multithreading, having one task owning and having access to the terminal
becomes problematic. My proposal was to lever the power of X and/or
utils like screen.

There are currently two areas where interactive tasks are used in OE:

1. The "user" patch resolver
2. The devshell task

As mentioned previously, interactive tasks are always going to be
"extras" to bitbake to aid development and unattended builds of OE will
continue to be possible.

I've made a patch which shows roughly what I'm proposing and converts
the above two users:

http://www.rpsys.net/openzaurus/temp/oe-terminal-r3.patch
(the patch is against poky but the same principles apply for OE.dev)

The user sets TERMCMD and TERMCMDRUN to their custom command or one of
the provided standard ones in their local.conf. There are examples there
which work with screen, gnome-terminal, kconsole and xterm.

devshell simply fires up whatever is in the TERMCMD variable.  The patch
resolver is more complex since we need to show the output of the failed
patch so TERMCMDRUN is similar but allows you to specify an rcfile
containing commands to run in the terminal first.

The big advantage of this is that it scales to the case where client
(UI) and server are separate machines, all that is needed is a valid
setting for the DISPLAY variable. No invention of protocols is needed
for the tricky piping I/O over some transport and any X application will
work (kdiff3 for patch resolution springs to mind).

The disadvantage is that it will cause "random" windows to appear which
may cause issues with UI integration. I suspect longer term, we can
write a simple external program to handle this and connect to the UI at
least for the terminals case so I'm not unduly concerned.

I'm also aware the screen command triggers a new screen session rather
than joining an existing one. I couldn't find a way to make the screen
command block on command completion without doing that. Any pointers
from screen gurus welcome :)

The above patch makes interactive tasks with bitbake 1.8.x and trunk
usable again so I plan to check something like this patch in unless
anyone objects or can see a better way to handle things.

Cheers,

Richard





