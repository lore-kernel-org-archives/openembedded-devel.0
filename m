Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <freyther@gmx.net>) id 1Gsmzu-0006Ns-QT
	for openembedded-devel@openembedded.org; Fri, 08 Dec 2006 22:11:10 +0100
Received: (qmail invoked by alias); 08 Dec 2006 21:09:58 -0000
Received: from 88-134-98-23-dynip.superkabel.de (EHLO [192.168.1.100])
	[88.134.98.23]
	by mail.gmx.net (mp033) with SMTP; 08 Dec 2006 22:09:58 +0100
X-Authenticated: #1949623
In-Reply-To: <1165536521.5601.146.camel@localhost.localdomain>
References: <1165536521.5601.146.camel@localhost.localdomain>
Mime-Version: 1.0 (Apple Message framework v752.3)
Message-Id: <86661F3E-02CA-43CC-BC8E-707668C5A73D@gmx.net>
From: Holger Freyther <freyther@gmx.net>
Date: Fri, 8 Dec 2006 22:06:59 +0100
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
X-Y-GMX-Trusted: 0
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: RFC: Bitbake and UIs
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
X-List-Received-Date: Fri, 08 Dec 2006 21:11:10 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 08.12.2006 um 01:08 schrieb Richard Purdie:

> Hi,
>
> After the threading changes, the current bitbake "UI" of lack thereof
> has become a major issue to the extent I don't want to release bitbake
> in its current state. We therefore finally need to step back and
> consider what to do with all the messages it generates. I've made some
> changes to message handling in trunk and whilst they've helped
> standardise certain things, we need to do more. I have some ideas to
> address this (and some other random thoughts as well):
>
> 1. Turn cooker into a class/module of its own. I did this last  
> night ;-)
>
> 2. Have bin/bitbake error if its version is not equal to the lib/bb
> version. This should stop people who've installed old versions from
> having issues.

hmm, do people still hit this? I thought I have prepended everything  
to the python path.
How do you define that core and bin/bitbake are compatible? If the  
version numbers just match?
I will blow up released badly as I will only upgrade one version and  
not both :)


>
> 3. Expand event.py to handle more events. Also expand the data these
> events contain. For example, at the moment handler code in  
> base.bbclass
> generates the actual strings describing an event - I'd like to see  
> some
> of that in bitbake itself.
>
> The idea here is that the UI can listen for events and display them to
> the user. In theory we could support multiple UIs and attach/detach  
> UIs
> at will. Add some kind of IPC to transport the event data and you have
> remote interfaces.
>
> This means flooding the event channels with the likes of bb.msg.debug
> data. The default tty UI can collapse these events back into a  
> stream of
> test to stdout.
>
> An example of a new event would be parsing status - an event might get
> sent out every percentage complete, its up to the UI what to display.

ack

>
> 4. Rewrite (remove) the TmpHandler(e) code as it makes me feel ill  
> (and
> has a hidden embedded tab that will bite us one day). If you agree to
> use a global method scope for handlers, we could do something  
> similar to
> the anonymous handlers? any ideas/gotchas here zecke?
>

Hmm we had some disagreement on this on IRC today. We will write down
our thoughts and try to find a solution. In worst case you are  
invited to a death
match at FOSDEM :)

Basicly my questions are:
	-Do we want to continue to have handlers per BitBake file or a list  
of to be used event handlers
	-Do we want persistance. Currently there is no way to store  
information across two events.
	  Both tinderclient.bbclass and icecc.bbclass could benefit from  
this one
	-Do we want return values for events. In this case an event handler  
could do decisions as well



> 5. To facilitate some of the above, introduce a HANDLER_TRANSITION
> variable so we can alter the handler code in OE.dev to support the new
> bitbake whilst maintaining backwards compatibility with bitbake 1.6.
>
> 6. Add a ConfigParsed style event which runs after the basic
> configuration has been parsed. The idea is to use it for the
> sanity.bbclass checks instead of running them once per build.

sure. Adding Events and firing them is 'cheap'.


>
> 7. Add some kind of UI helper module which listens to events as  
> ahandler
> and records certain data. The UIs can use the helper to query and
> display things to the user. It would record which tasks were run where
> to find the logs configure for task X for example. This would be to  
> try
> and factor out common code from the UIs. UIs will also handle some
> events directly themselves for example to display them in status
> windows.
>
> 8. Add a commands.py module which would consist of bits of cooker and
> shell. This would form the other half of the IPC, taking commands from
> the UI.
>
> Other issues:
>
> We also need to consider where the initial configuration will come  
> from
> and how/where it gets stored. At the moment its generated by bin/ 
> bitbake
> but should we modularise that too?

yes but not now?


h.


