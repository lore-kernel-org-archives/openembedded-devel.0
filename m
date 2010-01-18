Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NWzoK-0001cw-Mj
	for openembedded-devel@openembedded.org; Mon, 18 Jan 2010 23:11:03 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	o0IM4T3X016947; Mon, 18 Jan 2010 22:04:29 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7oswUrd2g31c; Mon, 18 Jan 2010 22:04:29 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	o0IM4MMH016932
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Mon, 18 Jan 2010 22:04:24 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev <bitbake-dev@lists.berlios.de>
Date: Mon, 18 Jan 2010 22:09:00 +0000
Message-Id: <1263852540.26227.133.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: bitbake 'events' - How to fix the current problems?
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
X-List-Received-Date: Mon, 18 Jan 2010 22:11:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I've been looking at ways of trying to handle events sanely within
bitbake. There are several problems, some of which I've heard others
talk about:

1. The getName() function call 

This just looks horrid, we can come up with better semantics.

2. Text string comparisons in the event handlers (name.startswith('x'))

I don't really object to this as such, I think having text strings
representing the event makes sense. I did see someone disliking it
though. Now is an opportunity to point me at a better way of doing this,
I can't find one.

3. Inclusion of the data dictionary within every event

This messes up the bitbake client/server code no end since if you want
to pickle or otherwise transport the event via IPC, it has the whole
data dictionary in it. We need the event objects to be marshallable
ideally.

4. The pointless return values

These should just die, they're useless.


As always, its pointless to complain about something without a plan to
fix it. I therefore propose we add a new style of event handlers which
take a new form of event. These event handlers are functions called with
three parameters - an event name as a text string, event data and the
data dict separately. There is no return value.

The events themselves would be made marshallable.

Any objections or better suggestions?

Also, anything else we need to fix about the events whilst we're
changing things?

Cheers,

Richard






