Received: from p3plsmtpa01-02.prod.phx3.secureserver.net ([72.167.82.82])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1Nl2VD-0004AL-3V
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 16:53:20 +0100
Received: (qmail 22740 invoked from network); 26 Feb 2010 15:43:51 -0000
Received: from unknown (209.242.7.187)
	by p3plsmtpa01-02.prod.phx3.secureserver.net (72.167.82.82) with ESMTP;
	26 Feb 2010 15:43:51 -0000
Message-ID: <4B87EC32.6030807@mwester.net>
Date: Fri, 26 Feb 2010 09:43:46 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1266951776.18176.47.camel@trini-m4400>
In-Reply-To: <1266951776.18176.47.camel@trini-m4400>
X-SA-Exim-Connect-IP: 72.167.82.82
X-SA-Exim-Mail-From: mike@mwester.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Fix busybox SUID support
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
X-List-Received-Date: Fri, 26 Feb 2010 15:53:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
> I was about to just push this and I noticed that a number of
> distributions (SlugOS, Angstrom, Kaelios, micro) currently set
> FEATURE_SUID=y, but it's not actually install SUID.  And since I recall
> some way-back-when's of "busybox SUID is dangerous / crap!", I thought
> it best to post the patch first and let folks speak up / ask me to drop
> FEATURE_SUID=y when I do this.  So, here's the patch:

In the case of SlugOS, this was deliberate -- the thinking was that we
would let the user decide if they wanted to run busybox SUID after
installation.  In retrospect, that actually led to more problems than
good, so this change gets an ACK from me (albeit late - sorry for the
delay!)

+1

-Mike


