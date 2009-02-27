Received: from [85.13.140.93] (helo=dd20204.kasserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Bernhard.Guillon@opensimpad.org>) id 1Ld4Ev-00008o-9O
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Feb 2009 16:03:01 +0100
Received: from [192.168.1.102] (77-21-130-108-dynip.superkabel.de
	[77.21.130.108])
	by dd20204.kasserver.com (Postfix) with ESMTP id EFC37180F5DF3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2009 15:59:35 +0100 (CET)
Message-ID: <49A7FFD4.5090202@opensimpad.org>
Date: Fri, 27 Feb 2009 15:59:32 +0100
From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: How to use libsdl-qpe for opie?
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
X-List-Received-Date: Fri, 27 Feb 2009 15:03:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi everybody,
I am currently trying to support libsdl for opie.
If I set PREFERRED_PROVIDER_virtual/libsdl ?= "libsdl-qpe" in my 
local.conf I am able to build sdl games and play them on qemuarm.

The info I got so far from IRC was that it has to be set by distribution 
or in local.conf.

I tested using games linked against libsdl-x11 with libsdl-qpe and this 
did not work.

Options now:

Set PREFERRED_PROVIDER_virtual/libsdl ?= "libsdl-qpe" 
This is a no go because a new distribution has to be build.

Enable qtopia video in libsdl-x11
Would be an option but it woud be a lot of work to get it working.

Set up a feed for packages linked against libsdl-qpe
Possible but I don't know if this is smart?

Any help is appreciated :)

Best regards
Bernhard Guillon


