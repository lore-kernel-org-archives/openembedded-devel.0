Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IZku9-0005X4-Pd
	for openembedded-devel@openembedded.org; Mon, 24 Sep 2007 12:11:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8OA6mjY015189
	for <openembedded-devel@openembedded.org>;
	Mon, 24 Sep 2007 11:06:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15075-03 for <openembedded-devel@openembedded.org>;
	Mon, 24 Sep 2007 11:06:44 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8OA6ggi015183
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 24 Sep 2007 11:06:42 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <8c7950360709231220o100ae1d6i2582e20398b04521@mail.gmail.com>
References: <8c7950360709231220o100ae1d6i2582e20398b04521@mail.gmail.com>
Date: Mon, 24 Sep 2007 11:06:41 +0100
Message-Id: <1190628401.6176.39.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Adding support for DirectFB across the board
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
X-List-Received-Date: Mon, 24 Sep 2007 10:11:06 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2007-09-23 at 15:20 -0400, shanevolpe@gmail.com wrote:
> I have been adding in support for directFB to as many packages as
> possible, however one issue I have ran into several times is what do I
> do when there are packages that can be compiled with X11 or directfb
> support and then what do you do with packages that may depend on a
> package compiled with directfb or X11.  Ok that was pretty confusing,
> let me give an example.
> 
> I have added cairo-directfb which compiles cairo with directfb instead
> of X11.  Next I wanted to add (update) gtk+-directfb to use
> cairo-directfb instead of cairo.  That part was easy I just changed
> the DEPENDS cairo in gtk+-directfb to cairo-directfb..  The issue came
> when I noticed that gtk+ also requires pango which requires cairo so
> what do I do here, do I make a new pango called pango-directfb?  It
> seems like the better thing would be set up a virtual/cairo and set it
> to either cairo or cairo-directfb.  If I go that route how do I set it
> up so it does not break everyone's build that does not have
> virtual/cairo set, is there a way to default it to something like
> cairo?

The thing you need to consider is that pango compiled with a standard
cairo is a different package to pango compiled with cairo-directfb.

The virtual namespace is used to show things that are equivalent and
pango is different to pango-directfb since I couldn't interchange them.

You therefore need to create a pango-directfb, ugly as that may be (.inc
files can minimise the ugliness though).

Cheers,

Richard



