Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OF5SA-0003c7-RE
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 May 2010 15:06:23 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id CB33216603B5; Thu, 20 May 2010 07:02:18 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 2954B166038B;
	Thu, 20 May 2010 07:02:18 -0600 (MDT)
Message-ID: <4BF532DA.4080601@mlbassoc.com>
Date: Thu, 20 May 2010 07:02:18 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100330 Fedora/3.0.4-1.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Why is OE so slow?
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
X-List-Received-Date: Thu, 20 May 2010 13:06:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm using OpenEmbedded to build Angstrom.  Recent trees
in the org.openembedded.dev branch have some 8370 recipes.
When I initiate a build, it takes *forever* just to get started.

I have [reasonably] powerful build machines (4 way 3GHz Zeon) and
it takes over 10 minutes CPU time just to reach 'Preparing runqueue'.
It then takes an additional 10 minutes before it starts to
execute the run queue.  Of course, I have the Psyco JIT installed.

* What takes so long?  Obviously, there are some processes in
   these steps which are non-linear.  I also build Poky which
   has about 10% of the recipes (~850) and these steps are *much*
   more than 10 times as fast.  In fact, building Poky, the first
   task in the run queue is usually started within 30 seconds...

   Also, the "cache" (whatever it holds) does not affect these times
   very much.  The times above are for a first run (rebuild the cache).
   If the cache does not have to be rebuilt, the first phase only takes
   5.5 minutes (still very long), while the second phase (preparing
   the run queue) still takes 10+ minutes (maybe longer now that it
   has to consider partial results from the working build tree)

* Is there any way to tune/improve this?  Is there something I've
   missed?  Why don't the online builders, e.g. narcissus, suffer
   such delays?

I'd really like to use OE more, but having to wait 25 minutes
just to get it going is [at least] off-putting.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


