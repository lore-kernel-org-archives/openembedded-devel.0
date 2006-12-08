Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1GsTJH-0007Mm-GP
	for openembedded-devel@openembedded.org; Fri, 08 Dec 2006 01:09:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kB808hQX015218;
	Fri, 8 Dec 2006 00:08:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15010-06; Fri,  8 Dec 2006 00:08:41 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id kB808cfH015209
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Fri, 8 Dec 2006 00:08:38 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel <openembedded-devel@openembedded.org>
Date: Fri, 08 Dec 2006 00:08:41 +0000
Message-Id: <1165536521.5601.146.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: RFC: Bitbake and UIs
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
X-List-Received-Date: Fri, 08 Dec 2006 00:09:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

After the threading changes, the current bitbake "UI" of lack thereof
has become a major issue to the extent I don't want to release bitbake
in its current state. We therefore finally need to step back and
consider what to do with all the messages it generates. I've made some
changes to message handling in trunk and whilst they've helped
standardise certain things, we need to do more. I have some ideas to
address this (and some other random thoughts as well):

1. Turn cooker into a class/module of its own. I did this last night ;-)

2. Have bin/bitbake error if its version is not equal to the lib/bb
version. This should stop people who've installed old versions from
having issues.

3. Expand event.py to handle more events. Also expand the data these
events contain. For example, at the moment handler code in base.bbclass
generates the actual strings describing an event - I'd like to see some
of that in bitbake itself.

The idea here is that the UI can listen for events and display them to
the user. In theory we could support multiple UIs and attach/detach UIs
at will. Add some kind of IPC to transport the event data and you have
remote interfaces.

This means flooding the event channels with the likes of bb.msg.debug
data. The default tty UI can collapse these events back into a stream of
test to stdout.

An example of a new event would be parsing status - an event might get
sent out every percentage complete, its up to the UI what to display.

4. Rewrite (remove) the TmpHandler(e) code as it makes me feel ill (and
has a hidden embedded tab that will bite us one day). If you agree to
use a global method scope for handlers, we could do something similar to
the anonymous handlers? any ideas/gotchas here zecke?

5. To facilitate some of the above, introduce a HANDLER_TRANSITION
variable so we can alter the handler code in OE.dev to support the new
bitbake whilst maintaining backwards compatibility with bitbake 1.6.

6. Add a ConfigParsed style event which runs after the basic
configuration has been parsed. The idea is to use it for the
sanity.bbclass checks instead of running them once per build.

7. Add some kind of UI helper module which listens to events as ahandler
and records certain data. The UIs can use the helper to query and
display things to the user. It would record which tasks were run where
to find the logs configure for task X for example. This would be to try
and factor out common code from the UIs. UIs will also handle some
events directly themselves for example to display them in status
windows.

8. Add a commands.py module which would consist of bits of cooker and
shell. This would form the other half of the IPC, taking commands from
the UI. 

Other issues:

We also need to consider where the initial configuration will come from
and how/where it gets stored. At the moment its generated by bin/bitbake
but should we modularise that too?

After commands.py is created, what happens to the rest of shell? I guess
it will remain as a UI helper set of functions?

cooker.py needs the statistics section removing and turning into a
proper module. This might be the ui helper I've mentioned above so I've
left it alone for now.

I see a rough directory structure looking like:

lib/bb/commands.py    - handles IPC input
lib/bb/events.py      - handles IPC output in the form of events
lib/bb/ui/notty.py    - dumps data to stdout, no input (current bitbake)
lib/bb/ui/tty.py      - dumps data to stdout, interactive shell (bitbake -i)
lib/bb/ui/ncurses.py  - new and main UI
lib/bb/ui/helper.py   - common UI helper functions. Logs data about 
                        builds for later queries from UI. Not UI specific

Discussion with Mickey suggest the IPC will be xmlrpc based. I know
nothing on the subject (yet) :)

Note all the above are rough ideas off the top of my head. Some might
work, some might adapt, some might not work at all. I've very open to
thoughts/discussion on how else to do this as there are some major
changes here...

I'd also like to thank Mickey for the python curses example code he gave
me which is going to be extremely useful. I'm extremely impressed with
it and I think bitbake will start to look the part when we do this - its
given me some real encouragement and it does look how I imagined!
Personally, I'm going to make you all wait until it works with real
bitbake data before you see it though ;-).

The holdup is trying to feed data to the UI in a sane way. It is going
to need fairly invasive changes to the bitbake core to do this nicely
but I want to take time, do it once and do it right! I suspect if we get
it right, ncurses will quickly be followed by a PyGTK+ and other
interfaces.

Cheers,

Richard




