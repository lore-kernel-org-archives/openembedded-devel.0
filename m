Received: from p3plsmtpa01-05.prod.phx3.secureserver.net ([72.167.82.85])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1OpXsa-0007ML-4J
	for openembedded-devel@openembedded.org; Sun, 29 Aug 2010 04:44:21 +0200
Received: (qmail 31552 invoked from network); 29 Aug 2010 02:37:06 -0000
Received: from unknown (209.242.7.179)
	by p3plsmtpa01-05.prod.phx3.secureserver.net (72.167.82.85) with ESMTP;
	29 Aug 2010 02:37:06 -0000
Message-ID: <4C79C7C4.1050304@mwester.net>
Date: Sat, 28 Aug 2010 21:36:52 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 72.167.82.85
X-SA-Exim-Mail-From: mike@mwester.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: ncurses 5.7 doesn't build libtermcap anymore?
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
X-List-Received-Date: Sun, 29 Aug 2010 02:44:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I've been working on some recent problems that popped up in the SlugOS
feeds; one that appeared recently is that asterisk no longer builds;
configure complains about -ltermcap, and investigation shows that
indeed, libtermcap is missing.  It seems that the new ncurses recipe
(5.7) no longer builds it for some reason.  I think the same problem is
the root cause for the failure of js to build as well.

So I guess the first question is if this is intentional or not?  If it
is, then I guess I'll modify the asterisk recipe to remove the
dependency and submit that patch.  Otherwise, well, I guess I could
attempt to debug and fix the ncurses recipe, but it looks a bit, um,
"non-trivial" so any advice would be appreciated.

Or should I just pin ncurses to the old 5.4 version that worked?

Thanks,
-Mike


